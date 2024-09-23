@implementation HIDLibElement

- (HIDLibElement)initWithElementRef:(__IOHIDElement *)a3
{
  HIDLibElement *v4;
  BOOL v5;
  HIDLibElement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HIDLibElement;
  v4 = -[HIDLibElement init](&v8, sel_init);
  if (v4)
    v5 = a3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    CFRetain(a3);
    v4->_element = a3;
    v6 = v4;
  }

  return v6;
}

- (HIDLibElement)initWithElementStruct:(IOHIDElementStruct *)a3 parent:(__IOHIDElement *)a4 index:(unsigned int)a5
{
  HIDLibElement *v6;
  HIDLibElement *v7;
  CFMutableDataRef Mutable;
  HIDLibElement *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HIDLibElement;
  v6 = -[HIDLibElement init](&v11, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  v6->_element = 0;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1);
  memmove(&v7->_elementStruct, a3, 0x60uLL);
  if (Mutable)
  {
    v7->_element = (__IOHIDElement *)_IOHIDElementCreateWithParentAndData();
    CFRelease(Mutable);
  }
  if (v7->_element)
    v9 = v7;
  else
LABEL_6:
    v9 = 0;

  return v9;
}

- (void)dealloc
{
  __IOHIDValue *defaultValue;
  __IOHIDElement *element;
  objc_super v5;

  defaultValue = self->_defaultValue;
  if (defaultValue)
    CFRelease(defaultValue);
  element = self->_element;
  if (element)
    CFRelease(element);
  v5.receiver = self;
  v5.super_class = (Class)HIDLibElement;
  -[HIDLibElement dealloc](&v5, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  __IOHIDElement *element;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = (void *)MEMORY[0x24BDD17C8];
  element = self->_element;
  v8 = objc_msgSend_type(self, a2, v2, v3, v4);
  v13 = objc_msgSend_usagePage(self, v9, v10, v11, v12);
  v18 = objc_msgSend_usage(self, v14, v15, v16, v17);
  v23 = objc_msgSend_elementCookie(self, v19, v20, v21, v22);
  v28 = objc_msgSend_integerValue(self, v24, v25, v26, v27);
  return (id)objc_msgSend_stringWithFormat_(v6, v29, (uint64_t)CFSTR("element: %p type: %d uP: 0x%02x u: 0x%02x cookie: %d val: %ld"), v30, v31, element, v8, v13, v18, v23, v28);
}

- (BOOL)isEqualToHIDLibElement:(id)a3
{
  return a3 && self->_element == (__IOHIDElement *)*((_QWORD *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  HIDLibElement *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isEqualToHIDLibElement;

  v4 = (HIDLibElement *)a3;
  if (self == v4)
  {
    isEqualToHIDLibElement = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToHIDLibElement = objc_msgSend_isEqualToHIDLibElement_(self, v5, (uint64_t)v4, v6, v7);
    else
      isEqualToHIDLibElement = 0;
  }

  return isEqualToHIDLibElement;
}

- (__IOHIDElement)elementRef
{
  return self->_element;
}

- (void)setElementRef:(__IOHIDElement *)a3
{
  __IOHIDElement *element;

  element = self->_element;
  if (element != a3)
  {
    if (element)
      CFRelease(element);
    if (a3)
      CFRetain(a3);
    self->_element = a3;
  }
}

- (__IOHIDValue)valueRef
{
  __IOHIDValue *result;

  result = self->_element;
  if (result)
    return (__IOHIDValue *)_IOHIDElementGetValue();
  return result;
}

- (void)setValueRef:(__IOHIDValue *)a3
{
  if (self->_element)
    _IOHIDElementSetValue();
}

- (__IOHIDValue)defaultValueRef
{
  return self->_defaultValue;
}

- (void)setDefaultValueRef:(__IOHIDValue *)a3
{
  __IOHIDValue *defaultValue;

  defaultValue = self->_defaultValue;
  if (defaultValue != a3)
  {
    if (defaultValue)
      CFRelease(defaultValue);
    if (a3)
      CFRetain(a3);
    self->_defaultValue = a3;
  }
}

- (int64_t)integerValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __IOHIDValue *v11;

  result = objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (result)
  {
    v11 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    return IOHIDValueGetIntegerValue(v11);
  }
  return result;
}

- (void)setIntegerValue:(int64_t)a3
{
  const __CFAllocator *v5;
  __IOHIDElement *element;
  uint64_t v7;
  IOHIDValueRef v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  element = self->_element;
  v7 = mach_absolute_time();
  v8 = IOHIDValueCreateWithIntegerValue(v5, element, v7, a3);
  objc_msgSend_setValueRef_(self, v9, (uint64_t)v8, v10, v11);
  if (v8)
    CFRelease(v8);
}

- (NSData)dataValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __IOHIDValue *v12;
  const uint8_t *BytePtr;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __IOHIDValue *v18;
  CFIndex Length;
  const char *v20;
  uint64_t v21;

  v6 = (void *)objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (v6)
  {
    v11 = (void *)MEMORY[0x24BDBCE50];
    v12 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    BytePtr = IOHIDValueGetBytePtr(v12);
    v18 = (__IOHIDValue *)objc_msgSend_valueRef(self, v14, v15, v16, v17);
    Length = IOHIDValueGetLength(v18);
    objc_msgSend_dataWithBytes_length_(v11, v20, (uint64_t)BytePtr, Length, v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v6;
}

- (void)setDataValue:(id)a3
{
  const __CFAllocator *v4;
  __IOHIDElement *element;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const uint8_t *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  IOHIDValueRef v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  element = self->_element;
  v6 = objc_retainAutorelease(a3);
  v11 = (const uint8_t *)objc_msgSend_bytes(v6, v7, v8, v9, v10);
  v16 = objc_msgSend_length(v6, v12, v13, v14, v15);

  v17 = IOHIDValueCreateWithBytes(v4, element, 0, v11, v16);
  objc_msgSend_setValueRef_(self, v18, (uint64_t)v17, v19, v20);
  if (v17)
    CFRelease(v17);
}

- (unint64_t)timestamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __IOHIDValue *v11;

  result = objc_msgSend_valueRef(self, a2, v2, v3, v4);
  if (result)
  {
    v11 = (__IOHIDValue *)objc_msgSend_valueRef(self, v7, v8, v9, v10);
    return IOHIDValueGetTimeStamp(v11);
  }
  return result;
}

- (int64_t)length
{
  int64_t result;

  result = (int64_t)self->_element;
  if (result)
    return _IOHIDElementGetLength();
  return result;
}

- (unsigned)elementCookie
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetCookie(element);
  return element;
}

- (unsigned)collectionCookie
{
  return self->_elementStruct.parentCookie;
}

- (int)type
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetType(element);
  return (int)element;
}

