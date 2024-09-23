@implementation FSMessageReceiverDelegateWrapper

- (FSMessageReceiverDelegateWrapper)initWithDelegate:(id)a3 Locale:(id)a4 preferredLanguages:(id)a5
{
  id v9;
  id v10;
  id v11;
  FSMessageReceiverDelegateWrapper *v12;
  FSMessageReceiverDelegateWrapper *v13;
  NSLocale *v14;
  NSLocale *locale;
  NSArray *v16;
  void *preferredLanguages;
  uint64_t v18;
  NSArray *v19;
  NSError *completedError;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)FSMessageReceiverDelegateWrapper;
  v12 = -[FSMessageReceiverDelegateWrapper init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a3);
    if (v10)
    {
      v14 = (NSLocale *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v14 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    }
    locale = v13->_locale;
    v13->_locale = v14;

    if (v11 && objc_msgSend(v11, "count"))
    {
      v16 = (NSArray *)v11;
      preferredLanguages = v13->_preferredLanguages;
      v13->_preferredLanguages = v16;
    }
    else
    {
      -[NSLocale languageCode](v13->_locale, "languageCode");
      preferredLanguages = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = preferredLanguages;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v13->_preferredLanguages;
      v13->_preferredLanguages = (NSArray *)v18;

    }
    *(_WORD *)&v13->_hasCompleted = 0;
    completedError = v13->_completedError;
    v13->_completedError = 0;

  }
  return v13;
}

- (void)getLocalizationSetup:(id)a3
{
  (*((void (**)(id, NSLocale *, NSArray *, _QWORD))a3 + 2))(a3, self->_locale, self->_preferredLanguages, 0);
}

- (void)completed:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__FSMessageReceiverDelegateWrapper_completed_reply___block_invoke;
  v8[3] = &unk_250C31D38;
  v9 = v6;
  v7 = v6;
  -[FSMessageReceiverDelegateWrapper completed:replyHandler:](self, "completed:replyHandler:", a3, v8);

}

uint64_t __52__FSMessageReceiverDelegateWrapper_completed_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v7;
  FSMessageReceiverDelegateWrapper *v8;
  _BOOL4 hasCompleted;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  hasCompleted = v8->_hasCompleted;
  if (!v8->_hasCompleted)
    v8->_hasCompleted = 1;
  if (!v8->_hasStarted)
  {
    objc_storeStrong((id *)&v8->_completedError, a3);
    objc_sync_exit(v8);

    if (!hasCompleted)
      goto LABEL_9;
LABEL_8:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_9;
  }
  objc_sync_exit(v8);

  if (hasCompleted)
    goto LABEL_8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FSTaskMessageOperations completed:replyHandler:](v8->_delegate, "completed:replyHandler:", v10, v7);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FSTaskMessageOperations completed:reply:](v8->_delegate, "completed:reply:", v10, v7);
  }
LABEL_9:

}

- (void)didStart
{
  FSMessageReceiverDelegateWrapper *v2;
  _BOOL4 hasCompleted;

  v2 = self;
  objc_sync_enter(v2);
  v2->_hasStarted = 1;
  hasCompleted = v2->_hasCompleted;
  objc_sync_exit(v2);

  if (hasCompleted)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[FSTaskMessageOperations completed:reply:](v2->_delegate, "completed:reply:", v2->_completedError, &__block_literal_global);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[FSTaskMessageOperations completed:replyHandler:](v2->_delegate, "completed:replyHandler:", v2->_completedError, &__block_literal_global_6);
    }
  }
}

- (void)logMessage:(id)a3
{
  -[FSTaskMessageOperations logMessage:](self->_delegate, "logMessage:", a3);
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  -[FSTaskMessageOperations prompt:replyHandler:](self->_delegate, "prompt:replyHandler:", a3, a4);
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  -[FSTaskMessageOperations promptTrueFalse:replyHandler:](self->_delegate, "promptTrueFalse:replyHandler:", a3, a4);
}

- (FSTaskMessageOperations)delegate
{
  return (FSTaskMessageOperations *)objc_getProperty(self, a2, 16, 1);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (NSError)completedError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletedError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedError, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
