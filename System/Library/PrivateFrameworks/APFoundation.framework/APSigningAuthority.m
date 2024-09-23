@implementation APSigningAuthority

- (int64_t)state
{
  return self->_state;
}

- (APSigningContextStorage)signingContextStorage
{
  return self->_signingContextStorage;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_sha256(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__signatureForData_error_(self, v7, (uint64_t)v6, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_signatureForData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  const char *v56;
  NSObject *v57;
  NSObject *v58;
  const char *v59;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend_state(self, v7, v8, v9) == 17002)
  {
    objc_msgSend_signingContextStorage(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsed_(v13, v14, 1, v15);

    v16 = objc_retainAutorelease(v6);
    v20 = objc_msgSend_bytes(v16, v17, v18, v19);
    v24 = objc_msgSend_length(v16, v21, v22, v23);
    v62 = 0;
    v61 = 0;
    objc_msgSend_signingContextStorage(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_contextRef(v28, v29, v30, v31);
    v34 = objc_msgSend_FPDISignWithContext_message_messageLength_rawSignature_rawSignatureLength_(APFPDIWrapper, v33, v32, v20, v24, &v62, &v61);

    if ((_DWORD)v34)
    {
      if (a4)
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("failed with error code %d."), v36, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v38;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)&v64, (uint64_t)&v63, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v37, v41, (uint64_t)CFSTR("com.apple.ap.signingAuthorityErrorDomain"), 7202, v40);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      APLogForCategory(0x2AuLL);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136643075;
        v66 = "-[APSigningAuthority _signatureForData:error:]";
        v67 = 1024;
        LODWORD(v68) = v34;
        _os_log_impl(&dword_1CF251000, v42, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: FairPlaySAPSign failed with error code %d. Unable to generate signature - disabling request signing.", buf, 0x12u);
      }

      objc_msgSend_signingContextStorage(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_contextRef(v46, v47, v48, v49);

      objc_msgSend__setFailureStateWithErrorAndDestroyContext_contextRef_(self, v51, 7202, v50);
      v53 = 0;
    }
    else
    {
      APLogForCategory(0x2AuLL);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136642819;
        v66 = "-[APSigningAuthority _signatureForData:error:]";
        _os_log_impl(&dword_1CF251000, v58, OS_LOG_TYPE_DEBUG, "[%{sensitive}s]: Successfully got a signature", buf, 0xCu);
      }

      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v59, v62, v61);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend__destroyObject_ofType_(self, v52, (uint64_t)&v62, 1206);
  }
  else
  {
    if (a4)
    {
      v54 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2D50];
      v70[0] = CFSTR("Signing authority is not setup, can not sign data");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v70, (uint64_t)&v69, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v54, v56, (uint64_t)CFSTR("com.apple.ap.signingAuthorityErrorDomain"), 7202, v55);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    APLogForCategory(0x2AuLL);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v66 = "-[APSigningAuthority _signatureForData:error:]";
      v67 = 2114;
      v68 = CFSTR("Signing authority is not setup, can not sign data");
      _os_log_impl(&dword_1CF251000, v57, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: %{public}@", buf, 0x16u);
    }

    v53 = 0;
  }

  return v53;
}

- (void)_destroyObject:(void *)a3 ofType:(int64_t)a4
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4 == 1207)
  {
    if (!objc_msgSend_FPDIDestroyContext_(APFPDIWrapper, a2, (uint64_t)a3, 1207))
      goto LABEL_10;
  }
  else if (a4 == 1206)
  {
    if (!objc_msgSend_FPDIDestroyData_(APFPDIWrapper, a2, (uint64_t)a3, 1206))
      goto LABEL_10;
  }
  else if (a4 != 1205
         || !objc_msgSend_FPDIDestroyAttribute_(APFPDIWrapper, a2, (uint64_t)a3, 1205))
  {
LABEL_10:
    APLogForCategory(0x2AuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 136643075;
      v10 = "-[APSigningAuthority _destroyObject:ofType:]";
      v11 = 2050;
      v12 = a4;
      v6 = "[%{sensitive}s]: Successfully destroyed an object of type %{public}ld";
      v7 = v5;
      v8 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136643075;
    v10 = "-[APSigningAuthority _destroyObject:ofType:]";
    v11 = 2050;
    v12 = a4;
    v6 = "[%{sensitive}s]: Unsuccessfully attempted to destroy an object of type %{public}ld, object possibly no longer exists.";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
    _os_log_impl(&dword_1CF251000, v7, v8, v6, (uint8_t *)&v9, 0x16u);
  }
LABEL_13:

}

