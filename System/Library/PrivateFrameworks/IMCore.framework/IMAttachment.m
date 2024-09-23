@implementation IMAttachment

- (IMAttachment)initWithPath:(id)a3 guid:(id)a4
{
  return -[IMAttachment initWithPath:guid:createdDate:isSticker:isTransferComplete:](self, "initWithPath:guid:createdDate:isSticker:isTransferComplete:", a3, a4, 0, 0, 1);
}

- (IMAttachment)initWithPath:(id)a3 guid:(id)a4 createdDate:(id)a5 isSticker:(BOOL)a6 isTransferComplete:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  IMAttachment *v15;
  uint64_t v16;
  NSString *path;
  uint64_t v18;
  NSString *guid;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IMAttachment;
  v15 = -[IMAttachment init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    path = v15->_path;
    v15->_path = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    guid = v15->_guid;
    v15->_guid = (NSString *)v18;

    v15->_isSticker = a6;
    objc_storeStrong((id *)&v15->_createdDate, a5);
    v15->_isTransferComplete = a7;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *guid;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)IMAttachment;
  -[IMAttachment description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  guid = self->_guid;
  -[IMAttachment path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAttachment fileTransfer](self, "fileTransfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - guid: %@ path: %@ fileTransfer: %@, createdDate = %@, isSticker = %d"), v4, guid, v6, v7, self->_createdDate, self->_isSticker);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)path
{
  NSString *path;
  NSString *v3;
  void *v4;

  path = self->_path;
  if (path)
  {
    v3 = path;
  }
  else
  {
    -[IMAttachment fileTransfer](self, "fileTransfer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localPath");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)isTransferComplete
{
  return self->_isTransferComplete;
}

- (id)fileTransfer
{
  void *v3;
  void *v4;

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", self->_guid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (void)setIsTransferComplete:(BOOL)a3
{
  self->_isTransferComplete = a3;
}

- (void)setCreatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_createdDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
