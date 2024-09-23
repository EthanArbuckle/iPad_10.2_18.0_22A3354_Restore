void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2(void *a1, const char *a2)
{
  return objc_msgSend(a1, "cStringUsingEncoding:", 4);
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextDescriptor(const IOUSBDescriptorHeader *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  uint8_t *v2;
  uint64_t v3;
  unint64_t bLength;
  const IOUSBDescriptorHeader *v5;

  if (configurationDescriptor)
  {
    if (currentDescriptor)
    {
      if (currentDescriptor >= configurationDescriptor
        && (v2 = &configurationDescriptor->bLength + *(_WORD *)&configurationDescriptor[1],
            v2 >= (uint8_t *)currentDescriptor))
      {
        bLength = currentDescriptor->bLength;
        if ((char *)currentDescriptor + bLength >= (char *)v2)
          v5 = 0;
        else
          v5 = (const IOUSBDescriptorHeader *)((char *)currentDescriptor + bLength);
        if (bLength >= 2)
          return v5;
        else
          return 0;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      v3 = configurationDescriptor->bLength;
      if (*(_WORD *)&configurationDescriptor[1] > v3)
        return (const IOUSBDescriptorHeader *)((char *)configurationDescriptor + v3);
      else
        return 0;
    }
  }
  return configurationDescriptor;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextDescriptorWithType(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  int v3;
  const IOUSBDescriptorHeader *result;

  v3 = type;
  do
  {
    result = IOUSBGetNextDescriptor(configurationDescriptor, currentDescriptor);
    currentDescriptor = result;
  }
  while (result && result->bDescriptorType != v3);
  return result;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  const IOUSBDescriptorHeader *result;
  char *v5;
  unint64_t bLength;
  uint8_t *v7;
  const IOUSBDescriptorHeader *v8;
  const IOUSBDescriptorHeader *v9;
  int bDescriptorType;
  const IOUSBDescriptorHeader *Descriptor;

  result = 0;
  if (!configurationDescriptor || !parentDescriptor)
    return result;
  if (currentDescriptor)
  {
    if (currentDescriptor >= (const IOUSBDescriptorHeader *)configurationDescriptor)
    {
      v5 = (char *)(&configurationDescriptor->bLength + configurationDescriptor->wTotalLength);
      if (v5 >= (char *)currentDescriptor)
      {
        bLength = currentDescriptor->bLength;
        v7 = &currentDescriptor->bLength + bLength;
LABEL_11:
        if (v7 >= (uint8_t *)v5)
          v9 = 0;
        else
          v9 = (const IOUSBDescriptorHeader *)v7;
        if (bLength >= 2)
          v8 = v9;
        else
          v8 = 0;
        goto LABEL_17;
      }
    }
  }
  else if (parentDescriptor >= (const IOUSBDescriptorHeader *)configurationDescriptor)
  {
    v5 = (char *)(&configurationDescriptor->bLength + configurationDescriptor->wTotalLength);
    if (v5 >= (char *)parentDescriptor)
    {
      bLength = parentDescriptor->bLength;
      v7 = &parentDescriptor->bLength + bLength;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_17:
  bDescriptorType = parentDescriptor->bDescriptorType;
  do
  {
    Descriptor = IOUSBGetNextDescriptor(configurationDescriptor, parentDescriptor);
    parentDescriptor = Descriptor;
  }
  while (Descriptor && Descriptor->bDescriptorType != bDescriptorType);
  if (Descriptor <= v8)
    return 0;
  else
    return v8;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptorWithType(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  const IOUSBDescriptorHeader *result;
  const IOUSBDescriptorHeader *v6;
  int v7;
  const IOUSBDescriptorHeader *v8;
  const IOUSBDescriptorHeader *Descriptor;
  const IOUSBDescriptorHeader *v10;
  int bDescriptorType;
  const IOUSBDescriptorHeader *v12;

  result = 0;
  if (configurationDescriptor)
  {
    v6 = parentDescriptor;
    if (parentDescriptor)
    {
      v7 = type;
      v8 = currentDescriptor;
      if (currentDescriptor)
      {
        do
        {
          Descriptor = IOUSBGetNextDescriptor(configurationDescriptor, v8);
          v8 = Descriptor;
        }
        while (Descriptor && Descriptor->bDescriptorType != v7);
      }
      else
      {
        v8 = parentDescriptor;
        do
        {
          v10 = IOUSBGetNextDescriptor(configurationDescriptor, v8);
          v8 = v10;
        }
        while (v10 && v10->bDescriptorType != v7);
      }
      bDescriptorType = v6->bDescriptorType;
      do
      {
        v12 = IOUSBGetNextDescriptor(configurationDescriptor, v6);
        v6 = v12;
      }
      while (v12 && v12->bDescriptorType != bDescriptorType);
      if (v12 > v8 || v12 == 0)
        return v8;
      else
        return 0;
    }
  }
  return result;
}

const IOUSBInterfaceAssociationDescriptor *__cdecl IOUSBGetNextInterfaceAssociationDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  const IOUSBInterfaceAssociationDescriptor *result;

  do
  {
    result = (const IOUSBInterfaceAssociationDescriptor *)IOUSBGetNextDescriptor(configurationDescriptor, currentDescriptor);
    currentDescriptor = (const IOUSBDescriptorHeader *)result;
  }
  while (result && result->bDescriptorType != 11);
  return result;
}

const IOUSBInterfaceDescriptor *__cdecl IOUSBGetNextInterfaceDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  const IOUSBInterfaceDescriptor *result;

  do
  {
    result = (const IOUSBInterfaceDescriptor *)IOUSBGetNextDescriptor(configurationDescriptor, currentDescriptor);
    currentDescriptor = (const IOUSBDescriptorHeader *)result;
  }
  while (result && result->bDescriptorType != 4);
  return result;
}

const IOUSBEndpointDescriptor *__cdecl IOUSBGetNextEndpointDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *interfaceDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return (const IOUSBEndpointDescriptor *)IOUSBGetNextAssociatedDescriptorWithType(configurationDescriptor, (const IOUSBDescriptorHeader *)interfaceDescriptor, currentDescriptor, 5u);
}

const IOUSBDeviceCapabilityDescriptorHeader *__cdecl IOUSBGetNextCapabilityDescriptor(const IOUSBDeviceCapabilityDescriptorHeader *bosDescriptor, const IOUSBDeviceCapabilityDescriptorHeader *currentDescriptor)
{
  uint8_t *v2;
  uint64_t v3;
  unint64_t bLength;
  const IOUSBDeviceCapabilityDescriptorHeader *v5;

  if (bosDescriptor)
  {
    if (currentDescriptor)
    {
      if (currentDescriptor >= bosDescriptor
        && (v2 = &bosDescriptor->bLength + *(unsigned __int16 *)&bosDescriptor->bDevCapabilityType,
            v2 >= (uint8_t *)currentDescriptor))
      {
        bLength = currentDescriptor->bLength;
        if ((char *)currentDescriptor + bLength >= (char *)v2)
          v5 = 0;
        else
          v5 = (const IOUSBDeviceCapabilityDescriptorHeader *)((char *)currentDescriptor + bLength);
        if (bLength >= 3)
          return v5;
        else
          return 0;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      v3 = bosDescriptor->bLength;
      if (*(unsigned __int16 *)&bosDescriptor->bDevCapabilityType > v3)
        return (const IOUSBDeviceCapabilityDescriptorHeader *)((char *)bosDescriptor + v3);
      else
        return 0;
    }
  }
  return bosDescriptor;
}

const IOUSBDeviceCapabilityDescriptorHeader *__cdecl IOUSBGetNextCapabilityDescriptorWithType(const IOUSBBOSDescriptor *bosDescriptor, const IOUSBDeviceCapabilityDescriptorHeader *currentDescriptor, const uint8_t type)
{
  int v3;
  const IOUSBBOSDescriptor *i;
  const IOUSBDeviceCapabilityDescriptorHeader *result;

  v3 = type;
  for (i = bosDescriptor; ; bosDescriptor = i)
  {
    result = IOUSBGetNextCapabilityDescriptor(bosDescriptor, currentDescriptor);
    currentDescriptor = result;
    if (!result || result->bDescriptorType == 16 && result->bDevCapabilityType == v3)
      break;
  }
  return result;
}

const IOUSBDeviceCapabilityUSB2Extension *__cdecl IOUSBGetUSB20ExtensionDeviceCapabilityDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityUSB2Extension *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 2u);
}

const IOUSBDeviceCapabilitySuperSpeedUSB *__cdecl IOUSBGetSuperSpeedDeviceCapabilityDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilitySuperSpeedUSB *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 3u);
}

