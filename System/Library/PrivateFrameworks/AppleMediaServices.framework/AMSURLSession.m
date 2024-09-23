@implementation AMSURLSession

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_193;
    v26[3] = &unk_1E2540BF0;
    v27 = v3;
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_3;
    v24[3] = &unk_1E253FFE0;
    v25 = v27;
    objc_msgSend(WeakRetained, "createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:", v5, 0, v6, v26, v24);

    v8 = v27;
  }
  else
  {
    v9 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v13;
        v30 = 2114;
        v31 = v15;
        v32 = 2114;
        v33 = v17;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The AMSURLSession used to create this AMSLazyPromise is unexpectedly deallocated. No network request will be attempted. url = %{public}@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v18, 0);
    }
    else
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = (void *)objc_opt_class();
        v20 = v19;
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v19;
        v30 = 2114;
        v31 = v21;
        v32 = 2114;
        v33 = v23;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] The AMSURLSession used to create this AMSLazyPromise is unexpectedly deallocated. No network request will be attempted. url = %{public}@", buf, 0x20u);

      }
    }

    AMSError(0, CFSTR("AMSURLSession deallocated prematurely"), CFSTR("The owning AMSURLSession instance was deallocated before running this associated AMSLazyPromise."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v8);
  }

}

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "ams_isTimeoutError") & 1) != 0 || objc_msgSend(v3, "ams_isUserCancelledError"))
    objc_msgSend(*(id *)(a1 + 32), "cancel");

}

- (void)_completeTaskWithTaskInfo:(id)a3 result:(id)a4 decodedObject:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int has_internal_content;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  os_signpost_id_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  os_signpost_id_t v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  AMSURLSession *v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v81 = a5;
  v12 = a6;
  objc_msgSend(v10, "assertIsOnPrivateQueue");
  objc_msgSend(v10, "task");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSNetworkQualityInquiry updateLastConnectionReportWithTask:](AMSNetworkQualityInquiry, "updateLastConnectionReportWithTask:");
  -[AMSURLSession responseDecoder](self, "responseDecoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v82 = self;
  if (!v12 && v13)
  {
    v94 = 0;
    objc_msgSend(v13, "resultFromResult:error:", v11, &v94);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v94;

    if (v16 || !v15)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        objc_msgSend(v10, "properties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v96 = v19;
        self = v82;
        v97 = 2114;
        v98 = v21;
        v99 = 2114;
        v100 = v15;
        v101 = 2114;
        v102 = v22;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session decoder failed. Result = %{public}@; Error = %{public}@",
          buf,
          0x2Au);

      }
      v12 = v16;

      v15 = 0;
    }
    else
    {
      v12 = 0;
    }

    v11 = v15;
  }
  objc_msgSend(v10, "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "responseDecoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 && v24)
  {
    v93 = 0;
    objc_msgSend(v24, "resultFromResult:error:", v11, &v93);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v93;

    if (v26 || !v25)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        objc_msgSend(v10, "properties");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logUUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v96 = v29;
        v97 = 2114;
        v98 = v31;
        v99 = 2114;
        v100 = v25;
        v101 = 2114;
        v102 = v32;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request decoder failed. Result = %{public}@; Error = %{public}@",
          buf,
          0x2Au);

        self = v82;
      }

      v12 = v26;
      v25 = 0;
    }
    else
    {
      v12 = 0;
    }

    v11 = v25;
  }
  has_internal_content = os_variant_has_internal_content();
  v34 = MEMORY[0x1E0C809B0];
  if (has_internal_content)
  {
    objc_msgSend(v10, "properties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "account");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "ams_isEphemeralAccount");

    if (v37)
    {
      v91[0] = v34;
      v91[1] = 3221225472;
      v91[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke;
      v91[3] = &unk_1E253E2B0;
      v91[4] = self;
      v92 = v10;
      objc_msgSend(v92, "performAsyncBlock:", v91);

    }
    else if (+[AMSProcessInfo hasAMSEntitlement](AMSProcessInfo, "hasAMSEntitlement"))
    {
      v89[0] = v34;
      v89[1] = 3221225472;
      v89[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_200;
      v89[3] = &unk_1E253E2B0;
      v89[4] = self;
      v90 = v10;
      objc_msgSend(v90, "performAsyncBlock:", v89);

    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        objc_msgSend(v10, "properties");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v96 = v40;
        v97 = 2114;
        v98 = v42;
        _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: missing AMS private entitlement, skipping HAR logging.", buf, 0x16u);

      }
    }
  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v12)
  {
    if (!v43)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v44, "OSLogObject");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_opt_class();
      objc_msgSend(v10, "properties");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v12);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v96 = v46;
      v97 = 2114;
      v98 = v48;
      v99 = 2114;
      v100 = v49;
      _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task completed with error = %{public}@", buf, 0x20u);

    }
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v51, "OSLogObject");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_signpost_enabled(v52);

    if (!v50)
    if (v53)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v54)
      {
        objc_msgSend(v54, "OSLogObject");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "OSLogObject");
        v56 = objc_claimAutoreleasedReturnValue();

      }
      v68 = objc_msgSend(v10, "signpostID");
      if ((unint64_t)(v68 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v69 = v68;
        if (os_signpost_enabled(v56))
        {
          AMSLogableError(v12);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v96 = (uint64_t)v70;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v56, OS_SIGNPOST_INTERVAL_END, v69, "URL Data Task", "Failed with error: %{public}@", buf, 0xCu);

        }
      }
LABEL_64:

    }
  }
  else
  {
    if (!v43)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v44, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = objc_opt_class();
      objc_msgSend(v10, "properties");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "logUUID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v96 = v58;
      v97 = 2114;
      v98 = v60;
      _os_log_impl(&dword_18C849000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task completed successfully", buf, 0x16u);

      v12 = 0;
    }

    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v61)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v62, "OSLogObject");
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = os_signpost_enabled(v63);

    if (!v61)
    if (v64)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        objc_msgSend(v65, "OSLogObject");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "OSLogObject");
        v56 = objc_claimAutoreleasedReturnValue();

      }
      v72 = objc_msgSend(v10, "signpostID");
      if ((unint64_t)(v72 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v73 = v72;
        if (os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18C849000, v56, OS_SIGNPOST_INTERVAL_END, v73, "URL Data Task", "Succeeded", buf, 2u);
        }
      }
      goto LABEL_64;
    }
  }
  -[AMSURLSession delegateQueue](v82, "delegateQueue");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_202;
  v83[3] = &unk_1E2541650;
  v83[4] = v82;
  v84 = v80;
  v85 = v12;
  v86 = v11;
  v87 = v81;
  v88 = v10;
  v75 = v10;
  v76 = v81;
  v77 = v11;
  v78 = v12;
  v79 = v80;
  objc_msgSend(v74, "addOperationWithBlock:", v83);

}

- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  AMSMutablePromise *v13;
  uint64_t v14;
  id v15;
  AMSMutablePromise *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  AMSMutablePromise *v21;
  id v22;
  _QWORD v23[4];
  AMSMutablePromise *v24;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(AMSMutablePromise);
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke;
  v23[3] = &unk_1E2540BF0;
  v24 = v13;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke_2;
  v20[3] = &unk_1E2547168;
  v21 = v24;
  v22 = v10;
  v15 = v10;
  v16 = v24;
  -[AMSURLSession createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:](self, "createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:", v12, a4, v11, v23, v20);

  -[AMSPromise resultWithError:](v16, "resultWithError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSURLSession)session
{
  return self->_session;
}

+ (id)_taskFromSession:(id)a3 request:(id)a4 activity:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  objc_msgSend(a3, "dataTaskWithRequest:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "set_nw_activity:", v7);

  return v9;
}

- (id)_createSharedDataForTask:(id)a3 properties:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  +[AMSURLTaskInfo createTaskInfoForTask:](AMSURLTaskInfo, "createTaskInfoForTask:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompletionBlock:", v8);

  objc_msgSend(v10, "setProperties:", v9);
  objc_msgSend(v10, "setSession:", self);
  return v10;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  AMSDeallocGuard *v7;
  uint64_t v8;
  uint64_t v9;
  AMSDeallocGuard *v10;
  AMSMutablePromise *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AMSMutablePromise *v16;
  AMSDeallocGuard *v17;
  void *v18;
  void *v19;
  void *v20;
  AMSPair *v21;
  uint64_t v22;
  uint64_t v23;
  AMSPair *v24;
  AMSPair *v25;
  AMSPair *v26;
  id v27;
  _QWORD v28[4];
  AMSDeallocGuard *v29;
  AMSMutablePromise *v30;
  _QWORD v31[6];

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AMSSetLogKey(v3);

  if (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 88) != 1)
  {
    v20 = *(void **)(a1 + 80);
    v21 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 88));
    v22 = objc_claimAutoreleasedReturnValue();
    v27 = (id)v22;
    v23 = *(_QWORD *)(a1 + 40);
    v24 = v21;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = [AMSDeallocGuard alloc];
      v8 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
      v31[3] = &unk_1E2540A40;
      v9 = *(_QWORD *)(a1 + 96);
      v31[4] = *(_QWORD *)(a1 + 48);
      v31[5] = v9;
      v10 = -[AMSDeallocGuard initWithDeallocGuardBlock:](v7, "initWithDeallocGuardBlock:", v31);
      v11 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 10.0);
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 72);
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_124;
      v28[3] = &unk_1E2546D08;
      v29 = v10;
      v30 = v11;
      v16 = v11;
      v17 = v10;
      objc_msgSend(v12, "URLSession:dataTask:didReceiveResponse:completionHandler:", v13, v14, v15, v28);

      v18 = *(void **)(a1 + 80);
      -[AMSMutablePromise continueWithBlock:](v16, "continueWithBlock:", &__block_literal_global_128);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "finishWithPromise:", v19);

      return;
    }
    v20 = *(void **)(a1 + 80);
    v26 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 88));
    v22 = objc_claimAutoreleasedReturnValue();
    v27 = (id)v22;
    v24 = v26;
    v23 = 0;
  }
  v25 = -[AMSPair initWithFirst:second:](v24, "initWithFirst:second:", v22, v23);
  objc_msgSend(v20, "finishWithResult:", v25);

}

