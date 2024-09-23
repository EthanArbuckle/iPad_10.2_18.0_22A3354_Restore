@implementation _NTKComplicationStateLayout

- (void)setRule:(id)a3 forLayoutOverride:(int64_t)a4
{
  NSMutableDictionary *overrideRules;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  overrideRules = self->_overrideRules;
  if (!overrideRules)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_overrideRules;
    self->_overrideRules = v7;

    overrideRules = self->_overrideRules;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](overrideRules, "setObject:forKey:", v10, v9);

}

- (id)ruleForLayoutOverride:(int64_t)a3
{
  NSMutableDictionary *overrideRules;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  NTKComplicationLayoutRule *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__19;
  v13 = __Block_byref_object_dispose__19;
  v14 = self->_defaultRule;
  overrideRules = self->_overrideRules;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___NTKComplicationStateLayout_ruleForLayoutOverride___block_invoke;
  v8[3] = &unk_1E6BD27D0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](overrideRules, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NTKComplicationLayoutRule)defaultRule
{
  return self->_defaultRule;
}

- (void)setDefaultRule:(id)a3
{
  objc_storeStrong((id *)&self->_defaultRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultRule, 0);
  objc_storeStrong((id *)&self->_overrideRules, 0);
}

@end
