@implementation NSMutableDictionary(CMSCodingUtils)

- (void)cmsSetOptionalCodedObject:()CMSCodingUtils forKey:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v9, "cmsCoded"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
      objc_msgSend(a1, "setObject:forKey:", v7, v6);

    }
    else
    {
      objc_msgSend(a1, "removeObjectForKey:", v6);
    }
  }

}

- (void)cmsSetNullableCodedObject:()CMSCodingUtils forKey:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v9, "cmsCoded"), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    objc_msgSend(a1, "setObject:forKey:", v7, v6);

  }
}

- (uint64_t)cmsSetOptionalObject:()CMSCodingUtils forKey:
{
  if (a3)
    return objc_msgSend(a1, "setObject:forKey:");
  else
    return objc_msgSend(a1, "removeObjectForKey:", a4);
}

- (void)cmsSetNullableObject:()CMSCodingUtils forKey:
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCEF8];
    v7 = a4;
    objc_msgSend(v6, "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:");

  }
}

@end
