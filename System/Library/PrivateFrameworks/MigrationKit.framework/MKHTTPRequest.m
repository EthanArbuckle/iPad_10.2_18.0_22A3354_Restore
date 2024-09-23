@implementation MKHTTPRequest

- (MKHTTPRequest)initWithHeaders:(id)a3 body:(id)a4 hostname:(id)a5
{
  id v8;
  id v9;
  id v10;
  MKHTTPRequest *v11;
  MKHTTPRequest *v12;
  MKHTTPParameters *v13;
  void *v14;
  MKHTTPParameters *v15;
  id v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKHTTPRequest;
  v11 = -[MKHTTPRequest init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MKHTTPRequest setHeaders:](v11, "setHeaders:", v8);
    v13 = [MKHTTPParameters alloc];
    objc_msgSend(v8, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MKHTTPParameters initWithDictionary:](v13, "initWithDictionary:", v14);
    -[MKHTTPRequest setParameters:](v12, "setParameters:", v15);

    -[MKHTTPRequest setHostname:](v12, "setHostname:", v10);
    v16 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[MKHTTPRequest setBody:](v12, "setBody:", v16);

    if (objc_msgSend(v9, "length"))
      -[NSMutableData appendData:](v12->_body, "appendData:", v9);
  }

  return v12;
}

- (void)appendData:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[NSMutableData appendData:](self->_body, "appendData:", v4);

}

- (void)sliceData:(unint64_t)a3
{
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v5 = -[NSMutableData length](self->_body, "length");
  v6 = v5 - a3;
  if (v5 != a3)
  {
    -[NSMutableData subdataWithRange:](self->_body, "subdataWithRange:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v7);

  }
  -[MKHTTPRequest setBody:](self, "setBody:", v8, v6);

}

- (BOOL)chunkedTransferCompleted
{
  return self->_chunkedTransferCompleted;
}

- (void)setChunkedTransferCompleted:(BOOL)a3
{
  self->_chunkedTransferCompleted = a3;
}

- (unint64_t)chunkOffset
{
  return self->_chunkOffset;
}

- (void)setChunkOffset:(unint64_t)a3
{
  self->_chunkOffset = a3;
}

- (MKHTTPHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (MKHTTPParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSMutableData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSData)chunk
{
  return self->_chunk;
}

- (void)setChunk:(id)a3
{
  objc_storeStrong((id *)&self->_chunk, a3);
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_chunk, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
