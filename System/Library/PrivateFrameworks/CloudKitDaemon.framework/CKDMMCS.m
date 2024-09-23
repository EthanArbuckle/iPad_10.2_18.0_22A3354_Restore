@implementation CKDMMCS

+ (id)protocolHeaders
{
  uint64_t v2;

  objc_msgSend__appID(CKDMMCSEngineContext, a2, v2);
  return (id)MMCSICloudRequestHeadersCopy();
}

+ (id)protocolVersion
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_protocolHeaders(a1, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("x-apple-mmcs-proto-version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)drop
{
  _QWORD *v3;
  os_log_t *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  CKDMMCS *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, const char *, uint64_t);
  void *v24;
  CKDMMCS *v25;
  id v26;
  _BYTE *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t v33[4];
  CKDMMCS *v34;
  _BYTE buf[24];
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952B0];
  v5 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v18 = v5;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_checkoutCount(self, v19, v20);
    _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "%@ dropping with count %lld", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend_MMCSEngineContext(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_1BEB3B200;
  v24 = &unk_1E7834480;
  v25 = self;
  v27 = buf;
  v28 = &v29;
  v12 = v8;
  v26 = v12;
  dispatch_sync(v11, &v21);

  v13 = self;
  objc_sync_enter(v13);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && (objc_msgSend_didDrop(v13, v14, v15, v21, v22, v23, v24, v25) & 1) == 0)
    objc_msgSend_setDidDrop_(v13, v16, 1);
  objc_sync_exit(v13);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && !*((_BYTE *)v30 + 24))
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = v13;
      _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "%@ actually dropping but did not tear down", v33, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);
}

+ (id)zeroSizeFileSignature
{
  if (qword_1ED702A90 != -1)
    dispatch_once(&qword_1ED702A90, &unk_1E78344A0);
  return (id)qword_1ED702A88;
}

+ (id)_userInfoFromMMCSRetryableError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_userInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x1E0D46760]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_defaultRetryAfter(v11, v12, v13);

  v15 = *MEMORY[0x1E0D46758];
  objc_msgSend_objectForKeyedSubscript_(v8, v16, *MEMORY[0x1E0D46758]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  if (v17)
  {
    v14 = objc_msgSend_intValue(v17, v18, v19);
    if ((v14 - 0x7FFFFFFF) <= 0x80000001)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v21 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v29 = v20;
        v30 = 2114;
        v31 = v15;
        v32 = 2112;
        v33 = v3;
        _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Warn: Invalid value (%{public}@) for %{public}@ key in error %@", buf, 0x20u);
      }
    }
  }
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, v14, *MEMORY[0x1E0C94808]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v22;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v27, &v26, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (int64_t)_commonErrorCodeWithMMCSError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v21[16];

  v3 = a3;
  v6 = objc_msgSend_code(v3, v4, v5);
  v9 = 0;
  if (v6 <= 22)
  {
    switch(v6)
    {
      case 3:
        goto LABEL_12;
      case 4:
        v9 = 1;
        break;
      case 7:
        objc_msgSend_userInfo(v3, v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x1E0CB3388]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend_domain(v12, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E0D46750]))
          {
            if (objc_msgSend_code(v12, v17, v18) == 11)
              v9 = 3003;
            else
              v9 = 1013;
          }
          else
          {
            v9 = 1013;
          }

        }
        else
        {
          v9 = 1013;
        }

        break;
      case 8:
        v9 = 2003;
        break;
      case 9:
        v9 = 3002;
        break;
      case 13:
        goto LABEL_11;
      case 15:
        v9 = 1003;
        break;
      default:
        goto LABEL_30;
    }
    goto LABEL_30;
  }
  if (v6 <= 32)
  {
    if (v6 != 23)
    {
      if (v6 == 25)
LABEL_11:
        v9 = 2000;
      goto LABEL_30;
    }
LABEL_12:
    v9 = 1013;
    goto LABEL_30;
  }
  if (v6 == 33)
    goto LABEL_12;
  if (v6 != 35)
  {
    if (v6 != 38)
      goto LABEL_30;
    goto LABEL_12;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_fault_impl(&dword_1BE990000, v19, OS_LOG_TYPE_FAULT, "Programmer error starting MMCS request.", v21, 2u);
  }
  v9 = 2022;
LABEL_30:

  return v9;
}

+ (int64_t)_errorCodeWithMMCSGetError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int isEqualToString;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  v3 = a3;
  v6 = objc_msgSend_code(v3, v4, v5);
  if (v6 > 28)
  {
    if (v6 > 38)
    {
      if (v6 == 39)
      {
        objc_msgSend_userInfo(v3, v7, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v13, *MEMORY[0x1E0CB3388]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14
          && (objc_msgSend_domain(v14, v15, v16),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              isEqualToString = objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E0C9AFD0]),
              v17,
              isEqualToString))
        {
          if (objc_msgSend_code(v14, v20, v21) == 69)
          {
            v11 = 3007;
          }
          else if (objc_msgSend_code(v14, v22, v23) == 28)
          {
            v11 = 3008;
          }
          else
          {
            v11 = 0;
          }
        }
        else
        {
          v11 = 0;
        }

      }
      else if (v6 == 48)
      {
        v11 = 3013;
      }
      else
      {
        v11 = 0;
      }
    }
    else if (v6 == 29 || v6 == 32)
    {
      v11 = 3006;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v9 = 2000;
    v10 = 3006;
    if (v6 != 28)
      v10 = 0;
    if (v6 != 12)
      v9 = v10;
    if ((unint64_t)(v6 - 20) >= 2)
      v11 = v9;
    else
      v11 = 3006;
  }

  return v11;
}

+ (int64_t)_errorCodeWithMMCSPutError:(id)a3
{
  uint64_t v3;
  int64_t result;

  v3 = objc_msgSend_code(a3, a2, (uint64_t)a3);
  result = 0;
  if (v3 > 26)
  {
    switch(v3)
    {
      case 27:
        return 3006;
      case 28:
        return 3003;
      case 29:
        return 3006;
    }
  }
  else
  {
    switch(v3)
    {
      case 11:
      case 12:
        return 3003;
      case 13:
      case 14:
      case 15:
      case 16:
        return result;
      case 17:
        result = 2000;
        break;
      case 18:
        return 3006;
      default:
        if (v3 == 2)
          return 3006;
        if (v3 == 5)
          result = 1013;
        else
          result = 0;
        break;
    }
  }
  return result;
}

