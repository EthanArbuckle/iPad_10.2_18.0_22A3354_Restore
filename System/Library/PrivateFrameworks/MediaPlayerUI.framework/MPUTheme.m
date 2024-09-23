@implementation MPUTheme

+ (id)cachedObjectWithKey:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_msgSend(a1, "_themeAssetCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v9)
      {
        v7[2](v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(a1, "_themeAssetCache");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v9, v6);

        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)disabledPlaybackControlColor
{
  void *v3;
  void *v4;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cachedObjectWithKey:block:", v3, &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __40__MPUTheme_disabledPlaybackControlColor__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.15);
}

+ (double)tableViewContentLeftInset
{
  return 15.0;
}

+ (id)_themeAssetCache
{
  if (_themeAssetCache___onceToken != -1)
    dispatch_once(&_themeAssetCache___onceToken, &__block_literal_global_2);
  return (id)_themeAssetCache___themeAssetCache;
}

void __28__MPUTheme__themeAssetCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_themeAssetCache___themeAssetCache;
  _themeAssetCache___themeAssetCache = (uint64_t)v0;

}

@end
