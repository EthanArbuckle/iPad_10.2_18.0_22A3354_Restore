@implementation CKGroupUpdate

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CKGroupUpdate groupUpdateType](self, "groupUpdateType");
  -[CKGroupUpdate handleID](self, "handleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKGroupUpdate type:%lu handleID:%@ ]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKGroupUpdate)initWithType:(int64_t)a3 handleID:(id)a4
{
  id v6;
  CKGroupUpdate *v7;
  CKGroupUpdate *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKGroupUpdate;
  v7 = -[CKGroupUpdate init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKGroupUpdate setGroupUpdateType:](v7, "setGroupUpdateType:", a3);
    -[CKGroupUpdate setHandleID:](v8, "setHandleID:", v6);
  }

  return v8;
}

- (int64_t)groupUpdateType
{
  return self->_groupUpdateType;
}

- (void)setGroupUpdateType:(int64_t)a3
{
  self->_groupUpdateType = a3;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void)setHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_handleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end