+ (int64_t)_errorCodeWithMMCSRegisterError:(id)a3
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = objc_msgSend_code(a3, a2, (uint64_t)a3);
  v4 = 3003;
  v5 = 3006;
  if (v3 != 18)
    v5 = 0;
  if (v3 != 28)
    v4 = v5;
  if (v3 == 29)
    return 3006;
  else
    return v4;
}

+ (id)_errorWithMMCSError:(id)a3 path:(id)a4 description:(id)a5 operationType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  int isEqualToString;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  int64_t v51;
  id v52;
  id v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v16 = v13;
  v17 = *MEMORY[0x1E0D46750];
  v18 = (uint64_t *)MEMORY[0x1E0C94B20];
  if (!v13)
  {
LABEL_8:
    objc_msgSend_domain(v16, v14, v15);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v41, v42, v17);

    if (!isEqualToString)
    {
      v24 = 0;
      v46 = 3001;
      goto LABEL_23;
    }
    v45 = objc_msgSend__commonErrorCodeWithMMCSError_(a1, v44, (uint64_t)v16);
    if (v45)
    {
      v46 = v45;
LABEL_22:
      v24 = 0;
      goto LABEL_23;
    }
    if ((unint64_t)a6 <= 6)
    {
      if (((1 << a6) & 0xA) != 0)
      {
        v47 = objc_msgSend__errorCodeWithMMCSPutError_(a1, v44, (uint64_t)v16);
      }
      else if (((1 << a6) & 0x14) != 0)
      {
        v47 = objc_msgSend__errorCodeWithMMCSGetError_(a1, v44, (uint64_t)v16);
      }
      else
      {
        if (((1 << a6) & 0x60) == 0)
          goto LABEL_26;
        v47 = objc_msgSend__errorCodeWithMMCSRegisterError_(a1, v44, (uint64_t)v16);
      }
      v46 = v47;
      if (v47)
        goto LABEL_22;
    }
LABEL_26:
    objc_msgSend__userInfoFromMMCSRetryableError_(a1, v44, (uint64_t)v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 2022;
LABEL_23:
    objc_msgSend_secureCodableError_(MEMORY[0x1E0C94FF8], v44, (uint64_t)v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v49, *v18, v46, v24, v48, v11, 0, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    goto LABEL_25;
  }
  v51 = a6;
  v52 = a1;
  v53 = v12;
  v19 = v11;
  v20 = *MEMORY[0x1E0C947D8];
  v21 = *MEMORY[0x1E0C94B20];
  v22 = *MEMORY[0x1E0CB3388];
  v23 = v13;
  while (1)
  {
    objc_msgSend_domain(v23, v14, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v24, v25, v20) & 1) != 0)
    {
      v11 = v19;
      v12 = v53;
      goto LABEL_24;
    }
    objc_msgSend_domain(v23, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_isEqualToString_(v28, v29, v21);

    if ((v30 & 1) != 0)
      break;
    objc_msgSend_domain(v23, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_isEqualToString_(v33, v34, v17);

    if (v35)
    {
      objc_msgSend_userInfo(v23, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v38, v39, v22);
      v40 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v40;
      if (v40)
        continue;
    }
    v11 = v19;
    a1 = v52;
    v12 = v53;
    v18 = (uint64_t *)MEMORY[0x1E0C94B20];
    a6 = v51;

    goto LABEL_8;
  }
  v11 = v19;
  v12 = v53;
LABEL_25:

  return v23;
}

+ (id)_errorWithMMCSError:(id)a3 description:(id)a4 operationType:(int64_t)a5
{
  return (id)objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, a2, (uint64_t)a3, 0, a4, a5);
}

+ (id)sharedWrappersByPath
{
  if (qword_1ED702AA0 != -1)
    dispatch_once(&qword_1ED702AA0, &unk_1E78344C0);
  return (id)qword_1ED702A98;
}

+ (void)purgeMMCSDirectoryWithPath:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  void *isDirectory;
  uint64_t v11;
  const char *v12;
  int ResourceValue_forKey_error;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, a1, CFSTR("CKDMMCS.m"), 413, CFSTR("Expected non-nil path: %@"), 0);

  }
  v8 = objc_alloc(MEMORY[0x1E0C99E98]);
  isDirectory = (void *)objc_msgSend_initFileURLWithPath_isDirectory_(v8, v9, (uint64_t)v7, 1);
  v46 = 0;
  v11 = *MEMORY[0x1E0C999D0];
  v45 = 0;
  ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(isDirectory, v12, (uint64_t)&v46, v11, &v45);
  v14 = v46;
  v17 = v45;
  if (ResourceValue_forKey_error)
    v18 = v14 == 0;
  else
    v18 = 1;
  if (!v18 && (objc_msgSend_BOOLValue(v14, v15, v16) & 1) != 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v17;
    v23 = objc_msgSend_removeItemAtPath_error_(v21, v22, (uint64_t)v7, &v44);
    v24 = v44;

    v25 = (void *)*MEMORY[0x1E0C952F8];
    if ((v23 & 1) != 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v25);
      v26 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        goto LABEL_23;
      v27 = v26;
      objc_msgSend_CKSanitizedPath(v7, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      v31 = "Removed dir at %{public}@";
      v32 = v27;
      v33 = 12;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v25);
      v35 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        goto LABEL_23;
      v27 = v35;
      objc_msgSend_CKSanitizedPath(v7, v36, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v30;
      v49 = 2112;
      v50 = v24;
      v31 = "Warn: Failed to remove dir at %{public}@: %@";
      v32 = v27;
      v33 = 22;
    }
    _os_log_impl(&dword_1BE990000, v32, OS_LOG_TYPE_INFO, v31, buf, v33);

LABEL_23:
    goto LABEL_24;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v34 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v38 = v34;
    objc_msgSend_CKSanitizedPath(v7, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v41;
    v49 = 2112;
    v50 = v17;
    v51 = 2114;
    v52 = v14;
    _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Skipping remove dir at %{public}@: %@ %{public}@", buf, 0x20u);

  }
  v24 = v17;
LABEL_24:

}

