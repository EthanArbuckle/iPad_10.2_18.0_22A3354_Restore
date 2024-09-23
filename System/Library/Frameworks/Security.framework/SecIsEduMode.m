@implementation SecIsEduMode

void __SecIsEduMode_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const void *v3;
  const void **v4;
  void *v5;
  void *v6;
  CFTypeRef *v7;
  void *v8;
  NSObject *v9;
  void *value;
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  void *v14;

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2000000000;
  v0 = getMKBUserTypeDeviceModeSymbolLoc_ptr;
  v14 = getMKBUserTypeDeviceModeSymbolLoc_ptr;
  if (!getMKBUserTypeDeviceModeSymbolLoc_ptr)
  {
    v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBUserTypeDeviceMode");
    *((_QWORD *)v12 + 3) = v0;
    getMKBUserTypeDeviceModeSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(buf, 8);
  if (!v0)
  {
LABEL_18:
    dlerror();
    abort_report_np();
    MobileKeyBagLibrary();
    return;
  }
  v2 = ((uint64_t (*)(_QWORD, _QWORD))v0)(0, 0);
  if (v2)
  {
    v3 = (const void *)v2;
    value = 0;
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2000000000;
    v4 = (const void **)getkMKBDeviceModeKeySymbolLoc_ptr;
    v14 = (void *)getkMKBDeviceModeKeySymbolLoc_ptr;
    if (!getkMKBDeviceModeKeySymbolLoc_ptr)
    {
      v5 = (void *)MobileKeyBagLibrary();
      v4 = (const void **)dlsym(v5, "kMKBDeviceModeKey");
      *((_QWORD *)v12 + 3) = v4;
      getkMKBDeviceModeKeySymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(buf, 8);
    if (v4)
    {
      if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, *v4, (const void **)&value))
      {
LABEL_14:
        CFRelease(v3);
        return;
      }
      v6 = value;
      *(_QWORD *)buf = 0;
      v12 = buf;
      v13 = 0x2000000000;
      v7 = (CFTypeRef *)getkMKBDeviceModeSharedIPadSymbolLoc_ptr;
      v14 = (void *)getkMKBDeviceModeSharedIPadSymbolLoc_ptr;
      if (!getkMKBDeviceModeSharedIPadSymbolLoc_ptr)
      {
        v8 = (void *)MobileKeyBagLibrary();
        v7 = (CFTypeRef *)dlsym(v8, "kMKBDeviceModeSharedIPad");
        *((_QWORD *)v12 + 3) = v7;
        getkMKBDeviceModeSharedIPadSymbolLoc_ptr = (uint64_t)v7;
      }
      _Block_object_dispose(buf, 8);
      if (v7)
      {
        if (CFEqual(v6, *v7))
          SecIsEduMode_result = 1;
        goto LABEL_14;
      }
    }
    goto LABEL_18;
  }
  v9 = secLogObjForScope("edumode");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "Cannot determine because deviceMode is NULL", buf, 2u);
  }
}

@end
