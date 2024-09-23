@implementation _LSJournalledNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSJournalledNotification)initWithNotification:(int)a3 bundleIDs:(id)a4 plugins:(BOOL)a5 options:(id)a6
{
  id v11;
  id v12;
  _LSJournalledNotification *v13;
  _LSJournalledNotification *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_LSJournalledNotification;
  v13 = -[_LSJournalledNotification init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_notification = a3;
    objc_storeStrong((id *)&v13->_bundleIDs, a4);
    v14->_includePlugins = a5;
    objc_storeStrong((id *)&v14->_options, a6);
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t notification;
  id v5;

  notification = self->_notification;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", notification, CFSTR("_notification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIDs, CFSTR("_bundleIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includePlugins, CFSTR("_includePlugins"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("_options"));

}

- (_LSJournalledNotification)initWithCoder:(id)a3
{
  id v4;
  _LSJournalledNotification *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *bundleIDs;
  void *v11;
  uint64_t v12;
  NSDictionary *options;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSJournalledNotification;
  v5 = -[_LSJournalledNotification init](&v15, sel_init);
  if (v5)
  {
    v5->_notification = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_notification"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v8, CFSTR("_bundleIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v9;

    v5->_includePlugins = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includePlugins"));
    XNSGetPropertyListClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v11, CFSTR("_options"));
    v12 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;

  }
  return v5;
}

- (int)notification
{
  return self->_notification;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (BOOL)includePlugins
{
  return self->_includePlugins;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
