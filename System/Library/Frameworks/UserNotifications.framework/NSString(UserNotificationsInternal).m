@implementation NSString(UserNotificationsInternal)

- (id)un_stringWithMaxLength:()UserNotificationsInternal
{
  id v5;

  if (objc_msgSend(a1, "length") <= a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)un_unsignedLongLongValue
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a1);
  objc_msgSend(v1, "scanUnsignedLongLong:", &v4);
  v2 = v4;

  return v2;
}

@end