- (APSigningAuthority)initWithPoolName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  APSigningAuthority *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APSigningAuthority;
  v9 = -[APSigningAuthority init](&v15, sel_init);
  if (v9)
  {
    if ((objc_msgSend_isAllowedClient(APSigningClientValidator, v6, v7, v8) & 1) != 0)
    {
      objc_storeStrong((id *)&v9->_poolName, a3);
      v9->_failureError = 7204;
      v9->_state = 17005;
      APPerfLogForCategory(0x2AuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      v9->_signpostID = os_signpost_id_generate(v12);
    }
    else
    {
      objc_msgSend__setFailureStateWithError_(v9, v10, 7206, v11);
      v16 = CFSTR("finalStatus");
      v17[0] = &unk_1E8C5BB28;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v17, (uint64_t)&v16, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();
    }

  }
  return v9;
}

- (void)_setupNewContext:(BOOL)a3 withCompletion:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29[2];
  BOOL v30;
  void *v31;
  BOOL v32;
  uint8_t buf[4];
  APSigningAuthority *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = a4;
  APLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v34 = self;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "Setting up new context for authority %p", buf, 0xCu);
  }

  objc_msgSend_setState_(self, v7, 17001, v8);
  v31 = 0;
  objc_msgSend_poolName(self, v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15
    || (objc_msgSend_poolName(self, v12, v13, v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend_length(v16, v17, v18, v19) == 0,
        v16,
        v15,
        v20))
  {
    v32 = 0;
  }
  objc_msgSend__createContext_requestStashed_(self, v12, (uint64_t)&v31, (uint64_t)&v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_initWeak((id *)buf, self);
    v22 = (uint64_t)v31;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1CF289950;
    v27[3] = &unk_1E8C48BC8;
    objc_copyWeak(v29, (id *)buf);
    v29[1] = v31;
    v27[4] = self;
    v30 = v32;
    v28 = v5;
    objc_msgSend__sendInitRequest_forContextRef_withCompletion_(self, v23, (uint64_t)v21, v22, v27);

    objc_destroyWeak(v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    APLogForCategory(0x2AuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v34 = (APSigningAuthority *)"-[APSigningAuthority _setupNewContext:withCompletion:]";
      _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: initRequest nil, FPDI creation failed.", buf, 0xCu);
    }

    objc_msgSend_setState_(self, v25, 7200, v26);
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (id)_createContext:(void *)a3 requestStashed:(BOOL *)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  int inited;
  const char *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_signpost_id_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_signpost_id_t v51;
  unsigned int v52;
  uint64_t v53;
  _BYTE v54[9];
  const __CFString *v55;
  void *v56;
  uint8_t buf[4];
  APSigningAuthority *v58;
  __int16 v59;
  int v60;
  const __CFString *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  APPerfLogForCategory(0x2AuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_signpostID(self, v8, v9, v10);
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF251000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ContextCreate", (const char *)&unk_1CF384FF7, buf, 2u);
    }
  }

  v54[8] = 0;
  *(_QWORD *)v54 = a4 != 0;
  v14 = 0;
  if (objc_msgSend__createAttribute_enableStashing_(self, v13, (uint64_t)&v54[1], (uint64_t)v54))
  {
    v53 = 0;
    v52 = 0;
    APLogForCategory(0x2AuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v58 = self;
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_INFO, "Signing Authority %p creating context", buf, 0xCu);
    }

    inited = objc_msgSend_FPDICreateContext_withAttribute_initRequest_initRequestLength_(APFPDIWrapper, v16, (uint64_t)a3, *(uint64_t *)&v54[1], &v53, &v52);
    if (inited != -44663)
    {
      v19 = inited;
      if (inited != -44802)
        goto LABEL_15;
    }
    APLogForCategory(0x2AuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v58 = self;
      _os_log_impl(&dword_1CF251000, v20, OS_LOG_TYPE_INFO, "Attempting to re-create stashed context for authority %p as non-stashed", buf, 0xCu);
    }

    objc_msgSend_FPDISetStashingIsEnabled_forAttribute_(APFPDIWrapper, v21, 0, *(uint64_t *)&v54[1]);
    v19 = objc_msgSend_FPDICreateContext_withAttribute_initRequest_initRequestLength_(APFPDIWrapper, v22, (uint64_t)a3, *(uint64_t *)&v54[1], &v53, &v52);
    if (v19 == -44663)
    {
      objc_msgSend__setFailureStateWithError_(self, v18, 7201, v23);
      objc_msgSend__destroyObject_ofType_(self, v24, (uint64_t)&v54[1], 1205);
      v61 = CFSTR("finalStatus");
      v62[0] = &unk_1E8C5BB40;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v62, (uint64_t)&v61, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      APPerfLogForCategory(0x2AuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_signpostID(self, v28, v29, v30);
      if ((unint64_t)(v31 - 1) > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_22;
      v32 = v31;
      if (!os_signpost_enabled(v27))
        goto LABEL_22;
      *(_WORD *)buf = 0;
    }
    else
    {
LABEL_15:
      if (!v19)
      {
        objc_msgSend__getEncodedStringFromFPDIDataRef_withLength_(self, v18, v53, v52);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__destroyObject_ofType_(self, v44, (uint64_t)&v54[1], 1205);
        objc_msgSend__destroyObject_ofType_(self, v45, (uint64_t)&v53, 1206);
        APLogForCategory(0x2AuLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v58 = self;
          _os_log_impl(&dword_1CF251000, v46, OS_LOG_TYPE_INFO, "Signing Authority %p finished creating context", buf, 0xCu);
        }

        APPerfLogForCategory(0x2AuLL);
        v27 = objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_signpostID(self, v47, v48, v49);
        if ((unint64_t)(v50 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v51 = v50;
          if (os_signpost_enabled(v27))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CF251000, v27, OS_SIGNPOST_INTERVAL_END, v51, "ContextCreate", " enableTelemetry=YES ", buf, 2u);
          }
        }
        goto LABEL_23;
      }
      APLogForCategory(0x2AuLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136643075;
        v58 = (APSigningAuthority *)"-[APSigningAuthority _createContext:requestStashed:]";
        v59 = 1025;
        v60 = v19;
        _os_log_impl(&dword_1CF251000, v33, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Attribution set privacy level error, FPDI creation failed. Status: %{private}d", buf, 0x12u);
      }

      objc_msgSend__setFailureStateWithError_(self, v34, 7200, v35);
      objc_msgSend__destroyObject_ofType_(self, v36, (uint64_t)&v54[1], 1205);
      v55 = CFSTR("finalStatus");
      v56 = &unk_1E8C5BB58;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v56, (uint64_t)&v55, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      APPerfLogForCategory(0x2AuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_signpostID(self, v39, v40, v41);
      if ((unint64_t)(v42 - 1) > 0xFFFFFFFFFFFFFFFDLL || (v32 = v42, !os_signpost_enabled(v27)))
      {
LABEL_22:
        v14 = 0;
LABEL_23:

        return v14;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v27, OS_SIGNPOST_INTERVAL_END, v32, "ContextCreate", " enableTelemetry=YES ", buf, 2u);
    goto LABEL_22;
  }
  return v14;
}

- (BOOL)_createAttribute:(void *)a3 enableStashing:(BOOL *)a4
{
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  int IsEnabled_forAttribute;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  int v20;
  _BYTE v21[14];
  __int16 v22;
  APSigningAuthority *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_FPDIInitAttribute_(APFPDIWrapper, a2, (uint64_t)a3, (uint64_t)a4)
    && objc_msgSend_FPDISetHighPrivacyLevelForAttribute_(APFPDIWrapper, v7, (uint64_t)*a3, v8))
  {
    APLogForCategory(0x2AuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v20 = 136642819;
      *(_QWORD *)v21 = "-[APSigningAuthority _createAttribute:enableStashing:]";
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Attribution initialization error, FPDI creation failed", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend__setFailureStateWithError_(self, v10, 7200, v11);
    objc_msgSend__destroyObject_ofType_(self, v12, (uint64_t)a3, 1205);
    v24 = CFSTR("finalStatus");
    v25[0] = &unk_1E8C5BB70;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v25, (uint64_t)&v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    return 0;
  }
  else
  {
    IsEnabled_forAttribute = objc_msgSend_FPDISetStashingIsEnabled_forAttribute_(APFPDIWrapper, v7, a4 != 0, (uint64_t)*a3);
    if (IsEnabled_forAttribute)
    {
      v17 = IsEnabled_forAttribute;
      APLogForCategory(0x2AuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = CFSTR("NO");
        v20 = 67109634;
        *(_DWORD *)v21 = v17;
        if (a4)
          v19 = CFSTR("YES");
        *(_WORD *)&v21[4] = 2112;
        *(_QWORD *)&v21[6] = v19;
        v22 = 2048;
        v23 = self;
        _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "Error %d setting stash attribute to %@ for signing authority %p", (uint8_t *)&v20, 0x1Cu);
      }

      *a4 = 0;
    }
    return 1;
  }
}

- (void)_sendInitRequest:(id)a3 forContextRef:(void *)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  APSigningServerRequestor *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  id v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  id v21[2];
  uint8_t v22[16];
  uint8_t buf[4];
  APSigningAuthority *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  APLogForCategory(0x2AuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v24 = self;
    _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_INFO, "Signing Authority %p sending init request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11 = objc_alloc_init(APSigningServerRequestor);
  APPerfLogForCategory(0x2AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_signpostID(self, v13, v14, v15);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ContextInit", (const char *)&unk_1CF384FF7, v22, 2u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1CF28A54C;
  v19[3] = &unk_1E8C48BF0;
  objc_copyWeak(v21, (id *)buf);
  v19[4] = self;
  v21[1] = a4;
  v17 = v9;
  v20 = v17;
  objc_msgSend_sendRequestForData_requestType_completionHandler_(v11, v18, (uint64_t)v8, 1301, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

}

- (id)_handleInitResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(void *)a5 error:(id)a6
{
  uint64_t v7;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  unsigned int v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  APSigningAuthority *v33;
  uint64_t v34;

  v7 = *(_QWORD *)&a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  APLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!a3 || v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v33 = (APSigningAuthority *)"-[APSigningAuthority _handleInitResponse:length:forContextRef:error:]";
      _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive init reponse, FPDI setup has failed.", buf, 0xCu);
    }

    objc_msgSend__setFailureStateWithErrorAndDestroyContext_contextRef_(self, v21, 7205, (uint64_t)a5);
    v30 = CFSTR("finalStatus");
    v31 = &unk_1E8C5BB88;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)&v31, (uint64_t)&v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_INFO, "Signing Authority %p handling init response", buf, 0xCu);
    }

    v27 = 0;
    v26 = 0;
    if (objc_msgSend_FPDIInitContext_withInitResponse_initResponseLength_setupRequest_setupRequestLength_(APFPDIWrapper, v13, (uint64_t)a5, (uint64_t)a3, v7, &v27, &v26))
    {
      APLogForCategory(0x2AuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136642819;
        v33 = (APSigningAuthority *)"-[APSigningAuthority _handleInitResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive setup request, FPDI setup has failed.", buf, 0xCu);
      }

      objc_msgSend__setFailureStateWithErrorAndDestroyContext_contextRef_(self, v16, 7205, (uint64_t)a5);
      v28 = CFSTR("finalStatus");
      v29 = &unk_1E8C5BBA0;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v29, (uint64_t)&v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      v20 = 0;
    }
    else
    {
      objc_msgSend__getEncodedStringFromFPDIDataRef_withLength_(self, v14, v27, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend__destroyObject_ofType_(self, v19, (uint64_t)&v27, 1206);
  }
  APLogForCategory(0x2AuLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_INFO, "Signing Authority %p finished handling init response", buf, 0xCu);
  }

  return v20;
}

