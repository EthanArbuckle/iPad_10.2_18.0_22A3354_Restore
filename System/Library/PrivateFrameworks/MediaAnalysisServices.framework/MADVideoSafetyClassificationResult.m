@implementation MADVideoSafetyClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 scoresForLabels:(id)a4
{
  id v7;
  MADVideoSafetyClassificationResult *v8;
  MADVideoSafetyClassificationResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoSafetyClassificationResult;
  v8 = -[MADVideoSafetyClassificationResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isSensitive = a3;
    objc_storeStrong((id *)&v8->_scoresForLabels, a4);
  }

  return v9;
}

- (MADVideoSafetyClassificationResult)initWithCoder:(id)a3
{
  id v4;
  MADVideoSafetyClassificationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *scoresForLabels;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVideoSafetyClassificationResult;
  v5 = -[MADVideoResult initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_isSensitive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsSensitive"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ScoresForLabels"));
    v9 = objc_claimAutoreleasedReturnValue();
    scoresForLabels = v5->_scoresForLabels;
    v5->_scoresForLabels = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVideoSafetyClassificationResult;
  v4 = a3;
  -[MADVideoResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSensitive, CFSTR("IsSensitive"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scoresForLabels, CFSTR("ScoresForLabels"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  if (self->_isSensitive)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", isSensitive: %@"), v6);
  -[NSDictionary description](self->_scoresForLabels, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", ScoresForLabels: %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (NSDictionary)scoresForLabels
{
  return self->_scoresForLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
}

@end
