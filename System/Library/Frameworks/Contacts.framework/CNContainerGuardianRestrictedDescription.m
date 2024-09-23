@implementation CNContainerGuardianRestrictedDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62D0];
}

- (id)CNValueFromABValue:(void *)a3
{
  if ((objc_msgSend(a3, "intValue") & 4) != 0)
    return (id)MEMORY[0x1E0C9AAB0];
  else
    return (id)MEMORY[0x1E0C9AAA0];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setGuardianRestricted:", objc_msgSend(a3, "BOOLValue"));

}

- (id)key
{
  return CFSTR("guardianRestricted");
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWritable
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isGuardianRestricted"));
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  void *v6;

  if (!a3)
    return 1;
  v6 = a3;
  -[CNContainerGuardianRestrictedDescription abPropertyID](self, "abPropertyID");
  ABRecordGetIntValue();
  objc_msgSend(v6, "intValue");

  -[CNContainerGuardianRestrictedDescription abPropertyID](self, "abPropertyID");
  return ABRecordSetIntValue();
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v3;

  if (objc_msgSend(a3, "BOOLValue"))
    v3 = 4;
  else
    v3 = 0;
  return (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
}

@end