const IOUSBDeviceCapabilitySuperSpeedPlusUSB *__cdecl IOUSBGetSuperSpeedPlusDeviceCapabilityDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilitySuperSpeedPlusUSB *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 0xAu);
}

const IOUSBDeviceCapabilityContainerID *__cdecl IOUSBGetContainerIDDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityContainerID *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 4u);
}

const IOUSBPlatformCapabilityDescriptor *__cdecl IOUSBGetPlatformCapabilityDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBPlatformCapabilityDescriptor *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 5u);
}

const IOUSBPlatformCapabilityDescriptor *__cdecl IOUSBGetPlatformCapabilityDescriptorWithUUID(const IOUSBBOSDescriptor *bosDescriptor, uuid_t uuid)
{
  const IOUSBDeviceCapabilityDescriptorHeader *v4;
  const IOUSBDeviceCapabilityDescriptorHeader *CapabilityDescriptorWithType;

  v4 = 0;
  do
  {
    CapabilityDescriptorWithType = IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, v4, 5u);
    v4 = CapabilityDescriptorWithType;
  }
  while (CapabilityDescriptorWithType && uuid_compare(uuid, &CapabilityDescriptorWithType[1].bDescriptorType));
  return (const IOUSBPlatformCapabilityDescriptor *)v4;
}

