@implementation MFTaskAssertion

- (void)dealloc
{
  objc_super v3;

  -[MFTaskAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MFTaskAssertion;
  -[MFTaskAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");
  -[EFProcessTransaction invalidate](self->_transaction, "invalidate");
  -[MFTaskAssertion cancelTimer](self, "cancelTimer");
}

- (void)cancelTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (MFTaskAssertion)initWithName:(id)a3 expiration:(double)a4 preventIdleSleep:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  dispatch_source_t v22;
  void *v23;
  dispatch_time_t v24;
  NSObject *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v5 = a5;
  v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MFTaskAssertion;
  v9 = -[MFTaskAssertion init](&v32, sel_init);
  if (v9)
  {
    MFUserAgent();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isMaild");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v9 + 1);
      *((_QWORD *)v9 + 1) = v12;
    }
    else
    {
      MFUserAgent();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isMobileMail");

      if ((v15 & 1) != 0)
      {
LABEL_12:
        v26 = v9;
        goto LABEL_13;
      }
      if (v5)
        v16 = 3;
      else
        v16 = 7;
      v17 = objc_alloc(MEMORY[0x1E0CFE308]);
      v18 = getpid();
      v19 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke;
      v30[3] = &unk_1E4E8E4B0;
      v31 = v8;
      v20 = objc_msgSend(v17, "initWithPID:flags:reason:name:withHandler:", v18, v16, 10004, v31, v30);
      v21 = (void *)*((_QWORD *)v9 + 2);
      *((_QWORD *)v9 + 2) = v20;

      if (a4 > 0.0)
      {
        v22 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        v23 = (void *)*((_QWORD *)v9 + 3);
        *((_QWORD *)v9 + 3) = v22;

        v24 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
        dispatch_source_set_timer(*((dispatch_source_t *)v9 + 3), v24, 0xFFFFFFFFFFFFFFFFLL, 0);
        v25 = *((_QWORD *)v9 + 3);
        v28[0] = v19;
        v28[1] = 3221225472;
        v28[2] = __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke_5;
        v28[3] = &unk_1E4E88DC8;
        v29 = v9;
        dispatch_source_set_event_handler(v25, v28);
        dispatch_resume(*((dispatch_object_t *)v9 + 3));

      }
      v13 = v31;
    }

    goto LABEL_12;
  }
LABEL_13:

  return (MFTaskAssertion *)v9;
}

- (MFTaskAssertion)initWithName:(id)a3
{
  return -[MFTaskAssertion initWithName:expiration:preventIdleSleep:](self, "initWithName:expiration:preventIdleSleep:", a3, 0, 0.0);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MFTaskAssertion_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1)
    dispatch_once(&log_onceToken_32, block);
  return (id)log_log_32;
}

void __22__MFTaskAssertion_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;

}

void __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[MFTaskAssertion log](MFTaskAssertion, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      v7 = "Acquired task assertion: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    v7 = "could not aquire task assertion: %{public}@";
    goto LABEL_6;
  }

}

uint64_t __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (MFTaskAssertion)initWithName:(id)a3 preventIdleSleep:(BOOL)a4
{
  return -[MFTaskAssertion initWithName:expiration:preventIdleSleep:](self, "initWithName:expiration:preventIdleSleep:", a3, a4, 0.0);
}

- (BOOL)isValid
{
  return -[BKSProcessAssertion valid](self->_assertion, "valid");
}

@end
