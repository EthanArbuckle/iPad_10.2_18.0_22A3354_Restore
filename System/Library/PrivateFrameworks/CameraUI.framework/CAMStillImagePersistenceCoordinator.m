@implementation CAMStillImagePersistenceCoordinator

- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  CAMStillImagePersistenceCoordinator *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  __CFString *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  const __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  __CFString *v64;
  os_log_t v65;
  void *v66;
  __CFString *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  __CFString *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  __CFString *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  CAMStillImagePersistenceCoordinator *v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  __CFString *v101;
  __int16 v102;
  __CFString *v103;
  __int16 v104;
  __CFString *v105;
  __int16 v106;
  __CFString *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v96 = a5;
  -[CAMStillImagePersistenceCoordinator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImagePersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = self;
  -[CAMStillImagePersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "resultSpecifiers");
  objc_msgSend(v8, "allExpectedResultSpecifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CAMStillImagePersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:].cold.1(self, v12, v16);

  }
  v94 = v9;
  if (!v9 || (objc_msgSend(v9, "error"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) == 0)
      {
LABEL_17:
        if (!-[__CFString length](v19, "length"))
        {

          v19 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543618;
        v99 = v87;
        v100 = 2114;
        v101 = v19;
        _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ image (unusable result)", buf, 0x16u);

        goto LABEL_25;
      }
    }
    else
    {
      v19 = &stru_1EA3325A0;
      if ((v12 & 1) == 0)
        goto LABEL_17;
    }
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("HDR"));
    v90 = v8;
    v21 = v10;
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (__CFString *)v22;
    v10 = v21;
    v8 = v90;
    goto LABEL_17;
  }
  v18 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    goto LABEL_25;
  -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 2) == 0)
  {
    v20 = &stru_1EA3325A0;
    if ((v12 & 1) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) != 0)
  {
LABEL_21:
    -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", CFSTR("HDR"));
    v23 = v10;
    v24 = objc_claimAutoreleasedReturnValue();

    v20 = (__CFString *)v24;
    v10 = v23;
    v9 = v94;
  }
LABEL_22:
  if (!-[__CFString length](v20, "length"))
  {

    v20 = CFSTR("None");
  }
  *(_DWORD *)buf = 138543618;
  v99 = v89;
  v100 = 2114;
  v101 = v20;
  _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ image", buf, 0x16u);

LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v25);

  if (v9)
  {
    objc_msgSend(v9, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setObject:forKeyedSubscript:", v9, v27);

    }
  }
  v28 = objc_msgSend(v13, "containsObject:", &unk_1EA3B06B8);
  v29 = objc_msgSend(v13, "containsObject:", &unk_1EA3B06D0);
  v30 = objc_msgSend(v13, "containsObject:", &unk_1EA3B06E8);
  v93 = v10;
  if (objc_msgSend(v13, "containsObject:", &unk_1EA3B0700) && v30 && v29 && v28)
  {
    v31 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(&stru_1EA3325A0, "length");
      v34 = CFSTR("None");
      if (v33)
        v34 = &stru_1EA3325A0;
      v84 = v34;
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)v32;
      if (!-[__CFString length](v35, "length"))
      {

        v35 = CFSTR("None");
      }
      v86 = v15;
      v91 = v8;
      v36 = v35;
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("HDR"));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v38 = v13;
      if (!-[__CFString length](v37, "length"))
      {

        v37 = CFSTR("None");
      }
      v39 = v37;
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringByAppendingString:", CFSTR("HDR"));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!-[__CFString length](v41, "length"))
      {

        v41 = CFSTR("None");
      }
      v13 = v38;
      *(_DWORD *)buf = 138544386;
      v99 = v88;
      v100 = 2114;
      v101 = (__CFString *)v84;
      v102 = 2114;
      v103 = v36;
      v104 = 2114;
      v105 = v37;
      v106 = 2114;
      v107 = v41;
      _os_log_impl(&dword_1DB760000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@ and %{public}@+%{public}@ pairs", buf, 0x34u);

      v8 = v91;
      v10 = v93;
      v15 = v86;
    }

    objc_msgSend(v11, "objectForKey:", &unk_1EA3B06B8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", &unk_1EA3B06E8);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 && v43)
    {
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:](v97, "_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:", 0, 2, v96, 1);
      v44 = v97;
      v45 = 1;
      v46 = 3;
      v47 = v96;
      v48 = 1;
LABEL_59:
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:](v44, "_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:", v45, v46, v47, v48);
    }
  }
  else if ((objc_msgSend(v8, "isUnfilteredImageForFilteredPair") & 1) != 0
         || objc_msgSend(v8, "isFilteredImageForFilteredPair"))
  {
    v49 = v12 & 0xFFFFFFFFFFFFFFFDLL;
    v50 = v12 | 2;
    v51 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
      {
        objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("HDR"));
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = &stru_1EA3325A0;
      }
      if (!-[__CFString length](v52, "length"))
      {

        v52 = CFSTR("None");
      }
      v83 = v52;
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if ((v12 & 1) != 0)
      {
        -[__CFString stringByAppendingString:](v58, "stringByAppendingString:", CFSTR("HDR"));
        v60 = v13;
        v61 = objc_claimAutoreleasedReturnValue();

        v59 = (__CFString *)v61;
        v13 = v60;
      }
      if (!-[__CFString length](v59, "length"))
      {

        v59 = CFSTR("None");
      }
      *(_DWORD *)buf = 138543874;
      v99 = v85;
      v100 = 2114;
      v101 = v52;
      v102 = 2114;
      v103 = v59;
      _os_log_impl(&dword_1DB760000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@", buf, 0x20u);

      v50 = v12 | 2;
      v49 = v12 & 0xFFFFFFFFFFFFFFFDLL;
    }

    -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:](v97, "_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:processedResultSpecifiers:request:shouldPersistAsSingleAsset:", v49, v50, v96, 1);
    v10 = v93;
  }
  else
  {
    v53 = os_log_create("com.apple.camera", "Camera");
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    if ((v29 & v28) == 1)
    {
      if (v54)
      {
        v92 = v13;
        -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(&stru_1EA3325A0, "length"))
          v56 = &stru_1EA3325A0;
        else
          v56 = CFSTR("None");
        objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("HDR"));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString length](v57, "length"))
        {

          v57 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543874;
        v99 = v55;
        v100 = 2114;
        v101 = (__CFString *)v56;
        v102 = 2114;
        v103 = v57;
        _os_log_impl(&dword_1DB760000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@", buf, 0x20u);

        v13 = v92;
      }

      v47 = v96;
      v44 = v97;
      v45 = 0;
      v46 = 1;
      v48 = 0;
      goto LABEL_59;
    }
    if (v54)
    {
      -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 2) != 0)
      {
        objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
        v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v77 = &stru_1EA3325A0;
      }
      if ((v12 & 1) != 0)
      {
        -[__CFString stringByAppendingString:](v77, "stringByAppendingString:", CFSTR("HDR"));
        v78 = v12;
        v79 = v76;
        v80 = v15;
        v81 = v13;
        v82 = objc_claimAutoreleasedReturnValue();

        v77 = (__CFString *)v82;
        v13 = v81;
        v15 = v80;
        v76 = v79;
        v12 = v78;
      }
      if (!-[__CFString length](v77, "length"))
      {

        v77 = CFSTR("None");
      }
      *(_DWORD *)buf = 138543618;
      v99 = v76;
      v100 = 2114;
      v101 = v77;
      _os_log_impl(&dword_1DB760000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Not expecting any pairs, persisting %{public}@ on its own", buf, 0x16u);

    }
    -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](v97, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v12, v96);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[CAMStillImagePersistenceCoordinator _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:](v97, "_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:", v13, v11);
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v65 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
LABEL_79:

      objc_msgSend(v10, "stillImagePersistenceCoordinator:requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:request:", v97, v8, v96);
      goto LABEL_80;
    }
    -[CAMStillImagePersistenceCoordinator _loggingPrefix](v97, "_loggingPrefix");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
        goto LABEL_73;
    }
    else
    {
      v67 = &stru_1EA3325A0;
      if ((v12 & 1) != 0)
      {
LABEL_73:
        -[__CFString stringByAppendingString:](v67, "stringByAppendingString:", CFSTR("HDR"));
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v11;
        v70 = v66;
        v71 = v15;
        v72 = v69;
        v73 = v13;
        v74 = (__CFString *)v68;

        v67 = v74;
        v13 = v73;
        v75 = v72;
        v15 = v71;
        v66 = v70;
LABEL_76:
        if (!-[__CFString length](v67, "length"))
        {

          v67 = CFSTR("None");
        }
        v11 = v75;
        *(_DWORD *)buf = 138543874;
        v99 = v66;
        v100 = 2114;
        v101 = v67;
        v102 = 2114;
        v103 = v64;
        _os_log_impl(&dword_1DB760000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferring persistence of %{public}@ image while waiting on %{public}@", buf, 0x20u);

        v10 = v93;
        goto LABEL_79;
      }
    }
    v75 = v11;
    goto LABEL_76;
  }
LABEL_80:

}