+ (id)MMCSWrapperForApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  const char *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  v11 = a3;
  v12 = a4;
  v15 = a5;
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, a1, CFSTR("CKDMMCS.m"), 432, CFSTR("Expected non-nil application bundle ID"));

  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1BE9BB088;
  v43 = sub_1BE9BADF8;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1BE9BB088;
  v37 = sub_1BE9BADF8;
  v38 = 0;
  objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB3C3EC;
  block[3] = &unk_1E78344E8;
  v29 = &v33;
  v17 = v12;
  v26 = v17;
  v30 = &v45;
  v18 = v11;
  v27 = v18;
  v19 = v15;
  v28 = v19;
  v31 = &v39;
  v32 = a1;
  dispatch_sync(v16, block);

  if (!*((_BYTE *)v46 + 24))
  {
    v20 = (void *)v34[5];
    v34[5] = 0;

    if (a6)
      *a6 = objc_retainAutorelease((id)v40[5]);
  }
  v21 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v21;
}

- (CKDMMCS)initWithMMCSEngineContext:(id)a3 directoryContext:(id)a4
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  CKDMMCS *v12;
  CKDMMCS *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *path;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSURL *temporaryDirectory;
  NSMutableSet *v22;
  NSMutableSet *trackedItemIDs;
  void *v25;
  const char *v26;
  objc_super v27;

  v8 = a3;
  v11 = a4;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDMMCS.m"), 493, CFSTR("Expected non-nil MMCS engine context"));

  }
  v27.receiver = self;
  v27.super_class = (Class)CKDMMCS;
  v12 = -[CKDMMCS init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_MMCSEngineContext, a3);
    objc_msgSend_mmcsWorkingDirectory(v11, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    path = v13->_path;
    v13->_path = (NSURL *)v16;

    objc_msgSend_temporaryDirectory(v11, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    temporaryDirectory = v13->_temporaryDirectory;
    v13->_temporaryDirectory = (NSURL *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    trackedItemIDs = v13->_trackedItemIDs;
    v13->_trackedItemIDs = v22;

  }
  return v13;
}

- (void)dealloc
{
  CKDMMCS *v2;
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CKDMMCS *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v3 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_1BE990000, v3, OS_LOG_TYPE_ERROR, "Failed to drop %@", buf, 0xCu);
    }
    if (!v2->_didDrop)
      __assert_rtn("-[CKDMMCS dealloc]", "CKDMMCS.m", 507, "_didDrop && \"Failed to drop CKDMMCS dealloc\");
  }
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)CKDMMCS;
  -[CKDMMCS dealloc](&v4, sel_dealloc);
}

- (_mmcs_engine)getMMCSEngine
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  _mmcs_engine *v16;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  CKDMMCS *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = self;
      v25 = 2114;
      v26 = v22;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v23, 0x16u);

    }
    __assert_rtn("-[CKDMMCS getMMCSEngine]", "CKDMMCS.m", 515, "0 && \"already dropped\");
  }
  objc_msgSend_MMCSEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKDMMCS.m"), 516, CFSTR("Expected non-nil MMCS engine context"));

  }
  objc_msgSend_MMCSEngineContext(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertMMCSSerialized(v8, v9, v10);

  objc_msgSend_MMCSEngineContext(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (_mmcs_engine *)objc_msgSend_MMCSEngine(v13, v14, v15);

  return v16;
}

- (unsigned)getMaxChunkCountForSection
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  CKDMMCS *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = self;
      v20 = 2114;
      v21 = v17;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v18, 0x16u);

    }
    __assert_rtn("-[CKDMMCS getMaxChunkCountForSection]", "CKDMMCS.m", 523, "0 && \"already dropped\");
  }
  objc_msgSend_MMCSEngineContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, CFSTR("CKDMMCS.m"), 524, CFSTR("Expected non-nil MMCS engine context"));

  }
  objc_msgSend_MMCSEngineContext(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_maxChunkCountForSection(v8, v9, v10);

  return v11;
}

- (id)_referenceIdentifierFromAssetKey:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  CC_LONG v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  CKDMMCS *v23;
  __int16 v24;
  _BYTE v25[10];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = self;
      v24 = 2114;
      *(_QWORD *)v25 = v21;
      _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v22, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _referenceIdentifierFromAssetKey:]", "CKDMMCS.m", 530, "0 && \"already dropped\");
  }
  v8 = v5;
  if (v5)
  {
    *(_DWORD *)&v25[2] = 0;
    v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, 0, 0, *(_QWORD *)&v25[2], v26);
    v12 = objc_msgSend_length(v8, v10, v11);
    CC_SHA1(v9, v12, (unsigned __int8 *)&v22);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)&v22, 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKLowercaseHexStringWithoutSpaces(v14, v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_logMMCSOptions:(id)a3
{
  id v5;
  const char *v6;
  void *v7;
  CKDMMCS *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  CKDMMCS *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2114;
      v17 = v12;
      _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _logMMCSOptions:]", "CKDMMCS.m", 548, "0 && \"already dropped\");
  }
  v7 = v5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB3D400;
  v13[3] = &unk_1E7834538;
  v13[4] = self;
  objc_msgSend_CKMapKeysAndValues_(v5, v6, (uint64_t)v13);
  v8 = (CKDMMCS *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Using MMCS options: %{public}@", buf, 0xCu);
  }

}

- (void)performOperationCleanup
{
  uint64_t v2;
  void *v4;
  const char *v5;
  _QWORD v6[5];

  objc_msgSend_MMCSEngineContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEB3D7D0;
  v6[3] = &unk_1E782EA40;
  v6[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v4, v5, (uint64_t)v6);

}

