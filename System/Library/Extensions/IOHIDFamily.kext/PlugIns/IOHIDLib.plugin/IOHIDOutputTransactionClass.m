@implementation IOHIDOutputTransactionClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  int v8;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x80u, 0xCDu, 0xCCu, 0, 0x75u, 0x5Du, 0x11u, 0xD4u, 0x80u, 0xEFu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (!CFEqual(v6, v7))
  {
    v8 = -2147483644;
    if (!v6)
      return v8;
    goto LABEL_3;
  }
  *a4 = &self->_outputInterface;
  CFRetain(self);
  v8 = 0;
  if (v6)
LABEL_3:
    CFRelease(v6);
  return v8;
}

- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Element;
  uint64_t v14;
  const char *v15;
  const void *v16;
  BOOL v17;

  v5 = -536870212;
  if (!a4)
    return -536870206;
  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._device);
  Element = objc_msgSend_getElement_(WeakRetained, v10, v7, v11, v12);

  v14 = _IOHIDValueCreateWithStruct();
  v16 = (const void *)v14;
  if (Element)
    v17 = v14 == 0;
  else
    v17 = 1;
  if (v17)
  {
    if (!v14)
      return v5;
  }
  else
  {
    v5 = objc_msgSend_setValue_value_options_(self, v15, Element, v14, v6);
  }
  CFRelease(v16);
  return v5;
}

- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v7;
  id WeakRetained;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Element;
  const char *v14;
  int Value_value_options;
  IOHIDElementRef v16;
  HIDLibElement *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint32_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  size_t v46;
  void *v47;
  const uint8_t *BytePtr;
  IOHIDValueRef value;

  if (!a4)
    return -536870206;
  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._device);
  Element = objc_msgSend_getElement_(WeakRetained, v10, v7, v11, v12);

  value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
  Value_value_options = objc_msgSend_getValue_value_options_(self, v14, Element, (uint64_t)&value, v5);
  if (!Value_value_options)
  {
    v16 = IOHIDValueGetElement(value);
    v17 = [HIDLibElement alloc];
    v21 = (void *)objc_msgSend_initWithElementRef_(v17, v18, (uint64_t)v16, v19, v20);
    objc_msgSend_setValueRef_(v21, v22, (uint64_t)value, v23, v24);
    v29 = objc_msgSend_length(v21, v25, v26, v27, v28);
    a4->type = objc_msgSend_type(v21, v30, v31, v32, v33);
    a4->elementCookie = objc_msgSend_elementCookie(v21, v34, v35, v36, v37);
    a4->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v21, v38, v39, v40, v41);
    v46 = v29;
    if (v29 < 5uLL)
    {
      a4->longValueSize = 0;
      a4->longValue = 0;
      a4->value = objc_msgSend_integerValue(v21, v42, v43, v44, v45);
    }
    else
    {
      a4->longValueSize = v29;
      v47 = malloc_type_malloc(v29, 0x791AB51BuLL);
      a4->longValue = v47;
      BytePtr = IOHIDValueGetBytePtr(value);
      memmove(v47, BytePtr, v46);
    }

  }
  return Value_value_options;
}

- (IOHIDOutputTransactionClass)initWithDevice:(id)a3
{
  IOHIDOutputTransactionClass *v3;
  IOHIDOutputTransactionClass *v4;
  char *v5;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v8;
  IOHIDOutputTransactionClass *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IOHIDOutputTransactionClass;
  v3 = -[IOHIDTransactionClass initWithDevice:](&v11, sel_initWithDevice_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super._direction = 1;
    v5 = (char *)malloc_type_malloc(0x98uLL, 0x800407567D3B1uLL);
    v4->_outputInterface = (IOHIDOutputTransactionInterface *)v5;
    vtbl = v4->super.super._vtbl;
    Release = vtbl->Release;
    v8 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v5 = v4;
    *(_OWORD *)(v5 + 8) = v8;
    *((_QWORD *)v5 + 3) = Release;
    *((_QWORD *)v5 + 4) = sub_2310D6F04;
    *((_QWORD *)v5 + 5) = sub_2310D6F7C;
    *((_QWORD *)v5 + 6) = sub_2310D6FC0;
    *((_QWORD *)v5 + 7) = sub_2310D7008;
    *((_QWORD *)v5 + 8) = sub_2310D704C;
    *((_QWORD *)v5 + 9) = sub_2310D7054;
    *((_QWORD *)v5 + 10) = sub_2310D705C;
    *((_QWORD *)v5 + 11) = sub_2310D70CC;
    *((_QWORD *)v5 + 12) = sub_2310D713C;
    *((_QWORD *)v5 + 13) = sub_2310D71B8;
    *((_QWORD *)v5 + 14) = sub_2310D71D0;
    *((_QWORD *)v5 + 15) = sub_2310D71E8;
    *((_QWORD *)v5 + 16) = sub_2310D7200;
    *((_QWORD *)v5 + 17) = sub_2310D7218;
    *((_QWORD *)v5 + 18) = sub_2310D7234;
    v9 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_outputInterface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDOutputTransactionClass;
  -[IOHIDTransactionClass dealloc](&v3, sel_dealloc);
}

@end
