@implementation _CDInMemoryContext

- (id)propertiesForContextualKeyPath:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___CDInMemoryContext_propertiesForContextualKeyPath___block_invoke;
  block[3] = &unk_1E26D4E28;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)unsafe_setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  unint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _CDContextValue *v18;
  void *v19;
  void *v20;
  _CDContextValue *v21;
  _BYTE v23[22];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore setObject:forContextualKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)v23);
  os_activity_scope_leave((os_activity_scope_state_t)v23);

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend((id)v6, "conformsToProtocol:", &unk_1EE0D8EA8))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
    }
    else
    {
      _CDRedactedObjectForKeyPath(v7, (void *)v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138543618;
    *(_QWORD *)&v23[4] = v7;
    *(_WORD *)&v23[12] = 2112;
    *(_QWORD *)&v23[14] = v11;
    _os_log_impl(&dword_18DD73000, v9, OS_LOG_TYPE_INFO, "Setting value for %{public}@: %@", v23, 0x16u);

  }
  objc_msgSend(v7, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _cdcontextstore_signpost_set_object_begin();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v6 | v15)
  {
    if (!v6 || !v15 || !objc_msgSend((id)v6, "isEqual:", v15))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = v7;
      _os_log_impl(&dword_18DD73000, v17, OS_LOG_TYPE_INFO, "Setting value for %{public}@ is equal to previous value", v23, 0xCu);
    }

    if ((objc_msgSend(v7, "isEphemeral") & 1) == 0)
    {
      _cdcontextstore_signpost_set_object_end();
      v21 = v14;
    }
    else
    {
LABEL_13:
      v18 = objc_alloc_init(_CDContextValue);
      v19 = (void *)objc_msgSend((id)v6, "copy");
      -[_CDContextValue setValue:](v18, "setValue:", v19);

      -[_CDContextValue setLastModifiedDate:](v18, "setLastModifiedDate:", v13);
      if (!v14)
      {
        -[_CDContextValue metadata](v18, "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_CDContextMetadataKeyFirstValueAfterReboot"));

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v18, v7);
      v21 = v18;
      -[_CDInMemoryContext unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:](self, "unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:", v14, v13, v7);
      _cdcontextstore_signpost_set_object_end();

    }
  }
  else
  {
    _cdcontextstore_signpost_set_object_end();
    v21 = 0;
  }

  return v21;
}

- (id)unsafe_evaluatedContextWithRegistration:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _CDContextValue *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _CDContextValue *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v8 = (void *)-[NSMutableDictionary mutableCopy](self->_context, "mutableCopy");
  v9 = objc_alloc_init(_CDContextValue);
  -[_CDContextValue setValue:](v9, "setValue:", v7);
  -[_CDContextValue setLastModifiedDate:](v9, "setLastModifiedDate:", v7);
  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(v6, "locationManagerEffectiveBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_CDInMemoryContext locationRegistrationMonitor](self, "locationRegistrationMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "regionInfosForRegistration:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(_CDContextValue);
    -[_CDContextValue setValue:](v14, "setValue:", v13);
    -[_CDContextValue setLastModifiedDate:](v14, "setLastModifiedDate:", v7);
    +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

  }
  v16 = (void *)objc_msgSend(v8, "copy");

  return v16;
}

