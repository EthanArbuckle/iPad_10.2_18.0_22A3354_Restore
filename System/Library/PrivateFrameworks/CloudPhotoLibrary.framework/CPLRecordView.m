@implementation CPLRecordView

- (id)relatedScopedIdentifier
{
  void *v2;
  void *v3;

  -[CPLRecordView changeForType:](self, "changeForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relatedScopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)secondaryScopedIdentifier
{
  void *v2;
  void *v3;

  -[CPLRecordView changeForType:](self, "changeForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryScopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)recordClass
{
  void *v2;
  void *v3;

  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)relation
{
  void *v2;
  void *v3;

  -[CPLRecordView changeForType:](self, "changeForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsResources
{
  return -[objc_class supportsResources](-[CPLRecordView recordClass](self, "recordClass"), "supportsResources");
}

- (CPLScopedIdentifier)scopedIdentifier
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 16, CFSTR("%@ should be implemented by subclasses"), v6);

  abort();
}

- (CPLRecordChange)synthesizedRecord
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 21, CFSTR("%@ should be implemented by subclasses"), v6);

  abort();
}

- (CPLPlaceholderRecord)placeholderRecord
{
  CPLPlaceholderRecord *v3;
  void *v4;
  CPLPlaceholderRecord *v5;

  v3 = [CPLPlaceholderRecord alloc];
  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPLPlaceholderRecord initWithRecord:](v3, "initWithRecord:", v4);

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  return v5;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v5);

  return v6;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a7;
  v13 = a3;
  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:", v13, a4, a5, a6, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v10 = a6;
  v11 = a3;
  v12 = objc_msgSend(v11, "changeType");
  if (v12)
    v13 = v12 | 0x100;
  else
    v13 = 378;
  -[CPLRecordView realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:](self, "realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:", v11, a4, a5, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5
{
  return -[CPLRecordView realRecordChangeFromRecordChange:direction:newRecord:diffTracker:](self, "realRecordChangeFromRecordChange:direction:newRecord:diffTracker:", a3, a4, a5, 0);
}

- (NSData)recordChangeData
{
  void *v2;
  void *v3;

  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordChangeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sharingRecordChangeData
{
  void *v2;
  void *v3;

  -[CPLRecordView synthesizedRecord](self, "synthesizedRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingRecordChangeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

@end
