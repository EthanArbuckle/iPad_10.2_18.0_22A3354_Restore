@implementation CFPDMirroredSource

- (CFPDMirroredSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 mirroredKeys:(__CFArray *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  _BOOL4 v10;
  _BOOL8 v11;
  CFPDMirroredSource *v14;
  uint64_t Count;
  CFIndex i;
  __CFSet *mirroredKeys;
  const void *ValueAtIndex;
  int v19;
  __CFString *v20;
  CFStringRef v21;
  objc_super v23;
  uint64_t v24;

  v10 = a6;
  v11 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CFPDMirroredSource;
  v14 = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:](&v23, sel_initWithDomain_userName_byHost_managed_shmemIndex_daemon_, a3, a4, a5, a6, a8, a9);
  if (v14)
  {
    Count = CFArrayGetCount(a7);
    v14->_mirroredKeys = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFCopyStringSetCallBacks);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        mirroredKeys = v14->_mirroredKeys;
        ValueAtIndex = CFArrayGetValueAtIndex(a7, i);
        CFSetAddValue(mirroredKeys, ValueAtIndex);
      }
    }
    v19 = CFEqual(a3, CFSTR("kCFPreferencesAnyApplication"));
    v20 = CFSTR(".GlobalPreferences");
    if (!v19)
      v20 = a3;
    v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@_m"), v20);
    v14->_mirrorSource = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]([CFPDSource alloc], "initWithDomain:userName:byHost:managed:shmemIndex:daemon:", v21, a4, v11, v10, 0, 0);
    CFRelease(v21);
  }
  return v14;
}

- (void)lock
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource lock](&v3, sel_lock);
  -[CFPDSource lock](self->_mirrorSource, "lock");
}

- (void)unlock
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[CFPDSource unlock](self->_mirrorSource, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource unlock](&v3, sel_unlock);
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  unsigned int v11;
  char v13;
  objc_super v14;
  uint64_t v15;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  v14.receiver = self;
  v14.super_class = (Class)CFPDMirroredSource;
  v11 = -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:](&v14, sel_cacheFileInfoForWriting_euid_egid_didCreate_, v9, v8, v7, a6);
  if (v11 <= 1)
  {
    v13 = 0;
    -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:](self->_mirrorSource, "cacheFileInfoForWriting:euid:egid:didCreate:", v9, v8, v7, &v13);
  }
  return v11;
}

- (id)acceptMessage:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CFPDMirroredSource;
  v5 = -[CFPDSource acceptMessage:](&v10, sel_acceptMessage_);
  if (xpc_dictionary_get_int64(a3, "CFPreferencesOperation") == 1
    && !xpc_dictionary_get_value(v5, "CFPreferencesErrorType")
    && (_CFPrefsDecodeKeyValuePairFromXPCMessage(a3, 0, 0, 0) & 1) == 0)
  {
    v6 = -[CFPDSource copyPropertyListValidatingPlist:](self->_mirrorSource, "copyPropertyListValidatingPlist:", 0);
    v7 = (void *)objc_msgSend(v6, "copyXPCData");
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_value(v5, "CFPreferencesValidationPropertyList", v7);
      xpc_release(v8);
    }

  }
  -[CFPDSource closeFileDescriptors]((uint64_t)self->_mirrorSource);
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFRelease(self->_mirroredKeys);

  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource dealloc](&v3, sel_dealloc);
}

