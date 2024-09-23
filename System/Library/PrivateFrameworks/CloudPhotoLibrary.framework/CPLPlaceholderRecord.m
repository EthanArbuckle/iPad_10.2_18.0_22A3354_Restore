@implementation CPLPlaceholderRecord

- (id)translateToCloudRecordUsingIDMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  char v16;

  v4 = a3;
  v16 = 0;
  -[CPLPlaceholderRecord scopedIdentifier](self, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLPlaceholderRecord relatedScopedIdentifier](self, "relatedScopedIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  if (!v8)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v4, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v8, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(v8, "copy");
LABEL_7:
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = -[CPLPlaceholderRecord recordClass](self, "recordClass");
  v12 = -[CPLPlaceholderRecord relatedRecordClass](self, "relatedRecordClass");
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:", v11, v6, v12, v13);

  return v14;
}

- (id)translateToClientRecordUsingIDMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  char v16;

  v4 = a3;
  v16 = 0;
  -[CPLPlaceholderRecord scopedIdentifier](self, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLPlaceholderRecord relatedScopedIdentifier](self, "relatedScopedIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  if (!v8)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v4, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(v8, "copy");
LABEL_7:
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = -[CPLPlaceholderRecord recordClass](self, "recordClass");
  v12 = -[CPLPlaceholderRecord relatedRecordClass](self, "relatedRecordClass");
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:", v11, v6, v12, v13);

  return v14;
}

- (CPLPlaceholderRecord)initWithRecordClass:(Class)a3 scopedIdentifier:(id)a4 relatedRecordClass:(Class)a5 relatedIdentifier:(id)a6
{
  id v11;
  id v12;
  CPLPlaceholderRecord *v13;
  CPLPlaceholderRecord *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CPLPlaceholderRecord;
  v13 = -[CPLPlaceholderRecord init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recordClass, a3);
    objc_storeStrong((id *)&v14->_scopedIdentifier, a4);
    if (v12)
    {
      objc_storeStrong((id *)&v14->_relatedIdentifier, a6);
      objc_storeStrong((id *)&v14->_relatedRecordClass, a5);
    }
  }

  return v14;
}

- (CPLPlaceholderRecord)initWithRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CPLPlaceholderRecord *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CPLPlaceholderRecord *v14;

  v4 = a3;
  objc_msgSend(v4, "relatedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = objc_msgSend(v4, "relatedRecordClass");

    v9 = self;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v5;
  }
  else
  {

    v9 = self;
    v10 = v6;
    v11 = v7;
    v12 = 0;
    v13 = 0;
  }
  v14 = -[CPLPlaceholderRecord initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:](v9, "initWithRecordClass:scopedIdentifier:relatedRecordClass:relatedIdentifier:", v10, v11, v12, v13);

  return v14;
}

- (CPLScopedIdentifier)relatedScopedIdentifier
{
  NSString *relatedIdentifier;
  NSString *v4;
  CPLScopedIdentifier *v5;
  void *v6;
  id v7;

  relatedIdentifier = self->_relatedIdentifier;
  if (relatedIdentifier)
  {
    v4 = relatedIdentifier;
    v5 = [CPLScopedIdentifier alloc];
    -[CPLPlaceholderRecord scopedIdentifier](self, "scopedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v5, "initRelativeToScopedIdentifier:identifier:", v6, v4);

  }
  else
  {
    v7 = 0;
  }
  return (CPLScopedIdentifier *)v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[(%@ %@)]"), self->_recordClass, self->_scopedIdentifier);
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (Class)relatedRecordClass
{
  return self->_relatedRecordClass;
}

- (NSString)relatedIdentifier
{
  return self->_relatedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedRecordClass, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_recordClass, 0);
}

@end
