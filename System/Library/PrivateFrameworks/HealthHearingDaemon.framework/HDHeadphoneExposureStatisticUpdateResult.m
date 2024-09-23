@implementation HDHeadphoneExposureStatisticUpdateResult

+ (id)resultForEmptySamplesAdded
{
  return (id)objc_msgSend(a1, "_resultWithIncludedSeries:canTriggerNotification:", 1, 0);
}

+ (id)resultForAggregation
{
  return (id)objc_msgSend(a1, "_resultWithIncludedSeries:canTriggerNotification:", 1, 0);
}

+ (id)resultForSamplesAdded:(id)a3 includedSeries:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_resultWithIncludedSeries:samples:", a4, a3);
}

+ (id)resultForSamplesJournaled:(id)a3
{
  return (id)objc_msgSend(a1, "_resultWithIncludedSeries:samples:", 0, a3);
}

- (void)combineWithResult:(id)a3
{
  int v4;
  char v5;
  id v6;

  v6 = a3;
  v4 = -[HDHeadphoneExposureStatisticUpdateResult includedSeries](self, "includedSeries");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v6, "includedSeries");
  self->_includedSeries = v4;
  if (-[HDHeadphoneExposureStatisticUpdateResult canTriggerNotification](self, "canTriggerNotification"))
    v5 = 1;
  else
    v5 = objc_msgSend(v6, "canTriggerNotification");
  self->_canTriggerNotification = v5;

}

+ (id)_resultWithIncludedSeries:(BOOL)a3 samples:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hk_canTriggerHeadphoneExposureNotification", (_QWORD)v12) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(a1, "_resultWithIncludedSeries:canTriggerNotification:", v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_resultWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithIncludedSeries:canTriggerNotification:", a3, a4);
}

- (id)_initWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4
{
  HDHeadphoneExposureStatisticUpdateResult *v6;
  HDHeadphoneExposureStatisticUpdateResult *v7;
  HDHeadphoneExposureStatisticUpdateResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDHeadphoneExposureStatisticUpdateResult;
  v6 = -[HDHeadphoneExposureStatisticUpdateResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_includedSeries = a3;
    v6->_canTriggerNotification = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)includedSeries
{
  return self->_includedSeries;
}

- (BOOL)canTriggerNotification
{
  return self->_canTriggerNotification;
}

@end