- (NSURLSessionDelegate)delegate
{
  void *v2;
  void *v3;

  -[AMSURLSession delegateProxy](self, "delegateProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURLSessionDelegate *)v3;
}

- (AMSURLDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (AMSResponseDecoding)responseDecoder
{
  os_unfair_lock_s *p_propertiesLock;
  AMSResponseDecoding *v4;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_responseDecoder;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

- (id)dataTaskWithRequest:(id)a3 activity:(id)a4 completionHandler:(id)a5
{
  return -[AMSURLSession dataTaskWithRequest:signpostID:activity:completionHandler:](self, "dataTaskWithRequest:signpostID:activity:completionHandler:", a3, 0, a4, a5);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  AMSURLSession *v27;
  id v28;
  id v29;
  SEL v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLSession protocolHandler](self, "protocolHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      objc_msgSend(0, "properties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v17;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v20;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping completion - no task info. error = %{public}@", buf, 0x20u);

    }
    goto LABEL_16;
  }
  objc_msgSend(v10, "receivedAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "actionType");

  if (v13)
    v14 = v13 == 3;
  else
    v14 = 1;
  if (!v14)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v21 = objc_claimAutoreleasedReturnValue();
    v15 = (id)v21;
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      objc_msgSend(v10, "properties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping completion", buf, 0x16u);

    }
LABEL_16:

    goto LABEL_17;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  v25[3] = &unk_1E25470A0;
  v26 = v10;
  v27 = self;
  v28 = v8;
  v29 = v9;
  v30 = a2;
  objc_msgSend(v26, "startContiguousAsyncActionWithInitialDataBlock:", v25);

  v15 = v26;
LABEL_17:

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  void *v1;
  AMSOptional *v3;

  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", 0);
  }
  else
  {
    v3 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v1, "finishWithResult:error:", v3, *(_QWORD *)(a1 + 40));

  }
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  AMSMutablePromise *v24;
  void *v25;
  uint64_t v26;
  id v27;
  AMSMutablePromise *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  void *v37;
  AMSPromiseResult *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  AMSPromiseResult *v45;
  AMSPromiseResult *v46;
  AMSOptional *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  AMSMutablePromise *v74;
  uint64_t v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  __CFString *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = AMSSetLogKey(v7);

  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logUUID");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "originalRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURLRequest((uint64_t)v14);
    v15 = v5;
    v16 = a2;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v77 = v11;
    v78 = 2114;
    v79 = v13;
    v80 = 2114;
    v81 = v17;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task finished loading for URL request %{public}@", buf, 0x20u);

    a2 = v16;
    v5 = v15;
  }

  objc_msgSend(*(id *)(a1 + 32), "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v19 = *(void **)(a1 + 56);
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = MEMORY[0x1E0C809B0];
  if (v20 || !v21 || !objc_msgSend(v5, "length"))
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v28 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "_protocolHandler:canUseAlternateImplementationOfSelector:", v22, sel_decodeMutableData_task_error_)|| !objc_msgSend(*(id *)(a1 + 40), "_protocolHandler:canUseAlternateImplementationOfSelector:", v22, sel_decodeData_task_error_))
  {
    objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = *(_QWORD *)(a1 + 48);
    if ((v31 & 1) != 0)
    {
      v71 = 0;
      v35 = (id *)&v71;
      objc_msgSend(v32, "decodeMutableData:task:error:", v5, v34, &v71);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
      v35 = (id *)&v70;
      objc_msgSend(v32, "decodeData:task:error:", v5, v34, &v70);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (void *)v36;
    v28 = (AMSMutablePromise *)*v35;

    if (v28 || !v37)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(". Error: %@"), v28);
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = &stru_1E2548760;
      }
      v60 = a2;
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v39, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "properties");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "logUUID");
        v41 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x1E0CB3940];
        v42 = objc_opt_class();
        v43 = v42;
        v59 = (void *)v41;
        if (v41)
        {
          objc_msgSend(*(id *)(a1 + 32), "properties");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "logUUID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] "), v43, v55);
        }
        else
        {
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: "), v42);
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = (uint64_t)v44;
        v78 = 2114;
        v79 = v61;
        _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Protocol skipping data decoding%{public}@", buf, 0x16u);
        v23 = MEMORY[0x1E0C809B0];
        if (v59)
        {

          v44 = v56;
        }

      }
      v45 = [AMSPromiseResult alloc];
      v38 = v45;
      if (v28)
      {
        v46 = -[AMSPromiseResult initWithResult:error:](v45, "initWithResult:error:", 0, v28);
        a2 = v60;
LABEL_36:
        +[AMSPromise promiseWithPromiseResult:](AMSPromise, "promiseWithPromiseResult:", v46);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      v37 = 0;
      a2 = v60;
    }
    else
    {
      v38 = [AMSPromiseResult alloc];
    }
    v47 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v37);
    v46 = -[AMSPromiseResult initWithResult:error:](v38, "initWithResult:error:", v47, 0);

    goto LABEL_36;
  }
  v24 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 48);
  v72[0] = v23;
  v72[1] = 3221225472;
  v72[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_157;
  v72[3] = &unk_1E2546F60;
  v27 = *(id *)(a1 + 32);
  v74 = v24;
  v75 = a2;
  v73 = v27;
  v28 = v24;
  objc_msgSend(v25, "decodeMutableData:task:completionHandler:", v5, v26, v72);

  v29 = v28;
LABEL_37:

  v62[0] = v23;
  v62[1] = 3221225472;
  v62[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_165;
  v62[3] = &unk_1E2547078;
  v48 = *(id *)(a1 + 32);
  v49 = *(_QWORD *)(a1 + 40);
  v50 = *(void **)(a1 + 48);
  v63 = v48;
  v64 = v49;
  v51 = v50;
  v52 = *(_QWORD *)(a1 + 64);
  v68 = a2;
  v69 = v52;
  v65 = v51;
  v66 = v20;
  v67 = v22;
  v53 = v22;
  v54 = v20;
  objc_msgSend(v29, "addFinishBlock:", v62);

}

- (AMSURLHandling)protocolHandler
{
  os_unfair_lock_s *p_propertiesLock;
  AMSURLHandling *v4;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_protocolHandler;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

- (AMSRequestEncoding)requestEncoder
{
  os_unfair_lock_s *p_propertiesLock;
  AMSRequestEncoding *v4;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_requestEncoder;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  AMSPair *v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint64_t v66;
  _QWORD aBlock[5];
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v3 = a1;
  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

  objc_msgSend(*(id *)(v3 + 32), "setResponse:", *(_QWORD *)(v3 + 40));
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    objc_msgSend(*(id *)(v3 + 32), "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v9;
    v74 = 2114;
    v75 = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task received response", buf, 0x16u);

  }
  if (os_variant_has_internal_content())
  {
    +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      objc_msgSend(*(id *)(v3 + 32), "properties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v3 + 40), "ams_allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v73 = v14;
      v74 = 2114;
      v75 = v16;
      v76 = 2114;
      v77 = v17;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Response headers: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(v3 + 48), "protocolHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_21;
    aBlock[3] = &unk_1E2546C90;
    v20 = *(void **)(v3 + 56);
    aBlock[4] = *(_QWORD *)(v3 + 48);
    v68 = v20;
    v22 = *(void **)(v3 + 64);
    v21 = *(_QWORD *)(v3 + 72);
    v70 = a2;
    v71 = v21;
    v69 = v22;
    v23 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(v3 + 48), "protocolHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(v3 + 48), "protocolHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v25 & 1) != 0)
    {
      v27 = *(_QWORD *)(v3 + 56);
      v63[0] = v19;
      v63[1] = 3221225472;
      v63[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_40;
      v63[3] = &unk_1E2546CB8;
      v28 = *(_QWORD *)(v3 + 40);
      v64 = *(id *)(v3 + 32);
      v66 = a2;
      v65 = v23;
      objc_msgSend(v26, "handleResponse:task:completionHandler:", v28, v27, v63);

      v29 = v64;
    }
    else
    {
      v32 = objc_opt_respondsToSelector();

      if ((v32 & 1) != 0)
      {
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v33, "OSLogObject");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0CB3940];
          v37 = objc_opt_class();
          if (v35)
          {
            AMSLogKey();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(v3 + 72));
            v62 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v37, v38, v62);
          }
          else
          {
            NSStringFromSelector(*(SEL *)(v3 + 72));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: %@ "), v37, v38);
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_handleResponse_task_);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_handleResponse_task_completionHandler_);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v73 = (uint64_t)v39;
          v74 = 2114;
          v75 = v55;
          v76 = 2114;
          v77 = v56;
          _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@ is deprecated. Use %{public}@ instead.", buf, 0x20u);
          if (v35)
          {

            v39 = (void *)v62;
          }

        }
        objc_msgSend(*(id *)(v3 + 48), "protocolHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleResponse:task:", *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 56));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v40 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
        +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v41;
        if (v40)
        {
          if (!v41)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v42, "OSLogObject");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)MEMORY[0x1E0CB3940];
            v46 = objc_opt_class();
            if (v44)
            {
              AMSLogKey();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(v3 + 72));
              v3 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v46, v47, v3);
            }
            else
            {
              NSStringFromSelector(*(SEL *)(v3 + 72));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: %@ "), v46, v47);
            }
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromProtocol((Protocol *)&unk_1EE0639C0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(sel_handleResponse_task_completionHandler_);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v73 = (uint64_t)v48;
            v74 = 2114;
            v75 = v58;
            v76 = 2114;
            v77 = v59;
            _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
            if (v44)
            {

              v48 = (void *)v3;
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v49, 0);
        }
        else
        {
          if (!v41)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v42, "OSLogObject");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            AMSLogKey();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)MEMORY[0x1E0CB3940];
            v52 = objc_opt_class();
            if (v50)
            {
              AMSLogKey();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(v3 + 72));
              v3 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v52, v53, v3);
            }
            else
            {
              NSStringFromSelector(*(SEL *)(v3 + 72));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: %@ "), v52, v53);
            }
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromProtocol((Protocol *)&unk_1EE0639C0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(sel_handleResponse_task_completionHandler_);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v73 = (uint64_t)v54;
            v74 = 2114;
            v75 = v60;
            v76 = 2114;
            v77 = v61;
            _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_FAULT, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
            if (v50)
            {

              v54 = (void *)v3;
            }

          }
        }

        +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(void *, void *))v23 + 2))(v23, v29);
    }

  }
  else
  {
    v30 = *(void **)(v3 + 64);
    v31 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", &unk_1E25AFB78, 0);
    objc_msgSend(v30, "finishWithResult:", v31);

  }
}

