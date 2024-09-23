@implementation NSDictionary(CMSCodingUtils)

- (BOOL)cmsBoolForKey:()CMSCodingUtils withDefault:
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "compare:", MEMORY[0x24BDBD1C0]);
LABEL_6:
      a4 = v6 != 0;
      goto LABEL_7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "integerValue");
      goto LABEL_6;
    }
  }
LABEL_7:

  return a4;
}

- (uint64_t)cmsOptionalBoolForKey:()CMSCodingUtils
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = MEMORY[0x24BDBD1C0];
    if (objc_msgSend(v1, "compare:", MEMORY[0x24BDBD1C0]))
      v2 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)cmsOptionalNumberForKey:()CMSCodingUtils
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)cmsIntegerForKey:()CMSCodingUtils withDefault:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (uint64_t)cmsUnsignedForKey:()CMSCodingUtils withDefault:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (double)cmsDoubleForKey:()CMSCodingUtils withDefault:
{
  void *v3;
  double v4;

  objc_msgSend(a1, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "doubleValue");
    a2 = v4;
  }

  return a2;
}

- (id)cmsOptionalStringForKey:()CMSCodingUtils
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)cmsOptionalURLForKey:()CMSCodingUtils relativeToURL:
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v7, v6);
    else
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_12:
    v9 = v8;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)cmsOptionalDateForKey:()CMSCodingUtils
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmsDateFormatter();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dateFromString:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)cmsOptionalArrayOfClass:()CMSCodingUtils forKey:
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v10 = v5;
  }
  else
  {
LABEL_12:
    v10 = 0;
  }

  return v10;
}

- (id)cmsOptionalDecodedClass:()CMSCodingUtils forKey:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "instanceFromCMSCoded:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cmsOptionalArrayOfDecodedClass:()CMSCodingUtils forKey:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  objc_msgSend(a1, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __70__NSDictionary_CMSCodingUtils__cmsOptionalArrayOfDecodedClass_forKey___block_invoke;
    v13 = &unk_24E1CC960;
    v14 = v6;
    v15 = a3;
    v7 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);
    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cmsOptionalDictionaryForKey:()CMSCodingUtils
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  cmsSafeDictionary(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
