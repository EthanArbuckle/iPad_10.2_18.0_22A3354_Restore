@implementation BRCApplyScheduler

- (BRCApplyScheduler)initWithAccountSession:(id)a3
{
  BRCApplyScheduler *v3;
  BRCCountedSet *v4;
  BRCCountedSet *coordinatedWriters;
  NSMutableSet *v6;
  NSMutableSet *clientZonesWatchingFaults;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BRCApplyScheduler;
  v3 = -[BRCFSSchedulerBase initWithSession:name:tableName:](&v9, sel_initWithSession_name_tableName_, a3, CFSTR("Apply Changes"), CFSTR("client_unapplied_table"));
  if (v3)
  {
    v4 = objc_alloc_init(BRCCountedSet);
    coordinatedWriters = v3->_coordinatedWriters;
    v3->_coordinatedWriters = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clientZonesWatchingFaults = v3->_clientZonesWatchingFaults;
    v3->_clientZonesWatchingFaults = v6;

  }
  return v3;
}

- (id)descriptionForServerItem:(id)a3 context:(id)a4
{
  id v6;
  BRCApplyJobIdentifier *v7;
  void *v8;

  v6 = a4;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(a3, "rank"));
  -[BRCFSSchedulerBase descriptionForJobsMatching:context:](self, "descriptionForJobsMatching:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForRejectedItem:(id)a3 context:(id)a4
{
  id v6;
  BRCApplyJobIdentifier *v7;
  void *v8;

  v6 = a4;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", -objc_msgSend(a3, "dbRowID"));
  -[BRCFSSchedulerBase descriptionForJobsMatching:context:](self, "descriptionForJobsMatching:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSMutableSet *clientZonesWatchingFaults;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[BRCAccountSession clientDB](self->super._session, "clientDB");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v9, "matchingJobsWhereSQLClause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT throttle_state, COUNT(*) FROM client_unapplied_table WHERE %@ AND throttle_id > 0   AND throttle_id IN (SELECT item_rank FROM server_items) GROUP BY throttle_state"), v15);

  if (objc_msgSend(v16, "next"))
  {
    do
    {
      v17 = objc_msgSend(v16, "unsignedIntAtIndex:", 0);
      v18 = objc_msgSend(v16, "unsignedLongAtIndex:", 1);
      +[BRCDumpContext stringFromThrottleState:context:](BRCDumpContext, "stringFromThrottleState:context:", v17, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@:%lld"), v19, v18);

    }
    while ((objc_msgSend(v16, "next") & 1) != 0);
  }
  objc_msgSend(v9, "matchingJobsWhereSQLClause");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM client_unapplied_table WHERE %@ AND throttle_id > 0   AND throttle_id NOT IN (SELECT item_rank FROM server_items)"), v20);

  if (v21)
    objc_msgSend(v8, "appendFormat:", CFSTR(" expired:%@"), v21);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler describeInBuffer:aggregateOfJobsMatching:context:].cold.1();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v9;
  else
    v22 = 0;
  v23 = v22;
  if (objc_msgSend(v23, "isPrivateZone"))
  {
    clientZonesWatchingFaults = self->_clientZonesWatchingFaults;
    objc_msgSend(v23, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "asPrivateClientZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(clientZonesWatchingFaults) = -[NSMutableSet containsObject:](clientZonesWatchingFaults, "containsObject:", v26);

    if ((_DWORD)clientZonesWatchingFaults)
    {
      objc_msgSend(v10, "highlightedString:type:", CFSTR(" has-faulting-barriers"), 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v27);

    }
  }

}

- (void)setState:(int)a3 forServerItem:(id)a4 localItem:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  BRCApplyJobIdentifier *v13;
  void *v14;
  NSObject *v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v11 = v9;
  if (objc_msgSend(v10, "isLive") && objc_msgSend(v11, "isRejected"))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler setState:forServerItem:localItem:].cold.1();

  }
  if (objc_msgSend(v11, "isRejected"))
    v12 = -objc_msgSend(v11, "dbRowID");
  else
    v12 = objc_msgSend(v10, "rank");
  v13 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", v12);

  -[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", v6, v13);
}

- (void)setState:(int)a3 forRank:(int64_t)a4 zoneRowID:(id)a5
{
  uint64_t v5;
  BRCApplyJobIdentifier *v7;

  v5 = *(_QWORD *)&a3;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", a4);
  -[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", v5, v7);

}

- (void)rescheduleItemRank:(int64_t)a3 zoneRowID:(id)a4 matchingState:(int)a5
{
  uint64_t v5;
  BRCApplyJobIdentifier *v7;

  v5 = *(_QWORD *)&a5;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", a3);
  -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:](self, "rescheduleSuspendedJobsMatching:inState:", v7, v5);

}

- (void)_setState:(int)a3 andApplyKind:(unsigned int)a4 forJobID:(id)a5
{
  uint64_t v5;
  BRCAccountSession *session;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  int v14;
  int v15;

  if (a5)
  {
    v5 = *(_QWORD *)&a4;
    session = self->super._session;
    v9 = a5;
    -[BRCAccountSession clientDB](session, "clientDB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__BRCApplyScheduler__setState_andApplyKind_forJobID___block_invoke;
    v13[3] = &unk_1E87606C0;
    v13[4] = self;
    v14 = a3;
    v15 = v5;
    v11 = (void *)MEMORY[0x1D17A6DB0](v13);
    objc_msgSend(v9, "matchingJobsWhereSQLClause");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "execute:", CFSTR("UPDATE client_unapplied_table   SET throttle_state = call_block(%@, next_retry_stamp, apply_kind), apply_kind = %u WHERE %@"), v11, v5, v12);
    if (a3 <= 0)
      -[BRCFSSchedulerBase checkIfHasWork](self, "checkIfHasWork");
  }
}

void __53__BRCApplyScheduler__setState_andApplyKind_forJobID___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v7;
  BOOL v8;

  v7 = sqlite3_value_int(a4[1]);
  if (*(_DWORD *)(a1 + 40) == 1)
    objc_msgSend(*(id *)(a1 + 32), "signalWithDeadline:", sqlite3_value_int64(*a4));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
    v8 = v7 == 1;
  else
    v8 = 0;
  if (v8 && (*(_DWORD *)(a1 + 44) != 1 || *(_DWORD *)(a1 + 40) != 1))
    objc_msgSend(*(id *)(a1 + 32), "signal");
  sqlite3_result_int(a2, *(_DWORD *)(a1 + 40));
}

- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forServerItem:(id)a5 localItem:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  BRCApplyJobIdentifier *v15;
  void *v16;
  NSObject *v17;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v12 = v10;
  v13 = v11;
  if (objc_msgSend(v12, "isLive") && objc_msgSend(v13, "isRejected"))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler setState:forServerItem:localItem:].cold.1();

  }
  if (objc_msgSend(v13, "isRejected"))
    v14 = -objc_msgSend(v13, "dbRowID");
  else
    v14 = objc_msgSend(v12, "rank");
  v15 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", v14);

  -[BRCApplyScheduler _setState:andApplyKind:forJobID:](self, "_setState:andApplyKind:forJobID:", v8, v7, v15);
}

- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forRank:(int64_t)a5 zoneRowID:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  BRCApplyJobIdentifier *v9;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", a5);
  -[BRCApplyScheduler _setState:andApplyKind:forJobID:](self, "_setState:andApplyKind:forJobID:", v7, v6, v9);

}

- (void)resetBackoffForServerItem:(id)a3
{
  BRCApplyJobIdentifier *v4;
  objc_super v5;

  v4 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(a3, "rank"));
  v5.receiver = self;
  v5.super_class = (Class)BRCApplyScheduler;
  -[BRCFSSchedulerBase resetBackoffForJobWithID:](&v5, sel_resetBackoffForJobWithID_, v4);

}

