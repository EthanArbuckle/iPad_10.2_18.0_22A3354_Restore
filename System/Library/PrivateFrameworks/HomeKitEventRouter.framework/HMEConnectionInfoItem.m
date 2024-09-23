@implementation HMEConnectionInfoItem

- (HMEConnectionInfoItem)initWithConnection:(id)a3 expiry:(id)a4
{
  id v6;
  id v7;
  HMEConnectionInfoItem *v8;
  uint64_t v9;
  NSUUID *identifier;
  HMEPendingEventsCollection *v11;
  HMEPendingEventsCollection *pendingEventItems;
  HMEPendingEventsCollection *v13;
  HMEPendingEventsCollection *pendingCachedEventItems;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMEConnectionInfoItem;
  v8 = -[HMEConnectionInfoItem init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeWeak(&v8->_connection, v6);
    objc_storeStrong((id *)&v8->_expiry, a4);
    v11 = objc_alloc_init(HMEPendingEventsCollection);
    pendingEventItems = v8->_pendingEventItems;
    v8->_pendingEventItems = v11;

    v13 = objc_alloc_init(HMEPendingEventsCollection);
    pendingCachedEventItems = v8->_pendingCachedEventItems;
    v8->_pendingCachedEventItems = v13;

  }
  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMEPendingEventsCollection)pendingEventItems
{
  return self->_pendingEventItems;
}

- (HMEPendingEventsCollection)pendingCachedEventItems
{
  return self->_pendingCachedEventItems;
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
  objc_storeStrong((id *)&self->_expiry, a3);
}

- (NSDate)debounceStartTime
{
  return self->_debounceStartTime;
}

- (void)setDebounceStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_debounceStartTime, a3);
}

- (id)connection
{
  return objc_loadWeakRetained(&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak(&self->_connection, a3);
}

- (BOOL)hasPendingRequest
{
  return self->_hasPendingRequest;
}

- (void)setHasPendingRequest:(BOOL)a3
{
  self->_hasPendingRequest = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_connection);
  objc_storeStrong((id *)&self->_debounceStartTime, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_pendingCachedEventItems, 0);
  objc_storeStrong((id *)&self->_pendingEventItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __49__HMEConnectionInfoItem_performRequestWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingRequest:", 0);
}

@end
