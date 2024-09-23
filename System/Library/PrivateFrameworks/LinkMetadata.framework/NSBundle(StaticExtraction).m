@implementation NSBundle(StaticExtraction)

+ (id)ln_uniqueBundleWithURL:()StaticExtraction
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initUniqueWithURL:", v4);

  return v5;
}

+ (id)ln_uniqueBundleWithPath:()StaticExtraction
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initUniqueWithPath:", v4);

  return v5;
}

@end
