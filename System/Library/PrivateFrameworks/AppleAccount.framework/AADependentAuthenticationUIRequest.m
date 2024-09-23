@implementation AADependentAuthenticationUIRequest

- (id)urlString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", self->_altDSID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changePasswordURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AADependentAuthenticationUIRequest)initWithAltDSID:(id)a3
{
  id v6;
  AADependentAuthenticationUIRequest *v7;
  AADependentAuthenticationUIRequest *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARequest.m"), 1074, CFSTR("No altDSID passed"));

  }
  v11.receiver = self;
  v11.super_class = (Class)AADependentAuthenticationUIRequest;
  v7 = -[AADependentAuthenticationUIRequest init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_altDSID, a3);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
