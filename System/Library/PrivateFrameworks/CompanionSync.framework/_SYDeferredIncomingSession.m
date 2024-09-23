@implementation _SYDeferredIncomingSession

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (void)setIdsContext:(id)a3
{
  objc_storeStrong((id *)&self->_idsContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsContext, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end
