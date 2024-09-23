@implementation MPMediaBooklet

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPMediaBooklet name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p ['%@', storeID=%lld]>"), v4, self, v5, -[MPMediaBooklet storeItemID](self, "storeItemID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)itemPersistentID
{
  return self->itemPersistentID;
}

- (void)setItemPersistentID:(unint64_t)a3
{
  self->itemPersistentID = a3;
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)storeItemID
{
  return self->storeItemID;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->storeItemID = a3;
}

- (NSString)redownloadParams
{
  return self->redownloadParams;
}

- (void)setRedownloadParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)fileSize
{
  return self->fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->redownloadParams, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
