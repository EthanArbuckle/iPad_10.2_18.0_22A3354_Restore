@implementation MFDAFolderChangeResult

- (MFDAFolderChangeResult)initWithStatusCode:(int64_t)a3 error:(id)a4 folderID:(id)a5 folderName:(id)a6
{
  id v11;
  id v12;
  id v13;
  MFDAFolderChangeResult *v14;
  MFDAFolderChangeResult *v15;
  uint64_t v16;
  NSString *folderID;
  uint64_t v18;
  NSString *folderName;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MFDAFolderChangeResult;
  v14 = -[MFDAFolderChangeResult init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_statusCode = a3;
    objc_storeStrong((id *)&v14->_error, a4);
    v16 = objc_msgSend(v12, "copy");
    folderID = v15->_folderID;
    v15->_folderID = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    folderName = v15->_folderName;
    v15->_folderName = (NSString *)v18;

  }
  return v15;
}

- (BOOL)wasSuccessful
{
  return self->_statusCode == 2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFDAFolderChangeResult;
  -[MFDAFolderChangeResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ status %ld, error %@, folderID \"%@\", folderName \"%@\"), v4, self->_statusCode, self->_error, self->_folderID, self->_folderName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)folderID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)folderName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
