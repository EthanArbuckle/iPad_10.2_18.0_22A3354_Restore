@implementation NSObject(Intents)

- (id)descriptionAtIndent:()Intents
{
  void *i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n"));
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("    "));
  objc_msgSend(a1, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), i);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_intents_indexingRepresentation
{
  SEL v2;
  void *v3;
  id v4;

  v2 = NSSelectorFromString((NSString *)CFSTR("_dictionaryRepresentation"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(void *, SEL))objc_msgSend(a1, "methodForSelector:", v2))(a1, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_intents_indexingRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = a1;
  }
  return v4;
}

- (SEL)_intents_setterForPropertyWithName:()Intents
{
  const char *v3;
  objc_class *v4;
  objc_property *Property;
  char *v6;
  char *v7;
  NSString *v8;
  void *v9;
  void *v10;
  SEL v11;
  SEL v12;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 1);
  v4 = (objc_class *)objc_opt_class();
  Property = class_getProperty(v4, v3);
  v6 = property_copyAttributeValue(Property, "S");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 1);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), (char)__toupper(*v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v3 + 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set%@%@:"), v9, v10);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v11 = NSSelectorFromString(v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

@end
