@implementation BRCNotificationPipe

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _receiver == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_registerAsWatcherIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[BRCNotificationManager registerPipe:asWatcherForFileObjectID:](self->_manager, "registerPipe:asWatcherForFileObjectID:", self, v4);
      v4 = v5;
    }

  }
}

- (void)addNotification:(id)a3 asDead:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableSet *externalAppLibraries;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  BRCXPCClient *client;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBRAlias")
    && v7
    && (-[NSMutableSet containsObject:](self->_externalAppLibraries, "containsObject:", v7) & 1) == 0)
  {
    externalAppLibraries = self->_externalAppLibraries;
    if (!externalAppLibraries)
    {
      v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v10 = self->_externalAppLibraries;
      self->_externalAppLibraries = v9;

      externalAppLibraries = self->_externalAppLibraries;
    }
    -[NSMutableSet addObject:](externalAppLibraries, "addObject:", v7);
    -[BRCNotificationPipe delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationPipe:willObserveAppLibrary:", self, v7);

  }
  client = self->_client;
  if (client
    && !-[BRCXPCClient isSandboxed](client, "isSandboxed")
    && !-[BRCXPCClient hasPrivateSharingInterfaceEntitlement](self->_client, "hasPrivateSharingInterfaceEntitlement"))
  {
    objc_msgSend(v6, "notificationByStrippingSharingInfoIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe addNotification:asDead:].cold.1();

      v16 = v13;
      v6 = v16;
    }

  }
  -[BRNotificationQueue addNotification:asDead:](self->_notifs, "addNotification:asDead:", v6, v4);

}

- (void)addDequeueCallback:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BRNotificationQueue addDequeueCallback:](self->_notifs, "addDequeueCallback:", v5);

}

- (id)_initWithManager:(id)a3 startingRank:(unint64_t)a4
{
  id v7;
  BRCNotificationPipe *v8;
  BRNotificationQueue *v9;
  BRNotificationQueue *notifs;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingProgressUpdatesByID;
  uint64_t v13;
  NSHashTable *recursiveScopeListOps;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCNotificationPipe;
  v8 = -[BRCNotificationPipe init](&v16, sel_init);
  if (v8)
  {
    v9 = (BRNotificationQueue *)objc_alloc_init(MEMORY[0x1E0D10E90]);
    notifs = v8->_notifs;
    v8->_notifs = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingProgressUpdatesByID = v8->_pendingProgressUpdatesByID;
    v8->_pendingProgressUpdatesByID = v11;

    objc_storeStrong((id *)&v8->_manager, a3);
    v8->_initialGatherMaxRank = a4;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    recursiveScopeListOps = v8->_recursiveScopeListOps;
    v8->_recursiveScopeListOps = (NSHashTable *)v13;

  }
  return v8;
}

- (BRCNotificationPipe)initWithXPCReceiver:(id)a3 client:(id)a4 manager:(id)a5 startingRank:(unint64_t)a6
{
  id v10;
  id v11;
  BRCNotificationPipe *v12;
  void *v13;
  BRCNotificationPipe *v14;
  uint64_t v15;
  BRItemNotificationReceiving *receiver;
  uint64_t v17;
  OS_dispatch_queue *queue;
  _QWORD v20[4];
  BRCNotificationPipe *v21;

  v10 = a3;
  v11 = a4;
  v12 = -[BRCNotificationPipe _initWithManager:startingRank:](self, "_initWithManager:startingRank:", a5, a6);
  if (v12)
  {
    objc_msgSend(v11, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke;
    v20[3] = &unk_1E875D850;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    receiver = v14->_receiver;
    v14->_receiver = (BRItemNotificationReceiving *)v15;

    objc_msgSend(v13, "_queue");
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_client, a4);
  }

  return v12;
}

void __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7[3];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe initWithXPCReceiver:client:manager:startingRank:]_block_invoke", 483, v7);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v7[0];
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@ got error %@%@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __brc_leave_section(v7);

}

- (BRCNotificationPipe)initWithReceiver:(id)a3 manager:(id)a4 startingRank:(unint64_t)a5
{
  id v9;
  id v10;
  id *v11;
  BRCNotificationPipe *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = -[BRCNotificationPipe _initWithManager:startingRank:](self, "_initWithManager:startingRank:", v10, a5);
  v12 = (BRCNotificationPipe *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.brc.pipe", v14);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    objc_msgSend(v10, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "volume");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_volumeIsCaseSensitive = objc_msgSend(v18, "isCaseSensitive");

  }
  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int watchKind;
  int v8;
  const __CFString *v9;
  int v10;
  unsigned __int16 watchItemOptions;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  if (self->_client)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" "));
    -[BRCXPCClient description](self->_client, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
  if (self->_gatherer)
    objc_msgSend(v3, "appendString:", CFSTR(" gathering"));
  if (-[NSSet count](self->_watchedAppLibraryIDs, "count"))
  {
    -[NSSet allObjects](self->_watchedAppLibraryIDs, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" {%@}"), v6);

  }
  watchKind = self->_watchKind;
  if ((watchKind & 1) != 0)
  {
    watchItemOptions = self->_watchItemOptions;
    v12 = CFSTR(" {children of ");
    if ((watchItemOptions & 2) == 0)
      v12 = CFSTR(" {item at ");
    if ((watchItemOptions & 4) != 0)
      v13 = CFSTR(" {descendants of ");
    else
      v13 = v12;
    objc_msgSend(v3, "appendString:", v13);
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v16);

      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("[fid:%@ n:%@]"), v17, v19);

        goto LABEL_32;
      }
    }

    if (!v17)
    {
LABEL_33:
      BRCPrettyPrintBitmap();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if ((self->_watchKind & 0x20) != 0)
        v22 = CFSTR("|withAliases");
      else
        v22 = &stru_1E8769030;
      objc_msgSend(v3, "appendFormat:", CFSTR(" (%@%@)}"), v20, v22);

      goto LABEL_37;
    }
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[fid:%@]"), v17);
LABEL_32:

    goto LABEL_33;
  }
  if ((watchKind & 0x26) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" {NSMDQ"));
    v8 = self->_watchKind;
    if ((v8 & 4) != 0)
    {
      objc_msgSend(v3, "appendString:", CFSTR(" data"));
      v8 = self->_watchKind;
      if ((v8 & 2) == 0)
      {
LABEL_11:
        if ((v8 & 8) == 0)
          goto LABEL_16;
LABEL_12:
        if ((v8 & 0x80) != 0)
          v9 = CFSTR(" dirs-only");
        else
          v9 = CFSTR(" dirs");
        objc_msgSend(v3, "appendString:", v9);
LABEL_16:
        v10 = self->_watchKind;
        if ((v10 & 0x10) != 0)
        {
          objc_msgSend(v3, "appendString:", CFSTR(" faults"));
          v10 = self->_watchKind;
          if ((v10 & 0x20) == 0)
          {
LABEL_18:
            if ((v10 & 0x40) == 0)
            {
LABEL_20:
              objc_msgSend(v3, "appendString:", CFSTR("}"));
              goto LABEL_37;
            }
LABEL_19:
            objc_msgSend(v3, "appendString:", CFSTR(" trash"));
            goto LABEL_20;
          }
        }
        else if ((v10 & 0x20) == 0)
        {
          goto LABEL_18;
        }
        objc_msgSend(v3, "appendString:", CFSTR(" ext"));
        if ((self->_watchKind & 0x40) == 0)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_11;
    }
    objc_msgSend(v3, "appendString:", CFSTR(" docs"));
    v8 = self->_watchKind;
    if ((v8 & 8) == 0)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_37:
  objc_msgSend(v3, "appendFormat:", CFSTR(" queued:%ld>"), -[BRNotificationQueue count](self->_notifs, "count"));
  return (NSString *)v3;
}

