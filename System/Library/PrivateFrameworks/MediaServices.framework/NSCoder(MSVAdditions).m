@implementation NSCoder(MSVAdditions)

- (void)encodeTCCIdentity:()MSVAdditions forKey:
{
  void *v4;
  id v5;
  uint64_t type;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a3;
    objc_msgSend(v4, "stringWithUTF8String:", tcc_identity_get_identifier());
    v7 = (id)objc_claimAutoreleasedReturnValue();
    type = tcc_identity_get_type();

    objc_msgSend(a1, "encodeObject:forKey:", v7, CFSTR("tccIdentifier"));
    objc_msgSend(a1, "encodeInt64:forKey:", type, CFSTR("tccType"));

  }
}

- (id)decodeTCCIdentityForKey:()MSVAdditions
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "decodeInt64ForKey:", CFSTR("tccType"));
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tccIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    v4 = (void *)tcc_identity_create();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)msv_userInfo
{
  void *v1;
  void *v2;
  id v3;

  objc_getAssociatedObject(a1, (const void *)_MSVCoderUserInfoKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA70];
  v3 = v1;

  return v3;
}

- (void)msv_setUserInfo:()MSVAdditions
{
  objc_setAssociatedObject(a1, (const void *)_MSVCoderUserInfoKey, a3, (void *)3);
}

@end
