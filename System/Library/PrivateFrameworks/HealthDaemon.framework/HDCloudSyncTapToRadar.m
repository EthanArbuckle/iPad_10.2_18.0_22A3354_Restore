@implementation HDCloudSyncTapToRadar

+ (BOOL)isTapToRadarAllowed
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0CB6F18], "isTestingDevice") ^ 1;
  return v2;
}

+ (void)showTapToRadarRequestWithTitle:(id)a3 message:(id)a4 proceed:(id)a5 disable:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(a1, "isTapToRadarAllowed") & 1) != 0)
  {
    if (showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting == 1)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_2;
      v26 = &unk_1E6CE7DE0;
      v27 = v16;
      HKDispatchAsyncOnGlobalConcurrentQueue();
      v17 = v27;
    }
    else
    {
      showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting = 1;
      v17 = objc_alloc_init(MEMORY[0x1E0D298D0]);
      objc_msgSend(v17, "setTitle:", v12);
      objc_msgSend(v17, "setMessage:", v13);
      objc_msgSend(v17, "setDefaultButton:", CFSTR("Tap-to-Radar"));
      objc_msgSend(v17, "setCancelButton:", CFSTR("Not Now"));
      objc_msgSend(v17, "setOtherButton:", CFSTR("Do not ask again"));
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_3;
      v18[3] = &unk_1E6D04150;
      v22 = a1;
      v19 = v14;
      v20 = v15;
      v21 = v16;
      objc_msgSend(v17, "presentWithResponseHandler:", v18);

    }
  }
  else
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke;
    v31 = &unk_1E6CE7DE0;
    v32 = v16;
    HKDispatchAsyncOnGlobalConcurrentQueue();
    v17 = v32;
  }

}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 110, CFSTR("Tap to radar is not available on this device."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Tap to radar is already presented."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __91__HDCloudSyncTapToRadar_showTapToRadarRequestWithTitle_message_proceed_disable_completion___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  showTapToRadarRequestWithTitle_message_proceed_disable_completion__isPresenting = 0;
  switch(a3)
  {
    case 2:
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v13 = a1[7];
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Do not ask again' button pressed", (uint8_t *)&v16, 0xCu);
      }
      v11 = a1[5];
      goto LABEL_10;
    case 1:
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v15 = a1[7];
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Not Now' button pressed", (uint8_t *)&v16, 0xCu);
      }
      break;
    case 0:
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[7];
        v16 = 138543362;
        v17 = v10;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: cloud sync alert, 'Tap-to-Radar' button pressed", (uint8_t *)&v16, 0xCu);
      }
      v11 = a1[4];
LABEL_10:
      (*(void (**)(void))(v11 + 16))();
      break;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

+ (void)openTapToRadarWithTitle:(id)a3 description:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "isTapToRadarAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", v9, v6, 6, 6, 0, 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:configuration:completionHandler:", v7, 0, &__block_literal_global_195);

  }
}

void __61__HDCloudSyncTapToRadar_openTapToRadarWithTitle_description___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

@end