- (void)createApplyJobFromServerItem:(id)a3 localItem:(id)a4 state:(int)a5 kind:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BRCApplyJobIdentifier *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  BRCApplyScheduler *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  BRCApplyScheduler *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  if (!(v10 | v11))
  {
    v39 = self;
    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler createApplyJobFromServerItem:localItem:state:kind:].cold.2();

    self = v39;
  }
  objc_msgSend((id)v10, "serverZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend((id)v11, "serverZone");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v15, "metadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)v10;
  v18 = (id)v11;
  if (objc_msgSend(v17, "isLive") && objc_msgSend(v18, "isRejected"))
  {
    v42 = v18;
    brc_bread_crumbs();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler setState:forServerItem:localItem:].cold.1();

    v18 = v42;
  }
  v19 = v15;
  v20 = v7;
  v21 = v18;
  if (objc_msgSend(v18, "isRejected"))
    v22 = -objc_msgSend(v18, "dbRowID");
  else
    v22 = objc_msgSend(v17, "rank");
  v23 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", v22);
  v45 = v21;

  v47 = v17;
  v46 = v16;
  objc_msgSend(v16, "applyThrottle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "apply_kind, zone_rowid", 22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0DE81D0];
  objc_msgSend(v19, "dbRowID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "formatInjection:", CFSTR("%u, %@"), v6, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0DE81D0];
  v48 = v19;
  objc_msgSend(v19, "dbRowID");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v6;
  v32 = (void *)v30;
  objc_msgSend(v29, "formatInjection:", CFSTR("apply_kind = %u, zone_rowid = %@"), v31, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](self, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v23, v24, v20, v25, v28, v33, 0);
  v35 = self;
  v36 = v34;
  v38 = v37;

  if (v36 == 1)
    -[BRCFSSchedulerBase signalWithDeadline:](v35, "signalWithDeadline:", v38);

}

- (void)didCreateMissingParentID:(id)a3 zone:(id)a4
{
  id v6;
  BRCAccountSession *session;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  session = self->super._session;
  v8 = a4;
  -[BRCAccountSession clientDB](session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BRCApplyScheduler didCreateMissingParentID:zone:].cold.1();

  objc_msgSend(v8, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "execute:", CFSTR("UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state IN (21, 16)    AND throttle_id IN (SELECT item_rank FROM server_items                        WHERE zone_rowid = %@ AND item_parent_id = %@)"), v12, v13, v6);
  v14 = objc_msgSend(v9, "changes");
  if (objc_msgSend(v6, "isDocumentsFolder"))
  {
    objc_msgSend(v9, "execute:", CFSTR("UPDATE client_unapplied_table    SET throttle_state = 1  WHERE throttle_state IN (21, 16)    AND throttle_id IN (SELECT item_rank FROM server_items WHERE (item_sharing_options & 4) != 0 AND item_id_is_shared_root(item_parent_id))"));
    v14 += objc_msgSend(v9, "changes");
  }
  if (v14)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: retrying %lld suspended throttles (missing parent found: %@)%@", buf, 0x20u);
    }

    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (void)didReparentOrKillItemID:(id)a3 parentItemID:(id)a4 zone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "execute:", CFSTR("WITH RECURSIVE  reschedulable_items (item_rank, item_id) AS(   SELECT si.item_rank, si.item_id      FROM server_items AS si     WHERE si.zone_rowid = %@       AND si.item_type IN (0, 9, 10, 4) AND NOT EXISTS (SELECT 1 FROM client_items AS ci         WHERE ci.item_parent_zone_rowid = %@ AND ci.item_parent_id = si.item_id           AND ci.item_state IN (0, -1)   ) ) UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = 25    AND throttle_id IN (SELECT item_rank FROM reschedulable_items WHERE item_id = %@)"), v12, v13, v14, v9);

  v15 = objc_msgSend(v11, "changes");
  if (v15)
  {
    v16 = v15;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v26 = v16;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v17;
      v19 = "[DEBUG] Apply Changes: retrying %lld suspended throttles (child %@ of %@ killed or reparented)%@";
LABEL_9:
      _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0x2Au);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  objc_msgSend(v10, "dbRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "execute:", CFSTR("WITH RECURSIVE  reschedulable_items (throttle_id, item_id) AS(   SELECT -pi.rowid, pi.item_id      FROM client_items AS pi     WHERE pi.zone_rowid = %@       AND pi.item_type IN (0, 9, 10, 4) AND NOT EXISTS (SELECT 1 FROM client_items AS ci         WHERE ci.item_parent_zone_rowid = %@ AND ci.item_parent_id = pi.item_id           AND ci.item_state IN (0, -1)   ) ) UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = 25    AND throttle_id IN (SELECT throttle_id FROM reschedulable_items WHERE item_id = %@)"), v20, v21, v22, v9);

  v23 = objc_msgSend(v11, "changes");
  if (v23)
  {
    v24 = v23;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v26 = v24;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v17;
      v19 = "[DEBUG] Apply Changes: retrying %lld suspended rejected throttles (child %@ of %@ killed or reparented)%@";
      goto LABEL_9;
    }
LABEL_6:

    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (void)didCompleteCrossZoneMigrationForAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession cloudDocsClientZone](self->super._session, "cloudDocsClientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rootItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = %u    AND throttle_id IN (SELECT item_rank FROM server_items                        WHERE zone_rowid = %@ AND item_parent_id = %@)"), v7, 27, v7, v8);
  v9 = objc_msgSend(v5, "changes");
  if (v9)
  {
    v10 = v9;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "logName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v15 = v10;
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: retrying %lld suspended throttles (appLibrary completed migration: %@)%@", buf, 0x20u);

    }
    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (void)_rescheduleRank:(int64_t)a3 inState:(int)a4 forZone:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v5 <= 1)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler _rescheduleRank:inState:forZone:].cold.2();

  }
  objc_msgSend(v8, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "execute:", CFSTR("UPDATE client_unapplied_table SET throttle_state = 1 WHERE throttle_state = %u AND zone_rowid = %@ AND throttle_id = %llu"), v5, v10, a3);

  if (objc_msgSend(v9, "changes"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler _rescheduleRank:inState:forZone:].cold.1();

    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (void)didMarkSyncIdleForServerRank:(int64_t)a3 zone:(id)a4
{
  -[BRCApplyScheduler _rescheduleRank:inState:forZone:](self, "_rescheduleRank:inState:forZone:", a3, 22, a4);
}

- (void)_fixupCZMAliasTargetWithAlias:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BRCRelativePath *v12;
  void *v13;
  BRCRelativePath *v14;
  void *v15;
  BRCItemToPathLookup *v16;
  BRCBookmark *v17;
  BOOL v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Target zone was moved to clouddocs.  Fixing up alias %@ pointing to %@%@", buf, 0x20u);
  }

  objc_msgSend(v6, "learnTarget:", v7);
  objc_msgSend(v6, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v11;
  if (v11)
  {
    v12 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", objc_msgSend(v11, "longLongValue"), self->super._session);
    if (-[BRCRelativePath resolveMustExist:error:](v12, "resolveMustExist:error:", 1, 0))
    {
      if (v12)
      {
        -[BRCRelativePath appLibrary](v12, "appLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", -[BRCRelativePath parentFileID](v12, "parentFileID"), self->super._session);

        objc_msgSend(0, "resolveAndKeepOpenMustExist:error:", 1, 0);
        v15 = 0;
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  v16 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v6);
  -[BRCItemToPathLookup parentPath](v16, "parentPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resolveAndKeepOpenMustExist:error:", 1, 0);
  objc_msgSend(v15, "appLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemToPathLookup closePaths](v16, "closePaths");

  v14 = 0;
LABEL_9:
  v17 = -[BRCBookmark initWithTarget:owningAppLibrary:path:session:]([BRCBookmark alloc], "initWithTarget:owningAppLibrary:path:session:", v7, v13, 0, self->super._session);
  v28 = 0;
  v18 = -[BRCBookmark resolveWithError:](v17, "resolveWithError:", &v28);
  v19 = v28;
  if (v18)
  {
    if (v14)
      -[BRCRelativePath filename](v14, "filename");
    else
      +[BRCBookmark createName](BRCBookmark, "createName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    -[BRCBookmark writeUnderParent:name:error:](v17, "writeUnderParent:name:error:", v15, v22, &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v27;

    if (v20)
    {
      objc_msgSend(v6, "updateFromFSAtPath:", v20);
      objc_msgSend(v6, "markNeedsUploadOrSyncingUpWithAliasTarget:", v7);
      objc_msgSend(v6, "saveToDB");
    }
    else
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        -[BRCApplyScheduler _fixupCZMAliasTargetWithAlias:target:].cold.1();

    }
    v19 = v23;
  }
  else
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      -[BRCApplyScheduler _fixupCZMAliasTargetWithAlias:target:].cold.2();

  }
  objc_msgSend(v15, "close");

}

- (void)rescheduleMissingTargetAliasesWithTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) == 0)
  {
    objc_msgSend(v4, "serverZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsaltedBookmarkData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mangledID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldFixupTargetCZMAliases");

    if (v10)
    {
      if (objc_msgSend(v5, "isSharedZone"))
      {
        objc_msgSend(v5, "zoneName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)*MEMORY[0x1E0D10DB0];
        if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D10DB0]) & 1) != 0)
        {
          v13 = objc_msgSend(v6, "hasPrefix:", v12);

          if (v13)
          {
            v39 = v5;
            objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v12, "length"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "br_stringByBackslashEscapingCharactersInString:", CFSTR("\\_%"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("%"), "stringByAppendingString:");
            v15 = objc_claimAutoreleasedReturnValue();
            -[BRCAccountSession clientDB](self->super._session, "clientDB");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)v15;
            v17 = (void *)objc_msgSend(v16, "fetch:", CFSTR("SELECT item_rank, zone_rowid, item_id, item_alias_target FROM server_items WHERE item_alias_target LIKE %@ ESCAPE '\\' AND item_type = 3"), v15);

            if (objc_msgSend(v17, "next"))
            {
              do
              {
                v18 = objc_msgSend(v17, "longLongAtIndex:", 0);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v17, "longLongAtIndex:", 1));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stringAtIndex:", 3);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[BRCAccountSession serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v21, "isEqualToString:", v6) & 1) == 0)
                {
                  objc_msgSend(v22, "clientZone");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "itemByItemID:", v20);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "asBRAlias");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v35)
                  {
                    brc_bread_crumbs();
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v41 = v35;
                      v42 = 2112;
                      v43 = v34;
                      _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange, the alias %@ is already local.  Allowing it anyway%@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    objc_msgSend(v22, "clientZone");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "serverItemByItemID:", v20);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    v32 = objc_msgSend(v34, "newLocalItemWithServerZone:dbRowID:", v39, 0);
                    -[NSObject asBRAlias](v32, "asBRAlias");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  -[BRCApplyScheduler _fixupCZMAliasTargetWithAlias:target:](self, "_fixupCZMAliasTargetWithAlias:target:", v35, v4);
                }
                -[BRCApplyScheduler _rescheduleRank:inState:forZone:](self, "_rescheduleRank:inState:forZone:", v18, 24, v22);

              }
              while ((objc_msgSend(v17, "next") & 1) != 0);
            }

            v5 = v39;
