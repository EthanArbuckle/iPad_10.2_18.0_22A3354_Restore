@implementation CSAlwaysEnabledPolicy

- (CSAlwaysEnabledPolicy)init
{
  CSAlwaysEnabledPolicy *v2;
  CSAlwaysEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAlwaysEnabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSAlwaysEnabledPolicy _addAlwaysEnabledCondition](v2, "_addAlwaysEnabledCondition");
  return v3;
}

- (void)_addAlwaysEnabledCondition
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_5773);
}

uint64_t __51__CSAlwaysEnabledPolicy__addAlwaysEnabledCondition__block_invoke()
{
  return 1;
}

@end
