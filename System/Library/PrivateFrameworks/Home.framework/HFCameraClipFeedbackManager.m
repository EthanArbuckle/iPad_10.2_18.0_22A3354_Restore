@implementation HFCameraClipFeedbackManager

+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CB3898];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processName");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "donateCameraClip:forCameraProfile:processName:completion:", v11, v10, v13, v9);
}

+ (void)donateNotificationCenterCameraClip:(id)a3 forCameraProfile:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "donateCameraClip:forCameraProfile:processName:completion:", a3, a4, CFSTR("HomeNotification"), a5);
}

+ (void)donateCameraClip:(id)a3 forCameraProfile:(id)a4 processName:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke;
  v20[3] = &unk_1EA72C268;
  v21 = v9;
  v22 = v14;
  v23 = v10;
  v24 = v11;
  v16 = v11;
  v17 = v10;
  v18 = v14;
  v19 = v9;
  dispatch_async(v15, v20);

}

void __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "clipManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_2;
  v4[3] = &unk_1EA72C240;
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "donateClipsWithUUIDs:completion:", v5, v4);

}

void __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = +[HFCameraAnalyticsEventHandler sendDonationEventWithCameraClipCount:processName:error:](HFCameraAnalyticsEventHandler, "sendDonationEventWithCameraClipCount:processName:error:", objc_msgSend(*(id *)(a1 + 32), "count"), *(_QWORD *)(a1 + 40), v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_3;
  v7[3] = &unk_1EA728120;
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __88__HFCameraClipFeedbackManager_donateCameraClip_forCameraProfile_processName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)donateAllCameraClipsForCameraProfile:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(-32768, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke;
  v10[3] = &unk_1EA727308;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithStartDate:endDate:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2;
  v7[3] = &unk_1EA72C2E0;
  v9 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "fetchClipsWithDateInterval:quality:limit:shouldOrderAscending:completion:", v5, 0, 500, 1, v7);

}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x14uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Unable to donate all clips because there was a problem fetching all clips:%@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_7;
    block[3] = &unk_1EA728120;
    v23 = *(id *)(a1 + 40);
    v22 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v8 = v23;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_9;
    v19[3] = &unk_1EA72C290;
    v11 = v9;
    v20 = v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    HFLogForCategory(0x14uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v11, "count");
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Donating all clips:%lu for profile:%@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "clipManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_11;
    v16[3] = &unk_1EA72C2B8;
    v17 = v11;
    v18 = *(id *)(a1 + 40);
    v8 = v11;
    objc_msgSend(v15, "donateClipsWithUUIDs:completion:", v8, v16);

  }
}

uint64_t __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isDonated") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = +[HFCameraAnalyticsEventHandler sendDonationEventWithCameraClipCount:processName:error:](HFCameraAnalyticsEventHandler, "sendDonationEventWithCameraClipCount:processName:error:", objc_msgSend(*(id *)(a1 + 32), "count"), v5, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_12;
  v9[3] = &unk_1EA728120;
  v7 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __79__HFCameraClipFeedbackManager_donateAllCameraClipsForCameraProfile_completion___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
