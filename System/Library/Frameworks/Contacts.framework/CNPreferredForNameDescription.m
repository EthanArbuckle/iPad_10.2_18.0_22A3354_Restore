@implementation CNPreferredForNameDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6098];
  return a3 != 0;
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:length:](CNiOSABConversions, "numberFromIntegerABBytes:length:", a3, a4);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)a4 + 336), CFSTR("_preferredForName"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isPreferredForName"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setPreferredForName:", objc_msgSend(a3, "BOOLValue"));

}

- (CNPreferredForNameDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("preferredForName"), sel_isPreferredForName, sel_setPreferredForName_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _BYTE *v5;

  v5 = a4;
  v5[336] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preferredForName"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((_BYTE *)a3 + 336) == 0) ^ (*((_BYTE *)a4 + 336) != 0);
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  void *v4;

  if (ABRecordGetIntValue())
    return (void *)*MEMORY[0x1E0C9AE50];
  v4 = (void *)*MEMORY[0x1E0C9AE40];
  if (ABRecordGetIntValue() == -1)
    return (void *)*MEMORY[0x1E0C9AE50];
  else
    return v4;
}

@end
