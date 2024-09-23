@implementation SGSuggestionSection

- (id)category
{
  void *v3;
  void *v4;

  if (-[SGList count](self, "count"))
  {
    -[SGList itemAtIndex:](self, "itemAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)list
{
  void *v3;
  void *v4;

  if (-[SGList count](self, "count"))
  {
    -[SGList itemAtIndex:](self, "itemAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "suggestionList");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)comparator
{
  void *v2;
  void *v3;
  void *v4;

  -[SGSuggestionSection category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "suggestionComparator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _Block_copy(v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
