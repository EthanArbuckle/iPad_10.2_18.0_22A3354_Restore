@implementation LAACLBuilder

+ (id)customACL:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  SecAccessControlCreateFlags v7;
  int v8;
  SecAccessControlRef v9;
  SecAccessControlRef v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char isKindOfClass;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  LAACL *v36;
  id v37;
  os_log_type_t v38;
  os_log_type_t v39;
  NSObject *v40;
  os_log_type_t v41;
  const char *v42;
  int RequirePassword;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  CFErrorRef error;
  _QWORD v57[5];
  _QWORD v58[5];
  _BYTE v59[128];
  void *v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE buf[18];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  error = 0;
  if (objc_msgSend(v3, "authType") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __26__LAACLBuilder_customACL___block_invoke;
    v55[3] = &unk_1E7079BA8;
    v4 = v3;
    v55[4] = v4;
    v7 = __26__LAACLBuilder_customACL___block_invoke((uint64_t)v55);
    v8 = v7;
    v9 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68F0], v7, &error);
    if (!v9)
    {
      LA_LOG_1();
      v11 = objc_claimAutoreleasedReturnValue();
      v39 = LALogTypeForInternalError();
      if (os_log_type_enabled(v11, v39))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v8;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = error;
        _os_log_impl(&dword_1B971E000, v11, v39, "Could not initialize ACL (flags=%d) (%{public}@)", buf, 0x12u);
      }
      v6 = 0;
      goto LABEL_45;
    }
    v10 = v9;
    v45 = v3;
    v11 = objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[NSObject credentials](v4, "credentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v52 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          -[NSObject credentials](v4, "credentials");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject setCredential:type:](v11, "setCredential:type:", v20, objc_msgSend(v18, "integerValue"));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v15);
    }

    v60 = &unk_1E7087F48;
    v61 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    obj = error;
    v22 = (id)-[NSObject evaluateAccessControl:operation:options:error:](v11, "evaluateAccessControl:operation:options:error:", v10, 2, v21, &obj);
    objc_storeStrong((id *)&error, obj);

    +[LASecAccessControl constraintsFromACL:](LASecAccessControl, "constraintsFromACL:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    RequirePassword = SecAccessControlGetRequirePassword();
    CFRelease(v10);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v23, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (!v25)
    {
LABEL_21:

LABEL_32:
      LA_LOG_1();
      v32 = objc_claimAutoreleasedReturnValue();
      v38 = LALogTypeForInternalError();
      if (os_log_type_enabled(v32, v38))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1B971E000, v32, v38, "Could not derive auth constraints (%{public}@)", buf, 0xCu);
      }
      goto LABEL_43;
    }
    v26 = v25;
    v27 = *(_QWORD *)v47;
LABEL_15:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v27)
        objc_enumerationMutation(v24);
      v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v28);
      objc_msgSend(v23, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      if (v26 == ++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        if (v26)
          goto LABEL_15;
        goto LABEL_21;
      }
    }
    objc_msgSend(v23, "objectForKeyedSubscript:", v29);
    v32 = objc_claimAutoreleasedReturnValue();

    if (!v32)
      goto LABEL_32;
    LA_LOG_1();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      +[LAACLBuilder customACL:].cold.1(v33);

    v34 = SecAccessControlCreate();
    if (v34)
    {
      v35 = v34;
      if ((SecAccessControlSetProtection() & 1) != 0)
      {
        v57[0] = CFSTR("osgn");
        v57[1] = CFSTR("od");
        v58[0] = v32;
        v58[1] = v32;
        v57[2] = CFSTR("ock");
        v57[3] = CFSTR("odel");
        v58[2] = v32;
        v58[3] = MEMORY[0x1E0C9AAB0];
        v57[4] = CFSTR("oa");
        v58[4] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 5);
        SecAccessControlSetConstraints();
        if (RequirePassword)
          SecAccessControlSetRequirePassword();
        v36 = [LAACL alloc];
        if (v36)
        {
          *(_QWORD *)buf = v36;
          *(_QWORD *)&buf[8] = LAACL;
          v37 = objc_msgSendSuper2((objc_super *)buf, sel_init);
          v6 = v37;
          if (v37)
            *((_QWORD *)v37 + 1) = v35;
          goto LABEL_44;
        }
LABEL_43:
        v6 = 0;
LABEL_44:
        v3 = v45;

LABEL_45:
        goto LABEL_46;
      }
      LA_LOG_1();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = LALogTypeForInternalError();
      if (os_log_type_enabled(v40, v41))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = error;
        v42 = "Could not set ACL protection (%{public}@)";
        goto LABEL_41;
      }
    }
    else
    {
      LA_LOG_1();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = LALogTypeForInternalError();
      if (os_log_type_enabled(v40, v41))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = error;
        v42 = "Could not initialize trivial ACL (%{public}@)";
LABEL_41:
        _os_log_impl(&dword_1B971E000, v40, v41, v42, buf, 0xCu);
      }
    }

    goto LABEL_43;
  }
  LA_LOG_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B971E000, v4, v5, "Invalid authType", buf, 2u);
  }
  v6 = 0;
LABEL_46:

  return v6;
}

uint64_t __26__LAACLBuilder_customACL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "fallbackAuthType");
  result = objc_msgSend(*(id *)(a1 + 32), "authType");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (result == 2 && objc_msgSend(*(id *)(a1 + 32), "fallbackAuthType") == 16)
    {
      return 1;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "authType");
      return v4 | objc_msgSend(*(id *)(a1 + 32), "fallbackAuthType") | 0x4000;
    }
  }
  return result;
}

+ (id)denyAllACL
{
  LAACL *v2;
  __SecAccessControl *v3;
  __SecAccessControl *v4;
  _QWORD *v5;
  objc_super v7;

  v2 = [LAACL alloc];
  v3 = +[LASecAccessControl denyAllACL](LASecAccessControl, "denyAllACL");
  if (!v2)
    return 0;
  v4 = v3;
  v7.receiver = v2;
  v7.super_class = (Class)LAACL;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
    v5[1] = v4;
  return v5;
}

+ (void)customACL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B971E000, log, OS_LOG_TYPE_DEBUG, "Skipping AP constraints", v1, 2u);
}

@end