- (CAMStillImagePersistenceCoordinatorDelegate)delegate
{
  return (CAMStillImagePersistenceCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)_receivedCoordinationInfos
{
  return self->__receivedCoordinationInfos;
}

- (NSMutableDictionary)_pendingLocalPersistenceResults
{
  return self->__pendingLocalPersistenceResults;
}

- (void)_dispatchRemotePersistenceIfPossibleForResultSpecifiers:(unint64_t)a3 request:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CAMStillImagePersistenceCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImagePersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "localPersistenceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      objc_msgSend(v7, "stillImagePersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:", self, v10, 0, v6, -[CAMStillImagePersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a3));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v15);

      goto LABEL_12;
    }
    -[CAMStillImagePersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((a3 & 1) == 0)
      {
LABEL_8:
        if (!-[__CFString length](v13, "length", v6))
        {

          v13 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543874;
        v19 = v17;
        v20 = 2114;
        v21 = v13;
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Dispatching remote persistence for %{public}@ as %{public}@", buf, 0x20u);

        v6 = v16;
        goto LABEL_11;
      }
    }
    else
    {
      v13 = &stru_1EA3325A0;
      if ((a3 & 1) == 0)
        goto LABEL_8;
    }
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("HDR"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
    goto LABEL_8;
  }
LABEL_12:

}

- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3
{
  unsigned int v3;

  if ((a3 & 1) != 0)
    v3 = 1024;
  else
    v3 = 512;
  if ((a3 & 2) != 0)
    v3 = 2048;
  if ((~(_BYTE)a3 & 3) != 0)
    return v3;
  else
    return 4096;
}

- (BOOL)hasReceivedAllExpectedResponses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[CAMStillImagePersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allExpectedResultSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__CAMStillImagePersistenceCoordinator_hasReceivedAllExpectedResponses__block_invoke;
    v8[3] = &unk_1EA32B178;
    v9 = v2;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __70__CAMStillImagePersistenceCoordinator_hasReceivedAllExpectedResponses__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingPrefix, 0);
  objc_storeStrong((id *)&self->__pendingLocalPersistenceResults, 0);
  objc_storeStrong((id *)&self->__receivedCoordinationInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CAMStillImagePersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4
{
  id v6;
  id v7;
  CAMStillImagePersistenceCoordinator *v8;
  CAMStillImagePersistenceCoordinator *v9;
  uint64_t v10;
  NSString *loggingIdentifier;
  uint64_t v12;
  NSString *loggingPrefix;
  uint64_t v14;
  NSMutableDictionary *receivedCoordinationInfos;
  uint64_t v16;
  NSMutableDictionary *pendingLocalPersistenceResults;
  CAMStillImagePersistenceCoordinator *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMStillImagePersistenceCoordinator;
  v8 = -[CAMStillImagePersistenceCoordinator init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    loggingIdentifier = v9->_loggingIdentifier;
    v9->_loggingIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ PersistenceCoordinator:"), v7);
    v12 = objc_claimAutoreleasedReturnValue();
    loggingPrefix = v9->__loggingPrefix;
    v9->__loggingPrefix = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    receivedCoordinationInfos = v9->__receivedCoordinationInfos;
    v9->__receivedCoordinationInfos = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingLocalPersistenceResults = v9->__pendingLocalPersistenceResults;
    v9->__pendingLocalPersistenceResults = (NSMutableDictionary *)v16;

    v18 = v9;
  }

  return v9;
}

- (void)_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:(unint64_t)a3 processedResultSpecifiers:(unint64_t)a4 request:(id)a5 shouldPersistAsSingleAsset:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  CAMStillImagePersistenceCoordinator *v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v6 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v44 = a5;
  -[CAMStillImagePersistenceCoordinator delegate](self, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImagePersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImagePersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = v44;
    if (v13 && v14)
    {
      objc_msgSend(v46, "objectForKeyedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", v12);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v43 = v16;
      if (v16 && v17)
      {
        objc_msgSend(v16, "localPersistenceUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[CAMStillImagePersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((a3 & 2) != 0)
          {
            objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = &stru_1EA3325A0;
          }
          v37 = v18;
          if ((a3 & 1) != 0)
          {
            -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", CFSTR("HDR"));
            v26 = objc_claimAutoreleasedReturnValue();

            v21 = (__CFString *)v26;
          }
          if (!-[__CFString length](v21, "length"))
          {

            v21 = CFSTR("None");
          }
          v35 = v21;
          if ((a4 & 2) != 0)
          {
            objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = &stru_1EA3325A0;
          }
          v15 = v44;
          if ((a4 & 1) != 0)
          {
            -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", CFSTR("HDR"));
            v28 = objc_claimAutoreleasedReturnValue();

            v27 = (__CFString *)v28;
          }
          v18 = v37;
          if (!-[__CFString length](v27, "length", v35))
          {

            v27 = CFSTR("None");
          }
          *(_DWORD *)buf = 138544130;
          v48 = v40;
          v49 = 2114;
          v50 = v36;
          v51 = 2114;
          v52 = v27;
          v53 = 2114;
          v54 = (uint64_t)v19;
          _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Dispatching remote persistence for %{public}@+%{public}@ as %{public}@", buf, 0x2Au);

        }
        objc_msgSend(v45, "stillImagePersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:", self, v43, v18, v15, -[CAMStillImagePersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a4));
        objc_msgSend(v46, "setObject:forKeyedSubscript:", 0, v11);
        objc_msgSend(v46, "setObject:forKeyedSubscript:", 0, v12);

        goto LABEL_34;
      }
      if (v16)
      {
        v22 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[CAMStillImagePersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a4);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v48 = v38;
          v49 = 2114;
          v50 = v34;
          v51 = 2114;
          v52 = v41;
          v53 = 2114;
          v54 = (uint64_t)v29;
          v55 = 2114;
          v56 = (uint64_t)v30;
          _os_log_error_impl(&dword_1DB760000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Missing %{public}@ image for %{public}@+%{public}@ pair. Submitting %{public}@ image as a standalone image", buf, 0x34u);

          v15 = v44;
        }

        v23 = self;
        v24 = a3;
      }
      else
      {
        if (!v17)
        {
LABEL_34:

          goto LABEL_35;
        }
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          -[CAMStillImagePersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a4);
          v31 = objc_claimAutoreleasedReturnValue();
          CAMDebugStringForCaptureResultSpecifiers(a4);
          *(_DWORD *)buf = 138544386;
          v48 = v34;
          v49 = 2114;
          v50 = v42;
          v51 = 2114;
          v52 = v39;
          v53 = 2114;
          v54 = v31;
          v32 = (void *)v31;
          v55 = 2114;
          v56 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v56;
          _os_log_error_impl(&dword_1DB760000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Missing %{public}@ image for %{public}@+%{public}@ pair. Submitting %{public}@ image as a standalone image", buf, 0x34u);

          v15 = v44;
        }

        v23 = self;
        v24 = a4;
      }
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](v23, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v24, v15, v34);
      goto LABEL_34;
    }
  }
  else
  {
    v15 = v44;
    if (v13)
    {
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](self, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", a3, v44);
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](self, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", a4, v44);
    }
  }