- (void)_sendSetupRequest:(id)a3 forContextRef:(unint64_t *)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  APSigningServerRequestor *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  id v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  id v21[2];
  uint8_t v22[16];
  uint8_t buf[4];
  APSigningAuthority *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  APLogForCategory(0x2AuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v24 = self;
    _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_INFO, "Signing Authority %p sending setup request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11 = objc_alloc_init(APSigningServerRequestor);
  APPerfLogForCategory(0x2AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_signpostID(self, v13, v14, v15);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ContextSetup", (const char *)&unk_1CF384FF7, v22, 2u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1CF28ABEC;
  v19[3] = &unk_1E8C48BF0;
  objc_copyWeak(v21, (id *)buf);
  v19[4] = self;
  v21[1] = a4;
  v17 = v9;
  v20 = v17;
  objc_msgSend_sendRequestForData_requestType_completionHandler_(v11, v18, (uint64_t)v8, 1302, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

}

- (void)_handleSetupResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(unint64_t *)a5 error:(id)a6
{
  uint64_t v8;
  NSObject *v11;
  const char *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  APSigningAuthority *v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a4;
  v34 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_INFO, "Signing Authority %p handling setup response", buf, 0xCu);
  }

  if (!a3 || a6)
  {
    APLogForCategory(0x2AuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v33 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
      _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive init reponse, FPDI setup has failed.", buf, 0xCu);
    }

    objc_msgSend__setFailureStateWithErrorAndDestroyContext_contextRef_(self, v19, 7205, (uint64_t)a5);
    v30 = CFSTR("finalStatus");
    v31 = &unk_1E8C5BBB8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v31, (uint64_t)&v30, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();
  }
  else
  {
    v13 = objc_msgSend_FPDISetupContext_withSetupResponse_setupResponseLength_(APFPDIWrapper, v12, (uint64_t)a5, (uint64_t)a3, v8);
    APLogForCategory(0x2AuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136642819;
        v33 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to set setup response, FPDI setup has failed.", buf, 0xCu);
      }

      objc_msgSend__setFailureStateWithErrorAndDestroyContext_contextRef_(self, v16, 7205, (uint64_t)a5);
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v29, (uint64_t)&v28, 1, v26, v27, CFSTR("finalStatus"), &unk_1E8C5BBD0);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136642819;
        v33 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_DEBUG, "[%{sensitive}s]: FPDI setup has succeeded.", buf, 0xCu);
      }

      objc_msgSend_setState_(self, v22, 17002, v23);
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v27, (uint64_t)&v26, 1, CFSTR("finalStatus"), &unk_1E8C5BBE8, v28, v29);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    APLogForCategory(0x2AuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_INFO, "Signing Authority %p finished setup response", buf, 0xCu);
    }
  }

}