- (void)unsafe_evalutateRegistrationPredicate:(id)a3 previousContextValue:(id)a4 date:(id)a5 keyPath:(id)a6
{
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  int v43;
  id v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t j;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  __CFString **v85;
  void *v86;
  void *v87;
  dispatch_qos_class_t v88;
  NSObject *callbackWorkloop;
  id v90;
  dispatch_block_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  _CDInMemoryContext *v101;
  void *v102;
  void *v103;
  _QWORD block[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v101 = self;
  -[_CDInMemoryContext unsafe_evaluatedContextWithRegistration:date:](self, "unsafe_evaluatedContextWithRegistration:date:", v10, v12);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqual:", v15);

  v100 = (void *)v14;
  if ((v16 & 1) == 0)
  {
    if (!(v11 | v14)
      || v11
      && v14
      && (objc_msgSend((id)v14, "value"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v11, "value"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "isEqual:", v21),
          v21,
          v20,
          v22))
    {
      objc_msgSend(v10, "predicate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "evaluateOnEveryKeyPathUpdate");

      if (!v18)
        goto LABEL_59;
      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:].cold.2(v19);

    }
  }
  objc_msgSend(v10, "predicate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "firesOnAnyChange");

  v102 = v13;
  if ((v24 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v10, "predicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "keyPaths");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v115;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v115 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(v103, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v44 = v34;
          v13 = v102;
          goto LABEL_58;
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
      if (v36)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "predicate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  v42 = v16 ? 0 : (id)v11;
  v43 = objc_msgSend(v40, "evaluateWithState:previousValue:", v103, v42);

  v13 = v102;
  if (v43)
  {
LABEL_11:
    if ((v16 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:].cold.1((uint64_t)v10, v25, v26, v27, v28, v29, v30, v31);

      -[_CDInMemoryContext unsafe_deregisterCallback:](v101, "unsafe_deregisterCallback:", v10);
    }
    else
    {
      objc_msgSend(v10, "predicate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "minimumDurationInPreviousState");
      v47 = v46;

      if (v11 && v47 > 2.22507386e-308)
      {
        objc_msgSend((id)v11, "lastModifiedDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48
          || (objc_msgSend((id)v11, "metadata"),
              v49 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("_CDContextMetadataKeyFirstValueAfterReboot")),
              v50 = (void *)objc_claimAutoreleasedReturnValue(),
              v51 = objc_msgSend(v50, "BOOLValue"),
              v50,
              v49,
              v51))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v52 = objc_claimAutoreleasedReturnValue();

          v48 = (void *)v52;
        }
        objc_msgSend(v12, "timeIntervalSinceDate:", v48);
        v54 = v53;
        objc_msgSend(v10, "predicate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "minimumDurationInPreviousState");
        v57 = v56;

        if (v54 < v57)
          goto LABEL_59;
      }
    }
    objc_msgSend(v10, "informativeCallback");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v97 = v12;
      v59 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v10, "predicate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "keyPaths");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "dictionaryWithCapacity:", objc_msgSend(v61, "count") + 4);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = (void *)v11;
      v63 = (void *)objc_msgSend((id)v11, "copy");
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, CFSTR("OldValue"));

      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v99 = v10;
      objc_msgSend(v10, "predicate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "keyPaths");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
      if (v66)
      {
        v67 = v66;
        v68 = 0;
        v69 = *(_QWORD *)v111;
        do
        {
          for (j = 0; j != v67; ++j)
          {
            if (*(_QWORD *)v111 != v69)
              objc_enumerationMutation(v65);
            v71 = *(id *)(*((_QWORD *)&v110 + 1) + 8 * j);
            objc_msgSend(v103, "objectForKeyedSubscript:", v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "deviceID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v73)
            {
              v74 = (void *)objc_msgSend(v71, "copy");

              objc_msgSend(v74, "setDeviceID:", v101->_deviceID);
              v71 = v74;
            }
            v75 = (void *)objc_msgSend(v72, "copy");

            if (objc_msgSend(v71, "isEqual:", v102))
            {
              objc_msgSend(v102, "deviceID");
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (v76)
              {
                v77 = (void *)objc_msgSend(v71, "copy");

                objc_msgSend(v102, "deviceID");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "setDeviceID:", v78);

                v71 = v77;
              }
              objc_msgSend(v62, "setObject:forKeyedSubscript:", v71, CFSTR("KeyPath"));
              objc_msgSend(v62, "setObject:forKeyedSubscript:", v75, CFSTR("NewValue"));
              v79 = v75;

              v68 = v79;
            }
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v75, v71);

          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
        }
        while (v67);
      }
      else
      {
        v68 = 0;
      }

      v11 = (unint64_t)v98;
      if (v98)
      {
        objc_msgSend(v98, "value");
        v80 = objc_claimAutoreleasedReturnValue();
        v10 = v99;
        if (!v80)
          goto LABEL_54;
        v81 = (void *)v80;
        objc_msgSend(v98, "value");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "isEqual:", v83);

        if ((v84 & 1) == 0)
        {
          if (v68)
          {
            objc_msgSend(v68, "value");
            v92 = objc_claimAutoreleasedReturnValue();
            v85 = _CDInformativeContextualChangeRemoval;
            if (v92)
            {
              v93 = (void *)v92;
              objc_msgSend(v68, "value");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend(v94, "isEqual:", v95);

              if (!v96)
                v85 = _CDInformativeContextualChangeReplacement;
            }
          }
          else
          {
            v85 = _CDInformativeContextualChangeRemoval;
          }
        }
        else
        {
LABEL_54:
          v85 = _CDInformativeContextualChangeInsertion;
        }
      }
      else
      {
        v85 = _CDInformativeContextualChangeInsertion;
        v10 = v99;
      }
      objc_msgSend(v62, "setObject:forKeyedSubscript:", *v85, CFSTR("Kind"));
      v58 = (void *)objc_msgSend(v62, "copy");

      v12 = v97;
      v13 = v102;
    }
    objc_msgSend(v10, "callback");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)os_transaction_create();
    v88 = objc_msgSend(v10, "qualityOfService");
    callbackWorkloop = v101->_callbackWorkloop;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94___CDInMemoryContext_unsafe_evalutateRegistrationPredicate_previousContextValue_date_keyPath___block_invoke;
    block[3] = &unk_1E26D4F38;
    v105 = v10;
    v106 = v13;
    v107 = v58;
    v108 = v87;
    v109 = v86;
    v90 = v87;
    v34 = v86;
    v44 = v58;
    v91 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v88, -15, block);
    dispatch_async(callbackWorkloop, v91);

LABEL_58:
  }
LABEL_59:

}

