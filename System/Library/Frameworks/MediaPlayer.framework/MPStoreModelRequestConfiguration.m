@implementation MPStoreModelRequestConfiguration

- (MPStoreModelRequestConfiguration)initWithURLRequest:(id)a3
{
  id v4;
  MPStoreModelRequestConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSArray *URLRequests;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreModelRequestConfiguration;
  v5 = -[MPStoreModelRequestConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    URLRequests = v5->_URLRequests;
    v5->_URLRequests = (NSArray *)v7;

    v5->_type = 0;
  }

  return v5;
}

- (MPStoreModelRequestConfiguration)initWithURLRequests:(id)a3
{
  id v4;
  MPStoreModelRequestConfiguration *v5;
  uint64_t v6;
  NSArray *URLRequests;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreModelRequestConfiguration;
  v5 = -[MPStoreModelRequestConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URLRequests = v5->_URLRequests;
    v5->_URLRequests = (NSArray *)v6;

    v5->_type = 2 * ((unint64_t)objc_msgSend(v4, "count") > 1);
  }

  return v5;
}

- (NSURLRequest)URLRequest
{
  return (NSURLRequest *)-[NSArray firstObject](self->_URLRequests, "firstObject");
}

- (MPStoreModelRequestConfiguration)initWithRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4
{
  id v6;
  MPStoreModelRequestConfiguration *v7;
  uint64_t v8;
  NSArray *requestedItemIdentifiers;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStoreModelRequestConfiguration;
  v7 = -[MPStoreModelRequestConfiguration init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    requestedItemIdentifiers = v7->_requestedItemIdentifiers;
    v7->_requestedItemIdentifiers = (NSArray *)v8;

    v7->_itemMetadataRequestReason = a4;
    v7->_type = 1;
  }

  return v7;
}

- (NSArray)URLRequests
{
  return self->_URLRequests;
}

- (NSArray)requestedItemIdentifiers
{
  return self->_requestedItemIdentifiers;
}

- (unint64_t)itemMetadataRequestReason
{
  return self->_itemMetadataRequestReason;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_URLRequests, 0);
}

@end