LABEL_23:

            goto LABEL_24;
          }
        }
        else
        {

        }
      }
      if (objc_msgSend(v5, "isSharedZone"))
      {
        objc_msgSend(v5, "zoneName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D10DB0]);

        if (v24)
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[BRCApplyScheduler rescheduleMissingTargetAliasesWithTarget:].cold.1();

        }
      }
    }
    -[BRCAccountSession clientDB](self->super._session, "clientDB");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v27, "fetch:", CFSTR("SELECT item_rank, zone_rowid FROM server_items WHERE item_alias_target = %@ AND item_type = 3"), v6);

    if (objc_msgSend(v14, "next"))
    {
      do
      {
        v28 = objc_msgSend(v14, "longLongAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "longLongAtIndex:", 1));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCApplyScheduler _rescheduleRank:inState:forZone:](self, "_rescheduleRank:inState:forZone:", v28, 24, v30);

      }
      while ((objc_msgSend(v14, "next") & 1) != 0);
    }
    goto LABEL_23;
  }
LABEL_24:

}

- (void)rescheduleItemsParentedToItemGlobalID:(id)a3
{
  -[BRCApplyScheduler _rescheduleItemsParentedToItemGlobalID:flags:](self, "_rescheduleItemsParentedToItemGlobalID:flags:", a3, 8);
}

- (BOOL)_rescheduleItemsParentedToItemGlobalID:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BRCApplyScheduler *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke;
  v14[3] = &unk_1E87606E8;
  v10 = v7;
  v15 = v10;
  v19 = &v20;
  v11 = v8;
  v16 = v11;
  v17 = self;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v9, "performWithFlags:action:", v4, v14);

  LOBYTE(v4) = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v4;
}

uint64_t __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isNonDesktopRoot") & 1) == 0)
  {
    objc_msgSend(v3, "execute:", CFSTR("UPDATE client_items SET item_type = 0 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 9 AND (SELECT 1 FROM server_items AS si               WHERE client_items.item_id = si.item_id                AND client_items.zone_rowid = si.zone_rowid                AND si.item_type = 0 LIMIT 1)"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(v3, "changes"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_2();
      goto LABEL_14;
    }
    objc_msgSend(v3, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = 0, dir_faults_count = dir_faults_count - 1 WHERE item_id = %@ AND zone_rowid = %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "serverZoneByRowID:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleSyncUp");

    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_3();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  objc_msgSend(v3, "execute:", CFSTR("UPDATE client_unapplied_table SET throttle_state = 1 WHERE throttle_state != 0 AND throttle_id IN (SELECT item_rank FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@)"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_1();
LABEL_14:

    goto LABEL_15;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v3, "changes");
    objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: Rescheduled %lld items which were blocked for greediness when listing folder %@%@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "signal");
LABEL_15:

  return 1;
}

- (void)rescheduleItemsRecursivelyUnderFolder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  BRCApplyScheduler *v12;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientTruthWorkloop](self->super._session, "clientTruthWorkloop");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke;
  block[3] = &unk_1E875D448;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2;
  v5[3] = &unk_1E875D8F0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "performWithFlags:action:", 8, v5);

}

uint64_t __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BRCItemGlobalID *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  id *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unint64_t v23;
  void *v24;
  uint8_t buf[4];
  BRCItemGlobalID *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rescheduleItemsRecursivelyBatchSize");

  objc_msgSend(*(id *)(a1 + 32), "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  v24 = v3;
  v8 = (void *)objc_msgSend(v3, "fetch:", CFSTR("WITH RECURSIVE item_children_with_faults (item_id, zone_rowid, item_type) AS(    SELECT item_id, zone_rowid, item_type FROM item_recursive_properties     WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_type IN (0, 9, 10)       AND dir_faults_count > 0 AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT ip.item_id, ip.zone_rowid, ip.item_type FROM item_recursive_properties AS ip     INNER JOIN item_children_with_faults AS p     WHERE ip.item_parent_id = p.item_id       AND ip.zone_rowid = p.zone_rowid       AND ip.item_type IN (0, 9, 10)       AND ip.dir_faults_count > 0) SELECT item_id, zone_rowid FROM item_children_with_faults AS ic WHERE ic.item_type = 9 LIMIT %lld"), v6, v7, v5);

  v9 = 0;
  if (objc_msgSend(v8, "next"))
  {
    v9 = 0;
    while (1)
    {
      v10 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v8, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v12, v11);
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling items at a flat level under %@%@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "applyScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_rescheduleItemsParentedToItemGlobalID:flags:", v13, 0);

      if ((v17 & 1) == 0)
        break;

      objc_autoreleasePoolPop(v10);
      ++v9;
      if (!objc_msgSend(v8, "next"))
        goto LABEL_7;
    }
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2_cold_1();

    objc_autoreleasePoolPop(v10);
  }
  else
  {
LABEL_7:
    v18 = *(id **)(a1 + 40);
    if (v9 >= v23)
    {
      objc_msgSend(v18, "rescheduleItemsRecursivelyUnderFolder:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(v18[1], "applyScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_rescheduleItemsParentedToItemGlobalID:flags:", *(_QWORD *)(a1 + 32), 0);

    }
  }

  return 1;
}

