@implementation MPCModelStorePlaybackItemsRequestAccumulatorImportResponse

- (id)initWitDatabaseImportResult:(id)a3 accumulatorImportResult:(MPCModelStorePlaybackItemsRequestAccumulatorResult)a4
{
  int v4;
  id v6;
  MPCModelStorePlaybackItemsRequestAccumulatorImportResponse *v7;
  uint64_t v8;
  MPServerObjectDatabaseImportResult *serverObjectDatabaseImportResult;
  objc_super v11;

  v4 = *(_DWORD *)&a4.didFinishEntireRequest;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCModelStorePlaybackItemsRequestAccumulatorImportResponse;
  v7 = -[MPCModelStorePlaybackItemsRequestAccumulatorImportResponse init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    serverObjectDatabaseImportResult = v7->_serverObjectDatabaseImportResult;
    v7->_serverObjectDatabaseImportResult = (MPServerObjectDatabaseImportResult *)v8;

    v7->_accumulatorImportResult.hasPrioritizedItemsToLoad = BYTE2(v4);
    *(_WORD *)&v7->_accumulatorImportResult.didFinishEntireRequest = v4;
  }

  return v7;
}

- (MPServerObjectDatabaseImportResult)serverObjectDatabaseImportResult
{
  return self->_serverObjectDatabaseImportResult;
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorImportResult
{
  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)(*(unsigned __int16 *)&self->_accumulatorImportResult.didFinishEntireRequest | (self->_accumulatorImportResult.hasPrioritizedItemsToLoad << 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverObjectDatabaseImportResult, 0);
}

@end