- (BOOL)_verifyContext:(void *)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  int v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  APSigningAuthority *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v32 = self;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Signing Authority %p verifying stored context", buf, 0xCu);
  }

  objc_msgSend_dataUsingEncoding_(CFSTR("verificationContext"), v6, 4, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend_bytes(v8, v9, v10, v11);
  v16 = objc_msgSend_length(v8, v13, v14, v15);
  v28 = 0;
  v27 = 0;
  v18 = objc_msgSend_FPDISignWithContext_message_messageLength_rawSignature_rawSignatureLength_(APFPDIWrapper, v17, (uint64_t)a3, v12, v16, &v28, &v27);
  APLogForCategory(0x2AuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1CF251000, v19, OS_LOG_TYPE_INFO, "FPDI context for signing authority %p is not valid.", buf, 0xCu);
    }

    v29 = CFSTR("finalStatus");
    v30 = &unk_1E8C5BC00;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v30, (uint64_t)&v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1CF251000, v19, OS_LOG_TYPE_INFO, "Signing Authority %p verified context", buf, 0xCu);
    }

    objc_msgSend_setState_(self, v24, 17002, v25);
  }
  objc_msgSend__destroyObject_ofType_(self, v23, (uint64_t)&v28, 1206);

  return v18 == 0;
}

