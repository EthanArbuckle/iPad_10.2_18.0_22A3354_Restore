@implementation HMIsCurrentProcessSPIEntitled

void __HMIsCurrentProcessSPIEntitled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  char v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D28688], "processInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.homekit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = v0;
  else
    v1 = 0;
  v2 = v1;

  v3 = objc_msgSend(v2, "BOOLValue");
  if ((v3 & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.homekit.private-spi-access"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v4 = objc_msgSend(v7, "BOOLValue");
  }
  HMIsCurrentProcessSPIEntitled_spiEntitled = v4;

}

@end
