@implementation NSMutableData

+ (CFMutableDataRef)mutableSensitiveDataWithMaxCapacity:(uint64_t)a1
{
  const __CFAllocator *v3;

  objc_opt_self();
  if (!a2)
    return 0;
  v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
  return CFDataCreateMutable(v3, a2);
}

+ (__CFData)mutableSensitiveDataPrefilledWithMaxCapacity:(uint64_t)a1
{
  const __CFAllocator *v3;
  __CFData *Mutable;
  __CFData *v5;

  objc_opt_self();
  if (!a2)
    return 0;
  v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
  Mutable = CFDataCreateMutable(v3, a2);
  v5 = Mutable;
  if (Mutable)
    CFDataSetLength(Mutable, a2);
  return v5;
}

@end
