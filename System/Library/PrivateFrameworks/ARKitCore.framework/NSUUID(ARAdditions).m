@implementation NSUUID(ARAdditions)

+ (id)ar_UUIDWithCVPixelBuffer:()ARAdditions
{
  void *BaseAddress;
  size_t BytesPerRow;
  void *v6;
  void *v7;

  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, CVPixelBufferGetHeight(pixelBuffer) * BytesPerRow, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ar_UUIDWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);

  return v7;
}

+ (id)ar_UUIDWithData:()ARAdditions
{
  id v3;
  const void *v4;
  CC_LONG v5;
  __int128 v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  CC_SHA1(v4, v5, md);
  v7 = *(_OWORD *)md;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v7);
}

+ (id)ar_zeroUUID
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  v1[1] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v1);
}

+ (id)ar_UUIDWithIntegerValue:()ARAdditions
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  v4[1] = ~a3;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
}

+ (id)ar_UUIDWithCFUUIDRef:()ARAdditions
{
  CFUUIDBytes v4;

  v4 = CFUUIDGetUUIDBytes(uuid);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v4);
}

- (uint64_t)ar_integerValue
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  return v2[0];
}

- (CFUUIDRef)ar_createCFUUIDRef
{
  CFUUIDBytes v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2.byte0 = 0;
  *(_QWORD *)&v2.byte8 = 0;
  objc_msgSend(a1, "getUUIDBytes:", &v2);
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
}

+ (id)ar_NSUUIDsWithCFArrayRef:()ARAdditions
{
  CFIndex Count;
  void *v5;
  CFIndex i;
  void *v7;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", CFArrayGetValueAtIndex(theArray, i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)ar_NSUUIDSetWithCFArrayRef:()ARAdditions
{
  CFIndex Count;
  void *v5;
  CFIndex i;
  void *v7;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", Count);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", CFArrayGetValueAtIndex(theArray, i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