- (int)_isInterestingUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t volumeIsCaseSensitive;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSSet *watchedAppLibraryIDs;
  void *v42;
  int v43;
  int watchKind;
  void *v45;
  int v46;
  int v47;
  NSObject *v48;
  int v49;
  int v50;
  void *v51;
  int v52;
  NSSet *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  NSSet *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v77;
  NSObject *v78;
  int v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "parentFileObjectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToFileObjectID:", v8);

    }
    else
    {
      v9 = 0;
    }
    -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (volumeIsCaseSensitive = self->_volumeIsCaseSensitive,
          objc_msgSend(v4, "logicalName"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(volumeIsCaseSensitive) = objc_msgSend(v12, "br_isEqualToStringForHFS:isCaseSensitive:", v10, volumeIsCaseSensitive), v12, !(_DWORD)volumeIsCaseSensitive))
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.25();
      v29 = 0;
      goto LABEL_127;
    }
    -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
    objc_msgSend(v4, "fileObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v13);

    -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
  }
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_17;
  v15 = (void *)v14;
  objc_msgSend(v4, "fileObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToFileObjectID:", v17);

  if (v18)
  {
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemGlobalID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToItemGlobalID:", v20);

    if ((v21 & 1) == 0)
    {
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setOldWatchedAncestorItemGlobalID:](self, "setOldWatchedAncestorItemGlobalID:", v22);

      objc_msgSend(v4, "itemGlobalID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v23);

      -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.24(self, (uint64_t)v25, v26);
      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.23(self, (uint64_t)v25, v26);
      }

    }
  }
  else
  {
LABEL_17:
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      objc_msgSend(v4, "itemGlobalID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToItemGlobalID:", v33);

      if (v34)
      {
        -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fileObjectID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToFileObjectID:", v36);

        if ((v37 & 1) == 0)
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "fileObjectID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = 138413058;
            v80 = v68;
            v81 = 2112;
            v82 = v69;
            v83 = 2112;
            v84 = v70;
            v85 = 2112;
            v86 = v38;
            _os_log_debug_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning new fileObjectID for %@: %@ (was %@)%@", (uint8_t *)&v79, 0x2Au);

          }
          objc_msgSend(v4, "fileObjectID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v40);

          -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
        }
      }
    }
  }
  -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBRAlias"))
  {
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    objc_msgSend(v4, "aliasSourceAppLibraryID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSet containsObject:](watchedAppLibraryIDs, "containsObject:", v42))
      v43 = (LOBYTE(self->_watchedAppLibrariesFlags) >> 2) & 1;
    else
      LOBYTE(v43) = 0;

  }
  else
  {
    LOBYTE(v43) = 0;
  }
  watchKind = self->_watchKind;
  if ((watchKind & 6) != 0)
  {
    objc_msgSend(v4, "appLibrary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "includesDataScope");

    v47 = self->_watchKind;
    if (objc_msgSend(v4, "isDirectory") && (self->_watchKind & 8) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
LABEL_85:
        v29 = 0;
        goto LABEL_126;
      }
LABEL_36:
      -[BRCNotificationPipe _isInterestingUpdate:].cold.2();
      goto LABEL_85;
    }
    if ((v47 & 6) == 6)
      v49 = 0;
    else
      v49 = v46;
    if (v49 != 1)
    {
      if (!objc_msgSend(v4, "isInTrashScope") || (self->_watchKind & 0x40) != 0)
      {
        v53 = self->_watchedAppLibraryIDs;
        objc_msgSend(v4, "appLibraryID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = -[NSSet containsObject:](v53, "containsObject:", v54) | v43;

        if ((v53 & 1) != 0)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe _isInterestingUpdate:].cold.21();
          goto LABEL_126;
        }
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.22();
      }
      else
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.20();
      }
      goto LABEL_125;
    }
    watchKind = self->_watchKind;
  }
  if ((watchKind & 1) != 0)
  {
    if ((self->_watchItemOptions & 1) != 0)
    {
      if (v27)
      {
        objc_msgSend(v4, "fileObjectID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToFileObjectID:", v27);

        if (v52)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe _isInterestingUpdate:].cold.18();
          goto LABEL_126;
        }
      }
      if (v10)
      {
        objc_msgSend(v4, "itemGlobalID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isEqualToItemGlobalID:", v10);

        if (v58)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
LABEL_126:

LABEL_127:
            goto LABEL_128;
          }
          goto LABEL_118;
        }
      }
    }
    if ((self->_watchItemOptions & 2) != 0 && v27)
    {
      objc_msgSend(v4, "parentFileObjectID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToFileObjectID:", v27);

      if (v60)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        v29 = 2;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.15();
        goto LABEL_126;
      }
      objc_msgSend(v4, "oldParentFileObjectID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isEqualToFileObjectID:", v27);

      if (v65)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.16();
        goto LABEL_125;
      }
    }
  }
  v50 = objc_msgSend(v4, "isDocumentsFolder");
  if (v50 && (self->_watchItemOptions & 0x10) != 0)
  {
    objc_msgSend(v4, "appLibrary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "containerMetadata");
    v28 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isDocumentScopePublic](v28, "isDocumentScopePublic")
      && (-[NSObject isInInitialState](v28, "isInInitialState") & 1) == 0)
    {
      brc_bread_crumbs();
      v48 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v56 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.14();
    }
    else
    {
      brc_bread_crumbs();
      v48 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.13();
      v29 = 1;
    }

    goto LABEL_126;
  }
  if ((self->_watchKind & 0x46) != 0 || (self->_watchItemOptions & 4) != 0)
  {
    if (v50)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.1();
      goto LABEL_85;
    }
    if (objc_msgSend(v4, "isDirectory") && (self->_watchKind & 8) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        goto LABEL_85;
      goto LABEL_36;
    }
    if (objc_msgSend(v4, "br_downloadStatus") == 1 && (self->_watchKind & 0x10) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.3();
      goto LABEL_85;
    }
    v61 = self->_watchedAppLibraryIDs;
    objc_msgSend(v4, "appLibraryID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v61) = -[NSSet containsObject:](v61, "containsObject:", v62) | v43;

    if ((v61 & 1) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.12();
      goto LABEL_125;
    }
    v63 = self->_watchKind;
    if ((v63 & 0x46) != 0)
    {
      if (objc_msgSend(v4, "isInDocumentScope"))
      {
        if ((self->_watchKind & 2) != 0)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe _isInterestingUpdate:].cold.9();
          goto LABEL_126;
        }
      }
      else if (objc_msgSend(v4, "isInDataScope"))
      {
        if ((self->_watchKind & 4) != 0)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe _isInterestingUpdate:].cold.10();
          goto LABEL_126;
        }
      }
      else if (objc_msgSend(v4, "isInTrashScope") && (self->_watchKind & 0x40) != 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        v29 = 2;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.11();
        goto LABEL_126;
      }
LABEL_119:
      if ((objc_msgSend(v4, "diffs") & 0xC010) != 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.5();
      }
      else
      {
        if (!objc_msgSend(v4, "isDead"))
          goto LABEL_47;
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.4();
      }
LABEL_125:
      v29 = 1;
      goto LABEL_126;
    }
    if (!v10)
      goto LABEL_119;
    if ((v63 & 1) == 0)
    {
      brc_bread_crumbs();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.8();

    }
    objc_msgSend(v4, "parentGlobalIDs");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "containsObject:", v10);

    if (v67)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        goto LABEL_126;
    }
    else
    {
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v71 = objc_claimAutoreleasedReturnValue();
      if (!v71)
        goto LABEL_119;
      v72 = (void *)v71;
      objc_msgSend(v4, "parentGlobalIDs");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "containsObject:", v74);

      if (!v75)
        goto LABEL_119;
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v48 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        goto LABEL_126;
    }
LABEL_118:
    -[BRCNotificationPipe _isInterestingUpdate:].cold.6();
    goto LABEL_126;
  }
LABEL_47:
  v29 = 0;
LABEL_128:

  return v29;
}

- (void)_addIntraContainerUpdatesFromInterContainerUpdate:(id)a3 toArray:(id)a4
{
  id v6;
  NSSet *watchedAppLibraryIDs;
  void *v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  char v29;
  id obj;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if (objc_msgSend(v6, "isBRAlias"))
  {
    if ((self->_watchKind & 0x20) == 0)
      goto LABEL_23;
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    objc_msgSend(v6, "aliasSourceAppLibraryID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(watchedAppLibraryIDs) = -[NSSet containsObject:](watchedAppLibraryIDs, "containsObject:", v8);

    if (!(_DWORD)watchedAppLibraryIDs)
      goto LABEL_23;
LABEL_22:
    objc_msgSend(v31, "addObject:", v6);
    goto LABEL_23;
  }
  v9 = self->_watchedAppLibraryIDs;
  objc_msgSend(v6, "appLibraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = -[NSSet containsObject:](v9, "containsObject:", v10);

  if ((v9 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v6, "oldAppLibraryID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  v12 = (void *)v11;
  v13 = self->_watchedAppLibraryIDs;
  objc_msgSend(v6, "oldAppLibraryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = -[NSSet containsObject:](v13, "containsObject:", v14);

  if ((_DWORD)v13)
  {
LABEL_8:
    objc_msgSend(v31, "addObject:", v6);
    v15 = 1;
  }
  else
  {
LABEL_9:
    v15 = 0;
  }
  if ((self->_watchKind & 0x20) != 0)
  {
    v29 = v15;
    v16 = (void *)-[NSSet mutableCopy](self->_watchedAppLibraryIDs, "mutableCopy");
    v17 = v6;
    objc_msgSend(v6, "appLibraryIDsWithReverseAliases");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intersectSet:", v18);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v16;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[BRCNotificationManager session](self->_manager, "session");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appLibraryByID:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "db");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "serialQueue");
          v27 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __81__BRCNotificationPipe__addIntraContainerUpdatesFromInterContainerUpdate_toArray___block_invoke;
          block[3] = &unk_1E875D448;
          v33 = v25;
          v34 = v17;
          v35 = v31;
          v28 = v25;
          dispatch_sync(v27, block);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v20);
    }

    v6 = v17;
    v15 = v29;
  }
  if ((v15 & 1) == 0 && (self->_watchItemOptions & 0x10) != 0 && objc_msgSend(v6, "isDocumentsFolder"))
    goto LABEL_22;
LABEL_23:

}

void __81__BRCNotificationPipe__addIntraContainerUpdatesFromInterContainerUpdate_toArray___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unsaltedBookmarkData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aliasByUnsaltedBookmarkData:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    v5 = objc_msgSend(v8, "isDead");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v8, "asBRAlias");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCNotification notificationWithAliasItem:targetItemNotification:](BRCNotification, "notificationWithAliasItem:targetItemNotification:", v6, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      v4 = v8;
    }
  }

}

- (void)_prepareForSecondGatherWithRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  BRCDataOrDocsScopeGatherer *v7;
  void *v8;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v10;
  BRCDataOrDocsScopeGatherer *gatherer;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_receiver)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.2();

    dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
    if (self->_gatherer)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.1();

    }
    v7 = [BRCDataOrDocsScopeGatherer alloc];
    -[NSSet allObjects](self->_watchedAppLibraries, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    initialGatherMaxRank = self->_initialGatherMaxRank;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke;
    v14[3] = &unk_1E875D850;
    v14[4] = self;
    v10 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v7, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v8, initialGatherMaxRank, a3 + 1, 1, v14);
    gatherer = self->_gatherer;
    self->_gatherer = v10;

    self->_initialGatherMaxRank = 0;
  }
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)processUpdates:(id)a3 withRank:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *queue;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unint64_t initialGatherMaxRank;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  BRCNotificationPipe *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[7];
  uint64_t v33[3];
  uint8_t v34[128];
  _BYTE buf[24];
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_receiver)
  {
    if (self->_watchKind)
    {
      memset(v33, 0, sizeof(v33));
      __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe processUpdates:withRank:]", 872, v33);
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v33[0];
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        v36 = v6;
        v37 = 2048;
        v38 = a4;
        v39 = 2112;
        v40 = v7;
        _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: processing updates %@ [rank:%lld]%@", buf, 0x34u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v36) = 0;
      queue = self->_queue;
      v10 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke;
      block[3] = &unk_1E875FD98;
      block[5] = buf;
      block[6] = a4;
      block[4] = self;
      dispatch_sync(queue, block);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
            v17 = (void *)MEMORY[0x1D17A6BE8]();
            -[BRCNotificationPipe _addIntraContainerUpdatesFromInterContainerUpdate:toArray:](self, "_addIntraContainerUpdatesFromInterContainerUpdate:toArray:", v16, v11);
            objc_autoreleasePoolPop(v17);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v13);
      }

      v18 = objc_msgSend(v12, "count");
      v19 = objc_msgSend(v11, "count");
      v20 = v18 - v19;
      if (v18 != v19)
      {
        if (objc_msgSend(v11, "count"))
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe processUpdates:withRank:].cold.2((uint64_t)v21, v20, v22);
        }
        else
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe processUpdates:withRank:].cold.1();
        }

      }
      if (objc_msgSend(v11, "count") || *(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v24 = self->_queue;
        v25[0] = v10;
        v25[1] = 3221225472;
        v25[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_117;
        v25[3] = &unk_1E875D470;
        v26 = v11;
        v27 = self;
        dispatch_sync(v24, v25);

      }
      _Block_object_dispose(buf, 8);
      __brc_leave_section(v33);
    }
    else
    {
      initialGatherMaxRank = self->_initialGatherMaxRank;
      if (initialGatherMaxRank && initialGatherMaxRank < a4 && !self->_secondaryGatherMaxRank)
        self->_secondaryGatherMaxRank = a4;
    }
  }

}

_QWORD *__47__BRCNotificationPipe_processUpdates_withRank___block_invoke(_QWORD *a1)
{
  _QWORD *result;
  unint64_t v3;
  unint64_t v4;

  result = (_QWORD *)a1[4];
  v3 = result[14];
  if (v3 && (v4 = a1[6], v3 < v4) && !result[15])
  {
    if (result[9])
    {
      result[15] = v4;
    }
    else
    {
      result = (_QWORD *)objc_msgSend(result, "_prepareForSecondGatherWithRank:");
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
  }
  else if (!result[9] && !result[15])
  {
    result[14] = 0;
  }
  return result;
}

uint64_t __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_117(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D17A6BE8](v3);
        v9 = objc_msgSend(*(id *)(a1 + 40), "_isInterestingUpdate:", v7, (_QWORD)v11);
        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "addNotification:asDead:", v7, v9 == 1);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v3;
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_gatherIfNeededAndFlushAsync");
}

- (void)__flush
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BRNotificationQueue *notifs;
  _QWORD v7[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notifBatchSize");
  if (!self->_hasUpdatesInFlight)
  {
    v5 = v4;
    if (-[BRNotificationQueue count](self->_notifs, "count"))
    {
      notifs = self->_notifs;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __30__BRCNotificationPipe___flush__block_invoke;
      v7[3] = &unk_1E875FDC0;
      v7[4] = self;
      -[BRNotificationQueue dequeue:block:](notifs, "dequeue:block:", v5, v7);
    }
  }

}

void __30__BRCNotificationPipe___flush__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v43 = v27;
      v44 = 2048;
      v45 = objc_msgSend(v3, "count");
      v46 = 2112;
      v47 = v16;
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: sending %ld notifications:%@", buf, 0x20u);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v3;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v37;
      *(_QWORD *)&v20 = 138412546;
      v28 = v20;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v23);
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v28;
            v43 = v24;
            v44 = 2112;
            v45 = (uint64_t)v25;
            _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF]   %@%@", buf, 0x16u);
          }

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v21);
    }

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count", v28));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isSandboxed"))
          objc_msgSend(v10, "generateLogicalExtension:physicalExtension:", v30, v29);
        if (objc_msgSend(v10, "isDocumentsFolder"))
        {
          objc_msgSend(v10, "appLibrary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "containerMetadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRQueryItem containerItemForContainer:withRepresentativeItem:](BRCNotification, "containerItemForContainer:withRepresentativeItem:", v12, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v7);
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 8);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __30__BRCNotificationPipe___flush__block_invoke_119;
  v31[3] = &unk_1E875D500;
  v31[4] = v14;
  objc_msgSend(v15, "receiveUpdates:logicalExtensions:physicalExtensions:reply:", v4, v30, v29, v31);

}

void __30__BRCNotificationPipe___flush__block_invoke_119(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  const char *label;
  _QWORD v17[5];
  uint64_t v18[3];
  __int128 v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe __flush]_block_invoke", 981, v18);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v18[0];
    *(_WORD *)&block[12] = 2112;
    *(_QWORD *)&block[14] = v14;
    *(_WORD *)&block[22] = 2112;
    v22 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: received notification acknowledgement%@", block, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(v4 + 136);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __30__BRCNotificationPipe___flush__block_invoke_120;
  v17[3] = &unk_1E875D500;
  v17[4] = v4;
  v7 = v6;
  v8 = v17;
  v9 = (void *)MEMORY[0x1D17A6BE8]();
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v19);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = v19;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v15;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[NOTIF] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v25 = v19;
  v26 = v20;
  *(_QWORD *)block = v5;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke_0;
  v22 = &unk_1E875D578;
  v12 = v7;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  dispatch_async(v12, block);

  objc_autoreleasePoolPop(v9);
  __brc_leave_section(v18);
}

uint64_t __30__BRCNotificationPipe___flush__block_invoke_120(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "processDequeueCallbacks");
  return objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
}

- (void)_gatherIfNeededAndFlushAsync
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] %@: client is really backlogged, invalidating%@");
  OUTLINED_FUNCTION_2();
}

void __51__BRCNotificationPipe__gatherIfNeededAndFlushAsync__block_invoke(uint64_t a1, char a2, void *a3)
{
  _QWORD *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 136));
  v5 = *(_QWORD **)(a1 + 32);
  if ((a2 & 1) != 0)
    goto LABEL_6;
  if ((id)v5[9] == v6)
  {
    v5[9] = 0;

    v5 = *(_QWORD **)(a1 + 32);
  }
  if (!v5[15] || v5[9])
  {
LABEL_6:
    objc_msgSend(v5, "__flush");
  }
  else
  {
    objc_msgSend(v5, "_prepareForSecondGatherWithRank:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
  }

}

- (void)_stopWatchingItems
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *watchedAppLibraries;
  BRCDataOrDocsScopeGatherer *gatherer;
  id WeakRetained;
  void *v15;
  BRCNotificationPipe *v16;
  NSHashTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**boostReply)(void);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_watchedAppLibrariesFlags)
  {
    -[BRCNotificationManager unregisterAppLibraries:forFlags:](self->_manager, "unregisterAppLibraries:forFlags:", self->_watchedAppLibraries);
    self->_watchedAppLibrariesFlags = 0;
  }
  -[BRCNotificationManager unregisterPipeAsWatcher:](self->_manager, "unregisterPipeAsWatcher:", self);
  -[BRCNotificationPipe delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_watchedAppLibraries;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "notificationPipe:didObserveAppLibrary:", self, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v5);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_externalAppLibraries;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v3, "notificationPipe:didObserveAppLibrary:", self, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v9);
  }

  watchedAppLibraries = self->_watchedAppLibraries;
  self->_watchedAppLibraries = 0;

  -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", 0);
  -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", 0);
  -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
  -[BRCDataOrDocsScopeGatherer invalidate](self->_gatherer, "invalidate");
  gatherer = self->_gatherer;
  self->_gatherer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", self);
    objc_storeWeak((id *)&self->_listOp, 0);
  }
  v16 = self;
  objc_sync_enter(v16);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16->_recursiveScopeListOps;
  v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20++), "endObservingChanges", (_QWORD)v23);
      }
      while (v18 != v20);
      v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v18);
  }

  -[NSHashTable removeAllObjects](v16->_recursiveScopeListOps, "removeAllObjects");
  objc_sync_exit(v16);

  boostReply = (void (**)(void))v16->_boostReply;
  if (boostReply)
  {
    boostReply[2]();
    v22 = v16->_boostReply;
    v16->_boostReply = 0;

  }
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  BRCListDirectoryContentsOperation **p_listOp;
  id v7;
  id WeakRetained;
  id obj;

  obj = a4;
  p_listOp = &self->_listOp;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_listOp);

  if (WeakRetained == v7)
    objc_storeWeak((id *)p_listOp, obj);

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BRCNotificationPipe_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__BRCNotificationPipe_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)__performBlockafterDBAndNotifFlush:(id)a3 session:(id)a4 description:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  BRCNotificationPipe *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  BRCNotificationPipe *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v12;
    v29 = 2112;
    v30 = self;
    v31 = 2112;
    v32 = v14;
    _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for db flush for %@ in %@%@", buf, 0x20u);
  }

  objc_msgSend(v11, "clientTruthWorkloop");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke;
  block[3] = &unk_1E875FE88;
  v22 = v11;
  v23 = v12;
  v25 = v13;
  v26 = v10;
  v24 = self;
  v17 = v13;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  dispatch_async(v16, block);

}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2;
  v11[3] = &unk_1E875D8C8;
  v12 = *(id *)(a1 + 32);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3;
  v6[3] = &unk_1E875FE60;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  v10 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performWithFlags:action:whenFlushed:", 0, v11, v6);

}

