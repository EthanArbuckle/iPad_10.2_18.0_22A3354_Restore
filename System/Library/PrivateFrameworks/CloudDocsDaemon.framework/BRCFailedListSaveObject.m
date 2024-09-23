@implementation BRCFailedListSaveObject

- (BRCFailedListSaveObject)initWithPendingChangesStream:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  BRCFailedListSaveObject *v12;
  BRCFailedListSaveObject *v13;
  uint64_t v14;
  id serverTruthCallback;
  uint64_t v16;
  id clientTruthCallback;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCFailedListSaveObject;
  v12 = -[BRCFailedListSaveObject init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pendingChangesStream, a3);
    v14 = MEMORY[0x1D17A6DB0](v10);
    serverTruthCallback = v13->_serverTruthCallback;
    v13->_serverTruthCallback = (id)v14;

    v16 = MEMORY[0x1D17A6DB0](v11);
    clientTruthCallback = v13->_clientTruthCallback;
    v13->_clientTruthCallback = (id)v16;

  }
  return v13;
}

- (BRCPendingChangesStream)pendingChangesStream
{
  return self->_pendingChangesStream;
}

- (id)serverTruthCallback
{
  return self->_serverTruthCallback;
}

- (id)clientTruthCallback
{
  return self->_clientTruthCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientTruthCallback, 0);
  objc_storeStrong(&self->_serverTruthCallback, 0);
  objc_storeStrong((id *)&self->_pendingChangesStream, 0);
}

@end
