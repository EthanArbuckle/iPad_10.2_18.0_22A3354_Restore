@implementation NMSQuotaEvaluationState

- (NMSQuotaEvaluationState)initWithCurrentItem:(id)a3 downloadInfo:(id)a4
{
  id v6;
  id v7;
  NMSQuotaEvaluationState *v8;
  uint64_t v9;
  NSNumber *mediaLibraryIdentifier;
  uint64_t v11;
  NSString *externalLibraryIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMSQuotaEvaluationState;
  v8 = -[NMSQuotaEvaluationState init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "mediaLibraryIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    mediaLibraryIdentifier = v8->_mediaLibraryIdentifier;
    v8->_mediaLibraryIdentifier = (NSNumber *)v9;

    objc_msgSend(v6, "externalLibraryIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    externalLibraryIdentifier = v8->_externalLibraryIdentifier;
    v8->_externalLibraryIdentifier = (NSString *)v11;

    v8->_itemSize = objc_msgSend(v6, "size");
    v8->_listTotalSize = objc_msgSend(v7, "totalItemSize");
  }

  return v8;
}

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