- (id)_contextToRegisterItemGroup:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  CKDMMCSItemGroupContext *v31;
  const char *v32;
  void *started;
  CKDRegisterOperationInfo *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t aBlock;
  uint64_t v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  id v46;
  id v47;
  id v48;
  CKDMMCS *v49;
  _BYTE *v50;
  unint64_t v51;
  BOOL v52;
  _BYTE buf[24];
  char v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v40 = v39;
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v41;
      _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _contextToRegisterItemGroup:operation:options:completionHandler:]", "CKDMMCS.m", 928, "0 && \"already dropped\");
  }
  v16 = v13;
  objc_msgSend_operationID(v12, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v12, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v54 = 0;
  aBlock = MEMORY[0x1E0C809B0];
  v43 = 3221225472;
  v44 = sub_1BEB3DAF0;
  v45 = &unk_1E78345B0;
  v51 = a5;
  v27 = v11;
  v46 = v27;
  v52 = (a5 & 4) != 0;
  v28 = v17;
  v47 = v28;
  v50 = buf;
  v29 = v26;
  v48 = v29;
  v49 = self;
  v30 = _Block_copy(&aBlock);
  v31 = [CKDMMCSItemGroupContext alloc];
  started = (void *)objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v31, v32, (uint64_t)self, v27, v12, 0, 0, v30, v16, aBlock, v43, v44, v45);
  v34 = [CKDRegisterOperationInfo alloc];
  v36 = (void *)objc_msgSend_initWithOptions_(v34, v35, a5);
  objc_msgSend_setOperationInfo_(started, v37, (uint64_t)v36);

  _Block_object_dispose(buf, 8);
  return started;
}

- (id)registerItemGroupSet:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKDMMCSItemGroupSetContext *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  CKDMMCS *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = self;
      v50 = 2114;
      v51 = v40;
      _os_log_error_impl(&dword_1BE990000, v39, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS registerItemGroupSet:operation:options:completionHandler:]", "CKDMMCS.m", 1019, "0 && \"already dropped\");
  }
  v14 = v13;
  v15 = [CKDMMCSItemGroupSetContext alloc];
  v41 = v14;
  v17 = (void *)objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v15, v16, (uint64_t)v11, v14);
  v19 = v17;
  if ((a5 & 0x42) != 0)
    objc_msgSend_setMmcsOperationType_(v17, v18, 6);
  else
    objc_msgSend_setMmcsOperationType_(v17, v18, 5);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v42 = v11;
  objc_msgSend_allItemGroups(v11, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v47, 16);
  if (v24)
  {
    v27 = v24;
    v28 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v22);
        v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend_itemGroupCompletionBlock(v19, v25, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__contextToRegisterItemGroup_operation_options_completionHandler_(self, v32, v30, v12, a5, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addItemGroupContext_(v19, v34, (uint64_t)v33);
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v47, 16);
    }
    while (v27);
  }

  objc_msgSend_start(v19, v35, v36);
  return v19;
}

- (id)_contextToGetItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 command:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  CKDMMCSItemGroupContext *v37;
  const char *v38;
  void *started;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  CKDMMCS *v50;
  id v51;
  SEL v52;
  uint8_t buf[4];
  CKDMMCS *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v44 = a6;
  v17 = a7;
  v18 = a8;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v42 = v41;
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = self;
      v55 = 2114;
      v56 = v43;
      _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _contextToGetItemGroup:operation:options:progress:command:completionHandler:]", "CKDMMCS.m", 1044, "0 && \"already dropped\");
  }
  v21 = v18;
  objc_msgSend_operationID(v15, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v15, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB3E8A8;
  aBlock[3] = &unk_1E78345D8;
  v47 = v14;
  v48 = v22;
  v49 = v16;
  v50 = self;
  v51 = v31;
  v52 = a2;
  v32 = v31;
  v33 = v16;
  v34 = v22;
  v35 = v14;
  v36 = _Block_copy(aBlock);
  v37 = [CKDMMCSItemGroupContext alloc];
  started = (void *)objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v37, v38, (uint64_t)self, v35, v15, v44, v17, v36, v21);

  return started;
}

- (id)getItemGroupSet:(id)a3 operation:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5 options:(id)a6 progress:(id)a7 command:(id)a8 completionHandler:(id)a9
{
  CKDMMCS *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  CKDMMCSItemGroupSetContext *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  CKDMMCSGetOperationInfo *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  int v49;
  const char *v50;
  BOOL v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  CKDMMCS *v64;
  id v65;
  id obj;
  CKDMMCS *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  CKDMMCS *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v15 = (CKDMMCS *)a3;
  v16 = a4;
  v17 = a6;
  v65 = a7;
  v69 = a8;
  v18 = a9;
  v68 = self;
  v19 = (void *)*MEMORY[0x1E0C952F8];
  v20 = *MEMORY[0x1E0C95300];
  if (self->_didDrop)
  {
    if (v20 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v19);
    v60 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v76 = self;
      v77 = 2114;
      v78 = v62;
      _os_log_error_impl(&dword_1BE990000, v61, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS getItemGroupSet:operation:shouldFetchAssetContentInMemory:options:progress:command:completionHandler:]", "CKDMMCS.m", 1172, "0 && \"already dropped\");
  }
  v21 = v18;
  if (v20 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v19);
  v22 = v65;
  v23 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v56 = v23;
    objc_msgSend_operationID(v16, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v76 = v15;
    v77 = 2114;
    v78 = v59;
    v79 = 2112;
    v80 = v17;
    _os_log_debug_impl(&dword_1BE990000, v56, OS_LOG_TYPE_DEBUG, "Getting MMCS item group set %@ for operationID:%{public}@ with options %@", buf, 0x20u);

  }
  v24 = [CKDMMCSItemGroupSetContext alloc];
  v63 = v21;
  v26 = (void *)objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v24, v25, (uint64_t)v15, v21);
  objc_msgSend_setMmcsOperationType_(v26, v27, 2);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v64 = v15;
  objc_msgSend_allItemGroups(v15, v28, v29);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v70, v74, 16);
  if (v31)
  {
    v34 = v31;
    v35 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v71 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend_itemGroupCompletionBlock(v26, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__contextToGetItemGroup_operation_options_progress_command_completionHandler_(v68, v39, v37, v16, v17, v22, v69, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = objc_alloc_init(CKDMMCSGetOperationInfo);
        if (a5)
        {
          objc_msgSend_setDestination_(v43, v41, 1);
        }
        else
        {
          objc_msgSend_operationInfo(v16, v41, v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v17;
          v49 = objc_msgSend_usesAssetDownloadStagingManager(v45, v46, v47);

          v51 = v49 == 0;
          v17 = v48;
          v22 = v65;
          if (v51)
            objc_msgSend_setDestination_(v43, v50, 0);
          else
            objc_msgSend_setDestination_(v43, v50, 2);
        }
        objc_msgSend_setOperationInfo_(v40, v44, (uint64_t)v43);
        objc_msgSend_addItemGroupContext_(v26, v52, (uint64_t)v40);

      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v70, v74, 16);
    }
    while (v34);
  }

  objc_msgSend_start(v26, v53, v54);
  return v26;
}

