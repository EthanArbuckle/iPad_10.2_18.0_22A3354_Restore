@implementation CAMApplication

- (void)_configureExtendedLaunchTestIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__CAMApplication_Testing___configureExtendedLaunchTestIfNeeded__block_invoke;
  v2[3] = &unk_1EA328868;
  v2[4] = self;
  -[CAMApplication _registerPreviewStartBlock:](self, "_registerPreviewStartBlock:", v2);
}

- (void)_registerPreviewStartBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3042000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C8A1D8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CAMApplication_Testing___registerPreviewStartBlock___block_invoke;
  v9[3] = &unk_1EA328B98;
  v7 = v3;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v6, 0, v5, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v13 + 5, v8);

  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&v17);

}

- (unint64_t)supportedInterfaceOrientationsForWindow:(id)a3
{
  return 30;
}

- (id)_extendLaunchTest
{
  return CFSTR("previewStarted");
}

- (void)didChangeToMode:(int64_t)a3 device:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("device");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("CAMPerformanceDidChangeToModeNotification"), self, v10);

}

void __54__CAMApplication_Testing___registerPreviewStartBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v3, "removeObserver:name:object:", WeakRetained, *MEMORY[0x1E0C8A1D8], 0);

}

void __63__CAMApplication_Testing___configureExtendedLaunchTestIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_launchTestName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedTest:extraResults:", v2, 0);

}

- (void)willCloseViewfinderForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CAMApplication currentTestPlan](self, "currentTestPlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSubtestWithName:withMetrics:", CFSTR("closingViewfinder"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CAMPerformanceWillCloseViewfinderNotification"), self, v8);

}

- (void)didCloseViewfinderForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CAMApplication currentTestPlan](self, "currentTestPlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSubtestWithName:withMetrics:", CFSTR("closingViewfinder"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CAMPerformanceDidCloseViewfinderNotification"), self, v8);

}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMApplication delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForDefaultImageSnapshotForScreen:", v4);

}

