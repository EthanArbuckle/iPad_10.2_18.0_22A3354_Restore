@implementation NWUtilsCreateNSDictionaryFromXPCDictionary

BOOL __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  Class Class;
  Class v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  Class v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _BOOL8 result;
  void *v25;
  id v26;
  id v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id NSObjectFromSimpleXPCObject;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  void *v41;
  char *backtrace_string;
  _BOOL4 v43;
  char *v44;
  _BOOL4 v45;
  _BYTE *v46;
  uint64_t v47;
  char v48;
  os_log_type_t type;
  _BYTE applier[24];
  void *v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    __nwlog_obj();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
    v37 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v48 = 0;
    if (!__nwlog_fault(v37, &type, &v48))
      goto LABEL_69;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = type;
      if (os_log_type_enabled(v38, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null key";
LABEL_67:
        _os_log_impl(&dword_182FBE000, v38, v39, v40, applier, 0xCu);
      }
    }
    else if (v48)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = type;
      v43 = os_log_type_enabled(v38, type);
      if (backtrace_string)
      {
        if (v43)
        {
          *(_DWORD *)applier = 136446466;
          *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
          *(_WORD *)&applier[12] = 2082;
          *(_QWORD *)&applier[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s called with null key, dumping backtrace:%{public}s", applier, 0x16u);
        }

        free(backtrace_string);
LABEL_69:
        if (!v37)
          goto LABEL_38;
LABEL_70:
        free(v37);
        goto LABEL_38;
      }
      if (v43)
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null key, no backtrace";
        goto LABEL_67;
      }
    }
    else
    {
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = type;
      if (os_log_type_enabled(v38, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null key, backtrace limit exceeded";
        goto LABEL_67;
      }
    }
LABEL_68:

    goto LABEL_69;
  }
  if (!v5)
  {
    __nwlog_obj();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
    v37 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v48 = 0;
    if (!__nwlog_fault(v37, &type, &v48))
      goto LABEL_69;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = type;
      if (os_log_type_enabled(v38, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null value";
        goto LABEL_67;
      }
    }
    else
    {
      if (v48)
      {
        v44 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = type;
        v45 = os_log_type_enabled(v38, type);
        if (v44)
        {
          if (v45)
          {
            *(_DWORD *)applier = 136446466;
            *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
            *(_WORD *)&applier[12] = 2082;
            *(_QWORD *)&applier[14] = v44;
            _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s called with null value, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(v44);
          if (!v37)
            goto LABEL_38;
          goto LABEL_70;
        }
        if (!v45)
          goto LABEL_68;
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null value, no backtrace";
        goto LABEL_67;
      }
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = type;
      if (os_log_type_enabled(v38, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke";
        v40 = "%{public}s called with null value, backtrace limit exceeded";
        goto LABEL_67;
      }
    }
    goto LABEL_68;
  }
  Class = object_getClass(v5);
  if (Class == (Class)MEMORY[0x1E0C812C8])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99DE8];
    v12 = v6;
    objc_msgSend(v11, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)applier = MEMORY[0x1E0C809B0];
    *(_QWORD *)&applier[8] = 3221225472;
    *(_QWORD *)&applier[16] = __NWUtilsCreateNSArrayFromXPCArray_block_invoke;
    v51 = &unk_1E14AC908;
    v14 = v13;
    v52 = v14;
    xpc_array_apply(v12, applier);

    if (!xpc_array_get_count(v12))
    {
LABEL_36:
      v25 = *(void **)(a1 + 32);
      v26 = v14;
      v27 = v10;
      goto LABEL_37;
    }
    xpc_array_get_value(v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = object_getClass(v15);
    if (v16 == (Class)MEMORY[0x1E0C81328])
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = CFSTR("INT64-");
    }
    else if (v16 == (Class)MEMORY[0x1E0C81398])
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = CFSTR("UINT64-");
    }
    else
    {
      if (v16 != (Class)MEMORY[0x1E0C81300])
      {
        if (v16 != (Class)MEMORY[0x1E0C812D0])
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_35:
          v35 = (void *)v17;

          v10 = v35;
          goto LABEL_36;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), CFSTR("BOOL-"), a2);
LABEL_34:
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = CFSTR("DOUBLE-");
    }
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@%s"), v31, a2);
    goto LABEL_34;
  }
  if (Class != (Class)MEMORY[0x1E0C812F8])
  {
    v8 = object_getClass(v6);
    if (v8 == (Class)MEMORY[0x1E0C81328])
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = CFSTR("INT64-");
    }
    else if (v8 == (Class)MEMORY[0x1E0C81398])
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = CFSTR("UINT64-");
    }
    else
    {
      if (v8 != (Class)MEMORY[0x1E0C81300])
      {
        if (v8 != (Class)MEMORY[0x1E0C812D0])
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_26:
          v32 = (void *)v9;
          NSObjectFromSimpleXPCObject = NWUtilsCreateNSObjectFromSimpleXPCObject(v6);
          v34 = NSObjectFromSimpleXPCObject;
          if (v32)
          {
            if (NSObjectFromSimpleXPCObject)
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", NSObjectFromSimpleXPCObject, v32);
          }

          goto LABEL_38;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), CFSTR("BOOL-"), a2);
LABEL_25:
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = CFSTR("DOUBLE-");
    }
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%s"), v29, a2);
    goto LABEL_25;
  }
  v18 = (void *)MEMORY[0x1E0C99E08];
  v19 = v6;
  objc_msgSend(v18, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)applier = MEMORY[0x1E0C809B0];
  *(_QWORD *)&applier[8] = 3221225472;
  *(_QWORD *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
  v51 = &unk_1E14A8E38;
  v10 = v20;
  v52 = v10;
  xpc_dictionary_apply(v19, applier);

  v21 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_19;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v22 = (id)gLogObj;
  os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  *(_DWORD *)applier = 136446466;
  *(_QWORD *)&applier[4] = "nw_nsstring";
  *(_WORD *)&applier[12] = 2080;
  *(_QWORD *)&applier[14] = a2;
  LODWORD(v47) = 22;
  v46 = applier;
  v23 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v23);
  if (!result)
  {
    free(v23);
LABEL_19:
    v25 = v21;
    v26 = v10;
    v27 = v14;
LABEL_37:
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, v27, v46, v47);

LABEL_38:
    return 1;
  }
  __break(1u);
  return result;
}

@end
