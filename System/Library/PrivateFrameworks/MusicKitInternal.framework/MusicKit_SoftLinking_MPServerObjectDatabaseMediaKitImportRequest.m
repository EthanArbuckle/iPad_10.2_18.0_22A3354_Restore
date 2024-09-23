@implementation MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest

- (MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  MPServerObjectDatabaseMediaKitImportRequest *underlyingImportRequest;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest;
  v5 = -[MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getMPServerObjectDatabaseMediaKitImportRequestClass_softClass;
    v16 = getMPServerObjectDatabaseMediaKitImportRequestClass_softClass;
    if (!getMPServerObjectDatabaseMediaKitImportRequestClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke;
      v12[3] = &unk_1E9C05688;
      v12[4] = &v13;
      __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = objc_msgSend([v7 alloc], "initWithPayload:", v4);
    underlyingImportRequest = v5->_underlyingImportRequest;
    v5->_underlyingImportRequest = (MPServerObjectDatabaseMediaKitImportRequest *)v8;

  }
  return v5;
}

- (id)payload
{
  return (id)-[MPServerObjectDatabaseMediaKitImportRequest payload](self->_underlyingImportRequest, "payload");
}

- (ICUserIdentity)userIdentity
{
  return (ICUserIdentity *)-[MPServerObjectDatabaseMediaKitImportRequest userIdentity](self->_underlyingImportRequest, "userIdentity");
}

- (void)setUserIdentity:(id)a3
{
  -[MPServerObjectDatabaseMediaKitImportRequest setUserIdentity:](self->_underlyingImportRequest, "setUserIdentity:", a3);
}

- (NSDate)expirationDate
{
  return (NSDate *)-[MPServerObjectDatabaseMediaKitImportRequest expirationDate](self->_underlyingImportRequest, "expirationDate");
}

- (void)setExpirationDate:(id)a3
{
  -[MPServerObjectDatabaseMediaKitImportRequest setExpirationDate:](self->_underlyingImportRequest, "setExpirationDate:", a3);
}

- (MPServerObjectDatabaseMediaKitImportRequest)_underlyingImportRequest
{
  return self->_underlyingImportRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingImportRequest, 0);
}

@end
