@implementation NTKHeartRateSignatureRectangularModel

- (void)manager:(id)a3 receivedLatestHeartRateSummary:(id)a4
{
  HKHeartRateSummary *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (HKHeartRateSummary *)a4;
  if (self->_mostRecentHeartRateSummary != v6)
  {
    objc_storeStrong((id *)&self->_mostRecentHeartRateSummary, a4);
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      -[HKHeartRateSummary heartRateDateInterval](v6, "heartRateDateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: updated heart rate summary %{public}@", (uint8_t *)&v12, 0x16u);

    }
    -[NTKHeartRateModel delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model:updatedSummary:", self, v6);

  }
}

- (HKHeartRateSummary)mostRecentHeartRateSummary
{
  return self->_mostRecentHeartRateSummary;
}

- (void)setMostRecentHeartRateSummary:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentHeartRateSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentHeartRateSummary, 0);
}

@end
