@implementation HMCharacteristicThresholdRangeEvent(HREAdditions)

- (id)hre_triggeringValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "validValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__HMCharacteristicThresholdRangeEvent_HREAdditions__hre_triggeringValues__block_invoke;
  v7[3] = &unk_24F218EF8;
  v7[4] = a1;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
