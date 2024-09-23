@implementation AFSiriActivationBluetoothDeviceTriggerless

void __AFSiriActivationBluetoothDeviceTriggerless_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = a2;
  v6 = v5;
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
  {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v5 = v6;
  }
  objc_msgSend(v5, "setTimestamp:", v3 - (unint64_t)(v4 * 1000000000.0 / *(double *)&_AFMachAbsoluteTimeRate_rate));
  objc_msgSend(v6, "setEvent:", 10);
  objc_msgSend(v6, "setSource:", 4);
  objc_msgSend(v6, "setDeviceID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setUserInfo:", *(_QWORD *)(a1 + 40));

}

@end
