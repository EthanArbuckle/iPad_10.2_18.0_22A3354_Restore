@implementation NSData

+ (BOOL)isSensitiveDataInstance:(uint64_t)a1
{
  id v2;
  CFAllocatorRef v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = CFGetAllocator(v2);
    v4 = v3 == (CFAllocatorRef)SecCFAllocatorZeroize();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (CFDataRef)sensitiveDataWithData:(uint64_t)a1
{
  const __CFData *v2;
  const __CFAllocator *v3;
  CFDataRef Copy;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
    Copy = CFDataCreateCopy(v3, v2);
  }
  else
  {
    Copy = 0;
  }

  return Copy;
}

+ (CFDataRef)sensitiveDataWithBytes:(CFIndex)a3 length:
{
  const __CFAllocator *v5;

  objc_opt_self();
  if (!a2)
    return 0;
  v5 = (const __CFAllocator *)SecCFAllocatorZeroize();
  return CFDataCreate(v5, a2, a3);
}

@end
