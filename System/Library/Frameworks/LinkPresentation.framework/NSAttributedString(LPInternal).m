@implementation NSAttributedString(LPInternal)

- (uint64_t)_lp_stringType
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_getAssociatedObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)_lp_setStringType:()LPInternal
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_stringType, v2, (void *)1);

}

@end
