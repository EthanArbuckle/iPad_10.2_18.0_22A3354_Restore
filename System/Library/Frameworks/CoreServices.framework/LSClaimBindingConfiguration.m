@implementation LSClaimBindingConfiguration

- (LSClaimBindingConfiguration)initWithTypeIdentifier:(id)a3
{
  LSClaimBindingConfiguration *v4;
  uint64_t v5;
  NSString *typeIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LSClaimBindingConfiguration;
  v4 = -[LSClaimBindingConfiguration init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "copy");
    typeIdentifier = v4->_typeIdentifier;
    v4->_typeIdentifier = (NSString *)v5;

    v4->_bundleClassMask = 4;
  }
  return v4;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)bundleClassMask
{
  return self->_bundleClassMask;
}

- (void)setBundleClassMask:(unint64_t)a3
{
  self->_bundleClassMask = a3;
}

- (BOOL)addClaimRecordIfMissing
{
  return self->_addClaimRecordIfMissing;
}

- (void)setAddClaimRecordIfMissing:(BOOL)a3
{
  self->_addClaimRecordIfMissing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

@end
