@implementation ASDRestoreApplicationsRequestOptions

- (ASDRestoreApplicationsRequestOptions)initWithApplicationMetadata:(id)a3
{
  id v5;
  ASDRestoreApplicationsRequestOptions *v6;
  ASDRestoreApplicationsRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRestoreApplicationsRequestOptions;
  v6 = -[ASDRestoreApplicationsRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDRestoreApplicationsRequestOptions *v5;
  uint64_t v6;
  NSArray *items;

  v5 = -[ASDRestoreApplicationsRequestOptions init](+[ASDRestoreApplicationsRequestOptions allocWithZone:](ASDRestoreApplicationsRequestOptions, "allocWithZone:"), "init");
  v5->_completeDataPromise = self->_completeDataPromise;
  v5->_createAsMobileBackup = self->_createAsMobileBackup;
  v5->_createsPlaceholders = self->_createsPlaceholders;
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  v5->_restoreApplicationData = self->_restoreApplicationData;
  v5->_skipCoordinatorCompletion = self->_skipCoordinatorCompletion;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRestoreApplicationsRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDRestoreApplicationsRequestOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRestoreApplicationsRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_completeDataPromise = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completeDataPromise"));
    v5->_createAsMobileBackup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("createsAsMobileBackup"));
    v5->_createsPlaceholders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("createsPlaceholders"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_restoreApplicationData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restoreAppData"));
    v5->_skipCoordinatorCompletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipCompletion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 completeDataPromise;
  void *v5;
  id v6;

  completeDataPromise = self->_completeDataPromise;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", completeDataPromise, CFSTR("completeDataPromise"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_createAsMobileBackup, CFSTR("createsAsMobileBackup"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_createsPlaceholders, CFSTR("createsPlaceholders"));
  -[ASDRestoreApplicationsRequestOptions items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("items"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_restoreApplicationData, CFSTR("restoreAppData"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_skipCoordinatorCompletion, CFSTR("skipCompletion"));

}

- (BOOL)completeDataPromise
{
  return self->_completeDataPromise;
}

- (void)setCompleteDataPromise:(BOOL)a3
{
  self->_completeDataPromise = a3;
}

- (BOOL)createsPlaceholders
{
  return self->_createsPlaceholders;
}

- (void)setCreatesPlaceholders:(BOOL)a3
{
  self->_createsPlaceholders = a3;
}

- (BOOL)createAsMobileBackup
{
  return self->_createAsMobileBackup;
}

- (void)setCreateAsMobileBackup:(BOOL)a3
{
  self->_createAsMobileBackup = a3;
}

- (BOOL)skipCoordinatorCompletion
{
  return self->_skipCoordinatorCompletion;
}

- (void)setSkipCoordinatorCompletion:(BOOL)a3
{
  self->_skipCoordinatorCompletion = a3;
}

- (BOOL)restoreApplicationData
{
  return self->_restoreApplicationData;
}

- (void)setRestoreApplicationData:(BOOL)a3
{
  self->_restoreApplicationData = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