LABEL_35:

}

- (void)updateForTimeoutTimerFiredForCoordinationInfo:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CAMStillImagePersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImagePersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allExpectedResultSpecifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "resultSpecifiers");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CAMStillImagePersistenceCoordinator _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:](self, "_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:", v10, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CAMStillImagePersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v11 & 2) != 0)
      {
        objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = &stru_1EA3325A0;
      }
      if ((v11 & 1) != 0)
      {
        -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("HDR"));
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (__CFString *)v17;
      }
      if (!-[__CFString length](v16, "length", v17))
      {

        v16 = CFSTR("None");
      }
      *(_DWORD *)buf = 138543874;
      v20 = v18;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_error_impl(&dword_1DB760000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Timed out while waiting for other capture results (%{public}@). Submitting %{public}@ image as a standalone image", buf, 0x20u);

    }
    -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](self, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v11, v6);

  }
}

- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __135__CAMStillImagePersistenceCoordinator__debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers_receivedCoordinationInfos___block_invoke;
  v10[3] = &unk_1EA32B178;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __135__CAMStillImagePersistenceCoordinator__debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers_receivedCoordinationInfos___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v14;
  if (v3)
    goto LABEL_13;
  v5 = objc_msgSend(v14, "integerValue");
  v6 = v5;
  if ((v5 & 2) == 0)
  {
    v7 = &stru_1EA3325A0;
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
LABEL_6:
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("HDR"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v8;
  }
LABEL_7:
  if (!-[__CFString length](v7, "length"))
  {

    v7 = CFSTR("None");
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v9 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), *(_QWORD *)(v9 + 40), v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    v13 = v7;
    v12 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v13;
  }

  v4 = v14;
LABEL_13:

}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSString)_loggingPrefix
{
  return self->__loggingPrefix;
}

- (void)updateForCoordinationInfo:(void *)a1 localPersistenceResult:(char)a2 request:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v5;
  __CFString *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_loggingPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = &stru_1EA3325A0;
  if ((a2 & 1) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("HDR"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v7;
  }
LABEL_6:
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("None");
  }
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Already received results for %{public}@! Updating anyway...", (uint8_t *)&v8, 0x16u);

}

@end