- (void)willOpenViewfinderForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CAMApplication currentTestPlan](self, "currentTestPlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSubtestWithName:withMetrics:", CFSTR("openingViewfinder"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CAMPerformanceWillOpenViewfinderNotification"), self, v8);

}

- (void)didOpenViewfinderForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CAMApplication currentTestPlan](self, "currentTestPlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSubtestWithName:", CFSTR("openingViewfinder"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CAMPerformanceDidOpenViewfinderNotification"), self, v8);

}

- (BOOL)runTakeVideoTestWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  _BOOL8 v42;
  __CFString *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  CAMViewfinderVideoCaptureTestHarness *v54;
  void *v55;
  CAMViewfinderVideoCaptureTestHarness *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  CAMViewfinderStillImageCaptureTestHarness *v64;
  void *v65;
  CAMViewfinderStillImageCaptureTestHarness *v66;
  CAMViewfinderActionIntervalometer *v67;
  void *v68;
  CAMViewfinderActionIntervalometer *v69;
  CAMViewfinderStillImageCaptureTestHarness *v70;
  CAMViewfinderActionIntervalometer *v71;
  CAMViewfinderStillImageCaptureTestHarness *v72;
  uint64_t v74;
  CAMApplication *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  _QWORD v79[4];
  CAMViewfinderStillImageCaptureTestHarness *v80;
  CAMViewfinderActionIntervalometer *v81;
  _QWORD v82[4];
  id v83;
  CAMViewfinderStillImageCaptureTestHarness *v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  const __CFString *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMApplication delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewfinderViewController");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("videoDurationInSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("captureMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  v75 = self;
  v76 = (void *)v12;
  switch(v17)
  {
    case 0uLL:
    case 9uLL:
      v21 = 0;
      v22 = 1;
      goto LABEL_92;
    case 1uLL:
      objc_msgSend(v10, "videoConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_7;
      objc_msgSend(v10, "videoConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v26, "integerValue");

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_91;
      objc_msgSend(v8, "testName");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      switch(v21)
      {
        case 0:
          v30 = CFSTR("Auto");
          break;
        case 1:
          v30 = CFSTR("1080p60");
          break;
        case 2:
          v30 = CFSTR("720p120");
          break;
        case 3:
          v30 = CFSTR("720p240");
          break;
        case 4:
          v30 = CFSTR("1080p120");
          break;
        case 5:
          v30 = CFSTR("4k30");
          break;
        case 6:
          v30 = CFSTR("720p30");
          break;
        case 7:
          v30 = CFSTR("1080p30");
          break;
        case 8:
          v30 = CFSTR("1080p240");
          break;
        case 9:
          v30 = CFSTR("4k60");
          break;
        case 10:
          v30 = CFSTR("4k24");
          break;
        case 11:
          v30 = CFSTR("1080p25");
          break;
        case 12:
          v30 = CFSTR("4k25");
          break;
        case 13:
          v30 = CFSTR("4k120");
          break;
        case 14:
          v30 = CFSTR("4k100");
          break;
        default:
          switch(v21)
          {
            case 10000:
              v30 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v30 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v30 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v30 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v30 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v30 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v30 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v86 = v28;
      v87 = 2114;
      v88 = v30;
      v39 = "%{public}@ will override Video format to %{public}@";
      break;
    case 2uLL:
      objc_msgSend(v10, "slomoConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_7;
      objc_msgSend(v10, "slomoConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v32, "integerValue");

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_91;
      objc_msgSend(v8, "testName");
      v33 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v33;
      switch(v21)
      {
        case 0:
          v34 = CFSTR("Auto");
          break;
        case 1:
          v34 = CFSTR("1080p60");
          break;
        case 2:
          v34 = CFSTR("720p120");
          break;
        case 3:
          v34 = CFSTR("720p240");
          break;
        case 4:
          v34 = CFSTR("1080p120");
          break;
        case 5:
          v34 = CFSTR("4k30");
          break;
        case 6:
          v34 = CFSTR("720p30");
          break;
        case 7:
          v34 = CFSTR("1080p30");
          break;
        case 8:
          v34 = CFSTR("1080p240");
          break;
        case 9:
          v34 = CFSTR("4k60");
          break;
        case 10:
          v34 = CFSTR("4k24");
          break;
        case 11:
          v34 = CFSTR("1080p25");
          break;
        case 12:
          v34 = CFSTR("4k25");
          break;
        case 13:
          v34 = CFSTR("4k120");
          break;
        case 14:
          v34 = CFSTR("4k100");
          break;
        default:
          switch(v21)
          {
            case 10000:
              v34 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v34 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v34 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v34 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v34 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v34 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v34 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v86 = v33;
      v87 = 2114;
      v88 = v34;
      v39 = "%{public}@ will override SloMo format to %{public}@";
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(v8, "testName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      if (v17 - 3 > 3)
        v20 = 0;
      else
        v20 = off_1EA328BB8[v17 - 3];
      objc_msgSend(v8, "testName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ is not a supported mode for %@"), v20, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMApplication failedTest:withFailure:](self, "failedTest:withFailure:", v18, v24);

      goto LABEL_7;
    case 7uLL:
      objc_msgSend(v10, "cinematicConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_7;
      objc_msgSend(v10, "cinematicConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v36, "integerValue");

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_91;
      objc_msgSend(v8, "testName");
      v37 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v37;
      switch(v21)
      {
        case 0:
          v38 = CFSTR("Auto");
          break;
        case 1:
          v38 = CFSTR("1080p60");
          break;
        case 2:
          v38 = CFSTR("720p120");
          break;
        case 3:
          v38 = CFSTR("720p240");
          break;
        case 4:
          v38 = CFSTR("1080p120");
          break;
        case 5:
          v38 = CFSTR("4k30");
          break;
        case 6:
          v38 = CFSTR("720p30");
          break;
        case 7:
          v38 = CFSTR("1080p30");
          break;
        case 8:
          v38 = CFSTR("1080p240");
          break;
        case 9:
          v38 = CFSTR("4k60");
          break;
        case 10:
          v38 = CFSTR("4k24");
          break;
        case 11:
          v38 = CFSTR("1080p25");
          break;
        case 12:
          v38 = CFSTR("4k25");
          break;
        case 13:
          v38 = CFSTR("4k120");
          break;
        case 14:
          v38 = CFSTR("4k100");
          break;
        default:
          switch(v21)
          {
            case 10000:
              v38 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v38 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v38 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v38 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v38 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v38 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v38 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v86 = v37;
      v87 = 2114;
      v88 = v38;
      v39 = "%{public}@ will override Cinematic format to %{public}@";
      break;
    case 8uLL:
      v22 = 0;
      v21 = 7;
      goto LABEL_92;
    default:
LABEL_7:
      v22 = 0;
      v21 = 0;
      goto LABEL_92;
  }
  _os_log_impl(&dword_1DB760000, v27, OS_LOG_TYPE_DEFAULT, v39, buf, 0x16u);

LABEL_91:
  v22 = 0;
LABEL_92:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("devicePosition"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "integerValue");

  v42 = v41 == 1;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 > 9)
    v43 = 0;
  else
    v43 = off_1EA328BD8[v17];
  v44 = CFSTR("BackAuto");
  if (v41 == 1)
    v44 = CFSTR("FrontAuto");
  v45 = v76;
  switch(v21)
  {
    case 0:
      v46 = CFSTR("Auto");
      break;
    case 1:
      v46 = CFSTR("1080p60");
      break;
    case 2:
      v46 = CFSTR("720p120");
      break;
    case 3:
      v46 = CFSTR("720p240");
      break;
    case 4:
      v46 = CFSTR("1080p120");
      break;
    case 5:
      v46 = CFSTR("4k30");
      break;
    case 6:
      v46 = CFSTR("720p30");
      break;
    case 7:
      v46 = CFSTR("1080p30");
      break;
    case 8:
      v46 = CFSTR("1080p240");
      break;
    case 9:
      v46 = CFSTR("4k60");
      break;
    case 10:
      v46 = CFSTR("4k24");
      break;
    case 11:
      v46 = CFSTR("1080p25");
      break;
    case 12:
      v46 = CFSTR("4k25");
      break;
    case 13:
      v46 = CFSTR("4k120");
      break;
    case 14:
      v46 = CFSTR("4k100");
      break;
    default:
      v45 = v76;
      switch(v21)
      {
        case 10000:
          v46 = CFSTR("ImagePickerHigh");
          break;
        case 10001:
          v46 = CFSTR("ImagePickerMedium");
          break;
        case 10002:
          v46 = CFSTR("ImagePickerLow");
          break;
        case 10003:
          v46 = CFSTR("ImagePickerVGA");
          break;
        case 10004:
          v46 = CFSTR("ImagePickeriFrame720p");
          break;
        case 10005:
          v46 = CFSTR("ImagePickeriFrame540p");
          break;
        default:
          v46 = 0;
          break;
      }
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mode: %@ device: %@ format: %@"), v43, v44, v46);
  v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v22)
  {
    if ((objc_msgSend(v78, "isSupportedVideoConfiguration:forMode:device:", v21, v17, v42) & 1) != 0)
      goto LABEL_128;
    objc_msgSend(v8, "testName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not supported"), v77);
    goto LABEL_127;
  }
  if ((objc_msgSend(v78, "isCTMVideoCaptureSupportedForMode:", v17) & 1) == 0
    && (objc_msgSend(v78, "isTrueVideoSupportedForMode:", v17) & 1) == 0)
  {
    objc_msgSend(v8, "testName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ctmVideo is not supported"), v77);
LABEL_127:
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplication failedTest:withFailure:](v75, "failedTest:withFailure:", v47, v48);

  }
LABEL_128:
  v49 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "testName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v86 = (uint64_t)v50;
    v87 = 2114;
    v88 = v77;
    _os_log_impl(&dword_1DB760000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ configured with %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v10, "hasOverrides"))
    objc_msgSend(v45, "readUserPreferencesAndHandleChangesWithOverrides:", v10);
  objc_msgSend(v45, "changeToMode:device:", v17, v42);
  objc_msgSend(v45, "setTorchMode:", 0);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("initialDelayInSeconds"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  v53 = v52;

  v54 = [CAMViewfinderVideoCaptureTestHarness alloc];
  objc_msgSend(v8, "testName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[CAMViewfinderVideoCaptureTestHarness initWithTestName:viewfinderViewController:videoDurationInSeconds:initialDelayInSeconds:captureCTMVideo:](v54, "initWithTestName:viewfinderViewController:videoDurationInSeconds:initialDelayInSeconds:captureCTMVideo:", v55, v45, v22, v15, v53);

  objc_msgSend(v45, "setVideoCaptureTestDelegate:", v56);
  objc_msgSend(v8, "queueHarness:", v56);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("captureStillsDuringVideo"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = objc_msgSend(v57, "BOOLValue");

  if ((_DWORD)v55)
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("pictureCount"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("delayBetweenCaptures"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    v62 = v61;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("initialDelayInSeconds"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "doubleValue");

    v64 = [CAMViewfinderStillImageCaptureTestHarness alloc];
    objc_msgSend(v8, "testName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v74) = 0;
    v66 = -[CAMViewfinderStillImageCaptureTestHarness initWithTestName:maxStillImageCount:expectedNumberOfCapturesPerRequest:viewfinderViewController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:capturesOnTouchDown:](v64, "initWithTestName:maxStillImageCount:expectedNumberOfCapturesPerRequest:viewfinderViewController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:capturesOnTouchDown:", v65, v59, 1, v45, 0, v17, v62, v74);

    v67 = [CAMViewfinderActionIntervalometer alloc];
    objc_msgSend(v9, "valueForKey:", CFSTR("repeatDelayInSeconds"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValue");
    v69 = -[CAMViewfinderActionIntervalometer initWithDelegate:interval:delay:maximumCount:viewfinderViewController:](v67, "initWithDelegate:interval:delay:maximumCount:viewfinderViewController:", v66, v59, v45);

    -[CAMViewfinderStillImageCaptureTestHarness setStillDuringVideo:](v66, "setStillDuringVideo:", 1);
    -[CAMViewfinderStillImageCaptureTestHarness setTestIntervalometer:](v66, "setTestIntervalometer:", v69);
    objc_msgSend(v45, "setStillImageCaptureTestDelegate:", v66);
    objc_msgSend(v8, "queueHarness:", v66);
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke;
    v82[3] = &unk_1EA328A40;
    v83 = v8;
    v70 = v66;
    v84 = v70;
    -[CAMViewfinderVideoCaptureTestHarness setStartVideoHandler:](v56, "setStartVideoHandler:", v82);
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke_2;
    v79[3] = &unk_1EA328A40;
    v80 = v70;
    v81 = v69;
    v71 = v69;
    v72 = v70;
    -[CAMViewfinderVideoCaptureTestHarness setEndVideoHandler:](v56, "setEndVideoHandler:", v79);

  }
  objc_msgSend(v8, "runWithSecondsDelay:", 2);

  return 1;
}

uint64_t __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runHarness:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunningTest");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "stopAttemptingActions");
    return objc_msgSend(*(id *)(a1 + 32), "cancelTesting");
  }
  return result;
}

- (BOOL)runNewPPTUICaptureTestWithTestPlan:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  CAMApplication *v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _BOOL8 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  CAMViewfinderStillImageCaptureTestHarness *v50;
  CAMViewfinderActionIntervalometer *v51;
  void *v52;
  CAMViewfinderActionIntervalometer *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CAMCameraRollTestHarness *v58;
  double v59;
  CAMCameraRollTestHarness *v60;
  CAMCameraRollTestHarness *v61;
  uint64_t v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  CAMCameraRollTestHarness *v70;

  v6 = a3;
  v7 = a4;
  -[CAMApplication delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewfinderViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "testName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "captureOnTouchDown");
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("Portrait")) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("captureMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v15 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("captureMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v15 == 6)
  {
LABEL_4:
    objc_msgSend(v7, "setValue:forKey:", &unk_1EA3AFF68, CFSTR("expectedNumberOfCapturesPerRequest"));
    v12 = 1;
    v15 = 6;
  }
LABEL_6:
  v67 = v10;
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("Front")) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("devicePosition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_11;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("devicePosition"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v9;
  v18 = v8;
  v19 = v11;
  v20 = v6;
  v21 = v15;
  v22 = self;
  v23 = v12;
  v24 = objc_msgSend(v17, "integerValue");

  v25 = v24 == 1;
  v12 = v23;
  self = v22;
  v15 = v21;
  v6 = v20;
  v11 = v19;
  v8 = v18;
  v9 = v64;
  if (v25)
  {
LABEL_10:
    v26 = objc_msgSend(v10, "isFrontAutomaticHDRSupported");
    v27 = 1;
  }
  else
  {
LABEL_11:
    v26 = objc_msgSend(v10, "isBackAutomaticHDRSupported");
    v27 = 0;
  }
  if (v26)
    v28 = 2;
  else
    v28 = 0;
  objc_msgSend(v9, "setHDRMode:", v28);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flashMode"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v12;
  if (v29)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flashMode"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v30, "integerValue");

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("livePhotoMode"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v8;
  if (v31)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("livePhotoMode"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "integerValue");

  }
  else
  {
    v33 = 1;
  }
  objc_msgSend(v9, "setFlashMode:", v29);
  objc_msgSend(v9, "setLivePhotoMode:", v33);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rawMode"));
  v34 = objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rawMode"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v35, "integerValue");

  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("RAW")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "rawControlEnabled"))
    {
      v37 = objc_msgSend(v67, "isLinearDNGSupported");

      if ((v37 & 1) != 0)
      {
        v34 = 1;
        goto LABEL_28;
      }
    }
    else
    {

    }
    -[CAMApplication failedTest:withFailure:](self, "failedTest:withFailure:", v11, CFSTR("RAW Control must be enabled for RAW PPT tests!"));
  }
LABEL_28:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("photoResolution"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("photoResolution"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "integerValue");

  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(v9, "setPhotoResolution:", v40);
  objc_msgSend(v9, "setRawMode:", v34);
  objc_msgSend(v9, "changeToMode:device:animated:", v15, v27, 1);
  sleep(2u);
  v41 = objc_msgSend(v11, "rangeOfString:", CFSTR("Warm")) != 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("expectedNumberOfCapturesPerRequest"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "unsignedIntegerValue");

  objc_msgSend(v7, "valueForKey:", CFSTR("pictureCount"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("delayBetweenCaptures"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "doubleValue");
  v48 = v47;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("initialDelayInSeconds"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "doubleValue");

  LOBYTE(v63) = v65;
  v50 = -[CAMViewfinderStillImageCaptureTestHarness initWithTestName:maxStillImageCount:expectedNumberOfCapturesPerRequest:viewfinderViewController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:capturesOnTouchDown:]([CAMViewfinderStillImageCaptureTestHarness alloc], "initWithTestName:maxStillImageCount:expectedNumberOfCapturesPerRequest:viewfinderViewController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:capturesOnTouchDown:", v11, v45, v43, v9, v41, v15, v48, v63);
  v51 = [CAMViewfinderActionIntervalometer alloc];
  objc_msgSend(v7, "valueForKey:", CFSTR("repeatDelayInSeconds"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "doubleValue");
  v53 = -[CAMViewfinderActionIntervalometer initWithDelegate:interval:delay:maximumCount:viewfinderViewController:](v51, "initWithDelegate:interval:delay:maximumCount:viewfinderViewController:", v50, v45, v9);

  -[CAMViewfinderStillImageCaptureTestHarness setTestIntervalometer:](v50, "setTestIntervalometer:", v53);
  objc_msgSend(v9, "setStillImageCaptureTestDelegate:", v50);
  objc_msgSend(v6, "queueHarness:", v50);
  objc_msgSend(v6, "setSettlingDelaySeconds:", 5);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentCameraRoll"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = objc_msgSend(v54, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentCameraRollDelay"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "doubleValue");
  v57 = v56;

  if ((_DWORD)v51)
  {
    v58 = [CAMCameraRollTestHarness alloc];
    v59 = 0.5;
    if (v57 > 0.0)
      v59 = v57;
    v60 = -[CAMCameraRollTestHarness initWithTestName:viewfinderViewController:testingAnimation:testingWarmPresentation:awaitPreload:settlingDelay:](v58, "initWithTestName:viewfinderViewController:testingAnimation:testingWarmPresentation:awaitPreload:settlingDelay:", v11, v9, 1, 0, 0, v59);
    objc_msgSend(v6, "queueHarness:", v60);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __70__CAMApplication_Testing__runNewPPTUICaptureTestWithTestPlan_options___block_invoke;
    v68[3] = &unk_1EA328A40;
    v69 = v6;
    v70 = v60;
    v61 = v60;
    -[CAMViewfinderStillImageCaptureTestHarness setDidUpdateFinalThumbnailHandler:](v50, "setDidUpdateFinalThumbnailHandler:", v68);

  }
  objc_msgSend(v6, "run");

  return 1;
}

uint64_t __70__CAMApplication_Testing__runNewPPTUICaptureTestWithTestPlan_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runHarness:", *(_QWORD *)(a1 + 40));
}

- (BOOL)runTakePictureTestWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  CAMIntervalometerTestHarness *v25;
  CAMCaptureRequestIntervalometer *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  CAMCaptureRequestIntervalometer *v31;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CAMApplication delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "testName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("Warm")) != 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("expectedNumberOfCapturesPerRequest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("delayBetweenCaptures"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("initialDelayInSeconds"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(v13, "captureController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CAMIntervalometerTestHarness initWithTestName:expectedNumberOfCapturesPerRequest:captureController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:]([CAMIntervalometerTestHarness alloc], "initWithTestName:expectedNumberOfCapturesPerRequest:captureController:performingWarmupCapture:forCaptureMode:delayBetweenCaptures:", v14, v17, v24, v15, a6, v20);
  objc_msgSend(v10, "setDelegate:", v25);
  v26 = [CAMCaptureRequestIntervalometer alloc];
  objc_msgSend(v11, "valueForKey:", CFSTR("repeatDelayInSeconds"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  objc_msgSend(v11, "valueForKey:", CFSTR("pictureCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = -[CAMCaptureRequestIntervalometer initWithDelegate:interval:delay:maximumCount:](v26, "initWithDelegate:interval:delay:maximumCount:", v25, objc_msgSend(v30, "integerValue"), v29, v23);
  -[CAMCaptureRequestIntervalometer setPrototypeRequest:](v31, "setPrototypeRequest:", v10);

  -[CAMIntervalometerTestHarness setTestIntervalometer:](v25, "setTestIntervalometer:", v31);
  objc_msgSend(v12, "queueHarness:", v25);
  objc_msgSend(v12, "setSettlingDelaySeconds:", 5);
  objc_msgSend(v12, "run");

  return 1;
}

- (BOOL)runTakePictureFrontCameraWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CAMDeviceAndModeTestHarness *v15;
  void *v16;
  CAMDeviceAndModeTestHarness *v17;
  CAMDelayTestHarness *v18;
  void *v19;
  CAMDelayTestHarness *v20;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CAMApplication delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewfinderViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [CAMDeviceAndModeTestHarness alloc];
  objc_msgSend(v12, "testName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CAMDeviceAndModeTestHarness initWithTestName:devicePosition:captureMode:viewFinderViewControl:](v15, "initWithTestName:devicePosition:captureMode:viewFinderViewControl:", v16, 1, 0, v14);

  -[CAMPerformanceTestHarness setIsSetupHarness:](v17, "setIsSetupHarness:", 1);
  objc_msgSend(v12, "queueHarness:", v17);
  v18 = [CAMDelayTestHarness alloc];
  objc_msgSend(v12, "testName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CAMDelayTestHarness initWithTestName:secondsDelay:](v18, "initWithTestName:secondsDelay:", v19, 2);

  -[CAMPerformanceTestHarness setIsSetupHarness:](v20, "setIsSetupHarness:", 1);
  objc_msgSend(v12, "queueHarness:", v20);
  LOBYTE(a6) = -[CAMApplication runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:](self, "runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:", v12, v11, v10, a6);

  return a6;
}

- (BOOL)runTakePicturePortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CAMDeviceAndModeTestHarness *v13;
  void *v14;
  CAMDeviceAndModeTestHarness *v15;
  CAMDelayTestHarness *v16;
  void *v17;
  CAMDelayTestHarness *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAMApplication delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewfinderViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [CAMDeviceAndModeTestHarness alloc];
  objc_msgSend(v10, "testName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CAMDeviceAndModeTestHarness initWithTestName:devicePosition:captureMode:viewFinderViewControl:](v13, "initWithTestName:devicePosition:captureMode:viewFinderViewControl:", v14, 0, 6, v12);

  objc_msgSend(v10, "queueHarness:", v15);
  v16 = [CAMDelayTestHarness alloc];
  objc_msgSend(v10, "testName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CAMDelayTestHarness initWithTestName:secondsDelay:](v16, "initWithTestName:secondsDelay:", v17, 2);

  -[CAMPerformanceTestHarness setIsSetupHarness:](v18, "setIsSetupHarness:", 1);
  objc_msgSend(v10, "queueHarness:", v18);
  LOBYTE(self) = -[CAMApplication runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:](self, "runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:", v10, v9, v8, 6);

  return (char)self;
}

- (BOOL)runTakePictureFrontPortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CAMDeviceAndModeTestHarness *v13;
  void *v14;
  CAMDeviceAndModeTestHarness *v15;
  CAMDelayTestHarness *v16;
  void *v17;
  CAMDelayTestHarness *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAMApplication delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewfinderViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [CAMDeviceAndModeTestHarness alloc];
  objc_msgSend(v10, "testName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CAMDeviceAndModeTestHarness initWithTestName:devicePosition:captureMode:viewFinderViewControl:](v13, "initWithTestName:devicePosition:captureMode:viewFinderViewControl:", v14, 1, 6, v12);

  objc_msgSend(v10, "queueHarness:", v15);
  v16 = [CAMDelayTestHarness alloc];
  objc_msgSend(v10, "testName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CAMDelayTestHarness initWithTestName:secondsDelay:](v16, "initWithTestName:secondsDelay:", v17, 2);

  -[CAMPerformanceTestHarness setIsSetupHarness:](v18, "setIsSetupHarness:", 1);
  objc_msgSend(v10, "queueHarness:", v18);
  LOBYTE(self) = -[CAMApplication runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:](self, "runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:", v10, v9, v8, 6);

  return (char)self;
}

- (BOOL)runSwitchToPortraitFrontWithTestPlan:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CAMDeviceSwitchTestHarness *v16;
  CAMDeviceSwitchTestHarness *v17;

  v6 = a3;
  v7 = a4;
  -[CAMApplication delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "testName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewfinderViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "rangeOfString:", CFSTR("Animation"));
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testExtensionSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (objc_msgSend(v12, "isPortraitModeSupportedForDevicePosition:", 1)
    && objc_msgSend(v12, "isPortraitModeSupportedForDevicePosition:", 0))
  {
    v16 = -[CAMDeviceSwitchTestHarness initWithTestName:viewfinderViewController:devicePosition:testingAnimation:startingCaptureMode:testExtensionSeconds:]([CAMDeviceSwitchTestHarness alloc], "initWithTestName:viewfinderViewController:devicePosition:testingAnimation:startingCaptureMode:testExtensionSeconds:", v9, v10, 1, v11 != 0x7FFFFFFFFFFFFFFFLL, 6, v15);
  }
  else
  {
    v16 = -[CAMModeSwitchTestHarness initWithTestName:viewfinderViewController:mode:testingAnimation:testExtensionSeconds:]([CAMModeSwitchTestHarness alloc], "initWithTestName:viewfinderViewController:mode:testingAnimation:testExtensionSeconds:", v9, v10, 6, v11 != 0x7FFFFFFFFFFFFFFFLL, v15);
  }
  v17 = v16;
  objc_msgSend(v6, "queueHarness:", v16);
  objc_msgSend(v6, "run");

  return 1;
}

- (BOOL)runSwitchCamerasTestWithTestPlan:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  double v14;
  double v15;
  CAMDeviceSwitchTestHarness *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "testName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMApplication delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewfinderViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "rangeOfString:", CFSTR("Front")) != 0x7FFFFFFFFFFFFFFFLL;
  v12 = objc_msgSend(v8, "rangeOfString:", CFSTR("Animation")) != 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testExtensionSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = -[CAMDeviceSwitchTestHarness initWithTestName:viewfinderViewController:devicePosition:testingAnimation:startingCaptureMode:testExtensionSeconds:]([CAMDeviceSwitchTestHarness alloc], "initWithTestName:viewfinderViewController:devicePosition:testingAnimation:startingCaptureMode:testExtensionSeconds:", v8, v10, v11, v12, 0, v15);
  objc_msgSend(v7, "queueHarness:", v16);
  objc_msgSend(v7, "run");

  return 1;
}

- (BOOL)runSwitchModesWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  __CFString *v33;
  void *v34;
  NSObject *v35;
  _BOOL8 v36;
  void *v37;
  double v38;
  double v39;
  CAMModeSwitchTestHarness *v40;
  BOOL v41;
  void *v43;
  CAMApplication *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "testName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToPano")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 3;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToStill")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToVideo")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToTimeLapse")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 5;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToSquare")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 4;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToSloMo")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 2;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToPortrait")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 6;
    goto LABEL_18;
  }
  if (objc_msgSend(v11, "rangeOfString:", CFSTR("SwitchToMode")) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_92:
    v41 = 0;
    goto LABEL_90;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("captureMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing defaults write for %@"), CFSTR("PPTMode"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplication failedTest:withFailure:](self, "failedTest:withFailure:", v11, v43);

    goto LABEL_92;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, "integerValue");

LABEL_18:
  -[CAMApplication delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewfinderViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "rangeOfString:", CFSTR("Animation"));
  if (v14 == 7 || v14 == 1)
  {
    v45 = v17;
    v46 = v15;
    objc_msgSend(v10, "videoConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v14 - 1;
    v44 = self;
    if (v14 == 1 && v18)
    {
      objc_msgSend(v10, "videoConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "cinematicConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      if (v14 != 7 || !v21)
      {
LABEL_53:
        v47 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("devicePosition"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "integerValue");

        v28 = v27 == 1;
        +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 > 6)
          v30 = 0;
        else
          v30 = off_1EA328C28[v19];
        v15 = v46;
        v31 = CFSTR("BackAuto");
        if (v27 == 1)
          v31 = CFSTR("FrontAuto");
        switch(v22)
        {
          case 0:
            v32 = CFSTR("Auto");
            break;
          case 1:
            v32 = CFSTR("1080p60");
            break;
          case 2:
            v32 = CFSTR("720p120");
            break;
          case 3:
            v32 = CFSTR("720p240");
            break;
          case 4:
            v32 = CFSTR("1080p120");
            break;
          case 5:
            v32 = CFSTR("4k30");
            break;
          case 6:
            v32 = CFSTR("720p30");
            break;
          case 7:
            v32 = CFSTR("1080p30");
            break;
          case 8:
            v32 = CFSTR("1080p240");
            break;
          case 9:
            v32 = CFSTR("4k60");
            break;
          case 10:
            v32 = CFSTR("4k24");
            break;
          case 11:
            v32 = CFSTR("1080p25");
            break;
          case 12:
            v32 = CFSTR("4k25");
            break;
          case 13:
            v32 = CFSTR("4k120");
            break;
          case 14:
            v32 = CFSTR("4k100");
            break;
          default:
            switch(v22)
            {
              case 10000:
                v32 = CFSTR("ImagePickerHigh");
                break;
              case 10001:
                v32 = CFSTR("ImagePickerMedium");
                break;
              case 10002:
                v32 = CFSTR("ImagePickerLow");
                break;
              case 10003:
                v32 = CFSTR("ImagePickerVGA");
                break;
              case 10004:
                v32 = CFSTR("ImagePickeriFrame720p");
                break;
              case 10005:
                v32 = CFSTR("ImagePickeriFrame540p");
                break;
              default:
                v32 = 0;
                break;
            }
            break;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mode: %@ device: %@ format: %@"), v30, v31, v32);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "isSupportedVideoConfiguration:forMode:device:", v22, v14, v28) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not supported"), v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMApplication failedTest:withFailure:](v44, "failedTest:withFailure:", v11, v34);

        }
        v35 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = v11;
          v50 = 2114;
          v51 = v33;
          _os_log_impl(&dword_1DB760000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ configured with %{public}@", buf, 0x16u);
        }

        if (objc_msgSend(v10, "hasOverrides"))
          objc_msgSend(v16, "readUserPreferencesAndHandleChangesWithOverrides:", v10);

        v9 = v47;
        v17 = v45;
        goto LABEL_89;
      }
      objc_msgSend(v10, "cinematicConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v20;
    v22 = objc_msgSend(v20, "integerValue");

    v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      switch(v22)
      {
        case 0:
          v25 = CFSTR("Auto");
          break;
        case 1:
          v25 = CFSTR("1080p60");
          break;
        case 2:
          v25 = CFSTR("720p120");
          break;
        case 3:
          v25 = CFSTR("720p240");
          break;
        case 4:
          v25 = CFSTR("1080p120");
          break;
        case 5:
          v25 = CFSTR("4k30");
          break;
        case 6:
          v25 = CFSTR("720p30");
          break;
        case 7:
          v25 = CFSTR("1080p30");
          break;
        case 8:
          v25 = CFSTR("1080p240");
          break;
        case 9:
          v25 = CFSTR("4k60");
          break;
        case 10:
          v25 = CFSTR("4k24");
          break;
        case 11:
          v25 = CFSTR("1080p25");
          break;
        case 12:
          v25 = CFSTR("4k25");
          break;
        case 13:
          v25 = CFSTR("4k120");
          break;
        case 14:
          v25 = CFSTR("4k100");
          break;
        default:
          switch(v22)
          {
            case 10000:
              v25 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v25 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v25 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v25 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v25 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v25 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v25 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v49 = v11;
      v50 = 2114;
      v51 = v25;
      _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ will override Video format to %{public}@", buf, 0x16u);
    }

    goto LABEL_53;
  }
LABEL_89:
  v36 = v17 != 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testExtensionSeconds"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  v40 = -[CAMModeSwitchTestHarness initWithTestName:viewfinderViewController:mode:testingAnimation:testExtensionSeconds:]([CAMModeSwitchTestHarness alloc], "initWithTestName:viewfinderViewController:mode:testingAnimation:testExtensionSeconds:", v11, v16, v14, v36, v39);
  objc_msgSend(v8, "queueHarness:", v40);
  objc_msgSend(v8, "run");

  v41 = 1;
LABEL_90:

  return v41;
}

- (BOOL)runPresentCameraRollWithTestPlan:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  CAMCameraRollTestHarness *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "testName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("presentCameraRollDelay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = objc_msgSend(v8, "rangeOfString:", CFSTR("AfterDelay"));
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v8, "rangeOfString:", CFSTR("SecondTime")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
      v14 = objc_msgSend(v8, "rangeOfString:", CFSTR("Animation")) != 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0.0;
    }
    else
    {
      v14 = 0;
      v11 = 3.0;
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
    if (v11 <= 0.0)
      v11 = 6.0;
  }
  -[CAMApplication delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewfinderViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CAMCameraRollTestHarness initWithTestName:viewfinderViewController:testingAnimation:testingWarmPresentation:awaitPreload:settlingDelay:]([CAMCameraRollTestHarness alloc], "initWithTestName:viewfinderViewController:testingAnimation:testingWarmPresentation:awaitPreload:settlingDelay:", v8, v16, v14, v13, v12 != 0x7FFFFFFFFFFFFFFFLL, v11);
  objc_msgSend(v7, "queueHarness:", v17);
  objc_msgSend(v7, "run");

  return 1;
}

- (BOOL)runLibrarySelectionWithTestPlan:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CAMLibrarySelectionTestHarness *v9;
  void *v10;
  CAMLibrarySelectionTestHarness *v11;

  v5 = a3;
  -[CAMApplication delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewfinderViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_librarySelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CAMLibrarySelectionTestHarness alloc];
  objc_msgSend(v5, "testName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CAMLibrarySelectionTestHarness initWithTestName:librarySelectionController:](v9, "initWithTestName:librarySelectionController:", v10, v8);

  objc_msgSend(v5, "queueHarness:", v11);
  objc_msgSend(v5, "run");

  return 1;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  CAMUserPreferenceOverrides *v10;
  CFIndex AppIntegerValue;
  void *v12;
  CFIndex v13;
  void *v14;
  CFIndex v15;
  void *v16;
  CFIndex v17;
  void *v18;
  CFIndex v19;
  void *v20;
  CFIndex v21;
  void *v22;
  CFIndex v23;
  void *v24;
  CFIndex v25;
  void *v26;
  CFIndex v27;
  void *v28;
  CFIndex v29;
  void *v30;
  CFIndex v31;
  void *v32;
  void *v33;
  CFIndex v34;
  void *v35;
  CFIndex v36;
  void *v37;
  CFIndex v38;
  void *v39;
  CFIndex v40;
  void *v41;
  CFIndex v42;
  void *v43;
  NSObject *v44;
  CAMPerformanceTestPlan *v45;
  unsigned __int8 v46;
  CAMMutableStillImageCaptureRequest *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  BOOL v65;
  BOOL v66;
  CAMUserPreferenceOverrides *v68;
  objc_super v69;
  _QWORD v70[5];
  Boolean v71;
  Boolean v72;
  Boolean v73;
  Boolean v74;
  Boolean v75;
  char v76;
  Boolean v77;
  Boolean v78;
  Boolean v79;
  Boolean v80;
  Boolean v81;
  Boolean v82;
  Boolean v83;
  Boolean v84;
  Boolean v85;
  Boolean v86;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  id v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v8);

  v10 = objc_alloc_init(CAMUserPreferenceOverrides);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PPTDelayBetweenCapturesMilliseconds"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)AppIntegerValue / 1000.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("delayBetweenCaptures"));

  }
  v86 = 0;
  v13 = CFPreferencesGetAppIntegerValue(CFSTR("PPTInitialDelayMilliseconds"), CFSTR("com.apple.camera"), &v86);
  if (v86)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v13 / 1000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("initialDelayInSeconds"));

  }
  v85 = 0;
  v15 = CFPreferencesGetAppIntegerValue(CFSTR("PPTPhotoCount"), CFSTR("com.apple.camera"), &v85);
  if (v85)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("pictureCount"));

  }
  v84 = 0;
  v17 = CFPreferencesGetAppIntegerValue(CFSTR("PPTPresentCameraRoll"), CFSTR("com.apple.camera"), &v84);
  if (v84)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("presentCameraRoll"));

  }
  v83 = 0;
  v19 = CFPreferencesGetAppIntegerValue(CFSTR("PPTCaptureStillsDuringVideo"), CFSTR("com.apple.camera"), &v83);
  if (v83)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("captureStillsDuringVideo"));

  }
  v82 = 0;
  v21 = CFPreferencesGetAppIntegerValue(CFSTR("PPTVideoRecordDurationInSeconds"), CFSTR("com.apple.camera"), &v82);
  if (v82)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("videoDurationInSeconds"));

  }
  v81 = 0;
  v23 = CFPreferencesGetAppIntegerValue(CFSTR("PPTMode"), CFSTR("com.apple.camera"), &v81);
  if (v81)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("captureMode"));

  }
  v80 = 0;
  v25 = CFPreferencesGetAppIntegerValue(CFSTR("PPTDevicePosition"), CFSTR("com.apple.camera"), &v80);
  if (v80)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("devicePosition"));

  }
  v79 = 0;
  v27 = CFPreferencesGetAppIntegerValue(CFSTR("PPTVideoConfiguration"), CFSTR("com.apple.camera"), &v79);
  if (v79)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMUserPreferenceOverrides setVideoConfiguration:](v10, "setVideoConfiguration:", v28);

  }
  v78 = 0;
  v29 = CFPreferencesGetAppIntegerValue(CFSTR("PPTSloMoConfiguration"), CFSTR("com.apple.camera"), &v78);
  if (v78)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMUserPreferenceOverrides setSlomoConfiguration:](v10, "setSlomoConfiguration:", v30);

  }
  v77 = 0;
  v31 = CFPreferencesGetAppIntegerValue(CFSTR("PPTCinematicConfiguration"), CFSTR("com.apple.camera"), &v77);
  if (v77)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMUserPreferenceOverrides setCinematicConfiguration:](v10, "setCinematicConfiguration:", v32);

  }
  v76 = 0;
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("PPTTestExtensionSeconds"), CFSTR("com.apple.camera"), &v76);
  if (v76)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("testExtensionSeconds"));

  }
  v75 = 0;
  v34 = CFPreferencesGetAppIntegerValue(CFSTR("PPTFlashMode"), CFSTR("com.apple.camera"), &v75);
  if (v75)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, CFSTR("flashMode"));

  }
  v74 = 0;
  v36 = CFPreferencesGetAppIntegerValue(CFSTR("PPTLivePhotoMode"), CFSTR("com.apple.camera"), &v74);
  if (v74)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, CFSTR("livePhotoMode"));

  }
  v73 = 0;
  v38 = CFPreferencesGetAppIntegerValue(CFSTR("PPTPhotoResolution"), CFSTR("com.apple.camera"), &v73);
  if (v73)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, CFSTR("photoResolution"));

  }
  v72 = 0;
  v40 = CFPreferencesGetAppIntegerValue(CFSTR("PPTRAWMode"), CFSTR("com.apple.camera"), &v72);
  if (v72)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("rawMode"));

  }
  v71 = 0;
  v42 = CFPreferencesGetAppIntegerValue(CFSTR("PPTPresentCameraRollDelayMilliseconds"), CFSTR("com.apple.camera"), &v71);
  if (v71)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v42 / 1000.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v43, CFSTR("presentCameraRollDelay"));

  }
  v44 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v89 = v6;
    v90 = 2114;
    v91 = v9;
    _os_log_impl(&dword_1DB760000, v44, OS_LOG_TYPE_DEFAULT, "Running PPT test %{public}@ with options %{public}@", buf, 0x16u);
  }

  v45 = -[CAMPerformanceTestPlan initWithTestName:]([CAMPerformanceTestPlan alloc], "initWithTestName:", v6);
  -[CAMApplication setCurrentTestPlan:](self, "setCurrentTestPlan:", v45);
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __43__CAMApplication_Testing__runTest_options___block_invoke;
  v70[3] = &unk_1EA328868;
  v70[4] = self;
  -[CAMPerformanceTestPlan setCompletionHandler:](v45, "setCompletionHandler:", v70);
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("UI")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("Video")) == 0x7FFFFFFFFFFFFFFFLL)
      v46 = -[CAMApplication runNewPPTUICaptureTestWithTestPlan:options:](self, "runNewPPTUICaptureTestWithTestPlan:options:", v45, v9);
    else
      v46 = -[CAMApplication runTakeVideoTestWithTestPlan:options:userPreferencesOverrides:](self, "runTakeVideoTestWithTestPlan:options:userPreferencesOverrides:", v45, v9, v10);
