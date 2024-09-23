@implementation IMSyncResumer

- (IMSyncResumer)initWithDelegate:(id)a3
{
  id v4;
  IMSyncResumer *v5;
  MCSSyncResumer *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMSyncResumer;
  v5 = -[IMSyncResumer init](&v15, sel_init);
  if (v5)
  {
    v6 = [MCSSyncResumer alloc];
    v10 = (void *)objc_msgSend_initWithDelegate_(v6, v7, (uint64_t)v4, v8, v9);
    objc_msgSend_setResumer_(v5, v11, (uint64_t)v10, v12, v13);

  }
  return v5;
}

- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_resumer(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncOnAccountUpdateIfAppropriate(v9, v5, v6, v7, v8);

}

- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_resumer(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncOnIdentityUpdateIfAppropriate(v9, v5, v6, v7, v8);

}

- (void)attemptToResumeSyncIfAppropriate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_resumer(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncIfAppropriate(v9, v5, v6, v7, v8);

}

- (MCSSyncResumer)resumer
{
  return self->_resumer;
}

- (void)setResumer:(id)a3
{
  objc_storeStrong((id *)&self->_resumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumer, 0);
}

@end
