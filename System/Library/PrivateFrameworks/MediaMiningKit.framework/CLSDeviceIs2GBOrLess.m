@implementation CLSDeviceIs2GBOrLess

void __CLSDeviceIs2GBOrLess_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CLSDeviceIs2GBOrLess_sDeviceIs2GBOrLess = (unint64_t)objc_msgSend(v0, "physicalMemory") < 0x80000001;

}

@end
