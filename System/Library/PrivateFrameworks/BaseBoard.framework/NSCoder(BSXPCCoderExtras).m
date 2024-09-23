@implementation NSCoder(BSXPCCoderExtras)

- (void)encodeCollection:()BSXPCCoderExtras forKey:
{
  void *v6;
  id v7;

  objc_msgSend(a3, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "encodeObject:forKey:", v7, a4);
}

- (id)decodeCollectionOfClass:()BSXPCCoderExtras containingClass:forKey:
{
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isNSArray"))
    v10 = (void *)objc_msgSend([a3 alloc], "initWithArray:", v9);
  else
    v10 = 0;

  return v10;
}

- (uint64_t)decodeStringForKey:()BSXPCCoderExtras
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
}

@end
