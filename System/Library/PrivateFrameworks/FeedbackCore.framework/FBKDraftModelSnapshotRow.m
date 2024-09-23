@implementation FBKDraftModelSnapshotRow

- (FBKDraftModelSnapshotRow)initWithSection:(id)a3 object:(id)a4
{
  id v7;
  id v8;
  FBKDraftModelSnapshotRow *v9;
  FBKDraftModelSnapshotRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKDraftModelSnapshotRow;
  v9 = -[FBKDraftModelSnapshotRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_section, a3);
    objc_storeStrong((id *)&v10->_object, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  -[FBKDraftModelSnapshotRow section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
  {
    -[FBKDraftModelSnapshotRow object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v7 = CFSTR("Unknown object for DraftModelSnapshotRow");
      return v7;
    }
    -[FBKDraftModelSnapshotRow object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "role");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (__CFString *)v6;

  return v7;
}

- (FBKDraftModelSnapshotSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
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
  objc_storeStrong((id *)&self->_section, 0);
}

@end
