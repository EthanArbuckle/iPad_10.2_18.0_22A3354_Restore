@implementation HMIHomePersonManagerSettings

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
    v7 = -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
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
  return -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMIMutableHomePersonManagerSettings *v4;

  v4 = -[HMIMutableHomePersonManagerSettings init](+[HMIMutableHomePersonManagerSettings allocWithZone:](HMIMutableHomePersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMIHomePersonManagerSettings setFaceClassificationEnabled:](v4, "setFaceClassificationEnabled:", -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"), CFSTR("HMPMS.fce"));

}

- (HMIHomePersonManagerSettings)initWithCoder:(id)a3
{
  id v4;
  HMIHomePersonManagerSettings *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (HMIHomePersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMPMS.fce"));

  -[HMIHomePersonManagerSettings setFaceClassificationEnabled:](v5, "setFaceClassificationEnabled:", v6);
  return v5;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Face Classification Enabled"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isFaceClassificationEnabled
{
  return self->_faceClassificationEnabled;
}

- (void)setFaceClassificationEnabled:(BOOL)a3
{
  self->_faceClassificationEnabled = a3;
}

@end
