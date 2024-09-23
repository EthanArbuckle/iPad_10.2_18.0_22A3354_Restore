@implementation HFCameraAnalyticsEventHandler

+ (void)sendEventNamed:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[HFCameraAnalyticsEventHandler decoratedPayloadFor:](HFCameraAnalyticsEventHandler, "decoratedPayloadFor:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = AnalyticsSendEventLazy();
  HFLogForCategory(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v10 = v5;
    v11 = 1024;
    v12 = v7;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Event:%@ didSucceed:%{BOOL}d payload:%@", buf, 0x1Cu);
  }

}

id __56__HFCameraAnalyticsEventHandler_sendEventNamed_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)sendAssociatedAccessoriesDidLaunchEventWithCount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = HFCameraAnalyticsCameraAccessoryCount;
  v9[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendEventNamed:payload:", CFSTR("com.apple.Home.AssociatedAccessoriesDidLaunch"), v6);
  return v6;
}

+ (id)sendAssociatedAccessoriesDidModifyListEventWithPayload:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "sendEventNamed:payload:", CFSTR("com.apple.Home.AssociatedAccessoriesDidModifySet"), v4);
  return v4;
}

+ (id)sendCameraClipPlayerDidUpdateEventWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("errorDomain");
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("errorCode");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "code");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipPlayerDidUpdateError"), v9);
  return v9;
}

+ (id)sendDonationEventWithCameraClipCount:(unint64_t)a3 processName:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  +[HFCameraAnalyticsEvent errorCodeForError:](HFCameraAnalyticsEvent, "errorCodeForError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = HFCameraAnalyticsErrorCode;
  v13[1] = HFCameraAnalyticsProcessName;
  v14[0] = v9;
  v14[1] = v8;
  v13[2] = HFCameraAnalyticsCountKey;
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendEventNamed:payload:", CFSTR("com.apple.Home.CameraClipDonationEvent"), v11);
  return v11;
}

+ (id)decoratedPayloadFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HFCameraAnalyticsPayloadDecorator sharedDecorator](HFCameraAnalyticsPayloadDecorator, "sharedDecorator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decoratePayload:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
