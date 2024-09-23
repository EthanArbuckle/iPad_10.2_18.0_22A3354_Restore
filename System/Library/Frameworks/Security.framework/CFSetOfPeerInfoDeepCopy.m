@implementation CFSetOfPeerInfoDeepCopy

void __CFSetOfPeerInfoDeepCopy_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v10;
  const void *v11;
  NSObject *v12;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  CFTypeRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v10 = (const void *)SOSPeerInfoCreateCopy(*(const __CFAllocator **)(a1 + 40), a2, &cf, a4, a5, a6, a7, a8);
  if (v10)
  {
    v11 = v10;
    CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
    CFRelease(v11);
  }
  else
  {
    v12 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = a2;
      v16 = 2112;
      v17 = cf;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "Failed to copy peer: %@ (%@)", buf, 0x16u);
    }
  }
  if (cf)
    CFRelease(cf);
}

@end
