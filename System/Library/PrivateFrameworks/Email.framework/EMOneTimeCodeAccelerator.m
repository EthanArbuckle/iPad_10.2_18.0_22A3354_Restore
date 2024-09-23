@implementation EMOneTimeCodeAccelerator

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EMOneTimeCodeAccelerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1)
    dispatch_once(&log_onceToken_29, block);
  return (id)log_log_29;
}

void __31__EMOneTimeCodeAccelerator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;

}

- (EMOneTimeCodeAccelerator)initWithUpdateBlock:(id)a3
{
  id v4;
  EMDaemonInterface *v5;
  EMOneTimeCodeAccelerator *v6;

  v4 = a3;
  v5 = objc_alloc_init(EMDaemonInterface);
  v6 = -[EMOneTimeCodeAccelerator initWithDaemonInterface:updateBlock:](self, "initWithDaemonInterface:updateBlock:", v5, v4);

  return v6;
}

- (EMOneTimeCodeAccelerator)initWithDaemonInterface:(id)a3 updateBlock:(id)a4
{
  id v7;
  id v8;
  EMOneTimeCodeAccelerator *v9;
  EMOneTimeCodeAccelerator *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *oneTimeCodeQueue;
  uint64_t v15;
  id updateBlock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EMOneTimeCodeAccelerator;
  v9 = -[EMOneTimeCodeAccelerator init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonInterface, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.email.EMOneTimeCodeAccelerator.oneTimeCodeQueue", v12);
    oneTimeCodeQueue = v10->_oneTimeCodeQueue;
    v10->_oneTimeCodeQueue = (OS_dispatch_queue *)v13;

    v15 = MEMORY[0x1BCCC8C10](v8);
    updateBlock = v10->_updateBlock;
    v10->_updateBlock = (id)v15;

    -[EMOneTimeCodeAccelerator startObservingOneTimeCode](v10, "startObservingOneTimeCode");
  }

  return v10;
}

- (void)startObservingOneTimeCode
{
  void *v3;
  void *v4;
  id v5;

  -[EMOneTimeCodeAccelerator daemonInterface](self, "daemonInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startObservingOneTimeCodes:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMOneTimeCodeAccelerator setCancelable:](self, "setCancelable:", v4);

}

- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7 observers:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  EMOneTimeCodeAccelerator *v28;
  int64_t v29;
  unint64_t v30;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  -[EMOneTimeCodeAccelerator oneTimeCodeQueue](self, "oneTimeCodeQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__EMOneTimeCodeAccelerator_didReceiveOneTimeCode_timestamp_messageID_subject_senders_observers___block_invoke;
  block[3] = &unk_1E70F5478;
  v24 = v16;
  v25 = v17;
  v26 = v14;
  v27 = v15;
  v29 = a5;
  v30 = a8;
  v28 = self;
  v19 = v15;
  v20 = v14;
  v21 = v17;
  v22 = v16;
  dispatch_async(v18, block);

}

void __96__EMOneTimeCodeAccelerator_didReceiveOneTimeCode_timestamp_messageID_subject_senders_observers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringFromArray:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v10 = 138413570;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2048;
    v19 = v7;
    v20 = 2048;
    v21 = v8;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "Received one-time code subject: %@, sender: %@, data: %@, timestamp: %@, GlobalMessageID: %lld, Current Observers: %lu", (uint8_t *)&v10, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 64), "updateBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9[2](v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

}

- (void)didEnterOneTimeCodeField
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (_os_feature_enabled_impl())
  {
    +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "One Time Code field has been entered.", buf, 2u);
    }

    -[EMOneTimeCodeAccelerator daemonInterface](self, "daemonInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performFetchForOTC");

    +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "Start fetching email with One Time Code", v7, 2u);
    }

  }
}

- (void)didExitOneTimeCodeField
{
  NSObject *v2;
  uint8_t v3[16];

  if (_os_feature_enabled_impl())
  {
    +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "One Time Code field has been exited.", v3, 2u);
    }

  }
}

- (void)didFillOneTimeCode:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "One Time Code from message with GlobalMessageID: %lld was added to text field", (uint8_t *)&v6, 0xCu);
    }

    -[EMOneTimeCodeAccelerator deleteOneTimeCodeEmails:](self, "deleteOneTimeCodeEmails:", a3);
  }
}

- (void)deleteOneTimeCodeEmails:(int64_t)a3
{
  EMMessageObjectID *v5;
  void *v6;
  EMMessageObjectID *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = [EMMessageObjectID alloc];
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMMessageObjectID initWithGlobalMessageID:mailboxScope:](v5, "initWithGlobalMessageID:mailboxScope:", a3, v6);

  -[EMOneTimeCodeAccelerator daemonInterface](self, "daemonInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageRepository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performOneTimeCodeMessageDeletionWithObjectID:afterDelay:", v7, 0.0);

  +[EMOneTimeCodeAccelerator log](EMOneTimeCodeAccelerator, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "Used one-time code email with GlobalMessageID %lld is moved to the trash folder", (uint8_t *)&v11, 0xCu);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EMOneTimeCodeAccelerator cancelable](self, "cancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)EMOneTimeCodeAccelerator;
  -[EMOneTimeCodeAccelerator dealloc](&v4, sel_dealloc);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (EFCancelable)cancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCancelable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)oneTimeCodeQueue
{
  return self->_oneTimeCodeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimeCodeQueue, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

@end
