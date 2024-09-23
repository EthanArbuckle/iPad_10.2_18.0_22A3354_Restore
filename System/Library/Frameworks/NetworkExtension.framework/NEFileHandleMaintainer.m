@implementation NEFileHandleMaintainer

- (NEFileHandleMaintainer)init
{
  NEFileHandleMaintainer *v2;
  NSMutableArray *v3;
  NSMutableArray *fileHandles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFileHandleMaintainer;
  v2 = -[NEFileHandleMaintainer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fileHandles = v2->_fileHandles;
    v2->_fileHandles = v3;

  }
  return v2;
}

- (void)resetFileHandlesFromEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NEFileHandleMaintainer *v10;
  const char *v11;
  const char *v12;
  id Property;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  void (**v28)(id);
  SEL v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD applier[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1A1ACFDA4](v4);
    v7 = MEMORY[0x1E0C812F8];
    if (v6 == MEMORY[0x1E0C812F8])
    {
      xpc_dictionary_get_array(v5, "handles-array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_dictionary(v5, "aux-data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      objc_sync_enter(v10);
      if (v10 && v10->_isOwnerMode && !objc_getProperty(v10, v11, 24, 1))
      {
        ne_log_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19BD16000, v30, OS_LOG_TYPE_DEBUG, "Ignoring additional event in owner mode", buf, 2u);
        }

        objc_sync_exit(v10);
        goto LABEL_43;
      }
      if (v8 && MEMORY[0x1A1ACFDA4](v8) == MEMORY[0x1E0C812C8])
      {
        v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        if (v10)
          Property = objc_getProperty(v10, v12, 16, 1);
        else
          Property = 0;
        v14 = Property;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v38;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v17), "handle", v34);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setReadabilityHandler:", 0);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v15);
        }

        if (v10)
          objc_setProperty_atomic(v10, v19, 0, 16);
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __52__NEFileHandleMaintainer_resetFileHandlesFromEvent___block_invoke;
        applier[3] = &unk_1E3CC2300;
        v20 = v34;
        v36 = v20;
        xpc_array_apply(v8, applier);
        if (v10)
          objc_setProperty_atomic(v10, v21, v20, 16);
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[NEFileHandleMaintainer eventName](v10, "eventName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            v33 = objc_getProperty(v10, v31, 16, 1);
          else
            v33 = 0;
          *(_DWORD *)buf = 138412546;
          v42 = v32;
          v43 = 2112;
          v44 = v33;
          _os_log_debug_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEBUG, "Current file handles for %@: %@", buf, 0x16u);

        }
      }
      if (v10)
        objc_setProperty_atomic(v10, v11, 0, 32);
      if (v9 && MEMORY[0x1A1ACFDA4](v9) == v7)
      {
        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "Received an auxiliary data dictionary", buf, 2u);
        }

        if (!v10)
          goto LABEL_37;
        objc_setProperty_atomic(v10, v26, v9, 32);
      }
      else
      {
        ne_log_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "Did not receive an auxiliary data dictionary", buf, 2u);
        }

        if (!v10)
          goto LABEL_37;
      }
      if (objc_getProperty(v10, v24, 24, 1))
      {
        v28 = (void (**)(id))objc_getProperty(v10, v27, 24, 1);
        objc_setProperty_atomic_copy(v10, v29, 0, 24);
LABEL_38:
        objc_sync_exit(v10);

        if (!v28)
        {
LABEL_44:

          goto LABEL_45;
        }
        v28[2](v28);
        v10 = (NEFileHandleMaintainer *)v28;
LABEL_43:

        goto LABEL_44;
      }
LABEL_37:
      v28 = 0;
      goto LABEL_38;
    }
  }
LABEL_45:

}

