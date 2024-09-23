@implementation ATXAppClipSettingsUpdateSource

- (void)handleSiriSettingsChangedNotification
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSuggestAppClips"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - got siri settings notification, canSuggestAppClips is: %@", (uint8_t *)&v14, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = WeakRetained;
  if ((v5 & 1) != 0)
    objc_msgSend(WeakRetained, "tryUpdatePredictionsDefaultIntervalWithReason:", 4);
  else
    objc_msgSend(WeakRetained, "forceUpdatePredictionsImmediatelyWithReason:", 4);

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateRecents");

}

uint64_t __80__ATXAppClipSettingsUpdateSource_registerSiriSettingsChangedNotificationHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSiriSettingsChangedNotification");
}

- (ATXAppClipSettingsUpdateSource)init
{
  ATXAppClipSettingsUpdateSource *v2;
  objc_class *v3;
  const char *Name;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXAppClipSettingsUpdateSource;
  v2 = -[ATXAppClipSettingsUpdateSource init](&v9, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(Name, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  -[ATXAppClipSettingsUpdateSource registerSiriSettingsChangedNotificationHandler](v2, "registerSiriSettingsChangedNotificationHandler");
  return v2;
}

- (void)registerSiriSettingsChangedNotificationHandler
{
  NSObject *queue;
  _QWORD handler[5];

  queue = self->_queue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __80__ATXAppClipSettingsUpdateSource_registerSiriSettingsChangedNotificationHandler__block_invoke;
  handler[3] = &unk_1E82DB9B0;
  handler[4] = self;
  notify_register_dispatch("com.apple.suggestions.settingsChanged", &self->_token, queue, handler);
}

- (ATXUpdatePredictionsDelegate)delegate
{
  return (ATXUpdatePredictionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
