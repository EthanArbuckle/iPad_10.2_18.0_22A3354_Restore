@implementation NSNumber(BRAdditions)

- (uint64_t)br_roundedLongLongValue
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v2, "setUsesSignificantDigits:", 1);
  objc_msgSend(v2, "setMaximumSignificantDigits:", 2);
  if (objc_msgSend(a1, "compare:", &unk_1E3DC2B10) == -1)
    objc_msgSend(v2, "setMaximumSignificantDigits:", 1);
  objc_msgSend(v2, "stringFromNumber:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "longLongValue");
  else
    v6 = 0;

  return v6;
}

- (uint64_t)br_isEqualToNumber:()BRAdditions
{
  if (a3)
    return objc_msgSend(a1, "isEqualToNumber:");
  else
    return 0;
}

@end