const IOUSBDeviceCapabilityBillboard *__cdecl IOUSBGetBillboardDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityBillboard *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0, 0xDu);
}

uint8_t IOUSBGetEndpointDirection(const IOUSBEndpointDescriptor *descriptor)
{
  int v1;

  if ((descriptor->bmAttributes & 3) != 0)
    return descriptor->bEndpointAddress >> 7;
  else
    LOBYTE(v1) = 2;
  return v1;
}

uint8_t IOUSBGetEndpointType(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bmAttributes & 3;
}

uint8_t IOUSBGetEndpointAddress(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bEndpointAddress & 0x8F;
}

uint8_t IOUSBGetEndpointNumber(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bEndpointAddress & 0xF;
}

uint8_t IOUSBGetEndpointUsageType(const IOUSBEndpointDescriptor *descriptor)
{
  return (descriptor->bmAttributes >> 4) & 3;
}

uint8_t IOUSBGetEndpointSynchronizationType(const IOUSBEndpointDescriptor *descriptor)
{
  return (descriptor->bmAttributes >> 2) & 3;
}

uint16_t IOUSBGetEndpointMaxPacketSize(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->wMaxPacketSize & 0x7FF;
}

uint32_t IOUSBGetEndpointBurstSize(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor, const IOUSBSuperSpeedPlusIsochronousEndpointCompanionDescriptor *sspCompanionDescriptor)
{
  unsigned int wMaxPacketSize;
  uint32_t result;
  int v7;
  int bmAttributes;
  int bMaxBurst;
  __int16 v10;

  wMaxPacketSize = descriptor->wMaxPacketSize;
  result = wMaxPacketSize & 0x7FF;
  if (usbDeviceSpeed - 1 < 3)
  {
    bMaxBurst = (wMaxPacketSize >> 11) & 3;
  }
  else
  {
    v7 = descriptor->bmAttributes & 3;
    if (usbDeviceSpeed - 5 >= 2)
    {
      if (usbDeviceSpeed != 4)
        return 0;
      if ((descriptor->bmAttributes & 3) == 0)
        return result;
      if (v7 == 1)
      {
        LOBYTE(bmAttributes) = companionDescriptor->bmAttributes;
LABEL_13:
        v10 = result + result * companionDescriptor->bMaxBurst;
        return (unsigned __int16)(v10 + v10 * (bmAttributes & 3));
      }
    }
    else
    {
      if ((descriptor->bmAttributes & 3) == 0)
        return result;
      if (v7 == 1)
      {
        bmAttributes = (char)companionDescriptor->bmAttributes;
        if (sspCompanionDescriptor && bmAttributes < 0)
          return sspCompanionDescriptor->dwBytesPerInterval;
        goto LABEL_13;
      }
    }
    bMaxBurst = companionDescriptor->bMaxBurst;
  }
  result += result * bMaxBurst;
  return result;
}