void __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:error:logDuplicateFinishes:", v3, 0, 0);

}

+ (AKAppleIDSession)sharedAuthKitSession
{
  if (qword_1ECEAD990 != -1)
    dispatch_once(&qword_1ECEAD990, &__block_literal_global_15_0);
  return (AKAppleIDSession *)(id)qword_1ECEAD998;
}

- (AMSURLSession)initWithConfiguration:(id)a3
{
  return -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](self, "initWithConfiguration:delegate:delegateQueue:", a3, 0, 0);
}

void __31__AMSURLSession_defaultSession__block_invoke()
{
  AMSURLSession *v0;
  void *v1;

  v0 = objc_alloc_init(AMSURLSession);
  v1 = (void *)qword_1ECEAD978;
  qword_1ECEAD978 = (uint64_t)v0;

}

- (AMSURLSession)init
{
  return -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](self, "initWithConfiguration:delegate:delegateQueue:", 0, 0, 0);
}

- (id)dataTaskPromiseWithRequest:(id)a3
{
  return -[AMSURLSession dataTaskPromiseWithRequest:activity:](self, "dataTaskPromiseWithRequest:activity:", a3, 0);
}

- (id)dataTaskPromiseWithRequest:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  AMSMutableLazyPromise *v8;
  id v9;
  id v10;
  AMSMutableLazyPromise *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [AMSMutableLazyPromise alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke;
  v13[3] = &unk_1E2547190;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = -[AMSMutableLazyPromise initWithBlock:](v8, "initWithBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSURLSession delegateProxy](self, "delegateProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_INFO, "AMSURLSession: dealloc", buf, 2u);
  }

  -[AMSURLDelegateProxy invalidate](self->_delegateProxy, "invalidate");
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
  v5.receiver = self;
  v5.super_class = (Class)AMSURLSession;
  -[AMSURLSession dealloc](&v5, sel_dealloc);
}

- (void)setProtocolHandler:(id)a3
{
  id v4;
  AMSURLHandling *protocolHandler;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v4, "setSession:", self);
  protocolHandler = self->_protocolHandler;
  self->_protocolHandler = (AMSURLHandling *)v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

