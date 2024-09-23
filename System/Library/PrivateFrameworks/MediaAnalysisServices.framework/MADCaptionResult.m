@implementation MADCaptionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCaptionResult)initWithCaption:(id)a3 score:(float)a4 containsUnsafeContent:(BOOL)a5 isLowConfidence:(BOOL)a6 classificationIdentifiers:(id)a7
{
  id v13;
  id v14;
  MADCaptionResult *v15;
  MADCaptionResult *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)MADCaptionResult;
  v15 = -[MADResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_caption, a3);
    v16->_score = a4;
    v16->_containsUnsafeContent = a5;
    v16->_isLowConfidence = a6;
    objc_storeStrong((id *)&v16->_classificationIdentifiers, a7);
  }

  return v16;
}

- (MADCaptionResult)initWithCoder:(id)a3
{
  id v4;
  MADCaptionResult *v5;
  uint64_t v6;
  NSString *caption;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *classificationIdentifiers;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADCaptionResult;
  v5 = -[MADResult initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Caption"));
    v6 = objc_claimAutoreleasedReturnValue();
    caption = v5->_caption;
    v5->_caption = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("Score"));
    v5->_score = v8;
    v5->_containsUnsafeContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ContainsUnsafeContent"));
    v5->_isLowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsLowConfidence"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("ClassificationIdentifiers"));
    v12 = objc_claimAutoreleasedReturnValue();
    classificationIdentifiers = v5->_classificationIdentifiers;
    v5->_classificationIdentifiers = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADCaptionResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_caption, CFSTR("Caption"), v6.receiver, v6.super_class);
  *(float *)&v5 = self->_score;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("Score"), v5);
  objc_msgSend(v4, "encodeBool:forKey:", self->_containsUnsafeContent, CFSTR("ContainsUnsafeContent"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLowConfidence, CFSTR("IsLowConfidence"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_classificationIdentifiers, CFSTR("ClassificationIdentifiers"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("Caption: %@>"), self->_caption);
  objc_msgSend(v3, "appendFormat:", CFSTR("Score: %f>"), self->_score);
  if (self->_containsUnsafeContent)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("ContainsUnsafeContent: %@>"), v6);
  if (self->_isLowConfidence)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("IsLowConfidence: %@>"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("ClassificationIdentifiers: %@>"), self->_classificationIdentifiers);
  return v3;
}

- (NSString)caption
{
  return self->_caption;
}

- (float)score
{
  return self->_score;
}

- (BOOL)containsUnsafeContent
{
  return self->_containsUnsafeContent;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSArray)classificationIdentifiers
{
  return self->_classificationIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_caption, 0);
}

@end
