@implementation UIViewController(TableViewScrollPositionSaving)

- (id)safari_tableViewForScrollPositionSaving
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)safari_tableViewScrollPositionSaveIdentifier
{
  return 0;
}

- (id)_safari_tableViewScrollPositionKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_tableViewScrollPositionSaveIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SavedScrollPosition-"), "stringByAppendingString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
