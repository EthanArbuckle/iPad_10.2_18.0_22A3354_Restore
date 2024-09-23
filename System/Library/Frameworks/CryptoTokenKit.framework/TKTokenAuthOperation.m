@implementation TKTokenAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenAuthOperation)initWithCoder:(id)a3
{
  id v4;
  TKTokenAuthOperation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSError *authenticationError;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenAuthOperation;
  v5 = -[TKTokenAuthOperation init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_authenticationError);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    authenticationError = v5->_authenticationError;
    v5->_authenticationError = (NSError *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *authenticationError;
  id v4;
  id v5;

  authenticationError = self->_authenticationError;
  v4 = a3;
  NSStringFromSelector(sel_authenticationError);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", authenticationError, v5);

}

- (BOOL)finishWithError:(NSError *)error
{
  return 1;
}

- (Class)baseClassForUI
{
  return 0;
}

- (void)importOperation:(id)a3
{
  NSError *v5;
  NSError *authenticationError;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenSession.m"), 95, CFSTR("Attempt to import incompatible %@ into %@"), v9, v11);

    }
  }
  objc_msgSend(v12, "authenticationError");
  v5 = (NSError *)objc_claimAutoreleasedReturnValue();
  authenticationError = self->_authenticationError;
  self->_authenticationError = v5;

}

- (NSError)authenticationError
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthenticationError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationError, 0);
}

@end
