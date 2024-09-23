@implementation HFCameraAnalyticsCameraClipExportSessionEvent

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
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  _QWORD v33[7];
  _QWORD v34[7];
  uint8_t buf[4];
  HFCameraAnalyticsCameraClipExportSessionEvent *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
    v31 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "duration");
    objc_msgSend(v15, "numberWithUnsignedInteger:", (unint64_t)(v17 * 1000.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = (void *)MEMORY[0x1E0C99D68];
    -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateOfOccurrence");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "hf_daysBetweenDates:endDate:", v22, v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB37E8];
    v26 = v31;
    -[HFCameraAnalyticsCameraClipExportSessionEvent recordingDuration](self, "recordingDuration");
    objc_msgSend(v25, "numberWithUnsignedInt:", (v27 * 1000.0));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = HFCameraAnalyticsErrorState;
    v33[1] = HFCameraAnalyticsExportedLength;
    v34[0] = v14;
    v34[1] = v28;
    v33[2] = HFCameraAnalyticsIsComplete;
    v33[3] = HFCameraAnalyticsProcessName;
    v34[2] = v32;
    v34[3] = v13;
    v33[4] = HFCameraAnalyticsLatency;
    v33[5] = HFCameraAnalyticsDuration;
    v34[4] = v31;
    v34[5] = v18;
    v33[6] = HFCameraAnalyticsAge;
    v34[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraAnalyticsEventHandler sendEventNamed:payload:](HFCameraAnalyticsEventHandler, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipExportSession"), v29);

  }
  else
  {
    HFLogForCategory(6uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = self;
      _os_log_error_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_ERROR, "Unable to send event for %@", buf, 0xCu);
    }
    v29 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v29;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

@end
