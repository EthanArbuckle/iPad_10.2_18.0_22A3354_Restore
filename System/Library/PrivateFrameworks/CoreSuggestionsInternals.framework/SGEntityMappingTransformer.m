@implementation SGEntityMappingTransformer

- (SGEntityMappingTransformer)initWithEmailMapping:(id)a3 linkMapping:(id)a4
{
  id v6;
  id v7;
  SGEntityMappingTransformer *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGEntityMappingTransformer;
  v8 = -[SGEntityMappingTransformer init](&v15, sel_init);
  if (v8)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 32, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    -[SGEntityMappingTransformer setDataDetector:](v8, "setDataDetector:", v9);

    if (v10)
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "Error constructing data detector for featurizing: %@", buf, 0xCu);

      }
    }
    -[SGEntityMappingTransformer setEmailMapping:](v8, "setEmailMapping:", v6);
    -[SGEntityMappingTransformer setLinkMapping:](v8, "setLinkMapping:", v7);

  }
  return v8;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  SGEntityMappingTransformer *v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGEntityMappingTransformer transform:]", "SGEntityMappingTransformer.m", 54, "[input isKindOfClass:[NSString class]]");
  v5 = (void *)objc_opt_new();
  if (getEntityMappingDispatchQueue__pasOnceToken2 != -1)
    dispatch_once(&getEntityMappingDispatchQueue__pasOnceToken2, &__block_literal_global_3656);
  v6 = getEntityMappingDispatchQueue__pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SGEntityMappingTransformer_transform___block_invoke;
  block[3] = &unk_1E7DB7800;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  dispatch_sync(v6, block);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("EMAIL_MAPPING");
  -[SGEntityMappingTransformer emailMapping](self, "emailMapping", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("LINK_MAPPING");
  v9[0] = v4;
  -[SGEntityMappingTransformer linkMapping](self, "linkMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SGEntityMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  SGEntityMappingTransformer *v9;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EMAIL_MAPPING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LINK_MAPPING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGEntityMappingTransformer initWithEmailMapping:linkMapping:](self, "initWithEmailMapping:linkMapping:", v7, v8);
  return v9;
}

- (BOOL)isEqualToEntityMappingTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (v6)
  {
    -[SGEntityMappingTransformer emailMapping](self, "emailMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[SGEntityMappingTransformer emailMapping](self, "emailMapping"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "emailMapping"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[SGEntityMappingTransformer linkMapping](self, "linkMapping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "linkMapping");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v11)
      {

        v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        -[SGEntityMappingTransformer linkMapping](self, "linkMapping");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "linkMapping");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "isEqual:", v14);

      }
      if (v7 == v8)
        goto LABEL_11;
    }
    else
    {
      v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGEntityMappingTransformer *v4;
  SGEntityMappingTransformer *v5;
  BOOL v6;

  v4 = (SGEntityMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEntityMappingTransformer isEqualToEntityMappingTransformer:](self, "isEqualToEntityMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SGEntityMappingTransformer emailMapping](self, "emailMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[SGEntityMappingTransformer linkMapping](self, "linkMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (NSDataDetector)dataDetector
{
  return (NSDataDetector *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataDetector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)emailMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmailMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)linkMapping
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLinkMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMapping, 0);
  objc_storeStrong((id *)&self->_emailMapping, 0);
  objc_storeStrong((id *)&self->_dataDetector, 0);
}

void __40__SGEntityMappingTransformer_transform___block_invoke(id *a1)
{
  id v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = objc_msgSend(v2, "length");
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1[5], "dataDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v2;
  objc_msgSend(v5, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v28 = v3;
    v29 = v4;
    v7 = 0;
    v8 = 0;
    v32 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      v10 = v7;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        v7 = objc_msgSend(v12, "range");
        v8 = v14;
        if (objc_msgSend(v12, "resultType") == 32)
        {
          objc_msgSend(v12, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scheme");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("mailto"));

          v18 = a1[5];
          if (v17)
            objc_msgSend(v18, "emailMapping");
          else
            objc_msgSend(v18, "linkMapping");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        v20 = v10 + v11;
        v21 = v7 - (v10 + v11);
        if (v7 > v10 + v11)
        {
          v22 = (void *)MEMORY[0x1C3BD4F6C]();
          v23 = a1[6];
          objc_msgSend(v30, "substringWithRange:", v20, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "appendString:", v24);

          objc_autoreleasePoolPop(v22);
        }
        objc_msgSend(a1[6], "appendString:", v19, v28, v29);

        objc_autoreleasePoolPop(v13);
        ++v9;
        v10 = v7;
        v11 = v8;
      }
      while (v33 != v9);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
    v3 = v28;
    v4 = v29;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }

  if (v3 > v7 + v8)
  {
    v25 = (void *)MEMORY[0x1C3BD4F6C]();
    v26 = a1[6];
    objc_msgSend(v30, "substringWithRange:", v7 + v8, v3 - (v7 + v8));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendString:", v27);

    objc_autoreleasePoolPop(v25);
  }

  objc_autoreleasePoolPop(v4);
}

+ (id)withEmailMapping:(id)a3 linkMapping:(id)a4
{
  id v5;
  id v6;
  SGEntityMappingTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SGEntityMappingTransformer initWithEmailMapping:linkMapping:]([SGEntityMappingTransformer alloc], "initWithEmailMapping:linkMapping:", v6, v5);

  return v7;
}

@end
