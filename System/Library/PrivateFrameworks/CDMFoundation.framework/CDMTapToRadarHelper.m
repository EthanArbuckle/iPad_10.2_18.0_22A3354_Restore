@implementation CDMTapToRadarHelper

+ (BOOL)createProblemWithTitle:(id)a3 description:(id)a4 displayReason:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  intptr_t v20;
  BOOL v21;
  _QWORD v23[4];
  NSObject *v24;
  _BYTE *v25;
  _BYTE buf[24];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Not on internal build. Not issuing a TTR", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v10 = +[CDMUserDefaultsUtils isTapToRadarDisabled](CDMUserDefaultsUtils, "isTapToRadarDisabled");
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s TTR disabled via User Default. Skipping", buf, 0xCu);
    }
LABEL_8:

    v13 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Creating Tap To Radar with title: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = 0;
  v14 = objc_alloc_init(getRadarDraftClass());
  objc_msgSend(v14, "setTitle:", v7);
  objc_msgSend(v14, "setProblemDescription:", v8);
  objc_msgSend(v14, "setIsUserInitiated:", 0);
  objc_msgSend(v14, "setClassification:", 7);
  objc_msgSend(v14, "setReproducibility:", 5);
  v15 = dispatch_semaphore_create(0);
  v16 = (void *)objc_msgSend(objc_alloc(getRadarComponentClass()), "initWithName:version:identifier:", CFSTR("Siri NLX Runtime"), CFSTR("All"), 1110226);
  objc_msgSend(v14, "setComponent:", v16);
  -[objc_class shared](getTapToRadarServiceClass(), "shared");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __72__CDMTapToRadarHelper_createProblemWithTitle_description_displayReason___block_invoke;
  v23[3] = &unk_24DCACB10;
  v25 = buf;
  v18 = v15;
  v24 = v18;
  objc_msgSend(v17, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v14, CFSTR("Siri"), v9, v23);

  v19 = dispatch_time(0, 5000000000);
  v20 = dispatch_semaphore_wait(v18, v19);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v21 = v20 == 0;
  else
    v21 = 0;
  v13 = v21;

  _Block_object_dispose(buf, 8);
LABEL_18:

  return v13;
}

void __72__CDMTapToRadarHelper_createProblemWithTitle_description_displayReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: TapToRadarKitHelper#createProblem error: %@", (uint8_t *)&v6, 0x16u);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
