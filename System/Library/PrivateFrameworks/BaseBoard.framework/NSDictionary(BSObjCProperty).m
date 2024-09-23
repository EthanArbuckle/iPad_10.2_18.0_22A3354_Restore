@implementation NSDictionary(BSObjCProperty)

+ (id)bsobjc_attributesForProperty:()BSObjCProperty
{
  void *v4;
  objc_property_attribute_t *v5;
  objc_property_attribute_t *v6;
  unint64_t v7;
  const char **p_value;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int outCount;

  v4 = (void *)objc_opt_new();
  outCount = 0;
  v5 = property_copyAttributeList(a3, &outCount);
  v6 = v5;
  if (outCount)
  {
    v7 = 0;
    p_value = &v5->value;
    do
    {
      v9 = (uint64_t)*(p_value - 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", *p_value);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      ++v7;
      p_value += 2;
    }
    while (v7 < outCount);
    goto LABEL_6;
  }
  if (v5)
LABEL_6:
    free(v6);
  return v4;
}

@end
