@implementation SGContactSharingTransformer

- (SGContactSharingTransformer)initWithLanguage:(id)a3 windowLength:(int64_t)a4
{
  id v6;
  SGContactSharingTransformer *v7;
  SGContactSharingTransformer *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGContactSharingTransformer;
  v7 = -[SGContactSharingTransformer init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SGContactSharingTransformer setLanguage:](v7, "setLanguage:", v6);
    -[SGContactSharingTransformer setWindowLength:](v8, "setWindowLength:", a4);
    -[SGContactSharingTransformer language](v8, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGTokenizerMappingTransformer forLocale:withPersonalNameMapping:](SGTokenizerMappingTransformer, "forLocale:withPersonalNameMapping:", v9, CFSTR("SG_FEATURE_FULLNAME"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_tokenizer;
    _tokenizer = v10;

    arc4random_buf(&v8->_rng, 0x10uLL);
  }

  return v8;
}

- (id)transform:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INPUT_TEXT")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactSharingTransformer.m"), 59, CFSTR("Unexpected input: %@. %@ requires dictionary with SG_MODEL_INPUT_TEXT key."), v5, v9);

  }
  v10 = (void *)_tokenizer;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INPUT_TEXT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transform:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NEGATIVE_SAMPLE_CHOPLESS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NEGATIVE_SAMPLE_CHOPPABLE_START"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_msgSend(v12, "count");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NEGATIVE_SAMPLE_CHOPPABLE_START"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "integerValue");

      v41 = 0u;
      v42 = 0u;
      if (v25 >= 0)
        v26 = v25;
      else
        v26 = (v25 + v23) & ~((uint64_t)(v25 + v23) >> 63);
      v39 = 0uLL;
      v40 = 0uLL;
      v27 = v12;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v40 != v30)
              objc_enumerationMutation(v27);
            v23 = (__PAIR128__(v23, objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "range"))
                 - (unint64_t)v26) >> 64;
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v29);
      }

      if (v23)
      {
        v32 = (void *)MEMORY[0x1C3BD4F6C]();
        if (v23 < 3)
        {
          v37 = 1;
        }
        else
        {
          v33 = self->_rng.s[0];
          v34 = self->_rng.s[1];
          v35 = v34 + v33;
          v36 = v34 ^ v33;
          self->_rng.s[0] = __ROR8__(v33, 9) ^ (v36 << 14) ^ v36;
          self->_rng.s[1] = __ROR8__(v36, 28);
          v37 = v35 % (v23 - 1) + 1;
        }
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", objc_msgSend(v27, "count") - v37, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObjectsAtIndexes:", v38);

        objc_autoreleasePoolPop(v32);
      }
    }
  }
  v14 = objc_msgSend(v12, "count");
  v15 = -[SGContactSharingTransformer windowLength](self, "windowLength");
  v16 = (v14 - v15) & ~((v14 - v15) >> 63);
  v17 = -[SGContactSharingTransformer windowLength](self, "windowLength");
  v18 = objc_msgSend(v12, "count");
  if (v17 >= v18 - v16)
    v19 = v18 - v16;
  else
    v19 = v17;
  objc_msgSend(v12, "subarrayWithRange:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("LANGUAGE");
  -[SGContactSharingTransformer language](self, "language", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("WINDOWLENGTH");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SGContactSharingTransformer windowLength](self, "windowLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SGContactSharingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  SGContactSharingTransformer *v9;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LANGUAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WINDOWLENGTH"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGContactSharingTransformer initWithLanguage:windowLength:](self, "initWithLanguage:windowLength:", v7, objc_msgSend(v8, "integerValue"));
  return v9;
}

- (BOOL)isEqualToContactSharingTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int64_t v10;

  v6 = a3;
  if (v6)
  {
    -[SGContactSharingTransformer language](self, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[SGContactSharingTransformer language](self, "language"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "language"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v10 = -[SGContactSharingTransformer windowLength](self, "windowLength");
      v9 = v10 == objc_msgSend(v6, "windowLength");
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
  SGContactSharingTransformer *v4;
  SGContactSharingTransformer *v5;
  BOOL v6;

  v4 = (SGContactSharingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGContactSharingTransformer isEqualToContactSharingTransformer:](self, "isEqualToContactSharingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SGContactSharingTransformer language](self, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SGContactSharingTransformer windowLength](self, "windowLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)windowLength
{
  return self->_windowLength;
}

- (void)setWindowLength:(int64_t)a3
{
  self->_windowLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
}

@end
