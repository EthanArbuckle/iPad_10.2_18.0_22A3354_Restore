@implementation INImage(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("url"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "cmsDoubleForKey:withDefault:", CFSTR("width"), 0.0);
      v9 = v8;
      objc_msgSend(v4, "cmsDoubleForKey:withDefault:", CFSTR("height"), 0.0);
      if (v9 == 0.0 && v10 == 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD9DA8], "imageWithURL:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD9DA8], "imageWithURL:width:height:", v7, v9, v10);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)cmsCoded
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageSize");
  v4 = v3;
  if (v5 != 0.0 || v3 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("width"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("height"));

  }
  objc_msgSend(a1, "_uri");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("url"));

  return v2;
}

@end