uint8_t IOUSBGetEndpointMult(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor, const IOUSBSuperSpeedPlusIsochronousEndpointCompanionDescriptor *sspCompanionDescriptor)
{
  int v4;
  int bmAttributes;

  v4 = descriptor->bmAttributes & 3;
  if (usbDeviceSpeed - 5 >= 2)
  {
    if (usbDeviceSpeed == 3)
    {
      if ((descriptor->bmAttributes & 1) != 0)
        return (descriptor->wMaxPacketSize >> 11) & 3;
    }
    else if (usbDeviceSpeed == 4 && v4 == 1)
    {
      LOBYTE(bmAttributes) = companionDescriptor->bmAttributes;
LABEL_12:
      LOBYTE(bmAttributes) = bmAttributes & 3;
      return bmAttributes;
    }
    goto LABEL_11;
  }
  if (v4 != 1)
  {
LABEL_11:
    LOBYTE(bmAttributes) = 0;
    return bmAttributes;
  }
  bmAttributes = (char)companionDescriptor->bmAttributes;
  if ((bmAttributes & 0x80000000) == 0 || (descriptor->wMaxPacketSize & 0x7FF) == 0)
    goto LABEL_12;
  return (((descriptor->wMaxPacketSize & 0x7FF) + sspCompanionDescriptor->dwBytesPerInterval - 1) & -(descriptor->wMaxPacketSize & 0x7FF))
       / ((companionDescriptor->bMaxBurst & 0x1Fu) + 1)
       / (descriptor->wMaxPacketSize & 0x7FFu)
       - 1;
}

uint32_t IOUSBGetEndpointIntervalEncodedMicroframes(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  uint32_t result;
  int v3;
  int v4;

  if (usbDeviceSpeed - 3 < 3)
  {
    if ((descriptor->bmAttributes & 1) != 0)
      return descriptor->bInterval;
    if (usbDeviceSpeed == 3 && descriptor->bInterval)
    {
      result = 0;
      do
        v3 = 1 << result++;
      while (v3 < descriptor->bInterval);
      return result;
    }
    return 0;
  }
  if (usbDeviceSpeed - 1 >= 2)
    return 0;
  v4 = descriptor->bmAttributes & 3;
  if (v4 == 1)
    return descriptor->bInterval + 3;
  if (v4 != 3)
    return 0;
  result = 3;
  do
    ++result;
  while (1 << result <= 8 * descriptor->bInterval);
  return result;
}

uint32_t IOUSBGetEndpointIntervalMicroframes(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  uint32_t v2;

  v2 = IOUSBGetEndpointIntervalEncodedMicroframes(usbDeviceSpeed, descriptor);
  if (v2)
    return 1 << (v2 - 1);
  else
    return 0;
}

uint32_t IOUSBGetEndpointIntervalFrames(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  uint32_t v2;

  v2 = IOUSBGetEndpointIntervalEncodedMicroframes(usbDeviceSpeed, descriptor);
  if (v2)
    return (1 << (v2 - 1)) >> 3;
  else
    return 0;
}

uint32_t IOUSBGetEndpointMaxStreamsEncoded(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor)
{
  if (usbDeviceSpeed >= 4 && (descriptor->bmAttributes & 3) == 2)
    return companionDescriptor->bmAttributes & 0x1F;
  else
    return 0;
}

uint32_t IOUSBGetEndpointMaxStreams(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor)
{
  if (usbDeviceSpeed >= 4 && (descriptor->bmAttributes & 3) == 2 && (companionDescriptor->bmAttributes & 0x1F) != 0)
    return 1 << companionDescriptor->bmAttributes;
  else
    return 0;
}

uint32_t IOUSBGetConfigurationMaxPowerMilliAmps(uint32_t usbDeviceSpeed, const IOUSBConfigurationDescriptor *descriptor)
{
  unsigned int MaxPower;
  BOOL v3;
  BOOL v4;
  uint32_t v5;
  unsigned int v6;

  if (!descriptor)
    return 0;
  if (usbDeviceSpeed - 1 < 3)
  {
    MaxPower = descriptor->MaxPower;
    v3 = MaxPower >= 0xFA;
    v4 = MaxPower == 250;
    v5 = 2 * MaxPower;
    goto LABEL_6;
  }
  if (usbDeviceSpeed - 4 >= 2)
    return 0;
  v6 = descriptor->MaxPower;
  v3 = v6 >= 0x71;
  v4 = v6 == 113;
  v5 = 8 * v6;
LABEL_6:
  if (!v4 && v3)
    return 0;
  else
    return v5;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return objc_msgSend(0, "cStringUsingEncoding:", 4);
}

