@implementation NPKDeviceWithPairingID

uint64_t __NPKDeviceWithPairingID_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
