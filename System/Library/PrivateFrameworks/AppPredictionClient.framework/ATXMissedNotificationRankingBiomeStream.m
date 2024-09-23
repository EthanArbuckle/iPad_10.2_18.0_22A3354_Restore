@implementation ATXMissedNotificationRankingBiomeStream

- (NSString)identifier
{
  return (NSString *)CFSTR("missedNotificationRankingLoggingEvent");
}

- (ATXMissedNotificationRankingBiomeStream)init
{
  return -[ATXMissedNotificationRankingBiomeStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXMissedNotificationRankingBiomeStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXMissedNotificationRankingBiomeStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  uint64_t v10;
  BMSource *source;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXMissedNotificationRankingBiomeStream;
  v5 = -[ATXMissedNotificationRankingBiomeStream init](&v13, sel_init);
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
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("missedNotificationRankingLoggingEvent"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

    -[BMStoreStream source](v5->_inner, "source");
    v10 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (BMSource *)v10;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)source
{
  return self->_source;
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXMissedNotificationRankingBiomeStream source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
