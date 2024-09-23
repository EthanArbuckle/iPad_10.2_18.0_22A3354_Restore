@implementation MUISearchScopedSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scopedSuggestion:(id)a3
{
  id v3;
  MUISearchScopedSuggestion *v4;

  v3 = a3;
  v4 = -[MUISearchScopedSuggestion initWithSuggestion:]([MUISearchScopedSuggestion alloc], "initWithSuggestion:", v3);

  return v4;
}

+ (id)scopedSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4
{
  id v5;
  MUISearchScopedSuggestion *v6;

  v5 = a3;
  v6 = -[MUISearchScopedSuggestion initWithSuggestion:selectedScopeIndex:]([MUISearchScopedSuggestion alloc], "initWithSuggestion:selectedScopeIndex:", v5, a4);

  return v6;
}

- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3
{
  return -[MUISearchScopedSuggestion initWithSuggestion:selectedScopeIndex:](self, "initWithSuggestion:selectedScopeIndex:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4
{
  id v7;
  MUISearchScopedSuggestion *v8;
  MUISearchScopedSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUISearchScopedSuggestion;
  v8 = -[MUISearchScopedSuggestion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestion, a3);
    v9->_selectedScopeIndex = a4;
  }

  return v9;
}

- (MUISearchScopedSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MUISearchScopedSuggestion *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedScopeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfScopeWithIdentifier:", v6);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = -[MUISearchScopedSuggestion initWithSuggestion:selectedScopeIndex:](self, "initWithSuggestion:selectedScopeIndex:", v5, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  MUISearchAtomSuggestion *suggestion;
  id v5;
  void *v6;
  id v7;

  suggestion = self->_suggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestion, CFSTR("suggestion"));
  -[MUISearchScopedSuggestion selectedScope](self, "selectedScope");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("selectedScopeIdentifier"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  MUISearchAtomSuggestion *suggestion;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  suggestion = self->_suggestion;
  -[MUISearchScopedSuggestion selectedScope](self, "selectedScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ scope:%@"), v4, self, suggestion, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)category
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contactIdentifier
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)atomTitle
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "atomTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)atomImage
{
  void *v2;
  void *v3;

  -[MUISearchScopedSuggestion suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "atomImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateWithSelectedScope:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUISearchScopedSuggestion.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scope"));

  }
  objc_msgSend(v5, "predicateForSuggestion:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSPredicate)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MUISearchSuggestion category](self->_suggestion, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && self->_selectedScopeIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUISearchAtomSuggestion predicateWithSelectedScope:](self->_suggestion, "predicateWithSelectedScope:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MUISearchSuggestion predicate](self->_suggestion, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSPredicate *)v5;
}

- (MUISearchSuggestionCategoryScope)selectedScope
{
  void *v3;
  void *v4;
  void *v5;

  -[MUISearchSuggestion category](self->_suggestion, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") && self->_selectedScopeIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (MUISearchSuggestionCategoryScope *)v5;
}

- (MUISearchAtomSuggestion)suggestion
{
  return self->_suggestion;
}

- (unint64_t)selectedScopeIndex
{
  return self->_selectedScopeIndex;
}

- (void)setSelectedScopeIndex:(unint64_t)a3
{
  self->_selectedScopeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
