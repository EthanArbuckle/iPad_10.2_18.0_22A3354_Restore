@implementation _CADFetchCalendarItemsWithPredicateOperation

+ (id)performSynchronouslyWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 cancellationToken:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CADFetchedObjectSerializer *v14;
  void *v15;
  void *v16;
  CADFetchedObjectSerializer *v17;
  uint64_t v18;
  id v19;
  id v20;
  CADFetchedObjectSerializer *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  CADFetchedObjectSerializer *v46;
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v10, "databasesToQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [CADFetchedObjectSerializer alloc];
  objc_msgSend(v10, "defaultPropertiesToLoad");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relatedObjectPropertiesToLoad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CADFetchedObjectSerializer initWithConnection:defaultPropertiesToLoad:relatedObjectPropertiesToLoad:](v14, "initWithConnection:defaultPropertiesToLoad:relatedObjectPropertiesToLoad:", v11, v15, v16);

  v18 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke;
  v43[3] = &unk_1E6A372C8;
  v48 = a1;
  v19 = v10;
  v44 = v19;
  v20 = v11;
  v45 = v20;
  v21 = v17;
  v46 = v21;
  v22 = v12;
  v47 = v22;
  v23 = (void *)MEMORY[0x1BCC9D8DC](v43);
  v24 = v23;
  if (v13)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v26)
    {
      v27 = v26;
      v33 = v22;
      v34 = v19;
      v28 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          v30 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "intValue");
          v35[0] = v18;
          v35[1] = 3221225472;
          v35[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_3;
          v35[3] = &unk_1E6A36CA8;
          v36 = v24;
          objc_msgSend(v20, "withDatabaseID:perform:", v30, v35);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v27);
      v19 = v34;
      v22 = v33;
    }
  }
  else
  {
    v41[0] = v18;
    v41[1] = 3221225472;
    v41[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_2;
    v41[3] = &unk_1E6A37170;
    v42 = v23;
    objc_msgSend(v20, "withAllDatabasesPerform:", v41);
    v25 = v42;
  }

  if ((objc_msgSend(v22, "isCancelled") & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    -[CADFetchedObjectSerializer fetchedObjectWrappers](v21, "fetchedObjectWrappers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

+ (void)queryDatabase:(CalDatabase *)a3 withID:(int)a4 predicate:(id)a5 connection:(id)a6 serializer:(id)a7 cancellationToken:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  id v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v11 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if ((objc_msgSend(v17, "isCancelled") & 1) == 0)
  {
    v18 = os_signpost_id_generate((os_log_t)CADPredicateSignpostsHandle);
    v19 = (id)CADPredicateSignpostsHandle;
    v20 = v19;
    v21 = v18 - 1;
    v41 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138412546;
      v48 = (id)objc_opt_class();
      v49 = 1024;
      v50 = v11;
      v22 = v48;
      _os_signpost_emit_with_name_impl(&dword_1B6A18000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PredicateFetch", "class=%@, dbid=%i", buf, 0x12u);

      v21 = v18 - 1;
    }

    if (objc_msgSend(v15, "eventAccessLevel") == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "restrictedCalendarRowIDsForAction:inDatabase:", 0, a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setRestrictedCalendarRowIDs:forDatabaseID:", v23, v11);

      }
      v24 = (void *)objc_msgSend(v14, "copyMatchingItemsWithDatabase:", a3);
    }
    else
    {
      v24 = 0;
    }
    v25 = (id)CADPredicateSignpostsHandle;
    v26 = v25;
    spid = v18;
    v40 = v15;
    if (v21 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v28 = (id)CADPredicateSignpostsHandle;
    }
    else
    {
      if (os_signpost_enabled(v25))
      {
        v27 = (void *)objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134217984;
        v48 = v27;
        _os_signpost_emit_with_name_impl(&dword_1B6A18000, v26, OS_SIGNPOST_INTERVAL_END, v18, "PredicateFetch", "results.count = %lu", buf, 0xCu);
      }

      v28 = (id)CADPredicateSignpostsHandle;
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6A18000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v18, "WrapResults", (const char *)&unk_1B6A8E55D, buf, 2u);
      }
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v24;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x1BCC9D714]();
          if ((objc_msgSend(v17, "isCancelled") & 1) != 0)
          {
            objc_autoreleasePoolPop(v35);
            goto LABEL_28;
          }
          if ((objc_msgSend(a1, "isJunkEvent:", v34) & 1) == 0)
            v36 = (id)objc_msgSend(v16, "addEntity:", v34);
          objc_autoreleasePoolPop(v35);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v31)
          continue;
        break;
      }
    }
LABEL_28:

    v37 = (id)CADPredicateSignpostsHandle;
    v38 = v37;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6A18000, v38, OS_SIGNPOST_INTERVAL_END, spid, "WrapResults", (const char *)&unk_1B6A8E55D, buf, 2u);
    }

    v15 = v40;
  }

}

+ (BOOL)isJunkEvent:(void *)a3
{
  uint64_t Event;
  CFTypeID v4;

  Event = (uint64_t)a3;
  v4 = CFGetTypeID(a3);
  if (v4 == CalEventOccurrenceGetTypeID())
    Event = CalEventOccurrenceGetEvent();
  return Event && CalEventGetJunkStatus() == 1;
}

- (_CADFetchCalendarItemsWithPredicateOperation)initWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  _CADFetchCalendarItemsWithPredicateOperation *v16;
  _CADFetchCalendarItemsWithPredicateOperation *v17;
  uint64_t v18;
  id completion;
  objc_super v21;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_CADFetchCalendarItemsWithPredicateOperation;
  v16 = -[_CADFetchCalendarItemsWithPredicateOperation init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_predicate, a3);
    v17->_entityType = a4;
    objc_storeStrong((id *)&v17->_connection, a5);
    v17->_fetchIdentifier = a6;
    v18 = MEMORY[0x1BCC9D8DC](v15);
    completion = v17->_completion;
    v17->_completion = (id)v18;

  }
  return v17;
}

- (void)main
{
  id v3;

  if ((-[_CADFetchCalendarItemsWithPredicateOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "performSynchronouslyWithPredicate:entityType:connection:fetchIdentifier:cancellationToken:", self->_predicate, self->_entityType, self->_connection, self->_fetchIdentifier, self);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((-[_CADFetchCalendarItemsWithPredicateOperation isCancelled](self, "isCancelled") & 1) == 0)
      (*((void (**)(void))self->_completion + 2))();

  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CADFetchCalendarItemsWithPredicateOperation;
  -[_CADFetchCalendarItemsWithPredicateOperation cancel](&v3, sel_cancel);
  (*((void (**)(void))self->_completion + 2))();
}

- (int)fetchIdentifier
{
  return self->_fetchIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
