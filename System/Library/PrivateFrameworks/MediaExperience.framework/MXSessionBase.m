@implementation MXSessionBase

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (id)getSetPropertiesOrder
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

+ (int64_t)generateSessionID
{
  return FigAtomicIncrement64();
}

- (MXSessionBase)init
{
  MXSessionBase *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXSessionBase;
  v2 = -[MXSessionBase init](&v4, sel_init);
  if (v2)
    v2->_ID = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", +[MXSessionBase generateSessionID](MXSessionBase, "generateSessionID"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_ID = 0;
  self->_parentCoreSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionBase;
  -[MXSessionBase dealloc](&v3, sel_dealloc);
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  return -[MXSessionBase setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", a3, a4, 0);
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  int v7;
  NSObject *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if ((objc_msgSend((id)objc_opt_class(), "isNonSerializedSetProperty:", a3) & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "isNonSerializedSetPropertyWhenSessionIsInactive:", a3)
    && !-[MXCoreSessionBase isActive](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "isActive"))
  {
    v7 = -[MXSessionBase setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", a3, a4, 0);
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__MXSessionBase_setPropertyForKey_value___block_invoke;
    v10[3] = &unk_1E3098CC8;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = a4;
    v10[7] = &v11;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setPropertyForKey:value:]", (uint64_t)"MXSessionBase.m", 113, 0, 0, v8, (uint64_t)v10);
    v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __41__MXSessionBase_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setPropertyForKey:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  int v7;
  NSObject *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend((id)objc_opt_class(), "isNonSerializedCopyProperty:", a3))
  {
    v7 = -[MXSessionBase copyPropertyForKeyInternal:valueOut:](self, "copyPropertyForKeyInternal:valueOut:", a3, a4);
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__MXSessionBase_copyPropertyForKey_valueOut___block_invoke;
    v10[3] = &unk_1E3098CF0;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = &v11;
    v10[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase copyPropertyForKey:valueOut:]", (uint64_t)"MXSessionBase.m", 143, 0, 0, v8, (uint64_t)v10);
    v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __45__MXSessionBase_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyPropertyForKey:valueOut:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v15;
  int v16;
  _QWORD v18[8];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isNonSerializedSetProperty:", v12) & 1) == 0
          && (!objc_msgSend((id)objc_opt_class(), "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)
           || -[MXCoreSessionBase isActive](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "isActive")))
        {
          v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __78__MXSessionBase_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E3098D18;
          v18[4] = self;
          v18[5] = a3;
          v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSessionBase.m", 173, 0, 0, v14, (uint64_t)v18);
          if (a5)
            v15 = *a5;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = -[MXSessionBase setPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:](self, "setPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:", a3, v6, a5);
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

id __78__MXSessionBase_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_setProperties:usingErrorHandlingStrategy:outPropertiesErrors:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v3 = *(id **)(a1 + 56);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
  if (v3)
    return *v3;
  return result;
}

- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  int v37;
  id v38;
  __int128 v39;
  __int128 v40;
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
  os_log_type_t type;
  int v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = a5;
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintDictionary(a3);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = (void *)objc_msgSend((id)objc_opt_class(), "getSetPropertiesOrder");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v17 = objc_msgSend(a3, "objectForKey:", v16, v34, v35);
          if (v17)
          {
            v59 = v16;
            v60 = v17;
            objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      }
      while (v13);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16, v34, v35);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(a3);
          v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getSetPropertiesOrder"), "containsObject:", v22) & 1) == 0)
          {
            v56 = v22;
            v57 = objc_msgSend(a3, "objectForKey:", v22);
            objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          }
        }
        v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      }
      while (v19);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v23)
    {
      v24 = v23;
      v37 = 0;
      v25 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v9);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          v28 = (void *)MEMORY[0x194035B20]();
          v29 = objc_msgSend((id)objc_msgSend(v27, "allKeys"), "firstObject");
          v30 = objc_msgSend(v27, "objectForKey:", v29);
          if (v30 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v31 = 0;
          else
            v31 = v30;
          v32 = -[MXSessionBase setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v29, v31, a3);
          v53 = v29;
          v54 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
          objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v32)
              v37 = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v32)
          {
            v37 = FigSignalErrorAt();
            objc_autoreleasePoolPop(v28);
            goto LABEL_40;
          }
          objc_autoreleasePoolPop(v28);
        }
        v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v24);
    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    v37 = FigSignalErrorAt();
  }
