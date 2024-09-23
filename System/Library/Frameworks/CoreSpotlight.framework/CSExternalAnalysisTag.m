@implementation CSExternalAnalysisTag

- (void)encodeWithCSCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "beginType:", "CSExternalAnalysisTag");
  -[CSExternalAnalysisTag label](self, "label");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  -[CSExternalAnalysisTag synonyms](self, "synonyms");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "encodeObject:", v7);

  -[CSExternalAnalysisTag confidence](self, "confidence");
  objc_msgSend(v8, "encodeDouble:");
  objc_msgSend(v8, "endType");

}

- (CSExternalAnalysisTag)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5
{
  id v9;
  id v10;
  CSExternalAnalysisTag *v11;
  CSExternalAnalysisTag *v12;
  NSArray *v13;
  NSArray *synonyms;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSExternalAnalysisTag;
  v11 = -[CSExternalAnalysisTag init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    if (v10)
    {
      v13 = (NSArray *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    synonyms = v12->_synonyms;
    v12->_synonyms = v13;

    v12->_confidence = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_synonyms, CFSTR("synonyms"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);

}

- (CSExternalAnalysisTag)initWithCoder:(id)a3
{
  id v4;
  CSExternalAnalysisTag *v5;
  uint64_t v6;
  NSString *label;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *synonyms;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSExternalAnalysisTag;
  v5 = -[CSExternalAnalysisTag init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("synonyms"));
    v11 = objc_claimAutoreleasedReturnValue();
    synonyms = v5->_synonyms;
    v5->_synonyms = (NSArray *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:synonyms:confidence:", self->_label, self->_synonyms, self->_confidence);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  NSString *label;
  NSString *v8;
  BOOL v9;
  NSArray *synonyms;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double confidence;
  double v17;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    label = self->_label;
    objc_msgSend(v6, "label");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (label != v8)
    {
      if (!self->_label)
      {
        v9 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v6, "label");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", self->_label))
      {
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    synonyms = self->_synonyms;
    objc_msgSend(v6, "synonyms");
    v11 = objc_claimAutoreleasedReturnValue();
    if (synonyms == (NSArray *)v11)
    {
      confidence = self->_confidence;
      objc_msgSend(v6, "confidence");
      v9 = confidence == v17;

    }
    else
    {
      v12 = (void *)v11;
      if (self->_synonyms)
      {
        objc_msgSend(v6, "synonyms");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", self->_synonyms))
        {
          v14 = self->_confidence;
          objc_msgSend(v6, "confidence");
          v9 = v14 == v15;

          goto LABEL_15;
        }

      }
      v9 = 0;
    }
LABEL_15:
    if (label != v8)
      goto LABEL_16;
LABEL_17:

    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[NSArray count](self->_synonyms, "count");
  v4 = -[NSString hash](self->_label, "hash");
  v5 = MDUHash64(v3) ^ v4;
  if (v3)
  {
    -[NSArray firstObject](self->_synonyms, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= objc_msgSend(v6, "hash");

    if (v3 != 1)
    {
      -[NSArray lastObject](self->_synonyms, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 ^= objc_msgSend(v7, "hash");

    }
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  double confidence;
  NSString *label;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  confidence = self->_confidence;
  label = self->_label;
  -[NSArray componentsJoinedByString:](self->_synonyms, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %f <%@>"), v4, self, label, *(_QWORD *)&confidence, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)synonyms
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSynonyms:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
