@implementation LACKeyBagStateProviderMKBAdapter

- (LACKeyBagStateProviderMKBAdapter)initWithUserId:(unsigned int)a3
{
  LACKeyBagStateProviderMKBAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACKeyBagStateProviderMKBAdapter;
  result = -[LACKeyBagStateProviderMKBAdapter init](&v5, sel_init);
  if (result)
    result->_userId = a3;
  return result;
}

- (int64_t)state
{
  void *v2;
  int v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("DeviceHandle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_userId);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = MKBGetDeviceLockState();

  if ((v3 + 8) > 0xB)
    return 0;
  else
    return qword_240A7BDA8[v3 + 8];
}

@end
