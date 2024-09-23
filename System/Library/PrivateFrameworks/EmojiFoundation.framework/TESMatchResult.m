@implementation TESMatchResult

+ (id)resultWithMatchRange:(_NSRange)a3 effectType:(int64_t)a4 matchType:(int64_t)a5 sourceString:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  TESMatchResult *v11;

  length = a3.length;
  location = a3.location;
  v10 = a6;
  v11 = objc_alloc_init(TESMatchResult);
  -[TESMatchResult setMatchRange:](v11, "setMatchRange:", location, length);
  -[TESMatchResult setEffectType:](v11, "setEffectType:", a4);
  -[TESMatchResult setMatchType:](v11, "setMatchType:", a5);
  -[TESMatchResult setSourceString:](v11, "setSourceString:", v10);

  -[TESMatchResult setSuggestionBehavior:](v11, "setSuggestionBehavior:", 1);
  return v11;
}

- (NSString)matchingSubString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[TESMatchResult sourceString](self, "sourceString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TESMatchResult sourceString](self, "sourceString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TESMatchResult matchRange](self, "matchRange");
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSRange v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TESMatchResult matchingSubString](self, "matchingSubString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.location = -[TESMatchResult matchRange](self, "matchRange");
  NSStringFromRange(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TESMatchResult effectType](self, "effectType");
  v8 = -[TESMatchResult matchType](self, "matchType");
  v9 = -[TESMatchResult suggestionBehavior](self, "suggestionBehavior");
  -[TESMatchResult sourceString](self, "sourceString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> matchingSubstring: %@, matchRange: %@, effectType: %ld, matchType: %ld, suggestionBehavior: %ld, sourceString: %@"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)sourceString
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_sourceString);
}

- (void)setSourceString:(id)a3
{
  objc_storeWeak((id *)&self->_sourceString, a3);
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (unint64_t)suggestionBehavior
{
  return self->_suggestionBehavior;
}

- (void)setSuggestionBehavior:(unint64_t)a3
{
  self->_suggestionBehavior = a3;
}

- (_NSRange)matchRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_matchRange.length;
  location = self->_matchRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMatchRange:(_NSRange)a3
{
  self->_matchRange = a3;
}

- (NSString)matcherClass
{
  return self->_matcherClass;
}

- (void)setMatcherClass:(id)a3
{
  objc_storeStrong((id *)&self->_matcherClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherClass, 0);
  objc_destroyWeak((id *)&self->_sourceString);
}

@end
