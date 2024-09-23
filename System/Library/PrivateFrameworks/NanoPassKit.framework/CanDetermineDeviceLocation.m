@implementation CanDetermineDeviceLocation

void ___CanDetermineDeviceLocation_block_invoke(uint64_t a1)
{
  int v2;
  char v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD v7[4];
  id v8;
  int v9;
  char v10;

  v2 = objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBFA88];
    PKPassKitCoreBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "authorizationStatusForBundle:", v5);

  }
  else
  {
    v6 = 2;
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___CanDetermineDeviceLocation_block_invoke_2;
  v7[3] = &unk_24CFEA9D0;
  v10 = v3;
  v9 = v6;
  v8 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t ___CanDetermineDeviceLocation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