uint64_t __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceBatchStart");

  return 1;
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(a1, (uint64_t)v2, v3);

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_124;
  v7[3] = &unk_1E875FE38;
  v7[4] = v4;
  v8 = v5;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v6, v7);

}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_124(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, a1[4]);
  v2 = a1[4];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_125;
  v3[3] = &unk_1E875FE10;
  objc_copyWeak(&v7, &location);
  v4 = a1[5];
  v6 = a1[7];
  v5 = a1[6];
  objc_msgSend(v2, "addDequeueCallback:", v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_125(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v5;
    v8 = 2112;
    v9 = WeakRetained;
    v10 = 2112;
    v11 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] Finished gather group for %@ in %@%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_performBlock:(id)a3 whenNotifsAreFullyFlushedInAppLibrary:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  BRCNotificationPipe *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for faulting for %@ in %@%@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke;
  v17[3] = &unk_1E875FEB0;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v8;
  v14 = v10;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v9, "notifyClient:whenFaultingIsDone:", CFSTR("nsmdq"), v17);

}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "__performBlockafterDBAndNotifFlush:session:description:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

- (void)watchScopes:(unsigned __int16)a3 trustedAppLibraryIDs:(id)a4 gatherReply:(id)a5
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  OS_dispatch_group *v20;
  OS_dispatch_group *gatherGroup;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  BRCDataOrDocsScopeGatherer *v36;
  void *v37;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v39;
  BRCDataOrDocsScopeGatherer *gatherer;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int watchKind;
  id v49;
  void (**v50)(id, void *);
  NSSet *v51;
  id v52;
  id obj;
  void *v54;
  unsigned int v55;
  _QWORD v56[4];
  void (**v57)(id, void *);
  _BYTE *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  BRCNotificationPipe *v64;
  _BYTE *v65;
  id v66;
  _QWORD block[5];
  id v68;
  BRCNotificationPipe *v69;
  _BYTE *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81[3];
  _BYTE v82[128];
  uint8_t v83[128];
  _BYTE buf[40];
  id v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v55 = a3;
  v93 = *MEMORY[0x1E0C80C00];
  v49 = a4;
  v50 = (void (**)(id, void *))a5;
  memset(v81, 0, sizeof(v81));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:]", 1187, v81);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220290;
    *(_QWORD *)&buf[4] = v81[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v55 & 1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = (v55 >> 1) & 1;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = (v55 >> 2) & 1;
    LOWORD(v85) = 1024;
    *(_DWORD *)((char *)&v85 + 2) = (v55 >> 3) & 1;
    HIWORD(v85) = 1024;
    v86 = (v55 >> 4) & 1;
    v87 = 1024;
    v88 = 0;
    v89 = 2112;
    v90 = v49;
    v91 = 2112;
    v92 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: starting watching ubiquitous scope (docs:%d data:%d ext:%d dirs:%d faults:%d trash:%d) for %@%@", buf, 0x4Eu);
  }

  if (self->_watchKind)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v9;
      _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2](v50, v11);
  }
  else if ((2 * v55) & 6 | (32 * ((v55 >> 2) & 1)))
  {
    -[BRCNotificationManager session](self->_manager, "session");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v49);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v49, "count"));
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v12 = v49;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v78 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v54, "appLibraryByID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(obj, "addObject:", v17);
          }
          else
          {
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v16;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v18;
              _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] %@: unable to find container %@%@", buf, 0x20u);
            }

            objc_msgSend(v52, "removeObject:", v16);
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v13);
    }

    if (objc_msgSend(obj, "count"))
    {
      objc_storeStrong((id *)&self->_watchedAppLibraries, obj);
      objc_storeStrong((id *)&self->_watchedAppLibraryIDs, v52);
      self->_watchedAppLibrariesFlags = 3;
      v20 = (OS_dispatch_group *)dispatch_group_create();
      gatherGroup = self->_gatherGroup;
      self->_gatherGroup = v20;

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__10;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__10;
      v85 = 0;
      objc_initWeak(&location, self);
      if ((self->_watchKind & 0x20) != 0)
        self->_watchedAppLibrariesFlags |= 4uLL;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v51 = self->_watchedAppLibraries;
      v22 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v73 != v23)
              objc_enumerationMutation(v51);
            v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            -[BRCNotificationPipe delegate](self, "delegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "notificationPipe:willObserveAppLibrary:", self, v25);

            if ((v55 & 1) != 0)
            {
              objc_msgSend(v25, "dbRowID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              objc_msgSend(v25, "db");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "serialQueue");
              v30 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke;
              block[3] = &unk_1E875FF00;
              block[4] = v25;
              v68 = v28;
              v69 = self;
              v31 = v28;
              objc_copyWeak(&v71, &location);
              v70 = buf;
              dispatch_async(v30, block);

              objc_destroyWeak(&v71);
            }
            if ((v55 & 2) != 0)
            {
              objc_msgSend(v25, "rootItemID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              objc_msgSend(v25, "db");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "serialQueue");
              v34 = objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3;
              v62[3] = &unk_1E875FF00;
              v62[4] = v25;
              v63 = v32;
              v64 = self;
              v35 = v32;
              objc_copyWeak(&v66, &location);
              v65 = buf;
              dispatch_async(v34, v62);

              objc_destroyWeak(&v66);
            }
          }
          v22 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        }
        while (v22);
      }

      -[BRCNotificationManager registerAppLibraries:forFlags:](self->_manager, "registerAppLibraries:forFlags:", self->_watchedAppLibraries, self->_watchedAppLibrariesFlags);
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      v36 = [BRCDataOrDocsScopeGatherer alloc];
      objc_msgSend(obj, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      initialGatherMaxRank = self->_initialGatherMaxRank;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_133;
      v60[3] = &unk_1E875FF28;
      objc_copyWeak(&v61, &location);
      v60[4] = buf;
      v39 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v36, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v37, 1, initialGatherMaxRank, 0, v60);
      gatherer = self->_gatherer;
      self->_gatherer = v39;

      self->_watchKind = (2 * (_BYTE)v55) & 0x80 | v55 & 0x18 | (2 * v55) & 6 | (32 * ((v55 >> 2) & 1));
      v41 = self->_gatherGroup;
      -[BRCNotificationPipe queue](self, "queue");
      v42 = objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_134;
      v56[3] = &unk_1E875FF50;
      objc_copyWeak(&v59, &location);
      v57 = v50;
      v58 = buf;
      dispatch_group_notify(v41, v42, v56);

      -[BRCNotificationPipe _gatherIfNeededAndFlushAsync](self, "_gatherIfNeededAndFlushAsync");
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
        -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2](v50, v47);

    }
    v11 = v54;
  }
  else
  {
    brc_bread_crumbs();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v43;
      _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: client didn't specify Document or Data Scope%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2](v50, v11);
  }

  __brc_leave_section(v81);
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", *(_QWORD *)(a1 + 40), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();

    objc_msgSend(v3, "beginObservingChanges");
    v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 192), "addObject:", v3);
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_130;
    v10[3] = &unk_1E875FED8;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    v7 = *(_QWORD *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v7;
    objc_msgSend(v3, "addRecursiveDirectoryListCompletionBlock:", v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 80));
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[24], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2;
    v15[3] = &unk_1E875F878;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x1E0C809B0], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2, &unk_1E875F878, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", *(_QWORD *)(a1 + 40), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();

    objc_msgSend(v3, "beginObservingChanges");
    v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 192), "addObject:", v3);
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_131;
    v10[3] = &unk_1E875FED8;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    v7 = *(_QWORD *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v7;
    objc_msgSend(v3, "addRecursiveDirectoryListCompletionBlock:", v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 80));
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[24], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_132;
    v15[3] = &unk_1E875F878;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x1E0C809B0], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_132, &unk_1E875F878, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_132(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_133(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_group_t *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_133_cold_1();

    dispatch_group_leave(v6[10]);
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_134(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_134_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)_watchItem:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSSet *v18;
  NSSet *watchedAppLibraries;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSSet *v24;
  NSSet *watchedAppLibraryIDs;
  void *v26;
  OS_dispatch_group *v27;
  OS_dispatch_group *gatherGroup;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id WeakRetained;
  BOOL v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  BRCNotificationPipe *v42;
  uint64_t v43;
  BRCDataOrDocsScopeGatherer *v44;
  void *v45;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v47;
  BRCDataOrDocsScopeGatherer *gatherer;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  OS_dispatch_queue *queue;
  uint64_t v53;
  _QWORD *v54;
  NSObject *v55;
  int watchKind;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  _BYTE *v64;
  uint64_t v65;
  _QWORD block[4];
  void (**v67)(id, void *);
  _BYTE *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  _BYTE *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _BYTE *v78;
  id v79;
  id v80;
  id location;
  _BYTE buf[32];
  void (*v83)(uint64_t);
  id v84;
  void *v85;
  void *v86;
  _BYTE from[24];
  void *v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (self->_watchKind)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v10;
      _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

    goto LABEL_35;
  }
  if (v8)
  {
    -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
    objc_msgSend(v8, "fileObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v13);

    objc_msgSend(v8, "itemGlobalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v14);

    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v8, "appLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSSet *)objc_msgSend(v15, "initWithArray:", v17);
    watchedAppLibraries = self->_watchedAppLibraries;
    self->_watchedAppLibraries = v18;

    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v8, "appLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appLibraryID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSSet *)objc_msgSend(v20, "initWithArray:", v23);
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    self->_watchedAppLibraryIDs = v24;

LABEL_8:
    -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
    self->_watchItemOptions = a4;
    v27 = (OS_dispatch_group *)dispatch_group_create();
    gatherGroup = self->_gatherGroup;
    self->_gatherGroup = v27;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__10;
    v83 = __Block_byref_object_dispose__10;
    v84 = 0;
    objc_initWeak(&location, self);
    if (!self->_watchedAncestorFileObjectID || !objc_msgSend(v8, "isDirectory"))
    {
LABEL_28:
      if ((a4 & 4) != 0)
        v43 = 3;
      else
        v43 = 1;
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      if (self->_gatherer)
      {
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.1();

      }
      v44 = [BRCDataOrDocsScopeGatherer alloc];
      -[NSSet allObjects](self->_watchedAppLibraries, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      initialGatherMaxRank = self->_initialGatherMaxRank;
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_140;
      v70[3] = &unk_1E875FF28;
      objc_copyWeak(&v71, &location);
      v70[4] = buf;
      v47 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v44, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v45, 1, initialGatherMaxRank, 0, v70);
      gatherer = self->_gatherer;
      self->_gatherer = v47;

      self->_watchKind = 1;
      v49 = self->_gatherGroup;
      -[BRCNotificationPipe queue](self, "queue");
      v50 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141;
      block[3] = &unk_1E875FF50;
      objc_copyWeak(&v69, &location);
      v67 = v9;
      v68 = buf;
      dispatch_group_notify(v49, v50, block);

      if ((a4 & 8) != 0)
      {
        -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCDataOrDocsScopeGatherer setGatheredChildrenItemGlobalID:](self->_gatherer, "setGatheredChildrenItemGlobalID:", v51);

      }
      queue = self->_queue;
      v53 = MEMORY[0x1E0C809B0];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142;
      v62[3] = &unk_1E875FFA0;
      v62[4] = self;
      v64 = buf;
      v65 = v43;
      v63 = v8;
      v54 = v62;
      *(_QWORD *)from = v53;
      *(_QWORD *)&from[8] = 3221225472;
      *(_QWORD *)&from[16] = __brc_dispatch_async_autorelease_block_invoke;
      v88 = &unk_1E875FD48;
      v89 = v54;
      v55 = queue;
      dispatch_async(v55, from);

      objc_destroyWeak(&v69);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_35;
    }
    objc_msgSend(v8, "clientZone");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 4) != 0)
    {
      objc_msgSend(v8, "itemID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v39, 1, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        brc_bread_crumbs();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(_QWORD *)&from[4] = v31;
          *(_WORD *)&from[12] = 2112;
          *(_QWORD *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          v88 = v40;
          _os_log_debug_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      objc_msgSend(v31, "beginObservingChanges");
      v42 = self;
      objc_sync_enter(v42);
      -[NSHashTable addObject:](v42->_recursiveScopeListOps, "addObject:", v31);
      objc_sync_exit(v42);

      objc_initWeak((id *)from, v31);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke;
      v76[3] = &unk_1E875FED8;
      objc_copyWeak(&v79, &location);
      objc_copyWeak(&v80, (id *)from);
      v78 = buf;
      v77 = v29;
      objc_msgSend(v31, "addRecursiveDirectoryListCompletionBlock:", v76);

      objc_destroyWeak(&v80);
      objc_destroyWeak(&v79);
      objc_destroyWeak((id *)from);
    }
    else
    {
      if ((a4 & 2) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      -[BRCItemGlobalID itemID](self->_watchedAncestorItemGlobalID, "itemID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v30, 1, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "beginObservingChangesWithDelegate:", self);
      if (v31)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(_QWORD *)&from[4] = v31;
          *(_WORD *)&from[12] = 2112;
          *(_QWORD *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          v88 = v32;
          _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
      v35 = WeakRetained == 0;

      if (!v35)
      {
        brc_bread_crumbs();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          -[BRCNotificationPipe _watchItem:options:gatherReply:].cold.3();

      }
      objc_storeWeak((id *)&self->_listOp, v31);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_138;
      v72[3] = &unk_1E875FF78;
      objc_copyWeak(&v75, &location);
      v72[4] = self;
      v74 = buf;
      v73 = v29;
      objc_msgSend(v31, "addDirectoryListCompletionBlock:", v72);

      objc_destroyWeak(&v75);
    }

    goto LABEL_27;
  }
  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    goto LABEL_8;
  brc_bread_crumbs();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    -[BRCNotificationPipe _watchItem:options:gatherReply:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Invalid notification pipe setup"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v38);

LABEL_35:
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[24], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2;
    v15[3] = &unk_1E875F878;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x1E0C809B0], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2, &unk_1E875F878, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v20 = v17;
    v21 = 2112;
    v22 = v3;
    v23 = 2112;
    v24 = WeakRetained;
    v25 = 2112;
    v26 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] %@ - Calling the list completion block with %@, sself = %@%@", buf, 0x2Au);
  }

  if (WeakRetained)
  {
    v7 = (id *)WeakRetained;
    objc_sync_enter(v7);
    v8 = objc_loadWeakRetained(v7 + 18);
    objc_storeWeak(v7 + 18, 0);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    objc_sync_exit(v7);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_139;
    v18[3] = &unk_1E875F878;
    v15 = a1 + 40;
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "description", MEMORY[0x1E0C809B0], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_139, &unk_1E875F878, v7, *(_QWORD *)(v15 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v18, v14, v16);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_139(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_group_t *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_133_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    dispatch_group_leave(v6[10]);
    objc_sync_exit(v6);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = *(id *)(v2 + 184);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v28 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "notificationPipe:willObserveAppLibrary:", *(_QWORD *)(a1 + 32), v7);

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v4);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "registerAppLibraries:forFlags:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), *(_QWORD *)(a1 + 56));
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v19, "watchedAncestorFileObjectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorItemGlobalID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorFilenameToItem");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = &stru_1E8769030;
      *(_DWORD *)buf = 138413570;
      if (v23)
        v25 = (const __CFString *)v23;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: started watching children of %@ (fsid:%@ id:%@ filename:%@)%@", buf, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
  }
  else
  {
    obj = (id)v2;
    objc_sync_enter(obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      v13 = v12;
      v14 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 72);
    *(_QWORD *)(v17 + 72) = 0;

    objc_sync_exit(obj);
  }
}

