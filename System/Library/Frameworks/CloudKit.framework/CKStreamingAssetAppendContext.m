@implementation CKStreamingAssetAppendContext

- (CKStreamingAssetAppendContext)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("-[%@ init] is unavailable"), v5);

  objc_exception_throw(v7);
}

- (CKStreamingAssetAppendContext)initWithStreamingAsset:(id)a3
{
  id v5;
  CKStreamingAssetAppendContext *v6;
  CKStreamingAssetAppendContext *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *appendQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKStreamingAssetAppendContext;
  v6 = -[CKStreamingAssetAppendContext init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamingAsset, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cloudkit.streaming-asset.append-context.append", v8);
    appendQueue = v7->_appendQueue;
    v7->_appendQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.cloudkit.streaming-asset.append-context.callback", v11);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKStreamingAssetAppendContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
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
  void *v15;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_streamingAsset(self, v7, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend_CKAddPropertySafelyForKey_value_(v6, v10, (uint64_t)CFSTR("streamingAsset"), (uint64_t)v13);
  objc_msgSend_dataTask(self, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend_CKAddPropertySafelyForKey_value_(v6, v14, (uint64_t)CFSTR("dataTask"), (uint64_t)v15);

  return v6;
}

- (BOOL)appendSegmentWithData:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_appendSegmentWithData_newStreamingAsset_error_, a3, 0);
}

- (BOOL)appendSegmentWithData:(id)a3 newStreamingAsset:(id *)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_18A784F80;
  v28 = sub_18A784F90;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18A784F80;
  v22 = sub_18A784F90;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A784F98;
  v14[3] = &unk_1E1F64D30;
  v16 = &v18;
  v17 = &v24;
  v10 = v9;
  v15 = v10;
  objc_msgSend_appendSegmentWithData_completionHandler_(self, v11, (uint64_t)v8, (uint64_t)v14);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v25[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  v12 = v25[5] == 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (void)appendSegmentWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  CKException *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  CKException *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  id v59;
  _QWORD block[5];
  id v61;
  id v62;
  NSObject *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  os_activity_scope_state_s state;
  id v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  CKStreamingAssetAppendContext *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v69 = 0;
  v8 = _CKCheckArgument((uint64_t)"data", v6, 0, 0, 0, &v69);
  v9 = v69;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v38 = [CKException alloc];
    v42 = objc_msgSend_code(v10, v39, v40, v41);
    objc_msgSend_localizedDescription(v10, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)objc_msgSend_initWithCode_format_(v38, v47, v42, (uint64_t)CFSTR("%@"), v46);

    objc_exception_throw(v48);
  }

  v11 = _Block_copy(v7);
  v68 = 0;
  v12 = _CKCheckArgument((uint64_t)"completionHandler", v11, 0, 0, 0, &v68);
  v13 = v68;

  if ((v12 & 1) == 0)
  {
    v49 = [CKException alloc];
    v53 = objc_msgSend_code(v13, v50, v51, v52);
    objc_msgSend_localizedDescription(v13, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (id)objc_msgSend_initWithCode_format_(v49, v58, v53, (uint64_t)CFSTR("%@"), v57);

    objc_exception_throw(v59);
  }

  v14 = _os_activity_create(&dword_18A5C5000, "client/streaming-asset-append", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v23 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v37 = objc_msgSend_length(v6, v24, v25, v26);
    *(_DWORD *)buf = 134218498;
    v71 = v37;
    v72 = 2112;
    v73 = self;
    v74 = 2114;
    v75 = v22;
    _os_log_debug_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_DEBUG, "Appending segment of length %ld to %@ with requestUUID %{public}@", buf, 0x20u);
  }

  if (objc_msgSend_length(v6, v27, v28, v29))
  {
    objc_msgSend_appendQueue(self, v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A78549C;
    block[3] = &unk_1E1F64D58;
    block[4] = self;
    v64 = v7;
    v61 = v6;
    v62 = v22;
    v63 = v14;
    v34 = v7;
    dispatch_async(v33, block);

  }
  else
  {
    objc_msgSend_callbackQueue(self, v30, v31, v32);
    v35 = objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = sub_18A785430;
    v65[3] = &unk_1E1F61CC8;
    v66 = v7;
    v36 = v7;
    dispatch_async(v35, v65);

  }
  os_activity_scope_leave(&state);

}

+ (id)requestToAppendSegmentData:(id)a3 uploadURL:(id)a4 requestUUID:(id)a5 offset:(unint64_t)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CKDPStreamingAssetFooter *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  CC_LONG v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  unsigned int v84;
  uint8_t buf[4];
  int v86;
  unsigned __int8 md[16];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0CB37A8];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [v9 alloc];
  v16 = (void *)objc_msgSend_initWithURL_(v13, v14, (uint64_t)v11, v15);

  objc_msgSend_setHTTPMethod_(v16, v17, (uint64_t)CFSTR("PUT"), v18);
  objc_msgSend_setValue_forHTTPHeaderField_(v16, v19, (uint64_t)v10, (uint64_t)CFSTR("X-Apple-Request-UUID"));

  objc_msgSend_setValue_forHTTPHeaderField_(v16, v20, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("x-apple-sa-version"));
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v21, (uint64_t)CFSTR("%lu"), v22, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forHTTPHeaderField_(v16, v24, (uint64_t)v23, (uint64_t)CFSTR("x-apple-sa-offset"));
  v25 = objc_alloc_init(CKDPStreamingAssetFooter);
  objc_msgSend_setStatus_(v25, v26, 0, v27);
  v28 = objc_retainAutorelease(v12);
  v32 = (const void *)objc_msgSend_bytes(v28, v29, v30, v31);
  v36 = objc_msgSend_length(v28, v33, v34, v35);
  CC_MD5(v32, v36, md);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v37, (uint64_t)md, 16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMd5_(v25, v39, (uint64_t)v38, v40);

  objc_msgSend_data(v25, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_length(v44, v45, v46, v47);
  v84 = bswap32(v48);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v49, (uint64_t)&v84, 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v55 = objc_msgSend_length(v28, v52, v53, v54);
  v59 = objc_msgSend_length(v44, v56, v57, v58);
  v63 = objc_msgSend_length(v50, v60, v61, v62);
  v66 = (void *)objc_msgSend_initWithCapacity_(v51, v64, v59 + v55 + v63, v65);
  objc_msgSend_appendData_(v66, v67, (uint64_t)v28, v68);

  objc_msgSend_appendData_(v66, v69, (uint64_t)v44, v70);
  objc_msgSend_appendData_(v66, v71, (uint64_t)v50, v72);
  objc_msgSend_inputStreamWithData_(MEMORY[0x1E0C99DB0], v73, (uint64_t)v66, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHTTPBodyStream_(v16, v76, (uint64_t)v75, v77);
  if (v48 >= 0x801)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v78 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v86 = v48;
      _os_log_debug_impl(&dword_18A5C5000, v78, OS_LOG_TYPE_DEBUG, "Overriding max footer length with %u", buf, 8u);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v79, (uint64_t)CFSTR("%u"), v80, v48);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forHTTPHeaderField_(v16, v82, (uint64_t)v81, (uint64_t)CFSTR("x-apple-sa-footer-max-size"));

  }
  return v16;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  objc_msgSend_appendQueue(self, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A785EA0;
  block[3] = &unk_1E1F60DD8;
  block[4] = self;
  v16 = v8;
  v17 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, block);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend_cancel(a4, v6, v7, v8);
  v9[2](v9, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, id))a6 + 2))(a6, a5);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)abort
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend_appendQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A7871F4;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (CKStreamingAsset)streamingAsset
{
  return self->_streamingAsset;
}

- (OS_dispatch_queue)appendQueue
{
  return self->_appendQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)isAppending
{
  return self->_appending;
}

- (void)setAppending:(BOOL)a3
{
  self->_appending = a3;
}

- (BOOL)isCurrentAppendCancelled
{
  return self->_currentAppendCancelled;
}

- (void)setCurrentAppendCancelled:(BOOL)a3
{
  self->_currentAppendCancelled = a3;
}

- (unint64_t)currentSegmentLength
{
  return self->_currentSegmentLength;
}

- (void)setCurrentSegmentLength:(unint64_t)a3
{
  self->_currentSegmentLength = a3;
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_dataTask, a3);
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_osActivity, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)fakeMissingUploadReceipt
{
  return self->_fakeMissingUploadReceipt;
}

- (void)setFakeMissingUploadReceipt:(BOOL)a3
{
  self->_fakeMissingUploadReceipt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_appendQueue, 0);
  objc_storeStrong((id *)&self->_streamingAsset, 0);
}

@end
