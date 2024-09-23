@implementation NMSMediaContainerQuotaData

- (BOOL)hasItemsAboveQuota
{
  return -[NMSMediaContainerQuotaData hasSkippedItems](self, "hasSkippedItems")
      || -[NMSMediaContainerQuotaData hasRemovedItems](self, "hasRemovedItems");
}

- (id)quotaRefObj
{
  return objc_loadWeakRetained(&self->_quotaRefObj);
}

- (void)setQuotaRefObj:(id)a3
{
  objc_storeWeak(&self->_quotaRefObj, a3);
}

- (unint64_t)numItemsAdded
{
  return self->_numItemsAdded;
}

- (void)setNumItemsAdded:(unint64_t)a3
{
  self->_numItemsAdded = a3;
}

- (BOOL)hasSkippedItems
{
  return self->_hasSkippedItems;
}

- (void)setHasSkippedItems:(BOOL)a3
{
  self->_hasSkippedItems = a3;
}

- (BOOL)hasRemovedItems
{
  return self->_hasRemovedItems;
}

- (void)setHasRemovedItems:(BOOL)a3
{
  self->_hasRemovedItems = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_quotaRefObj);
}

@end
