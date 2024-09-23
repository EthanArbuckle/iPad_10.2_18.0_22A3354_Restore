@implementation CLSPublicEventCacheCreatorResult

- (CLSPublicEventCacheCreatorResult)init
{
  CLSPublicEventCacheCreatorResult *v2;
  CLSPublicEventCacheCreatorResult *v3;
  NSDictionary *resolvedPublicEventsByTimeLocationIdentifier;
  NSDictionary *v5;
  NSDictionary *invalidationTokenByTimeLocationIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSPublicEventCacheCreatorResult;
  v2 = -[CLSPublicEventCacheCreatorResult init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    resolvedPublicEventsByTimeLocationIdentifier = v2->_resolvedPublicEventsByTimeLocationIdentifier;
    v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v2->_resolvedPublicEventsByTimeLocationIdentifier = (NSDictionary *)MEMORY[0x1E0C9AA70];

    invalidationTokenByTimeLocationIdentifier = v3->_invalidationTokenByTimeLocationIdentifier;
    v3->_invalidationTokenByTimeLocationIdentifier = v5;

  }
  return v3;
}

- (NSDictionary)resolvedPublicEventsByTimeLocationIdentifier
{
  return self->_resolvedPublicEventsByTimeLocationIdentifier;
}

- (void)setResolvedPublicEventsByTimeLocationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPublicEventsByTimeLocationIdentifier, a3);
}

- (NSDictionary)invalidationTokenByTimeLocationIdentifier
{
  return self->_invalidationTokenByTimeLocationIdentifier;
}

- (void)setInvalidationTokenByTimeLocationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTokenByTimeLocationIdentifier, a3);
}

- (unint64_t)numberOfRequests
{
  return self->_numberOfRequests;
}

- (void)setNumberOfRequests:(unint64_t)a3
{
  self->_numberOfRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTokenByTimeLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedPublicEventsByTimeLocationIdentifier, 0);
}

@end
