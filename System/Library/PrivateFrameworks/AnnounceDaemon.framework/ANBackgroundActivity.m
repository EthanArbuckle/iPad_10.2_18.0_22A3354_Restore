@implementation ANBackgroundActivity

- (ANBackgroundActivity)init
{
  ANBackgroundActivity *v2;
  uint64_t v3;
  NSBackgroundActivityScheduler *backgroundActivity;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANBackgroundActivity;
  v2 = -[ANBackgroundActivity init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.announce.activity.dailyanalytics"));
    backgroundActivity = v2->_backgroundActivity;
    v2->_backgroundActivity = (NSBackgroundActivityScheduler *)v3;

    -[NSBackgroundActivityScheduler setPreregistered:](v2->_backgroundActivity, "setPreregistered:", 1);
    -[NSBackgroundActivityScheduler setQualityOfService:](v2->_backgroundActivity, "setQualityOfService:", 9);
    -[NSBackgroundActivityScheduler setCheckInHandler:](v2->_backgroundActivity, "setCheckInHandler:", &__block_literal_global_20);
  }
  return v2;
}

void __28__ANBackgroundActivity_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (ANLogHandleBackgroundActivity_once != -1)
    dispatch_once(&ANLogHandleBackgroundActivity_once, &__block_literal_global_17);
  v0 = (id)ANLogHandleBackgroundActivity_logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v0, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily checked in.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)scheduleWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ANBackgroundActivity backgroundActivity](self, "backgroundActivity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleWithBlock:", v4);

}

- (BOOL)shouldDefer
{
  void *v2;
  char v3;

  -[ANBackgroundActivity backgroundActivity](self, "backgroundActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDefer");

  return v3;
}

- (NSBackgroundActivityScheduler)backgroundActivity
{
  return self->_backgroundActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
}

@end
