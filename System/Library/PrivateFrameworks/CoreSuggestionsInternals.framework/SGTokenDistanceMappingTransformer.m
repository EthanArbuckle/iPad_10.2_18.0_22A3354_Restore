@implementation SGTokenDistanceMappingTransformer

- (SGTokenDistanceMappingTransformer)initWithTarget:(id)a3 maxDistance:(unint64_t)a4
{
  id v6;
  SGTokenDistanceMappingTransformer *v7;
  SGTokenDistanceMappingTransformer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGTokenDistanceMappingTransformer;
  v7 = -[SGTokenDistanceMappingTransformer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SGTokenDistanceMappingTransformer setTargetString:](v7, "setTargetString:", v6);
    -[SGTokenDistanceMappingTransformer setMaxDistance:](v8, "setMaxDistance:", a4);
  }

  return v8;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGTokenDistanceMappingTransformer transform:]", "SGTokenDistanceMappingTransformer.m", 47, "[input isKindOfClass:[NSArray class]]");
  if (objc_msgSend(v4, "count"))
  {
    -[SGTokenDistanceMappingTransformer targetString](self, "targetString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0;
    else
      v7 = v6;
    objc_msgSend((id)objc_opt_class(), "transformArray:withTargetIndex:maximumDistance:", v4, v7, -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("TARGET_STRING");
  -[SGTokenDistanceMappingTransformer targetString](self, "targetString", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("MAC_DISTANCE");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SGTokenDistanceMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  SGTokenDistanceMappingTransformer *v9;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TARGET_STRING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAC_DISTANCE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGTokenDistanceMappingTransformer initWithTarget:maxDistance:](self, "initWithTarget:maxDistance:", v7, objc_msgSend(v8, "unsignedIntegerValue"));
  return v9;
}

- (BOOL)isEqualToTokenDistanceMappingTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;

  v6 = a3;
  if (v6)
  {
    -[SGTokenDistanceMappingTransformer targetString](self, "targetString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[SGTokenDistanceMappingTransformer targetString](self, "targetString"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "targetString"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v10 = -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance");
      v9 = v10 == objc_msgSend(v6, "maxDistance");
      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGTokenDistanceMappingTransformer *v4;
  SGTokenDistanceMappingTransformer *v5;
  BOOL v6;

  v4 = (SGTokenDistanceMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGTokenDistanceMappingTransformer isEqualToTokenDistanceMappingTransformer:](self, "isEqualToTokenDistanceMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[SGTokenDistanceMappingTransformer targetString](self, "targetString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance") - v4 + 32 * v4;
}

- (NSString)targetString
{
  return self->_targetString;
}

- (void)setTargetString:(id)a3
{
  objc_storeStrong((id *)&self->_targetString, a3);
}

- (unint64_t)maxDistance
{
  return self->_maxDistance;
}

- (void)setMaxDistance:(unint64_t)a3
{
  self->_maxDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetString, 0);
}

+ (id)withTarget:(id)a3 maxDistance:(unint64_t)a4
{
  id v5;
  SGTokenDistanceMappingTransformer *v6;

  v5 = a3;
  v6 = -[SGTokenDistanceMappingTransformer initWithTarget:maxDistance:]([SGTokenDistanceMappingTransformer alloc], "initWithTarget:maxDistance:", v5, a4);

  return v6;
}

+ (id)transformArray:(id)a3 withTargetIndex:(unint64_t)a4 maximumDistance:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count") <= a4)
  {
    objc_msgSend(a1, "debugStoreContext");
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v18 = a4;
      v19 = 2048;
      v20 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGTokenDistanceMappingTransformer: index=%lu, count=%lu", buf, 0x16u);
    }

    if (objc_msgSend(v8, "count") <= a4)
      __assert_rtn("+[SGTokenDistanceMappingTransformer transformArray:withTargetIndex:maximumDistance:]", "SGTokenDistanceMappingTransformer.m", 66, "index < input.count");
  }
  v10 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__SGTokenDistanceMappingTransformer_transformArray_withTargetIndex_maximumDistance___block_invoke;
  v13[3] = &unk_1E7DAE110;
  v15 = a4;
  v16 = a5;
  v11 = v10;
  v14 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  return v11;
}

+ (void)debugSetContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SuggestionsMLDebugContextDataKey"));
    else
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("SuggestionsMLDebugContextDataKey"));

  }
}

+ (void)debugStoreContext
{
  void *v3;
  void *v4;
  id v5;

  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SuggestionsMLDebugContextDataKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "debugAppendText:", v4);

  }
}

+ (BOOL)debugAppendText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_diagnostics() && objc_msgSend(v3, "length"))
  {
    objc_sync_enter(CFSTR("SuggestionsMLDebugContextDataKey"));
    +[SGPaths suggestionsDirectoryFile:](SGPaths, "suggestionsDirectoryFile:", CFSTR("assertion_context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("\n------\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "seekToEndOfFile");
      objc_msgSend(v8, "writeData:", v6);
      objc_msgSend(v8, "closeFile");
      v9 = 1;
    }
    else
    {
      v13 = *MEMORY[0x1E0CB2AD8];
      v14[0] = *MEMORY[0x1E0CB2AB8];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v4, v6, v10);

    }
    objc_sync_exit(CFSTR("SuggestionsMLDebugContextDataKey"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __84__SGTokenDistanceMappingTransformer_transformArray_withTargetIndex_maximumDistance___block_invoke(uint64_t a1, void *a2, int a3)
{
  unint64_t v4;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;

  LODWORD(v4) = a3 - *(_DWORD *)(a1 + 40);
  if ((v4 & 0x80000000) == 0)
    v4 = v4;
  else
    v4 = (*(_DWORD *)(a1 + 40) - a3);
  if (*(_QWORD *)(a1 + 48) > v4)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v8 = a2;
    v9 = (id)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("%@__%d"), v8, (*(_DWORD *)(a1 + 40) - a3));

    objc_msgSend(v6, "addObject:", v9);
  }
}

@end
