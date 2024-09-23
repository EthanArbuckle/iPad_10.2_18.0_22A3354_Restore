@implementation HMRoom(HFDemoMode)

- (id)hf_demoModeAccessories
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HMRoom_HFDemoMode__hf_demoModeAccessories__block_invoke;
  v6[3] = &unk_1EA738D10;
  v6[4] = a1;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
