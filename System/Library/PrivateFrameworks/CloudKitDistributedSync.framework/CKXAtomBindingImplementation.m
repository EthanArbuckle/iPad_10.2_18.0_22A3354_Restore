@implementation CKXAtomBindingImplementation

- (CKXAtomBindingImplementation)init
{
  CKXAtomBindingImplementation *v2;
  uint64_t v3;
  CKXSchema *schema;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKXAtomBindingImplementation;
  v2 = -[CKXAtomBindingImplementation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    schema = v2->_schema;
    v2->_schema = (CKXSchema *)v3;

  }
  return v2;
}

- (unint64_t)topLevelStructToken
{
  return self->tokens.topLevelContainer;
}

- (unint64_t)structTokenForClass:(Class)a3
{
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;

  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.siteIdentifier;
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.timestamp;
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.location;
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.reference;
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.atom;
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    return self->tokens.topLevelContainer;
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v10, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 90, CFSTR("Unexpected class %@"), v9);

  return -1;
}

- (Class)proxyClassForStructToken:(unint64_t)a3
{
  void *v5;
  void *v8;
  const char *v9;

  if (self->tokens.siteIdentifier == a3
    || self->tokens.timestamp == a3
    || self->tokens.location == a3
    || self->tokens.reference == a3
    || self->tokens.atom == a3
    || self->tokens.topLevelContainer == a3)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 108, CFSTR("Unexpected struct token %ld"), a3);

    v5 = 0;
  }
  return (Class)v5;
}

- (Class)mutableProxyClassForStructToken:(unint64_t)a3
{
  void *v5;
  void *v8;
  const char *v9;

  if (self->tokens.siteIdentifier == a3
    || self->tokens.timestamp == a3
    || self->tokens.location == a3
    || self->tokens.reference == a3
    || self->tokens.atom == a3
    || self->tokens.topLevelContainer == a3)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 126, CFSTR("Unexpected struct token %ld"), a3);

    v5 = 0;
  }
  return (Class)v5;
}

- (id)orcHelpers
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 131, CFSTR("Should be implemented by subclass"));

  return 0;
}

- (CKXSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
