@implementation FCSearchResult

- (FCTagSearchOperationResult)tagSearchResult
{
  return self->_tagSearchResult;
}

- (void)setTagSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_tagSearchResult, a3);
}

- (FCArticleSearchOperationResult)articleSearchResult
{
  return self->_articleSearchResult;
}

- (void)setArticleSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_articleSearchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleSearchResult, 0);
  objc_storeStrong((id *)&self->_tagSearchResult, 0);
}

@end
