@implementation CRDaemonController

+ (id)getAllowedListFromEntitlements:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD1988];
  v4 = a3;
  objc_msgSend_currentConnection(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForEntitlement_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = (id)MEMORY[0x24BDBD1A8];

  return v12;
}

+ (void)controlWithParameters:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  int v47;
  const char *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v47 = 136315394;
    v48 = "+[CRDaemonController controlWithParameters:withReply:]";
    v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "[%s] parameters: %@", (uint8_t *)&v47, 0x16u);
  }

  objc_msgSend_safeGetStringParam_key_(a1, v9, (uint64_t)v6, (uint64_t)CFSTR("action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10)
  {
    if ((objc_msgSend_isEqual_(v10, v11, (uint64_t)CFSTR("load"), v12) & 1) != 0
      || objc_msgSend_isEqual_(v13, v14, (uint64_t)CFSTR("unload"), v15))
    {
      objc_msgSend_getAllowedListFromEntitlements_(a1, v14, (uint64_t)CFSTR("com.apple.private.corerepair.allow-job-control"), v15);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_safeGetStringParam_key_(a1, v17, (uint64_t)v6, (uint64_t)CFSTR("name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if ((objc_msgSend_containsObject_(v16, v18, (uint64_t)v20, v19) & 1) != 0)
        {
          v22 = objc_msgSend_doLaunchControl_action_(a1, v21, (uint64_t)v20, (uint64_t)v13);
LABEL_9:

          goto LABEL_10;
        }
        handleForCategory(0);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_21456C1E0();
      }
      else
      {
        handleForCategory(0);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_21456C1B4();
      }

      v22 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend_isEqual_(v13, v14, (uint64_t)CFSTR("writeDefaults"), v15))
    {
      v22 = 0;
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
    objc_msgSend_getAllowedListFromEntitlements_(a1, v23, (uint64_t)CFSTR("com.apple.private.corerepair.allow-pref-access"), v24);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_safeGetStringParam_key_(a1, v25, (uint64_t)v6, (uint64_t)CFSTR("name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_safeGetStringParam_key_(a1, v26, (uint64_t)v6, (uint64_t)CFSTR("prefKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v6, v28, (uint64_t)CFSTR("prefValue"), v29);
    v32 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if ((objc_msgSend_containsObject_(v16, v30, (uint64_t)v20, v31) & 1) != 0)
      {
        if (v27)
        {
          if (v32)
          {
            objc_msgSend_null(MEMORY[0x24BDBCEF8], v33, v34, v35);
            v36 = objc_claimAutoreleasedReturnValue();

            if (v32 == v36)
            {

              v32 = 0;
            }
            v37 = objc_alloc(MEMORY[0x24BDBCF50]);
            v40 = objc_msgSend_initWithSuiteName_(v37, v38, (uint64_t)v20, v39);
            objc_msgSend_setObject_forKey_(v40, v41, (uint64_t)v32, (uint64_t)v27);
            objc_msgSend_synchronize(v40, v42, v43, v44);

            v22 = 1;
            v32 = v40;
            goto LABEL_21;
          }
          handleForCategory(0);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_21456C298();
LABEL_41:
          v22 = 0;
LABEL_21:

          goto LABEL_9;
        }
        handleForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_21456C26C();
      }
      else
      {
        handleForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_21456C2C4();
      }
    }
    else
    {
      handleForCategory(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_21456C240();
    }

    goto LABEL_41;
  }
  handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_21456C188();
  v22 = 0;
LABEL_10:

  if (v7)
LABEL_11:
    v7[2](v7, v22, 0);
LABEL_12:

}

+ (BOOL)doLaunchControl:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void (*LibXPCInternalWithSymbol)(uint64_t, xpc_object_t, id *);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void (*v19)(id);
  const char *v20;
  uint64_t v21;
  char isEqualToString;
  uint64_t v23;
  const char *v24;
  xpc_object_t v25;
  xpc_object_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  char v36;
  _QWORD applier[5];
  char v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("/System/Library/LaunchDaemons/%@.plist"), v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LibXPCInternalWithSymbol = (void (*)(uint64_t, xpc_object_t, id *))objc_msgSend_getLibXPCInternalWithSymbol_(a1, v11, (uint64_t)"_xpc_domain_routine", v12);
  v16 = objc_msgSend_getLibXPCInternalWithSymbol_(a1, v14, (uint64_t)"xpc_release", v15);
  if (!LibXPCInternalWithSymbol || (v19 = (void (*)(id))v16) == 0)
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_21456C324();
    goto LABEL_17;
  }
  isEqualToString = objc_msgSend_isEqualToString_(v7, v17, (uint64_t)CFSTR("load"), v18);
  if ((isEqualToString & 1) != 0)
  {
    v23 = 800;
    v24 = "enable";
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToString_(v7, v20, (uint64_t)CFSTR("unload"), v21) & 1) == 0)
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_21456C350();
LABEL_17:

    v34 = 0;
    v26 = 0;
    v25 = 0;
    v32 = 0;
    goto LABEL_18;
  }
  v23 = 801;
  v24 = "disable";
LABEL_7:
  v25 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v25, "type", 7uLL);
  xpc_dictionary_set_uint64(v25, "handle", 0);
  xpc_dictionary_set_BOOL(v25, v24, 0);
  xpc_dictionary_set_BOOL(v25, "legacy-load", 1);
  xpc_dictionary_set_BOOL(v25, "force", 1);
  xpc_dictionary_set_BOOL(v25, "by-cli", 1);
  v26 = xpc_array_create(0, 0);
  v27 = objc_retainAutorelease(v10);
  v31 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
  xpc_array_set_string(v26, 0xFFFFFFFFFFFFFFFFLL, v31);
  xpc_dictionary_set_value(v25, "paths", v26);
  if ((isEqualToString & 1) == 0)
    xpc_dictionary_set_BOOL(v25, "no-einprogress", 1);
  v40 = 0;
  LibXPCInternalWithSymbol(v23, v25, &v40);
  v32 = v40;
  xpc_dictionary_get_dictionary(v32, "errors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 && xpc_dictionary_get_count(v33))
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = sub_214534190;
    applier[3] = &unk_24D1AA448;
    applier[4] = &v41;
    v39 = isEqualToString;
    xpc_dictionary_apply(v34, applier);
    if (!v32)
      goto LABEL_18;
    goto LABEL_14;
  }
  *((_BYTE *)v42 + 24) = 1;
  if (v32)
LABEL_14:
    v19(v32);
LABEL_18:
  v36 = *((_BYTE *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  return v36;
}

+ (void)getLibXPCInternalWithSymbol:(const char *)a3
{
  void *result;
  NSObject *v5;

  if (qword_254D7B0C0 != -1)
    dispatch_once(&qword_254D7B0C0, &unk_24D1AA468);
  if (qword_254D7B0C8)
  {
    result = dlsym((void *)qword_254D7B0C8, a3);
    if (result)
      return result;
    handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_21456C49C();
  }
  else
  {
    handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_21456C470();
  }

  return 0;
}

+ (id)safeGetStringParam:(id)a3 key:(id)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)a4, (uint64_t)a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend_length(v4, v5, v6, v7))
      {

        v4 = 0;
      }
    }
  }
  return v4;
}

@end
