@implementation EKEphemeralCacheEventStoreProvider

- (id)eventStore
{
  return -[EKTimedEventStorePurger acquireCachedEventStoreOrCreate:](self->_eventStorePurger, "acquireCachedEventStoreOrCreate:", 1);
}

- (EKEphemeralCacheEventStoreProvider)initWithCreationBlock:(id)a3
{
  id v4;
  EKEphemeralCacheEventStoreProvider *v5;
  EKTimedEventStorePurger *v6;
  EKTimedEventStorePurger *eventStorePurger;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEphemeralCacheEventStoreProvider;
  v5 = -[EKEphemeralCacheEventStoreProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(EKTimedEventStorePurger);
    eventStorePurger = v5->_eventStorePurger;
    v5->_eventStorePurger = v6;

    -[EKTimedEventStorePurger setPurgingAllowed:](v5->_eventStorePurger, "setPurgingAllowed:", 1);
    -[EKTimedEventStorePurger setTimeout:](v5->_eventStorePurger, "setTimeout:", 10.0);
    -[EKTimedEventStorePurger setCreationBlock:](v5->_eventStorePurger, "setCreationBlock:", v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStorePurger, 0);
}

@end