- (void)unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:](self, "unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v8, v9, v10, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[_CDInMemoryContext unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:date:](self, "unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:date:", v13, v9);
}

- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _CDInMemoryContext *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = self;
  v18 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "predicate", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keyPaths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "containsObject:", v15);

        if (v16)
          -[_CDInMemoryContext unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:date:](v17, "unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:date:", v12, v18);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  syncQueue = self->_syncQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70___CDInMemoryContext_setObject_returningMetadataForContextualKeyPath___block_invoke;
  v13[3] = &unk_1E26D4E50;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(syncQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)deregisterCallback:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[4];
  id v8;
  _CDInMemoryContext *v9;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___CDInMemoryContext_deregisterCallback___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

- (void)unsafe_deregisterCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE state[22];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v5 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore Deregister", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v5, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  objc_msgSend(v4, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend(v4, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)state = 138543618;
    *(_QWORD *)&state[4] = v9;
    *(_WORD *)&state[12] = 2112;
    *(_QWORD *)&state[14] = v10;
    _os_log_impl(&dword_18DD73000, v7, OS_LOG_TYPE_INFO, "Deregistering callback for client: %{public}@, registration: %@", state, 0x16u);

  }
  else
  {
    if (!v8)
      goto LABEL_7;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)state = 138412290;
    *(_QWORD *)&state[4] = v9;
    _os_log_impl(&dword_18DD73000, v7, OS_LOG_TYPE_INFO, "Deregistering callback for registration: %@", state, 0xCu);
  }

