@implementation CAMVideoPersistenceCoordinator

- (CAMVideoPersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4
{
  id v6;
  id v7;
  CAMVideoPersistenceCoordinator *v8;
  CAMVideoPersistenceCoordinator *v9;
  uint64_t v10;
  NSString *loggingIdentifier;
  uint64_t v12;
  NSString *loggingPrefix;
  uint64_t v14;
  NSMutableDictionary *receivedCoordinationInfos;
  uint64_t v16;
  NSMutableDictionary *pendingLocalPersistenceResults;
  CAMVideoPersistenceCoordinator *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMVideoPersistenceCoordinator;
  v8 = -[CAMVideoPersistenceCoordinator init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    loggingIdentifier = v9->_loggingIdentifier;
    v9->_loggingIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ VideoPersistenceCoordinator:"), v7);
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

- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  os_log_t v34;
  void *v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  -[CAMVideoPersistenceCoordinator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoPersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoPersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "resultSpecifiers");
  objc_msgSend(v8, "allExpectedResultSpecifiers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CAMStillImagePersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:].cold.1(self, v13, v17);

  }
  if (!v9 || (objc_msgSend(v9, "error"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    v19 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    -[CAMVideoPersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) == 0)
      {
LABEL_17:
        if (!-[__CFString length](v20, "length"))
        {

          v20 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        v48 = 2114;
        v49 = v20;
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ video (unusable result)", buf, 0x16u);

        v14 = 0x1E0CB3000;
        goto LABEL_25;
      }
    }
    else
    {
      v20 = &stru_1EA3325A0;
      if ((v13 & 1) == 0)
        goto LABEL_17;
    }
    -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", CFSTR("HDR"));
    v22 = v10;
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (__CFString *)v23;
    v10 = v22;
    goto LABEL_17;
  }
  v19 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    goto LABEL_25;
  -[CAMVideoPersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 2) == 0)
  {
    v21 = &stru_1EA3325A0;
    if ((v13 & 1) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) != 0)
  {
LABEL_21:
    -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", CFSTR("HDR"));
    v41 = v16;
    v24 = v12;
    v25 = v10;
    v26 = objc_claimAutoreleasedReturnValue();

    v21 = (__CFString *)v26;
    v10 = v25;
    v12 = v24;
    v16 = v41;
  }
LABEL_22:
  if (!-[__CFString length](v21, "length"))
  {

    v21 = CFSTR("None");
  }
  *(_DWORD *)buf = 138543618;
  v47 = v39;
  v48 = 2114;
  v49 = v21;
  _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ video", buf, 0x16u);

  v14 = 0x1E0CB3000uLL;
LABEL_25:

  objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedInteger:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v8, v27);

  if (v9)
  {
    objc_msgSend(v9, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedInteger:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v29);

    }
  }
  -[CAMVideoPersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](self, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v13, v45);
  objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedInteger:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v42 = v16;
    v32 = v12;
    -[CAMVideoPersistenceCoordinator _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:](self, "_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:", v43, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
LABEL_38:

      objc_msgSend(v10, "videoPersistenceCoordinator:requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:request:", self, v8, v45);
      v12 = v32;
      v16 = v42;
      goto LABEL_39;
    }
    v40 = v10;
    -[CAMVideoPersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) == 0)
      {
LABEL_35:
        if (!-[__CFString length](v36, "length"))
        {

          v36 = CFSTR("None");
        }
        *(_DWORD *)buf = 138543874;
        v47 = v35;
        v48 = 2114;
        v49 = v36;
        v50 = 2114;
        v51 = v33;
        _os_log_impl(&dword_1DB760000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferring persistence of %{public}@ video while waiting on %{public}@", buf, 0x20u);

        v10 = v40;
        goto LABEL_38;
      }
    }
    else
    {
      v36 = &stru_1EA3325A0;
      if ((v13 & 1) == 0)
        goto LABEL_35;
    }
    -[__CFString stringByAppendingString:](v36, "stringByAppendingString:", CFSTR("HDR"));
    v37 = objc_claimAutoreleasedReturnValue();

    v36 = (__CFString *)v37;
    goto LABEL_35;
  }
LABEL_39:

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
  -[CAMVideoPersistenceCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoPersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
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

      objc_msgSend(v7, "videoPersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:captureRequest:powerAssertionReason:", self, v10, v6, -[CAMVideoPersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a3));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v15);

      goto LABEL_12;
    }
    -[CAMVideoPersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
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
  -[CAMVideoPersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoPersistenceCoordinator _pendingLocalPersistenceResults](self, "_pendingLocalPersistenceResults");
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
    -[CAMVideoPersistenceCoordinator _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:](self, "_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:receivedCoordinationInfos:", v10, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CAMVideoPersistenceCoordinator _loggingPrefix](self, "_loggingPrefix");
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
      _os_log_error_impl(&dword_1DB760000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Timed out while waiting for other capture results (%{public}@). Submitting %{public}@ video as a standalone video", buf, 0x20u);

    }
    -[CAMVideoPersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](self, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v11, v6);

  }
}

- (BOOL)hasReceivedAllExpectedResponses
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CAMVideoPersistenceCoordinator _receivedCoordinationInfos](self, "_receivedCoordinationInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allExpectedResultSpecifiers");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3
{
  if ((a3 & 1) != 0)
    return 0x40000;
  else
    return 0x20000;
}

- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = objc_msgSend(v12, "integerValue");
          v15 = &stru_1EA3325A0;
          if ((v14 & 2) != 0)
          {
            objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if ((v14 & 1) != 0)
          {
            -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("HDR"));
            v16 = objc_claimAutoreleasedReturnValue();

            v15 = (__CFString *)v16;
          }
          if (-[__CFString length](v15, "length"))
          {
            if (v9)
              goto LABEL_13;
LABEL_15:
            v9 = v15;
          }
          else
          {

            v15 = CFSTR("None");
            if (!v9)
              goto LABEL_15;
LABEL_13:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v9, v15);
            v17 = objc_claimAutoreleasedReturnValue();

            v9 = (__CFString *)v17;
          }

          continue;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v8)
        goto LABEL_21;
    }
  }
  v9 = 0;
LABEL_21:

  return v9;
}

- (CAMVideoPersistenceCoordinationDelegate)delegate
{
  return (CAMVideoPersistenceCoordinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSMutableDictionary)_receivedCoordinationInfos
{
  return self->__receivedCoordinationInfos;
}

- (NSMutableDictionary)_pendingLocalPersistenceResults
{
  return self->__pendingLocalPersistenceResults;
}

- (NSString)_loggingPrefix
{
  return self->__loggingPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingPrefix, 0);
  objc_storeStrong((id *)&self->__pendingLocalPersistenceResults, 0);
  objc_storeStrong((id *)&self->__receivedCoordinationInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