- (void)startOwnerModeWithEventName:(id)a3 handlesReceivedCallback:(id)a4
{
  id v6;
  id v7;
  NEFileHandleMaintainer *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NEFileHandleMaintainer setEventName:](v8, "setEventName:", v6);
  objc_initWeak(&location, v8);
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__NEFileHandleMaintainer_startOwnerModeWithEventName_handlesReceivedCallback___block_invoke;
  v14[3] = &unk_1E3CC0078;
  objc_copyWeak(&v15, &location);
  xpc_set_event_stream_handler(v10, v11, v14);

  if (v8)
  {
    v8->_isOwnerMode = 1;
    objc_setProperty_atomic_copy(v8, v13, v7, 24);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v8);

}

- (id)createEvent
{
  const char *v3;
  xpc_object_t v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  const char *v15;
  const char *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = xpc_array_create(0, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x1E0C812F8];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "dictionary", (_QWORD)v19);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12 && MEMORY[0x1A1ACFDA4](v12) == v10)
          xpc_array_append_value(v4, v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v14, "handles-array", v4);
  if (self && objc_getProperty(self, v15, 32, 1))
  {
    v17 = objc_getProperty(self, v16, 32, 1);
    xpc_dictionary_set_value(v14, "aux-data", v17);
  }

  return v14;
}

- (void)commit
{
  void *v2;
  id v3;
  NEFileHandleMaintainer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NEFileHandleMaintainer createEvent](obj, "createEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFileHandleMaintainer eventName](obj, "eventName");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  xpc_set_event();

  if (obj)
    obj->_changed = 0;

  objc_sync_exit(obj);
}

- (void)removeFileHandleMatchingPredicate:(id)a3
{
  uint64_t (**v4)(id, void *);
  NEFileHandleMaintainer *v5;
  const char *v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (v5)
    Property = objc_getProperty(v5, v6, 16, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((v4[2](v4, v12) & 1) != 0)
        {
          v13 = v12;

          if (v13)
          {
            if (v5)
              v15 = objc_getProperty(v5, v14, 16, 1);
            else
              v15 = 0;
            v16 = v15;
            objc_msgSend(v16, "removeObject:", v13, (_QWORD)v17);

            if (v5)
              v5->_changed = 1;
          }
          goto LABEL_17;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_17:

  objc_sync_exit(v5);
}

- (void)setFileHandle:(id)a3 matchingPredicate:(id)a4
{
  uint64_t (**v6)(id, void *);
  NEFileHandleMaintainer *v7;
  const char *v8;
  unint64_t v9;
  id i;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id Property;
  id v18;
  id v19;
  id v20;

  v20 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  if (v20)
  {
    v7 = self;
    objc_sync_enter(v7);
    v9 = 0;
    if (!v7)
      goto LABEL_9;
LABEL_3:
    for (i = objc_getProperty(v7, v8, 16, 1); ; i = 0)
    {
      v11 = i;
      v12 = objc_msgSend(v11, "count");

      if (v9 >= v12)
        goto LABEL_12;
      v13 = v7 ? objc_getProperty(v7, v8, 16, 1) : 0;
      v14 = v13;
      objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6[2](v6, v15);

      if ((v16 & 1) != 0)
        break;
      ++v9;
      if (v7)
        goto LABEL_3;
LABEL_9:
      ;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_12:
      if (v7)
        Property = objc_getProperty(v7, v8, 16, 1);
      else
        Property = 0;
      v18 = Property;
      objc_msgSend(v18, "addObject:", v20);
      goto LABEL_18;
    }
    if (v7)
      v19 = objc_getProperty(v7, v8, 16, 1);
    else
      v19 = 0;
    v18 = v19;
    objc_msgSend(v18, "setObject:atIndexedSubscript:", v20, v9);
LABEL_18:

    if (v7)
      v7->_changed = 1;
    objc_sync_exit(v7);

  }
}

- (void)iterateFileHandlesWithBlock:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  NEFileHandleMaintainer *v5;
  const char *v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (v5)
    Property = objc_getProperty(v5, v6, 16, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v8);
      if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)) & 1) == 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          goto LABEL_5;
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)setAuxiliaryData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NEFileHandleMaintainer *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  xpc_object_t v12;
  const char *v13;
  void *v14;
  id Property;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v6 && objc_msgSend(v7, "length"))
  {
    v10 = _CFXPCCreateXPCObjectFromCFObject();
    if (v10)
    {
      if (!v8 || !objc_getProperty(v8, v9, 32, 1))
      {
        v12 = xpc_dictionary_create(0, 0, 0);
        v14 = v12;
        if (!v8)
        {

          Property = 0;
          goto LABEL_9;
        }
        objc_setProperty_atomic(v8, v13, v12, 32);

      }
      Property = objc_getProperty(v8, v11, 32, 1);
LABEL_9:
      v16 = Property;
      xpc_dictionary_set_value(v16, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), v10);

      goto LABEL_15;
    }
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Failed to convert %@ to an XPC object", (uint8_t *)&v18, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 134218242;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Auxiliary data (%p) is nil or key (%@) has length 0", (uint8_t *)&v18, 0x16u);
    }
  }
