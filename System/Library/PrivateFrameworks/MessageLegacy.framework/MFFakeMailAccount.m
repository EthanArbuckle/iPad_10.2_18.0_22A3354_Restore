@implementation MFFakeMailAccount

- (MFFakeMailAccount)init
{
  void *v3;
  MFFakeMailAccount *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("account://test"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFFakeMailAccount initWithURL:](self, "initWithURL:", v3);

  return v4;
}

- (MFFakeMailAccount)initWithURL:(id)a3
{
  return -[MFFakeMailAccount initWithURL:rootMailboxUid:](self, "initWithURL:rootMailboxUid:", a3, 0);
}

- (MFFakeMailAccount)initWithURL:(id)a3 rootMailboxUid:(id)a4
{
  id v7;
  id v8;
  MFFakeMailAccount *v9;
  NSRecursiveLock *v10;
  NSRecursiveLock *flagChangesLock;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFFakeMailAccount;
  v9 = -[MFAccount init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    flagChangesLock = v9->_flagChangesLock;
    v9->_flagChangesLock = v10;

    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v9->super._rootMailboxUid, a4);
  }

  return v9;
}

- (BOOL)isActive
{
  return 1;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

- (id)URLString
{
  return -[NSURL absoluteString](self->_URL, "absoluteString");
}

- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5
{
  return 0;
}

- (id)_URLScheme
{
  return -[NSURL scheme](self->_URL, "scheme");
}

- (id)hostname
{
  return -[NSURL host](self->_URL, "host");
}

- (id)username
{
  return -[NSURL user](self->_URL, "user");
}

- (id)displayName
{
  return CFSTR("fakedisplayname");
}

- (id)_mailboxPathPrefix
{
  return CFSTR("test");
}

- (id)debugDescription
{
  return CFSTR("MFFakeMailAccount");
}

- (id)description
{
  return CFSTR("MFFakeMailAccount");
}

- (id)_nameForMailboxUid:(id)a3
{
  return CFSTR("INBOX");
}

- (id)uniqueId
{
  return CFSTR("test-unique-id");
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MFFakeMailAccount displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[MFFakeMailAccount displayName](self, "displayName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E81CBE50;
  }

  -[MFFakeMailAccount uniqueId](self, "uniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%@-(%@)"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)minID
{
  return 1;
}

- (int)cachePolicy
{
  return 0;
}

- (void)setCachedConnection:(id)a3
{
  MFIMAPConnection *v5;
  MFIMAPConnection *v6;

  v5 = (MFIMAPConnection *)a3;
  if (self->_cachedConnection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedConnection, a3);
    v5 = v6;
  }

}

- (id)connectionForStore:(id)a3 delegate:(id)a4 options:(int)a5
{
  return self->_cachedConnection;
}

- (id)flagChangesForMailboxPath:(id)a3 UID:(unsigned int)a4 connectTime:(double)a5
{
  return 0;
}

- (id)flagChangesLock
{
  return self->_flagChangesLock;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  LOBYTE(v4) = a4;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
    goto LABEL_11;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB31B0]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("MFMessageErrorDomain")))
    {
      v8 = objc_msgSend(v5, "code");
      if ((unint64_t)(v8 - 1032) <= 0x1B)
        v4 = (0x7FFFF7Eu >> (v8 - 8)) & 1;
      else
        LOBYTE(v4) = 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v4) = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "code") != 60)
    LOBYTE(v4) = 1;
LABEL_12:

  return v4;
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (DeliveryAccount)deliveryAccount
{
  return self->_deliveryAccount;
}

- (void)setDeliveryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryAccount, a3);
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_flagChangesLock, 0);
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
