@implementation NSHTTPCookie(NSSecureCoding_Temporary)

- (void)encodeWithCoder:()NSSecureCoding_Temporary
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "properties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("properties"));

}

+ (uint64_t)classesForPropertyCoding
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_msgSend(MEMORY[0x1E0C99D20], "classForKeyedUnarchiver");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "classForKeyedUnarchiver");
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "classForKeyedUnarchiver");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "classForKeyedUnarchiver");
  v5 = objc_msgSend(MEMORY[0x1E0C99D68], "classForKeyedUnarchiver");
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_msgSend(MEMORY[0x1E0C99E38], "classForKeyedUnarchiver"), 0);
}

- (id)initWithCoder:()NSSecureCoding_Temporary
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classesForPropertyCoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    a1 = (id)objc_msgSend(a1, "initWithProperties:", v6);
    v7 = a1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

@end
