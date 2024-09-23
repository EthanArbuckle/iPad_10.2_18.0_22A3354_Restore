@implementation AFSiriActivationBluetoothDeviceDoubleTap

void __AFSiriActivationBluetoothDeviceDoubleTap_block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setEvent:", 1);
  objc_msgSend(v4, "setSource:", 4);
  objc_msgSend(v4, "setDeviceID:", a1[4]);
  objc_msgSend(v4, "setUserInfo:", a1[5]);

}

uint64_t __AFSiriActivationBluetoothDeviceDoubleTap_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
