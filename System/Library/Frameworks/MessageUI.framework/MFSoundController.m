@implementation MFSoundController

+ (id)lazyAlertWithType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(getTLAlertConfigurationClass()), "initWithType:", a3);
  objc_msgSend(v6, "setTopic:", v5);
  -[objc_class alertWithConfiguration:](getTLAlertClass(), "alertWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D1EEC0];
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__MFSoundController_lazyAlertWithType_topic___block_invoke;
    v13[3] = &unk_1E5A69D00;
    v14 = v7;
    objc_msgSend(v8, "onScheduler:lazyFutureWithBlock:", v9, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFSoundControllerErrorDomain"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __45__MFSoundController_lazyAlertWithType_topic___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MFSoundController_lazyAlertWithType_topic___block_invoke_2;
  v10[3] = &unk_1E5A69CD8;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "playWithCompletionHandler:", v10);
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "result:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__MFSoundController_lazyAlertWithType_topic___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v7, v6);

}

+ (void)_playAlertWithType:(int64_t)a3 topic:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;

  v21 = a4;
  objc_msgSend(a1, "lazyAlertWithType:topic:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke;
  v30[3] = &unk_1E5A69D28;
  v9 = v7;
  v31 = v9;
  v32 = &v33;
  v10 = objc_msgSend(v9, "beginBackgroundTaskWithExpirationHandler:", v30);
  v34[3] = v10;
  v11 = (void *)MEMORY[0x1E0D1EED0];
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_18;
  v27[3] = &unk_1E5A69D28;
  v12 = v9;
  v28 = v12;
  v29 = &v33;
  objc_msgSend(v11, "tokenWithInvocationBlock:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_2;
  v24[3] = &unk_1E5A65430;
  v15 = v6;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  v17 = (id)objc_msgSend(v14, "afterDelay:performBlock:", v24, 30.0);
  -[objc_class sharedInstance](getFMDFMIPManagerClass(), "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v18, "lostModeIsActive");

  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFSoundControllerErrorDomain"), 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MFLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[MFSoundController _playAlertWithType:topic:].cold.1((uint64_t)v19, a3, v20);

  }
  else
  {
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_19;
    v22[3] = &unk_1E5A65480;
    v23 = v16;
    objc_msgSend(v15, "onScheduler:always:", v14, v22);
    v19 = v23;
  }

  _Block_object_dispose(&v33, 8);
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_INFO, "Background task expired (play alert)", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "invoke");
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

+ (void)playSentMailSound
{
  objc_msgSend(a1, "_playAlertWithType:topic:", 6, 0);
}

+ (void)playNewMailSoundStyle:(unint64_t)a3 forAccount:(id)a4
{
  void *v6;
  void **v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = v9;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      v7 = (void **)MEMORY[0x1E0D46D90];
      goto LABEL_6;
    case 3uLL:
      v7 = (void **)MEMORY[0x1E0D46D88];
      goto LABEL_6;
    case 4uLL:
      v7 = (void **)MEMORY[0x1E0D46D80];
LABEL_6:
      v6 = *v7;
LABEL_7:
      v8 = v6;
      if (v8)
        objc_msgSend(a1, "_playAlertWithType:topic:", 5, v8);
      break;
    default:
      v8 = 0;
      break;
  }

}

+ (void)_playAlertWithType:(os_log_t)log topic:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Not playing alert of type %ld: %@", (uint8_t *)&v3, 0x16u);
}

@end
