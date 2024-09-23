@implementation MDCopyTypePedigree

void __MDCopyTypePedigree_block_invoke()
{
  void *v0;
  const __CFAllocator *v1;
  const CFArrayCallBacks *v2;
  CFArrayRef v3;
  void *v4;
  CFArrayRef v5;
  void *key[4];

  key[3] = *(void **)MEMORY[0x1E0C80C00];
  sParentsFromUTI = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  key[0] = *(void **)MEMORY[0x1E0CA5BA0];
  v0 = key[0];
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)key, 1, MEMORY[0x1E0C9B378]);
  CFDictionarySetValue((CFMutableDictionaryRef)sParentsFromUTI, key[0], v3);
  CFRelease(v3);
  v4 = (void *)*MEMORY[0x1E0CA5B30];
  key[0] = *(void **)MEMORY[0x1E0CA5B58];
  key[1] = v4;
  key[2] = v0;
  v5 = CFArrayCreate(v1, (const void **)key, 3, v2);
  CFDictionarySetValue((CFMutableDictionaryRef)sParentsFromUTI, key[0], v5);
  CFRelease(v5);
}

@end
