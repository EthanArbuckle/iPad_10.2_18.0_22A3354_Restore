@implementation FBKDeletedItem

- (FBKDeletedItem)initWithData:(id)a3
{
  id v4;
  FBKDeletedItem *v5;
  uint64_t v6;
  NSNumber *remoteID;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBKDeletedItem;
  v5 = -[FBKDeletedItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    remoteID = v5->_remoteID;
    v5->_remoteID = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = FBKContentItemTypeFromString(v8);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  FBKContentItemTypeToString(-[FBKDeletedItem type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeletedItem remoteID](self, "remoteID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DeletedItem type:%@ ID:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)remoteID
{
  return self->_remoteID;
}

- (void)setRemoteID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteID, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteID, 0);
}

@end