- (AMSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSURLSession *v11;
  void *v12;
  void *v13;
  id *p_configuration;
  id v15;
  void *v16;
  void *v17;
  AMSURLDelegateProxy *v18;
  AMSURLDelegateProxy *delegateProxy;
  NSOperationQueue *v20;
  NSOperationQueue *delegateQueue;
  AMSURLProtocolHandler *v22;
  AMSURLHandling *protocolHandler;
  AMSURLResponseDecoder *v24;
  AMSResponseDecoding *responseDecoder;
  void *v26;
  AMSURLDelegateProxy *v27;
  void *v28;
  uint64_t v29;
  NSURLSession *session;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)AMSURLSession;
  v11 = -[AMSURLSession init](&v32, sel_init);
  if (v11)
  {
    if (!v8)
    {
      v12 = (void *)MEMORY[0x1E0C92CA0];
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ams_configurationWithProcessInfo:bag:", v13, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, v8);
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*p_configuration, "protocolClasses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);

      objc_msgSend(v17, "insertObject:atIndex:", objc_opt_class(), 0);
      objc_msgSend(*p_configuration, "setProtocolClasses:", v17);

    }
    v18 = -[AMSURLDelegateProxy initWithSession:delegate:]([AMSURLDelegateProxy alloc], "initWithSession:delegate:", v11, v9);
    delegateProxy = v11->_delegateProxy;
    v11->_delegateProxy = v18;

    if (v10)
      v20 = (NSOperationQueue *)v10;
    else
      v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    delegateQueue = v11->_delegateQueue;
    v11->_delegateQueue = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_delegateQueue, "setMaxConcurrentOperationCount:", 1);
    v22 = objc_alloc_init(AMSURLProtocolHandler);
    protocolHandler = v11->_protocolHandler;
    v11->_protocolHandler = (AMSURLHandling *)v22;

    -[AMSURLHandling setSession:](v11->_protocolHandler, "setSession:", v11);
    v24 = objc_alloc_init(AMSURLResponseDecoder);
    responseDecoder = v11->_responseDecoder;
    v11->_responseDecoder = (AMSResponseDecoding *)v24;

    v26 = (void *)MEMORY[0x1E0C92C98];
    v27 = v11->_delegateProxy;
    -[AMSURLSession delegateQueue](v11, "delegateQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sessionWithConfiguration:delegate:delegateQueue:", v8, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    session = v11->_session;
    v11->_session = (NSURLSession *)v29;

    v11->_useFallbackBag = 1;
    v11->_propertiesLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  AMSDeallocGuard *v26;
  uint64_t v27;
  AMSDeallocGuard *v28;
  void *v29;
  AMSDeallocGuard *v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  AMSDeallocGuard *v35;
  void (**v36)(id, uint64_t, _QWORD);
  uint64_t *v37;
  uint64_t *v38;
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__74;
  v48 = __Block_byref_object_dispose__74;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  objc_msgSend(v11, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if (v15
    && os_variant_has_internal_content()
    && (+[AMSDefaults QAMode](AMSDefaults, "QAMode")
     || +[AMSDefaults ignoreServerTrustEvaluation](AMSDefaults, "ignoreServerTrustEvaluation")
     || +[AMSDefaults ss_ignoreServerTrustEvaluation](AMSDefaults, "ss_ignoreServerTrustEvaluation")))
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      objc_msgSend(v32, "properties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v18;
      v52 = 2114;
      v53 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring server trust", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", objc_msgSend(v13, "serverTrust"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v45[5];
    v45[5] = v21;

    v41[3] = 0;
  }
  v23 = v41[3];
  if (v23 != 1)
    goto LABEL_15;
  -[AMSURLSession delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) == 0)
  {
    v23 = v41[3];
LABEL_15:
    v12[2](v12, v23, v45[5]);
    goto LABEL_16;
  }
  v26 = [AMSDeallocGuard alloc];
  v27 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v39[3] = &unk_1E2540A40;
  v39[4] = self;
  v39[5] = a2;
  v28 = -[AMSDeallocGuard initWithDeallocGuardBlock:](v26, "initWithDeallocGuardBlock:", v39);
  -[AMSURLSession delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  v34[1] = 3221225472;
  v34[2] = __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_144;
  v34[3] = &unk_1E2546E48;
  v37 = &v44;
  v38 = &v40;
  v36 = v12;
  v30 = v28;
  v35 = v30;
  objc_msgSend(v29, "URLSession:didReceiveChallenge:completionHandler:", v33, v11, v34);

LABEL_16:
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  _UNKNOWN **v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  AMSPair *v36;
  void *v37;
  AMSPair *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = &off_1E2519000;
  if (v7)
  {
    v9 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        v16 = v15;
        if (v13)
        {
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v3);
        }
        else
        {
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v17;
        v42 = 2114;
        v43 = v24;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling action. error = %{public}@", buf, 0x16u);
        if (v13)
        {

          v17 = (void *)v3;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v18, 0);
    }
    else
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_opt_class();
        v22 = v21;
        if (v19)
        {
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v3);
        }
        else
        {
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v23;
        v42 = 2114;
        v43 = v25;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling action. error = %{public}@", buf, 0x16u);
        if (v19)
        {

          v23 = (void *)v3;
        }

      }
    }

  }
  objc_msgSend(v6, "second");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v39 = v6;
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = objc_opt_class();
      if (v29)
      {
        AMSLogKey();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v31, v32, v8);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: %@ "), v31, v32);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v33;
      v42 = 2114;
      v43 = v34;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error occurred when handling URL action. error = %{public}@", buf, 0x16u);
      if (v29)
      {

        v33 = v8;
      }

      v6 = v39;
    }

  }
  v35 = *(void **)(a1 + 40);
  v36 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[AMSPair initWithFirst:second:](v36, "initWithFirst:second:", v37, v26);
  objc_msgSend(v35, "finishWithResult:", v38);

}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AMSHTTPArchiveTaskInfo *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Recording HAR log to ring buffer in progress (needs sysdiagnose or command to save to disk)", (uint8_t *)&v8, 0x16u);

  }
  v7 = -[AMSHTTPArchiveTaskInfo initWithURLTaskInfo:]([AMSHTTPArchiveTaskInfo alloc], "initWithURLTaskInfo:", *(_QWORD *)(a1 + 40));
  +[AMSStreamHTTPArchiveEntryController ams_addEntriesForTaskInfo:](AMSStreamHTTPArchiveEntryController, "ams_addEntriesForTaskInfo:", v7);

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_4;
  v8[3] = &unk_1E2541440;
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  objc_msgSend(v5, "continueContiguousAsyncActionWithIdentifier:block:", v4, v8);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  AMSMutablePromise *v16;
  id v17;
  id v18;
  id v19;
  AMSMutablePromise *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  AMSURLSession *v32;
  id v33;
  uint64_t v34;
  SEL v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  SEL v42;
  _QWORD v43[4];
  id v44;
  id v45;
  AMSURLSession *v46;
  id v47;
  AMSMutablePromise *v48;
  SEL v49;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(AMSMutablePromise);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v43[3] = &unk_1E2546CE0;
  v17 = v15;
  v44 = v17;
  v18 = v13;
  v45 = v18;
  v46 = self;
  v19 = v12;
  v48 = v16;
  v49 = a2;
  v47 = v19;
  v20 = v16;
  v21 = objc_msgSend(v17, "startContiguousAsyncActionWithInitialBlock:", v43);
  v22 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_119;
  v36[3] = &unk_1E2546DD0;
  v36[4] = self;
  v23 = v17;
  v41 = v21;
  v42 = a2;
  v37 = v23;
  v38 = v11;
  v39 = v19;
  v40 = v18;
  v29 = v18;
  v24 = v19;
  v25 = v11;
  -[AMSMutablePromise thenWithBlock:](v20, "thenWithBlock:", v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_133;
  v30[3] = &unk_1E2546E20;
  v31 = v23;
  v32 = self;
  v34 = v21;
  v35 = a2;
  v33 = v14;
  v27 = v14;
  v28 = v23;
  objc_msgSend(v26, "addFinishBlock:", v30);

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMetrics:", v9);
  -[AMSURLSession delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSURLSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLSession:task:didFinishCollectingMetrics:", v14, v8, v9);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendData:", v9);
  -[AMSURLSession delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSURLSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLSession:dataTask:didReceiveData:", v14, v8, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityPolicy, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __37__AMSURLSession_sharedAuthKitSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D00140]);
  v1 = (void *)qword_1ECEAD998;
  qword_1ECEAD998 = (uint64_t)v0;

}

+ (id)defaultSession
{
  if (_MergedGlobals_153 != -1)
    dispatch_once(&_MergedGlobals_153, &__block_literal_global_135);
  return (id)qword_1ECEAD978;
}

- (void)setResponseDecoder:(id)a3
{
  AMSResponseDecoding *v4;
  AMSResponseDecoding *responseDecoder;

  v4 = (AMSResponseDecoding *)a3;
  os_unfair_lock_lock_with_options();
  responseDecoder = self->_responseDecoder;
  self->_responseDecoder = v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[AMSURLSession dataTaskWithRequest:activity:completionHandler:](self, "dataTaskWithRequest:activity:completionHandler:", a3, 0, a4);
}

+ (AMSURLSession)minimalSession
{
  return (AMSURLSession *)static AMSURLSession.minimalSession.getter();
}

+ (id)minimalSessionUsing:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = static AMSURLSession.minimalSession(using:)((uint64_t)v3);

  return v4;
}

+ (AMSURLSession)loggingOnlySession
{
  return (AMSURLSession *)static AMSURLSession.loggingOnlySession.getter();
}

+ (id)loggingOnlySessionUsing:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = static AMSURLSession.loggingOnlySession(using:)((uint64_t)v3);

  return v4;
}

+ (id)imageSession
{
  if (qword_1ECEAD980 != -1)
    dispatch_once(&qword_1ECEAD980, &__block_literal_global_14_4);
  return (id)qword_1ECEAD988;
}

void __29__AMSURLSession_imageSession__block_invoke()
{
  AMSURLSession *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AMSURLSession alloc];
  objc_msgSend(MEMORY[0x1E0C92CA0], "ams_imageConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AMSURLSession initWithConfiguration:](v0, "initWithConfiguration:", v3);
  v2 = (void *)qword_1ECEAD988;
  qword_1ECEAD988 = v1;

}

- (void)setRequestEncoder:(id)a3
{
  AMSRequestEncoding *v4;
  AMSRequestEncoding *requestEncoder;

  v4 = (AMSRequestEncoding *)a3;
  os_unfair_lock_lock_with_options();
  requestEncoder = self->_requestEncoder;
  self->_requestEncoder = v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

- (void)finishTasksAndInvalidate
{
  -[AMSURLSession setInvalidated:](self, "setInvalidated:", 1);
}

- (void)invalidateAndCancel
{
  id v3;

  -[AMSURLSession setInvalidated:](self, "setInvalidated:", 1);
  -[AMSURLSession session](self, "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllTasksWithCompletionHandler:", &__block_literal_global_18_2);

}

void __36__AMSURLSession_invalidateAndCancel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AMSPair *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _BOOL8 v13;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "actionType") == 0;
    objc_msgSend(*(id *)(a1 + 32), "_handleURLAction:task:contiguousActionIdentifier:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v10[3] = &unk_1E2546C68;
    v7 = *(_QWORD *)(a1 + 64);
    v10[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v11 = *(id *)(a1 + 48);
    v13 = v5;
    objc_msgSend(v6, "addFinishBlock:", v10);

  }
  else
  {
    v8 = *(void **)(a1 + 48);
    v9 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", &unk_1E25AFB78, 0);
    objc_msgSend(v8, "finishWithResult:", v9);

  }
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_41;
  v8[3] = &unk_1E253E900;
  v9 = v4;
  v6 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v9, "continueContiguousAsyncActionWithIdentifier:block:", v5, v8);

}

uint64_t __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_41(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AMSSetLogKey(v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AMSMutablePromise *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  AMSMutablePromise *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  AMSMutablePromise *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_120;
  v28[3] = &unk_1E2546D58;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 72);
  v29 = v10;
  v36 = v11;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 32);
  v30 = v12;
  v31 = v13;
  v14 = *(_QWORD *)(a1 + 80);
  v37 = v5;
  v38 = v14;
  v32 = *(id *)(a1 + 48);
  v33 = *(id *)(a1 + 56);
  v34 = *(id *)(a1 + 64);
  v35 = v7;
  v15 = v7;
  objc_msgSend(v8, "addOperationWithBlock:", v28);

  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3_130;
  v22[3] = &unk_1E2546DA8;
  v16 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v23 = v16;
  v24 = v17;
  v18 = *(_QWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 72);
  v27 = v18;
  v25 = v12;
  v19 = v12;
  -[AMSMutablePromise thenWithBlock:](v15, "thenWithBlock:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_120(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 88);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v8[3] = &unk_1E2546D30;
  v9 = v2;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v10 = v4;
  v11 = v5;
  v7 = *(_QWORD *)(a1 + 104);
  v16 = *(_QWORD *)(a1 + 96);
  v17 = v7;
  v12 = v6;
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 80);
  objc_msgSend(v9, "continueContiguousAsyncActionWithIdentifier:block:", v3, v8);

}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_opt_class();
      if (v6)
      {
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v8, v9, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@ "), v8, v9);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        v10 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);
  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      if (v12)
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        v16 = (void *)a1;
      }

    }
  }

}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_124(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

}

