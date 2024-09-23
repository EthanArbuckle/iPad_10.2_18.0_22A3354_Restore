@implementation AXMMediaAnalysisCaptions

- (AXMMediaAnalysisCaptions)initWithText:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 classificationIdentifiers:(id)a6
{
  id v11;
  id v12;
  AXMMediaAnalysisCaptions *v13;
  AXMMediaAnalysisCaptions *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AXMMediaAnalysisCaptions;
  v13 = -[AXMMediaAnalysisCaptions init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_text, a3);
    v14->_confidence = a4;
    v14->_isLowConfidence = a5;
    objc_storeStrong((id *)&v14->_classificationIdentifiers, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSArray)classificationIdentifiers
{
  return self->_classificationIdentifiers;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXMMediaAnalysisCaptions text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("text"));

  -[AXMMediaAnalysisCaptions confidence](self, "confidence");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidence"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMMediaAnalysisCaptions isLowConfidence](self, "isLowConfidence"), CFSTR("isLowConfidence"));
  -[AXMMediaAnalysisCaptions classificationIdentifiers](self, "classificationIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("classificationIdentifiers"));

}

- (AXMMediaAnalysisCaptions)initWithCoder:(id)a3
{
  id v4;
  AXMMediaAnalysisCaptions *v5;
  uint64_t v6;
  NSString *text;
  double v8;
  void *v9;
  uint64_t v10;
  NSArray *classificationIdentifiers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMMediaAnalysisCaptions;
  v5 = -[AXMMediaAnalysisCaptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v8;
    v5->_isLowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLowConfidence"));
    AXMSecureCodingClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("classificationIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    classificationIdentifiers = v5->_classificationIdentifiers;
    v5->_classificationIdentifiers = (NSArray *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMMediaAnalysisCaptions<%p>"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMMediaAnalysisCaptions text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMMediaAnalysisCaptions confidence](self, "confidence");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXMMediaAnalysisCaptions isLowConfidence](self, "isLowConfidence");
  -[AXMMediaAnalysisCaptions classificationIdentifiers](self, "classificationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  - Text: '%@' Confidence: %@ isLowConfidence : %ld classificationIdentifiers : %@\n"), v4, v6, v7, v8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
