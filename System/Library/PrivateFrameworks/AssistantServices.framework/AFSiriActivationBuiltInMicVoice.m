@implementation AFSiriActivationBuiltInMicVoice

void __AFSiriActivationBuiltInMicVoice_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setEvent:", 2);
  objc_msgSend(v4, "setSource:", 1);
  objc_msgSend(v4, "setUserInfo:", *(_QWORD *)(a1 + 32));

}

@end
