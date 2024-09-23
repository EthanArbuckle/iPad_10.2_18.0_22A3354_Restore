@implementation MLMultiArrayUtils

+ (id)stringForDataType:(int64_t)a3
{
  __CFString *v3;

  if (a3 > 65599)
  {
    if (a3 == 65600)
      return CFSTR("Double");
    if (a3 == 131104)
      return CFSTR("Int32");
    goto LABEL_10;
  }
  if (a3 == 65552)
    return CFSTR("Float16");
  if (a3 != 65568)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLMultiArrayDataTypeInvalid (%d)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("Float32");
  return v3;
}

@end