- (void)repopulateJobsForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCApplyScheduler repopulateJobsForZone:].cold.1();

  objc_msgSend(v4, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("INSERT OR REPLACE INTO client_unapplied_table(zone_rowid, throttle_id, throttle_state, apply_kind) SELECT %@, -rowid, 1, %u FROM client_items WHERE zone_rowid = %@ AND item_localsyncupstate = 1"), v8, 0, v9);

  objc_msgSend(v4, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("INSERT OR REPLACE INTO client_unapplied_table(zone_rowid, throttle_id, throttle_state, apply_kind) SELECT %@, item_rank, 1, %u FROM server_items WHERE zone_rowid = %@"), v10, 1, v11);

}

- (void)schedule
{
  int v3;
  int v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  int v8;
  int v9;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "writerApplyBatchSize");
  v4 = objc_msgSend(v6, "applySchedulerJobMaxRetriesBeforeAssert");
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__BRCApplyScheduler_schedule__block_invoke;
  v7[3] = &unk_1E8760738;
  v7[4] = self;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v5, "groupInTransaction:", v7);

}

uint64_t __29__BRCApplyScheduler_schedule__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  int v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "throttle_id, zone_rowid, apply_kind, retry_count", 48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__BRCApplyScheduler_schedule__block_invoke_2;
  v6[3] = &unk_1E8760710;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(a1 + 44);
  objc_msgSend(v2, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v3, 0, v4, v6);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_handleWatchingFaults");
  return 1;
}

void __29__BRCApplyScheduler_schedule__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  BRCApplyJobIdentifier *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (a3 + 1);
  v6 = a2;
  objc_msgSend(v6, "numberAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v6, "unsignedLongLongAtIndex:", a3));
  v10 = objc_msgSend(v6, "unsignedIntAtIndex:", (a3 + 2));
  objc_msgSend(v6, "numberAtIndex:", (a3 + 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "longLongValue") >= *(unsigned int *)(a1 + 40))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = -[BRCApplyJobIdentifier rank](v9, "rank");
      objc_msgSend(*(id *)(a1 + 32), "tableName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218754;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2048;
      v21 = objc_msgSend(v11, "longLongValue");
      v22 = 2112;
      v23 = v12;
      _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Apply Changes for rank %lld in table %@ seems to keep failing. retry_count: %lld%@", (uint8_t *)&v16, 0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleApplyJobWithID:zone:applyKind:", v9, v8, v10);

}

- (void)_scheduleApplyJobWithID:(id)a3 zone:(id)a4 applyKind:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  BRCApplyScheduler *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  BRCApplyScheduler *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  BRCApplyScheduler *v43;
  id v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[3];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "serverItemRank"))
  {
    objc_msgSend(v10, "serverItemByRank:", objc_msgSend(v8, "serverItemRank"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v8, "rejectedRowID"))
  {
    objc_msgSend(v10, "itemByRowID:", objc_msgSend(v8, "rejectedRowID"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)v11, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemByItemID:", v13);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  v39 = objc_msgSend(v8, "rank");
  v14 = _os_activity_create(&dword_1CBD43000, "apply-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  if (!v9)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:].cold.2();

  }
  memset(v50, 0, sizeof(v50));
  __brc_create_section(1, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 704, v50);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v38 = v9;
    v17 = self;
    v18 = v14;
    v19 = v10;
    v20 = v50[0];
    v21 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134219266;
    v53 = v20;
    v54 = 2112;
    v55 = v8;
    v56 = 2080;
    v57 = v21;
    v58 = 2112;
    v59 = v11;
    v60 = 2112;
    v61 = v12;
    v62 = 2112;
    v63 = v15;
    _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx Apply Changes[%@]: attempting to apply %s\n  server item: %@\n  local item:  %@%@", buf, 0x3Eu);
    v10 = v19;
    v14 = v18;
    self = v17;
    v9 = v38;
  }

  if (!a5)
  {
    if (v11)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:].cold.1();

    }
    if (v12)
    {
      if ((objc_msgSend((id)v12, "isRejected") & 1) != 0)
      {
        v11 = 0;
LABEL_21:
        -[BRCAccountSession clientDB](self->super._session, "clientDB", v38);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke;
        v40[3] = &unk_1E8760760;
        v41 = (id)v12;
        v42 = v8;
        v43 = self;
        v44 = v9;
        v11 = (uint64_t)(id)v11;
        v45 = (id)v11;
        v46 = v14;
        objc_msgSend(v22, "groupInBatch:", v40);

        goto LABEL_31;
      }
      v47 = 0;
      v48 = 0;
      v49 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 723, &v47);
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v53 = v47;
        v54 = 2112;
        v55 = v8;
        v56 = 2112;
        v57 = (uint64_t)v23;
        _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting rejected action with a non-rejected local item%@", buf, 0x20u);
      }
LABEL_30:

      -[BRCFSSchedulerBase deleteJobsMatching:](self, "deleteJobsMatching:", v8);
      __brc_leave_section(&v47);
      v11 = 0;
      goto LABEL_31;
    }
LABEL_22:
    v47 = 0;
    v48 = 0;
    v49 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 720, &v47);
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v53 = v47;
      v54 = 2112;
      v55 = v8;
      v56 = 2112;
      v57 = (uint64_t)v23;
      _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting action without local and server item%@", buf, 0x20u);
    }
    goto LABEL_30;
  }
  if (a5 != 1 || !v12)
  {
    if (v12 | v11)
      goto LABEL_19;
    goto LABEL_22;
  }
  objc_msgSend((id)v12, "isReserved");
LABEL_19:
  if (!v11 || objc_msgSend((id)v11, "rank") == v39)
    goto LABEL_21;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 726, &v47);
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = v12;
    v28 = v9;
    v29 = self;
    v30 = v14;
    v31 = v10;
    v32 = v47;
    v33 = objc_msgSend((id)v11, "rank");
    *(_DWORD *)buf = 134219010;
    v53 = v32;
    v54 = 2112;
    v55 = v8;
    v56 = 2048;
    v57 = v33;
    v58 = 2048;
    v59 = v39;
    v60 = 2112;
    v61 = (uint64_t)v25;
    _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting useless action %lld vs %lld%@", buf, 0x34u);
    v10 = v31;
    v14 = v30;
    self = v29;
    v9 = v28;
    v12 = v27;
  }

  -[BRCFSSchedulerBase deleteJobsMatching:](self, "deleteJobsMatching:", v8);
  __brc_leave_section(&v47);
