@implementation SGExtractionInfo

- (SGExtractionInfo)initWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5
{
  id v9;
  id v10;
  SGExtractionInfo *v11;
  SGExtractionInfo *v12;
  float v13;
  float v14;
  NSNumber *v15;
  void *v16;
  NSNumber *modelVersion;
  double v18;
  NSNumber *v19;
  NSNumber *confidence;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SGExtractionInfo;
  v11 = -[SGExtractionInfo init](&v22, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_12;
  v11->_extractionType = a3;
  objc_msgSend(v10, "floatValue");
  if (v13 < 0.0 || (objc_msgSend(v10, "floatValue"), v14 > 1.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SGExtractionInfo.m"), 29, CFSTR("Extraction confidence must be between 0 and 1"));

    if (v9)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v9)
    goto LABEL_7;
LABEL_5:
  v15 = (NSNumber *)v9;
LABEL_8:
  modelVersion = v12->_modelVersion;
  v12->_modelVersion = v15;

  if (v10)
  {
    v19 = (NSNumber *)v10;
  }
  else
  {
    LODWORD(v18) = 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  confidence = v12->_confidence;
  v12->_confidence = v19;

LABEL_12:
  return v12;
}

- (SGExtractionInfo)initWithCoder:(id)a3
{
  id v4;
  SGExtractionInfo *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *modelVersion;
  void *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *confidence;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGExtractionInfo;
  v5 = -[SGExtractionInfo init](&v15, sel_init);
  if (v5)
  {
    v5->_extractionType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("extractionType"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("modelVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = (NSNumber *)&unk_1E47813B8;
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("confidence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = v11;
    else
      v12 = (NSNumber *)&unk_1E47817B0;
    confidence = v5->_confidence;
    v5->_confidence = v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t extractionType;
  id v5;

  extractionType = self->_extractionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", extractionType, CFSTR("extractionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_confidence, CFSTR("confidence"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[SGExtractionInfo extractionType](self, "extractionType");
  -[SGExtractionInfo modelVersion](self, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionInfo confidence](self, "confidence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithExtractionType:modelVersion:confidence:", v5, v6, v7);

  return v8;
}

- (unint64_t)extractionType
{
  return self->_extractionType;
}

- (NSNumber)modelVersion
{
  return self->_modelVersion;
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

+ (SGExtractionInfo)extractionInfoWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtractionType:modelVersion:confidence:", a3, v9, v8);

  return (SGExtractionInfo *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
