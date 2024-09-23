@implementation CRKASMCredentialManifest

- (CRKASMCredentialManifest)initWithAnnotatedManifest:(id)a3
{
  id v5;
  CRKASMCredentialManifest *v6;
  CRKASMCredentialManifest *v7;
  uint64_t v8;
  NSMutableDictionary *entriesByPersistentID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKASMCredentialManifest;
  v6 = -[CRKASMCredentialManifest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_annotatedManifest, a3);
    v8 = objc_opt_new();
    entriesByPersistentID = v7->_entriesByPersistentID;
    v7->_entriesByPersistentID = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (NSSet)persistentIDs
{
  void *v2;
  void *v3;

  -[CRKASMCredentialManifest annotatedManifest](self, "annotatedManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)entryForPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    -[CRKASMCredentialManifest entriesByPersistentID](self, "entriesByPersistentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CRKASMCredentialManifest makeEntryForPersistentID:](self, "makeEntryForPersistentID:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[CRKASMCredentialManifest entriesByPersistentID](self, "entriesByPersistentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)makeEntryForPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRKASMCredentialManifestEntry *v7;

  v4 = a3;
  -[CRKASMCredentialManifest annotatedManifest](self, "annotatedManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotationForPersistentID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[CRKASMCredentialManifestEntry initWithDictionary:]([CRKASMCredentialManifestEntry alloc], "initWithDictionary:", v6);
  else
    v7 = 0;

  return v7;
}

- (CRKAnnotatedCredentialManifest)annotatedManifest
{
  return self->_annotatedManifest;
}

- (NSMutableDictionary)entriesByPersistentID
{
  return self->_entriesByPersistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByPersistentID, 0);
  objc_storeStrong((id *)&self->_annotatedManifest, 0);
}

@end
