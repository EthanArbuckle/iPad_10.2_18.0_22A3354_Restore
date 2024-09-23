@implementation NSBundle(GKVersioning)

- (id)_gkFrameworkVersionDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("CFBundleVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundle:%@"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (!-[__CFString length](v7, "length"))
    {

      v7 = CFSTR("(ad-hoc build)");
    }
    objc_msgSend(a1, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(" no versions found"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<no info plist for %@>"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
