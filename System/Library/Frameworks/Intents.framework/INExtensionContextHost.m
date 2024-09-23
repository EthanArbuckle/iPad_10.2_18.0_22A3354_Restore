@implementation INExtensionContextHost

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE061AE8);
}

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (NSBundle)extensionBundle
{
  return self->_extensionBundle;
}

- (void)setExtensionBundle:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundle, 0);
}

@end