id __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_126(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;

  v4 = a3;
  v5 = a2;
  v6 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v5, v4);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

AMSMutablePromise *__74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3_130(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AMSMutablePromise *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  AMSMutablePromise *v12;
  id v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  AMSMutablePromise *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(AMSMutablePromise);
  v8 = (void *)a1[4];
  v9 = a1[7];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4_131;
  v17[3] = &unk_1E2546D80;
  v18 = v8;
  v19 = v6;
  v10 = (void *)a1[6];
  v20 = a1[5];
  v11 = a1[8];
  v23 = v5;
  v24 = v11;
  v21 = v10;
  v12 = v7;
  v22 = v12;
  v13 = v6;
  objc_msgSend(v18, "continueContiguousAsyncActionWithIdentifier:block:", v9, v17);
  v14 = v22;
  v15 = v12;

  return v15;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4_131(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = AMSSetLogKey(v4);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = objc_opt_class();
        if (v9)
        {
          AMSLogKey();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v1);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(*(void **)(a1 + 56));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v13;
        v22 = 2114;
        v23 = v16;
        v24 = 2114;
        v25 = v17;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error occurred when getting URLSessionResponseDisposition, but taskInfo already had an error set. taskInfoError = %{public}@ | receivedError = %{public}@", buf, 0x20u);

        if (v9)
        {

          v13 = (void *)v1;
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 72) == 1)
      v14 = 0;
    else
      v14 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 72);
  }
  v18 = *(void **)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finishWithResult:", v19);

}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_134;
  v14[3] = &unk_1E2546DF8;
  v15 = v5;
  v16 = v6;
  v7 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 40);
  v20 = v8;
  v19 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 56);
  v18 = v10;
  v21 = v11;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v7, "continueContiguousAsyncActionWithIdentifier:block:", v9, v14);

}

uint64_t __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_134(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "integerValue");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = objc_opt_class();
        if (v7)
        {
          AMSLogKey();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 72));
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v1);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 72));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(*(void **)(a1 + 40));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling NSURLSessionResponseDisposition. Defaulting to cancelling the request. error = %{public}@.", buf, 0x16u);
        if (v7)
        {

          v11 = (void *)v1;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v12, 0);
    }
    else
    {
      if (!v4)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        if (v13)
        {
          AMSLogKey();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 72));
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v15, v16, v1);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 72));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ "), v15, v16);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(*(void **)(a1 + 40));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling NSURLSessionResponseDisposition. Defaulting to cancelling the request. error = %{public}@.", buf, 0x16u);
        if (v13)
        {

          v17 = (void *)v1;
        }

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "finishContiguousAsyncActionWithIdentifier:", *(_QWORD *)(a1 + 80));
}

void __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_opt_class();
      if (v6)
      {
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v8, v9, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@ "), v8, v9);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        v10 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);
  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      if (v12)
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        v16 = (void *)a1;
      }

    }
  }

}

void __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_144(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  AMSURLSession *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  SEL v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOriginalResponse:", v15);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v25[3] = &unk_1E2546F38;
  v26 = v18;
  v27 = self;
  v28 = v16;
  v29 = v14;
  v30 = v13;
  v31 = v15;
  v32 = v17;
  v33 = a2;
  v19 = v17;
  v20 = v15;
  v21 = v13;
  v22 = v14;
  v23 = v16;
  v24 = v18;
  objc_msgSend(v24, "startContiguousAsyncActionWithInitialBlock:", v25);

}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  int8x16_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  int8x16_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v9;
    v36 = 2114;
    v37 = v11;
    v38 = 2114;
    v39 = v13;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task redirecting to URL: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_reconfigureNewRequest:originalTask:protocolHandler:redirect:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_146;
  v27[3] = &unk_1E2546EC0;
  v21 = *(int8x16_t *)(a1 + 32);
  v17 = (id)v21.i64[0];
  v28 = vextq_s8(v21, v21, 8uLL);
  v18 = *(_QWORD *)(a1 + 88);
  v32 = a2;
  v33 = v18;
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 56);
  v31 = *(id *)(a1 + 72);
  objc_msgSend(v15, "thenWithBlock:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_152;
  v22[3] = &unk_1E2546F10;
  v23 = *(id *)(a1 + 32);
  v26 = a2;
  v20 = *(id *)(a1 + 80);
  v24 = *(_QWORD *)(a1 + 40);
  v25 = v20;
  objc_msgSend(v19, "addFinishBlock:", v22);

}

AMSMutablePromise *__89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  AMSMutablePromise *v9;
  id v10;
  AMSMutablePromise *v11;
  AMSMutablePromise *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AMSMutablePromise *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E2546D30;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v7;
  v8 = *(_QWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 72);
  v23 = v8;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v20 = v3;
  v9 = v4;
  v21 = v9;
  v10 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v14);

  v11 = v21;
  v12 = v9;

  return v12;
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
  v5[3] = &unk_1E2546E98;
  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v5[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  objc_msgSend(v2, "continueContiguousAsyncActionWithIdentifier:block:", v4, v5);

}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  AMSDeallocGuard *v4;
  uint64_t v5;
  uint64_t v6;
  AMSDeallocGuard *v7;
  AMSMutablePromise *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AMSDeallocGuard *v14;
  AMSMutablePromise *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  AMSMutablePromise *v20;
  AMSDeallocGuard *v21;
  _QWORD v22[6];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = [AMSDeallocGuard alloc];
    v5 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4;
    v22[3] = &unk_1E2540A40;
    v6 = *(_QWORD *)(a1 + 80);
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = v6;
    v7 = -[AMSDeallocGuard initWithDeallocGuardBlock:](v4, "initWithDeallocGuardBlock:", v22);
    v8 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 10.0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    v16 = v5;
    v17 = 3221225472;
    v18 = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_149;
    v19 = &unk_1E2546E70;
    v20 = v8;
    v21 = v7;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v9, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", v10, v11, v12, v13, &v16);

    objc_msgSend(*(id *)(a1 + 72), "finishWithPromise:", v15, v16, v17, v18, v19);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", *(_QWORD *)(a1 + 64));
  }
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_opt_class();
      if (v6)
      {
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v8, v9, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@ "), v8, v9);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        v10 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);
  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      if (v12)
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        v16 = (void *)a1;
      }

    }
  }

}

uint64_t __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_149(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  int8x16_t v13;
  _QWORD v14[4];
  id v15;
  int8x16_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3_153;
  v14[3] = &unk_1E2546EE8;
  v15 = v5;
  v8 = *(_QWORD *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  v13 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v13.i64[0];
  v16 = vextq_s8(v13, v13, 8uLL);
  v10 = *(_QWORD *)(a1 + 56);
  v17 = v6;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "continueContiguousAsyncActionWithIdentifier:block:", v8, v14);

}

