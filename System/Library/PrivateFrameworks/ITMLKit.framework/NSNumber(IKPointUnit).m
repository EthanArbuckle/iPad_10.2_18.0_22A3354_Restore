@implementation NSNumber(IKPointUnit)

- (uint64_t)ik_unit
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_ik_unit);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)ik_setUnit:()IKPointUnit
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_ik_unit, v2, (void *)1);

}

- (const)ik_unitStringValue
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "ik_unit");
  v2 = &stru_1E9F50578;
  if (v1 == 2)
    v2 = CFSTR("%");
  if (v1 == 1)
    return CFSTR("pt");
  else
    return v2;
}

@end