- (void)invalidateIfWatchingAppLibraryIDs:(id)a3
{
  if (-[NSSet intersectsSet:](self->_watchedAppLibraryIDs, "intersectsSet:", a3))
    -[BRCNotificationPipe close](self, "close");
}

- (void)invalidateReceiverIfWatchingAppLibraryIDs:(id)a3
{
  if (-[NSSet intersectsSet:](self->_watchedAppLibraryIDs, "intersectsSet:", a3))
    -[BRItemNotificationReceiving invalidate](self->_receiver, "invalidate");
}

- (BOOL)isWatchingGlobalItemID:(id)a3
{
  return -[BRCItemGlobalID isEqualToItemGlobalID:](self->_watchedAncestorItemGlobalID, "isEqualToItemGlobalID:", a3);
}

- (BRCNotificationManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BRCNotificationPipeDelegate)delegate
{
  return (BRCNotificationPipeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BRCItemGlobalID)oldWatchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldWatchedAncestorItemGlobalID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BRCItemGlobalID)watchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchedAncestorItemGlobalID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BRFileObjectID)watchedAncestorFileObjectID
{
  return (BRFileObjectID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWatchedAncestorFileObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)watchedAncestorFilenameToItem
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWatchedAncestorFilenameToItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchedAppLibraryIDs, 0);
  objc_storeStrong((id *)&self->_recursiveScopeListOps, 0);
  objc_storeStrong((id *)&self->_watchedAppLibraries, 0);
  objc_storeStrong((id *)&self->_externalAppLibraries, 0);
  objc_storeStrong((id *)&self->_watchForBundleID, 0);
  objc_storeStrong((id *)&self->_watchNamePrefix, 0);
  objc_destroyWeak((id *)&self->_listOp);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_pendingProgressUpdatesByID, 0);
  objc_storeStrong((id *)&self->_gatherGroup, 0);
  objc_storeStrong((id *)&self->_gatherer, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFilenameToItem, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFileObjectID, 0);
  objc_storeStrong((id *)&self->_watchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_oldWatchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_boostReply, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)watchItemsNamesPrefixedBy:(id)a3 inScopes:(unsigned __int16)a4 appLibraryIDs:(id)a5 gatherReply:(id)a6
{
  uint64_t v8;
  id v9;
  BRCNotificationPipe *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  BRCNotificationPipe *v18;
  uint64_t v19;
  uint64_t v20;
  qos_class_t v21;
  void *v22;
  BRCXPCClient *client;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30[3];
  uint8_t buf[4];
  BRCNotificationPipe *v32;
  __int16 v33;
  BRCNotificationPipe *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v8 = a4;
  v9 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v11 = (BRCNotificationPipe *)a3;
  v12 = a5;
  v13 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]", 1564, v30);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v27 = v13;
    v16 = v9;
    v17 = v12;
    v18 = v11;
    v19 = v8;
    v20 = v30[0];
    v21 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v32 = (BRCNotificationPipe *)v20;
    v33 = 2112;
    v34 = self;
    v35 = 2112;
    v36 = v22;
    v37 = 2080;
    v38 = "-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]";
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    v8 = v19;
    v11 = v18;
    v12 = v17;
    v9 = v16;
    v13 = v27;
  }

  client = self->_client;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke;
  v28[3] = &unk_1E875FCF8;
  v28[4] = self;
  v24 = v13;
  v29 = v24;
  LODWORD(client) = _brc_ipc_check_logged_status(client, 1, v28);

  if ((_DWORD)client)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v25;
      _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: watching items prefixed by \"%@\"%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&self->_watchNamePrefix, v9);
    -[BRCNotificationPipe watchScopes:appLibraryIDs:gatherReply:](self, "watchScopes:appLibraryIDs:gatherReply:", v8, v12, v24);
  }
  __brc_leave_section(v30);

}

