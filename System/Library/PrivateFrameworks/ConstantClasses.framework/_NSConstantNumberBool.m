@implementation _NSConstantNumberBool

- (void)getValue:(void *)a3
{
  *(_BYTE *)a3 = LOBYTE(self[1].super.super.super.super.isa) != 0;
}

- (const)objCType
{
  return "B";
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  void *v4;
  $2F068FC02377E22BA03580A8162C781E *result;
  id v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithBool:", LOBYTE(self[1].super.super.super.super.isa) != 0);
  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "decimalValue");
    v4 = v6;
  }

  return result;
}

- (int)intValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (float)floatValue
{
  return (float)SLOBYTE(self[1].super.super.super.super.isa);
}

- (double)doubleValue
{
  return (double)SLOBYTE(self[1].super.super.super.super.isa);
}

- (BOOL)BOOLValue
{
  return LOBYTE(self[1].super.super.super.super.isa) != 0;
}

- (char)charValue
{
  return (char)self[1].super.super.super.super.isa;
}

- (int64_t)integerValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (int64_t)longValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (int64_t)longLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (signed)shortValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedCharValue
{
  return self[1].super.super.super.super.isa;
}

- (unsigned)unsignedIntValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongLongValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedShortValue
{
  return SLOBYTE(self[1].super.super.super.super.isa);
}

@end
