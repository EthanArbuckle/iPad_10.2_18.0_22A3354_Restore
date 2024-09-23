@implementation LPCSSResolver

- (LPCSSResolver)initWithTheme:(id)a3
{
  id v5;
  LPCSSResolver *v6;
  LPCSSResolver *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *localVariables;
  LPCSSResolver *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPCSSResolver;
  v6 = -[LPCSSResolver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_theme, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    localVariables = v7->_localVariables;
    v7->_localVariables = v8;

    v10 = v7;
  }

  return v7;
}

- (id)resolveCSSValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTheme CSSTextForThemeProperty:](self->_theme, "CSSTextForThemeProperty:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_localVariables, "objectForKeyedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[LPCSSResolver resolveCSSValue:](self, "resolveCSSValue:", v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
    }
    else
    {
      objc_msgSend(v4, "_lp_CSSText");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v10;
  }

  return v9;
}

- (void)enumerateResolvedRulesFromRuleDictionary:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__LPCSSResolver_enumerateResolvedRulesFromRuleDictionary_withBlock___block_invoke;
  v8[3] = &unk_1E44A7C70;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __68__LPCSSResolver_enumerateResolvedRulesFromRuleDictionary_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "resolveCSSValue:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)ruleDictionaryForStyle:(id)a3 forComponentClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  -[objc_class ruleDictionaryForStyle:](a4, "ruleDictionaryForStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("lp-rich-link-"), &stru_1E44AB1C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__LPCSSResolver_ruleDictionaryForStyle_forComponentClass___block_invoke;
    v14[3] = &unk_1E44A7C98;
    v9 = v8;
    v15 = v9;
    v10 = v7;
    v16 = v10;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
    v11 = v16;
    v12 = v9;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __58__LPCSSResolver_ruleDictionaryForStyle_forComponentClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "variableByResolvingWithThemePath:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v9);
  }

}

- (void)addStyle:(id)a3 toElement:(id)a4 inComponent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  LPWebLock();
  -[LPCSSResolver ruleDictionaryForStyle:forComponentClass:](self, "ruleDictionaryForStyle:forComponentClass:", v8, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__LPCSSResolver_addStyle_toElement_inComponent___block_invoke;
  v14[3] = &unk_1E44A7CC0;
  v13 = v12;
  v15 = v13;
  -[LPCSSResolver enumerateResolvedRulesFromRuleDictionary:withBlock:](self, "enumerateResolvedRulesFromRuleDictionary:withBlock:", v11, v14);
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v9, "setAttribute:value:", CFSTR("style"), v13);
  else
    objc_msgSend(v9, "removeAttribute:", CFSTR("style"));
  objc_msgSend(v9, "setClassName:", v8);

}

void __48__LPCSSResolver_addStyle_toElement_inComponent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(":"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(";"));

}

- (NSMutableDictionary)localVariables
{
  return self->_localVariables;
}

- (LPTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_localVariables, 0);
}

@end
