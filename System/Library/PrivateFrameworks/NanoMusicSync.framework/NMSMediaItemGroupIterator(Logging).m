@implementation NMSMediaItemGroupIterator(Logging)

- (NMSQuotaEvaluationState)evaluationState
{
  NMSQuotaEvaluationState *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(NMSQuotaEvaluationState);
  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSQuotaEvaluationState setMediaLibraryIdentifier:](v3, "setMediaLibraryIdentifier:", v5);

  -[NMSMediaItemGroupIterator currentItem](self, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalLibraryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSQuotaEvaluationState setExternalLibraryIdentifier:](v3, "setExternalLibraryIdentifier:", v7);

  -[NMSQuotaEvaluationState setContainerIndex:](v3, "setContainerIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
  -[NMSQuotaEvaluationState setItemIndex:](v3, "setItemIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));
  -[NMSQuotaEvaluationState setItemSize:](v3, "setItemSize:", -[NMSMediaItemGroupIterator sizeForCurrentIdentifier](self, "sizeForCurrentIdentifier"));
  -[NMSQuotaEvaluationState setListTotalSize:](v3, "setListTotalSize:", -[NMSMediaItemGroupIterator sizeForItemListWithinQuota](self, "sizeForItemListWithinQuota"));
  return v3;
}

@end
