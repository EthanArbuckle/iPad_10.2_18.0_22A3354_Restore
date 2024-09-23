@implementation BLHLSGroup

- (BLHLSGroup)initWithGroupID:(id)a3 media:(id)a4
{
  id v6;
  id v7;
  BLHLSGroup *v8;
  uint64_t v9;
  NSString *groupID;
  uint64_t v11;
  NSArray *media;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLHLSGroup;
  v8 = -[BLHLSGroup init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    groupID = v8->_groupID;
    v8->_groupID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    media = v8->_media;
    v8->_media = (NSArray *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BLHLSGroup groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSGroup media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("GroupID: %@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSArray)media
{
  return self->_media;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end
