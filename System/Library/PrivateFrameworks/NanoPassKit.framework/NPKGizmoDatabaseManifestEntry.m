@implementation NPKGizmoDatabaseManifestEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKGizmoDatabaseManifestEntry;
  -[NPKGizmoDatabaseManifestEntry description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabaseManifestEntry uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabaseManifestEntry localManifestHashes](self, "localManifestHashes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabaseManifestEntry remoteManifestHashes](self, "remoteManifestHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(uniqueID %@ localHashes %@ remoteHashes %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSArray)localManifestHashes
{
  return self->_localManifestHashes;
}

- (void)setLocalManifestHashes:(id)a3
{
  objc_storeStrong((id *)&self->_localManifestHashes, a3);
}

- (NSArray)remoteManifestHashes
{
  return self->_remoteManifestHashes;
}

- (void)setRemoteManifestHashes:(id)a3
{
  objc_storeStrong((id *)&self->_remoteManifestHashes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteManifestHashes, 0);
  objc_storeStrong((id *)&self->_localManifestHashes, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
