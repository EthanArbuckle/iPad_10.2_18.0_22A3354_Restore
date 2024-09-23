@implementation LACUNManagerSetUpDecorator

- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3
{
  id v4;
  void *v5;
  LACUNManagerSetUpDecorator *v6;

  v4 = a3;
  +[LACSetUpStateProvider sharedInstance](LACSetUpStateProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACUNManagerSetUpDecorator initWithManagerBuilder:setupStateProvider:](self, "initWithManagerBuilder:setupStateProvider:", v4, v5);

  return v6;
}

- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3 setupStateProvider:(id)a4
{
  id v6;
  id v7;
  LACUNManagerSetUpDecorator *v8;
  void *v9;
  id responderBuilder;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACUNManagerSetUpDecorator;
  v8 = -[LACUNManagerSetUpDecorator init](&v12, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    responderBuilder = v8->_responderBuilder;
    v8->_responderBuilder = v9;

    objc_storeStrong((id *)&v8->_setupStateProvider, a4);
  }

  return v8;
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = (void (**)(id, void *))a3;
  -[LACUNManagerSetUpDecorator responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancelAllNotificationsWithCompletion:", v4);
  }
  else
  {
    LACLogNotifications();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    if (v4)
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Service not available in Setup"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v15);

    }
  }

}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[LACUNManagerSetUpDecorator responder](self, "responder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "cancelNotificationsWithIdentifiers:scheduledOnly:completion:", v8, v6, v9);
  }
  else
  {
    LACLogNotifications();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    if (v9)
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Service not available in Setup"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v20);

    }
  }

}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[LACUNManagerSetUpDecorator responder](self, "responder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "postNotification:completion:", v6, v7);
  }
  else
  {
    LACLogNotifications();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    if (v7)
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Service not available in Setup"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v18);

    }
  }

}

- (LACUNManagerDelegate)delegate
{
  return (LACUNManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  LACUNManagerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[LACUNManager setDelegate:](self->_responder, "setDelegate:", v5);

}

- (id)responder
{
  LACUNManager *responder;
  LACUNManager *v4;
  LACUNManager *v5;
  LACUNManager *v6;
  LACUNManager *v7;
  void *v8;

  if (-[LACSetUpStateProvider hasCompletedSetup](self->_setupStateProvider, "hasCompletedSetup"))
  {
    responder = self->_responder;
    if (responder)
    {
      v4 = responder;
    }
    else
    {
      (*((void (**)(void))self->_responderBuilder + 2))();
      v4 = (LACUNManager *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_responder;
    self->_responder = v4;

    v7 = self->_responder;
    -[LACUNManagerSetUpDecorator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUNManager setDelegate:](v7, "setDelegate:", v8);

    v5 = self->_responder;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupStateProvider, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong(&self->_responderBuilder, 0);
}

- (void)cancelAllNotificationsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2409DC000, a1, a3, "Cannot interact with UserNotifications at the moment.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
