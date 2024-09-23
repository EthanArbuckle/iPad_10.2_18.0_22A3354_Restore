@implementation IFResourceMetadata

+ (id)metadataWithFileName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (metadataWithFileName__onceToken != -1)
    dispatch_once(&metadataWithFileName__onceToken, &__block_literal_global_4);
  objc_msgSend((id)metadataWithFileName__matcher, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_21;
  if (objc_msgSend(v5, "count") != 1)
    +[IFResourceMetadata metadataWithFileName:].cold.2();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "numberOfRanges") != 6)
    +[IFResourceMetadata metadataWithFileName:].cold.1();
  v7 = objc_msgSend(v6, "rangeAtIndex:", 1);
  if (v8)
  {
    objc_msgSend(v3, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v9);

    objc_msgSend(v4, "setSelectedVariant:", 0);
    objc_msgSend(v6, "rangeAtIndex:", 2);
    if (v10)
      objc_msgSend(v4, "setSelectedVariant:", 1);
    v11 = objc_msgSend(v6, "rangeAtIndex:", 3);
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "substringWithRange:", v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      objc_msgSend(v13, "numberWithFloat:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDimension:", v15);

    }
    v16 = objc_msgSend(v6, "rangeAtIndex:", 4);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = v17;
      if (v17)
      {
        v19 = v16;
        if (v16 + v17 < (unint64_t)objc_msgSend(v3, "length"))
        {
          objc_msgSend(v3, "substringWithRange:", v19, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = v20;
            v22 = (void *)MEMORY[0x1E0CB37E8];
            if (objc_msgSend(v20, "integerValue") < 1)
              v23 = 1;
            else
              v23 = objc_msgSend(v21, "integerValue");
            objc_msgSend(v22, "numberWithInteger:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setScale:", v25);

          }
        }
      }
    }

LABEL_21:
    v24 = v4;
    goto LABEL_22;
  }

  v24 = 0;
LABEL_22:

  return v24;
}

void __43__IFResourceMetadata_metadataWithFileName___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)metadataWithFileName__regexp;
  metadataWithFileName__regexp = (uint64_t)CFSTR("^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+.?[0-9]?)?(?:x[0-9]+)?(?:@([1|2|3])x)?(~ipad|~iphone)*$");

  if (!metadataWithFileName__matcher)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+.?[0-9]?)?(?:x[0-9]+)?(?:@([1|2|3])x)?(~ipad|~iphone)*$"), 0, 0);
    v2 = (void *)metadataWithFileName__matcher;
    metadataWithFileName__matcher = v1;

    if (!metadataWithFileName__matcher)
      __43__IFResourceMetadata_metadataWithFileName___block_invoke_cold_1();
  }
}

- (NSNumber)dimension
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDimension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)scale
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_diension, 0);
}

+ (void)metadataWithFileName:.cold.1()
{
  __assert_rtn("+[IFResourceMetadata metadataWithFileName:]", "IFResourceMetadata.m", 61, "numberOfRanges == 6");
}

+ (void)metadataWithFileName:.cold.2()
{
  __assert_rtn("+[IFResourceMetadata metadataWithFileName:]", "IFResourceMetadata.m", 58, "[matches count] == 1");
}

void __43__IFResourceMetadata_metadataWithFileName___block_invoke_cold_1()
{
  __assert_rtn("+[IFResourceMetadata metadataWithFileName:]_block_invoke", "IFResourceMetadata.m", 49, "matcher");
}

@end
