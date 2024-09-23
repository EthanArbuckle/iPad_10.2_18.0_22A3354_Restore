@implementation HFCameraAnalyticsCameraClipPlaybackSessionEvent

- (id)sendEventForState:(unint64_t)a3
{
  void *v5;
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[7];
  _QWORD v37[7];
  uint8_t buf[4];
  HFCameraAnalyticsCameraClipPlaybackSessionEvent *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraAnalyticsEvent startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v9 * 1000.0));
    v33 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    objc_msgSend(v14, "numberWithUnsignedInteger:", (unint64_t)v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = (void *)MEMORY[0x1E0C99D68];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateOfOccurrence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "hf_minutesBetweenDates:endDate:", v21, v22));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = v33;
    v26 = (void *)MEMORY[0x1E0C99D68];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateOfOccurrence");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v26, "hf_daysBetweenDates:endDate:", v28, v29));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v36[0] = HFCameraAnalyticsErrorState;
    v36[1] = HFCameraAnalyticsIsComplete;
    v37[0] = v13;
    v37[1] = v35;
    v36[2] = HFCameraAnalyticsProcessName;
    v36[3] = HFCameraAnalyticsLatency;
    v37[2] = v34;
    v37[3] = v33;
    v36[4] = HFCameraAnalyticsDuration;
    v36[5] = HFCameraAnalyticsAge;
    v37[4] = v17;
    v37[5] = v30;
    v36[6] = HFCameraAnalyticsAgeInMinutes;
    v37[6] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraAnalyticsEventHandler sendEventNamed:payload:](HFCameraAnalyticsEventHandler, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipPlaybackSession"), v31);

  }
  else
  {
    HFLogForCategory(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_error_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_ERROR, "Unable to send event for %@", buf, 0xCu);
    }
    v31 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v31;
}

@end