LABEL_15:

  objc_sync_exit(v8);
}

- (id)copyAuxiliaryDataForKey:(id)a3
{
  id v4;
  NEFileHandleMaintainer *v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  const void *bytes_ptr;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5
    || (v7 = objc_getProperty(v5, v6, 32, 1)) == 0
    || (v8 = v7, v9 = objc_msgSend(v4, "length"), v8, !v9))
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v4;
      _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_INFO, "Failed to get auxiliary data for key %@: auxiliaryDataDictionary is nil", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_12;
  }
  v11 = objc_getProperty(v5, v10, 32, 1);
  v12 = objc_retainAutorelease(v4);
  xpc_dictionary_get_value(v11, (const char *)objc_msgSend(v12, "UTF8String"));
  v13 = objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEFAULT, "Failed to get auxiliary data for key %@: key does not exist", (uint8_t *)&v20, 0xCu);
    }

    v13 = 0;
LABEL_12:
    v16 = 0;
    goto LABEL_15;
  }
  if (MEMORY[0x1A1ACFDA4](v13) == MEMORY[0x1E0C812E8])
  {
    v17 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v13);
    v14 = objc_msgSend(v17, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v13), 0);
  }
  else
  {
    v14 = _CFXPCCreateCFObjectFromXPCObject();
  }
  v16 = (void *)v14;
LABEL_15:

  objc_sync_exit(v5);
  return v16;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_auxiliaryDataDictionary, 0);
  objc_storeStrong(&self->_receivedHandlesCallback, 0);
  objc_storeStrong((id *)&self->_fileHandles, 0);
}

void __78__NEFileHandleMaintainer_startOwnerModeWithEventName_handlesReceivedCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "eventName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "Handling a %@ event", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(WeakRetained, "resetFileHandlesFromEvent:", v3);
  }

}

uint64_t __52__NEFileHandleMaintainer_resetFileHandlesFromEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (v4
    && MEMORY[0x1A1ACFDA4](v4) == MEMORY[0x1E0C812F8]
    && xpc_dictionary_get_uint64(v4, "type") - 1 <= 2
    && (v5 = (objc_class *)objc_opt_class()) != 0)
  {
    v6 = (void *)objc_msgSend([v5 alloc], "initFromDictionary:", v4);

    if (v6)
    {
      if (nelog_is_debug_logging_enabled())
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v9 = 138412290;
          v10 = v6;
          _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "File Handle Maintainer adding %@", (uint8_t *)&v9, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }
  }
  else
  {

    v6 = 0;
  }

  return 1;
}

+ (id)sharedMaintainer
{
  if (sharedMaintainer_once_token != -1)
    dispatch_once(&sharedMaintainer_once_token, &__block_literal_global_3265);
  return (id)sharedMaintainer_g_maintainer;
}

void __42__NEFileHandleMaintainer_sharedMaintainer__block_invoke()
{
  NEFileHandleMaintainer *v0;
  void *v1;

  v0 = objc_alloc_init(NEFileHandleMaintainer);
  v1 = (void *)sharedMaintainer_g_maintainer;
  sharedMaintainer_g_maintainer = (uint64_t)v0;

}

@end