- (id)_contextToPutItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  CKDMMCSItemGroupContext *v35;
  const char *v36;
  void *started;
  void *v39;
  NSObject *v40;
  void *v41;
  _QWORD aBlock[4];
  id v44;
  id v45;
  id v46;
  CKDMMCS *v47;
  id v48;
  SEL v49;
  uint8_t buf[4];
  CKDMMCS *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v40 = v39;
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = self;
      v52 = 2114;
      v53 = v41;
      _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _contextToPutItemGroup:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1201, "0 && \"already dropped\");
  }
  v19 = v16;
  objc_msgSend_operationID(v13, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v13, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB3F980;
  aBlock[3] = &unk_1E78345D8;
  v44 = v12;
  v45 = v20;
  v46 = v14;
  v47 = self;
  v48 = v29;
  v49 = a2;
  v30 = v29;
  v31 = v14;
  v32 = v20;
  v33 = v12;
  v34 = _Block_copy(aBlock);
  v35 = [CKDMMCSItemGroupContext alloc];
  started = (void *)objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v35, v36, (uint64_t)self, v33, v13, v15, 0, v34, v19);

  return started;
}

- (id)putItemGroupSet:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  CKDMMCS *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  CKDMMCSItemGroupSetContext *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  CKDMMCS *v52;
  CKDMMCS *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  CKDMMCS *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = (CKDMMCS *)a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v53 = self;
  v18 = (void *)*MEMORY[0x1E0C952F8];
  v19 = *MEMORY[0x1E0C95300];
  if (self->_didDrop)
  {
    if (v19 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v18);
    v48 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = self;
      v61 = 2114;
      v62 = v50;
      _os_log_error_impl(&dword_1BE990000, v49, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS putItemGroupSet:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1306, "0 && \"already dropped\");
  }
  v20 = v17;
  if (v19 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v18);
  v21 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v44 = v21;
    objc_msgSend_operationID(v14, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v60 = v13;
    v61 = 2114;
    v62 = v47;
    v63 = 2112;
    v64 = v15;
    _os_log_debug_impl(&dword_1BE990000, v44, OS_LOG_TYPE_DEBUG, "Putting MMCS item group set %@ for operationID:%{public}@ with options %@", buf, 0x20u);

  }
  v22 = [CKDMMCSItemGroupSetContext alloc];
  v51 = v20;
  v24 = (void *)objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v22, v23, (uint64_t)v13, v20);
  objc_msgSend_setMmcsOperationType_(v24, v25, 1);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = v13;
  objc_msgSend_allItemGroups(v13, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v54, v58, 16);
  if (v30)
  {
    v33 = v30;
    v34 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v28);
        v36 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend_itemGroupCompletionBlock(v24, v31, v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__contextToPutItemGroup_operation_options_progress_completionHandler_(v53, v38, v36, v14, v15, v16, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addItemGroupContext_(v24, v40, (uint64_t)v39);
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v54, v58, 16);
    }
    while (v33);
  }

  objc_msgSend_start(v24, v41, v42);
  return v24;
}

- (id)retrieveChunkWithSignature:(id)a3
{
  id v4;
  _QWORD *v5;
  os_log_t *v6;
  NSObject *v7;
  C3DownloadChunkContext *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  os_log_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, const char *, uint64_t);
  void *v39;
  CKDMMCS *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  CKDMMCS *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (os_log_t *)MEMORY[0x1E0C952B0];
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v45 = self;
    v46 = 2112;
    v47 = v4;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "[%@ retrieveChunkWithSignature:%@] starting", buf, 0x16u);
  }
  v8 = [C3DownloadChunkContext alloc];
  v10 = (void *)objc_msgSend_initWithMMCS_(v8, v9, (uint64_t)self);
  v52[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v52, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend_MMCSEngineContext(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = sub_1BEB40894;
  v39 = &unk_1E782F4A8;
  v40 = self;
  v17 = v10;
  v41 = v17;
  v18 = v13;
  v42 = v18;
  v19 = v12;
  v43 = v19;
  objc_msgSend_MMCSSerializeSyncRecursive_(v16, v20, (uint64_t)&v36);

  objc_msgSend_signatureToMutableData(v17, v21, v22, v36, v37, v38, v39, v40);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (*v5 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v26 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    v32 = v26;
    objc_msgSend_signatureToMutableData(v17, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v45 = self;
    v46 = 2112;
    v47 = v4;
    v48 = 2112;
    v49 = v25;
    v50 = 2112;
    v51 = v35;
    _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "[%@ retrieveChunkWithSignature:%@] found %@ with %@", buf, 0x2Au);

  }
  if (objc_msgSend_length(v25, v27, v28))
    v29 = v25;
  else
    v29 = 0;
  v30 = v29;

  return v30;
}

- (id)registeredMMCSItemForRereferencedAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE9BB088;
  v19 = sub_1BE9BADF8;
  v20 = 0;
  objc_msgSend_MMCSEngineContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEB40BD0;
  v12[3] = &unk_1E7831BB8;
  v14 = &v15;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v7, v9, (uint64_t)v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)CKStatusReportArray
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS CKStatusReportArray]", "CKDMMCS.m", 1353, "0 && \"already dropped\");
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = sub_1BE9BB088;
  v17 = sub_1BE9BADF8;
  v18 = CFSTR("Empty MMCS Status");
  objc_msgSend_MMCSEngineContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB40EC8;
  v13[3] = &unk_1E78303D8;
  v13[4] = self;
  v13[5] = buf;
  objc_msgSend_MMCSSerializeSyncRecursive_(v4, v5, (uint64_t)v13);

  v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)&v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(buf, 8);

  return v7;
}

