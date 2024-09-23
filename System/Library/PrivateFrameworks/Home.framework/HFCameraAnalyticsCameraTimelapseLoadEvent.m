@implementation HFCameraAnalyticsCameraTimelapseLoadEvent

- (id)sendEventForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraAnalyticsEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v8 * 1000.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = HFCameraAnalyticsLoadState;
  v15[1] = HFCameraAnalyticsProcessName;
  v16[0] = v12;
  v16[1] = v11;
  v15[2] = HFCameraAnalyticsLatency;
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraAnalyticsEventHandler sendEventNamed:payload:](HFCameraAnalyticsEventHandler, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipTimelapseLoad"), v13);

  return v13;
}

@end