LABEL_93:
    v66 = v46;
    goto LABEL_94;
  }
  objc_msgSend(v9, "setValue:forKey:", &unk_1EA3AFF80, CFSTR("expectedNumberOfCapturesPerRequest"));
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("TakePicture")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("PresentCameraRoll")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("SwitchTo")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "rangeOfString:", CFSTR("LibrarySelection")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v69.receiver = self;
          v69.super_class = (Class)CAMApplication;
          v46 = -[CAMApplication runTest:options:](&v69, sel_runTest_options_, v6, v9);
        }
        else
        {
          v46 = -[CAMApplication runLibrarySelectionWithTestPlan:options:](self, "runLibrarySelectionWithTestPlan:options:", v45, v9);
        }
      }
      else if (objc_msgSend(v6, "rangeOfString:", CFSTR("FrontPortrait")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "rangeOfString:", CFSTR("FrontCamera")) == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v6, "rangeOfString:", CFSTR("RearCamera")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v46 = -[CAMApplication runSwitchModesWithTestPlan:options:userPreferencesOverrides:](self, "runSwitchModesWithTestPlan:options:userPreferencesOverrides:", v45, v9, v10);
        }
        else
        {
          v46 = -[CAMApplication runSwitchCamerasTestWithTestPlan:options:](self, "runSwitchCamerasTestWithTestPlan:options:", v45, v9);
        }
      }
      else
      {
        v46 = -[CAMApplication runSwitchToPortraitFrontWithTestPlan:options:](self, "runSwitchToPortraitFrontWithTestPlan:options:", v45, v9);
      }
    }
    else
    {
      v46 = -[CAMApplication runPresentCameraRollWithTestPlan:options:](self, "runPresentCameraRollWithTestPlan:options:", v45, v9);
    }
    goto LABEL_93;
  }
  v68 = v10;
  v47 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("Default")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("HDR")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CAMMutableStillImageCaptureRequest setHdrMode:](v47, "setHdrMode:", 0);
    }
    else
    {
      -[CAMMutableStillImageCaptureRequest setHdrMode:](v47, "setHdrMode:", 1);
      if (objc_msgSend(v48, "shouldCaptureHDREV0"))
        v51 = &unk_1EA3AFF68;
      else
        v51 = &unk_1EA3AFF80;
      objc_msgSend(v9, "setValue:forKey:", v51, CFSTR("expectedNumberOfCapturesPerRequest"));
    }
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("Front")) == 0x7FFFFFFFFFFFFFFFLL)
      v50 = objc_msgSend(v49, "isBackAutomaticHDRSupported");
    else
      v50 = objc_msgSend(v49, "isFrontAutomaticHDRSupported");
    if (v50)
      v52 = 2;
    else
      v52 = 0;
    -[CAMMutableStillImageCaptureRequest setHdrMode:](v47, "setHdrMode:", v52);
    if (objc_msgSend(v48, "shouldCaptureHDREV0"))
      -[CAMApplication failedTest:withFailure:](self, "failedTest:withFailure:", v6, CFSTR("Keep Normal Photo should be off for default photo capture tests"));
    -[CAMMutableStillImageCaptureRequest setWantsSemanticSceneFilter:](v47, "setWantsSemanticSceneFilter:", objc_msgSend(v48, "semanticDevelopmentEnabled"));

  }
  v53 = objc_msgSend(v6, "rangeOfString:", CFSTR("Iris")) != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v6, "rangeOfString:", CFSTR("Default")) != 0x7FFFFFFFFFFFFFFFLL;
  -[CAMMutableStillImageCaptureRequest setIrisMode:](v47, "setIrisMode:", v53);
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("Stabilization")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v6, "rangeOfString:", CFSTR("Default")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CAMMutableStillImageCaptureRequest setPhotoQualityPrioritization:](v47, "setPhotoQualityPrioritization:", 0);
  }
  else
  {
    -[CAMApplication delegate](self, "delegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "viewfinderViewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "currentCaptureMode");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v55, "currentCaptureDevice") - 1;
    if (v58 > 0xA)
      v59 = 0;
    else
      v59 = qword_1DB9A4A20[v58];
    -[CAMMutableStillImageCaptureRequest setPhotoQualityPrioritization:](v47, "setPhotoQualityPrioritization:", objc_msgSend(v57, "maxSupportedPhotoQualityPrioritizationForMode:devicePosition:", v56, v59));

  }
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("Portrait")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CAMMutableStillImageCaptureRequest setWantsDepthData:](v47, "setWantsDepthData:", 0);
  }
  else
  {
    -[CAMMutableStillImageCaptureRequest setWantsDepthData:](v47, "setWantsDepthData:", 1);
    -[CAMMutableStillImageCaptureRequest setHdrMode:](v47, "setHdrMode:", 2);
    v60 = objc_msgSend(v48, "ppt_readPortraitLightingType");
    -[CAMMutableStillImageCaptureRequest setLightingEffectType:](v47, "setLightingEffectType:", v60);
    +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", 16, v60, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMMutableStillImageCaptureRequest setAdjustmentFilters:](v47, "setAdjustmentFilters:", v61);
    objc_msgSend(v9, "setValue:forKey:", &unk_1EA3AFF68, CFSTR("expectedNumberOfCapturesPerRequest"));

  }
  -[CAMMutableStillImageCaptureRequest setFlashMode:](v47, "setFlashMode:", 0);
  -[CAMMutableStillImageCaptureRequest setWantsAudioForCapture:](v47, "setWantsAudioForCapture:", 1);
  v62 = objc_msgSend(v48, "photoEncodingBehavior");
  objc_msgSend(v48, "captureConfiguration");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v48, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", 0, 0, objc_msgSend(v63, "proResVideoMode"), 0, 0);

  -[CAMMutableStillImageCaptureRequest setPhotoEncodingBehavior:](v47, "setPhotoEncodingBehavior:", v62);
  -[CAMMutableStillImageCaptureRequest setVideoEncodingBehavior:](v47, "setVideoEncodingBehavior:", v64);
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("Front")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("Portrait")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("Flash")) != 0x7FFFFFFFFFFFFFFFLL)
        -[CAMMutableStillImageCaptureRequest setFlashMode:](v47, "setFlashMode:", 1);
      v65 = -[CAMApplication runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:](self, "runTakePictureTestWithTestPlan:options:prototype:forCaptureMode:", v45, v9, v47, 0);
    }
    else
    {
      v65 = -[CAMApplication runTakePicturePortraitWithTestPlan:options:prototype:](self, "runTakePicturePortraitWithTestPlan:options:prototype:", v45, v9, v47);
    }
  }
  else if (objc_msgSend(v6, "rangeOfString:", CFSTR("FrontPortrait")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v65 = -[CAMApplication runTakePictureFrontCameraWithTestPlan:options:prototype:forCaptureMode:](self, "runTakePictureFrontCameraWithTestPlan:options:prototype:forCaptureMode:", v45, v9, v47, 0);
  }
  else
  {
    v65 = -[CAMApplication runTakePictureFrontPortraitWithTestPlan:options:prototype:](self, "runTakePictureFrontPortraitWithTestPlan:options:prototype:", v45, v9, v47);
  }
  v66 = v65;

  v10 = v68;
LABEL_94:

  return v66;
}

