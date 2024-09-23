@implementation LACDTOLocationPrewarmStrategy

- (LACDTOLocationPrewarmStrategy)initWithFeatureStateProvider:(id)a3 trustStateProvider:(id)a4 device:(id)a5 keybag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LACDTOLocationPrewarmStrategy *v15;
  LACDTOLocationPrewarmStrategy *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LACDTOLocationPrewarmStrategy;
  v15 = -[LACDTOLocationPrewarmStrategy init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureStateProvider, a3);
    objc_storeStrong((id *)&v16->_trustStateProvider, a4);
    objc_storeStrong((id *)&v16->_device, a5);
    objc_storeStrong((id *)&v16->_keybag, a6);
  }

  return v16;
}

- (void)checkNeedsPrewarmWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  LACDTOFeatureStateProviding *featureStateProvider;
  NSObject *v6;
  const char *v7;
  _QWORD v8[4];
  void (**v9)(id, _QWORD);
  id v10;
  id location[2];

  v4 = (void (**)(id, _QWORD))a3;
  if (-[LACKeyBag state](self->_keybag, "state") != 5)
  {
    LACLogDTOLocation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v7 = "Prewarm skipped because keybag is not unlocked";
LABEL_8:
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)location, 2u);
    }
LABEL_9:

    v4[2](v4, 0);
    goto LABEL_10;
  }
  if ((-[LACDTODeviceSetupInfoProvider hasCompletedSetup](self->_device, "hasCompletedSetup") & 1) == 0)
  {
    LACLogDTOLocation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v7 = "Prewarm skipped because device has not finished setup";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_initWeak(location, self);
  featureStateProvider = self->_featureStateProvider;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke;
  v8[3] = &unk_2510C0BC0;
  objc_copyWeak(&v10, location);
  v9 = v4;
  -[LACDTOFeatureStateProviding fetchStateWithCompletion:](featureStateProvider, "fetchStateWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(location);
LABEL_10:

}

void __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  const char *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
    {
      if (!objc_msgSend(v3, "isStrictModeEnabled"))
      {
        v7 = (void *)WeakRetained[2];
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke_1;
        v8[3] = &unk_2510C0B98;
        objc_copyWeak(&v10, (id *)(a1 + 40));
        v9 = *(id *)(a1 + 32);
        objc_msgSend(v7, "fetchSensorTrustStateWithCompletion:", v8);

        objc_destroyWeak(&v10);
        goto LABEL_11;
      }
      LACLogDTOLocation();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v6 = "Prewarm skipped because strict mode is enabled";
    }
    else
    {
      LACLogDTOLocation();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      v6 = "Prewarm skipped because feature is disabled";
    }
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_9;
  }
LABEL_11:

}

void __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void (*v5)(void);
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((objc_msgSend(v3, "isDisapproved") & 1) != 0)
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      LACLogDTOLocation();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Prewarm skipped because sensor is trusted", v7, 2u);
      }

      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v5();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
  objc_storeStrong((id *)&self->_featureStateProvider, 0);
}

@end
