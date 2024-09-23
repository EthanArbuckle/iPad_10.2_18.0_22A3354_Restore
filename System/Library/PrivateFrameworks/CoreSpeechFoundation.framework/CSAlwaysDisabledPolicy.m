@implementation CSAlwaysDisabledPolicy

- (CSAlwaysDisabledPolicy)init
{
  CSAlwaysDisabledPolicy *v2;
  CSAlwaysDisabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAlwaysDisabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSAlwaysDisabledPolicy _addDisabledConditions](v2, "_addDisabledConditions");
  return v3;
}

- (void)_addDisabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_9411);
}

uint64_t __48__CSAlwaysDisabledPolicy__addDisabledConditions__block_invoke()
{
  return 0;
}

@end
