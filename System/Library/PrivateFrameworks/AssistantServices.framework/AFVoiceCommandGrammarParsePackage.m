@implementation AFVoiceCommandGrammarParsePackage

- (AFVoiceCommandGrammarParsePackage)initWithNBestParses:(id)a3 preITNNBestParses:(id)a4
{
  id v6;
  id v7;
  AFVoiceCommandGrammarParsePackage *v8;
  uint64_t v9;
  NSArray *nBestParses;
  uint64_t v11;
  NSArray *preITNNBestParses;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceCommandGrammarParsePackage;
  v8 = -[AFVoiceCommandGrammarParsePackage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    nBestParses = v8->_nBestParses;
    v8->_nBestParses = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    preITNNBestParses = v8->_preITNNBestParses;
    v8->_preITNNBestParses = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceCommandGrammarParsePackage *v4;
  AFVoiceCommandGrammarParsePackage *v5;
  NSArray *v6;
  NSArray *nBestParses;
  NSArray *v8;
  NSArray *preITNNBestParses;
  BOOL v10;

  v4 = (AFVoiceCommandGrammarParsePackage *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFVoiceCommandGrammarParsePackage nBestParses](v5, "nBestParses");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      nBestParses = self->_nBestParses;
      if (nBestParses == v6 || -[NSArray isEqual:](nBestParses, "isEqual:", v6))
      {
        -[AFVoiceCommandGrammarParsePackage preITNNBestParses](v5, "preITNNBestParses");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        preITNNBestParses = self->_preITNNBestParses;
        v10 = preITNNBestParses == v8 || -[NSArray isEqual:](preITNNBestParses, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  void *v3;
  NSArray *nBestParses;
  uint64_t v5;
  id v6;
  NSArray *preITNNBestParses;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("--nBestParses--"));
  nBestParses = self->_nBestParses;
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__AFVoiceCommandGrammarParsePackage_description__block_invoke;
  v14[3] = &unk_1E3A30328;
  v6 = v3;
  v15 = v6;
  -[NSArray enumerateObjectsUsingBlock:](nBestParses, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v6, "appendString:", CFSTR("\n--preITNNBestParses--"));
  preITNNBestParses = self->_preITNNBestParses;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __48__AFVoiceCommandGrammarParsePackage_description__block_invoke_2;
  v12[3] = &unk_1E3A30328;
  v8 = v6;
  v13 = v8;
  -[NSArray enumerateObjectsUsingBlock:](preITNNBestParses, "enumerateObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  NSArray *nBestParses;
  id v8;
  void *v9;
  NSArray *preITNNBestParses;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[NSArray count](self->_nBestParses, "count");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = (void *)objc_opt_new();
    nBestParses = self->_nBestParses;
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke;
    v18[3] = &unk_1E3A30328;
    v19 = v6;
    v8 = v6;
    -[NSArray enumerateObjectsUsingBlock:](nBestParses, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("nBestParses"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("nBestParses"));
  }

  if (-[NSArray count](self->_preITNNBestParses, "count"))
  {
    v9 = (void *)objc_opt_new();
    preITNNBestParses = self->_preITNNBestParses;
    v13 = v5;
    v14 = 3221225472;
    v15 = __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke_2;
    v16 = &unk_1E3A30328;
    v17 = v9;
    v11 = v9;
    -[NSArray enumerateObjectsUsingBlock:](preITNNBestParses, "enumerateObjectsUsingBlock:", &v13);
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("preITNNBestParses"), v13, v14, v15, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("preITNNBestParses"));
  }

  return v3;
}

- (AFVoiceCommandGrammarParsePackage)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AFVoiceCommandGrammarParsePackage *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("AFVoiceCommandGrammarParsePackage::nBestParses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("AFVoiceCommandGrammarParsePackage::preITNNBestParses"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[AFVoiceCommandGrammarParsePackage initWithNBestParses:preITNNBestParses:](self, "initWithNBestParses:preITNNBestParses:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *nBestParses;
  id v5;

  nBestParses = self->_nBestParses;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nBestParses, CFSTR("AFVoiceCommandGrammarParsePackage::nBestParses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preITNNBestParses, CFSTR("AFVoiceCommandGrammarParsePackage::preITNNBestParses"));

}

- (NSArray)nBestParses
{
  return self->_nBestParses;
}

- (NSArray)preITNNBestParses
{
  return self->_preITNNBestParses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preITNNBestParses, 0);
  objc_storeStrong((id *)&self->_nBestParses, 0);
}

void __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __48__AFVoiceCommandGrammarParsePackage_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("parse[%lu]"), a3);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v8);
}

void __48__AFVoiceCommandGrammarParsePackage_description__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("parse[%lu]"), a3);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
