@implementation CFBundleCreateMappedBPlistFile

uint64_t ___CFBundleCreateMappedBPlistFile_block_invoke(uint64_t a1, const void *a2)
{
  const __CFArray *Mutable;
  CFIndex Count;

  if (!*(_BYTE *)(a1 + 32))
    return -1;
  os_unfair_lock_lock_with_options();
  if (a2)
  {
    Mutable = (const __CFArray *)_mappedStringsFiles;
    if (!_mappedStringsFiles)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
      _mappedStringsFiles = (uint64_t)Mutable;
    }
    Count = CFArrayGetCount(Mutable);
    CFArrayAppendValue((CFMutableArrayRef)_mappedStringsFiles, a2);
  }
  else
  {
    Count = -1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_mappedStringsFilesLock);
  return Count;
}

@end
