@implementation NTKHeartRateModel

- (NTKHeartRateModel)initWithDelegate:(id)a3
{
  id v4;
  NTKHeartRateModel *v5;
  NTKHeartRateModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKHeartRateModel;
  v5 = -[NTKHeartRateModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)manager:(id)a3 receivedLatestHeartRateSample:(id)a4
{
  HKQuantitySample *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  HKQuantitySample *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (HKQuantitySample *)a4;
  if (self->_mostRecentHeartRate != v6)
  {
    objc_storeStrong((id *)&self->_mostRecentHeartRate, a4);
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = (id)objc_opt_class();
      v12 = 2112;
      v13 = v6;
      v8 = v11;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: updated heart rate %@", (uint8_t *)&v10, 0x16u);

    }
    -[NTKHeartRateModel delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model:updatedSample:", self, v6);

  }
}

- (NTKHeartRateModelDelegate)delegate
{
  return (NTKHeartRateModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HKQuantitySample)mostRecentHeartRate
{
  return self->_mostRecentHeartRate;
}

- (void)setMostRecentHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentHeartRate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentHeartRate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