LABEL_31:
  __brc_leave_section(v50);
  os_activity_scope_leave(&state);

}

void __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCoordinationPendingForItem:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke_cold_1(a1, (uint64_t)v4, v5);

    objc_msgSend(*(id *)(a1 + 48), "setState:forJobID:", 26, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "metadataSyncContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyThrottle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postponeJobID:withThrottle:", v7, v9);

    v11 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "fsWriter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "rank"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), &v11);

  }
}

- (void)_handleWatchingFaults
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  BRCApplyScheduler *v36;
  uint64_t v37;
  NSMutableSet *obj;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v40 = objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = self->_clientZonesWatchingFaults;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSyncBlocked"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v6);
  }

  v39 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = self;
  obj = self->_clientZonesWatchingFaults;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  v11 = (void *)v40;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v46;
    v37 = *MEMORY[0x1E0D10B70];
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v15, "mangledID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "applyCountToSignalFaultsLive");

        objc_msgSend(v15, "dbRowID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT 1 FROM client_unapplied_table WHERE zone_rowid = %@ AND throttle_state = 1 AND apply_kind = %d AND retry_count < %lld LIMIT 1"), v19, 1, v18);

        if ((objc_msgSend(v20, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v15, "dbRowID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT 1 FROM client_unapplied_table WHERE zone_rowid = %@ AND throttle_state = 1 AND apply_kind = %d LIMIT 1"), v21, 1);

          if (objc_msgSend(v22, "BOOLValue"))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", v37, 41, CFSTR("apply is failing"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "mangledID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v23, v24);

            v11 = (void *)v40;
          }
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v12);
  }

  -[NSMutableSet minusSet:](v36->_clientZonesWatchingFaults, "minusSet:", v3);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v3;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    v29 = *MEMORY[0x1E0D10B70];
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
        if (objc_msgSend(v31, "isSyncBlocked"))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", v29, 12, CFSTR("sync is blocked for client zone: %@"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "signalFaultingWatchersWithError:", v32);
        }
        else
        {
          objc_msgSend(v31, "mangledID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "signalFaultingWatchersWithError:", v33);

          v11 = (void *)v40;
        }

        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v31;
          v55 = 2112;
          v56 = v34;
          _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Signalled faulting-barrier waiters for %@%@", buf, 0x16u);
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v27);
  }

}

- (void)deleteExpiredJobs
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes: Cleaned up %lld stale throttles%@");
  OUTLINED_FUNCTION_2();
}

- (unint64_t)_addRanksUpToRank:(int64_t)a3 inZone:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int64_t v19;
  void *v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "lastInsertedRank");
  if (v8 >= a3)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler _addRanksUpToRank:inZone:].cold.2();
    v13 = 0;
  }
  else
  {
    v9 = v8;
    objc_msgSend(v6, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dbRowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "executeWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/23822933>"), CFSTR("INSERT OR IGNORE INTO client_unapplied_table (zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, apply_kind) SELECT %@, item_rank, 1, 0, 0, 0, 0, %u  FROM server_items WHERE zone_rowid = %@ AND item_rank >= %lld AND item_rank < %lld"), v10, 1, v11, v9, a3);

    if (v12)
    {
      v13 = objc_msgSend(v7, "changes");
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BRCApplyScheduler _addRanksUpToRank:inZone:].cold.1();

      v13 = 0;
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = a3 - 1;
      objc_msgSend(v6, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v22 = v9;
      v23 = 2048;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2048;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes [%lld .. %lld]: in %@, %llu ranks inserted%@", buf, 0x34u);

    }
  }

  return v13;
}

- (void)generatedRanksForZone:(id)a3 upToRank:(int64_t)a4
{
  unint64_t v6;
  id v7;

  objc_msgSend(a3, "clientZone");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCApplyScheduler _addRanksUpToRank:inZone:](self, "_addRanksUpToRank:inZone:", a4, v7);
  objc_msgSend(v7, "listedUpToRank:", a4);
  if (v6)
    -[BRCFSSchedulerBase signal](self, "signal");

}

- (void)didSyncDownZone:(id)a3 requestID:(unint64_t)a4 upToRank:(int64_t)a5 caughtUpWithServer:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSMutableSet *clientZonesWatchingFaults;
  void *v18;
  const char *v19;
  uint64_t v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  BRCApplyScheduler *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler didSyncDownZone:requestID:upToRank:caughtUpWithServer:]", 900, v20);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = "NO";
    *(_DWORD *)buf = 134219266;
    if (v6)
      v19 = "YES";
    v22 = v20[0];
    v23 = 2048;
    v24 = a4;
    v25 = 2112;
    v26 = self;
    v27 = 2048;
    v28 = a5;
    v29 = 2080;
    v30 = v19;
    v31 = 2112;
    v32 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx did sync down requestID:%llu, applying server truth on %@. maxRank [%lld] caughtUp [%s]%@", buf, 0x3Eu);
  }

  objc_msgSend(v10, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCApplyScheduler _addRanksUpToRank:inZone:](self, "_addRanksUpToRank:inZone:", a5, v13);
  objc_msgSend(v10, "changeState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastSyncDownDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:", a4, a5, v6, v16);

  -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:](self, "rescheduleSuspendedJobsMatching:inState:", v10, 25);
  -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:](self, "rescheduleSuspendedJobsMatching:inState:", v10, 16);
  -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:](self, "rescheduleSuspendedJobsMatching:inState:", v10, 21);
  -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:](self, "rescheduleSuspendedJobsMatching:inState:", v10, 26);
  if (v14
    || objc_msgSend(v13, "isPrivateZone")
    && (clientZonesWatchingFaults = self->_clientZonesWatchingFaults,
        objc_msgSend(v13, "asPrivateClientZone"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(clientZonesWatchingFaults) = -[NSMutableSet containsObject:](clientZonesWatchingFaults, "containsObject:", v18), v18, (_DWORD)clientZonesWatchingFaults))
  {
    -[BRCFSSchedulerBase signal](self, "signal");
  }

  __brc_leave_section(v20);
}