- (BOOL)_getRegisteredItemsGreaterThan:(unint64_t)a3 itemIds:(unint64_t *)a4 itemCount:(unint64_t *)a5 error:(id *)a6
{
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[3];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = 138412546;
      *(_QWORD *)&v12[1] = self;
      v13 = 2114;
      v14 = v11;
      _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)v12, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _getRegisteredItemsGreaterThan:itemIds:itemCount:error:]", "CKDMMCS.m", 1362, "0 && \"already dropped\");
  }
  objc_msgSend_getMMCSEngine(self, a2, a3);
  return MMCSGetRegisteredItems() != 0;
}

- (BOOL)registeredItemCount:(unint64_t *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  void *v9;
  char v10;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS registeredItemCount:error:]", "CKDMMCS.m", 1378, "0 && \"already dropped\");
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend_MMCSEngineContext(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEB412C0;
  v16[3] = &unk_1E7834628;
  v16[4] = self;
  v16[5] = buf;
  v16[6] = &v17;
  v16[7] = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v7, v8, (uint64_t)v16);

  v9 = (void *)v18[3];
  if (v9)
  {
    if (a4)
    {
      *a4 = v9;
    }
    else
    {
      CFRelease(v9);
      v18[3] = 0;
    }
  }
  v10 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(buf, 8);
  return v10;
}

- (void)showRegisteredItemsInContainer:(id)a3
{
  const char *v5;
  char v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  CKDMMCSItem *v23;
  const char *v24;
  const char *v25;
  unint64_t v26;
  NSObject *v27;
  CKDMMCSItemGroupSet *v28;
  const char *v29;
  CKDOperation *v30;
  void *v31;
  const char *v32;
  dispatch_semaphore_t v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  unint64_t v57;
  __int128 v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD v71[10];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  id obj;
  unint64_t v77;
  uint8_t v78[128];
  uint8_t buf[4];
  unint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v86[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89[5];

  v89[2] = *(id *)MEMORY[0x1E0C80C00];
  v59 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v54 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v55 = v54;
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v86 = 138412546;
      *(_QWORD *)&v86[4] = self;
      *(_WORD *)&v86[12] = 2114;
      *(_QWORD *)&v86[14] = v56;
      _os_log_error_impl(&dword_1BE990000, v55, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", v86, 0x16u);

    }
    __assert_rtn("-[CKDMMCS showRegisteredItemsInContainer:]", "CKDMMCS.m", 1396, "0 && \"already dropped\");
  }
  obj = 0;
  v77 = 0;
  *(_QWORD *)v86 = 0;
  *(_QWORD *)&v86[8] = v86;
  *(_QWORD *)&v86[16] = 0x3032000000;
  v87 = sub_1BE9BB088;
  v88 = sub_1BE9BADF8;
  v89[0] = 0;
  v6 = objc_msgSend_registeredItemCount_error_(self, v5, (uint64_t)&v77, &obj);
  objc_storeStrong(v89, obj);
  v7 = (void *)*MEMORY[0x1E0C952F8];
  if ((v6 & 1) != 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v7);
    v8 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v83) = 134217984;
      *(_QWORD *)((char *)&v83 + 4) = v77;
      _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "MMCS has %llu registered items.", (uint8_t *)&v83, 0xCu);
    }
    v9 = v77;
    if (v77 <= 0x64)
      v9 = 100;
    *(_QWORD *)&v83 = 0;
    *((_QWORD *)&v83 + 1) = &v83;
    if (v9 >= 0x3E8)
      v10 = 1000;
    else
      v10 = v9;
    v84 = 0x2020000000;
    v85 = 0;
    v13 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    v14 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    v15 = *((_QWORD *)&v83 + 1);
    *(_QWORD *)&v16 = 134218240;
    v58 = v16;
    v60 = v10;
    while (1)
    {
      *(_QWORD *)(v15 + 24) = v10;
      objc_msgSend_MMCSEngineContext(self, v11, v12, v58);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = sub_1BEB41B44;
      v71[3] = &unk_1E7834650;
      v71[4] = self;
      v71[5] = &v72;
      v71[8] = v14;
      v71[9] = v13;
      v71[6] = &v83;
      v71[7] = v86;
      objc_msgSend_MMCSSerializeSyncRecursive_(v17, v18, (uint64_t)v71);

      if (!*((_BYTE *)v73 + 24))
        break;
      if (*(_QWORD *)(*((_QWORD *)&v83 + 1) + 24))
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(int *)(*((_QWORD *)&v83 + 1) + 24) >= 1)
        {
          v20 = 0;
          while (1)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v21 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v26 = v13[v20];
              *(_DWORD *)buf = 134217984;
              v80 = v26;
              _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "MMCS itemID %llu registered.", buf, 0xCu);
            }
            v22 = v13[v20];
            if (v14 >= v22)
              break;
            v23 = objc_alloc_init(CKDMMCSItem);
            objc_msgSend_setItemID_(v23, v24, v13[v20]);
            objc_msgSend_addObject_(v19, v25, (uint64_t)v23);

            ++v20;
            v14 = v22;
            if (v20 >= *(int *)(*((_QWORD *)&v83 + 1) + 24))
              goto LABEL_29;
          }
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v27 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v50 = v13[v20];
            *(_DWORD *)buf = v58;
            v80 = v14;
            v81 = 2048;
            v82 = v50;
            _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "Expected registered item IDs to be ordered ascending: Previous itemId %llu is not less than %llu.", buf, 0x16u);
          }
        }
        v22 = v14;
