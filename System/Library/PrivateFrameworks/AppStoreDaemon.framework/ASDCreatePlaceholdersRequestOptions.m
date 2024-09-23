@implementation ASDCreatePlaceholdersRequestOptions

- (ASDCreatePlaceholdersRequestOptions)initWithApplicationMetadata:(id)a3
{
  id v5;
  ASDCreatePlaceholdersRequestOptions *v6;
  ASDCreatePlaceholdersRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDCreatePlaceholdersRequestOptions;
  v6 = -[ASDCreatePlaceholdersRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDCreatePlaceholdersRequestOptions *v5;
  uint64_t v6;
  NSArray *items;

  v5 = -[ASDCreatePlaceholdersRequestOptions init](+[ASDCreatePlaceholdersRequestOptions allocWithZone:](ASDCreatePlaceholdersRequestOptions, "allocWithZone:"), "init");
  v5->_completeDataPromise = self->_completeDataPromise;
  v5->_createAsMobileBackup = self->_createAsMobileBackup;
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDCreatePlaceholdersRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDCreatePlaceholdersRequestOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDCreatePlaceholdersRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_completeDataPromise = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completeDataPromise"));
    v5->_createAsMobileBackup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("createAsMobileBackup"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASDCreatePlaceholdersRequestOptions items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("items"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ASDCreatePlaceholdersRequestOptions completeDataPromise](self, "completeDataPromise"), CFSTR("completeDataPromise"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ASDCreatePlaceholdersRequestOptions createAsMobileBackup](self, "createAsMobileBackup"), CFSTR("createAsMobileBackup"));

}

- (BOOL)completeDataPromise
{
  return self->_completeDataPromise;
}

- (void)setCompleteDataPromise:(BOOL)a3
{
  self->_completeDataPromise = a3;
}

- (BOOL)createAsMobileBackup
{
  return self->_createAsMobileBackup;
}

- (void)setCreateAsMobileBackup:(BOOL)a3
{
  self->_createAsMobileBackup = a3;
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