uint64_t __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3_153(uint64_t a1)
{
  void (*v2)(void);
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 48), "properties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(*(void **)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to redirect. Error = %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "setError:", *(_QWORD *)(a1 + 56));
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v2();
  return objc_msgSend(*(id *)(a1 + 48), "finishContiguousAsyncActionWithIdentifier:", *(_QWORD *)(a1 + 72));
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2;
  v11[3] = &unk_1E25414B8;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "continueContiguousAsyncActionWithIdentifier:block:", v8, v11);

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  char *v29;
  AMSMutablePromise *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  AMSMutablePromise *v36;
  AMSMutablePromise *v37;
  AMSMutablePromise *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  AMSMutablePromise *v78;
  uint64_t v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v5 = buf;
  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "assertIsOnPrivateQueue");
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &off_1E2519000;
  if (v6)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v67 = v9;
    v13 = v6;
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_opt_class();
    v18 = v17;
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logUUID");
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v10);
    }
    else
    {
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v81 = v19;
    v82 = 2114;
    v83 = v13;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Object decoding failed. Continuing request completion handling without object. error = %{public}@", buf, 0x16u);
    if (v15)
    {

      v19 = v5;
    }

    v6 = v13;
    goto LABEL_17;
  }
  if (v9)
    goto LABEL_19;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v67 = 0;
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = objc_opt_class();
    v24 = v23;
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logUUID");
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v10);
    }
    else
    {
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v81 = v25;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Object decoding produced no object. Continuing request completion handling without object.", buf, 0xCu);
    if (v21)
    {

      v25 = v9;
    }

    v6 = 0;
LABEL_17:
    v9 = v67;
  }
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  v28 = MEMORY[0x1E0C809B0];
  v29 = "sponseENS2_9HTTPErrorEEERKNS_10shared_ptrIKNS2_13IMediaAccountEEEONS3_7OptionsEENS_9allocatorISN_EEFS4_S7_SD_NSE_ISF_EESL_EEE";
  if ((v27 & 1) != 0)
  {
    v30 = objc_alloc_init(AMSMutablePromise);
    objc_msgSend(*(id *)(a1 + 40), "protocolHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v28;
    v76[1] = 3221225472;
    v76[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_167;
    v76[3] = &unk_1E2546F88;
    v34 = *(id *)(a1 + 32);
    v35 = *(_QWORD *)(a1 + 72);
    v77 = v34;
    v79 = v35;
    v36 = v30;
    v78 = v36;
    objc_msgSend(v31, "handleCompletionWithTask:metrics:decodedObject:completionHandler:", v32, v33, v9, v76);

    v37 = v78;
    v38 = v36;

    v39 = v38;
  }
  else
  {
    v40 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if ((_DWORD)v40)
    {
      if (!v41)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v42, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v65 = v6;
        AMSLogKey();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CB3940];
        v46 = objc_opt_class();
        if (v44)
        {
          AMSLogKey();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v40 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v46, v47, v40);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: %@ "), v46, v47);
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProtocol((Protocol *)&unk_1EE0639C0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v81 = v48;
        v82 = 2114;
        v83 = v55;
        v84 = 2114;
        v85 = v56;
        _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
        if (v44)
        {

          v48 = (void *)v40;
        }

        v6 = v65;
        v28 = MEMORY[0x1E0C809B0];
        v29 = "NSt3__110__function6__funcIPFN7AMSCore21LoadURLMetricsHandler25LoadURLMetricsHandlerTaskERKNS2_11HTTPReque"
              "stERKNS_8expectedINS2_12HTTPResponseENS2_9HTTPErrorEEERKNS_10shared_ptrIKNS2_13IMediaAccountEEEONS3_7Optio"
              "nsEENS_9allocatorISN_EEFS4_S7_SD_NSE_ISF_EESL_EEE"
            + 136;
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v49, 0);
    }
    else
    {
      if (!v41)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v42, "OSLogObject");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        v66 = v6;
        AMSLogKey();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x1E0CB3940];
        v52 = objc_opt_class();
        if (v50)
        {
          AMSLogKey();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v40 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v52, v53, v40);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: %@ "), v52, v53);
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProtocol((Protocol *)&unk_1EE0639C0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v81 = v54;
        v82 = 2114;
        v83 = v57;
        v84 = 2114;
        v85 = v58;
        _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_FAULT, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
        if (v50)
        {

          v54 = (void *)v40;
        }

        v6 = v66;
        v28 = MEMORY[0x1E0C809B0];
        v29 = "sponseENS2_9HTTPErrorEEERKNS_10shared_ptrIKNS2_13IMediaAccountEEEONS3_7OptionsEENS_9allocatorISN_EEFS4_S7_SD_NSE_ISF_EESL_EEE";
      }
    }

    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v38 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v68[0] = v28;
  v68[1] = *((_QWORD *)v29 + 245);
  v68[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_169;
  v68[3] = &unk_1E2547050;
  v59 = *(id *)(a1 + 32);
  v60 = *(_QWORD *)(a1 + 40);
  v61 = *(void **)(a1 + 48);
  v69 = v59;
  v70 = v60;
  v62 = v61;
  v63 = *(_QWORD *)(a1 + 72);
  v71 = v62;
  v75 = v63;
  v72 = *(id *)(a1 + 56);
  v73 = *(id *)(a1 + 64);
  v74 = v9;
  v64 = v9;
  objc_msgSend(v39, "addSuccessBlock:", v68);

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_168;
  v7[3] = &unk_1E253E2B0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "continueContiguousAsyncActionWithIdentifier:block:", v5, v7);

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_168(uint64_t a1)
{
  void *v1;
  AMSOptional *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "finishWithResult:", v2);

}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_169(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  AMSPair *v13;
  AMSPair *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "assertIsOnPrivateQueue");
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleURLAction:task:contiguousActionIdentifier:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v8;
    v34[1] = 3221225472;
    v34[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_170;
    v34[3] = &unk_1E2546FB0;
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v35 = v10;
    v36 = v11;
    v37 = v7;
    objc_msgSend(v9, "thenWithBlock:", v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = [AMSPair alloc];
    v14 = -[AMSPair initWithFirst:second:](v13, "initWithFirst:second:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 56));
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_171;
  v28[3] = &unk_1E2547000;
  v15 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 80);
  v29 = v15;
  v33 = v16;
  v30 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 40);
  v31 = v17;
  v32 = v18;
  objc_msgSend(v12, "thenWithBlock:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_5;
  v23[3] = &unk_1E2547028;
  v20 = *(id *)(a1 + 32);
  v27 = *(_QWORD *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(a1 + 48);
  v24 = v20;
  v25 = v21;
  v26 = v22;
  objc_msgSend(v19, "addFinishBlock:", v23);

}

id __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_170(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  AMSPair *v13;
  void *v14;
  AMSPair *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 48);
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Protocol completed with error. %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    v6 = *(id *)(a1 + 32);
  }
  v12 = objc_msgSend(v4, "actionType") == 3 || objc_msgSend(v4, "actionType") == 0;
  v13 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSPair initWithFirst:second:](v13, "initWithFirst:second:", v14, v6);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

AMSMutablePromise *__54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  uint64_t v6;
  AMSMutablePromise *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  AMSMutablePromise *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_172;
  v13[3] = &unk_1E2546E98;
  v14 = v3;
  v15 = v5;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v10 = v3;
  objc_msgSend(v15, "continueContiguousAsyncActionWithIdentifier:block:", v6, v13);
  v11 = v7;

  return v11;
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_172(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "first");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setError:", v4);
  objc_msgSend(*(id *)(a1 + 40), "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ams_isEphemeralAccount");

  if ((v7 & 1) == 0 && *(_QWORD *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "createMetricsContextForDecodedObject:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "reportMetricsForContext:", v8);

  }
  if ((v3 & 1) != 0)
  {
    if (!v4)
    {
      +[AMSURLResult URLResultPromiseWithTaskInfo:object:](AMSURLResult, "URLResultPromiseWithTaskInfo:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3;
      v12[3] = &unk_1E2546FD8;
      v10 = *(id *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 80);
      v13 = v10;
      v14 = v11;
      v15 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 64);
      objc_msgSend(v9, "addFinishBlock:", v12);

      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 72), "_completeTaskWithTaskInfo:result:decodedObject:error:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), v4);
  }
  objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
LABEL_9:

}

uint64_t __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithTaskInfo:result:decodedObject:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
  return objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_6;
  v14[3] = &unk_1E2543C60;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v9 = *(_QWORD *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 56);
  v19 = v10;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v8, "continueContiguousAsyncActionWithIdentifier:block:", v9, v14);

}

uint64_t __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v3 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = objc_opt_class();
        v10 = v9;
        if (v7)
        {
          AMSLogKey();
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v1);
        }
        else
        {
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(*(void **)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling completed task. error = %{public}@", buf, 0x16u);
        if (v7)
        {

          v11 = (void *)v1;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v12, 0);
    }
    else
    {
      if (!v4)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        v16 = v15;
        if (v13)
        {
          AMSLogKey();
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v1);
        }
        else
        {
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(*(void **)(a1 + 48));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling completed task. error = %{public}@", buf, 0x16u);
        if (v13)
        {

          v17 = (void *)v1;
        }

      }
    }

  }
  +[AMSURLTaskInfo removeTaskInfoForTask:](AMSURLTaskInfo, "removeTaskInfoForTask:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 64), "finishContiguousAsyncActionWithIdentifier:", *(_QWORD *)(a1 + 72));
}

- (id)dataTaskWithRequest:(id)a3
{
  return -[AMSURLSession dataTaskWithRequest:completionHandler:](self, "dataTaskWithRequest:completionHandler:", a3, 0);
}

- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 completionHandler:(id)a5
{
  return -[AMSURLSession dataTaskWithRequest:signpostID:activity:completionHandler:](self, "dataTaskWithRequest:signpostID:activity:completionHandler:", a3, a4, 0, a5);
}

- (void)createDataTaskWithRequest:(id)a3 activity:(id)a4 dataTaskCreationCompletionHandler:(id)a5 requestCompletionHandler:(id)a6
{
  -[AMSURLSession createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:](self, "createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:", a3, 0, a4, a5, a6);
}

