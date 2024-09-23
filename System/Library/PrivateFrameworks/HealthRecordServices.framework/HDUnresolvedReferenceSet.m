@implementation HDUnresolvedReferenceSet

- (HDUnresolvedReferenceSet)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDUnresolvedReferenceSet)initWithReferences:(id)a3 resource:(id)a4
{
  id v6;
  id v7;
  HDUnresolvedReferenceSet *v8;
  uint64_t v9;
  NSSet *references;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDUnresolvedReferenceSet;
  v8 = -[HDUnresolvedReferenceSet init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    references = v8->_references;
    v8->_references = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_resource, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HDUnresolvedReferenceSet references](self, "references");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("References"));

  -[HDUnresolvedReferenceSet resource](self, "resource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Resource"));

}

- (HDUnresolvedReferenceSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  HDUnresolvedReferenceSet *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("References"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Resource"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v12 = 0;
  }
  else
  {
    self = -[HDUnresolvedReferenceSet initWithReferences:resource:](self, "initWithReferences:resource:", v8, v9);
    v12 = self;
  }

  return v12;
}

- (NSSet)references
{
  return self->_references;
}

- (HDFHIRResourceObject)resource
{
  return self->_resource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_references, 0);
}

@end
