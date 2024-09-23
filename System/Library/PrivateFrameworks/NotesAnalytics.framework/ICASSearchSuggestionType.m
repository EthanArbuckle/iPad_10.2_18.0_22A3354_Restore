@implementation ICASSearchSuggestionType

- (ICASSearchSuggestionType)initWithSearchSuggestionType:(int64_t)a3
{
  ICASSearchSuggestionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSearchSuggestionType;
  result = -[ICASSearchSuggestionType init](&v5, sel_init);
  if (result)
    result->_searchSuggestionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASSearchSuggestionType searchSuggestionType](self, "searchSuggestionType", a3);
  if ((unint64_t)(v3 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_1E771CE08[v3 - 1];
}

- (int64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

@end
