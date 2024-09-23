@implementation DMFFetchApplicationsRequest

- (DMFFetchApplicationsRequest)init
{
  DMFFetchApplicationsRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFFetchApplicationsRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
  {
    result->_typeFilter = 0;
    result->_stateFilter = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchApplicationsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchApplicationsRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *bundleIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFFetchApplicationsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bundleIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeFilter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_typeFilter = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateFilter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stateFilter = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("excludeIcon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_excludeIcon = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("excludeUnmanagedApps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_excludeUnmanagedApps = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deleteFeedback"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deleteFeedback = objc_msgSend(v15, "BOOLValue");

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DMFFetchApplicationsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[DMFFetchApplicationsRequest bundleIdentifiers](self, "bundleIdentifiers", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchApplicationsRequest typeFilter](self, "typeFilter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("typeFilter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchApplicationsRequest stateFilter](self, "stateFilter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stateFilter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchApplicationsRequest excludeIcon](self, "excludeIcon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("excludeIcon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchApplicationsRequest excludeUnmanagedApps](self, "excludeUnmanagedApps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("excludeUnmanagedApps"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchApplicationsRequest deleteFeedback](self, "deleteFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("deleteFeedback"));

}

- (BOOL)excludeIcon
{
  return self->_excludeIcon;
}

- (void)setExcludeIcon:(BOOL)a3
{
  self->_excludeIcon = a3;
}

- (BOOL)excludeUnmanagedApps
{
  return self->_excludeUnmanagedApps;
}

- (void)setExcludeUnmanagedApps:(BOOL)a3
{
  self->_excludeUnmanagedApps = a3;
}

- (BOOL)deleteFeedback
{
  return self->_deleteFeedback;
}

- (void)setDeleteFeedback:(BOOL)a3
{
  self->_deleteFeedback = a3;
}

- (unint64_t)typeFilter
{
  return self->_typeFilter;
}

- (void)setTypeFilter:(unint64_t)a3
{
  self->_typeFilter = a3;
}

- (unint64_t)stateFilter
{
  return self->_stateFilter;
}

- (void)setStateFilter:(unint64_t)a3
{
  self->_stateFilter = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
