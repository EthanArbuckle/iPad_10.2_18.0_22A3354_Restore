@implementation IDSPayloadInspector

+ (void)inspectPayload:(id)a3 messageGuid:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v6 = a4;
  if (!v29)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend_validateData_messageGuid_(a1, v7, (uint64_t)v29, v8, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v9 = objc_msgSend_validateString_messageGuid_(a1, v12, (uint64_t)v29, v13, v6);
  }
  objc_msgSend_enforceSecurityError_messageGuid_(a1, v10, v9, v11, v6);
LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_objectEnumerator(v29, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextObject(v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v24 = (void *)v21;
      do
      {
        objc_msgSend_inspectPayload_messageGuid_(a1, v22, (uint64_t)v24, v23, v6);
        objc_msgSend_nextObject(v17, v25, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v28;
      }
      while (v28);
    }

  }
LABEL_12:

}

+ (void)enforceSecurityError:(int64_t)a3 messageGuid:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  int v16;
  const char *v17;
  uint64_t v18;
  double v19;
  NSObject *v20;

  v5 = a4;
  objc_msgSend_sharedInstance(IDSServerBag, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("ids-payload-inspector-enable-fault"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);
      if (a3 == 1)
      {
        if (v16)
        {
          objc_msgSend_security(MEMORY[0x1E0D36A40], v17, v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            sub_19BAFA464((uint64_t)v5, v20);

        }
      }
    }
  }

}

+ (int64_t)validateData:(id)a3 messageGuid:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  const char *v25;
  double v26;
  void *v27;
  int64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  double v34;
  unint64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (v6)
  {
    v36 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v7, (uint64_t)v6, v9, 0, &v36, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    objc_msgSend_security(MEMORY[0x1E0D36A40], v10, v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "%@ : Found a pList.", buf, 0xCu);
    }

    objc_msgSend_objectForKey_(v11, v15, (uint64_t)CFSTR("$archiver"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_11;
    v18 = (void *)v17;
    objc_msgSend_objectForKey_(v11, v10, (uint64_t)CFSTR("$objects"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      getpid();
      CUTProcessNameForPid();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_security(MEMORY[0x1E0D36A40], v21, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_objectForKey_(v11, v25, (uint64_t)CFSTR("$archiver"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v8;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v20;
        _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "Found a serialized pList in message %@ with archiver %@ in process %@", buf, 0x20u);

      }
      v28 = 1;
    }
    else
    {
LABEL_11:
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v10, (uint64_t)v6, v12, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend_security(MEMORY[0x1E0D36A40], v29, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v8;
          _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "%@ : Found a Json object in NSData object. Proceeding to inspect further.", buf, 0xCu);
        }

        objc_msgSend_inspectPayload_messageGuid_(a1, v33, (uint64_t)v20, v34, v8);
      }
      v28 = -1;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (int64_t)validateString:(id)a3 messageGuid:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  const char *v26;
  double v27;
  int v29;
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v12 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v8, v9, (uint64_t)v6, v10, 1);
    if (!v12 || (v14 = objc_msgSend_validateData_messageGuid_(a1, v11, (uint64_t)v12, v13, v7), v14 == -1))
    {
      v18 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend_dataUsingEncoding_(v6, v11, 4, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_JSONObjectWithData_options_error_(v18, v20, (uint64_t)v19, v21, 0, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend_security(MEMORY[0x1E0D36A40], v22, v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v7;
          _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "%@ : Found a Json string. Proceeding to inspect further.", (uint8_t *)&v29, 0xCu);
        }

        objc_msgSend_inspectPayload_messageGuid_(a1, v26, (uint64_t)v17, v27, v7);
      }
      v16 = -1;
    }
    else
    {
      v16 = v14;
      objc_msgSend_security(MEMORY[0x1E0D36A40], v11, v15, v13);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412546;
        v30 = v7;
        v31 = 2048;
        v32 = v16;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "%@ : Found error code %ld in base64 encoded data string. Proceeding to inspect further.", (uint8_t *)&v29, 0x16u);
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
