@implementation IMDMomentShareIngestionContext

- (IMDMomentShareIngestionContext)initWithURL:(id)a3 message:(id)a4 inChat:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMDMomentShareIngestionContext *v12;
  IMDMomentShareIngestionContext *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *assetUUIDsToFileTransfers;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMDMomentShareIngestionContext;
  v12 = -[IMDMomentShareIngestionContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shareURL, a3);
    objc_storeStrong((id *)&v13->_message, a4);
    objc_storeStrong((id *)&v13->_chat, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetUUIDsToFileTransfers = v13->_assetUUIDsToFileTransfers;
    v13->_assetUUIDsToFileTransfers = v14;

  }
  return v13;
}

- (NSDictionary)assetUUIDsToFileTransfers
{
  return (NSDictionary *)self->_assetUUIDsToFileTransfers;
}

- (void)addTransfers:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_assetUUIDsToFileTransfers, "addEntriesFromDictionary:", a3);
}

- (void)clearAllTransfers
{
  -[NSMutableDictionary removeAllObjects](self->_assetUUIDsToFileTransfers, "removeAllObjects");
}

- (void)completeTransferForAssetUUID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_assetUUIDsToFileTransfers, "removeObjectForKey:", a3);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (IMMessageItem)message
{
  return self->_message;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)setMomentShare:(id)a3
{
  objc_storeStrong((id *)&self->_momentShare, a3);
}

- (PHFetchResult)assetsFetch
{
  return self->_assetsFetch;
}

- (void)setAssetsFetch:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFetch, a3);
}

- (int64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(int64_t)a3
{
  self->_fetchType = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFetch, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_assetUUIDsToFileTransfers, 0);
}

@end
