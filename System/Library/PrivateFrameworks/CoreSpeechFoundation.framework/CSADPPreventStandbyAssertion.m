@implementation CSADPPreventStandbyAssertion

- (CSADPPreventStandbyAssertion)initWithName:(id)a3 clientQueue:(id)a4
{
  id v7;
  id v8;
  CSADPPreventStandbyAssertion *v9;
  id *p_isa;
  CSADPPreventStandbyAssertion *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (+[CSUtils deviceRequirePreventStandbyAssertion](CSUtils, "deviceRequirePreventStandbyAssertion"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CSADPPreventStandbyAssertion;
    v9 = -[CSADPPreventStandbyAssertion init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_name, a3);
      objc_storeWeak(p_isa + 3, v8);
      objc_msgSend(p_isa, "_setupADPAssertion:", v7);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setupADPAssertion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id location;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_adpAssertion)
  {
    ADPAssertionDestroy();
    self->_adpAssertion = 0;
  }
  self->_adpAssertion = (ADPAssertion *)ADPAssertionCreateWithDispatchQueue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  v5 = v4;
  ADPAssertionSetCancelHandler();
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSADPPreventStandbyAssertion _setupADPAssertion:]";
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Taking ADP assertion %{public}@ for darwinOS", buf, 0x16u);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_adpAssertion)
  {
    ADPAssertionDestroy();
    self->_adpAssertion = 0;
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSADPPreventStandbyAssertion dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Destroyed ADP assertion for darwinOS", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSADPPreventStandbyAssertion;
  -[CSADPPreventStandbyAssertion dealloc](&v4, sel_dealloc);
}

- (ADPAssertion)adpAssertion
{
  return self->_adpAssertion;
}

- (void)setAdpAssertion:(ADPAssertion *)a3
{
  self->_adpAssertion = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_clientQueue);
}

- (void)setClientQueue:(id)a3
{
  objc_storeWeak((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientQueue);
  objc_storeStrong((id *)&self->_name, 0);
}

void __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke_2;
  v5[3] = &unk_1E6880E88;
  v6 = *(id *)(a1 + 32);
  v7 = WeakRetained;
  v4 = WeakRetained;
  dispatch_async(v3, v5);

}

uint64_t __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[CSADPPreventStandbyAssertion _setupADPAssertion:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s appledisplayplatformd is lost, reset ADP assertion for %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setupADPAssertion:", *(_QWORD *)(a1 + 32));
}

@end
