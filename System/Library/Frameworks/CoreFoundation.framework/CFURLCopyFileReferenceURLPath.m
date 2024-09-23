@implementation CFURLCopyFileReferenceURLPath

CFArrayRef ___CFURLCopyFileReferenceURLPath_block_invoke(uint64_t a1)
{
  CFArrayRef result;
  void *values[7];

  values[6] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = CFSTR("NSURLIsDirectoryKey");
  values[1] = CFSTR("_NSURLVolumeIsHFSStandardKey");
  values[2] = CFSTR("_NSURLVolumeIDKey");
  values[3] = CFSTR("_NSURLFileIDKey");
  values[4] = CFSTR("_NSURLParentDirectoryIDKey");
  values[5] = CFSTR("NSURLNameKey");
  result = CFArrayCreate(*(CFAllocatorRef *)(a1 + 32), (const void **)values, 6, &kCFTypeArrayCallBacks);
  _CFURLCopyFileReferenceURLPath_sPropertyKeys = (uint64_t)result;
  return result;
}

@end
