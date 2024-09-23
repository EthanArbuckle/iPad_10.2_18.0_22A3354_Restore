@implementation ASDevice

uint64_t __18___ASDevice_isPad__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  isPad_isPad = (_DWORD)result == 3;
  return result;
}

void __24___ASDevice_deviceClass__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  deviceClass_deviceClass = objc_msgSend(v0, "deviceClass");

}

@end
