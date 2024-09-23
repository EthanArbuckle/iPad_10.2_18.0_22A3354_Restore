@implementation MRRemoveSyncedEndpointsMessage

- (MRRemoveSyncedEndpointsMessage)initWithEndpointUIDs:(id)a3
{
  id v4;
  MRRemoveSyncedEndpointsMessage *v5;
  _MRRemoveEndpointsMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRemoveSyncedEndpointsMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRRemoveEndpointsMessageProtobuf);
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[_MRRemoveEndpointsMessageProtobuf setEndpointUIDs:](v6, "setEndpointUIDs:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
}

- (NSArray)endpointUIDs
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)type
{
  return 103;
}

@end
