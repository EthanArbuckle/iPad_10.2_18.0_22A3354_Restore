@implementation HMDPowerLogObserverContext

- (HMDPowerLogObserverContext)initWithLogEventDispatcher:(id)a3 powerLogger:(id)a4
{
  id v6;
  id v7;
  HMDPowerLogObserverContext *v8;
  HMDPowerLogObserverContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMMIntervalMapper *homeConfigurationEventHistogram;
  void *v14;
  void *v15;
  uint64_t v16;
  HMMIntervalMapper *cameraConfigurationEventHistogram;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDPowerLogObserverContext;
  v8 = -[HMDPowerLogObserverContext init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_logEventDispatcher, v6);
    objc_storeWeak((id *)&v9->_powerLogger, v7);
    v10 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B32BB0, &unk_1E8B32BC8, &unk_1E8B32BE0, &unk_1E8B32BF8, &unk_1E8B32C10, &unk_1E8B32C28, &unk_1E8B32C40, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unsignedClosedOpenFixedIntervalMapper:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    homeConfigurationEventHistogram = v9->_homeConfigurationEventHistogram;
    v9->_homeConfigurationEventHistogram = (HMMIntervalMapper *)v12;

    v14 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B32BB0, &unk_1E8B32BC8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unsignedClosedOpenFixedIntervalMapper:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    cameraConfigurationEventHistogram = v9->_cameraConfigurationEventHistogram;
    v9->_cameraConfigurationEventHistogram = (HMMIntervalMapper *)v16;

  }
  return v9;
}

- (HMMIntervalMapper)homeConfigurationEventHistogram
{
  return self->_homeConfigurationEventHistogram;
}

- (HMMIntervalMapper)cameraConfigurationEventHistogram
{
  return self->_cameraConfigurationEventHistogram;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  return (HMMLogEventDispatching *)objc_loadWeakRetained((id *)&self->_logEventDispatcher);
}

- (HMFPowerLogger)powerLogger
{
  return (HMFPowerLogger *)objc_loadWeakRetained((id *)&self->_powerLogger);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_powerLogger);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
  objc_storeStrong((id *)&self->_cameraConfigurationEventHistogram, 0);
  objc_storeStrong((id *)&self->_homeConfigurationEventHistogram, 0);
}

@end
