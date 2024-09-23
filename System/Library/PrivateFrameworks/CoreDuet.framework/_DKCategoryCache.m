@implementation _DKCategoryCache

- (id)categoryWithInteger:(int64_t)a3 type:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  _DKCategory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  if (categoryWithInteger_type__onceToken != -1)
    dispatch_once(&categoryWithInteger_type__onceToken, &__block_literal_global_93);
  if ((unint64_t)a3 > 1)
    goto LABEL_8;
  if (!v6)
  {
    v10 = CFSTR("?");
    goto LABEL_10;
  }
  v7 = objc_msgSend(v6, "typeCode");
  if (v7 != categoryWithInteger_type__BOOLTypeCode)
  {
    v8 = objc_msgSend(v6, "typeCode");
    if (v8 != categoryWithInteger_type__anyTypeCode)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "typeCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@"), v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKCategoryCache objectForKey:](self, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v11 = v16;
  }
  else
  {
    v11 = -[_DKCategory initWithInteger:type:cache:]([_DKCategory alloc], "initWithInteger:type:cache:", a3, v6, 0);
    if (v11)
      -[_DKCategoryCache setObject:forKey:](self, "setObject:forKey:", v11, v15);
  }

LABEL_15:
  return v11;
}

+ (id)sharedCached
{
  if (sharedCached_onceToken_0 != -1)
    dispatch_once(&sharedCached_onceToken_0, &__block_literal_global_29);
  return (id)sharedCached_sharedCache_0;
}

@end
