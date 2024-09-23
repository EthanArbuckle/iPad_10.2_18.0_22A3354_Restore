@implementation ATXBiomeSuggestedHomePageStream

- (NSString)identifier
{
  return (NSString *)CFSTR("ATXBiomeSuggestedHomePageStream");
}

- (ATXBiomeSuggestedHomePageStream)init
{
  return -[ATXBiomeSuggestedHomePageStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXBiomeSuggestedHomePageStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXBiomeSuggestedHomePageStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBiomeSuggestedHomePageStream;
  v5 = -[ATXBiomeSuggestedHomePageStream init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("ATXBiomeSuggestedHomePageStream"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)source
{
  return (id)-[BMStoreStream source](self->_inner, "source");
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXBiomeSuggestedHomePageStream source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

}

- (BMStoreStream)inner
{
  return self->_inner;
}

- (void)setInner:(id)a3
{
  objc_storeStrong((id *)&self->_inner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
