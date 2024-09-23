@implementation HKQuantitySample(HeadphoneSevenDayDose)

- (uint64_t)hk_canTriggerHeadphoneExposureNotification
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 173)
    return 0;
  if (+[HKHearingFeatures unitTesting_simulateLocalHeadphonePlayback](HKHearingFeatures, "unitTesting_simulateLocalHeadphonePlayback"))
  {
    return 1;
  }
  objc_msgSend(a1, "sourceRevision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = objc_msgSend(v8, "_isLocalDevice");
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HKQuantitySample(HeadphoneSevenDayDose) hk_canTriggerHeadphoneExposureNotification].cold.1(v9, a2);
    v6 = 1;
  }

  return v6;
}

- (void)hk_canTriggerHeadphoneExposureNotification
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_2175BF000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] missing source, defaulting to YES", (uint8_t *)&v5, 0xCu);

}

@end
