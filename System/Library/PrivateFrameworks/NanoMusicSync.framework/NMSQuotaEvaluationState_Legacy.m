@implementation NMSQuotaEvaluationState_Legacy

- (NSNumber)mediaLibraryIdentifier
{
  return self->_mediaLibraryIdentifier;
}

- (void)setMediaLibraryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryIdentifier, a3);
}

- (NSString)externalLibraryIdentifier
{
  return self->_externalLibraryIdentifier;
}

- (void)setExternalLibraryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalLibraryIdentifier, a3);
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (unint64_t)listTotalSize
{
  return self->_listTotalSize;
}

- (void)setListTotalSize:(unint64_t)a3
{
  self->_listTotalSize = a3;
}

- (unint64_t)listQuota
{
  return self->_listQuota;
}

- (void)setListQuota:(unint64_t)a3
{
  self->_listQuota = a3;
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (void)setContainerIndex:(int64_t)a3
{
  self->_containerIndex = a3;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(int64_t)a3
{
  self->_itemIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaLibraryIdentifier, 0);
}

@end
