@implementation WFBluetoothDeviceFilterDevicesMatchingType

uint64_t __WFBluetoothDeviceFilterDevicesMatchingType_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 == 2)
  {
    if ((objc_msgSend(v3, "featureCapability:", 16) & 1) == 0)
    {
      v6 = objc_msgSend(v4, "featureCapability:", 17);
      goto LABEL_8;
    }
  }
  else if (v5 == 1 && (objc_msgSend(v3, "isServiceSupported:", 16) & 1) == 0)
  {
    v6 = objc_msgSend(v4, "isServiceSupported:", 1);
LABEL_8:
    v7 = v6;
    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

@end