id OUTLINED_FUNCTION_5()
{
  void *v0;

  return objc_retainAutorelease(v0);
}

void _ioCompletionCallback(void (**a1)(_QWORD, _QWORD, _QWORD), uint64_t a2, unsigned int a3)
{
  id v3;

  if (a1)
  {
    v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

void _internalInterestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a1;
  v8 = v7;
  if ((_DWORD)a3 == -536850430)
  {
    objc_msgSend(v7, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      _internalInterestCallback_cold_1((IOUSBHostCIExceptionType)a4, v9);

  }
  if (objc_msgSend(v8, "interestHandler"))
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))objc_msgSend(v8, "interestHandler"))(v8, a2, a3, a4);

}

void sub_21B5D8510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void _commandAsyncCallback(void *a1, int a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  int v7;

  if (a1 && (objc_msgSend(a1, "destroyed") & 1) == 0)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = ___commandAsyncCallback_block_invoke;
    v5[3] = &unk_24DEDCBA0;
    v6 = a1;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

void _doorbellAsyncCallback(void *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  int v10;

  if (a1 && (objc_msgSend(a1, "destroyed") & 1) == 0)
  {
    objc_msgSend(a1, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___doorbellAsyncCallback_block_invoke;
    block[3] = &unk_24DEDCBC8;
    v10 = a2;
    v8 = a1;
    v9 = a3;
    dispatch_async(v6, block);

  }
}

uint64_t ___commandAsyncCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commandAsyncCallbackWithResult:error:", *(unsigned int *)(a1 + 40), 0);
}

uint64_t ___doorbellAsyncCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doorbellAsyncCallbacKWithResult:length:error:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

void _ioCompletionCallback_0(void (**a1)(_QWORD, _QWORD, _QWORD), uint64_t a2, unsigned int a3)
{
  id v3;

  if (a1)
  {
    v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

void _isochCompletionCallback(void (**a1)(void))
{
  void (**v1)(void);

  if (a1)
  {
    v1 = a1;
    a1[2]();
    a1 = v1;
  }

}

void _interestNotificationCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 *v6;
  unsigned __int8 v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  unsigned __int8 *v9;

  v6 = a1;
  if (v6)
  {
    v7 = atomic_load(v6 + 8);
    if ((v7 & 1) == 0)
    {
      v9 = v6;
      objc_msgSend(v6, "interestHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, unsigned __int8 *, uint64_t, uint64_t))v8)[2](v8, v9, a3, a4);

      v6 = v9;
    }
  }

}

void sub_21B5DE7AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5DED64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _ioCompletionCallback_1(void (**a1)(_QWORD, _QWORD, _QWORD), uint64_t a2, unsigned int a3)
{
  id v3;

  if (a1)
  {
    v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

void sub_21B5DF3D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _internalMatchingCallback(void *a1, io_iterator_t a2)
{
  id v3;
  io_object_t v4;
  id v5;

  v3 = a1;
  if (a2)
  {
    v5 = v3;
    v4 = IOIteratorNext(a2);
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setService:");
      IOObjectRelease(objc_msgSend(v5, "matchingIterator"));
      objc_msgSend(v5, "setMatchingIterator:", 0);
      v3 = v5;
    }
  }

}

void sub_21B5E0864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void _internalInterestCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void (*v8)(void *, uint64_t, uint64_t, uint64_t);
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_21B5CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Notification message 0x%08x argument 0x%016lx", (uint8_t *)v11, 0x12u);
  }
  objc_msgSend(v6, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  if ((objc_msgSend(v6, "destroyed") & 1) == 0)
  {
    v8 = (void (*)(void *, uint64_t, uint64_t, uint64_t))objc_msgSend(v6, "callback");
    objc_msgSend(v6, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8(v9, objc_msgSend(v6, "service"), a3, a4);

  }
  objc_msgSend(v6, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const char *IOFindNameForValue(int a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  int v4;

  v2 = *(_QWORD *)(a2 + 8);
  if (v2 && *(_DWORD *)a2 != a1)
  {
    v3 = (_QWORD *)(a2 + 24);
    do
    {
      v2 = *v3;
      if (!*v3)
        break;
      v4 = *((_DWORD *)v3 - 2);
      v3 += 2;
    }
    while (v4 != a1);
  }
  if (v2)
    return (const char *)v2;
  else
    return "Unknown";
}

IOReturn IOUSBHostCIMessageStatusToIOReturn(IOUSBHostCIMessageStatus status)
{
  if (status > IOUSBHostCIMessageStatusMissedServiceError)
    return -536870212;
  else
    return dword_21B5E5548[status];
}

IOUSBHostCIMessageStatus IOUSBHostCIMessageStatusFromIOReturn(IOReturn status)
{
  IOReturn v1;
  int v2;
  int v3;
  IOUSBHostCIMessageStatus v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  int v10;
  IOUSBHostCIMessageStatus v11;

  if (status > -536870169)
  {
    v1 = -536870164;
    if (status)
      v9 = 13;
    else
      v9 = 1;
    if (status == -536850432)
      v10 = 11;
    else
      v10 = v9;
    if (status == -536870163)
      v4 = IOUSBHostCIMessageStatusTransactionError;
    else
      v4 = v10;
    v5 = -536870168;
    v6 = 10;
    v7 = status == -536870165;
    v8 = 7;
  }
  else
  {
    v1 = -536870187;
    if (status == -536870174)
      v2 = 3;
    else
      v2 = 13;
    if (status == -536870185)
      v3 = 2;
    else
      v3 = v2;
    if (status == -536870186)
      v4 = IOUSBHostCIMessageStatusTimeout;
    else
      v4 = v3;
    v5 = -536870210;
    v6 = 6;
    v7 = status == -536870206;
    v8 = 4;
  }
  if (v7)
    v11 = v8;
  else
    v11 = IOUSBHostCIMessageStatusError;
  if (status == v5)
    v11 = v6;
  if (status <= v1)
    return v11;
  else
    return v4;
}

BOOL IOUSBHostCILinkStateEnabled(const IOUSBHostCILinkState linkState)
{
  return (linkState < 0x10) & (0x800Fu >> linkState);
}

const char *__cdecl IOUSBHostCIMessageTypeToString(IOUSBHostCIMessageType type)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;

  if (type)
  {
    v1 = 0;
    while (1)
    {
      v2 = v1 + 16;
      if (v1 == 528)
        break;
      v3 = *(_DWORD *)((char *)&IOUSBHostCIMessageTypeToString_namedValues + v1 + 16);
      v1 += 16;
      if (v3 == type)
      {
        v4 = *(const char **)((char *)&IOUSBHostCIMessageTypeToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }
    v4 = 0;
  }
  else
  {
    v4 = "IOUSBHostCIMessageTypeControllerCapabilities";
  }
LABEL_8:
  if (v4)
    return v4;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIMessageStatusToString(IOUSBHostCIMessageStatus status)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;

  if (status)
  {
    v1 = 0;
    while (1)
    {
      v2 = v1 + 16;
      if (v1 == 208)
        break;
      v3 = *(_DWORD *)((char *)&IOUSBHostCIMessageStatusToString_namedValues + v1 + 16);
      v1 += 16;
      if (v3 == status)
      {
        v4 = *(const char **)((char *)&IOUSBHostCIMessageStatusToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }
    v4 = 0;
  }
  else
  {
    v4 = "IOUSBHostCIMessageStatusReserved";
  }
LABEL_8:
  if (v4)
    return v4;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCILinkStateToString(IOUSBHostCILinkState linkState)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;

  if (linkState)
  {
    v1 = 0;
    while (1)
    {
      v2 = v1 + 16;
      if (v1 == 192)
        break;
      v3 = *(_DWORD *)((char *)&IOUSBHostCILinkStateToString_namedValues + v1 + 16);
      v1 += 16;
      if (v3 == linkState)
      {
        v4 = *(const char **)((char *)&IOUSBHostCILinkStateToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }
    v4 = 0;
  }
  else
  {
    v4 = "U0";
  }
LABEL_8:
  if (v4)
    return v4;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIDeviceSpeedToString(IOUSBHostCIDeviceSpeed speed)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;

  if (speed)
  {
    v1 = 0;
    while (1)
    {
      v2 = v1 + 16;
      if (v1 == 96)
        break;
      v3 = *(_DWORD *)((char *)&IOUSBHostCIDeviceSpeedToString_namedValues + v1 + 16);
      v1 += 16;
      if (v3 == speed)
      {
        v4 = *(const char **)((char *)&IOUSBHostCIDeviceSpeedToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }
    v4 = 0;
  }
  else
  {
    v4 = "None";
  }
LABEL_8:
  if (v4)
    return v4;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIExceptionTypeToString(IOUSBHostCIExceptionType exceptionType)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (exceptionType == IOUSBHostCIExceptionTypeCapabilitiesInvalid)
  {
    v1 = "IOUSBHostCIExceptionTypeCapabilitiesInvalid";
  }
  else
  {
    v2 = 0;
    while (1)
    {
      v3 = v2 + 16;
      if (v2 == 176)
        break;
      v4 = *(_DWORD *)((char *)&IOUSBHostCIExceptionTypeToString_namedValues + v2 + 16);
      v2 += 16;
      if (v4 == exceptionType)
      {
        v1 = *(const char **)((char *)&IOUSBHostCIExceptionTypeToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }
    v1 = 0;
  }
LABEL_8:
  if (v1)
    return v1;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIControllerStateToString(IOUSBHostCIControllerState controllerState)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (controllerState == IOUSBHostCIControllerStateActive)
  {
    v1 = "Active";
  }
  else
  {
    v2 = 0;
    while (1)
    {
      v3 = v2 + 16;
      if (v2 == 32)
        break;
      v4 = *(_DWORD *)((char *)&IOUSBHostCIControllerStateToString_namedValues + v2 + 16);
      v2 += 16;
      if (v4 == controllerState)
      {
        v1 = *(const char **)((char *)&IOUSBHostCIControllerStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }
    v1 = 0;
  }
LABEL_8:
  if (v1)
    return v1;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIPortStateToString(IOUSBHostCIPortState portState)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (portState == IOUSBHostCIPortStateActive)
  {
    v1 = "Active";
  }
  else
  {
    v2 = 0;
    while (1)
    {
      v3 = v2 + 16;
      if (v2 == 48)
        break;
      v4 = *(_DWORD *)((char *)&IOUSBHostCIPortStateToString_namedValues + v2 + 16);
      v2 += 16;
      if (v4 == portState)
      {
        v1 = *(const char **)((char *)&IOUSBHostCIPortStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }
    v1 = 0;
  }
LABEL_8:
  if (v1)
    return v1;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIDeviceStateToString(IOUSBHostCIDeviceState deviceState)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (deviceState == IOUSBHostCIDeviceStateActive)
  {
    v1 = "Active";
  }
  else
  {
    v2 = 0;
    while (1)
    {
      v3 = v2 + 16;
      if (v2 == 32)
        break;
      v4 = *(_DWORD *)((char *)&IOUSBHostCIDeviceStateToString_namedValues + v2 + 16);
      v2 += 16;
      if (v4 == deviceState)
      {
        v1 = *(const char **)((char *)&IOUSBHostCIDeviceStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }
    v1 = 0;
  }
LABEL_8:
  if (v1)
    return v1;
  else
    return "Unknown";
}

const char *__cdecl IOUSBHostCIEndpointStateToString(IOUSBHostCIEndpointState endpointState)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (endpointState == IOUSBHostCIEndpointStateActive)
  {
    v1 = "Active";
  }
  else
  {
    v2 = 0;
    while (1)
    {
      v3 = v2 + 16;
      if (v2 == 48)
        break;
      v4 = *(_DWORD *)((char *)&IOUSBHostCIEndpointStateToString_namedValues + v2 + 16);
      v2 += 16;
      if (v4 == endpointState)
      {
        v1 = *(const char **)((char *)&IOUSBHostCIEndpointStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }
    v1 = 0;
  }
LABEL_8:
  if (v1)
    return v1;
  else
    return "Unknown";
}

void _internalInterestCallback_cold_1(IOUSBHostCIExceptionType a1, NSObject *a2)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = IOUSBHostCIExceptionTypeToString(a1);
  _os_log_fault_impl(&dword_21B5CC000, a2, OS_LOG_TYPE_FAULT, "Fatal error: %s", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F20](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD7F38](*(_QWORD *)&connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F88](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