- (void)createDataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 dataTaskCreationCompletionHandler:(id)a6 requestCompletionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  AMSURLRequestProperties *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  AMSURLRequestProperties *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  AMSURLRequestProperties *v51;
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v48 = a5;
  v13 = a6;
  v47 = a7;
  -[AMSURLSession protocolHandler](self, "protocolHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_enabled(v17);
  if (a4)
    v19 = 0;
  else
    v19 = v18;

  if (!v15)
  if (v19)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    a4 = os_signpost_id_make_with_pointer(v22, v12);

    if (!v20)
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();

    }
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      objc_msgSend(v12, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = (uint64_t)v27;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v25, OS_SIGNPOST_INTERVAL_BEGIN, a4, "URL Data Task", "%{public}@", buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "properties");
    v28 = (AMSURLRequestProperties *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v31;
      v58 = 2114;
      v59 = v32;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Falling back to default properties since we don't have an AMSURLRequest", buf, 0x16u);

    }
    v28 = objc_alloc_init(AMSURLRequestProperties);
    if (-[AMSURLSession useFallbackBag](self, "useFallbackBag"))
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_opt_class();
        -[AMSURLRequestProperties logUUID](v28, "logUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v35;
        v58 = 2114;
        v59 = v36;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: falling back to default properties (this may cause an additional bag load)", buf, 0x16u);

      }
      +[AMSURLRequestEncoder bagSubProfile](AMSURLRequestEncoder, "bagSubProfile");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSURLRequestEncoder bagSubProfileVersion](AMSURLRequestEncoder, "bagSubProfileVersion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSURLRequestProperties setBag:](v28, "setBag:", v39);

    }
  }
  -[AMSURLRequestProperties logUUID](v28, "logUUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLSession _prepareRequest:logUUID:](self, "_prepareRequest:logUUID:", v12, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke;
  v49[3] = &unk_1E2547140;
  v49[4] = self;
  v50 = v48;
  v54 = v13;
  v55 = a4;
  v51 = v28;
  v52 = v14;
  v53 = v47;
  v42 = v13;
  v43 = v14;
  v44 = v28;
  v45 = v48;
  v46 = v47;
  objc_msgSend(v41, "addFinishBlock:", v49);

}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_taskFromSession:request:activity:", v7, v5, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_createSharedDataForTask:properties:completionHandler:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSignpostID:", *(_QWORD *)(a1 + 80));
    if (*(_QWORD *)(a1 + 56))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_2;
      v12[3] = &unk_1E2547118;
      v13 = v9;
      v10 = v8;
      v11 = *(_QWORD *)(a1 + 32);
      v14 = v10;
      v15 = v11;
      v16 = *(id *)(a1 + 48);
      v19 = *(id *)(a1 + 64);
      v20 = *(id *)(a1 + 72);
      v17 = *(id *)(a1 + 56);
      v18 = v5;
      objc_msgSend(v13, "startContiguousAsyncActionWithInitialBlock:", v12);

    }
  }

}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void *, uint64_t, _QWORD);
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E25470F0;
  v20 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v26 = a2;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = *(id *)(a1 + 80);
  v25 = *(id *)(a1 + 88);
  v10 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v11 = objc_msgSend(*(id *)(a1 + 48), "_protocolHandler:canUseAlternateImplementationOfSelector:", *(_QWORD *)(a1 + 64), sel_didCreateTask_fromRequest_error_);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  if (v11)
  {
    objc_msgSend(v13, "didCreateTask:fromRequest:completionHandler:", v12, v14, v10);
  }
  else
  {
    v18 = 0;
    objc_msgSend(v13, "didCreateTask:fromRequest:error:", v12, v14, &v18);
    v15 = v18;
    if (v15)
    {
      v16 = 0;
      v17 = v15;
    }
    else
    {
      v16 = 1;
      v17 = 0;
    }
    ((void (**)(void *, uint64_t, id))v10)[2](v10, v16, v17);

  }
}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;

  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 80);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_4;
  v16[3] = &unk_1E25470C8;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v6;
  v21 = v5;
  v22 = *(id *)(a1 + 64);
  v25 = a2;
  v12 = *(id *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v23 = v12;
  v24 = v13;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v9, "continueContiguousAsyncActionWithIdentifier:block:", v8, v16);

}

uint64_t __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AMSSetLogKey(v3);

  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 48), "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task created: %{public}@ Session: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 64) && (v11 = *(_QWORD *)(a1 + 72)) != 0)
  {
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
  else if (*(_BYTE *)(a1 + 96))
  {
    v12 = *(_QWORD *)(a1 + 80);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 56));
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishContiguousAsyncActionWithIdentifier:", *(_QWORD *)(a1 + 88));
}

void __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:error:logDuplicateFinishes:", v7, 0, 0);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "resume");
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_2;
  v6[3] = &unk_1E253E120;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addErrorBlock:", v6);

}

uint64_t __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithResult:", a2);
}

- (id)dataTaskPromiseWithRequestPromise:(id)a3
{
  return -[AMSURLSession dataTaskPromiseWithRequestPromise:activity:](self, "dataTaskPromiseWithRequestPromise:activity:", a3, 0);
}

- (id)dataTaskPromiseWithRequestPromise:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__AMSURLSession_dataTaskPromiseWithRequestPromise_activity___block_invoke;
  v10[3] = &unk_1E253EBD8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__AMSURLSession_dataTaskPromiseWithRequestPromise_activity___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataTaskPromiseWithRequest:activity:", a2, *(_QWORD *)(a1 + 40));
}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_200(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AMSHTTPArchiveTaskInfo *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Recording HAR log.", (uint8_t *)&v8, 0x16u);

  }
  v7 = -[AMSHTTPArchiveTaskInfo initWithURLTaskInfo:]([AMSHTTPArchiveTaskInfo alloc], "initWithURLTaskInfo:", *(_QWORD *)(a1 + 40));
  +[AMSHTTPArchiveService recordTrafficWithTaskInfo:](AMSHTTPArchiveService, "recordTrafficWithTaskInfo:", v7);

}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_202(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLSession:task:didCompleteWithError:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  v6 = *(id *)(a1 + 48);
  if (v6
    || !*(_QWORD *)(a1 + 56)
    && (AMSError(0, CFSTR("Unknown Error"), CFSTR("Request finished without a result."), 0),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_formatError:task:decodedObject:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 72), "completionBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, *(_QWORD *)(a1 + 56), v8);

}

- (id)_formatError:(id)a3 task:(id)a4 decodedObject:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AMSURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v7, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("AMSURL"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AMSStatusCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "response");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "ams_statusCode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("AMSStatusCode"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AMSServerPayload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("AMSServerPayload"));
  objc_msgSend(v9, "domain");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (__CFString *)v24;
  else
    v26 = CFSTR("AMSErrorDomainWasNil");
  v27 = objc_msgSend(v9, "code");
  objc_msgSend(v9, "ams_title");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_message");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_underlyingError");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  AMSCustomCodableError(v26, v27, v28, v29, v14, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_handleURLAction:(id)a3 task:(id)a4 contiguousActionIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  AMSURLSession *v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertIsOnPrivateQueue");
  v11 = objc_msgSend(v8, "actionType");
  objc_msgSend(v8, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = 3;
  else
    v13 = v11;
  if (v13)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v29 = a5;
      v16 = objc_opt_class();
      objc_msgSend(v10, "properties");
      v28 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v16;
      a5 = v29;
      v39 = 2114;
      v40 = v18;
      v41 = 2114;
      v42 = v8;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling URL action: %{public}@", buf, 0x20u);

      self = v28;
    }

    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(v13 - 1) >= 2)
    {
      if (v13 == 3)
        objc_msgSend(v9, "cancel");
    }
    else
    {
      -[AMSURLSession _retryTask:action:](self, "_retryTask:action:", v9, v8);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "promiseAdapter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke;
  v30[3] = &unk_1E25471B8;
  v31 = v10;
  v32 = v12;
  v35 = a5;
  v36 = v13;
  v33 = v8;
  v34 = v9;
  v22 = v9;
  v23 = v8;
  v24 = v12;
  v25 = v10;
  objc_msgSend(v21, "continueWithBlock:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

AMSMutablePromise *__66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  AMSMutablePromise *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AMSMutablePromise *v10;
  id v11;
  AMSMutablePromise *v12;
  AMSMutablePromise *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AMSMutablePromise *v21;
  uint64_t v22;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  v6 = *(_QWORD *)(a1 + 64);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke_2;
  v15[3] = &unk_1E2546E98;
  v16 = v4;
  v7 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 72);
  v18 = v8;
  v22 = v9;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 32);
  v10 = v5;
  v21 = v10;
  v11 = v4;
  objc_msgSend(v7, "continueContiguousAsyncActionWithIdentifier:block:", v6, v15);
  v12 = v21;
  v13 = v10;

  return v13;
}

void __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  AMSPair *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v7 = v2;
    v3 = *(id *)(a1 + 48);
  }
  else
  {
    v7 = *(id *)(a1 + 40);
    v3 = *(id *)(a1 + 48);
    if (!v7)
    {
      v7 = 0;
      goto LABEL_7;
    }
  }
  if (*(_QWORD *)(a1 + 80) != 3)
  {
    objc_msgSend(*(id *)(a1 + 56), "cancel");
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v7);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 64), "setReceivedAction:", v3);
  v5 = *(void **)(a1 + 72);
  v6 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v3, v7);
  objc_msgSend(v5, "finishWithResult:", v6);

}

