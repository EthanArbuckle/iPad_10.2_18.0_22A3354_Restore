@implementation MSASAssetCollectionChange

- (id)description
{
  void *v3;
  void *v4;
  NSString *GUID;
  NSString *ctag;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MSASAssetCollectionChange;
  -[MSASAssetCollectionChange description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GUID = self->_GUID;
  ctag = self->_ctag;
  objc_msgSend(MEMORY[0x1E0CB3940], "MSStringWithBool:", self->_wasDeleted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: GUID : %@, ctag: %@, was deleted: %@"), v4, GUID, ctag, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
