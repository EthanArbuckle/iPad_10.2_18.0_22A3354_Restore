@implementation MUISearchSuggestionCategoryScope

+ (MUISearchSuggestionCategoryScope)scopeWithTitle:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  MUISearchSuggestionCategoryScope *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MUISearchSuggestionCategoryScope);
  -[MUISearchSuggestionCategoryScope setTitle:](v7, "setTitle:", v6);

  -[MUISearchSuggestionCategoryScope setIdentifier:](v7, "setIdentifier:", v5);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_identifier);
}

- (id)predicateForSuggestion:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_predicateApplier + 2))();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)parsecScope
{
  return self->_parsecScope;
}

- (void)setParsecScope:(id)a3
{
  objc_storeStrong((id *)&self->_parsecScope, a3);
}

- (id)predicateApplier
{
  return self->_predicateApplier;
}

- (void)setPredicateApplier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicateApplier, 0);
  objc_storeStrong((id *)&self->_parsecScope, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
