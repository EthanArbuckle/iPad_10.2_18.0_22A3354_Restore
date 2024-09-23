@implementation MMCSSimpleFile

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("[%@: guid: %@  item id: %qx  path: %@  fd: %d token: %@   requestor ID: %@  request url: %@ signature: %@  progress: %f file size: %llu]"), v7, v8, v5, self->_guid, self->_itemID, self->_localPath, self->_fd, self->_authToken, self->_requestorID, self->_requestURL, self->_signature, *(_QWORD *)&self->_progress, self->_protocolFileSize);
}

- (MMCSSimpleFile)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  MMCSSimpleFile *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MMCSSimpleFile;
  v6 = -[MMCSSimpleFile init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v2, v3, v4, v5);
    objc_msgSend_setGuid_(v6, v8, v7, v9, v10);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  objc_msgSend_setLocalPath_(self, a2, 0, v2, v3);
  objc_msgSend_setRequestorID_(self, v5, 0, v6, v7);
  objc_msgSend_setRequestURL_(self, v8, 0, v9, v10);
  objc_msgSend_setFileHash_(self, v11, 0, v12, v13);
  objc_msgSend_setSignature_(self, v14, 0, v15, v16);
  objc_msgSend_setAuthToken_(self, v17, 0, v18, v19);
  objc_msgSend_setMMCSError_(self, v20, 0, v21, v22);

  v23.receiver = self;
  v23.super_class = (Class)MMCSSimpleFile;
  -[MMCSSimpleFile dealloc](&v23, sel_dealloc);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)encryptionBehavior
{
  return self->_encryptionBehavior;
}

- (void)setEncryptionBehavior:(int64_t)a3
{
  self->_encryptionBehavior = a3;
}

- (NSString)localPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURL)requestURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)requestorID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestorID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)fileHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unint64_t)protocolFileSize
{
  return self->_protocolFileSize;
}

- (void)setProtocolFileSize:(unint64_t)a3
{
  self->_protocolFileSize = a3;
}

- (NSError)mmcsError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMMCSError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)authResponseData
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAuthResponseData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

@end
