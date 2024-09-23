@implementation _CHSControlConfigurationReference

- (_CHSControlConfigurationReference)initWithControlIdentity:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  _CHSControlConfigurationReference *v8;
  uint64_t v9;
  CHSControlIdentity *controlIdentity;
  uint64_t v11;
  NSString *uniqueIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CHSControlConfigurationReference;
  v8 = -[_CHSControlConfigurationReference init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    controlIdentity = v8->_controlIdentity;
    v8->_controlIdentity = (CHSControlIdentity *)v9;

    v11 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v11;

  }
  return v8;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_controlIdentity, 0);
}

@end
