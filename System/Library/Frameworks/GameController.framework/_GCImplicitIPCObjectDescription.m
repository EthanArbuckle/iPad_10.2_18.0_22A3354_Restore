@implementation _GCImplicitIPCObjectDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCImplicitIPCObjectDescription)initWithIdentifier:(id)a3
{
  id v4;
  _GCImplicitIPCObjectDescription *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCImplicitIPCObjectDescription;
  v5 = -[_GCImplicitIPCObjectDescription init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (_GCImplicitIPCObjectDescription)init
{
  -[_GCImplicitIPCObjectDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCImplicitIPCObjectDescription)initWithCoder:(id)a3
{
  id v4;
  _GCImplicitIPCObjectDescription *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCImplicitIPCObjectDescription;
  v5 = -[_GCImplicitIPCObjectDescription init](&v10, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (id)materializeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254DC0AB0))
  {
    objc_msgSend(v4, "IPCObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "IPCObjectWithIdentifier:", self->_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
