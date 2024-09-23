@implementation AFSiriActivationBluetoothDeviceBoronSignal

void __AFSiriActivationBluetoothDeviceBoronSignal_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setEvent:", 6);
  objc_msgSend(v4, "setSource:", 4);
  objc_msgSend(v4, "setDeviceID:", *(_QWORD *)(a1 + 32));
  v7 = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v6);

}

@end
