@implementation ATXNotificationSuggestionInteractionBiomeStream

- (NSString)identifier
{
  return (NSString *)CFSTR("notificationSuggestionInteraction");
}

- (ATXNotificationSuggestionInteractionBiomeStream)init
{
  return -[ATXNotificationSuggestionInteractionBiomeStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXNotificationSuggestionInteractionBiomeStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXNotificationSuggestionInteractionBiomeStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationSuggestionInteractionBiomeStream;
  v5 = -[ATXNotificationSuggestionInteractionBiomeStream init](&v11, sel_init);
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
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("notificationSuggestionInteraction"), v6, objc_opt_class());
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

- (void)deleteAllEvents
{
  -[BMStoreStream pruneWithPredicateBlock:](self->_inner, "pruneWithPredicateBlock:", &__block_literal_global_35);
}

uint64_t __66__ATXNotificationSuggestionInteractionBiomeStream_deleteAllEvents__block_invoke()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
