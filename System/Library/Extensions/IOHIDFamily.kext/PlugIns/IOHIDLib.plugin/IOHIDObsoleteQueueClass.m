@implementation IOHIDObsoleteQueueClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  int v8;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x81u, 0x38u, 0x62u, 0x9Eu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x97u, 0xEu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (!CFEqual(v6, v7))
  {
    v8 = -2147483644;
    if (!v6)
      return v8;
    goto LABEL_3;
  }
  *a4 = &self->_interface;
  CFRetain(self);
  v8 = 0;
  if (v6)
LABEL_3:
    CFRelease(v6);
  return v8;
}

- (int)getNextEvent:(IOHIDEventStruct *)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  void *v7;
  IOHIDElementRef Element;
  HIDLibElement *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  const uint8_t *BytePtr;
  IOHIDValueRef value;

  value = 0;
  if (a3)
  {
    v6 = objc_msgSend_copyNextValue_(self, a2, (uint64_t)&value, v3, v4);
    v7 = 0;
    if (!v6 && value)
    {
      Element = IOHIDValueGetElement(value);
      v9 = [HIDLibElement alloc];
      v7 = (void *)objc_msgSend_initWithElementRef_(v9, v10, (uint64_t)Element, v11, v12);
      objc_msgSend_setValueRef_(v7, v13, (uint64_t)value, v14, v15);
      v20 = objc_msgSend_length(v7, v16, v17, v18, v19);
      a3->type = objc_msgSend_type(v7, v21, v22, v23, v24);
      a3->elementCookie = objc_msgSend_elementCookie(v7, v25, v26, v27, v28);
      a3->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v7, v29, v30, v31, v32);
      if (v20 < 5uLL)
      {
        a3->longValueSize = 0;
        a3->longValue = 0;
        a3->value = objc_msgSend_integerValue(v7, v33, v34, v35, v36);
      }
      else
      {
        a3->longValueSize = v20;
        a3->longValue = malloc_type_malloc(v20, 0xC0F2EF42uLL);
        BytePtr = IOHIDValueGetBytePtr(value);
        memmove(a3->longValue, BytePtr, v20);
      }
      CFRelease(value);
      v6 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = -536870206;
  }

  return v6;
}

- (int)setEventCallout:(void *)a3 callbackTarget:(void *)a4 callbackRefcon:(void *)a5
{
  self->_eventCallbackTarget = a4;
  self->_eventCallbackRefcon = a5;
  self->_eventCallback = a3;
  return objc_msgSend_setValueAvailableCallback_context_(self, a2, (uint64_t)sub_2310D9000, (uint64_t)self, (uint64_t)a5);
}

- (IOHIDObsoleteQueueClass)initWithDevice:(id)a3
{
  id v4;
  IOHIDObsoleteQueueClass *v5;
  char *v6;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v9;
  IOHIDObsoleteQueueClass *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IOHIDObsoleteQueueClass;
  v5 = -[IOHIDQueueClass initWithDevice:](&v12, sel_initWithDevice_, v4);
  if (v5)
  {
    v6 = (char *)malloc_type_malloc(0x90uLL, 0x80040BBECCAC1uLL);
    v5->_interface = (IOHIDQueueInterface *)v6;
    vtbl = v5->super.super._vtbl;
    Release = vtbl->Release;
    v9 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v6 = v5;
    *((_QWORD *)v6 + 3) = Release;
    *((_QWORD *)v6 + 4) = sub_2310D91E0;
    *((_QWORD *)v6 + 5) = sub_2310D925C;
    *((_QWORD *)v6 + 6) = sub_2310D9274;
    *((_QWORD *)v6 + 7) = sub_2310D9294;
    *((_QWORD *)v6 + 8) = sub_2310D92AC;
    *((_QWORD *)v6 + 9) = sub_2310D92B4;
    *((_QWORD *)v6 + 10) = sub_2310D92BC;
    *((_QWORD *)v6 + 11) = sub_2310D933C;
    *((_QWORD *)v6 + 12) = sub_2310D93BC;
    *((_QWORD *)v6 + 13) = sub_2310D944C;
    *((_QWORD *)v6 + 14) = sub_2310D9458;
    *(_OWORD *)(v6 + 8) = v9;
    *((_QWORD *)v6 + 15) = sub_2310D9464;
    *((_QWORD *)v6 + 16) = sub_2310D9474;
    *((_QWORD *)v6 + 17) = sub_2310D948C;
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_interface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDObsoleteQueueClass;
  -[IOHIDQueueClass dealloc](&v3, sel_dealloc);
}

@end
