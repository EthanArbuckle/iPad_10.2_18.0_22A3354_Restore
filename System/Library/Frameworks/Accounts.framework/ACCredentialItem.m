@implementation ACCredentialItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACCredentialItem)initWithManagedCredentialItem:(id)a3 accountStore:(id)a4
{
  id v6;
  ACCredentialItem *v7;
  ACCredentialItem *v8;

  v6 = a4;
  v7 = -[ACCredentialItem initWithManagedCredentialItem:](self, "initWithManagedCredentialItem:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_accountStore, v6);

  return v8;
}

- (ACCredentialItem)initWithManagedCredentialItem:(id)a3
{
  id v4;
  ACCredentialItem *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSDate *expirationDate;
  uint64_t v10;
  NSString *serviceName;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *objectID;
  ACCredentialItem *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACCredentialItem;
  v5 = -[ACCredentialItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accountIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "expirationDate");
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    objc_msgSend(v4, "serviceName");
    v10 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    objc_msgSend(v4, "persistent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_persistent = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URIRepresentation");
    v14 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v14;

    v16 = v5;
  }

  return v5;
}

- (ACCredentialItem)initWithAccountIdentifier:(id)a3 serviceName:(id)a4
{
  id v6;
  id v7;
  ACCredentialItem *v8;
  uint64_t v9;
  NSString *accountIdentifier;
  uint64_t v11;
  NSString *serviceName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACCredentialItem;
  v8 = -[ACCredentialItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v11;

    -[ACCredentialItem _markPropertyDirty:](v8, "_markPropertyDirty:", CFSTR("accountIdentifier"));
    -[ACCredentialItem _markPropertyDirty:](v8, "_markPropertyDirty:", CFSTR("serviceName"));
    -[ACCredentialItem _markPropertyDirty:](v8, "_markPropertyDirty:", CFSTR("persistent"));
  }

  return v8;
}

