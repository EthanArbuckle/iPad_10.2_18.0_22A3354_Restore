@implementation ASDMediaClipTask

- (ASDMediaClipTask)initWithClientID:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  ASDMediaClipTask *v9;
  ASDMediaClipTask *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *logKey;
  NSObject *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASDMediaClipTask;
  v9 = -[AMSTask init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_clientID, a3);
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[NSUUID asd_generateLogKey]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("MCT/%@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v13;

    ASDLogHandleForCategory(30);
    v15 = objc_claimAutoreleasedReturnValue();
    v10->_signpostID = os_signpost_id_make_with_pointer(v15, v10);

  }
  return v10;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__ASDMediaClipTask_perform__block_invoke;
  v3[3] = &unk_1E37BF068;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__ASDMediaClipTask_perform__block_invoke(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  ASDMediaClipTaskResponseDecoder *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  ASDMediaClipTaskResponseDecoder *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(30);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19A03B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Clip::MediaAPI/Prepare", (const char *)&unk_19A0C05B1, buf, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = -[ASDMediaClipTaskURLBuilder initWithBundleID:bag:]((id *)[ASDMediaClipTaskURLBuilder alloc], *(void **)(v7 + 80), *(void **)(v7 + 48));
    if (*(_QWORD *)(v7 + 96))
    {
      ASDLogHandleForCategory(12);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v36 = *(_QWORD *)(v7 + 64);
        v37 = *(void **)(v7 + 96);
        *(_DWORD *)buf = 138543618;
        v49 = v36;
        v50 = 2114;
        v51 = v37;
        _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Requesting specific version (unsupported in production) %{public}@", buf, 0x16u);
      }

      -[ASDMediaClipTaskURLBuilder setExternalVersionID:]((uint64_t)v8, *(void **)(v7 + 96));
    }
    -[ASDMediaClipTaskURLBuilder build](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v47 = 0;
  objc_msgSend(v10, "resultWithTimeout:error:", &v47, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v47;
  if (!v11)
  {
    v29 = 0;
    if (!a2)
      goto LABEL_30;
    goto LABEL_28;
  }
  v43 = v10;
  v44 = a2;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB50]), "initWithClientIdentifier:bag:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB38]), "initWithTokenService:bag:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v14, "setClientInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(v14, "setLogKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v15 = objc_alloc_init(ASDMediaClipTaskResponseDecoder);
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB30]), "initWithTokenService:", v13);
  v17 = objc_alloc(MEMORY[0x1E0CFDCA0]);
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithConfiguration:", v18);

  v40 = (void *)v16;
  objc_msgSend(v19, "setProtocolHandler:", v16);
  v41 = v15;
  objc_msgSend(v19, "setResponseDecoder:", v15);
  v42 = v13;
  objc_msgSend(v13, "setSession:", v19);
  objc_msgSend(v14, "requestWithComponents:", v11);
  v46 = v12;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "resultWithTimeout:error:", &v46, 60.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v46;

  ASDLogHandleForCategory(30);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19A03B000, v23, OS_SIGNPOST_INTERVAL_END, v24, "Clip::MediaAPI/Prepare", (const char *)&unk_19A0C05B1, buf, 2u);
  }

  a2 = v44;
  if (!v20)
    goto LABEL_22;
  ASDLogHandleForCategory(30);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19A03B000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Clip::MediaAPI/Request", (const char *)&unk_19A0C05B1, buf, 2u);
  }

  objc_msgSend(v19, "dataTaskPromiseWithRequest:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v21;
  objc_msgSend(v28, "resultWithTimeout:error:", &v45, 60.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v45;

  ASDLogHandleForCategory(30);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19A03B000, v32, OS_SIGNPOST_INTERVAL_END, v33, "Clip::MediaAPI/Request", (const char *)&unk_19A0C05B1, buf, 2u);
  }

  v21 = v30;
  a2 = v44;
  if (!v29)
  {
LABEL_22:
    ASDLogHandleForCategory(12);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543618;
      v49 = v38;
      v50 = 2114;
      v51 = v21;
      _os_log_error_impl(&dword_19A03B000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Media API request failed: %{public}@", buf, 0x16u);
    }

    v29 = 0;
  }

  v12 = v21;
  v10 = v43;
  if (a2)
  {
LABEL_28:
    if (!v29)
      *a2 = objc_retainAutorelease(v12);
  }
LABEL_30:

  return v29;
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)objc_msgSend(MEMORY[0x1E0CFDB48], "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CFD9E8];
  objc_msgSend(a1, "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bagForProfile:profileVersion:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
