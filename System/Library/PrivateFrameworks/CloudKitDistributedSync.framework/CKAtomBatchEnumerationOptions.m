@implementation CKAtomBatchEnumerationOptions

+ (id)optionsWithAtomType:(unint64_t)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAtomType_(v4, v7, (uint64_t)v6);

  return v4;
}

+ (id)optionsWithSiteIdentifierModifier:(id)a3
{
  id v3;
  void *v4;
  const char *v5;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend_setSiteIdentifierModifier_(v4, v5, (uint64_t)v3);

  return v4;
}

- (NSNumber)atomType
{
  return self->_atomType;
}

- (void)setAtomType:(id)a3
{
  self->_atomType = (NSNumber *)a3;
}

- (NSData)siteIdentifierModifier
{
  return self->_siteIdentifierModifier;
}

- (void)setSiteIdentifierModifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteIdentifierModifier, 0);
}

@end
