@implementation BMMicroLocationRestrictedLocalizationStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("MicroLocationRestrictedLocalization"));
}

- (BMMicroLocationRestrictedLocalizationStream)init
{
  BMMicroLocationRestrictedLocalizationStream *v2;
  BMRestrictedStream *v3;
  void *v4;
  uint64_t v5;
  BMRestrictedStream *stream;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMMicroLocationRestrictedLocalizationStream;
  v2 = -[BMMicroLocationRestrictedLocalizationStream init](&v8, sel_init);
  if (v2)
  {
    v3 = [BMRestrictedStream alloc];
    -[BMMicroLocationRestrictedLocalizationStream identifier](v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMRestrictedStream initWithIdentifier:eventDataClass:](v3, "initWithIdentifier:eventDataClass:", v4, objc_opt_class());
    stream = v2->_stream;
    v2->_stream = (BMRestrictedStream *)v5;

  }
  return v2;
}

- (id)publisherFromStartTime:(double)a3
{
  return -[BMRestrictedStream publisherFromStartTime:](self->_stream, "publisherFromStartTime:", a3);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return -[BMRestrictedStream publisherWithStartTime:endTime:maxEvents:reversed:](self->_stream, "publisherWithStartTime:endTime:maxEvents:reversed:", a3, a4, a5, a6);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return -[BMRestrictedStream publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_stream, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, a6, a7);
}

- (id)publisher
{
  BMDSLStreamPublisher *v3;
  void *v4;
  BMDSLStreamPublisher *v5;

  v3 = [BMDSLStreamPublisher alloc];
  -[BMMicroLocationRestrictedLocalizationStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 2, objc_opt_class());

  return v5;
}

- (id)source
{
  return -[BMRestrictedStream source](self->_stream, "source");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
