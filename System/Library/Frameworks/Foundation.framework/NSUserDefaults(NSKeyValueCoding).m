@implementation NSUserDefaults(NSKeyValueCoding)

- (uint64_t)valueForKey:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (!v5)
    return objc_msgSend(a1, "objectForKey:", a3);
  v6 = v5;
  if (objc_msgSend(a3, "characterAtIndex:", 0) != 64)
    return objc_msgSend(a1, "objectForKey:", a3);
  v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
  if (!v7)
    return objc_msgSend(a1, "objectForKey:", a3);
  v8 = (void *)v7;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EDCFA068;
  v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

  return (uint64_t)v9;
}

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  if (a3)
    return objc_msgSend(a1, "setObject:forKey:");
  else
    return objc_msgSend(a1, "removeObjectForKey:", a4);
}

@end
