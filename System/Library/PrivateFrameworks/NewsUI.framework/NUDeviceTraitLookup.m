@implementation NUDeviceTraitLookup

void __NUDeviceTraitLookup_block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  NUDeviceTrait *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  switch(v6)
  {
    case -1:
    case 2:
    case 3:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __NUDeviceTraitLookup_block_invoke_cold_2();
      goto LABEL_6;
    case 0:
      if (v2 >= v4)
        v8 = v2;
      else
        v8 = v4;
      v9 = 64;
      if (v8 < 568.0)
        v9 = 65;
      if (v8 <= 568.0)
        v9 |= 2uLL;
      v7 = v9 | 4;
      if (v8 <= 736.0)
      {
        if (v8 <= 667.0)
          v9 |= 4uLL;
        v7 = v9 | 8;
      }
      break;
    case 1:
      if (v2 >= v4)
        v10 = v2;
      else
        v10 = v4;
      if (v10 == 1366.0)
        v7 = 112;
      else
        v7 = 80;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __NUDeviceTraitLookup_block_invoke_cold_1();
LABEL_6:
      v7 = 64;
      break;
  }
  v11 = -[NUDeviceTrait initWithDeviceTraitSize:]([NUDeviceTrait alloc], "initWithDeviceTraitSize:", v7);
  v12 = (void *)NUDeviceTraitLookup_deviceTrait;
  NUDeviceTraitLookup_deviceTrait = (uint64_t)v11;

}

void __NUDeviceTraitLookup_block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Case not implemented"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216817000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

void __NUDeviceTraitLookup_block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Case not implemented"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216817000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

@end