void __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)watchScopes:(unsigned __int16)a3 appLibraryIDs:(id)a4 gatherReply:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  qos_class_t v13;
  void *v14;
  BRCXPCClient *client;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *, void *);
  void *v21;
  BRCNotificationPipe *v22;
  id v23;
  id v24;
  uint64_t v25[3];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  BRCNotificationPipe *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]", 1579, v25);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v25[0];
    v13 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v27 = v12;
    v28 = 2112;
    v29 = self;
    v30 = 2112;
    v31 = v14;
    v32 = 2080;
    v33 = "-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]";
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  client = self->_client;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke;
  v21 = &unk_1E875FFC8;
  v22 = self;
  v16 = v8;
  v23 = v16;
  v17 = v9;
  v24 = v17;
  LODWORD(client) = _brc_ipc_check_applibrary_proxy(client, 1, &v18);

  if ((_DWORD)client)
    -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:](self, "watchScopes:trustedAppLibraryIDs:gatherReply:", v6, v16, v17, v18, v19, v20, v21, v22);
  __brc_leave_section(v25);

}

void __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v9 = (void *)a1[5];
    v10 = *(_QWORD *)(a1[4] + 32);
    v11 = 138413058;
    v12 = v10;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch %@: %@%@", (uint8_t *)&v11, 0x2Au);
  }

  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = a1[4];
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)watchScopes:(unsigned __int16)a3 gatherReply:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  qos_class_t v10;
  void *v11;
  BRCXPCClient *client;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  BRCNotificationPipe *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]", 1589, v18);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v18[0];
    v10 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v20 = v9;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v11;
    v25 = 2080;
    v26 = "-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]";
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  client = self->_client;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke;
  v16[3] = &unk_1E875FCF8;
  v16[4] = self;
  v13 = v6;
  v17 = v13;
  LODWORD(client) = _brc_ipc_check_applibraries_access(client, 1, v16);

  if ((_DWORD)client)
  {
    -[BRCXPCClient entitledAppLibraryIDs](self->_client, "entitledAppLibraryIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:](self, "watchScopes:trustedAppLibraryIDs:gatherReply:", v4, v15, v13);
  }
  __brc_leave_section(v18);

}

void __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch app containers: %@%@", (uint8_t *)&v10, 0x20u);
  }

  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)boostPriority:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  void (**boostReply)(void);
  void *v11;
  id v12;
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  BRCNotificationPipe *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) boostPriority:]", 1596, v13);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v13[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v15 = v7;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v9;
    v20 = 2080;
    v21 = "-[BRCNotificationPipe(IPCs) boostPriority:]";
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  boostReply = (void (**)(void))self->_boostReply;
  if (boostReply)
    boostReply[2]();
  v11 = (void *)MEMORY[0x1D17A6DB0](v4);
  v12 = self->_boostReply;
  self->_boostReply = v11;

  __brc_leave_section(v13);
}

- (void)watchItemWithFileObjectID:(id)a3 options:(unsigned __int16)a4 request:(id)a5 gatherReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  BRCNotificationPipe *v25;
  id v26;
  unsigned __int16 v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[BRCNotificationManager session](self->_manager, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCNotificationPipe(IPCs) watchItemWithFileObjectID:options:request:gatherReply:].cold.1();

  objc_msgSend(v13, "clientTruthWorkloop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke;
  v21[3] = &unk_1E875FFF0;
  v22 = v13;
  v23 = v10;
  v25 = self;
  v26 = v12;
  v24 = v11;
  v27 = a4;
  v17 = v11;
  v18 = v12;
  v19 = v10;
  v20 = v13;
  dispatch_async_with_logs_2(v16, v21);

}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemByFileObjectID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "appLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "isSystemRequest");
      if (v4)
        v7 = v6 == 0;
      else
        v7 = 1;
      if (v7 || (objc_msgSend(v4, "isAppInstalled") & 1) != 0)
      {
        if (objc_msgSend(v3, "isZoneRoot"))
        {
          objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFilenameToItem:", 0);
          objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFileObjectID:", *(_QWORD *)(a1 + 40));
        }
        else
        {
          objc_msgSend(v3, "st");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logicalName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFilenameToItem:", v18);

          objc_msgSend(v3, "parentFileObjectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFileObjectID:", v19);

        }
        objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorItemGlobalID:", 0);
        v20 = objc_alloc(MEMORY[0x1E0C99E60]);
        v33 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "initWithArray:", v21);
        v23 = *(_QWORD *)(a1 + 56);
        v24 = *(void **)(v23 + 184);
        *(_QWORD *)(v23 + 184) = v22;

        v25 = objc_alloc(MEMORY[0x1E0C99E60]);
        v32 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "initWithArray:", v26);
        v28 = *(_QWORD *)(a1 + 56);
        v29 = *(void **)(v28 + 200);
        *(_QWORD *)(v28 + 200) = v27;

        objc_msgSend(*(id *)(a1 + 56), "_watchItem:options:gatherReply:", v3, *(unsigned __int16 *)(a1 + 72), *(_QWORD *)(a1 + 64));
      }
      else
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1();

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v35 = v14;
        v36 = 2112;
        v37 = 0;
        v38 = 2112;
        v39 = v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing app library: %@%@", buf, 0x20u);
      }

      v15 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

    }
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v35 = v10;
      v36 = 2112;
      v37 = 0;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing container: %@%@", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v4);
  }

}

- (void)_triggerImmediateReadOfDocumentIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDocumentID");

    if (v5)
    {
      -[BRCNotificationManager session](self->_manager, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientDB");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serialQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke;
      v12[3] = &unk_1E875D470;
      v13 = v6;
      v14 = v7;
      v10 = v7;
      v11 = v6;
      dispatch_async_with_logs_2(v9, v12);

    }
  }
}

void __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BRCItemToPathLookup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "documentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalItemByDocumentID:", objc_msgSend(v3, "unsignedIntValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v4);
    -[BRCItemToPathLookup byFileSystemID](v5, "byFileSystemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v14 = 0;
      if (objc_msgSend(v6, "resolveMustExist:error:", 0, &v14))
      {
        objc_msgSend(*(id *)(a1 + 32), "clientDB");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke_2;
        v11[3] = &unk_1E8760018;
        v12 = *(id *)(a1 + 32);
        v13 = v7;
        objc_msgSend(v8, "groupInBatch:", v11);

        v9 = v12;
      }
      else
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v16 = v7;
          v17 = 1024;
          v18 = v14;
          v19 = 2112;
          v20 = v9;
          _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
        }

      }
    }

  }
}

void __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fsReader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fseventAtPath:flags:options:unresolvedLastPathComponent:", *(_QWORD *)(a1 + 40), 0, 1, 0);

}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  qos_class_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BRCXPCClient *client;
  BRItemNotificationReceiving *receiver;
  uint64_t v12[3];
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  BRCNotificationPipe *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1688, v13);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v13[0];
    v6 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v6, (uint64_t)&brc_qos_entries, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v15 = v5;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2080;
    v21 = "-[BRCNotificationPipe(IPCs) invalidate]";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  if (self->_receiver)
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1695, v12);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v15 = v12[0];
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating %@%@", buf, 0x20u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[BRCNotificationPipe _triggerImmediateReadOfDocumentIfNeeded](self, "_triggerImmediateReadOfDocumentIfNeeded");
    -[BRCNotificationPipe _stopWatchingItems](self, "_stopWatchingItems");
    client = self->_client;
    self->_client = 0;

    -[BRItemNotificationReceiving invalidate](self->_receiver, "invalidate");
    -[BRNotificationQueue removeAllObjects](self->_notifs, "removeAllObjects");
    receiver = self->_receiver;
    self->_receiver = 0;

    self->_hasUpdatesInFlight = 0;
    __brc_leave_section(v12);
  }
  __brc_leave_section(v13);
}

- (void)watchItemAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  qos_class_t v13;
  id v14;
  void *v15;
  BRCXPCClient *client;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  BRCNotificationPipe *v21;
  id v22;
  unsigned __int16 v23;
  uint64_t v24[3];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  BRCNotificationPipe *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]", 39, v24);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v24[0];
    v13 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v26 = v12;
    v27 = 2112;
    v28 = self;
    v29 = 2112;
    v30 = v14;
    v31 = 2080;
    v32 = "-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]";
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

  }
  client = self->_client;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_options_gatherReply___block_invoke;
  v19[3] = &unk_1E87619C8;
  v17 = v8;
  v20 = v17;
  v21 = self;
  v18 = v9;
  v22 = v18;
  v23 = a4;
  _brc_ipc_check_url_access(client, (const char *)1, (uint64_t)v17, 1, 0, (uint64_t)v19);

  __brc_leave_section(v24);
}

