@implementation ANValidationHelper

+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ANValidationHelper_performBasicValidationForAnnouncement_type___block_invoke;
  v10[3] = &unk_1E9390968;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  objc_msgSend(a1, "_runValidationCheck:isRetry:", v10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__ANValidationHelper_performBasicValidationForAnnouncement_type___block_invoke(uint64_t a1)
{
  return +[ANMessenger performBasicValidationForAnnouncement:type:](ANMessenger, "performBasicValidationForAnnouncement:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__ANValidationHelper_performPreflightChecksForSendingContent_toHome_rooms_zones___block_invoke;
  v20[3] = &unk_1E9390990;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(a1, "_runValidationCheck:isRetry:", v20, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __81__ANValidationHelper_performPreflightChecksForSendingContent_toHome_rooms_zones___block_invoke(_QWORD *a1)
{
  return +[ANMessenger performPreflightChecksForSendingContent:toHome:rooms:zones:](ANMessenger, "performPreflightChecksForSendingContent:toHome:rooms:zones:", a1[4], a1[5], a1[6], a1[7]);
}

+ (id)_runValidationCheck:(id)a3 isRetry:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  ANLogHandleValidationHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = &stru_1E93913D0;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Starting validation check (is retry = %d)", (uint8_t *)&v19, 0x12u);
  }

  v6[2](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isHomeError"))
      v10 = !v4;
    else
      v10 = 0;
    if (v10)
    {
      ANLogHandleValidationHelper();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Validation check failed with Home error - requesting HomeManager refresh", (uint8_t *)&v19, 0xCu);
      }

      +[ANHomeManager shared](ANHomeManager, "shared");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshHomeSynchronous");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        ANLogHandleValidationHelper();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = &stru_1E93913D0;
          _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@Validation check failed - HomeManager refresh error", (uint8_t *)&v19, 0xCu);
        }

        v17 = v15;
      }
      else
      {
        objc_msgSend(a1, "_runValidationCheck:isRetry:", v6, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v17;

    }
    else
    {
      v11 = v9;
    }
  }
  else
  {
    ANLogHandleValidationHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%@Validation check success", (uint8_t *)&v19, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

@end
