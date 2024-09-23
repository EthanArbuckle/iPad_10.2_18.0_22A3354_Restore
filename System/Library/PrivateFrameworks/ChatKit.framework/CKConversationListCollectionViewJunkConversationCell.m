@implementation CKConversationListCollectionViewJunkConversationCell

- (unint64_t)_daysUntilDeletion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earliestCachedMessageDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKUtilities daysUntilJunkFilterDeletionForDate:](CKUtilities, "daysUntilJunkFilterDeletionForDate:", v4);

  return v5;
}

- (BOOL)shouldAlwaysHideAvatar
{
  return 1;
}

@end