- (unsigned)usage
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetUsage(element);
  return element;
}

- (unsigned)usagePage
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetUsagePage(element);
  return element;
}

- (unsigned)unit
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetUnit(element);
  return element;
}

- (unsigned)unitExponent
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LOBYTE(element) = IOHIDElementGetUnitExponent(element);
  return element;
}

- (unsigned)reportID
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LOBYTE(element) = IOHIDElementGetReportID(element);
  return element;
}

- (unsigned)usageMin
{
  return self->_elementStruct.usageMin;
}

- (unsigned)usageMax
{
  return self->_elementStruct.usageMax;
}

- (int)collectionType
{
  __IOHIDElement *element;

  element = self->_element;
  if (element)
    LODWORD(element) = IOHIDElementGetCollectionType(element);
  return (int)element;
}

- (NSString)psKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPsKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (IOHIDElementStruct)elementStruct
{
  IOHIDElementStruct *result;

  objc_copyStruct(retstr, &self->_elementStruct, 96, 1, 0);
  return result;
}

- (BOOL)isConstant
{
  return self->_isConstant;
}

- (void)setIsConstant:(BOOL)a3
{
  self->_isConstant = a3;
}

- (BOOL)isUpdated
{
  return self->_isUpdated;
}

- (void)setIsUpdated:(BOOL)a3
{
  self->_isUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psKey, 0);
}

@end
