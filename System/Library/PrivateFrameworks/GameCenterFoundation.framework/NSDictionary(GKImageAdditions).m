@implementation NSDictionary(GKImageAdditions)

- (id)_gkImageURLForSize:()GKImageAdditions scale:foundSize:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a2 == 0.0)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSDictionary+GKImageAdditions.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (scale != 0)\n[%s (%s:%d)]"), v10, "-[NSDictionary(GKImageAdditions) _gkImageURLForSize:scale:foundSize:]", objc_msgSend(v12, "UTF8String"), 83);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v14 = (uint64_t)((double)a4 * a2);
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("template"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "rangeOfString:options:", v19, 12);
    objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v17, 4, v20, v21);
    objc_msgSend(v18, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v18, "rangeOfString:options:", v22, 12);
    objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v17, 4, v23, v24);
    if (a5)
      *a5 = v14;

  }
  else if (v14 > 512)
  {
LABEL_19:
    v18 = 0;
  }
  else
  {
    while (1)
    {
      v25 = (uint64_t)((double)v14 * a2);
      v26 = CFSTR("64");
      if (v25 >= 65)
      {
        v26 = CFSTR("128");
        if ((unint64_t)v25 >= 0x81)
        {
          if ((unint64_t)v25 >= 0x101)
            v26 = CFSTR("512");
          else
            v26 = CFSTR("256");
        }
      }
      objc_msgSend(a1, "objectForKey:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
        break;
      if (v14)
      {
        v28 = v14 | (v14 >> 1) | ((v14 | (v14 >> 1)) >> 2);
        v29 = v28 | (v28 >> 4) | ((v28 | (v28 >> 4)) >> 8);
        v14 = (v29 | (v29 >> 16)) + 1;
      }
      else
      {
        v14 = 1;
      }
      if (v14 >= 513)
        goto LABEL_19;
    }
    v18 = (void *)v27;
    if (a5)
      *a5 = v14;
  }

  return v18;
}

+ (id)_gkImageCacheKeyPathsByKey
{
  if (_gkImageCacheKeyPathsByKey_onceToken != -1)
    dispatch_once(&_gkImageCacheKeyPathsByKey_onceToken, &__block_literal_global_31);
  return (id)_gkImageCacheKeyPathsByKey_sKeyPaths;
}

+ (id)_gkClientImageDictionaryForServerImageURLs:()GKImageAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkImageCacheKeyPathsByKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__NSDictionary_GKImageAdditions___gkClientImageDictionaryForServerImageURLs___block_invoke;
  v12[3] = &unk_1E75B1738;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (uint64_t)_gkImageURLForSize:()GKImageAdditions scale:
{
  return objc_msgSend(a1, "_gkImageURLForSize:scale:foundSize:", a3, 0);
}

@end
