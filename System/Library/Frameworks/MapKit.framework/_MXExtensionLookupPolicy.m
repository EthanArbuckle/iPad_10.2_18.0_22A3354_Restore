@implementation _MXExtensionLookupPolicy

- (_MXExtensionLookupPolicy)initWithPredicate:(id)a3
{
  id v5;
  _MXExtensionLookupPolicy *v6;
  _MXExtensionLookupPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXExtensionLookupPolicy;
  v6 = -[_MXExtensionLookupPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_extensionPredicate, a3);

  return v7;
}

- (NSPredicate)extensionPredicate
{
  return self->_extensionPredicate;
}

- (void)setExtensionPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_extensionPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPredicate, 0);
}

@end