LABEL_29:
        v28 = [CKDMMCSItemGroupSet alloc];
        v64 = (void *)objc_msgSend_initWithItems_(v28, v29, (uint64_t)v19);
        v30 = [CKDOperation alloc];
        v31 = (void *)objc_opt_new();
        v63 = (void *)objc_msgSend_initWithOperationInfo_container_(v30, v32, (uint64_t)v31, v59);

        v33 = dispatch_semaphore_create(0);
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = sub_1BEB41BB4;
        v69[3] = &unk_1E7834678;
        v34 = v33;
        v70 = v34;
        objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(self, v35, (uint64_t)v64, v63, 4, v69);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v34;
        dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend_allItemGroups(v64, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v65, v78, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v66 != v43)
                objc_enumerationMutation(v38);
              objc_msgSend_items(*(void **)(*((_QWORD *)&v65 + 1) + 8 * i), v40, v41);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_assetCache(self, v46, v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_checkAssetHandlesForRegisteredMMCSItems_(v48, v49, (uint64_t)v45);

            }
            v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v65, v78, 16);
          }
          while (v42);
        }

        v14 = v22;
      }
      v10 = v60;
      v15 = *((_QWORD *)&v83 + 1);
      if (*(_QWORD *)(*((_QWORD *)&v83 + 1) + 24) != v60)
        goto LABEL_47;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v53 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v57 = *(_QWORD *)(*(_QWORD *)&v86[8] + 40);
      *(_DWORD *)buf = 138412290;
      v80 = v57;
      _os_log_error_impl(&dword_1BE990000, v53, OS_LOG_TYPE_ERROR, "Error enumerating registered items %@", buf, 0xCu);
    }
LABEL_47:
    free(v13);
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v83, 8);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v7);
    v51 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v52 = *(_QWORD *)(*(_QWORD *)&v86[8] + 40);
      LODWORD(v83) = 138412290;
      *(_QWORD *)((char *)&v83 + 4) = v52;
      _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Error counting registered items %@", (uint8_t *)&v83, 0xCu);
    }
  }
  _Block_object_dispose(v86, 8);

}

- (void)_unregisterItemIDs:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void **v18;
  dispatch_once_t *v19;
  os_log_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  dispatch_once_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  CKDMMCS *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  CKDMMCS *v40;
  void *v41;
  id obj;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  CKDMMCS *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_didDrop)
  {
    v36 = self;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v37 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v36;
      v51 = 2114;
      v52 = v39;
      _os_log_error_impl(&dword_1BE990000, v38, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _unregisterItemIDs:]", "CKDMMCS.m", 1457, "0 && \"already dropped\");
  }
  v8 = v5;
  v9 = objc_msgSend_count(v5, v6, v7);
  if (v9)
  {
    v10 = v9;
    v40 = self;
    v43 = malloc_type_calloc(8uLL, v9, 0xDD10C7CuLL);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v41 = v8;
    obj = v8;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v44, v48, 16);
    if (v12)
    {
      v15 = v12;
      v16 = 0;
      v17 = *(_QWORD *)v45;
      v18 = (void **)MEMORY[0x1E0C952F8];
      v19 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      v20 = (os_log_t *)MEMORY[0x1E0C952B0];
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(obj);
          v22 = objc_msgSend_unsignedLongLongValue(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v21), v13, v14, v40);
          v23 = *v18;
          v24 = *v19;
          if (v22)
          {
            v25 = v22;
            if (v24 != -1)
              dispatch_once(v19, v23);
            v26 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v50 = (CKDMMCS *)v25;
              _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Unregistering itemID=%llu with MMCS", buf, 0xCu);
            }
            v43[v16++] = v25;
          }
          else
          {
            if (v24 != -1)
              dispatch_once(v19, v23);
            v27 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "_unregisterItemIDs Zero itemID", buf, 2u);
            }
            --v10;
          }
          ++v21;
        }
        while (v15 != v21);
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v44, v48, 16);
      }
      while (v15);
    }

    objc_msgSend_getMMCSEngine(v40, v28, v29);
    if (HIDWORD(v10))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v33, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v32, v35, (uint64_t)v34, CFSTR("CloudKit-Prefix.pch"), 34, CFSTR("That number was ridiculous"));

    }
    MMCSUnregisterFiles();
    free(v43);
    v8 = v41;
  }

}

- (void)unregisterItemIDs:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  CKDMMCS *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2114;
      v20 = v14;
      _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS unregisterItemIDs:]", "CKDMMCS.m", 1479, "0 && \"already dropped\");
  }
  v8 = v5;
  objc_msgSend_MMCSEngineContext(self, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEB42100;
  v15[3] = &unk_1E782EE20;
  v15[4] = self;
  v16 = v8;
  v10 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v9, v11, (uint64_t)v15);

}

- (id)_contextToPutSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  id v29;
  __CFString *v30;
  id v31;
  void *v32;
  CKDMMCSItemGroup *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  CKDMMCSItemGroupContext *v47;
  const char *v48;
  void *started;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  CKDMMCS *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD aBlock[4];
  id v63;
  CKDMMCS *v64;
  id v65;
  __CFString *v66;
  id v67;
  SEL v68;
  uint8_t v69[128];
  uint8_t buf[4];
  CKDMMCS *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v57 = a6;
  v56 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = self;
      v72 = 2114;
      v73 = v53;
      _os_log_error_impl(&dword_1BE990000, v52, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _contextToPutSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1490, "0 && \"already dropped\");
  }
  objc_msgSend_operationID(v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v14, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();

  if (v27)
    v28 = (__CFString *)v27;
  else
    v28 = &stru_1E7838F48;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB4249C;
  aBlock[3] = &unk_1E78345D8;
  v29 = v13;
  v68 = a2;
  v63 = v29;
  v64 = self;
  v55 = self;
  v54 = v15;
  v65 = v54;
  v30 = v28;
  v66 = v30;
  v31 = v18;
  v67 = v31;
  v32 = _Block_copy(aBlock);
  v33 = [CKDMMCSItemGroup alloc];
  objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v34, (uint64_t)v29);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_initWithTuple_(v33, v36, (uint64_t)v35);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend_sectionItems(v29, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v58, v69, 16);
  if (v42)
  {
    v44 = v42;
    v45 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(v40);
        objc_msgSend_addItem_(v37, v43, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v58, v69, 16);
    }
    while (v44);
  }

  v47 = [CKDMMCSItemGroupContext alloc];
  started = (void *)objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v47, v48, (uint64_t)v55, v37, v14, v57, 0, v32, v56);

  return started;
}

