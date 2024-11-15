@implementation ATXUserNotificationBiomeStream

- (NSString)identifier
{
  return (NSString *)CFSTR("userNotificationEvents");
}

- (ATXUserNotificationBiomeStream)init
{
  return -[ATXUserNotificationBiomeStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXUserNotificationBiomeStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXUserNotificationBiomeStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUserNotificationBiomeStream;
  v5 = -[ATXUserNotificationBiomeStream init](&v11, sel_init);
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
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("userNotificationEvents"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)publisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7
{
  _BOOL8 v7;
  BMStoreStream *inner;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a7;
  inner = self->_inner;
  v12 = (objc_class *)MEMORY[0x1E0D026F0];
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v12 alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v13, a5, a6, v7);

  -[BMStoreStream publisherWithOptions:](inner, "publisherWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)source
{
  ATXUserNotificationBiomeStream *v2;
  BMSource *source;
  uint64_t v4;
  BMSource *v5;
  BMSource *v6;

  v2 = self;
  objc_sync_enter(v2);
  source = v2->_source;
  if (!source)
  {
    -[BMStoreStream source](v2->_inner, "source");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_source;
    v2->_source = (BMSource *)v4;

    source = v2->_source;
  }
  v6 = source;
  objc_sync_exit(v2);

  return v6;
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXUserNotificationBiomeStream source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

}

- (void)sendEvent:(int64_t)a3 notification:(id)a4 deliveryReason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;

  v10 = (objc_class *)MEMORY[0x1E0CF9200];
  v11 = a4;
  v12 = [v10 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v13 = (id)objc_msgSend(v12, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:", v11, a3, a5, a6);

  -[ATXUserNotificationBiomeStream sendEvent:](self, "sendEvent:", v13);
}

- (void)deleteAllEvents
{
  -[BMStoreStream pruneWithPredicateBlock:](self->_inner, "pruneWithPredicateBlock:", &__block_literal_global_97);
}

uint64_t __49__ATXUserNotificationBiomeStream_deleteAllEvents__block_invoke()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
