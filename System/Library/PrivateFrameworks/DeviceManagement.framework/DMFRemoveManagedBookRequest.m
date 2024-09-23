@implementation DMFRemoveManagedBookRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4C88;
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

- (DMFRemoveManagedBookRequest)initWithCoder:(id)a3
{
  id v4;
  DMFRemoveManagedBookRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *persistentID;
  void *v9;
  uint64_t v10;
  NSNumber *iTunesStoreID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFRemoveManagedBookRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("persistentID"));
    v7 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("iTunesStoreID"));
    v10 = objc_claimAutoreleasedReturnValue();
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v10;

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
  v7.super_class = (Class)DMFRemoveManagedBookRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFRemoveManagedBookRequest persistentID](self, "persistentID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("persistentID"));

  -[DMFRemoveManagedBookRequest iTunesStoreID](self, "iTunesStoreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("iTunesStoreID"));

}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (void)setITunesStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
}

@end
