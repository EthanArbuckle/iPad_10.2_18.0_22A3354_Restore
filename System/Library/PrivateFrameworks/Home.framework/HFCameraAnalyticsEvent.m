@implementation HFCameraAnalyticsEvent

- (HFCameraAnalyticsEvent)init
{
  HFCameraAnalyticsEvent *v2;
  uint64_t v3;
  NSDate *startDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFCameraAnalyticsEvent;
  v2 = -[HFCameraAnalyticsEvent init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;

  }
  return v2;
}

- (HFCameraAnalyticsEvent)initWithCameraClip:(id)a3
{
  id v4;
  HFCameraAnalyticsEvent *v5;
  HFCameraAnalyticsEvent *v6;

  v4 = a3;
  v5 = -[HFCameraAnalyticsEvent init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_cameraClip, v4);

  return v6;
}

- (id)sendEventForState:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  int v9;
  HFCameraAnalyticsEvent *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HFCameraAnalyticsEvent cameraClip](self, "cameraClip", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = self;
LABEL_7:
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    v9 = 138412290;
    v10 = self;
    v7 = "Unable to send event for %@";
    goto LABEL_7;
  }

  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)errorCodeForError:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  if (a3)
    a3 = (id)objc_msgSend(a3, "code");
  objc_msgSend(v3, "numberWithInteger:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HMCameraClip)cameraClip
{
  return (HMCameraClip *)objc_loadWeakRetained((id *)&self->_cameraClip);
}

- (void)setCameraClip:(id)a3
{
  objc_storeWeak((id *)&self->_cameraClip, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraClip);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
