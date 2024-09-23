@implementation _MXExtensionContainingAppProxy

- (_MXExtensionContainingAppProxy)initWithContainingAppIdentifer:(id)a3
{
  id v4;
  _MXExtensionContainingAppProxy *v5;
  uint64_t v6;
  NSString *containingAppIdentifer;
  uint64_t v8;
  NSMutableSet *extensionNonUIIdentifiers;
  uint64_t v10;
  NSMutableSet *extensionUIIdentifiers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionContainingAppProxy;
  v5 = -[_MXExtensionContainingAppProxy init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    containingAppIdentifer = v5->_containingAppIdentifer;
    v5->_containingAppIdentifer = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    extensionNonUIIdentifiers = v5->_extensionNonUIIdentifiers;
    v5->_extensionNonUIIdentifiers = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    extensionUIIdentifiers = v5->_extensionUIIdentifiers;
    v5->_extensionUIIdentifiers = (NSMutableSet *)v10;

  }
  return v5;
}

- (NSMutableSet)extensionUIIdentifiers
{
  return self->_extensionUIIdentifiers;
}

- (void)setExtensionUIIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_extensionUIIdentifiers, a3);
}

- (NSMutableSet)extensionNonUIIdentifiers
{
  return self->_extensionNonUIIdentifiers;
}

- (void)setExtensionNonUIIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_extensionNonUIIdentifiers, a3);
}

- (NSString)containingAppIdentifer
{
  return self->_containingAppIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAppIdentifer, 0);
  objc_storeStrong((id *)&self->_extensionNonUIIdentifiers, 0);
  objc_storeStrong((id *)&self->_extensionUIIdentifiers, 0);
}

@end