void __75__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_options_gatherReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]_block_invoke", 31, v17);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v15 = v17[0];
    objc_msgSend(*(id *)(a1 + 32), "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx watching '%@'%@", buf, 0x20u);

  }
  if (v6)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = (uint64_t)v11;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed watching %@ - %@%@", buf, 0x20u);

    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "watchItemAtURL:lookup:options:gatherReply:", *(_QWORD *)(a1 + 32), v5, *(unsigned __int16 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  __brc_leave_section(v17);

}

- (void)watchItemAtURL:(id)a3 lookup:(id)a4 options:(unsigned __int16)a5 gatherReply:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSSet *v33;
  NSSet *watchedAppLibraries;
  NSSet *v35;
  NSSet *watchedAppLibraryIDs;
  OS_dispatch_group *v37;
  OS_dispatch_group *gatherGroup;
  void *v39;
  char v40;
  void *v41;
  id (__cdecl *v42)(NSError *, SEL);
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  _QWORD *v47;
  int watchKind;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  BRCDataOrDocsScopeGatherer *v53;
  unint64_t initialGatherMaxRank;
  uint64_t v55;
  BRCDataOrDocsScopeGatherer *v56;
  BRCDataOrDocsScopeGatherer *gatherer;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  OS_dispatch_queue *queue;
  uint64_t v62;
  _QWORD *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  unsigned __int16 v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[5];
  id v74;
  _BYTE *v75;
  uint64_t v76;
  _QWORD v77[4];
  void (**v78)(id, void *);
  _BYTE *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, void *);
  void *v84;
  _BYTE *v85;
  id v86;
  _QWORD block[6];
  id v88;
  _BYTE *v89;
  id v90;
  _QWORD v91[5];
  id v92;
  BRCNotificationPipe *v93;
  id v94;
  _BYTE *v95;
  id v96;
  id location;
  _QWORD v98[4];
  id v99;
  _BYTE buf[32];
  __int128 v101;
  void *v102;
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  if (!self->_watchKind)
  {
    v69 = a5;
    objc_msgSend(v10, "relpath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "appLibraryID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || !v70)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v10;
        LOWORD(v101) = 2112;
        *(_QWORD *)((char *)&v101 + 2) = v22;
        _os_log_error_impl(&dword_1CBD43000, v23, (os_log_type_t)0x90u, "[ERROR] %@: Invalid watched app library (%@) for lookup: %@%@", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v71);
      goto LABEL_28;
    }
    v103[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relpath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "exists");

    if (v17)
    {
      -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
      objc_msgSend(v10, "relpath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileObjectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v19);

      objc_msgSend(v10, "byIDLocalItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "itemGlobalID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v21);

    }
    else
    {
      objc_msgSend(v10, "faultedRelpath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "exists");

      if (v25)
      {
        -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
        objc_msgSend(v10, "faultedRelpath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fileObjectID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v27);

        objc_msgSend(v10, "faultedLocalItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "itemGlobalID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v29);

      }
      else
      {
        objc_msgSend(v10, "filename");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", v30);

        objc_msgSend(v10, "parentRelpath");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fileObjectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v32);

        -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", 0);
      }
    }
    -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
    self->_watchItemOptions = v69;
    v33 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v71);
    watchedAppLibraries = self->_watchedAppLibraries;
    self->_watchedAppLibraries = v33;

    v35 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v68);
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    self->_watchedAppLibraryIDs = v35;

    v37 = (OS_dispatch_group *)dispatch_group_create();
    gatherGroup = self->_gatherGroup;
    self->_gatherGroup = v37;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__22;
    *(_QWORD *)&v101 = __Block_byref_object_dispose__22;
    *((_QWORD *)&v101 + 1) = 0;
    objc_initWeak(&location, self);
    objc_msgSend(v10, "byIDLocalItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v69;
    v41 = v39;
    v42 = -[NSError _brc_cloudKitPluginErrorPayload];
    v65 = v39;
    if (!self->_watchedAncestorFileObjectID || !objc_msgSend(v39, "isDirectory"))
    {
LABEL_23:
      v52 = 7;
      if ((v40 & 4) == 0)
        v52 = 5;
      v67 = v52;
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      v53 = [BRCDataOrDocsScopeGatherer alloc];
      initialGatherMaxRank = self->_initialGatherMaxRank;
      v81 = MEMORY[0x1E0C809B0];
      v82 = *((_QWORD *)v42 + 318);
      v55 = v82;
      v83 = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9;
      v84 = &unk_1E875FF28;
      objc_copyWeak(&v86, &location);
      v85 = buf;
      v56 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v53, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v71, 1, initialGatherMaxRank, 0, &v81);
      gatherer = self->_gatherer;
      self->_gatherer = v56;

      self->_watchKind = 33;
      v58 = self->_gatherGroup;
      -[BRCNotificationPipe queue](self, "queue");
      v59 = objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = v55;
      v77[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10;
      v77[3] = &unk_1E875FF50;
      objc_copyWeak(&v80, &location);
      v78 = v11;
      v79 = buf;
      dispatch_group_notify(v58, v59, v77);

      if ((v69 & 8) != 0)
      {
        -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCDataOrDocsScopeGatherer setGatheredChildrenItemGlobalID:](self->_gatherer, "setGatheredChildrenItemGlobalID:", v60);

      }
      queue = self->_queue;
      v62 = MEMORY[0x1E0C809B0];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = v55;
      v73[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_11;
      v73[3] = &unk_1E875FFA0;
      v73[4] = self;
      v75 = buf;
      v76 = v67;
      v74 = v72;
      v63 = v73;
      v98[0] = v62;
      v98[1] = v55;
      v98[2] = __brc_dispatch_async_autorelease_block_invoke_0;
      v98[3] = &unk_1E875FD48;
      v99 = v63;
      v64 = queue;
      dispatch_async(v64, v98);

      objc_destroyWeak(&v80);
      objc_destroyWeak(&v86);

      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

LABEL_28:
      goto LABEL_29;
    }
    objc_msgSend(v41, "clientZone");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v69 & 4) != 0)
    {
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      objc_msgSend(v43, "db");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "serialQueue");
      v50 = objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke;
      v91[3] = &unk_1E87619F0;
      v51 = v43;
      v47 = v91;
      v66 = v51;
      v91[4] = v51;
      v92 = v41;
      v93 = self;
      objc_copyWeak(&v96, &location);
      v95 = buf;
      v94 = v14;
      dispatch_async(v50, v91);

      objc_destroyWeak(&v96);
    }
    else
    {
      if ((v69 & 2) == 0)
      {
LABEL_22:

        v40 = v69;
        v42 = -[NSError _brc_cloudKitPluginErrorPayload];
        goto LABEL_23;
      }
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      objc_msgSend(v43, "db");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "serialQueue");
      v45 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3;
      block[3] = &unk_1E8761A18;
      v46 = v43;
      v47 = block;
      v66 = v46;
      block[4] = v46;
      block[5] = self;
      objc_copyWeak(&v90, &location);
      v89 = buf;
      v88 = v14;
      dispatch_async(v45, block);

      objc_destroyWeak(&v90);
    }

    v43 = v66;
    goto LABEL_22;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    watchKind = self->_watchKind;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = watchKind;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v12;
    _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 37);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v14);
LABEL_29:

}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  id v15;
  id v16;
  id location;

  v2 = (id *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v4, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2();

    objc_msgSend(v5, "beginObservingChanges");
    v8 = *(id *)(a1 + 48);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 192), "addObject:", v5);
    objc_sync_exit(v8);

    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3;
    v13[3] = &unk_1E875FED8;
    objc_copyWeak(&v15, (id *)(a1 + 72));
    objc_copyWeak(&v16, &location);
    v12 = *(_OWORD *)(a1 + 56);
    v9 = (id)v12;
    v14 = v12;
    objc_msgSend(v5, "addRecursiveDirectoryListCompletionBlock:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_1(v2, (uint64_t)v10, v11);

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 80));
  }

}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[24], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2;
    v15[3] = &unk_1E875F878;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x1E0C809B0], 3221225472, __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2, &unk_1E875F878, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  _QWORD v16[5];
  __int128 v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v3, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2();

    objc_msgSend(v4, "beginObservingChangesWithDelegate:", *(_QWORD *)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 144));
    v8 = WeakRetained == 0;

    if (!v8)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3_cold_1((uint64_t)v13, v14);

    }
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 144), v4);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_6;
    v16[3] = &unk_1E875FF78;
    objc_copyWeak(&v18, (id *)(a1 + 64));
    v16[4] = *(_QWORD *)(a1 + 40);
    v15 = *(_OWORD *)(a1 + 48);
    v9 = (id)v15;
    v17 = v15;
    objc_msgSend(v4, "addDirectoryListCompletionBlock:", v16);

    objc_destroyWeak(&v18);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not create ListDirectoryContentsOperation for %@%@", buf, 0x16u);

    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 80));
  }

}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "brc_isIgnorableListDirectoryError"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v17 = WeakRetained[6];
        *(_DWORD *)buf = 138412802;
        v20 = v17;
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v5;
        _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring list error %@ - %@%@", buf, 0x20u);
      }

      v3 = 0;
    }
    v7 = WeakRetained;
    objc_sync_enter(v7);
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_storeWeak(v7 + 18, 0);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    objc_sync_exit(v7);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7;
    v18[3] = &unk_1E875F878;
    v15 = a1 + 40;
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "description", MEMORY[0x1E0C809B0], 3221225472, __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7, &unk_1E875F878, v7, *(_QWORD *)(v15 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v18, v14, v16);

  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_group_t *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    dispatch_group_leave(v6[10]);
    objc_sync_exit(v6);

  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = *(id *)(v2 + 184);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v28;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v28 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "notificationPipe:willObserveAppLibrary:", *(_QWORD *)(a1 + 32), v7);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v4);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "registerAppLibraries:forFlags:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), *(_QWORD *)(a1 + 56));
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorFileObjectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorItemGlobalID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorFilenameToItem");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = &stru_1E8769030;
      *(_DWORD *)buf = 138413570;
      if (v23)
        v25 = (const __CFString *)v23;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: started watching children of %@ (fsid:%@ id:%@ filename:%@)%@", buf, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
  }
  else
  {
    obj = (id)v2;
    objc_sync_enter(obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      v13 = v12;
      v14 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 72);
    *(_QWORD *)(v17 + 72) = 0;

    objc_sync_exit(obj);
  }
}

