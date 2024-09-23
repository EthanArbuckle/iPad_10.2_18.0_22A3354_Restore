@implementation NSString(FileNameConventionAdditions)

- (id)imageMetadataFromFileName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "_IS_imageMetadataFromFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, kIconCompilerImageInfoNameKey);

  }
  objc_msgSend(v3, "dimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "dimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, kIconCompilerImageInfoSizeKey);

  }
  objc_msgSend(v3, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "scale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, kIconCompilerImageInfoScaleKey);

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E5816410, kIconCompilerImageInfoScaleKey);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "selectedVariant"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, kIconCompilerImageInfoIsSelectedVariantKey);

  return v2;
}

- (id)scaleableResourceMetadataFromFileName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "_IS_scaleableResourceMetadataFromFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, kIconCompilerImageInfoNameKey);

  }
  objc_msgSend(v3, "dimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "dimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, kIconCompilerImageInfoSizeKey);

  }
  objc_msgSend(v3, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "scale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, kIconCompilerImageInfoScaleKey);

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E5816410, kIconCompilerImageInfoScaleKey);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "selectedVariant"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, kIconCompilerImageInfoIsSelectedVariantKey);

  return v2;
}

- (id)_IS_imageMetadataFromFileName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;

  v2 = (void *)objc_opt_new();
  if (_IS_imageMetadataFromFileName_onceToken != -1)
    dispatch_once(&_IS_imageMetadataFromFileName_onceToken, &__block_literal_global_25);
  objc_msgSend((id)_IS_imageMetadataFromFileName_matcher, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_21;
  if (objc_msgSend(v3, "count") != 1)
    -[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName].cold.2();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfRanges") != 5)
    -[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName].cold.1();
  v5 = objc_msgSend(v4, "rangeAtIndex:", 1);
  if (v6)
  {
    objc_msgSend(a1, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setName:", v7);

    objc_msgSend(v2, "setSelectedVariant:", 0);
    objc_msgSend(v4, "rangeAtIndex:", 2);
    if (v8)
      objc_msgSend(v2, "setSelectedVariant:", 1);
    v9 = objc_msgSend(v4, "rangeAtIndex:", 3);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "substringWithRange:", v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setDimension:", v13);

    }
    v14 = objc_msgSend(v4, "rangeAtIndex:", 4);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v15;
      if (v15)
      {
        v17 = v14;
        if (v14 + v15 < (unint64_t)objc_msgSend(a1, "length"))
        {
          objc_msgSend(a1, "substringWithRange:", v17, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            v20 = (void *)MEMORY[0x1E0CB37E8];
            if (objc_msgSend(v18, "integerValue") < 1)
              v21 = 1;
            else
              v21 = objc_msgSend(v19, "integerValue");
            objc_msgSend(v20, "numberWithInteger:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setScale:", v23);

          }
        }
      }
    }

LABEL_21:
    v22 = v2;
    goto LABEL_22;
  }

  v22 = 0;
LABEL_22:

  return v22;
}

- (id)_IS_scaleableResourceMetadataFromFileName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = (void *)objc_opt_new();
  if (_IS_scaleableResourceMetadataFromFileName_onceToken != -1)
    dispatch_once(&_IS_scaleableResourceMetadataFromFileName_onceToken, &__block_literal_global_91);
  objc_msgSend((id)_IS_scaleableResourceMetadataFromFileName_matcher, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") != 1)
      -[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName].cold.2();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "numberOfRanges") != 3)
      -[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName].cold.1();
    v5 = objc_msgSend(v4, "rangeAtIndex:", 1);
    if (!v6)
    {

      v9 = 0;
      goto LABEL_12;
    }
    objc_msgSend(a1, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setName:", v7);

    objc_msgSend(v2, "setSelectedVariant:", 0);
    objc_msgSend(v4, "rangeAtIndex:", 2);
    if (v8)
      objc_msgSend(v2, "setSelectedVariant:", 1);

  }
  v9 = v2;
LABEL_12:

  return v9;
}

- (void)_IS_imageMetadataFromFileName
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName]", "NSString+FileNameConventionAdditions.m", 118, "[matches count] == 1");
}

- (void)_IS_scaleableResourceMetadataFromFileName
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName]", "NSString+FileNameConventionAdditions.m", 183, "[matches count] == 1");
}

@end