- (BOOL)_protocolHandler:(id)a3 canUseAlternateImplementationOfSelector:(SEL)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;

  v5 = a3;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = objc_opt_class();
      v7 = +[AMSMethodImplementationCache implementationsOf:areEqualIn:and:](AMSMethodImplementationCache, "implementationsOf:areEqualIn:and:", a4, v6, objc_opt_class());
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_retryTask:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AMSURLRequest *v10;
  void *v11;
  void *v12;
  AMSURLRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  AMSURLSession *v27;
  AMSURLRequest *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  AMSURLSession *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v56;
  id v57;
  int v58;
  _QWORD v59[5];
  id v60;
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  const __CFString *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertIsOnPrivateQueue");
  objc_msgSend(v6, "cancel");
  v10 = [AMSURLRequest alloc];
  objc_msgSend(v6, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = -[AMSURLRequest initWithRequest:](v10, "initWithRequest:", v12);

  -[AMSURLRequest setProperties:](v13, "setProperties:", v9);
  objc_msgSend(v7, "updatedHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableURLRequest ams_addHeaders:](v13, "ams_addHeaders:", v14);

  objc_msgSend(v7, "updatedBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "updatedBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequest setHTTPBody:](v13, "setHTTPBody:", v16);

  }
  objc_msgSend(v7, "updatedMethod");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "updatedMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequest setHTTPMethod:](v13, "setHTTPMethod:", v18);

  }
  if (objc_msgSend(v7, "actionType") == 1
    && (objc_msgSend(v7, "redirectURL"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    objc_msgSend(v7, "redirectURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequest setURL:](v13, "setURL:", v20);

    v21 = CFSTR("Redirecting");
    v58 = 1;
  }
  else
  {
    v58 = 0;
    v21 = CFSTR("Retrying");
  }
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v21;
    v25 = objc_opt_class();
    objc_msgSend(v9, "logUUID");
    v56 = v7;
    v26 = v8;
    v27 = self;
    v28 = v13;
    v29 = v6;
    v30 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v63 = v25;
    v64 = 2114;
    v65 = v31;
    v66 = 2114;
    v67 = v24;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ the request...", buf, 0x20u);

    v9 = v30;
    v6 = v29;
    v13 = v28;
    self = v27;
    v8 = v26;
    v7 = v56;
  }

  objc_msgSend(v7, "retryIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32
    && (objc_msgSend(v8, "retryIdentifiers"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "retryIdentifier"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v33, "containsObject:", v34),
        v34,
        v33,
        (v35 & 1) == 0))
  {
    objc_msgSend(v7, "retryIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRetryIdentifier:", v36);

  }
  else
  {
    objc_msgSend(v8, "setRetryCount:", objc_msgSend(v8, "retryCount") + 1);
    if (v58 && objc_msgSend(v8, "retryCount") >= 1)
      objc_msgSend(v8, "setRetryCount:", 0);
  }
  v37 = objc_msgSend(v8, "retryCount");
  if (v37 <= objc_msgSend(v9, "maxRetryCount"))
  {
    -[AMSURLSession protocolHandler](self, "protocolHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v6;
        v48 = v9;
        v49 = objc_opt_class();
        AMSLogKey();
        v57 = v7;
        v50 = v8;
        v51 = self;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v49;
        v9 = v48;
        v6 = v47;
        v64 = 2114;
        v65 = v52;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Protocol handler reconfigure request", buf, 0x16u);

        self = v51;
        v8 = v50;
        v7 = v57;
      }

      -[AMSURLSession _reconfigureNewRequest:originalTask:protocolHandler:redirect:](self, "_reconfigureNewRequest:originalTask:protocolHandler:redirect:", v13, v6, v42, 0);
      v53 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v13);
      v53 = objc_claimAutoreleasedReturnValue();
    }
    v43 = (void *)v53;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __35__AMSURLSession__retryTask_action___block_invoke;
    v59[3] = &unk_1E2540FD0;
    v59[4] = self;
    v60 = v8;
    v61 = v6;
    objc_msgSend(v43, "thenWithBlock:", v59);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "binaryPromiseAdapter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      objc_msgSend(v9, "logUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v40;
      v64 = 2114;
      v65 = v41;
      _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Exceeded max retry count", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Task reached max retry count (%ld / %ld);"),
      objc_msgSend(v8, "retryCount") - 1,
      objc_msgSend(v9, "maxRetryCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(306, CFSTR("Reached max retry count"), v42, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v44;
}

AMSMutablePromise *__35__AMSURLSession__retryTask_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  void *v9;
  AMSMutablePromise *v10;
  _QWORD v12[4];
  AMSMutablePromise *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  AMSMutablePromise *v18;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__AMSURLSession__retryTask_action___block_invoke_2;
  v15[3] = &unk_1E25471E0;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = v4;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __35__AMSURLSession__retryTask_action___block_invoke_3;
  v12[3] = &unk_1E253DB58;
  v8 = v18;
  v13 = v8;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v5, "createDataTaskWithRequest:signpostID:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:", v3, v6, 0, v15, v12);

  v9 = v14;
  v10 = v8;

  return v10;
}

void __35__AMSURLSession__retryTask_action___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migrateFromTaskInfo:", *(_QWORD *)(a1 + 32));
  +[AMSURLTaskInfo removeTaskInfoForTask:](AMSURLTaskInfo, "removeTaskInfoForTask:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "resume");

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

void __35__AMSURLSession__retryTask_action___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    AMSError(300, CFSTR("Retry Failed"), CFSTR("Encountered a <nil> task while redirecting the request"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "completionBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v5);

}

- (id)_prepareRequest:(id)a3 logUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    AMSLogableURLRequest((uint64_t)v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = (uint64_t)v11;
    v33 = 2114;
    v34 = v7;
    v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preparing request: %{public}@", buf, 0x20u);

  }
  if (-[AMSURLSession invalidated](self, "invalidated"))
  {
    AMSError(6, CFSTR("Task Failed"), CFSTR("Session has been invalidated"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_7;
LABEL_11:
    v17 = CFSTR("Request is nil");
    goto LABEL_13;
  }
  v14 = 0;
  if (!v8)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(v8, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v17 = CFSTR("Request URL is nil");
LABEL_13:
    AMSError(2, CFSTR("Task Failed"), v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
    if (v18)
      goto LABEL_9;
    goto LABEL_14;
  }
  if (v14)
  {
LABEL_9:
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_14:
  -[AMSURLSession requestEncoder](self, "requestEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogableURLRequest((uint64_t)v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request encoder will encode request %{public}@", buf, 0x20u);

    }
    -[AMSURLSession requestEncoder](self, "requestEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestByEncodingRequest:parameters:", v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __41__AMSURLSession__prepareRequest_logUUID___block_invoke;
    v29[3] = &unk_1E253D950;
    v29[4] = self;
    v30 = v7;
    objc_msgSend(v16, "addErrorBlock:", v29);

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (os_variant_has_internal_content())
  {
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __41__AMSURLSession__prepareRequest_logUUID___block_invoke_234;
    v27[3] = &unk_1E2546E70;
    v27[4] = self;
    v28 = v7;
    objc_msgSend(v16, "addSuccessBlock:", v27);

  }
LABEL_23:

  return v16;
}

void __41__AMSURLSession__prepareRequest_logUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request encoding failed with error: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

void __41__AMSURLSession__prepareRequest_logUUID___block_invoke_234(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v3, "allHTTPHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request headers: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (id)_reconfigureNewRequest:(id)a3 originalTask:(id)a4 protocolHandler:(id)a5 redirect:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  AMSMutablePromise *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v6 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertIsOnPrivateQueue");
  v14 = objc_alloc_init(AMSMutablePromise);
  if (-[AMSURLSession _protocolHandler:canUseAlternateImplementationOfSelector:](self, "_protocolHandler:canUseAlternateImplementationOfSelector:", v10, sel_reconfigureNewRequest_originalTask_redirect_error_))
  {
    -[AMSPromise completionHandlerAdapter](v14, "completionHandlerAdapter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reconfigureNewRequest:originalTask:redirect:completionHandler:", v12, v11, v6, v15);

  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v6;
      AMSLogKey();
      v18 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_opt_class();
      v20 = v19;
      v29 = (void *)v18;
      if (v18)
      {
        AMSLogKey();
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v26);
      }
      else
      {
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v19);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_reconfigureNewRequest_originalTask_redirect_error_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_reconfigureNewRequest_originalTask_redirect_completionHandler_);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v21;
      v33 = 2114;
      v34 = v22;
      v35 = 2114;
      v36 = v23;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@ is deprecated. %{public}@ should be used instead.", buf, 0x20u);
      if (v29)
      {

        v21 = (void *)v26;
      }

      v6 = v28;
    }

    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    v30 = 0;
    objc_msgSend(v10, "reconfigureNewRequest:originalTask:redirect:error:", v15, v11, v6, &v30);

    v24 = v30;
    -[AMSMutablePromise finishWithResult:error:](v14, "finishWithResult:error:", v15, v24);

  }
  return v14;
}

- (NSURLSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setDelegateProxy:(id)a3
{
  objc_storeStrong((id *)&self->_delegateProxy, a3);
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)useFallbackBag
{
  return self->_useFallbackBag;
}

- (void)setUseFallbackBag:(BOOL)a3
{
  self->_useFallbackBag = a3;
}

- (AMSURLSecurityPolicy)securityPolicy
{
  return self->_securityPolicy;
}

- (void)setSecurityPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_securityPolicy, a3);
}

@end
