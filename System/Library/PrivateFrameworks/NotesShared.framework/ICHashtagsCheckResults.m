@implementation ICHashtagsCheckResults

- (ICHashtagsCheckResults)init
{
  ICHashtagsCheckResults *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICHashtagsCheckResults;
  result = -[ICHashtagsCheckResults init](&v3, sel_init);
  if (result)
    result->_rangeOfHashtag = (_NSRange)xmmword_1BDC15B20;
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSRange v11;

  -[ICHashtagsCheckResults matchingHashtagSuggestions](self, "matchingHashtagSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_map:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v11.location = -[ICHashtagsCheckResults rangeOfHashtag](self, "rangeOfHashtag");
  NSStringFromRange(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Hashtag found at %@, names: [%@]"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __42__ICHashtagsCheckResults_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayText");
}

- (_NSRange)rangeOfHashtag
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfHashtag.length;
  location = self->_rangeOfHashtag.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfHashtag:(_NSRange)a3
{
  self->_rangeOfHashtag = a3;
}

- (NSSet)matchingHashtagSuggestions
{
  return self->_matchingHashtagSuggestions;
}

- (void)setMatchingHashtagSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingHashtagSuggestions, 0);
}

@end
