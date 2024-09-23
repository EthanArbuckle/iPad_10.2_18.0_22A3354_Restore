@implementation NTKComplicationLayout

+ (id)layoutWithDefaultRule:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setDefaultLayoutRule:forState:", v4, 0);

  return v5;
}

- (NTKComplicationLayout)init
{
  NTKComplicationLayout *v2;
  uint64_t v3;
  NSMutableArray *stateLayouts;
  _QWORD v6[4];
  NTKComplicationLayout *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKComplicationLayout;
  v2 = -[NTKComplicationLayout init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    stateLayouts = v2->_stateLayouts;
    v2->_stateLayouts = (NSMutableArray *)v3;

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__NTKComplicationLayout_init__block_invoke;
    v6[3] = &unk_1E6BD1F38;
    v7 = v2;
    NTKEnumerateComplicationStates(v6);

  }
  return v2;
}

void __29__NTKComplicationLayout_init__block_invoke(uint64_t a1)
{
  void *v1;
  _NTKComplicationStateLayout *v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_alloc_init(_NTKComplicationStateLayout);
  objc_msgSend(v1, "addObject:", v2);

}

- (void)setDefaultLayoutRule:(id)a3 forState:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[NTKComplicationLayout _layoutForState:](self, "_layoutForState:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultRule:", v6);

}

- (void)setOverrideLayoutRule:(id)a3 forState:(int64_t)a4 layoutOverride:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[NTKComplicationLayout _layoutForState:](self, "_layoutForState:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRule:forLayoutOverride:", v8, a5);

}

- (id)layoutRuleForComplicationState:(int64_t)a3 layoutOverride:(int64_t)a4
{
  int64_t v5;
  void *v7;
  void *v8;

  if (a3 < 0)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    v5 = a3;
    while (1)
    {
      -[NTKComplicationLayout _layoutForState:](self, "_layoutForState:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ruleForLayoutOverride:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        break;
      if (v5-- < 1)
        goto LABEL_6;
    }
  }
  return v8;
}

- (id)defaultLayoutRuleForState:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;

  if (a3 < 0)
  {
LABEL_6:
    v6 = 0;
  }
  else
  {
    v3 = a3;
    while (1)
    {
      -[NTKComplicationLayout _layoutForState:](self, "_layoutForState:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultRule");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      if (v3-- < 1)
        goto LABEL_6;
    }
  }
  return v6;
}

- (id)_layoutForState:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_stateLayouts, "objectAtIndexedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLayouts, 0);
}

@end