LABEL_7:
  objc_msgSend(v4, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v18, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObject:", v4);

        +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if (v21)
          -[_CDInMemoryContext unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:](self, "unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:", v4);
        +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v18, "isEqual:", v22);

        if (v23)
        {
          -[_CDInMemoryContext locationRegistrationMonitor](self, "locationRegistrationMonitor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeRegistration:", v4);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

- (id)unsafe_addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  BOOL *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (a6)
    *a6 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count") && !objc_msgSend(v11, "count"))
    goto LABEL_33;
  if (!v13)
    goto LABEL_8;
  objc_msgSend(v13, "value");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        objc_msgSend(v13, "value"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        v15,
        (isKindOfClass & 1) != 0))
  {
LABEL_8:
    v38 = v12;
    objc_msgSend(v13, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v19, "count"))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v20 = v11;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v19, "removeObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v22);
      }

    }
    v37 = a6;
    v25 = v11;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = v10;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          if ((objc_msgSend(v19, "containsObject:", v31, v37) & 1) == 0)
            objc_msgSend(v19, "addObject:", v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v28);
    }

    objc_msgSend(v13, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v19, "isEqual:", v32);

    if (v33)
    {
      v34 = v13;
      v11 = v25;
      v12 = v38;
    }
    else
    {
      v35 = (void *)objc_msgSend(v19, "copy");
      v12 = v38;
      -[_CDInMemoryContext unsafe_setObject:returningMetadataForContextualKeyPath:](self, "unsafe_setObject:returningMetadataForContextualKeyPath:", v35, v38);
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v25;
      if (v37)
        *v37 = 1;
    }

  }
  else
  {
LABEL_33:
    v34 = v13;
  }

  return v34;
}

- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *syncQueue;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  syncQueue = self->_syncQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84___CDInMemoryContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_valueDidChange___block_invoke;
  v19[3] = &unk_1E26D4EA0;
  v23 = &v29;
  v19[4] = self;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v24 = &v25;
  dispatch_sync(syncQueue, v19);
  if (a6)
    *a6 = *((_BYTE *)v26 + 24);
  v17 = (id)v30[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (_CDInMemoryContext)init
{
  _CDInMemoryContext *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *syncQueue;
  uint64_t v6;
  NSMutableDictionary *context;
  dispatch_workloop_t v8;
  OS_dispatch_workloop *callbackWorkloop;
  uint64_t v10;
  NSMutableDictionary *registrations;
  uint64_t v12;
  _CDSystemTimeCallbackScheduler *systemTimeCallbackScheduler;
  void *v14;
  _CDContextualLocationRegistrationMonitor *v15;
  _CDContextualLocationRegistrationMonitor *locationRegistrationMonitor;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_CDInMemoryContext;
  v2 = -[_CDInMemoryContext init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cdcontext.inmemorycontext", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (NSMutableDictionary *)v6;

    v8 = dispatch_workloop_create("com.apple.cdcontext.inmemorycontext");
    callbackWorkloop = v2->_callbackWorkloop;
    v2->_callbackWorkloop = (OS_dispatch_workloop *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v10;

    +[_CDSystemTimeCallbackScheduler sharedInstance](_CDSystemTimeCallbackScheduler, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    systemTimeCallbackScheduler = v2->_systemTimeCallbackScheduler;
    v2->_systemTimeCallbackScheduler = (_CDSystemTimeCallbackScheduler *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel_receiveSystemTimeCallback_, CFSTR("_CDSystemTimeCallbackNotification"), v2->_systemTimeCallbackScheduler);

    v15 = objc_alloc_init(_CDContextualLocationRegistrationMonitor);
    locationRegistrationMonitor = v2->_locationRegistrationMonitor;
    v2->_locationRegistrationMonitor = v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_locationCoordinatorCircularRegionsDidChange_, CFSTR("_CDCircularRegionsForRegistrationDidChangeNotification"), v2->_locationRegistrationMonitor);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_CDSystemTimeCallbackNotification"), self->_systemTimeCallbackScheduler);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_CDCircularRegionsForRegistrationDidChangeNotification"), self->_locationRegistrationMonitor);

  v5.receiver = self;
  v5.super_class = (Class)_CDInMemoryContext;
  -[_CDInMemoryContext dealloc](&v5, sel_dealloc);
}

+ (id)context
{
  return objc_alloc_init(_CDInMemoryContext);
}

+ (id)contextWithDeviceID:(id)a3
{
  id v3;
  _CDInMemoryContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(_CDInMemoryContext);
  -[_CDInMemoryContext setDeviceID:](v4, "setDeviceID:", v3);

  return v4;
}

- (void)locationCoordinatorCircularRegionsDidChange:(id)a3
{
  id v4;
  OS_dispatch_queue *syncQueue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _CDInMemoryContext *v14;
  _QWORD block[4];
  id v16;
  id v17;

  v4 = a3;
  syncQueue = self->_syncQueue;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66___CDInMemoryContext_locationCoordinatorCircularRegionsDidChange___block_invoke;
  v12[3] = &unk_1E26D46A8;
  v13 = v4;
  v14 = self;
  v7 = v12;
  v8 = syncQueue;
  v9 = v4;
  v10 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1E26D4F60;
  v16 = v10;
  v17 = v7;
  v11 = v10;
  dispatch_async(v8, block);

}

- (void)receiveSystemTimeCallback:(id)a3
{
  void *v4;
  _CDContextValue *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_CDSystemTimeCallbackDateKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(_CDContextValue);
  -[_CDContextValue setValue:](v5, "setValue:", v7);
  -[_CDContextValue setLastModifiedDate:](v5, "setLastModifiedDate:", v7);
  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryContext evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:](self, "evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:", v5, v7, v6);

}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___CDInMemoryContext_hasKnowledgeOfContextualKeyPath___block_invoke;
  block[3] = &unk_1E26D4E00;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (id)objectForContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *syncQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _cdcontextstore_signpost_get_object_begin();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___CDInMemoryContext_objectForContextualKeyPath___block_invoke;
  block[3] = &unk_1E26D4E28;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  v11 = v7;
  dispatch_sync(syncQueue, block);
  _cdcontextstore_signpost_get_object_end();
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___CDInMemoryContext_setContextValue_forContextualKeyPath___block_invoke;
  block[3] = &unk_1E26D4680;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(syncQueue, block);

}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  syncQueue = self->_syncQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53___CDInMemoryContext_setObject_forContextualKeyPath___block_invoke;
  v12[3] = &unk_1E26D4E50;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(syncQueue, v12);
  LOBYTE(syncQueue) = v17[5] != 0;

  _Block_object_dispose(&v16, 8);
  return (char)syncQueue;
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___CDInMemoryContext_lastModifiedDateForContextualKeyPath___block_invoke;
  block[3] = &unk_1E26D4E28;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v4;
  id v6;

  v6 = 0;
  v4 = -[_CDInMemoryContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:removedObjects:](self, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:removedObjects:", a3, a4, &v6);
  return v6;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5
{
  id v8;
  id v9;
  NSObject *syncQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___CDInMemoryContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_removedObjects___block_invoke;
  block[3] = &unk_1E26D4E78;
  block[4] = self;
  v11 = v9;
  v16 = v11;
  v18 = &v20;
  v12 = v8;
  v17 = v12;
  v19 = &v26;
  dispatch_sync(syncQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v14 = 0;
    v11 = -[_CDInMemoryContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", v8, v9, v10, &v14);
    v12 = v14 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  char v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v8 = -[_CDInMemoryContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", v6, 0, v7, &v11);
    v9 = v11 != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  char v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v8 = -[_CDInMemoryContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", 0, v6, v7, &v11);
    v9 = v11 != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addCallback:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _CDInMemoryContext *v14;

  v6 = a3;
  v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke;
  block[3] = &unk_1E26D4680;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(syncQueue, block);

}

- (void)registerCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "predicate", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_CDInMemoryContext addCallback:forKeyPath:](self, "addCallback:forKeyPath:", v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)evaluatePredicate:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  syncQueue = self->_syncQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45___CDInMemoryContext_evaluatePredicate_date___block_invoke;
  v12[3] = &unk_1E26D4EE8;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(syncQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *syncQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91___CDInMemoryContext_evalutateRegistrationPredicatesWithPreviousContextValue_date_keyPath___block_invoke;
  block[3] = &unk_1E26D4F10;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(syncQueue, block);

}

- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v8 = objc_msgSend(v6, "qualityOfService");
  objc_msgSend(v6, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v9, "timeBasedPredicateEvaluationIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v30;
    *(_QWORD *)&v11 = 138412546;
    v24 = v11;
    v25 = v10;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "startDate", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "compare:", v7);

        if (v16 != 1)
          goto LABEL_12;
        -[_CDInMemoryContext unsafe_evaluatedContextWithRegistration:date:](self, "unsafe_evaluatedContextWithRegistration:date:", v6, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "evaluateWithState:previousValue:", v17, 0) & 1) == 0)
        {

LABEL_12:
          -[_CDInMemoryContext systemTimeCallbackScheduler](self, "systemTimeCallbackScheduler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "unscheduleCallbackAtDate:identifier:requiringDeviceWake:", v14, v27, v8 > 0x18);
          goto LABEL_13;
        }
        v18 = v9;
        v19 = v7;
        v20 = v6;
        objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          _CDFormattedDate();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v34 = v23;
          v35 = 2112;
          v36 = v27;
          _os_log_debug_impl(&dword_18DD73000, v21, OS_LOG_TYPE_DEBUG, "Registering system time callback at %@ for registration %@", buf, 0x16u);

        }
        -[_CDInMemoryContext systemTimeCallbackScheduler](self, "systemTimeCallbackScheduler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scheduleCallbackAtDate:identifier:requiringDeviceWake:", v14, v27, v8 > 0x18);

        v6 = v20;
        v7 = v19;
        v9 = v18;
        v10 = v25;
LABEL_13:

      }
      v28 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v28);
  }

}

