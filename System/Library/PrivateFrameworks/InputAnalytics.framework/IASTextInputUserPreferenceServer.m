@implementation IASTextInputUserPreferenceServer

- (IASTextInputUserPreferenceServer)initWithEventHandler:(id)a3
{
  id v4;
  IASTextInputUserPreferenceServer *v5;
  void *v6;
  id eventHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IASTextInputUserPreferenceServer;
  v5 = -[IASTextInputUserPreferenceServer init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    eventHandler = v5->_eventHandler;
    v5->_eventHandler = v6;

    v5->_readyToReportPreferenceToEventHandler = 0;
  }

  return v5;
}

- (IASTextInputUserPreferenceServer)init
{
  uint64_t v2;
  uint64_t v3;

  return (IASTextInputUserPreferenceServer *)objc_msgSend_initWithEventHandler_(self, a2, (uint64_t)&unk_250F8F298, v2, v3);
}

- (void)dispatchUserPreference:(int64_t)a3 withValue:(int64_t)a4
{
  uint64_t v4;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  IASTextInputUserPreferenceStateEvent *v26;

  if (objc_msgSend_readyToReportPreferenceToEventHandler(self, a2, a3, a4, v4))
  {
    v26 = objc_alloc_init(IASTextInputUserPreferenceStateEvent);
    sub_23F08DF00(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreferenceName_(v26, v9, (uint64_t)v8, v10, v11);

    objc_msgSend_setPreferenceValue_(v26, v12, a4, v13, v14);
    objc_msgSend_eventHandler(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dispatchEvent_(v26, v20, (uint64_t)v19, v21, v22);

    objc_msgSend_setReadyToReportPreferenceToEventHandler_(self, v23, 0, v24, v25);
  }
}

- (void)reportStateForUserPreference:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;

  objc_msgSend_setReadyToReportPreferenceToEventHandler_(self, a2, 0, v3, v4);
  sub_23F0972AC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_23F0A0298(a3, v6);

}

- (int64_t)retrieveStandardBooleanPreference:(id)a3
{
  return 0;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)readyToReportPreferenceToEventHandler
{
  return self->_readyToReportPreferenceToEventHandler;
}

- (void)setReadyToReportPreferenceToEventHandler:(BOOL)a3
{
  self->_readyToReportPreferenceToEventHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
