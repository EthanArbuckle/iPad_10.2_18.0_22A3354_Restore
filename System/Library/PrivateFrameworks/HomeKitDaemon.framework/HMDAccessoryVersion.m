@implementation HMDAccessoryVersion

- (HMDAccessoryVersion)initWithVersionString:(id)a3
{
  id v4;
  HMDAccessoryVersion *v5;
  HMDAccessoryVersion *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSString *rawVersionString;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "integerValue") < 10000)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDAccessoryVersion;
    v5 = -[HMDAccessoryVersion initWithVersionString:](&v12, sel_initWithVersionString_, v4);
  }
  else
  {
    v5 = -[HMDAccessoryVersion initWithMajorVersion:minorVersion:updateVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:");
  }
  v6 = v5;
  if (v5)
  {
    -[HMDAccessoryVersion versionString](v5, "versionString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = objc_msgSend(v4, "copy");
      rawVersionString = v6->_rawVersionString;
      v6->_rawVersionString = (NSString *)v9;

    }
  }

  return v6;
}

- (HMDAccessoryVersion)initWithMatterVersionString:(id)a3
{
  id v4;
  HMDAccessoryVersion *v5;
  HMDAccessoryVersion *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSString *rawVersionString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryVersion;
  v5 = -[HMDAccessoryVersion initWithVersionString:](&v12, sel_initWithVersionString_, v4);
  v6 = v5;
  if (v5)
  {
    -[HMDAccessoryVersion versionString](v5, "versionString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = objc_msgSend(v4, "copy");
      rawVersionString = v6->_rawVersionString;
      v6->_rawVersionString = (NSString *)v9;

    }
  }

  return v6;
}

- (NSString)rawVersionString
{
  NSString *rawVersionString;

  rawVersionString = self->_rawVersionString;
  if (rawVersionString)
    return rawVersionString;
  -[HMDAccessoryVersion versionString](self, "versionString");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (HMDAccessoryVersion)initWithCoder:(id)a3
{
  id v4;
  HMDAccessoryVersion *v5;
  uint64_t v6;
  NSString *rawVersionString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryVersion;
  v5 = -[HMDAccessoryVersion initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.rawVersionString"));
    v6 = objc_claimAutoreleasedReturnValue();
    rawVersionString = v5->_rawVersionString;
    v5->_rawVersionString = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *rawVersionString;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryVersion;
  -[HMDAccessoryVersion encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  rawVersionString = self->_rawVersionString;
  if (rawVersionString)
    objc_msgSend(v4, "encodeObject:forKey:", rawVersionString, CFSTR("HM.rawVersionString"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawVersionString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
