@implementation SGSymbolicMappingTransformer

- (SGSymbolicMappingTransformer)initWithNumericMapping:(id)a3 andSymbolicMapping:(id)a4
{
  id v6;
  id v7;
  SGSymbolicMappingTransformer *v8;
  SGSymbolicMappingTransformer *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SGSymbolicMappingTransformer;
  v8 = -[SGSymbolicMappingTransformer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SGSymbolicMappingTransformer setNumericMapping:](v8, "setNumericMapping:", v6);
    -[SGSymbolicMappingTransformer setCharacterMapping:](v9, "setCharacterMapping:", v7);
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invertedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSymbolicMappingTransformer setCharacterSet:](v9, "setCharacterSet:", v11);

  }
  return v9;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SGSymbolicMappingTransformer *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGSymbolicMappingTransformer transform:]", "SGSymbolicMappingTransformer.m", 65, "[input isKindOfClass:[NSArray class]]");
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__SGSymbolicMappingTransformer_transform___block_invoke;
  v9[3] = &unk_1E7DAE818;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v7 = v6;

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("NUMERIC_MAPPING");
  -[SGSymbolicMappingTransformer numericMapping](self, "numericMapping", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("CHARACTER_MAPPING");
  v9[0] = v4;
  -[SGSymbolicMappingTransformer characterMapping](self, "characterMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SGSymbolicMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  SGSymbolicMappingTransformer *v9;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NUMERIC_MAPPING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CHARACTER_MAPPING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGSymbolicMappingTransformer initWithNumericMapping:andSymbolicMapping:](self, "initWithNumericMapping:andSymbolicMapping:", v7, v8);
  return v9;
}

- (BOOL)isEqualToSymbolicMappingTransformer:(id)a3
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
    -[SGSymbolicMappingTransformer numericMapping](self, "numericMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numericMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[SGSymbolicMappingTransformer numericMapping](self, "numericMapping"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "numericMapping"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[SGSymbolicMappingTransformer characterMapping](self, "characterMapping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "characterMapping");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v11)
      {

        v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        -[SGSymbolicMappingTransformer characterMapping](self, "characterMapping");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "characterMapping");
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
  SGSymbolicMappingTransformer *v4;
  SGSymbolicMappingTransformer *v5;
  BOOL v6;

  v4 = (SGSymbolicMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSymbolicMappingTransformer isEqualToSymbolicMappingTransformer:](self, "isEqualToSymbolicMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SGSymbolicMappingTransformer numericMapping](self, "numericMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[SGSymbolicMappingTransformer characterMapping](self, "characterMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (NSString)numericMapping
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNumericMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)characterMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCharacterMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSCharacterSet)characterSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCharacterSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_characterMapping, 0);
  objc_storeStrong((id *)&self->_numericMapping, 0);
}

void __42__SGSymbolicMappingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  if (!_PASLooksLikeNumber())
  {
    objc_msgSend(*(id *)(a1 + 40), "characterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "rangeOfCharacterFromSet:", v7) == 0x7FFFFFFFFFFFFFFFLL
      || (objc_msgSend(v9, "hasPrefix:", CFSTR("SG_FEATURE")) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v9, "hasPrefix:", CFSTR("SG_TARGET"));

      if ((v8 & 1) == 0)
      {
        v3 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "characterMapping");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    goto LABEL_8;
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "numericMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v5 = v4;
  numberedString(v4, objc_msgSend(v9, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

LABEL_8:
}

+ (id)withNumericMapping:(id)a3 andSymbolicMapping:(id)a4
{
  id v5;
  id v6;
  SGSymbolicMappingTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SGSymbolicMappingTransformer initWithNumericMapping:andSymbolicMapping:]([SGSymbolicMappingTransformer alloc], "initWithNumericMapping:andSymbolicMapping:", v6, v5);

  return v7;
}

@end
