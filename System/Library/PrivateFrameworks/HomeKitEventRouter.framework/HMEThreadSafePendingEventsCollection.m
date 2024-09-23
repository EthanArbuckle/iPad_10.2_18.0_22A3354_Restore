@implementation HMEThreadSafePendingEventsCollection

- (id)eventItems
{
  os_unfair_lock_s *p_lock;
  void *v4;
  objc_super v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection eventItems](&v6, sel_eventItems);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMEThreadSafePendingEventsCollection)initWithEvents:(id)a3
{
  HMEThreadSafePendingEventsCollection *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMEThreadSafePendingEventsCollection;
  result = -[HMEPendingEventsCollection initWithEvents:](&v4, sel_initWithEvents_, a3);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_expectedEventAdditionCount = 0;
  }
  return result;
}

- (void)willAddAdditionalEvents
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_expectedEventAdditionCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)didFinishAddingAdditionalEvents
{
  os_unfair_lock_s *p_lock;
  int64_t v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_expectedEventAdditionCount - 1;
  self->_expectedEventAdditionCount = v4;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    -[HMEThreadSafePendingEventsCollection delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pendingEventCollectionDidComplete:", self);

  }
}

- (BOOL)isFinishedAddingItems
{
  HMEThreadSafePendingEventsCollection *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expectedEventAdditionCount == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)combinePreviousEvents:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  objc_super v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection combinePreviousEvents:](&v7, sel_combinePreviousEvents_, v5);

  os_unfair_lock_unlock(p_lock);
  -[HMEThreadSafePendingEventsCollection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingEventsCollectionDidAddItems:", self);

}

- (void)addEventInfo:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  objc_super v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection addEventInfo:](&v7, sel_addEventInfo_, v5);

  os_unfair_lock_unlock(p_lock);
  -[HMEThreadSafePendingEventsCollection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingEventsCollectionDidAddItems:", self);

}

- (void)addEventInfoItems:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  objc_super v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection addEventInfoItems:](&v7, sel_addEventInfoItems_, v5);

  os_unfair_lock_unlock(p_lock);
  -[HMEThreadSafePendingEventsCollection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingEventsCollectionDidAddItems:", self);

}

- (BOOL)hasEventItem
{
  HMEThreadSafePendingEventsCollection *v2;
  os_unfair_lock_s *p_lock;
  objc_super v5;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5.receiver = v2;
  v5.super_class = (Class)HMEThreadSafePendingEventsCollection;
  LOBYTE(v2) = -[HMEPendingEventsCollection hasEventItem](&v5, sel_hasEventItem);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5
{
  _BOOL8 v7;
  os_unfair_lock_s *p_lock;
  void *v10;
  objc_super v12;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12.receiver = self;
  v12.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection popEventItemsUpWithFragments:toSizeInBytes:usedBytes:](&v12, sel_popEventItemsUpWithFragments_toSizeInBytes_usedBytes_, v7, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)resetItems
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)HMEThreadSafePendingEventsCollection;
  -[HMEPendingEventsCollection resetItems](&v4, sel_resetItems);
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsFinishedAddingItems:(BOOL)a3
{
  self->_isFinishedAddingItems = a3;
}

- (HMEThreadSafePendingEventsCollectionDelegate)delegate
{
  return (HMEThreadSafePendingEventsCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
