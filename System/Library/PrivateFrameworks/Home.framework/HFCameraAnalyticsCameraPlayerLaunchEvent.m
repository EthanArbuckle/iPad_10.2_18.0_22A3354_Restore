@implementation HFCameraAnalyticsCameraPlayerLaunchEvent

- (void)launchedStreamWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraAnalyticsEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v9 * 1000.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCameraAnalyticsEvent errorCodeForError:](HFCameraAnalyticsEvent, "errorCodeForError:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = HFCameraAnalyticsErrorCode;
  v15[1] = HFCameraAnalyticsProcessName;
  v16[0] = v13;
  v16[1] = v12;
  v15[2] = HFCameraAnalyticsLatency;
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraAnalyticsEventHandler sendEventNamed:payload:](HFCameraAnalyticsEventHandler, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraStreamLaunch"), v14);

}

- (void)launchedRecordingWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraAnalyticsEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v9 * 1000.0));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCameraAnalyticsEvent errorCodeForError:](HFCameraAnalyticsEvent, "errorCodeForError:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "duration");
  objc_msgSend(v16, "numberWithUnsignedInteger:", (unint64_t)v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v21 = (void *)MEMORY[0x1E0C99D68];
  -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateOfOccurrence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "hf_daysBetweenDates:endDate:", v23, v24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = HFCameraAnalyticsErrorCode;
  v28[1] = HFCameraAnalyticsIsComplete;
  v29[0] = v15;
  v29[1] = v12;
  v28[2] = HFCameraAnalyticsProcessName;
  v28[3] = HFCameraAnalyticsLatency;
  v29[2] = v14;
  v29[3] = v27;
  v28[4] = HFCameraAnalyticsDuration;
  v28[5] = HFCameraAnalyticsAge;
  v29[4] = v19;
  v29[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraAnalyticsEventHandler sendEventNamed:payload:](HFCameraAnalyticsEventHandler, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipLaunch"), v26);

}

@end
