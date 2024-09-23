@implementation AFSiriActivationCarPlayDeviceVoice

void __AFSiriActivationCarPlayDeviceVoice_block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setEvent:", 2);
  objc_msgSend(v4, "setSource:", 5);
  objc_msgSend(v4, "setDeviceID:", a1[4]);
  objc_msgSend(v4, "setUserInfo:", a1[5]);

}

@end
