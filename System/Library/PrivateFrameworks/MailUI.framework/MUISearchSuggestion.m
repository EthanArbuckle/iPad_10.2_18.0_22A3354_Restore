@implementation MUISearchSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MUISearchSuggestion)initWithCoder:(id)a3
{
  id v5;

  v5 = a3;
  -[MUISearchSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchSuggestion initWithCoder:]", "MUISearchSuggestion.m", 25, "0");
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  v5 = a3;
  -[MUISearchSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchSuggestion encodeWithCoder:]", "MUISearchSuggestion.m", 29, "0");
}

- (MUISearchSuggestionCategory)category
{
  -[MUISearchSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchSuggestion category]", "MUISearchSuggestion.m", 33, "0");
}

- (NSPredicate)predicate
{
  return 0;
}

- (BOOL)supportsRanking
{
  return 0;
}

- (BOOL)exactMatch
{
  return 0;
}

- (double)ranking
{
  return 2.22507386e-308;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  -[MUISearchSuggestion category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isLegacy
{
  void *v2;
  char v3;

  -[MUISearchSuggestion category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLegacy");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[MUISearchSuggestion spotlightSuggestion](self, "spotlightSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MUISearchSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (CSSuggestion)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (MUISearchSuggestionDelegate)delegate
{
  return (MUISearchSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
}

@end