- (void)unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_CDInMemoryContext unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = objc_msgSend(v4, "qualityOfService");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v4;
    objc_msgSend(v4, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeBasedPredicateEvaluationIntervals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
          -[_CDInMemoryContext systemTimeCallbackScheduler](self, "systemTimeCallbackScheduler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "unscheduleCallbackAtDate:identifier:requiringDeviceWake:", v22, v5, v13 > 0x18);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    v4 = v23;
  }

}

- (id)allRegistrations
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38___CDInMemoryContext_allRegistrations__block_invoke;
  v9[3] = &unk_1E26D46A8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(syncQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nRegistrations: %@"), self->_context, self->_registrations);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (OS_dispatch_workloop)callbackWorkloop
{
  return self->_callbackWorkloop;
}

- (void)setCallbackWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_callbackWorkloop, a3);
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_CDContextualLocationRegistrationMonitor)locationRegistrationMonitor
{
  return self->_locationRegistrationMonitor;
}

- (void)setLocationRegistrationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_locationRegistrationMonitor, a3);
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (_CDSystemTimeCallbackScheduler)systemTimeCallbackScheduler
{
  return self->_systemTimeCallbackScheduler;
}

- (void)setSystemTimeCallbackScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_systemTimeCallbackScheduler, a3);
}

- (_CDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_systemTimeCallbackScheduler, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_locationRegistrationMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callbackWorkloop, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)unsafe_evalutateRegistrationPredicate:(uint64_t)a3 previousContextValue:(uint64_t)a4 date:(uint64_t)a5 keyPath:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18DD73000, a2, a3, "Automatically de-registering system time registration callback: %@", a5, a6, a7, a8, 2u);
}

- (void)unsafe_evalutateRegistrationPredicate:(os_log_t)log previousContextValue:date:keyPath:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEBUG, "Evaluating registration predicate even though value is same value as previous value.", v1, 2u);
}

- (void)unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18DD73000, a2, a3, "Deregistering system time callbacks for registration %@", a5, a6, a7, a8, 2u);
}

@end