- (id)_getEncodedStringFromFPDIDataRef:(void *)a3 withLength:(unsigned int)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v4, v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_failureString:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 7200) <= 6)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E8C48C60[a3 - 7200], v3, self);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (void)_setFailureStateWithError:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend_setFailureError_(self, a2, a3, v3);
  objc_msgSend_setState_(self, v6, 17003, v7);
  objc_msgSend__failureString_(self, v8, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x2AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v12, 0xCu);
  }

}

- (void)_setFailureStateWithErrorAndDestroyContext:(int64_t)a3 contextRef:(void *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  objc_msgSend__setFailureStateWithError_(self, a2, a3, (uint64_t)a4);
  if (a4)
  {
    objc_msgSend_poolName(self, v6, v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeContextForPool_contextIdentifier_(APSigningContextStorage, v9, (uint64_t)v10, (uint64_t)a4);

  }
}

- (BOOL)isUsed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_signingContextStorage(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_used(v4, v5, v6, v7);

  return v8;
}

- (void)setIsUsed:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend_signingContextStorage(self, a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsed_(v7, v5, v4, v6);

}

- (BOOL)usingStashedContext
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_signingContextStorage(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_stashed(v4, v5, v6, v7);

  return v8;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  APSigningAuthority *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend_state(self, v6, v7, v8);
    if ((unint64_t)(v9 - 17000) > 4)
      v10 = CFSTR("invalid");
    else
      v10 = off_1E8C48C98[v9 - 17000];
    if ((unint64_t)(a3 - 17000) > 4)
      v11 = CFSTR("invalid");
    else
      v11 = off_1E8C48C98[a3 - 17000];
    v12 = 134218498;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "SigningAuthority %p state %@ -> %@", (uint8_t *)&v12, 0x20u);
  }

  self->_state = a3;
}

