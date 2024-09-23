const void *IOImageLoaderImageDictionary::getAttributes(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  CFStringRef v5;
  CFStringRef v6;
  CFIndex Count;
  const void *Value;

  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0x8000100u);
  v6 = v5;
  if (this && v5)
  {
    Count = CFDictionaryGetCount(this);
    Value = 0;
    if (a2 && Count)
      Value = CFDictionaryGetValue(this, v6);
  }
  else
  {
    Value = 0;
    if (!v5)
      return Value;
  }
  CFRelease(v6);
  return Value;
}

const void *IOImageLoaderImageDictionary::getAttributes(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  CFIndex Count;
  __CFDictionary *CStringPtr;
  const char *v7;

  if (!this)
    return 0;
  Count = CFDictionaryGetCount(this);
  if (!a2 || !Count)
    return 0;
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
  return IOImageLoaderImageDictionary::getAttributes(this, CStringPtr, v7);
}

const void *IOImageLoaderImageDictionary::getAttribute(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  CFStringRef v5;
  CFStringRef v6;
  CFIndex Count;
  const void *Value;

  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0x8000100u);
  v6 = v5;
  if (this && v5)
  {
    Count = CFDictionaryGetCount(this);
    Value = 0;
    if (a2 && Count)
      Value = CFDictionaryGetValue(this, v6);
  }
  else
  {
    Value = 0;
    if (!v5)
      return Value;
  }
  CFRelease(v6);
  return Value;
}

const void *IOImageLoaderImageDictionary::getAttribute(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  CFIndex Count;
  __CFDictionary *CStringPtr;
  const char *v7;

  if (!this)
    return 0;
  Count = CFDictionaryGetCount(this);
  if (!a2 || !Count)
    return 0;
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
  return IOImageLoaderImageDictionary::getAttribute(this, CStringPtr, v7);
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithObject(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3, void *a4)
{
  uint64_t result;
  const void *v7;

  result = 0;
  if (this && a2 && a3)
  {
    result = (uint64_t)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0x8000100u);
    if (result)
    {
      v7 = (const void *)result;
      CFDictionarySetValue(this, (const void *)result, a3);
      CFRelease(v7);
      return 1;
    }
  }
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithObject(IOImageLoaderImageDictionary *this, CFStringRef theString, const __CFString *a3, void *a4)
{
  __CFDictionary *CStringPtr;
  void *v7;

  if (!this || !theString || !a3)
    return 0;
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(theString, 0x8000100u);
  return IOImageLoaderImageDictionary::setAttributeWithObject(this, CStringPtr, (const char *)a3, v7);
}

BOOL IOImageLoaderImageDictionary::setAttributeWithString(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3, const char *a4)
{
  _BOOL8 v4;
  const __CFAllocator *v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;

  v4 = 0;
  if (this && a2 && a3)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0x8000100u);
    if (v8)
    {
      v9 = v8;
      v10 = CFStringCreateWithCString(v7, a3, 0x8000100u);
      v4 = v10 != 0;
      if (v10)
      {
        v11 = v10;
        CFDictionarySetValue(this, v9, v10);
        CFRelease(v9);
        v9 = v11;
      }
      CFRelease(v9);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

BOOL IOImageLoaderImageDictionary::setAttributeWithString(IOImageLoaderImageDictionary *this, CFStringRef theString, const __CFString *a3, const __CFString *a4)
{
  __CFDictionary *CStringPtr;
  const char *v7;
  const char *v8;

  if (!this || !theString || !a3)
    return 0;
  CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(theString, 0x8000100u);
  v7 = CFStringGetCStringPtr(a3, 0x8000100u);
  return IOImageLoaderImageDictionary::setAttributeWithString(this, CStringPtr, v7, v8);
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, __CFDictionary *a2, const char *a3)
{
  const __CFAllocator *v6;
  CFStringRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  BOOL v10;
  BOOL v12;
  int v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0x8000100u);
  v16[0] = a3;
  v8 = CFNumberCreate(v6, kCFNumberLongLongType, v16);
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  v12 = v10 || this == 0 || a2 == 0;
  v13 = v12;
  if (v12)
  {
    if (!v8)
    {
      v14 = 0;
      if (!v7)
        return v14;
      goto LABEL_16;
    }
  }
  else
  {
    CFDictionarySetValue(this, v7, v8);
  }
  v14 = v13 ^ 1u;
  CFRelease(v9);
  if (v7)
LABEL_16:
    CFRelease(v7);
  return v14;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3, const __CFNumber *a4)
{
  uint64_t result;
  __CFDictionary *CStringPtr;
  const char *valuePtr[2];

  valuePtr[1] = *(const char **)MEMORY[0x24BDAC8D0];
  valuePtr[0] = 0;
  printf("DEBUG: %s:%d\n", "setAttributeWithNumber", 258);
  result = 0;
  if (this && a2 && a3)
  {
    result = CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, valuePtr);
    if ((_DWORD)result)
    {
      CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
      return IOImageLoaderImageDictionary::setAttributeWithNumber(this, CStringPtr, valuePtr[0]);
    }
  }
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, const __CFString *a2, const __CFString *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  __CFDictionary *CStringPtr;
  uint64_t v8;
  uint64_t result;
  char *v10[2];

  v10[1] = *(char **)MEMORY[0x24BDAC8D0];
  v10[0] = (char *)a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongLongType, v10);
  v6 = v5;
  if (this && a2 && v5)
  {
    CStringPtr = (__CFDictionary *)CFStringGetCStringPtr(a2, 0x8000100u);
    v8 = IOImageLoaderImageDictionary::setAttributeWithNumber(this, CStringPtr, v10[0]);
LABEL_5:
    CFRelease(v6);
    return v8;
  }
  v8 = 0;
  result = 0;
  if (v6)
    goto LABEL_5;
  return result;
}

uint64_t IOImageLoaderImageDictionary::setAttributeWithNumber(IOImageLoaderImageDictionary *this, __CFDictionary *a2, CFNumberRef number, const __CFNumber *a4)
{
  uint64_t result;
  char *v7[2];

  v7[1] = *(char **)MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  if (!number)
    return 0;
  result = CFNumberGetValue(number, kCFNumberLongLongType, v7);
  if ((_DWORD)result)
    return IOImageLoaderImageDictionary::setAttributeWithNumber(this, a2, v7[0]);
  return result;
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