- (id)putSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  CKDMMCS *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t shouldCloneFileInAssetCache;
  const char *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  CKDMMCS *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = (CKDMMCS *)a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)*MEMORY[0x1E0C952F8];
  v19 = *MEMORY[0x1E0C95300];
  if (self->_didDrop)
  {
    if (v19 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v18);
    v36 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = self;
      v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v39, 0x16u);

    }
    __assert_rtn("-[CKDMMCS putSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1581, "0 && \"already dropped\");
  }
  v20 = v17;
  if (v19 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v18);
  v21 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v32 = v21;
    objc_msgSend_operationID(v14, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412802;
    v40 = v13;
    v41 = 2114;
    v42 = v35;
    v43 = 2112;
    v44 = v15;
    _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Putting MMCS section item %@ for operationID:%{public}@ with options %@", (uint8_t *)&v39, 0x20u);

  }
  objc_msgSend__contextToPutSectionItem_operation_options_progress_completionHandler_(self, v22, (uint64_t)v13, v14, v15, v16, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMmcsOperationType_(v23, v24, 3);
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v14, v25, v26);
  objc_msgSend_setShouldCloneFileInAssetCache_(v23, v28, shouldCloneFileInAssetCache);
  objc_msgSend_start(v23, v29, v30);

  return v23;
}

- (id)_contextToGetSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  id v29;
  __CFString *v30;
  id v31;
  void *v32;
  CKDMMCSItemGroup *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  CKDMMCSItemGroupContext *v47;
  const char *v48;
  void *started;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  CKDMMCS *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD aBlock[4];
  id v63;
  CKDMMCS *v64;
  id v65;
  __CFString *v66;
  id v67;
  SEL v68;
  uint8_t v69[128];
  uint8_t buf[4];
  CKDMMCS *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v57 = a6;
  v56 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = self;
      v72 = 2114;
      v73 = v53;
      _os_log_error_impl(&dword_1BE990000, v52, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);

    }
    __assert_rtn("-[CKDMMCS _contextToGetSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1596, "0 && \"already dropped\");
  }
  objc_msgSend_operationID(v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v14, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();

  if (v27)
    v28 = (__CFString *)v27;
  else
    v28 = &stru_1E7838F48;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB430D4;
  aBlock[3] = &unk_1E78345D8;
  v29 = v13;
  v68 = a2;
  v63 = v29;
  v64 = self;
  v55 = self;
  v54 = v15;
  v65 = v54;
  v30 = v28;
  v66 = v30;
  v31 = v18;
  v67 = v31;
  v32 = _Block_copy(aBlock);
  v33 = [CKDMMCSItemGroup alloc];
  objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v34, (uint64_t)v29);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_initWithTuple_(v33, v36, (uint64_t)v35);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend_sectionItems(v29, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v58, v69, 16);
  if (v42)
  {
    v44 = v42;
    v45 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(v40);
        objc_msgSend_addItem_(v37, v43, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v58, v69, 16);
    }
    while (v44);
  }

  v47 = [CKDMMCSItemGroupContext alloc];
  started = (void *)objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v47, v48, (uint64_t)v55, v37, v14, v57, 0, v32, v56);

  return started;
}

- (id)getSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  CKDMMCS *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t shouldCloneFileInAssetCache;
  const char *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  CKDMMCS *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = (CKDMMCS *)a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)*MEMORY[0x1E0C952F8];
  v19 = *MEMORY[0x1E0C95300];
  if (self->_didDrop)
  {
    if (v19 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v18);
    v36 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = self;
      v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v39, 0x16u);

    }
    __assert_rtn("-[CKDMMCS getSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1703, "0 && \"already dropped\");
  }
  v20 = v17;
  if (v19 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v18);
  v21 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v32 = v21;
    objc_msgSend_operationID(v14, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412802;
    v40 = v13;
    v41 = 2114;
    v42 = v35;
    v43 = 2112;
    v44 = v15;
    _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Getting MMCS section item %@ for operationID:%{public}@ with options %@", (uint8_t *)&v39, 0x20u);

  }
  objc_msgSend__contextToGetSectionItem_operation_options_progress_completionHandler_(self, v22, (uint64_t)v13, v14, v15, v16, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMmcsOperationType_(v23, v24, 4);
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v14, v25, v26);
  objc_msgSend_setShouldCloneFileInAssetCache_(v23, v28, shouldCloneFileInAssetCache);
  objc_msgSend_start(v23, v29, v30);

  return v23;
}

- (void)startTrackingItemIDsForMMCSItems:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *trackedItemIDs;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        trackedItemIDs = self->_trackedItemIDs;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend_itemID(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v12), v8, v9, (_QWORD)v19);
        objc_msgSend_numberWithUnsignedLongLong_(v14, v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(trackedItemIDs, v18, (uint64_t)v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (void)stopTrackingItemIDsForMMCSItems:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *trackedItemIDs;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        trackedItemIDs = self->_trackedItemIDs;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = objc_msgSend_itemID(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v12), v8, v9, (_QWORD)v19);
        objc_msgSend_numberWithUnsignedLongLong_(v14, v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(trackedItemIDs, v18, (uint64_t)v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (BOOL)isTrackingItemID:(unint64_t)a3
{
  NSMutableSet *v5;
  NSMutableSet *trackedItemIDs;
  const char *v7;
  void *v8;
  const char *v9;

  v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  trackedItemIDs = self->_trackedItemIDs;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(trackedItemIDs) = objc_msgSend_containsObject_(trackedItemIDs, v9, (uint64_t)v8);

  objc_sync_exit(v5);
  return (char)trackedItemIDs;
}

- (NSURL)path
{
  return self->_path;
}

- (NSURL)temporaryDirectory
{
  return self->_temporaryDirectory;
}

- (CKDAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetCache, a3);
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- (int64_t)checkoutCount
{
  return self->_checkoutCount;
}

- (void)setCheckoutCount:(int64_t)a3
{
  self->_checkoutCount = a3;
}

- (CKDMMCSEngineContext)MMCSEngineContext
{
  return self->_MMCSEngineContext;
}

- (void)setMMCSEngineContext:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSEngineContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSEngineContext, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_trackedItemIDs, 0);
}

@end
