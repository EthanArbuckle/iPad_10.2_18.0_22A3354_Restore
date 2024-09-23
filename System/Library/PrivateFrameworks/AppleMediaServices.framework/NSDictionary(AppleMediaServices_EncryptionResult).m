@implementation NSDictionary(AppleMediaServices_EncryptionResult)

- (void)ams_encryptionResult
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("iv"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v4 && v5)
  {
    *a2 = v6;
    a2[1] = v4;
    a2[2] = v5;
  }
  else
  {
    __copy_constructor_8_8_s0_s8_s16(a2);
  }

}

+ (id)ams_dictionaryWithEncryptionResult:()AppleMediaServices_EncryptionResult
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "ams_setNullableObject:forKey:", *a3, CFSTR("data"));
  objc_msgSend(v4, "ams_setNullableObject:forKey:", a3[1], CFSTR("iv"));
  objc_msgSend(v4, "ams_setNullableObject:forKey:", a3[2], CFSTR("tag"));
  v5 = (void *)objc_msgSend(v4, "copy");

  __destructor_8_s0_s8_s16(a3);
  return v5;
}

@end
