@implementation NSArray(HFUtilities)

+ (id)hf_arrayWithNumbersInRange:()HFUtilities stride:
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v8 = (void *)objc_opt_new();
  v9 = a3 + a4;
  if (!__CFADD__(a3, a4))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

      a3 += a5;
    }
    while (a3 <= v9);
  }
  v11 = (void *)objc_msgSend(v8, "copy");

  return v11;
}

@end
