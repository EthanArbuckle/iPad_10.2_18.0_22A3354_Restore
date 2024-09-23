@implementation EDListUnsubscribeHandler

- (EDListUnsubscribeHandler)init
{
  EDListUnsubscribeHandler *v2;
  uint64_t v3;
  EFScheduler *scheduler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDListUnsubscribeHandler;
  v2 = -[EDListUnsubscribeHandler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.ListUnsubscribeScheduler"), 17);
    v3 = objc_claimAutoreleasedReturnValue();
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFScheduler *)v3;

    v2->_detectorLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDListUnsubscribeHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_38 != -1)
    dispatch_once(&log_onceToken_38, block);
  return (id)log_log_38;
}

void __31__EDListUnsubscribeHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_38;
  log_log_38 = (uint64_t)v1;

}

- (EMListUnsubscribeDetector)detector
{
  os_unfair_lock_s *p_detectorLock;
  EMListUnsubscribeDetector *detector;
  EMListUnsubscribeDetector *v5;
  EMListUnsubscribeDetector *v6;
  EMListUnsubscribeDetector *v7;

  p_detectorLock = &self->_detectorLock;
  os_unfair_lock_lock(&self->_detectorLock);
  detector = self->_detector;
  if (!detector)
  {
    v5 = (EMListUnsubscribeDetector *)objc_alloc_init(MEMORY[0x1E0D1E1B0]);
    v6 = self->_detector;
    self->_detector = v5;

    detector = self->_detector;
  }
  v7 = detector;
  os_unfair_lock_unlock(p_detectorLock);
  return v7;
}

- (void)ignoreWithCommand:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDListUnsubscribeHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDListUnsubscribeHandler ignoreWithCommand:completion:]", "EDListUnsubscribeHandler.m", 45, "0");
}

- (void)unsubscribeWithCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isMailtoOperation"))
    -[EDListUnsubscribeHandler unsubscribeMailtoWithCommand:completion:](self, "unsubscribeMailtoWithCommand:completion:", v7, v6);
  else
    -[EDListUnsubscribeHandler unsubscribeHTMLWithCommand:timeout:completion:](self, "unsubscribeHTMLWithCommand:timeout:completion:", v7, v6, 15.0);

}

- (void)unsubscribeMailtoWithCommand:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDListUnsubscribeHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDListUnsubscribeHandler unsubscribeMailtoWithCommand:completion:]", "EDListUnsubscribeHandler.m", 57, "0");
}

- (void)unsubscribeHTMLWithCommand:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  EDListUnsubscribeHandler *v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  -[EDListUnsubscribeHandler scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke;
  v13[3] = &unk_1E949C750;
  v11 = v8;
  v17 = a4;
  v14 = v11;
  v15 = self;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "performBlock:", v13);

}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "postValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneClickURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EFPostUTF8FormData();
    v12 = 0;

    if (v12)
    {
      +[EDListUnsubscribeHandler log](EDListUnsubscribeHandler, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_1(v14, buf, v13);
      }
      goto LABEL_14;
    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "detector");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject acceptCommand:](v13, "acceptCommand:", *(_QWORD *)(a1 + 32));
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot perform HTML unsubscribe. url was nil: %d, postContent was nil: %d"), v3 == 0, v4 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "em_internalErrorWithReason:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[EDListUnsubscribeHandler log](EDListUnsubscribeHandler, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v12, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_2(v10, buf, v9);
  }

  if (!v12)
    goto LABEL_13;
LABEL_15:
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v12);

}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_detector, 0);
}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Error performing HTML unsubscribe: %{public}@", buf, 0xCu);

}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Error performing HTML unsubscribe: %{public}@", buf, 0xCu);

}

@end
