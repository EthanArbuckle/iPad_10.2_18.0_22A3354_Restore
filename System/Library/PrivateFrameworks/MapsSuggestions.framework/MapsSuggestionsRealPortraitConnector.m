@implementation MapsSuggestionsRealPortraitConnector

- (MapsSuggestionsRealPortraitConnector)init
{
  MapsSuggestionsRealPortraitConnector *v2;
  PPLocationStore *v3;
  PPLocationStore *locationStore;
  PPConnectionsStore *v5;
  PPConnectionsStore *connectionsStore;
  PPNamedEntityStore *v7;
  PPNamedEntityStore *namedEntityStore;
  PPEventStore *v9;
  PPEventStore *eventStore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRealPortraitConnector;
  v2 = -[MapsSuggestionsRealPortraitConnector init](&v12, sel_init);
  if (v2)
  {
    v3 = (PPLocationStore *)objc_alloc_init(MEMORY[0x1E0D70B98]);
    locationStore = v2->_locationStore;
    v2->_locationStore = v3;

    -[PPLocationStore setClientIdentifier:](v2->_locationStore, "setClientIdentifier:", CFSTR("maps"));
    v5 = (PPConnectionsStore *)objc_alloc_init(MEMORY[0x1E0D70AF8]);
    connectionsStore = v2->_connectionsStore;
    v2->_connectionsStore = v5;

    -[PPConnectionsStore setClientIdentifier:](v2->_connectionsStore, "setClientIdentifier:", CFSTR("maps"));
    v7 = (PPNamedEntityStore *)objc_alloc_init(MEMORY[0x1E0D70BE0]);
    namedEntityStore = v2->_namedEntityStore;
    v2->_namedEntityStore = v7;

    -[PPNamedEntityStore setClientIdentifier:](v2->_namedEntityStore, "setClientIdentifier:", CFSTR("maps"));
    v9 = (PPEventStore *)objc_alloc_init(MEMORY[0x1E0D70B48]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v9;

    -[PPEventStore setClientIdentifier:](v2->_eventStore, "setClientIdentifier:", CFSTR("maps"));
  }
  return v2;
}

- (id)locationQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D70B88], "queryForMapsWithLimit:fromDate:consumerType:", a3, a4, a5);
}

- (id)namedEntityQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D70BD0], "locationQueryWithLimit:fromDate:consumerType:", a3, a4, a5);
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  return -[PPLocationStore iterRankedLocationsWithQuery:error:block:](self->_locationStore, "iterRankedLocationsWithQuery:error:block:", a3, a4, a5);
}

- (void)namedEntityStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  -[PPNamedEntityStore registerFeedback:completion:](self->_namedEntityStore, "registerFeedback:completion:", a3, a5);
}

- (void)locationStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  -[PPLocationStore registerFeedback:clientIdentifier:completion:](self->_locationStore, "registerFeedback:clientIdentifier:completion:", a3, a4, a5);
}

- (void)connectionsStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  -[PPConnectionsStore registerFeedback:completion:](self->_connectionsStore, "registerFeedback:completion:", a3, a5);
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8
{
  return -[PPConnectionsStore iterRecentLocationsForConsumer:criteria:limit:client:error:block:](self->_connectionsStore, "iterRecentLocationsForConsumer:criteria:limit:client:error:block:", a3, a4, a5, a6, a7, a8);
}

- (id)rankedNamedEntitiesWihQuery:(id)a3 error:(id *)a4
{
  return (id)-[PPNamedEntityStore rankedNamedEntitiesWithQuery:error:](self->_namedEntityStore, "rankedNamedEntitiesWithQuery:error:", a3, a4);
}

- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  return -[PPEventStore iterScoredEventsWithQuery:error:block:](self->_eventStore, "iterScoredEventsWithQuery:error:block:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_connectionsStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
}

@end
