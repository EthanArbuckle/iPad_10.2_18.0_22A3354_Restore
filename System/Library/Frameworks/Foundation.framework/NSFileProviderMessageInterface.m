@implementation NSFileProviderMessageInterface

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMessageInterface;
  -[NSFileProviderMessageInterface dealloc](&v3, sel_dealloc);
}

- (NSFileProviderMessageInterface)initWithName:(id)a3 itemIdentifier:(id)a4 providerIdentifier:(id)a5
{
  NSFileProviderMessageInterface *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderMessageInterface;
  v8 = -[NSFileProviderMessageInterface init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    v8->_itemIdentifier = (NSString *)objc_msgSend(a4, "copy");
    v8->_providerIdentifier = (NSString *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("NSInterfaceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("NSItemIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_providerIdentifier, CFSTR("NSProviderIdentifier"));
}

- (NSFileProviderMessageInterface)initWithCoder:(id)a3
{
  self->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSInterfaceName"));
  self->_itemIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSItemIdentifier"));
  self->_providerIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSProviderIdentifier"));
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)providerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProviderIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
