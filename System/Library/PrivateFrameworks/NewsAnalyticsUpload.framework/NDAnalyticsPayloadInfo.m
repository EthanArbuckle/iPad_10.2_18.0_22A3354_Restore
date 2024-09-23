@implementation NDAnalyticsPayloadInfo

- (NDAnalyticsPayloadInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDAnalyticsPayloadInfo;
  return -[NDAnalyticsPayloadInfo init](&v3, sel_init);
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)valuesByHTTPHeaderField
{
  return self->_valuesByHTTPHeaderField;
}

- (void)setValuesByHTTPHeaderField:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)entriesToUpload
{
  return self->_entriesToUpload;
}

- (void)setEntriesToUpload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)droppedEntriesByReason
{
  return self->_droppedEntriesByReason;
}

- (void)setDroppedEntriesByReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedEntriesByReason, 0);
  objc_storeStrong((id *)&self->_entriesToUpload, 0);
  objc_storeStrong((id *)&self->_valuesByHTTPHeaderField, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
}

@end
