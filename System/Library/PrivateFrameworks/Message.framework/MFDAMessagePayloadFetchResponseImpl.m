@implementation MFDAMessagePayloadFetchResponseImpl

- (MFDAMessagePayloadFetchResponseImpl)initWithData:(id)a3 streaming:(BOOL)a4 streamingDone:(BOOL)a5
{
  id v9;
  MFDAMessagePayloadFetchResponseImpl *v10;
  MFDAMessagePayloadFetchResponseImpl *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDAMessagePayloadFetchResponseImpl;
  v10 = -[MFDAMessagePayloadFetchResponseImpl init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->data, a3);
    v11->streaming = a4;
    v11->streamingDone = a5;
  }

  return v11;
}

- (BOOL)streaming
{
  return self->streaming;
}

- (BOOL)streamingDone
{
  return self->streamingDone;
}

- (id)data
{
  return self->data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
}

@end
