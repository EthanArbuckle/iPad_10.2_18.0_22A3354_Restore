@implementation ML3MatcherAuxData

- (void)dealloc
{
  CPSearchMatcher *searchMatcher;
  char *searchUTF8String;
  objc_super v5;

  searchMatcher = self->_searchMatcher;
  self->_searchMatcher = 0;

  searchUTF8String = self->_searchUTF8String;
  if (searchUTF8String)
  {
    free(searchUTF8String);
    self->_searchUTF8String = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ML3MatcherAuxData;
  -[ML3MatcherAuxData dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchMatcher, 0);
}

@end
