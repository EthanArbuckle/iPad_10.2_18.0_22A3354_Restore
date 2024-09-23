@implementation CFPrefsManagedSource

- (BOOL)managed
{
  return 1;
}

- (id)initWithDomain:(uint64_t)a3 user:(uint64_t)a4 byHost:(uint64_t)a5 containingPreferences:
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)CFPrefsManagedSource;
    return objc_msgSendSuper2(&v5, sel_initWithDomain_user_byHost_containerPath_containingPreferences_, a2, a3, a4, 0, a5);
  }
  return result;
}

- (uint64_t)sendMessageSettingValue:forKey:
{
  return 0;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  int64_t v7;
  const __CFString *v10;
  const void *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *MutableCopy;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  int64_t *p_generationCount;
  unint64_t v19;
  UInt8 v20[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a5 >= 1)
  {
    v7 = a5;
    do
    {
      v10 = *a4;
      v11 = *a3;
      v12 = -[CFPrefsPlistSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
      if (v12)
      {
        v13 = v12;
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v12);
        if (!MutableCopy)
          MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFRelease(v13);
      }
      else
      {
        MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      if (v11)
        CFDictionarySetValue(MutableCopy, v10, v11);
      else
        CFDictionaryRemoveValue(MutableCopy, v10);
      bzero(v20, 0x400uLL);
      v15 = -[CFPrefsPlistSource userIdentifier](self, "userIdentifier");
      if (CFEqual(v15, CFSTR("kCFPreferencesCurrentUser")))
        v15 = CFCopyUserName();
      else
        CFRetain(v15);
      if (_CFPrefsGetPathForManagedBundleID(-[CFPrefsPlistSource domainIdentifier](self, "domainIdentifier"), v15, 0, v20))
      {
        v16 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const char *)v20);
        if (v16)
        {
          v17 = v16;
          _CFPreferencesWriteDomainDictionaryToPath((unint64_t)MutableCopy, (uint64_t)v16, -[CFPrefsPlistSource domainIdentifier](self, "domainIdentifier"));
          CFRelease(v17);
        }
      }
      CFRelease(v15);
      CFRelease(MutableCopy);
      ++a3;
      ++a4;
      --v7;
    }
    while (v7);
  }
  p_generationCount = &self->super.super._generationCount;
  do
    v19 = __ldaxr((unint64_t *)p_generationCount);
  while (__stlxr(v19 + 1, (unint64_t *)p_generationCount));
}

@end
