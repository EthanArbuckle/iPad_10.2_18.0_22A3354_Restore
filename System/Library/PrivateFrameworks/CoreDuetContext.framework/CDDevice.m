@implementation CDDevice

void __24___CDDevice_localDevice__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  _CDDevice *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v1, "integerValue");
    if ((unint64_t)(v2 - 1) > 6)
      v3 = -1;
    else
      v3 = qword_18DDA72D0[v2 - 1];
    _block_invoke_deviceClass = v3;
    CFRelease(v1);

  }
  v4 = [_CDDevice alloc];
  v5 = -[_CDDevice initWithName:deviceID:deviceClass:model:companion:](v4, "initWithName:deviceID:deviceClass:model:companion:", &stru_1E26D6BC0, CFSTR("LOCAL"), _block_invoke_deviceClass, 0, 0);
  v6 = (void *)localDevice_localDevice;
  localDevice_localDevice = v5;

}

@end
