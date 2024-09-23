@implementation IMDSharedUtilitiesPluginPayload

- (BOOL)supportsCollaboration
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[IMDSharedUtilitiesPluginPayload setData:](self, "setData:", 0);
  -[IMDSharedUtilitiesPluginPayload setMessageGUID:](self, "setMessageGUID:", 0);
  -[IMDSharedUtilitiesPluginPayload setDataDetectedResult:](self, "setDataDetectedResult:", 0);
  -[IMDSharedUtilitiesPluginPayload setUrl:](self, "setUrl:", 0);
  -[IMDSharedUtilitiesPluginPayload setDatasource:](self, "setDatasource:", 0);
  -[IMDSharedUtilitiesPluginPayload setPluginBundleID:](self, "setPluginBundleID:", 0);
  -[IMDSharedUtilitiesPluginPayload setConsumedSessionPayloads:](self, "setConsumedSessionPayloads:", 0);
  -[IMDSharedUtilitiesPluginPayload setAttachments:](self, "setAttachments:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMDSharedUtilitiesPluginPayload;
  -[IMDSharedUtilitiesPluginPayload dealloc](&v3, sel_dealloc);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (id)datasource
{
  return objc_loadWeak(&self->_datasource);
}

- (void)setDatasource:(id)a3
{
  objc_storeWeak(&self->_datasource, a3);
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_datasource);
}

@end
