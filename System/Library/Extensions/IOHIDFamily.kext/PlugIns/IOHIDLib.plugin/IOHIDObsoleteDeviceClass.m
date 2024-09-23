@implementation IOHIDObsoleteDeviceClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  uint64_t v5;
  uint64_t v6;
  CFUUIDRef v8;
  CFUUIDRef v9;
  CFUUIDRef v10;
  uint64_t v11;
  int Interface_outInterface;
  CFUUIDRef v14;
  CFUUIDRef v15;
  CFUUIDRef v16;
  __objc2_class *v17;
  CFUUIDRef v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v5 = *(_QWORD *)&a3.var8;
  v6 = *(_QWORD *)&a3.var0;
  v8 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v8, v9)
    || (v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v8, v10)))
  {
    v11 = 16;
LABEL_4:
    *a4 = (char *)self + v11;
    CFRetain(self);
    Interface_outInterface = 0;
    goto LABEL_5;
  }
  v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v14)
    || (v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xB7u, 0xAu, 0xBFu, 0x31u, 0x16u, 0xD5u, 0x11u, 0xD7u, 0xABu, 0x35u, 0, 3u, 0x93u, 0x99u, 0x2Eu, 0x38u), CFEqual(v8, v15)))
  {
    v11 = 176;
    goto LABEL_4;
  }
  v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v16))
  {
    v17 = IOHIDObsoleteQueueClass;
LABEL_15:
    v19 = [v17 alloc];
    v23 = (void *)objc_msgSend_initWithDevice_(v19, v20, (uint64_t)self, v21, v22);
    Interface_outInterface = objc_msgSend_queryInterface_outInterface_(v23, v24, v6, v5, (uint64_t)a4);

    goto LABEL_5;
  }
  v18 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(v8, v18))
  {
    v17 = IOHIDOutputTransactionClass;
    goto LABEL_15;
  }
  Interface_outInterface = -2147483644;
LABEL_5:
  if (v8)
    CFRelease(v8);
  return Interface_outInterface;
}

- (int)setRemovalCallback:(void *)a3 removalTarget:(void *)a4 removalRefcon:(void *)a5
{
  self->_removalTarget = a4;
  self->_removalRefcon = a5;
  self->_removalCallback = a3;
  if (self->_notification)
    return 0;
  else
    return IOServiceAddInterestNotification(self->_notifyPort, self->super._service, "IOGeneralInterest", (IOServiceInterestCallback)sub_2310E077C, self, &self->_notification);
}

- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  int v5;
  uint64_t v6;
  __IOHIDElement *v9;
  int v10;
  IOHIDElementRef Element;
  HIDLibElement *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  void *v42;
  const uint8_t *BytePtr;
  objc_super v45;
  IOHIDValueRef value;
  objc_super v47;

  v5 = -536870206;
  if (a4)
  {
    v6 = *(_QWORD *)&a5;
    v47.receiver = self;
    v47.super_class = (Class)IOHIDObsoleteDeviceClass;
    v9 = -[IOHIDDeviceClass getElement:](&v47, sel_getElement_, *(_QWORD *)&a3);
    value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
    if (v9)
    {
      v45.receiver = self;
      v45.super_class = (Class)IOHIDObsoleteDeviceClass;
      v10 = -[IOHIDDeviceClass getValue:value:timeout:callback:context:options:](&v45, sel_getValue_value_timeout_callback_context_options_, v9, &value, 0, 0, 0, v6);
      if (v10)
      {
        return v10;
      }
      else
      {
        Element = IOHIDValueGetElement(value);
        v12 = [HIDLibElement alloc];
        v16 = (void *)objc_msgSend_initWithElementRef_(v12, v13, (uint64_t)Element, v14, v15);
        objc_msgSend_setValueRef_(v16, v17, (uint64_t)value, v18, v19);
        v24 = objc_msgSend_length(v16, v20, v21, v22, v23);
        a4->type = objc_msgSend_type(v16, v25, v26, v27, v28);
        a4->elementCookie = objc_msgSend_elementCookie(v16, v29, v30, v31, v32);
        a4->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v16, v33, v34, v35, v36);
        v41 = v24;
        if (v24 < 5uLL)
        {
          a4->longValueSize = 0;
          a4->longValue = 0;
          a4->value = objc_msgSend_integerValue(v16, v37, v38, v39, v40);
        }
        else
        {
          a4->longValueSize = v24;
          v42 = malloc_type_malloc(v24, 0xC99CBB23uLL);
          a4->longValue = v42;
          BytePtr = IOHIDValueGetBytePtr(value);
          memmove(v42, BytePtr, v41);
        }

        return 0;
      }
    }
  }
  return v5;
}

- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4
{
  int v4;
  __IOHIDElement *v6;
  uint64_t v7;
  const void *v8;
  BOOL v9;
  objc_super v11;
  objc_super v12;

  v4 = -536870212;
  if (!a4)
    return -536870206;
  v12.receiver = self;
  v12.super_class = (Class)IOHIDObsoleteDeviceClass;
  v6 = -[IOHIDDeviceClass getElement:](&v12, sel_getElement_, *(_QWORD *)&a3);
  v7 = _IOHIDValueCreateWithStruct();
  v8 = (const void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (!v7)
      return v4;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOHIDObsoleteDeviceClass;
    v4 = -[IOHIDDeviceClass setValue:value:timeout:callback:context:options:](&v11, sel_setValue_value_timeout_callback_context_options_, v6, v7, 0, 0, 0, 0);
  }
  CFRelease(v8);
  return v4;
}

- (IOHIDQueueInterface)allocQueue
{
  const __CFUUID *v3;
  CFUUIDBytes v4;
  IOHIDQueueInterface **v6;

  v6 = 0;
  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_(self, *(const char **)&v4.byte8, *(uint64_t *)&v4.byte0, *(uint64_t *)&v4.byte8, (uint64_t)&v6);
  return v6;
}

- (IOHIDOutputTransactionInterface)allocOutputTransaction
{
  const __CFUUID *v3;
  CFUUIDBytes v4;
  IOHIDOutputTransactionInterface **v6;

  v6 = 0;
  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_(self, *(const char **)&v4.byte8, *(uint64_t *)&v4.byte0, *(uint64_t *)&v4.byte8, (uint64_t)&v6);
  return v6;
}

- (int)copyMatchingElements:(__CFDictionary *)a3 element:(const __CFArray *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOHIDObsoleteDeviceClass;
  return -[IOHIDDeviceClass copyMatchingElements:elements:options:](&v5, sel_copyMatchingElements_elements_options_, a3, a4, 1);
}

- (int)setInterruptReportHandlerCallback:(void *)a3 reportBufferSize:(unsigned int)a4 callback:(void *)a5 callbackTarget:(void *)a6 callbackRefcon:(void *)a7
{
  self->_reportCallbackTarget = a6;
  self->_reportCallbackRefcon = a7;
  self->_reportCallback = a5;
  return MEMORY[0x24BEDD108](self, sel_setInputReportCallback_reportLength_callback_context_options_, a3, a4, sub_2310E0BC4);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOHIDObsoleteDeviceClass;
  -[IOHIDDeviceClass start:service:](&v10, sel_start_service_, a3, *(_QWORD *)&a4);
  objc_msgSend_initQueue(self, v5, v6, v7, v8);
  return 0;
}

- (IOHIDObsoleteDeviceClass)init
{
  IOHIDObsoleteDeviceClass *v2;
  char *v3;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v6;
  IONotificationPort *v7;
  IOHIDObsoleteDeviceClass *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOHIDObsoleteDeviceClass;
  v2 = -[IOHIDDeviceClass init](&v10, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_malloc(0xB0uLL, 0x80040F50BA72EuLL);
    v2->_interface = (IOHIDDeviceInterface122 *)v3;
    vtbl = v2->super.super.super._vtbl;
    Release = vtbl->Release;
    v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((_QWORD *)v3 + 3) = Release;
    *((_QWORD *)v3 + 4) = sub_2310E0DC0;
    *((_QWORD *)v3 + 5) = sub_2310E0E30;
    *((_QWORD *)v3 + 6) = sub_2310E0E4C;
    *((_QWORD *)v3 + 7) = sub_2310E0E70;
    *((_QWORD *)v3 + 8) = sub_2310E0E8C;
    *((_QWORD *)v3 + 9) = sub_2310E0E9C;
    *((_QWORD *)v3 + 10) = sub_2310E0EAC;
    *((_QWORD *)v3 + 11) = sub_2310E0EC4;
    *((_QWORD *)v3 + 12) = sub_2310E0EDC;
    *((_QWORD *)v3 + 13) = sub_2310E0EF0;
    *((_QWORD *)v3 + 14) = sub_2310E0F08;
    *((_QWORD *)v3 + 15) = sub_2310E0F24;
    *((_QWORD *)v3 + 16) = sub_2310E0F40;
    *((_QWORD *)v3 + 17) = sub_2310E0F4C;
    *((_QWORD *)v3 + 18) = sub_2310E0F58;
    *((_QWORD *)v3 + 19) = sub_2310E0FA0;
    *((_QWORD *)v3 + 20) = sub_2310E1068;
    *((_QWORD *)v3 + 21) = sub_2310E107C;
    v7 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    v2->_notifyPort = v7;
    IONotificationPortSetDispatchQueue(v7, MEMORY[0x24BDAC9B8]);
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  IONotificationPort *notifyPort;
  io_object_t notification;
  objc_super v5;

  free(self->_interface);
  notifyPort = self->_notifyPort;
  if (notifyPort)
    IONotificationPortDestroy(notifyPort);
  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  v5.receiver = self;
  v5.super_class = (Class)IOHIDObsoleteDeviceClass;
  -[IOHIDDeviceClass dealloc](&v5, sel_dealloc);
}

@end
