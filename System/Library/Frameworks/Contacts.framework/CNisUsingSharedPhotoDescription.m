@implementation CNisUsingSharedPhotoDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)a4 + 376), CFSTR("_isUsingSharedPhoto"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setIsUsingSharedPhoto:", objc_msgSend(a3, "BOOLValue"));

}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isUsingSharedPhoto"));
}

- (CNisUsingSharedPhotoDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("isUsingSharedPhoto"), sel_isUsingSharedPhoto, sel_setIsUsingSharedPhoto_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _BYTE *v5;

  v5 = a4;
  v5[376] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isUsingSharedPhoto"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((_BYTE *)a3 + 376) == 0) ^ (*((_BYTE *)a4 + 376) != 0);
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
  return (void *)*MEMORY[0x1E0C9AE40];
}

@end
