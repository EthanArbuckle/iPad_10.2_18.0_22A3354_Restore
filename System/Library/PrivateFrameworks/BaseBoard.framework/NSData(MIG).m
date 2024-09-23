@implementation NSData(MIG)

+ (CFDataRef)bs_dataWithVMAllocatedBytes:()MIG length:
{
  CFDataRef v4;
  const __CFAllocator *v7;
  CFAllocatorContext v9;

  v4 = 0;
  if (a3 && a4)
  {
    v9.version = 0;
    memset(&v9.retain, 0, 40);
    v9.info = a4;
    v9.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
    v9.preferredSize = 0;
    v7 = CFAllocatorCreate(0, &v9);
    v4 = CFDataCreateWithBytesNoCopy(0, a3, (CFIndex)a4, v7);
    CFRelease(v7);
  }
  return v4;
}

- (uint64_t)bs_bytesForMIG
{
  return objc_msgSend(objc_retainAutorelease(a1), "bytes");
}

- (unint64_t)bs_lengthForMIG
{
  unint64_t v4;
  void *v6;

  v4 = objc_msgSend(a1, "length");
  if (HIDWORD(v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSData+MIG.m"), 39, CFSTR("length is too long : %llu"), v4);

  }
  return v4;
}

@end
