@implementation CPLSharedRemapFixUpTask

- (CPLSharedRemapFixUpTask)initWithSharedCloudScopedIdentifier:(id)a3 realCloudScopedIdentifier:(id)a4 privateCloudScopedIdentifier:(id)a5 proposedPrivateScopedIdentifier:(id)a6 recordClass:(Class)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CPLSharedRemapFixUpTask *v17;
  CPLSharedRemapFixUpTask *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CPLSharedRemapFixUpTask;
  v17 = -[CPLSharedRemapFixUpTask init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sharedCloudScopedIdentifier, a3);
    objc_storeStrong((id *)&v18->_realCloudScopedIdentifier, a4);
    objc_storeStrong((id *)&v18->_privateCloudScopedIdentifier, a5);
    objc_storeStrong((id *)&v18->_proposedPrivateScopedIdentifier, a6);
    objc_storeStrong((id *)&v18->_recordClass, a7);
  }

  return v18;
}

- (id)description
{
  id v3;
  CPLScopedIdentifier *privateCloudScopedIdentifier;
  CPLScopedIdentifier *realCloudScopedIdentifier;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  realCloudScopedIdentifier = self->_realCloudScopedIdentifier;
  privateCloudScopedIdentifier = self->_privateCloudScopedIdentifier;
  -[CPLScopedIdentifier identifier](self->_sharedCloudScopedIdentifier, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@.sharingRecordScopedIdentifier = %@ instead of %@]"), privateCloudScopedIdentifier, realCloudScopedIdentifier, v6);

  return v7;
}

- (CPLScopedIdentifier)sharedCloudScopedIdentifier
{
  return self->_sharedCloudScopedIdentifier;
}

- (CPLScopedIdentifier)realCloudScopedIdentifier
{
  return self->_realCloudScopedIdentifier;
}

- (CPLScopedIdentifier)privateCloudScopedIdentifier
{
  return self->_privateCloudScopedIdentifier;
}

- (CPLScopedIdentifier)proposedPrivateScopedIdentifier
{
  return self->_proposedPrivateScopedIdentifier;
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_proposedPrivateScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_privateCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_realCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedCloudScopedIdentifier, 0);
}

@end
