@implementation APCDefaults

+ (id)sharedDefaults
{
  if (+[APCDefaults sharedDefaults]::onceToken != -1)
    dispatch_once(&+[APCDefaults sharedDefaults]::onceToken, &__block_literal_global);
  return (id)_defaults;
}

void __29__APCDefaults_sharedDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.audiopasscode"));
  v1 = (void *)_defaults;
  _defaults = v0;

}

+ (BOOL)BOOLForDefault:(unint64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLForKey:", v8);

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

+ (int64_t)integerForDefault:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "integerForKey:", v7);

    }
  }

  return (int64_t)v5;
}

+ (float)floatForDefault:(unint64_t)a3
{
  void *v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  objc_msgSend(a1, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "volume");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatForKey:", v8);
      v5 = v9;

    }
    else if (MGGetProductType() == 3348380076)
    {
      v5 = 0.75;
    }
    else
    {
      v5 = 0.56;
    }
  }

  return v5;
}

@end
