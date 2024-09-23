@implementation NSData(NSDataExtensions)

- (id)mf_subdataWithRange:()NSDataExtensions
{
  _BOOL8 v7;

  v7 = 0;
  if (sDefaultThreshold <= a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v7 = 1;
    }
  }
  return -[MFData _initWithRange:from:retainingParent:]([MFData alloc], "_initWithRange:from:retainingParent:", a3, a4, a1, v7);
}

- (uint64_t)mf_immutable
{
  return 0;
}

@end
