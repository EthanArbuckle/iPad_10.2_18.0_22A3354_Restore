@implementation ARUIRingGroup(Activity)

- (void)setIsStandalonePhoneFitnessMode:()Activity animated:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "rings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "count");
  _os_log_fault_impl(&dword_212DE7000, a2, OS_LOG_TYPE_FAULT, "-[ARUIRingGroup configureForIsStandalonePhoneFitnessMode:animated:completion:] unexpectedly called for ARUIRingGroup with %lu rings", (uint8_t *)&v4, 0xCu);

}

@end
