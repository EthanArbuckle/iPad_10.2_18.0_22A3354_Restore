@implementation AFSpeechPhrase

- (id)firstInterpretation
{
  void *v2;
  void *v3;

  -[AFSpeechPhrase interpretations](self, "interpretations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bestInterpretation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AFSpeechPhrase interpretations](self, "interpretations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v3 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v3)
          {
            v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "confidenceScore", (_QWORD)v13);
            if (v10 <= objc_msgSend(v3, "confidenceScore"))
              continue;
          }
          v11 = v9;

          v3 = v11;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)allInterpretationStringsAndScores
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AFSpeechPhrase interpretations](self, "interpretations");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v3)
  {
    v4 = v3;
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "confidenceScoreAvg");
        v8 = objc_msgSend(v6, "confidenceScoreMax");
        v9 = objc_msgSend(v6, "confidenceScoreMin");
        v10 = objc_msgSend(v6, "confidenceScore");
        objc_msgSend(v6, "tokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        objc_msgSend(v6, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v29[0] = CFSTR("avg");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v14;
          v29[1] = CFSTR("max");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30[1] = v15;
          v29[2] = CFSTR("min");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30[2] = v16;
          v29[3] = CFSTR("sum");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30[3] = v17;
          v29[4] = CFSTR("count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30[4] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v19, v20);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v4);
  }

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSArray hash](self->_interpretations, "hash");
  -[NSArray firstObject](self->_interpretations, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSArray *v5;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && ((v5 = (NSArray *)*((_QWORD *)v4 + 2), v5 == self->_interpretations)
     || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && v4[8] == self->_isLowConfidence;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *interpretations;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechPhrase;
  -[AFSpeechPhrase description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  interpretations = self->_interpretations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowConfidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, interpretations=%@, isLowConfidence=%@"), v4, interpretations, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *interpretations;
  id v5;

  interpretations = self->_interpretations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interpretations, CFSTR("interpretations"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLowConfidence, CFSTR("isLowConfidence"));

}

- (AFSpeechPhrase)initWithCoder:(id)a3
{
  id v4;
  AFSpeechPhrase *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *interpretations;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechPhrase;
  v5 = -[AFSpeechPhrase init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("interpretations"));
    v9 = objc_claimAutoreleasedReturnValue();
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v9;

    v5->_isLowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLowConfidence"));
  }

  return v5;
}

- (AFSpeechPhrase)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4
{
  id v6;
  AFSpeechPhrase *v7;
  uint64_t v8;
  NSArray *interpretations;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeechPhrase;
  v7 = -[AFSpeechPhrase init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    interpretations = v7->_interpretations;
    v7->_interpretations = (NSArray *)v8;

    v7->_isLowConfidence = a4;
  }

  return v7;
}

- (AFSpeechPhrase)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  AFSpeechPhrase *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  NSString *v14;
  NSString *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("interpretations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v8 && (NSClassFromString((NSString *)v7), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__7975;
    v22 = __Block_byref_object_dispose__7976;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__AFSpeechPhrase_initWithDictionary___block_invoke;
    v17[3] = &unk_1E3A2F110;
    v17[4] = &v24;
    v17[5] = &v18;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
    if (*((_BYTE *)v25 + 24) || !objc_msgSend((id)v19[5], "count"))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("isLowConfidence"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v14 = v12;
      v15 = v14;
      if (v13 && (NSClassFromString(v14), (objc_opt_isKindOfClass() & 1) != 0))
      {

        self = -[AFSpeechPhrase initWithInterpretations:isLowConfidence:](self, "initWithInterpretations:isLowConfidence:", v19[5], objc_msgSend(v13, "BOOLValue"));
        v9 = self;
      }
      else
      {

        v9 = 0;
      }

    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_interpretations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "dictionaryRepresentation", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

  v17[1] = CFSTR("isLowConfidence");
  v18[0] = v3;
  v17[0] = CFSTR("interpretations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowConfidence);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)interpretations
{
  return self->_interpretations;
}

- (void)setInterpretations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_isLowConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretations, 0);
}

void __37__AFSpeechPhrase_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  AFSpeechInterpretation *v11;
  id v12;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), v9 = v12, (isKindOfClass & 1) != 0))
  {

  }
  else
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v11 = -[AFSpeechInterpretation initWithDictionary:]([AFSpeechInterpretation alloc], "initWithDictionary:", v12);
  if (!v11)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
