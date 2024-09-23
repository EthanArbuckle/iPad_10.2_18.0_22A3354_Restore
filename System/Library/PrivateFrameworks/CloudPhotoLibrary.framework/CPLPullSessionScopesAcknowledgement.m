@implementation CPLPullSessionScopesAcknowledgement

- (CPLPullSessionScopesAcknowledgement)initWithStore:(id)a3 scopesChangeBatch:(id)a4
{
  id v7;
  CPLPullSessionScopesAcknowledgement *v8;
  CPLPullSessionScopesAcknowledgement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  v8 = -[CPLChangeSessionUpdate initWithStore:](&v11, sel_initWithStore_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_scopesChangeBatch, a4);

  return v9;
}

- (CPLPullSessionScopesAcknowledgement)initWithCoder:(id)a3
{
  id v4;
  CPLPullSessionScopesAcknowledgement *v5;
  uint64_t v6;
  CPLChangeBatch *scopesChangeBatch;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  v5 = -[CPLChangeSessionUpdate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scb"));
    v6 = objc_claimAutoreleasedReturnValue();
    scopesChangeBatch = v5->_scopesChangeBatch;
    v5->_scopesChangeBatch = (CPLChangeBatch *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  v4 = a3;
  -[CPLChangeSessionUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scopesChangeBatch, CFSTR("scb"), v5.receiver, v5.super_class);

}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  CPLChangeBatch *scopesChangeBatch;
  void *v9;
  char v10;
  objc_super v12;
  uint8_t buf[4];
  CPLChangeBatch *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  if (-[CPLChangeSessionUpdate applyToStore:error:](&v12, sel_applyToStore_error_, v6, a4))
  {
    if (!_CPLSilentLogging)
    {
      __CPLPushSessionOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        scopesChangeBatch = self->_scopesChangeBatch;
        *(_DWORD *)buf = 138412290;
        v14 = scopesChangeBatch;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Client acknowledged scope changes %@", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "scopes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "clientAcknowledgedScopeChanges:error:", self->_scopesChangeBatch, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  return -[CPLChangeSessionUpdate discardFromStore:error:](&v5, sel_discardFromStore_error_, a3, a4);
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)objc_msgSend(a3, "scopes");
}

- (id)statusDescription
{
  return -[CPLChangeBatch summaryDescription](self->_scopesChangeBatch, "summaryDescription");
}

- (CPLChangeBatch)scopesChangeBatch
{
  return self->_scopesChangeBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopesChangeBatch, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
