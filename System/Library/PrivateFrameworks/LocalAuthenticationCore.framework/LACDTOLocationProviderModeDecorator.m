@implementation LACDTOLocationProviderModeDecorator

- (LACDTOLocationProviderModeDecorator)initWithLocationProvider:(id)a3 featureController:(id)a4
{
  id v7;
  id v8;
  LACDTOLocationProviderModeDecorator *v9;
  LACDTOLocationProviderModeDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLocationProviderModeDecorator;
  v9 = -[LACDTOLocationProviderModeDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_featureController, a4);
  }

  return v10;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__LACDTOLocationProviderModeDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v6[3] = &unk_2510C2278;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LACDTOLocationProviderModeDecorator _checkIsFeatureStrictModeEnabledWithCompletion:](self, "_checkIsFeatureStrictModeEnabledWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __79__LACDTOLocationProviderModeDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      +[LACDTOLocationState strictLocationState](LACDTOLocationState, "strictLocationState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LACLogDTOLocation();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543618;
        v9 = v5;
        v10 = 2112;
        v11 = v6;
        _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will use strict mode value %@", (uint8_t *)&v8, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained[1], "checkIsInFamiliarLocationWithCompletion:", *(_QWORD *)(a1 + 32));
    }
  }

}

- (void)_checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4;
  LACDTOFeatureControlling *featureController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  featureController = self->_featureController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__LACDTOLocationProviderModeDecorator__checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2510C0BE8;
  v8 = v4;
  v6 = v4;
  -[LACDTOFeatureControlling checkIsFeatureStrictModeEnabledWithCompletion:](featureController, "checkIsFeatureStrictModeEnabledWithCompletion:", v7);

}

uint64_t __86__LACDTOLocationProviderModeDecorator__checkIsFeatureStrictModeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureController, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
