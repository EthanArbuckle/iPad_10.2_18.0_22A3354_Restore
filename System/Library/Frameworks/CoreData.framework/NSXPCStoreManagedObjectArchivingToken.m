@implementation NSXPCStoreManagedObjectArchivingToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSXPCStoreManagedObjectArchivingToken)initWithURI:(id)a3
{
  NSXPCStoreManagedObjectArchivingToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSXPCStoreManagedObjectArchivingToken;
  v4 = -[NSXPCStoreManagedObjectArchivingToken init](&v6, sel_init);
  if (v4)
    v4->_managedObjectReferenceURI = (NSURL *)a3;
  return v4;
}

- (id)URI
{
  return self->_managedObjectReferenceURI;
}

- (void)dealloc
{
  objc_super v3;

  self->_managedObjectReferenceURI = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreManagedObjectArchivingToken;
  -[NSXPCStoreManagedObjectArchivingToken dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_managedObjectReferenceURI, CFSTR("NSManagedObjectIDURI"));
}

- (NSXPCStoreManagedObjectArchivingToken)initWithCoder:(id)a3
{
  NSXPCStoreManagedObjectArchivingToken *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSXPCStoreManagedObjectArchivingToken *v16;
  NSXPCStoreManagedObjectArchivingToken *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v4 = self;
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSManagedObjectIDURI"));
  v7 = (void *)objc_msgSend(a3, "delegate");
  if (objc_msgSend(a3, "requiresSecureCoding"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(a3, "userInfo");
      if (v14)
      {
        v15 = v14;
        v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "valueForKey:", CFSTR("NSConnectionContext")), "managedObjectContext"), "persistentStoreCoordinator");
        if (v14)
          goto LABEL_14;
        v14 = (void *)objc_msgSend(v15, "valueForKey:", CFSTR("PSCKey"));
      }
    }
    else
    {
      v14 = 0;
    }
    if (v14 || !v7)
    {
LABEL_13:
      if (v14)
        goto LABEL_14;
LABEL_19:
      NSLog((NSString *)CFSTR("NSMOIDArchivingToken escaping un-de-tokenized (secured %d)."), objc_msgSend(a3, "requiresSecureCoding"));
LABEL_25:
      v17 = -[NSXPCStoreManagedObjectArchivingToken init](v4, "init");
      v17->_managedObjectReferenceURI = (NSURL *)v6;
      goto LABEL_26;
    }
  }
  else if (!v7)
  {
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend((id)objc_msgSend(v7, "managedObjectContext"), "persistentStoreCoordinator");
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  v14 = (void *)objc_msgSend(v7, "_persistentStoreCoordinator");
  if (!v14)
    goto LABEL_19;
LABEL_14:
  if (!v6)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("XPC: Missing oid uri"), v8, v9, v10, v11, v12, v13, v25);
    goto LABEL_25;
  }
  v16 = (NSXPCStoreManagedObjectArchivingToken *)(id)objc_msgSend(v14, "managedObjectIDForURIRepresentation:", v6);
  if (v16)
  {
    v17 = v16;

    goto LABEL_26;
  }
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(1, (uint64_t)CFSTR("XPC: Possible API misuse: Unable to find object for managed object URI %@, returning null instead"), v18, v19, v20, v21, v22, v23, (uint64_t)v6);

  v17 = (NSXPCStoreManagedObjectArchivingToken *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (!v17)
  {
    v4 = 0;
    goto LABEL_25;
  }
LABEL_26:
  objc_autoreleasePoolPop(v5);
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = -[NSURL isEqual:](self->_managedObjectReferenceURI, "isEqual:", *((_QWORD *)a3 + 1));
  return v5;
}

@end
