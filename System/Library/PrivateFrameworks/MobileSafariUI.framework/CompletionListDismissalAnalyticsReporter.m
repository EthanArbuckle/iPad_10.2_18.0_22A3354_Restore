@implementation CompletionListDismissalAnalyticsReporter

- (void)reportAnalytics
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissCompletionListWithItemAccepted:goKeyTapped:unifiedFieldContentType:", self->_acceptedCompletionListItem, self->_goKeyTapped, self->_unifiedFieldContentType);

}

- (void)setUnifiedFieldContentType:(int64_t)a3
{
  self->_unifiedFieldContentType = a3;
  self->_goKeyTapped = 1;
}

- (BOOL)acceptedCompletionListItem
{
  return self->_acceptedCompletionListItem;
}

- (void)setAcceptedCompletionListItem:(BOOL)a3
{
  self->_acceptedCompletionListItem = a3;
}

- (int64_t)unifiedFieldContentType
{
  return self->_unifiedFieldContentType;
}

@end
