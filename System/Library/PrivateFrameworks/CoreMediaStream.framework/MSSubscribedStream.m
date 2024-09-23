@implementation MSSubscribedStream

- (MSSubscribedStream)initWithStreamID:(id)a3
{
  id v5;
  MSSubscribedStream *v6;
  MSSubscribedStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSubscribedStream;
  v6 = -[MSSubscribedStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_streamID, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nStream ID: %@\nCTAG: %@"), objc_opt_class(), self->_streamID, self->_ctag);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *streamID;
  NSString *ctag;
  id v7;

  v4 = a3;
  streamID = self->_streamID;
  v7 = v4;
  if (streamID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", streamID, CFSTR("streamID"));
    v4 = v7;
  }
  ctag = self->_ctag;
  if (ctag)
  {
    objc_msgSend(v7, "encodeObject:forKey:", ctag, CFSTR("ctag"));
    v4 = v7;
  }

}

- (MSSubscribedStream)initWithCoder:(id)a3
{
  id v4;
  MSSubscribedStream *v5;
  uint64_t v6;
  NSString *streamID;
  uint64_t v8;
  NSString *ctag;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSSubscribedStream;
  v5 = -[MSSubscribedStream init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamID"));
    v6 = objc_claimAutoreleasedReturnValue();
    streamID = v5->_streamID;
    v5->_streamID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctag"));
    v8 = objc_claimAutoreleasedReturnValue();
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v8;

  }
  return v5;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_streamID, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
}

+ (id)subscribedStreamWithStreamID:(id)a3
{
  id v3;
  MSSubscribedStream *v4;

  v3 = a3;
  v4 = -[MSSubscribedStream initWithStreamID:]([MSSubscribedStream alloc], "initWithStreamID:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