- (void)enqueueMirrorSignatureForKey:(xpc_object_t)xdict fromMessage:
{
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v8;
  uint64_t v9;
  uint64_t pid;
  uint64_t v11;
  const char *v12;
  __CFString *v13;
  __CFString *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  tm v17;
  timeval v18;
  _OWORD buffer[4];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    memset(buffer, 0, sizeof(buffer));
    remote_connection = xpc_dictionary_get_remote_connection(xdict);
    if (!remote_connection)
    {
      value = (_xpc_connection_s *)xpc_dictionary_get_value(xdict, "connection");
      if (!value
        || (remote_connection = value, value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
      {
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:].cold.1((uint64_t)value, v8, v9);
      }
    }
    pid = xpc_connection_get_pid(remote_connection);
    v11 = pid;
    v12 = "Unknown";
    if ((_DWORD)pid != -1 && proc_name(pid, buffer, 0x40u) >= 0)
      v12 = (const char *)buffer;
    v18.tv_sec = 0;
    *(_QWORD *)&v18.tv_usec = 0;
    memset(&v17, 0, sizeof(v17));
    gettimeofday(&v18, 0);
    localtime_r(&v18.tv_sec, &v17);
    v13 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s(%d): %04d-%02d-%02d %02d:%02d:%02d (%s)"), v12, v11, (v17.tm_year + 1900), (v17.tm_mon + 1), v17.tm_mday, v17.tm_hour, v17.tm_min, v17.tm_sec, v17.tm_zone);
    v14 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s%@"), "Sig_", a2);
    v15 = _CFXPCCreateXPCObjectFromCFObject(v14);
    v16 = _CFXPCCreateXPCObjectFromCFObject(v13);
    objc_msgSend(*(id *)(a1 + 152), "enqueueNewKey:value:encoding:inBatch:fromMessage:", v15, v16, 0, 0, xdict);
    CFRelease(v13);
    CFRelease(v14);
    xpc_release(v15);
    xpc_release(v16);
  }
}

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  const char *string_ptr;
  CFStringRef v14;
  CFStringRef v15;
  objc_super v17;
  _QWORD v18[6];

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v18[5] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    v14 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, string_ptr, 0x8000100u);
    if (v14)
    {
      v15 = v14;
      if (CFSetContainsValue(self->_mirroredKeys, v14))
      {
        if (!a4 || object_getClass(a4) == (Class)MEMORY[0x1E0C81350])
        {
          CFRelease(v15);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __ERROR_WRITE_REJECTED_block_invoke;
          v18[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
          v18[4] = "the key cannot be deleted";
          _extractCFPDBits(a7, a3, self, (uint64_t)v18);
          return 0;
        }
        -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:](self->_mirrorSource, "enqueueNewKey:value:encoding:inBatch:fromMessage:", a3, a4, v9, v8, a7);
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:]((uint64_t)self, (uint64_t)v15, a7);
      }
      CFRelease(v15);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:](&v17, sel_enqueueNewKey_value_encoding_inBatch_fromMessage_, a3, a4, v9, v8, a7);
  return 1;
}

- (void)drainPendingChanges
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  -[CFPDSource drainPendingChanges](self->_mirrorSource, "drainPendingChanges");
  v3.receiver = self;
  v3.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource drainPendingChanges](&v3, sel_drainPendingChanges);
}

- (id)createDiskWrite
{
  id result;
  id v4;
  id v5;
  _QWORD v6[6];
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  v7.receiver = self;
  v7.super_class = (Class)CFPDMirroredSource;
  result = -[CFPDSource createDiskWrite](&v7, sel_createDiskWrite);
  if (result)
  {
    v4 = result;
    v5 = -[CFPDSource createDiskWrite](self->_mirrorSource, "createDiskWrite");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__CFPDMirroredSource_createDiskWrite__block_invoke;
    v6[3] = &unk_1E13366B8;
    v6[4] = v4;
    v6[5] = v5;
    return (id)objc_msgSend(v6, "copy");
  }
  return result;
}

uint64_t __37__CFPDMirroredSource_createDiskWrite__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      v2 = (*(uint64_t (**)(void))(v3 + 16))();
    else
      v2 = 0;
  }

  return v2;
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  v5.receiver = self;
  v5.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource handleWritingResult:](&v5, sel_handleWritingResult_, a3);
  -[CFPDSource handleWritingResult:](self->_mirrorSource, "handleWritingResult:", a3);
}

- (void)clearCacheForReason:(__CFString *)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[CFPDSource clearCacheForReason:](self->_mirrorSource, "clearCacheForReason:");
  v5.receiver = self;
  v5.super_class = (Class)CFPDMirroredSource;
  -[CFPDSource clearCacheForReason:](&v5, sel_clearCacheForReason_, a3);
}

- (void)enqueueMirrorSignatureForKey:(uint64_t)a3 fromMessage:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end
