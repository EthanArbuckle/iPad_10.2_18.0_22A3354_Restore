@implementation CRAudioCodecStatus

- (CRAudioCodecStatus)init
{
  CRAudioCodecStatus *v2;
  const char *v3;
  uint64_t v4;
  CRAudioCodecStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRAudioCodecStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("AudioCodec"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend_isComponentFailed(self, a2, v2, v3))
    return -1;
  else
    return 1;
}

- (BOOL)isComponentFailed
{
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;
  CFDictionaryRef v5;
  const __CFDictionary *v6;
  kern_return_t MatchingServices;
  kern_return_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v12;
  io_iterator_t existing;
  uint8_t buf[4];
  kern_return_t v15;
  void *v16;
  void *v17;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  values = CFSTR("Codec");
  keys[0] = CFSTR("AudioHardwareError");
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = v5;
  v17 = CFSTR("IOPropertyMatch");
  v6 = CFDictionaryCreate(v2, (const void **)&v17, (const void **)&v16, 1, v3, v4);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v6, &existing);
  if (MatchingServices)
  {
    v8 = MatchingServices;
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v8;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "No AudioHardwareError Codec IO registry, error: %d", buf, 8u);
    }

  }
  else if (existing)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214568B18();

    IOObjectRelease(existing);
    v10 = 1;
    if (v5)
      goto LABEL_6;
    return v10;
  }
  v10 = 0;
  if (v5)
LABEL_6:
    CFRelease(v5);
  return v10;
}

@end
