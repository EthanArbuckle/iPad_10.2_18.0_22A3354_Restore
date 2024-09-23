@implementation HMHomePersonManagerSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isFaceClassificationEnabled
{
  return self->_faceClassificationEnabled;
}

- (HMHomePersonManagerSettings)initWithCoder:(id)a3
{
  id v4;
  HMHomePersonManagerSettings *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (HMHomePersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMPMS.fce"));

  -[HMHomePersonManagerSettings setFaceClassificationEnabled:](v5, "setFaceClassificationEnabled:", v6);
  return v5;
}

- (void)setFaceClassificationEnabled:(BOOL)a3
{
  self->_faceClassificationEnabled = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
    v8 = v7 ^ objc_msgSend(v6, "isFaceClassificationEnabled") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableHomePersonManagerSettings *v4;

  v4 = -[HMMutableHomePersonManagerSettings init](+[HMMutableHomePersonManagerSettings allocWithZone:](HMMutableHomePersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMHomePersonManagerSettings setFaceClassificationEnabled:](v4, "setFaceClassificationEnabled:", -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"), CFSTR("HMPMS.fce"));

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Face Classification Enabled"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
