@implementation WebBookmark(Suggestions)

- (uint64_t)suggestionIdentifier
{
  return 0;
}

- (id)historyItem
{
  return objc_getAssociatedObject(a1, &webBookmarkHistoryItemKey);
}

- (void)setHistoryItem:()Suggestions
{
  objc_setAssociatedObject(a1, &webBookmarkHistoryItemKey, a3, (void *)1);
}

@end
