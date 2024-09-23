@implementation NamePredicateSortKeyWrapper

- (void)dealloc
{
  __CFArray *tokenizationSortKeys;
  objc_super v4;

  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys)
    releaseTokenizationSortKeys(tokenizationSortKeys);
  v4.receiver = self;
  v4.super_class = (Class)NamePredicateSortKeyWrapper;
  -[NamePredicateSortKeyWrapper dealloc](&v4, sel_dealloc);
}

- (__CFArray)tokenizationSortKeys
{
  return self->_tokenizationSortKeys;
}

- (void)setTokenizationSortKeys:(__CFArray *)a3
{
  self->_tokenizationSortKeys = a3;
}

@end