uint64_t __43__CAMApplication_Testing__runTest_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentTestPlan:", 0);
}

+ (int64_t)appOrPlugInInterfaceOrientation
{
  void *v2;
  id *v3;
  int64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)MEMORY[0x1E0DC4730];
  v4 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarOrientation");
  v5 = objc_msgSend(v2, "hostProcess");
  if (v5 > 5)
  {
    v4 = 0;
  }
  else if (((1 << v5) & 0x1B) == 0)
  {
    if (v5 != 2
      || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceIdiom"),
          v6,
          v7 == 1))
    {
      v4 = objc_msgSend(*v3, "activeInterfaceOrientation");
    }
  }

  return v4;
}

+ (BOOL)isAppOrPlugInSuspended
{
  char v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "isSuspended");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostProcess");

  if (v4 == 4 || v4 == 2)
    return 0;
  else
    return v2;
}

+ (int64_t)appOrPlugInState
{
  int64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostProcess");

  if (v4 == 4 || v4 == 2)
    return 0;
  else
    return v2;
}

- (CAMPerformanceTestPlan)currentTestPlan
{
  return self->_currentTestPlan;
}

- (void)setCurrentTestPlan:(id)a3
{
  objc_storeStrong((id *)&self->_currentTestPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTestPlan, 0);
}

@end
