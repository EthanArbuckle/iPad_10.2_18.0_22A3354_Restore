@implementation _NSConstantNumberInt

- (void)getValue:(void *)a3
{
  *(_DWORD *)a3 = self[1].super.super.super.super.isa;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  void *v4;
  $2F068FC02377E22BA03580A8162C781E *result;
  id v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInt:", LODWORD(self[1].super.super.super.super.isa));
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

- (const)objCType
{
  return "i";
}

- (BOOL)BOOLValue
{
  return LODWORD(self[1].super.super.super.super.isa) != 0;
}

- (char)charValue
{
  return (char)self[1].super.super.super.super.isa;
}

- (int)intValue
{
  return (int)self[1].super.super.super.super.isa;
}

- (float)floatValue
{
  return (float)SLODWORD(self[1].super.super.super.super.isa);
}

- (double)doubleValue
{
  return (double)SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)integerValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)longValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (int64_t)longLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (signed)shortValue
{
  return (signed __int16)self[1].super.super.super.super.isa;
}

- (unsigned)unsignedCharValue
{
  return self[1].super.super.super.super.isa;
}

- (unsigned)unsignedIntValue
{
  return self[1].super.super.super.super.isa;
}

- (unint64_t)unsignedLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (unint64_t)unsignedLongLongValue
{
  return SLODWORD(self[1].super.super.super.super.isa);
}

- (unsigned)unsignedShortValue
{
  return (unsigned __int16)self[1].super.super.super.super.isa;
}

@end
