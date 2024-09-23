@implementation AFSpeechUtterance

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSArray hash](self->_interpretationIndices, "hash");
  -[NSArray firstObject](self->_interpretationIndices, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *v5;
  AFSpeechInterpretation *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v5 = (NSArray *)v4[1], v5 == self->_interpretationIndices) || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && v4[2] == self->_confidenceScore
    && v4[3] == self->_source)
  {
    v6 = (AFSpeechInterpretation *)v4[4];
    if (v6 == self->_interpretation)
      v7 = 1;
    else
      v7 = -[AFSpeechInterpretation isEqual:](v6, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *interpretationIndices;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AFSpeechUtterance;
  -[AFSpeechUtterance description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  interpretationIndices = self->_interpretationIndices;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_confidenceScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, interpretationIndices=%@, confidenceScore=%@, source=%@, interpretation=%@"), v4, interpretationIndices, v6, v7, self->_interpretation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *interpretationIndices;
  id v5;

  interpretationIndices = self->_interpretationIndices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interpretationIndices, CFSTR("_interpretationIndices"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_confidenceScore, CFSTR("_confidenceScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("_source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interpretation, CFSTR("_interpretation"));

}

- (AFSpeechUtterance)initWithCoder:(id)a3
{
  id v4;
  AFSpeechUtterance *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *interpretationIndices;
  uint64_t v11;
  AFSpeechInterpretation *interpretation;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechUtterance;
  v5 = -[AFSpeechUtterance init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_interpretationIndices"));
    v9 = objc_claimAutoreleasedReturnValue();
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v9;

    v5->_confidenceScore = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_confidenceScore"));
    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interpretation"));
    v11 = objc_claimAutoreleasedReturnValue();
    interpretation = v5->_interpretation;
    v5->_interpretation = (AFSpeechInterpretation *)v11;

  }
  return v5;
}

- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4
{
  return -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:interpretation:](self, "initWithInterpretationIndices:confidenceScore:interpretation:", a3, a4, 0);
}

- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4 interpretation:(id)a5
{
  id v8;
  id v9;
  AFSpeechUtterance *v10;
  uint64_t v11;
  NSArray *interpretationIndices;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechUtterance;
  v10 = -[AFSpeechUtterance init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    interpretationIndices = v10->_interpretationIndices;
    v10->_interpretationIndices = (NSArray *)v11;

    v10->_confidenceScore = a4;
    objc_storeStrong((id *)&v10->_interpretation, a5);
  }

  return v10;
}

- (AFSpeechUtterance)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  id v9;
  AFSpeechUtterance *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("interpretationIndices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("interpretationIndices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v9)
  {
    NSClassFromString(v8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__7975;
      v23 = __Block_byref_object_dispose__7976;
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40__AFSpeechUtterance_initWithDictionary___block_invoke;
      v18[3] = &unk_1E3A2F110;
      v18[4] = &v25;
      v18[5] = &v19;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
      if (*((_BYTE *)v26 + 24) || !objc_msgSend((id)v20[5], "count"))
      {
        v10 = 0;
LABEL_15:
        _Block_object_dispose(&v19, 8);

        _Block_object_dispose(&v25, 8);
        goto LABEL_16;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("confidenceScore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v15 = v13;
      v16 = v15;
      if (v14 && (NSClassFromString(v15), (objc_opt_isKindOfClass() & 1) != 0))
      {

        if ((objc_msgSend(v14, "intValue") & 0x80000000) == 0 && (int)objc_msgSend(v14, "intValue") <= 1000)
        {
          self = -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:](self, "initWithInterpretationIndices:confidenceScore:", v20[5], (int)objc_msgSend(v14, "intValue"));
          v10 = self;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {

      }
      v10 = 0;
      goto LABEL_14;
    }
  }

  v10 = 0;
LABEL_16:

  return v10;
}

- (id)dictionaryRepresentation
{
  int64_t confidenceScore;
  void *v4;
  void *v5;
  AFSpeechInterpretation *interpretation;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  confidenceScore = self->_confidenceScore;
  v11[0] = self->_interpretationIndices;
  v10[0] = CFSTR("interpretationIndices");
  v10[1] = CFSTR("confidenceScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", confidenceScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("interpretation");
  interpretation = self->_interpretation;
  if (interpretation)
    -[AFSpeechInterpretation dictionaryRepresentation](interpretation, "dictionaryRepresentation");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (void)setInterpretationIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(int64_t)a3
{
  self->_confidenceScore = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (AFSpeechInterpretation)interpretation
{
  return self->_interpretation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretation, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);
}

void __40__AFSpeechUtterance_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  id v11;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v11 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), v9 = v11, (isKindOfClass & 1) != 0))
  {

  }
  else
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  if ((objc_msgSend(v11, "intValue") & 0x80000000) != 0)
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
