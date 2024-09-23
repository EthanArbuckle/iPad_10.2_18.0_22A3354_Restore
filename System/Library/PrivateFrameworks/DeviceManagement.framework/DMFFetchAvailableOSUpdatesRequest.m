@implementation DMFFetchAvailableOSUpdatesRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4898;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAvailableOSUpdatesRequest)init
{
  DMFFetchAvailableOSUpdatesRequest *v2;
  DMFFetchAvailableOSUpdatesRequest *v3;
  NSString *productVersion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  v2 = -[CATTaskRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    productVersion = v2->_productVersion;
    v2->_productVersion = 0;

    v3->_useDelay = 0;
  }
  return v3;
}

- (DMFFetchAvailableOSUpdatesRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchAvailableOSUpdatesRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *productVersion;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("productVersion"));
    v7 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useDelay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useDelay = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFFetchAvailableOSUpdatesRequest productVersion](self, "productVersion", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchAvailableOSUpdatesRequest useDelay](self, "useDelay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("useDelay"));

}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)useDelay
{
  return self->_useDelay;
}

- (void)setUseDelay:(BOOL)a3
{
  self->_useDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productVersion, 0);
}

@end