- (void)_close
{
  BRCCountedSet *coordinatedWriters;
  NSMutableSet *v4;
  NSMutableSet *clientZonesWatchingFaults;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_applyCountReachedMax)
  {
    coordinatedWriters = self->_coordinatedWriters;
    self->_coordinatedWriters = 0;

    self->_applyCountReachedMax = 0;
    -[BRCFSSchedulerBase resume](self, "resume");
  }
  v4 = self->_clientZonesWatchingFaults;
  clientZonesWatchingFaults = self->_clientZonesWatchingFaults;
  self->_clientZonesWatchingFaults = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "signalFaultingWatchersWithError:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13.receiver = self;
  v13.super_class = (Class)BRCApplyScheduler;
  -[BRCFSSchedulerBase _close](&v13, sel__close);

}

- (unsigned)recoverMissingJobsAndReport:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id *p_isa;
  BRCAccountSession *session;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v45;
  _BOOL4 v46;
  unsigned int v47;
  void *v48;
  BRCApplyScheduler *v49;
  void *obj;
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v46 = a3;
  v65 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 1 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_unapplied_table AS cu WHERE cu.throttle_id = ci.rowid AND cu.throttle_state != 0)"));

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke;
  v53[3] = &unk_1E875E2C8;
  v49 = self;
  v53[4] = self;
  v45 = v5;
  objc_msgSend(v5, "enumerateObjects:", v53);
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v6)
  {
    v7 = v6;
    v47 = 0;
    v8 = *(_QWORD *)v55;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D17A6BE8]();
        if ((objc_msgSend(v10, "isRejected") & 1) == 0)
        {
          brc_bread_crumbs();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v19;
            _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: li.isRejected%@", buf, 0xCu);
          }

        }
        objc_msgSend(v10, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverItemByItemID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "isLive"))
        {
          brc_bread_crumbs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v59 = v10;
            v60 = 2112;
            v61 = v14;
            v62 = 2112;
            v63 = v15;
            _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ was remotely revived by %@.  Updating as such%@", buf, 0x20u);
          }

          objc_msgSend(v10, "markRejectedItemRemotelyRevived");
          objc_msgSend(v10, "saveToDB");
        }
        else
        {
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v10;
            v60 = 2112;
            v61 = v17;
            _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ doesn't have an apply job.  Re-creating the apply job%@", buf, 0x16u);
          }

          -[BRCApplyScheduler createApplyJobFromServerItem:localItem:state:kind:](v49, "createApplyJobFromServerItem:localItem:state:kind:", v14, v10, 1, 0);
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v47 += v7;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      v7 = v21;
    }
    while (v21);
  }
  else
  {
    v47 = 0;
  }

  v22 = (void *)objc_opt_new();
  p_isa = (id *)&v49->super.super.isa;
  session = v49->super._session;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke_114;
  v51[3] = &unk_1E875ED40;
  v25 = v22;
  v52 = v25;
  -[BRCAccountSession enumeratePrivateClientZones:](session, "enumeratePrivateClientZones:", v51);
  -[BRCAccountSession clientDB](v49->super._session, "clientDB");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v25;
  v27 = (void *)objc_msgSend(v26, "fetchWithSlowStatementRadar:sql:", CFSTR("expected full table scan"), CFSTR("SELECT si.item_rank, si.zone_rowid FROM server_items AS si LEFT JOIN client_items AS ci ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE si.item_state = 0 AND si.item_type != 3 AND si.item_rank IS NOT NULL AND (NOT ckinfo_etags_are_equal(si.version_ckinfo, ci.version_ckinfo) OR (NOT ckinfo_etags_are_equal(si.item_stat_ckinfo, ci.item_stat_ckinfo) AND NOT (si.item_sharing_options & 4 != 0 AND %@ != (SELECT cz.zone_owner FROM client_zones AS cz WHERE cz.rowid = si.zone_rowid))) OR ci.rowid IS NULL) AND NOT indexset_contains(%p, si.zone_rowid) AND NOT EXISTS (SELECT 1 FROM client_unapplied_table AS cu WHERE cu.throttle_id = si.item_rank AND cu.throttle_state != 0)"), *MEMORY[0x1E0C94730], v25);

  if (objc_msgSend(v27, "next"))
  {
    do
    {
      v28 = (void *)MEMORY[0x1D17A6BE8]();
      v29 = objc_msgSend(v27, "longLongAtIndex:", 0);
      v30 = v27;
      objc_msgSend(v27, "numberAtIndex:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[1], "serverZoneByRowID:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "clientZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "serverItemByRank:", v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "itemID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "itemByItemID:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v59 = v34;
        v60 = 2112;
        v61 = v37;
        _os_log_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing an apply throttle%@", buf, 0x16u);
      }

      if (v36)
        v39 = 2;
      else
        v39 = 1;
      p_isa = (id *)&v49->super.super.isa;
      -[BRCApplyScheduler createApplyJobFromServerItem:localItem:state:kind:](v49, "createApplyJobFromServerItem:localItem:state:kind:", v34, v36, 1, v39);
      ++v47;

      objc_autoreleasePoolPop(v28);
      v27 = v30;
    }
    while ((objc_msgSend(v30, "next") & 1) != 0);
  }
  if (v47)
  {
    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler recoverMissingJobsAndReport:].cold.1((uint64_t)v40, v47, v41);

    objc_msgSend(p_isa, "signal");
  }
  if (v46)
  {
    v42 = +[AppTelemetryTimeSeriesEvent newMissingApplyJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingApplyJobEventWithNumberMissing:", v47);
    objc_msgSend(p_isa[1], "analyticsReporter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v42);

  }
  return v47;
}

id __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

uint64_t __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isSyncBlocked"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "dbRowID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addIndex:", objc_msgSend(v5, "unsignedIntegerValue"));

  }
  return 1;
}

