@implementation ARDeviceIsiPad

void __ARDeviceIsiPad_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  s_deviceIsiPad = objc_msgSend(v0, "integerValue") == 3;

}

@end
