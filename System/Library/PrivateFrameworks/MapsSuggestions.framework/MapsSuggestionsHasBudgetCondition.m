@implementation MapsSuggestionsHasBudgetCondition

- (MapsSuggestionsHasBudgetCondition)initWithBudget:(id)a3
{
  id v5;
  MapsSuggestionsHasBudgetCondition *v6;
  MapsSuggestionsHasBudgetCondition *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsHasBudgetCondition;
  v6 = -[MapsSuggestionsBaseCondition initWithName:](&v9, sel_initWithName_, CFSTR("MapsSuggestionsHasBudgetCondition"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_budget, a3);

  return v7;
}

- (BOOL)isTrue
{
  return -[MapsSuggestionsBudget hasBudgetLeft](self->_budget, "hasBudgetLeft");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budget, 0);
}

@end
