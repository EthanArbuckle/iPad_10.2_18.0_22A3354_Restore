@implementation FBKDraftModelSnapshotSection

- (FBKDraftModelSnapshotSection)initWithType:(int64_t)a3 object:(id)a4
{
  id v7;
  FBKDraftModelSnapshotSection *v8;
  FBKDraftModelSnapshotSection *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKDraftModelSnapshotSection;
  v8 = -[FBKDraftModelSnapshotSection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

- (id)description
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  v3 = -[FBKDraftModelSnapshotSection type](self, "type");
  if (v3 == 1)
  {
    -[FBKDraftModelSnapshotSection object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      v6 = CFSTR("Unknown object for DraftModelSnapshotSection");
      return v6;
    }
    -[FBKDraftModelSnapshotSection object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (__CFString *)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[FBKDraftModelSnapshotSection type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      v7 = -[FBKDraftModelSnapshotSection type](self, "type");
      if (v7 == 1)
      {
        -[FBKDraftModelSnapshotSection object](self, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "isEqualToString:", v12);
        goto LABEL_9;
      }
      if (!v7)
      {
        -[FBKDraftModelSnapshotSection object](self, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "intValue");
        objc_msgSend(v5, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10 == objc_msgSend(v12, "intValue");
LABEL_9:

        goto LABEL_10;
      }
    }
    v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
