@implementation CPLPullSessionUpdate

- (CPLPullSessionUpdate)initWithStore:(id)a3 expandedClientBatch:(id)a4 expandedCloudBatch:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLPullSessionUpdate *v11;
  CPLPullSessionUpdate *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CPLPullSessionUpdate;
  v11 = -[CPLChangeSessionUpdate initWithStore:](&v15, sel_initWithStore_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientBatch, a4);
    objc_storeStrong((id *)&v12->_cloudBatch, a5);
    objc_msgSend(v8, "pullQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notifyClientWillAcknowledgeBatch:", v12->_clientBatch);

  }
  return v12;
}

- (CPLPullSessionUpdate)initWithCoder:(id)a3
{
  id v4;
  CPLPullSessionUpdate *v5;
  uint64_t v6;
  CPLChangeBatch *clientBatch;
  uint64_t v8;
  CPLChangeBatch *cloudBatch;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionUpdate;
  v5 = -[CPLChangeSessionUpdate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cli"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientBatch = v5->_clientBatch;
    v5->_clientBatch = (CPLChangeBatch *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clo"));
    v8 = objc_claimAutoreleasedReturnValue();
    cloudBatch = v5->_cloudBatch;
    v5->_cloudBatch = (CPLChangeBatch *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionUpdate;
  v4 = a3;
  -[CPLChangeSessionUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientBatch, CFSTR("cli"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cloudBatch, CFSTR("clo"));

}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  CPLChangeBatch *clientBatch;
  void *v10;
  NSObject *v11;
  CPLChangeBatch *cloudBatch;
  int v13;
  BOOL v14;
  objc_super v16;
  uint8_t buf[4];
  CPLChangeBatch *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLPullSessionUpdate;
  if (-[CPLChangeSessionUpdate applyToStore:error:](&v16, sel_applyToStore_error_, v6, a4))
  {
    objc_msgSend(v6, "pullQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "popNextBatchWithError:", a4))
      goto LABEL_14;
    if (!_CPLSilentLogging)
    {
      __CPLPushSessionOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        clientBatch = self->_clientBatch;
        *(_DWORD *)buf = 138412290;
        v18 = clientBatch;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Applying to client cache %@", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "cloudCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_CPLSilentLogging)
    {
      __CPLPushSessionOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        cloudBatch = self->_cloudBatch;
        *(_DWORD *)buf = 138412290;
        v18 = cloudBatch;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Committing to cloud cache %@", buf, 0xCu);
      }

    }
    v13 = objc_msgSend(v10, "applyBatch:isFinal:direction:withError:", self->_cloudBatch, 1, 2, a4);

    if (v13)
    {
      objc_msgSend(v7, "notifyClientDidAcknowledgeBatch:", self->_clientBatch);
      v14 = 1;
    }
    else
    {
LABEL_14:
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionUpdate;
  return -[CPLChangeSessionUpdate discardFromStore:error:](&v5, sel_discardFromStore_error_, a3, a4);
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)objc_msgSend(a3, "pullQueue");
}

- (id)statusDescription
{
  return -[CPLChangeBatch summaryDescription](self->_clientBatch, "summaryDescription");
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  return -[CPLChangeBatch recordWithScopedIdentifier:](self->_clientBatch, "recordWithScopedIdentifier:", a3);
}

- (CPLChangeBatch)clientBatch
{
  return self->_clientBatch;
}

- (CPLChangeBatch)cloudBatch
{
  return self->_cloudBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudBatch, 0);
  objc_storeStrong((id *)&self->_clientBatch, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
