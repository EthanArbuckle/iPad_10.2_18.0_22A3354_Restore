@implementation MRSetArtworkMessage

- (MRSetArtworkMessage)initWithArtworkData:(id)a3
{
  id v4;
  MRSetArtworkMessage *v5;
  _MRSetArtworkMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRSetArtworkMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRSetArtworkMessageProtobuf);
    -[_MRSetArtworkMessageProtobuf setJpegData:](v6, "setJpegData:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (NSData)artworkData
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jpegData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (unint64_t)type
{
  return 5;
}

@end