- (ACCredentialItem)initWithCoder:(id)a3
{
  id v4;
  ACCredentialItem *v5;
  void *v6;
  uint64_t v7;
  NSString *accountIdentifier;
  uint64_t v9;
  NSDate *expirationDate;
  void *v11;
  uint64_t v12;
  NSString *serviceName;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *objectID;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *dirtyProperties;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACCredentialItem;
  v5 = -[ACCredentialItem init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_persistent = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("dirtyProperties"));
    v21 = objc_claimAutoreleasedReturnValue();
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v21;

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
  id v10;

  v4 = a3;
  -[ACCredentialItem accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountIdentifier"));

  -[ACCredentialItem expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("expirationDate"));

  -[ACCredentialItem serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serviceName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACCredentialItem isPersistent](self, "isPersistent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("persistent"));

  -[ACCredentialItem objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("objectID"));

  -[ACCredentialItem dirtyProperties](self, "dirtyProperties");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dirtyProperties"));

}

- (id)_initWithProtobuf:(id)a3
{
  id v4;
  ACCredentialItem *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  void *v10;
  uint64_t v11;
  NSDate *expirationDate;
  void *v13;
  uint64_t v14;
  NSString *serviceName;
  void *v16;
  uint64_t v17;
  NSURL *objectID;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSMutableSet *dirtyProperties;
  ACCredentialItem *v24;

  v4 = a3;
  v5 = -[ACCredentialItem init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    if (objc_msgSend(v6, "hasExpirationDate"))
    {
      objc_msgSend(v6, "expirationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "date");
      v11 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v11;

    }
    objc_msgSend(v6, "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v14;

    v5->_persistent = objc_msgSend(v6, "isPersistent");
    if (objc_msgSend(v6, "hasObjectID"))
    {
      objc_msgSend(v6, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "url");
      v17 = objc_claimAutoreleasedReturnValue();
      objectID = v5->_objectID;
      v5->_objectID = (NSURL *)v17;

    }
    objc_msgSend(v6, "dirtyProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "dirtyProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithArray:", v21);
      dirtyProperties = v5->_dirtyProperties;
      v5->_dirtyProperties = (NSMutableSet *)v22;

    }
    v24 = v5;

  }
  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5;
  ACProtobufCredentialItem *v6;
  ACCredentialItem *v7;
  void *v9;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCredentialItem.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length != 0"));

  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[ACProtobufCredentialItem initWithData:]([ACProtobufCredentialItem alloc], "initWithData:", v5);
    if (v6)
    {
      self = (ACCredentialItem *)-[ACCredentialItem _initWithProtobuf:](self, "_initWithProtobuf:", v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  void *v3;
  ACProtobufDate *v4;
  ACProtobufURL *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAccountIdentifier:", self->_accountIdentifier);
  v4 = -[ACProtobufDate initWithDate:]([ACProtobufDate alloc], "initWithDate:", self->_expirationDate);
  objc_msgSend(v3, "setExpirationDate:", v4);

  objc_msgSend(v3, "setServiceName:", self->_serviceName);
  objc_msgSend(v3, "setIsPersistent:", -[ACCredentialItem isPersistent](self, "isPersistent"));
  v5 = -[ACProtobufURL initWithURL:]([ACProtobufURL alloc], "initWithURL:", self->_objectID);
  objc_msgSend(v3, "setObjectID:", v5);

  -[ACCredentialItem dirtyProperties](self, "dirtyProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v3, "setDirtyProperties:", v8);

  return v3;
}

- (id)_encodeProtobufData
{
  void *v2;
  void *v3;

  -[ACCredentialItem _encodeProtobuf](self, "_encodeProtobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACCredentialItem accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCredentialItem serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACCredentialItem accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCredentialItem expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCredentialItem serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACCredentialItem isPersistent](self, "isPersistent"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[ACCredentialItem objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("accountIdentifier: %@\nexpirationDate: %@\nserviceName: %@\npersistent: %@\nobjectID: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_BYTE *)(v5 + 32) = self->_persistent;
  v12 = -[NSURL copyWithZone:](self->_objectID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  objc_storeWeak((id *)(v5 + 48), WeakRetained);

  v15 = -[NSMutableSet mutableCopyWithZone:](self->_dirtyProperties, "mutableCopyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  return (id)v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  NSString *v4;
  NSString *accountIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("accountIdentifier"));
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isExpired
{
  NSDate *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", v3) != NSOrderedDescending;

  return (char)expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("expirationDate"));
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->_serviceName;
  self->_serviceName = v4;

  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("serviceName"));
}

- (BOOL)isPersistent
{
  return self->_persistent;
}

- (void)setPersistent:(BOOL)a3
{
  self->_persistent = a3;
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("persistent"));
}

- (NSURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("objectID"));
}

- (BOOL)isDirty
{
  return -[NSMutableSet count](self->_dirtyProperties, "count") != 0;
}

- (BOOL)isPropertyDirty:(id)a3
{
  return -[NSMutableSet containsObject:](self->_dirtyProperties, "containsObject:", a3);
}

- (void)markAllPropertiesDirty
{
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("accountIdentifier"));
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("expirationDate"));
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("serviceName"));
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("persistent"));
  -[ACCredentialItem _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("objectID"));
}

- (void)_markPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableSet addObject:](dirtyProperties, "addObject:", v4);

}

- (void)clearDirtyProperties
{
  NSMutableSet *dirtyProperties;

  dirtyProperties = self->_dirtyProperties;
  self->_dirtyProperties = 0;

}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_loadWeakRetained((id *)&self->_accountStore);
}

- (void)setAccountStore:(id)a3
{
  objc_storeWeak((id *)&self->_accountStore, a3);
}

- (NSSet)dirtyProperties
{
  return &self->_dirtyProperties->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_destroyWeak((id *)&self->_accountStore);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
