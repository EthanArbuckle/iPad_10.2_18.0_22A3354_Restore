@implementation NSObject(INJSONSerialization)

- (uint64_t)_intents_isValidKey:()INJSONSerialization
{
  NSString *v4;
  uint64_t v5;

  v4 = a3;
  NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(a1, "_isValidKey:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_setterForProperty:()INJSONSerialization
{
  const char *v3;
  objc_class *v4;
  objc_property *Property;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 1);
  v4 = (objc_class *)objc_opt_class();
  Property = class_getProperty(v4, v3);
  v6 = property_copyAttributeValue(Property, "S");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("set")) && (unint64_t)objc_msgSend(v7, "length") >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), (char)__tolower(objc_msgSend(v7, "characterAtIndex:", 3)));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringFromIndex:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(":"));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "substringToIndex:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    free(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