LABEL_40:
  if (v36)
    *v36 = v38;
  else

  return v37;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v15;
  int v16;
  _QWORD v18[8];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(a3);
        v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "allKeys"), "firstObject");
        if ((objc_msgSend((id)objc_opt_class(), "isNonSerializedSetProperty:", v12) & 1) == 0
          && (!objc_msgSend((id)objc_opt_class(), "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)
           || -[MXCoreSessionBase isActive](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "isActive")))
        {
          v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __85__MXSessionBase_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E3098D18;
          v18[4] = self;
          v18[5] = a3;
          v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSessionBase.m", 301, 0, 0, v14, (uint64_t)v18);
          if (a5)
            v15 = *a5;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = -[MXSessionBase setOrderedPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:](self, "setOrderedPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:", a3, v6, a5);
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

id __85__MXSessionBase_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v3 = *(id **)(a1 + 56);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
  if (v3)
    return *v3;
  return result;
}

- (int)setOrderedPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  os_log_type_t type;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v31 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintCollection(a3);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v9)
    {
      v11 = v9;
      LODWORD(v23) = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x194035B20](v9, v10);
          v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          v17 = objc_msgSend(v14, "objectForKey:", v16);
          if (v17 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v18 = 0;
          else
            v18 = v17;
          v19 = -[MXSessionBase setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v16, v18, 0, v21, v22);
          v32 = v16;
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v19)
              LODWORD(v23) = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v19)
          {
            LODWORD(v23) = FigSignalErrorAt();
            objc_autoreleasePoolPop(v15);
            goto LABEL_22;
          }
          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v11 = v9;
      }
      while (v9);
    }
    else
    {
      LODWORD(v23) = 0;
    }
  }
  else
  {
    v23 = FigSignalErrorAt();
  }
LABEL_22:
  if (a5)
    *a5 = v25;
  else

  return v23;
}

- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        if ((objc_msgSend((id)objc_opt_class(), "isNonSerializedCopyProperty:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9)) & 1) == 0)
        {
          v11 = MXGetSerialQueue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __50__MXSessionBase_copyProperties_outPropertyErrors___block_invoke;
          v15[3] = &unk_1E3098CF0;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = &v20;
          v15[7] = a4;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSessionBase copyProperties:outPropertyErrors:]", (uint64_t)"MXSessionBase.m", 401, 0, 0, v11, (uint64_t)v15);
          if (a4)
            v12 = *a4;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = -[MXSessionBase copyPropertiesInternal:outPropertyErrors:](self, "copyPropertiesInternal:outPropertyErrors:", a3, a4);
  v21[5] = (uint64_t)v10;
LABEL_12:
  v13 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v13;
}

id __50__MXSessionBase_copyProperties_outPropertyErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_copyProperties:outPropertyErrors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  v3 = *(id **)(a1 + 56);
  if (v3)
    return *v3;
  return result;
}

- (id)copyPropertiesInternal:(id)a3 outPropertyErrors:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x194035B20]();
        v18 = 0;
        v13 = -[MXSessionBase copyPropertyForKeyInternal:valueOut:](self, "copyPropertyForKeyInternal:valueOut:", v11, &v18);
        if ((_DWORD)v13)
          v14 = 1;
        else
          v14 = v18 == 0;
        if (!v14)
          objc_msgSend(v17, "setObject:forKey:");
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), v11);

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  if (a4)
    *a4 = v6;
  else

  return v17;
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (MXCoreSessionBase)parentCoreSession
{
  return (MXCoreSessionBase *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentCoreSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
