@implementation LNTranscriptPrivilegedProvider

- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[16];

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  getLNLogCategoryExecution();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", ", buf, 2u);
  }

  -[LNTranscriptProvider connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke;
  v25[3] = &unk_1E45DE310;
  v19 = v12;
  v26 = v19;
  v27 = a3;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke_1;
  v22[3] = &unk_1E45DE310;
  v23 = v19;
  v24 = a3;
  v21 = v19;
  objc_msgSend(v20, "donateActionRecordData:bundleIdentifier:timestamp:writeImmediately:reply:", v14, v13, v7, v22, a5);

}

- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 error:(id *)a5
{
  return -[LNTranscriptPrivilegedProvider transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:](self, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", a3, a4, 0, 0, 0, a5);
}

- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v9 = a7;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__11234;
  v41 = __Block_byref_object_dispose__11235;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__11234;
  v35 = __Block_byref_object_dispose__11235;
  v36 = 0;
  -[LNTranscriptProvider connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke;
  v30[3] = &unk_1E45DE140;
  v30[4] = &v31;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v14)
    v22 = v14;
  else
    v22 = CFSTR("System");
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke_3;
  v29[3] = &unk_1E45DE168;
  v29[4] = &v31;
  v29[5] = &v37;
  objc_msgSend(v20, "requestReadAccessForStream:reply:", v22, v29);

  v23 = (void *)v38[5];
  if (v23)
  {
    objc_msgSend(v23, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[LNTranscriptProvider publisherForStream:fromDate:toDate:maxEvents:reversed:](LNTranscriptProvider, "publisherForStream:fromDate:toDate:maxEvents:reversed:", v24, v15, v16, v17, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getLNLogCategoryGeneral();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = v32[5];
      *(_DWORD *)buf = 138412290;
      v44 = v27;
      _os_log_impl(&dword_1A18F6000, v26, OS_LOG_TYPE_ERROR, "Failed to get transcript %@", buf, 0xCu);
    }

    v25 = 0;
    if (a8)
      *a8 = objc_retainAutorelease((id)v32[5]);
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v25;
}

void __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessForStream. error: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("LNTranscriptErrorDomain"), 1004, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

void __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getLNLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", ", (uint8_t *)&v8, 2u);
  }

}

@end
