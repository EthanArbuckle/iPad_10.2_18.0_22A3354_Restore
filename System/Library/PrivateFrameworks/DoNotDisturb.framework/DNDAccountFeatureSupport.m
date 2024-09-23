@implementation DNDAccountFeatureSupport

- (id)_initWithCloud:(unint64_t)a3 hasCloud:(BOOL)a4 paired:(unint64_t)a5 hasPaired:(BOOL)a6
{
  id result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DNDAccountFeatureSupport;
  result = -[DNDAccountFeatureSupport init](&v11, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a4;
    *((_QWORD *)result + 2) = a3;
    *((_QWORD *)result + 3) = a5;
    *((_BYTE *)result + 9) = a6;
  }
  return result;
}

+ (id)accountFeaturesWithCloud:(unint64_t)a3 hasCloudDevices:(BOOL)a4 paired:(unint64_t)a5 hasPairedDevices:(BOOL)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCloud:hasCloud:paired:hasPaired:", a3, a4, a5, a6);
}

- (id)description
{
  void *v3;
  _BOOL4 hasCloudDevices;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  hasCloudDevices = self->_hasCloudDevices;
  if (self->_hasCloudDevices)
  {
    DNDStringFromSupportedAccountFeatures(self->_cloudFeatures);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("<N/A>");
  }
  if (!self->_hasPairedDevices)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("cloud: %@; paired: %@;"), v5, CFSTR("<N/A>"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!hasCloudDevices)
      return v7;
    goto LABEL_6;
  }
  DNDStringFromSupportedAccountFeatures(self->_pairedFeatures);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("cloud: %@; paired: %@;"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (hasCloudDevices)
LABEL_6:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAccountFeatureSupport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  DNDAccountFeatureSupport *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCloud"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paired"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPaired"));

  v9 = -[DNDAccountFeatureSupport _initWithCloud:hasCloud:paired:hasPaired:](self, "_initWithCloud:hasCloud:paired:hasPaired:", objc_msgSend(v5, "unsignedIntegerValue"), v6, objc_msgSend(v7, "unsignedIntegerValue"), v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t cloudFeatures;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  cloudFeatures = self->_cloudFeatures;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", cloudFeatures);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("cloud"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_hasCloudDevices, CFSTR("hasCloud"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pairedFeatures);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("paired"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_hasPairedDevices, CFSTR("hasPaired"));
}

- (unint64_t)cloudFeatures
{
  return self->_cloudFeatures;
}

- (BOOL)hasCloudDevices
{
  return self->_hasCloudDevices;
}

- (unint64_t)pairedFeatures
{
  return self->_pairedFeatures;
}

- (BOOL)hasPairedDevices
{
  return self->_hasPairedDevices;
}

@end
