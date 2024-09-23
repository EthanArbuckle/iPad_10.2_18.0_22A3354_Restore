@implementation DMFFetchAppsRequest

- (DMFFetchAppsRequest)init
{
  DMFFetchAppsRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFFetchAppsRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
    result->_type = 3;
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4880;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAppsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchAppsRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *bundleIdentifiers;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *storeItemIdentifier;
  void *v16;
  uint64_t v17;
  NSURL *manifestURL;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *propertyKeys;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DMFFetchAppsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("bundleIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deleteFeedback"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deleteFeedback = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("storeItemIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("manifestURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managedAppsOnly"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_managedAppsOnly = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advanceTransientStates"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_advanceTransientStates = objc_msgSend(v20, "BOOLValue");

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("propertyKeys"));
    v24 = objc_claimAutoreleasedReturnValue();
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMFFetchAppsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchAppsRequest type](self, "type", v13.receiver, v13.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[DMFFetchAppsRequest bundleIdentifiers](self, "bundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchAppsRequest deleteFeedback](self, "deleteFeedback"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deleteFeedback"));

  -[DMFFetchAppsRequest storeItemIdentifier](self, "storeItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("storeItemIdentifier"));

  -[DMFFetchAppsRequest manifestURL](self, "manifestURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("manifestURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchAppsRequest managedAppsOnly](self, "managedAppsOnly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("managedAppsOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchAppsRequest advanceTransientStates](self, "advanceTransientStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("advanceTransientStates"));

  -[DMFFetchAppsRequest propertyKeys](self, "propertyKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("propertyKeys"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)deleteFeedback
{
  return self->_deleteFeedback;
}

- (void)setDeleteFeedback:(BOOL)a3
{
  self->_deleteFeedback = a3;
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (void)setManifestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)managedAppsOnly
{
  return self->_managedAppsOnly;
}

- (void)setManagedAppsOnly:(BOOL)a3
{
  self->_managedAppsOnly = a3;
}

- (BOOL)advanceTransientStates
{
  return self->_advanceTransientStates;
}

- (void)setAdvanceTransientStates:(BOOL)a3
{
  self->_advanceTransientStates = a3;
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
