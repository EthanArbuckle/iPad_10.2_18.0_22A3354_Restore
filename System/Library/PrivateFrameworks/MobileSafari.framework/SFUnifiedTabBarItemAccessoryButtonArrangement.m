@implementation SFUnifiedTabBarItemAccessoryButtonArrangement

- (SFUnifiedTabBarItemAccessoryButtonArrangement)initWithLeadingButtonTypes:(id)a3 trailingButtonTypes:(id)a4
{
  id v6;
  id v7;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v8;
  uint64_t v9;
  NSArray *leadingButtonTypes;
  uint64_t v11;
  NSArray *trailingButtonTypes;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedTabBarItemAccessoryButtonArrangement;
  v8 = -[SFUnifiedTabBarItemAccessoryButtonArrangement init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    leadingButtonTypes = v8->_leadingButtonTypes;
    v8->_leadingButtonTypes = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    trailingButtonTypes = v8->_trailingButtonTypes;
    v8->_trailingButtonTypes = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (SFUnifiedTabBarItemAccessoryButtonArrangement)init
{
  return -[SFUnifiedTabBarItemAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:](self, "initWithLeadingButtonTypes:trailingButtonTypes:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (id)initUsingButtonLayout:(int64_t)a3 filteringButtonsUsingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  v7 = &unk_1E2245D38;
  if (a3 == 1)
    v7 = &unk_1E2245D50;
  if (a3 == 2)
    v8 = &unk_1E2245D68;
  else
    v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke;
  v24[3] = &unk_1E21E5980;
  v10 = v6;
  v25 = v10;
  objc_msgSend(v8, "safari_filterObjectsUsingBlock:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v14 = &unk_1E2245DC8;
  }
  else if (a3)
  {
    v14 = &unk_1E2245DB0;
  }
  else
  {
    +[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "usesFormatMenuInUnifiedTabBar");

    if (v13)
      v14 = &unk_1E2245D80;
    else
      v14 = &unk_1E2245D98;
  }
  v19 = v9;
  v20 = 3221225472;
  v21 = __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke_2;
  v22 = &unk_1E21E5980;
  v23 = v10;
  v15 = v10;
  objc_msgSend(v14, "safari_filterObjectsUsingBlock:", &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SFUnifiedTabBarItemAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:](self, "initWithLeadingButtonTypes:trailingButtonTypes:", v11, v16, v19, v20, v21, v22);

  return v17;
}

uint64_t __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"));
}

uint64_t __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"));
}

- (BOOL)isEqualToArrangement:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_leadingButtonTypes, "isEqualToArray:", v4[1]))
    v5 = -[NSArray isEqualToArray:](self->_trailingButtonTypes, "isEqualToArray:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)containsButtonType:(int64_t)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray containsObject:](self->_leadingButtonTypes, "containsObject:", v4)
    || -[NSArray containsObject:](self->_trailingButtonTypes, "containsObject:", v4);

  return v5;
}

- (NSArray)leadingButtonTypes
{
  return self->_leadingButtonTypes;
}

- (NSArray)trailingButtonTypes
{
  return self->_trailingButtonTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonTypes, 0);
  objc_storeStrong((id *)&self->_leadingButtonTypes, 0);
}

@end
