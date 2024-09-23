@implementation MPServerObjectDatabaseImportResult

- (MPServerObjectDatabaseImportResult)initWithAnnotatedPayload:(id *)a3 playableAssetIdentifiers:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  MPServerObjectDatabaseImportResult *v10;
  MPServerObjectDatabaseImportResult *v11;
  uint64_t v12;
  id annotatedPayload;
  uint64_t v14;
  NSArray *playableAssetIdentifiers;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPServerObjectDatabaseImportResult;
  v10 = -[MPServerObjectDatabaseImportResult init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      v12 = objc_msgSend(*a3, "copy");
      annotatedPayload = v11->_annotatedPayload;
      v11->_annotatedPayload = (id)v12;
    }
    else
    {
      annotatedPayload = v10->_annotatedPayload;
      v10->_annotatedPayload = 0;
    }

    v14 = objc_msgSend(v8, "copy");
    playableAssetIdentifiers = v11->_playableAssetIdentifiers;
    v11->_playableAssetIdentifiers = (NSArray *)v14;

    v16 = objc_msgSend(v9, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v16;

  }
  return v11;
}

- (id)annotatedPayload
{
  return self->_annotatedPayload;
}

- (NSError)error
{
  return self->_error;
}

- (MPServerObjectDatabasePlaybackAuthorizationTokenTrustProvider)trustProvider
{
  return self->_trustProvider;
}

- (NSArray)playableAssetIdentifiers
{
  return self->_playableAssetIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_trustProvider, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_annotatedPayload, 0);
}

@end