- (void)setupWithCompletion:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  os_signpost_id_t v44;
  const char *v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  os_signpost_id_t v53;
  APSigningContextStorage *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  APSigningContextStorage *v60;
  APSigningContextStorage *signingContextStorage;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  os_signpost_id_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  id v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  NSObject *v81;
  _QWORD block[5];
  id v83;
  id v84;
  BOOL v85;
  id buf;
  const __CFString *v87;
  _QWORD v88[2];

  v4 = a3;
  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  APPerfLogForCategory(0x2AuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_signpostID(self, v8, v9, v10);
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF251000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v12, "TotalSetupTime", (const char *)&unk_1CF384FF7, (uint8_t *)&buf, 2u);
    }
  }

  if (!v4)
    goto LABEL_28;
  APPerfLogForCategory(0x2AuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_signpostID(self, v14, v15, v16);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CacheReadTime", (const char *)&unk_1CF384FF7, (uint8_t *)&buf, 2u);
  }

  objc_msgSend_poolName(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_retrieveAvailableStashedContextsForPool_(APSigningContextStorage, v22, (uint64_t)v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  APPerfLogForCategory(0x2AuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_signpostID(self, v26, v27, v28);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v25, OS_SIGNPOST_INTERVAL_END, v29, "CacheReadTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  if (!objc_msgSend_count(v24, v30, v31, v32))
  {
LABEL_27:

LABEL_28:
    objc_initWeak(&buf, self);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v74, (uint64_t)CFSTR("com.apple.ap.signingauthority.setup.%p"), v75, self);
    v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v80 = (const char *)objc_msgSend_UTF8String(v76, v77, v78, v79);
    v81 = dispatch_queue_create(v80, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF28BBAC;
    block[3] = &unk_1E8C48C40;
    objc_copyWeak(&v84, &buf);
    v85 = v4;
    block[4] = self;
    v83 = v6;
    dispatch_async(v81, block);

    objc_destroyWeak(&v84);
    objc_destroyWeak(&buf);
    goto LABEL_29;
  }
  objc_msgSend_objectAtIndexedSubscript_(v24, v33, 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_contextRef(v35, v36, v37, v38);

  APPerfLogForCategory(0x2AuLL);
  v40 = objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_signpostID(self, v41, v42, v43);
  if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VerifyCachedContext", (const char *)&unk_1CF384FF7, (uint8_t *)&buf, 2u);
  }

  v47 = objc_msgSend__verifyContext_(self, v45, v39, v46);
  APPerfLogForCategory(0x2AuLL);
  v48 = objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_signpostID(self, v49, v50, v51);
  v53 = v52;
  if (!v47)
  {
    if ((unint64_t)(v52 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF251000, v48, OS_SIGNPOST_INTERVAL_END, v53, "VerifyCachedContext", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    objc_msgSend_poolName(self, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeContextForPool_contextIdentifier_(APSigningContextStorage, v73, (uint64_t)v72, v39);

    goto LABEL_27;
  }
  if ((unint64_t)(v52 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v48, OS_SIGNPOST_INTERVAL_END, v53, "VerifyCachedContext", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v54 = [APSigningContextStorage alloc];
  objc_msgSend_poolName(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (APSigningContextStorage *)objc_msgSend_initWithContextRef_poolName_stashed_(v54, v59, v39, (uint64_t)v58, 1);
  signingContextStorage = self->_signingContextStorage;
  self->_signingContextStorage = v60;

  APPerfLogForCategory(0x2AuLL);
  v62 = objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_signpostID(self, v63, v64, v65);
  if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF251000, v62, OS_SIGNPOST_INTERVAL_END, v66, "TotalSetupTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v87 = CFSTR("finalStatus");
  v88[0] = &unk_1E8C5BC18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v67, (uint64_t)v88, (uint64_t)&v87, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  (*((void (**)(id, APSigningAuthority *))v6 + 2))(v6, self);
LABEL_29:

}

- (void)setSigningContextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_signingContextStorage, a3);
}

- (NSString)poolName
{
  return self->_poolName;
}

- (void)setPoolName:(id)a3
{
  objc_storeStrong((id *)&self->_poolName, a3);
}

- (int64_t)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(int64_t)a3
{
  self->_failureError = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolName, 0);
  objc_storeStrong((id *)&self->_signingContextStorage, 0);
}

@end
