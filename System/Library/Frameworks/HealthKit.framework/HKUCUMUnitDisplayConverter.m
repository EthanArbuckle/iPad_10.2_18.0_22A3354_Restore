@implementation HKUCUMUnitDisplayConverter

- (HKUCUMUnitDisplayConverter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKUCUMUnitDisplayConverter;
  return -[HKUCUMUnitDisplayConverter init](&v3, sel_init);
}

+ (id)sharedConverter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HKUCUMUnitDisplayConverter_sharedConverter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConverter_onceToken != -1)
    dispatch_once(&sharedConverter_onceToken, block);
  return (id)sharedConverter_sharedUCUMUnitDisplayConverter;
}

void __45__HKUCUMUnitDisplayConverter_sharedConverter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedConverter_sharedUCUMUnitDisplayConverter;
  sharedConverter_sharedUCUMUnitDisplayConverter = (uint64_t)v1;

}

- (NSDictionary)synonymLookupTable
{
  NSDictionary *synonymLookupTable;
  NSDictionary *v3;
  void *v5;
  void *v6;
  void *v7;

  synonymLookupTable = self->_synonymLookupTable;
  if (synonymLookupTable)
  {
    v3 = synonymLookupTable;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("ucum-synonyms"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUCUMUnitDisplayConverter setSynonymLookupTable:](self, "setSynonymLookupTable:", v7);

    v3 = self->_synonymLookupTable;
  }
  return v3;
}

- (NSDictionary)hkUnitNameLookupTable
{
  NSDictionary *hkUnitNameLookupTable;
  NSDictionary *v3;
  void *v5;
  void *v6;
  void *v7;

  hkUnitNameLookupTable = self->_hkUnitNameLookupTable;
  if (hkUnitNameLookupTable)
  {
    v3 = hkUnitNameLookupTable;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("ucum-to-hkunit-mapping"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUCUMUnitDisplayConverter setHkUnitNameLookupTable:](self, "setHkUnitNameLookupTable:", v7);

    v3 = self->_hkUnitNameLookupTable;
  }
  return v3;
}

- (id)synonymForUCUMUnitString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUCUMUnitDisplayConverter.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitString != nil"));

  }
  -[HKUCUMUnitDisplayConverter synonymLookupTable](self, "synonymLookupTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("10*"), CFSTR("10^"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" {"), CFSTR(" "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("} "), CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{"), &stru_1E37FD4C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("}"), &stru_1E37FD4C0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s+"), 1, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), CFSTR(" "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v17;
  }

  return v8;
}

- (id)hkUnitNameForUCUMUnitCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[HKUCUMUnitDisplayConverter hkUnitNameLookupTable](self, "hkUnitNameLookupTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setSynonymLookupTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHkUnitNameLookupTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hkUnitNameLookupTable, 0);
  objc_storeStrong((id *)&self->_synonymLookupTable, 0);
}

@end