- (unint64_t)recoverAndReportMissingJobs
{
  return -[BRCApplyScheduler recoverMissingJobsAndReport:](self, "recoverMissingJobsAndReport:", 1);
}

- (void)deleteNonRejectionJobsForZone:(id)a3
{
  BRCAccountSession *session;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  session = self->super._session;
  v5 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "execute:", CFSTR("DELETE FROM client_unapplied_table WHERE %@ AND throttle_id > 0"), v7);
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "changes");

  if (v9 >= 1)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler deleteNonRejectionJobsForZone:].cold.1();

    -[BRCFSSchedulerBase checkIfHasWork](self, "checkIfHasWork");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZonesWatchingFaults, 0);
  objc_storeStrong((id *)&self->_coordinatedWriters, 0);
}

- (unint64_t)_writeCoordinationCount
{
  void *v2;
  unint64_t v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "writerMaxConcurrentIOs");

  return v3;
}

- (BOOL)canScheduleMoreJobs
{
  return !self->_applyCountReachedMax;
}

- (BOOL)startWriteCoordinationInAppLibrary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if (self->_applyCountReachedMax)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v6 = -[BRCCountedSet totalCount](self->_coordinatedWriters, "totalCount");
  if (v6 >= -[BRCApplyScheduler _writeCoordinationCount](self, "_writeCoordinationCount"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler(LegacyAdditions) startWriteCoordinationInAppLibrary:].cold.1((id *)&self->_coordinatedWriters, (uint64_t)v8, v9);

    self->_applyCountReachedMax = 1;
    -[BRCFSSchedulerBase suspend](self, "suspend");
    goto LABEL_7;
  }
  -[BRCCountedSet addObject:](self->_coordinatedWriters, "addObject:", v4);
  v7 = 1;
LABEL_8:

  return v7;
}

- (void)endWriteCoordinationInAppLibrary:(id)a3 rowID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  BRCCountedSet **p_coordinatedWriters;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;

  v6 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertOnQueue");

  objc_msgSend(v6, "itemByRowID:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "serverRankByItemID:", v11);

    objc_msgSend(v6, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "execute:", CFSTR("UPDATE client_unapplied_table   SET throttle_state = 1 WHERE throttle_state = 26   AND throttle_id IN(%llu, %lld)"), v12, -objc_msgSend(v9, "dbRowID"));

    objc_msgSend(v6, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "changes");

    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:].cold.4();

      -[BRCFSSchedulerBase signal](self, "signal");
    }
    else
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:].cold.3();

    }
  }
  p_coordinatedWriters = &self->_coordinatedWriters;
  if ((-[BRCCountedSet containsObject:](self->_coordinatedWriters, "containsObject:", v6) & 1) != 0)
  {
    -[BRCCountedSet removeObject:](*p_coordinatedWriters, "removeObject:", v6);
    if (self->_applyCountReachedMax)
    {
      v21 = -[BRCCountedSet totalCount](*p_coordinatedWriters, "totalCount");
      if (v21 < -[BRCApplyScheduler _writeCoordinationCount](self, "_writeCoordinationCount") >> 1)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:].cold.1((id *)&self->_coordinatedWriters, (uint64_t)v22, v23);

        self->_applyCountReachedMax = 0;
        -[BRCFSSchedulerBase resume](self, "resume");
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:].cold.2();

  }
}

- (void)monitorFaultingForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if ((-[NSMutableSet containsObject:](self->_clientZonesWatchingFaults, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_clientZonesWatchingFaults, "addObject:", v4);
    -[BRCFSSchedulerBase signal](self, "signal");
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCApplyScheduler(LegacyAdditions) monitorFaultingForZone:].cold.1();

  }
}

- (void)stopMonitoringFaultingForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  -[NSMutableSet removeObject:](self->_clientZonesWatchingFaults, "removeObject:", v4);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCApplyScheduler(LegacyAdditions) stopMonitoringFaultingForZone:].cold.1();

}

- (void)describeInBuffer:aggregateOfJobsMatching:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [matchingQuery isKindOfClass:[BRCServerZone class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setState:forServerItem:localItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !si.isLive || !li.isRejected%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)createApplyJobFromServerItem:localItem:state:kind:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverItem || localItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didCreateMissingParentID:zone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes: (missing parent found: %@)%@");
  OUTLINED_FUNCTION_2();
}

- (void)_rescheduleRank:inState:forZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes: retrying suspended rank %lld%@");
  OUTLINED_FUNCTION_2();
}

- (void)_rescheduleRank:inState:forZone:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: state >= BRCJobStateSuspendedBase%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fixupCZMAliasTargetWithAlias:target:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] failed writing alias bookmark data - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_fixupCZMAliasTargetWithAlias:target:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed resolving the bookmark target - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)rescheduleMissingTargetAliasesWithTarget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !shouldFixup || !serverZone.isSharedZone || ![serverZone.zoneName isEqualToString:BRUbiquitousDefaultContainerID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "debugItemIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Apply Changes: No unscheduled items parented to %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_2()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "debugItemIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] No point in rescheduling items under %@ because we can't make it a non-fault%@", v4);

  OUTLINED_FUNCTION_6();
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 56), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugItemIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v4, "[DEBUG] Updated %@ to be a non-fault%@", v5);

  OUTLINED_FUNCTION_6();
}

void __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Couldn't reschedule flat items under %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)repopulateJobsForZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes: repopulating throttles for zone:%@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleApplyJobWithID:zone:applyKind:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: si == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleApplyJobWithID:zone:applyKind:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] Apply Changes[%@]: Suspending action until the coordination callback%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_addRanksUpToRank:inZone:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: failed to insert into client_unapplied_commands: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_addRanksUpToRank:inZone:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "zoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Apply Changes [] in %@, 0 ranks inserted%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)recoverMissingJobsAndReport:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: Rescheduled %u throttles missing from the apply table%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)deleteNonRejectionJobsForZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes: Deleted %llu non-rejection jobs%@");
  OUTLINED_FUNCTION_2();
}

@end