- (void)watchItemInProcessAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  const char *label;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  BRCNotificationPipe *v29;
  id v30;
  unsigned __int16 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE block[24];
  void *v35;
  NSObject *v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[BRCNotificationManager session](self->_manager, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__BRCNotificationPipe_LegacyAdditions__watchItemInProcessAtURL_options_gatherReply___block_invoke;
  v26[3] = &unk_1E8761A40;
  v14 = v8;
  v27 = v14;
  v15 = v10;
  v28 = v15;
  v16 = v9;
  v29 = self;
  v30 = v16;
  v31 = a4;
  v17 = v12;
  v18 = v26;
  v19 = (void *)MEMORY[0x1D17A6BE8]();
  v32 = 0uLL;
  v33 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v32);
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v25 = v32;
    label = dispatch_queue_get_label(v17);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v25;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v35 = v20;
    _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v38 = v32;
  v39 = v33;
  *(_QWORD *)block = v13;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_11;
  v35 = &unk_1E875D578;
  v22 = v17;
  v36 = v22;
  v23 = v18;
  v37 = v23;
  dispatch_async(v22, block);

  objc_autoreleasePoolPop(v19);
}

void __84__BRCNotificationPipe_LegacyAdditions__watchItemInProcessAtURL_options_gatherReply___block_invoke(uint64_t a1)
{
  BRCURLToItemLookup *v2;
  BOOL v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
  v10 = 0;
  v3 = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v2, "resolveAndKeepOpenWithError:", &v10);
  v4 = v10;
  if (v3)
  {
    if (v2)
      objc_msgSend(*(id *)(a1 + 48), "watchItemAtURL:lookup:options:gatherReply:", *(_QWORD *)(a1 + 32), v2, *(unsigned __int16 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing container: %@%@", buf, 0x20u);

    }
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  -[BRCURLToItemLookup closePaths](v2, "closePaths");

}

- (void)_flushProgressUpdates
{
  BRItemNotificationReceiving *receiver;
  void *v4;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_hasProgressUpdatesInFlight)
  {
    if (-[NSMutableDictionary count](self->_pendingProgressUpdatesByID, "count"))
    {
      self->_hasProgressUpdatesInFlight = 1;
      voucher_adopt();
      receiver = self->_receiver;
      -[NSMutableDictionary allValues](self->_pendingProgressUpdatesByID, "allValues");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke;
      v5[3] = &unk_1E875D500;
      v5[4] = self;
      -[BRItemNotificationReceiving receiveProgressUpdates:reply:](receiver, "receiveProgressUpdates:reply:", v4, v5);

      -[NSMutableDictionary removeAllObjects](self->_pendingProgressUpdatesByID, "removeAllObjects");
    }
  }
}

void __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  const char *label;
  _QWORD v17[5];
  uint64_t v18[3];
  __int128 v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) _flushProgressUpdates]_block_invoke", 269, v18);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v18[0];
    *(_WORD *)&block[12] = 2112;
    *(_QWORD *)&block[14] = v14;
    *(_WORD *)&block[22] = 2112;
    v22 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: received progress acknowledgement%@", block, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke_14;
  v17[3] = &unk_1E875D500;
  v17[4] = v4;
  v7 = v5;
  v8 = v17;
  v9 = (void *)MEMORY[0x1D17A6BE8]();
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v19);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = v19;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v15;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v25 = v19;
  v26 = v20;
  *(_QWORD *)block = v6;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke_1;
  v22 = &unk_1E875D578;
  v12 = v7;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  dispatch_async(v12, block);

  objc_autoreleasePoolPop(v9);
  __brc_leave_section(v18);
}

uint64_t __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke_14(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_flushProgressUpdates");
}

- (void)_processProgressUpdates:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int watchItemOptions;
  int v12;
  NSSet *watchedAppLibraries;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  BRCNotificationPipe *v25;
  _QWORD *v26;
  int v27;
  _QWORD v28[3];
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_receiver && self->_watchKind)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isFolderOrAliasID"),
          v7,
          v6,
          v8))
    {
      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "folderID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      watchItemOptions = self->_watchItemOptions;
      if ((watchItemOptions & 4) != 0)
        v12 = 0x7FFFFFFF;
      else
        v12 = (watchItemOptions >> 1) & 1;
    }
    else
    {
      watchedAppLibraries = self->_watchedAppLibraries;
      if (watchedAppLibraries)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = watchedAppLibraries;
        v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "fileID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v18);

            }
            v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v15);
        }

        v12 = 0x7FFFFFFF;
      }
      else
      {
        v12 = 0;
      }
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __64__BRCNotificationPipe_LegacyAdditions___processProgressUpdates___block_invoke;
    v23 = &unk_1E8761A68;
    v19 = v5;
    v25 = self;
    v26 = v28;
    v27 = v12;
    v24 = v19;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v20);
    -[BRCNotificationPipe _flushProgressUpdates](self, "_flushProgressUpdates", v20, v21, v22, v23);

    _Block_object_dispose(v28, 8);
  }

}

void __64__BRCNotificationPipe_LegacyAdditions___processProgressUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "parentFileIDs", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_DWORD *)(a1 + 56);
          if (v14 != 0x7FFFFFFF)
          {
            if (v11 > v14)
              goto LABEL_16;
            ++v11;
          }
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_16:

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)processProgressUpdates:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__BRCNotificationPipe_LegacyAdditions__processProgressUpdates___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __63__BRCNotificationPipe_LegacyAdditions__processProgressUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processProgressUpdates:", *(_QWORD *)(a1 + 40));
}

- (void)addNotification:asDead:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[NOTIF] stripped sharing info for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Update is \"Documents\", discarding: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Update is a directory, discarding %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Update is a fault, discarding %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (dead item) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (reparented) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (itemID match) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _watchKind & WATCH_ITEM%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (below a Documents/ folder) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (not below a Documents/ folder) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (below a .Trash/ folder) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (moved out library scope) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.13()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (watching containers) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.14()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (watching containers) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.15()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (parentObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.16()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (oldParentFileObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.18()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (fileObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.20()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Update is in the trash, discarding %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.21()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing INSIDE (in the scope) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:.cold.22()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Queueing OUTSIDE (moved out library scope) notification: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.23(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "watchedAncestorItemGlobalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning itemID for our ancestor: %@%@", (uint8_t *)&v6, 0x16u);

}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.24(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "watchedAncestorItemGlobalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "oldWatchedAncestorItemGlobalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = a2;
  OUTLINED_FUNCTION_8_1(&dword_1CBD43000, a3, v8, "[NOTIF] Learning path-match for %@ (was %@)%@", (uint8_t *)&v9);

}

- (void)_isInterestingUpdate:.cold.25()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Ancestor isn't resolved yet, discarding %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForSecondGatherWithRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_gatherer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareForSecondGatherWithRank:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[NOTIF] doing the second phase gathering%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[NOTIF] Finished second phase gathering%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)processUpdates:withRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[NOTIF] dropping all updates%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)processUpdates:(NSObject *)a3 withRank:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[NOTIF] dropping %ld updates%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_8_1(&dword_1CBD43000, a3, (uint64_t)a3, "[NOTIF] Waiting for notification flush for %@ in %@%@", (uint8_t *)&v5);
}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to wait for faulting to complete - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)watchScopes:trustedAppLibraryIDs:gatherReply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] %@: Unable to resolve scopes%@");
  OUTLINED_FUNCTION_2();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[NOTIF] Could not create RecursiveListDirectoryContentsOperation for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Waiting for group for list op %@%@");
  OUTLINED_FUNCTION_2();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_133_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Finished normal gather phase for %@%@");
  OUTLINED_FUNCTION_2();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_134_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Calling gather reply callback for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_watchItem:options:gatherReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Invalid notification pipe setup%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_watchItem:options:gatherReply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_listOp%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Finished waiting on gather group for %@%@");
  OUTLINED_FUNCTION_2();
}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] App library %@ not installed, not waiting for gathering to finish%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not create RecursiveListDirectoryContentsOperation for %@%@", (uint8_t *)&v6, 0x16u);

}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Waiting on gather group for %@%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !self->_listOp%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Finished normal gather phase for %@%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Finished waiting on gather group for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
