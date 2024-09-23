@implementation IKViewElementStyle

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)sTypeMap;
    sTypeMap = (uint64_t)v2;

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)sTypeAliasMap;
    sTypeAliasMap = (uint64_t)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)sInheritMap;
    sInheritMap = (uint64_t)v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)sEdgeInsetsStylePositionMap;
    sEdgeInsetsStylePositionMap = (uint64_t)v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = (void *)sBlockedStyles;
    sBlockedStyles = (uint64_t)v10;

    v12 = (void *)sHiddenStyleName;
    sHiddenStyleName = 0;

    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("-itml-prototype"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("color"), 4, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("highlight-color"), 4, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("background-color"), 4, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("border-color"), 4, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("font-size"), 2, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("font-weight"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("text-align"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-text-max-lines"), 0, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("column-count"), 0, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-column-type"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-column-item-type"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-row-height"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("max-width"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-item-width"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-item-height"), 2, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-align"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-placeholder"), 5, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-reflect"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-fill"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-position"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-mask-color"), 4, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-transition"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-transition-interval"), 1, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-labels-state"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-ordinal-max-length"), 0, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-placeholder-background-color"), 4, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-img-treatment"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("transform"), 6, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-position"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-lockup-type"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("visibility"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-divider-type"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-card-type"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-badge-treatment"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-text-scale"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("itml-text-style"), 3, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("border-radius"), 8, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("text-shadow"), 9, 1);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("max-height"), 3, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("letter-spacing"), 1, 0);
    +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("line-height"), 2, 1);
    v22[0] = CFSTR("border-top-width");
    v22[1] = CFSTR("border-left-width");
    v22[2] = CFSTR("border-bottom-width");
    v22[3] = CFSTR("border-right-width");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:](IKViewElementStyle, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("border-width"), 0, v13, 0);

    v21[0] = CFSTR("itml-item-border-top-margin");
    v21[1] = CFSTR("itml-item-border-left-margin");
    v21[2] = CFSTR("itml-item-border-bottom-margin");
    v21[3] = CFSTR("itml-item-border-right-margin");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:](IKViewElementStyle, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("itml-item-border-margin"), 0, v14, 0);

    v20[0] = CFSTR("margin-top");
    v20[1] = CFSTR("margin-left");
    v20[2] = CFSTR("margin-bottom");
    v20[3] = CFSTR("margin-right");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:](IKViewElementStyle, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("margin"), 0, v15, 0);

    v19[0] = CFSTR("padding-top");
    v19[1] = CFSTR("padding-left");
    v19[2] = CFSTR("padding-bottom");
    v19[3] = CFSTR("padding-right");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:](IKViewElementStyle, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("padding"), 0, v16, 0);

    v18[0] = CFSTR("itml-top-padding");
    v18[1] = CFSTR("itml-left-padding");
    v18[2] = CFSTR("itml-bottom-padding");
    v18[3] = CFSTR("itml-right-padding");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:](IKViewElementStyle, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("itml-padding"), 0, v17, 0);

  }
}

+ (id)propertiesForStyleName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)sTypeMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sTypeAliasMap, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sInheritMap, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v3, CFSTR("IKViewElementStyleNameKey"));
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("IKViewElementStyleInheritedKey"));

    v28 = v4;
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("IKViewElementStyleTypeKey"));
    if (v5)
    {
      v35[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("IKViewElementStyleAliasesKey"));

    }
    v25 = v7;
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = (id)sEdgeInsetsStylePositionMap;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend((id)sEdgeInsetsStylePositionMap, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("_IKEdgeInsetStyleParentKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v3;
          v19 = objc_msgSend(v17, "isEqualToString:", v3);

          if (v19)
            objc_msgSend(v29, "addObject:", v15);

          v3 = v18;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    v20 = v25;
    if (objc_msgSend(v29, "count"))
    {
      v21 = v3;
      v22 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v25, "setObject:forKey:", v22, CFSTR("IKViewElementStyleLonghandKey"));

      v3 = v21;
    }

    v5 = v27;
    v4 = v28;
    v6 = v26;
  }
  else
  {
    v20 = 0;
  }
  v23 = (void *)objc_msgSend(v20, "copy");

  return v23;
}

+ (void)registerStyle:(id)a3 withType:(unint64_t)a4 inherited:(BOOL)a5
{
  objc_msgSend(a1, "registerStyle:aliasName:withType:inherited:", a3, 0, a4, a5);
}

+ (void)registerStyle:(id)a3 aliasName:(id)a4 withType:(unint64_t)a5 inherited:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  _BYTE *v24;
  _BYTE buf[24];
  unint64_t v26;
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  objc_msgSend(a3, "ik_sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sTypeMap, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "unsignedIntegerValue") != a5)
    {
      ITMLKitGetLogObject(4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v12, "unsignedIntegerValue");
        *(_WORD *)&buf[22] = 2048;
        v26 = a5;
        _os_log_error_impl(&dword_1D95F2000, v13, OS_LOG_TYPE_ERROR, "Registering a style (%@) that already has an existing type (%lu) that doesn't match the new type (%lu).", buf, 0x20u);
      }

    }
  }
  else
  {
    objc_msgSend((id)sTypeMap, "removeObjectForKey:", v10);
    objc_msgSend((id)sInheritMap, "removeObjectForKey:", v10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = (unint64_t)__Block_byref_object_copy__15;
    v27 = __Block_byref_object_dispose__15;
    v28 = 0;
    v14 = (void *)sTypeAliasMap;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __65__IKViewElementStyle_registerStyle_aliasName_withType_inherited___block_invoke;
    v22 = &unk_1E9F4DC18;
    v23 = v10;
    v24 = buf;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v19);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      objc_msgSend((id)sTypeAliasMap, "removeObjectForKey:", v19, v20, v21, v22);

    _Block_object_dispose(buf, 8);
  }
  v15 = (void *)sTypeMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, v10);

  if (v9)
    objc_msgSend((id)sTypeAliasMap, "setObject:forKey:", v10, v9);
  if (v6)
  {
    v17 = (void *)sInheritMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, v10);

  }
  +[IKCSSTypeInfo registerStyle:type:](IKCSSTypeInfo, "registerStyle:type:", v10, a5);

}

void __65__IKViewElementStyle_registerStyle_aliasName_withType_inherited___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

+ (void)registerEdgeInsetStyle:(id)a3 aliasName:(id)a4 withPositionStyleNames:(id)a5 inherited:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "ik_sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerStyle:aliasName:withType:inherited:", v12, v11, 7, v6);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__IKViewElementStyle_registerEdgeInsetStyle_aliasName_withPositionStyleNames_inherited___block_invoke;
  v14[3] = &unk_1E9F4DC40;
  v17 = v6;
  v15 = v12;
  v16 = a1;
  v13 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

}

void __88__IKViewElementStyle_registerEdgeInsetStyle_aliasName_withPositionStyleNames_inherited___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "ik_sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "registerStyle:withType:inherited:", v5, 1, *(unsigned __int8 *)(a1 + 48));
  v6 = (void *)sEdgeInsetsStylePositionMap;
  v7 = *(_QWORD *)(a1 + 32);
  v10[0] = CFSTR("_IKEdgeInsetStyleParentKey");
  v10[1] = CFSTR("_IKEdgeInsetStylePositionKey");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, v5);

}

+ (id)registeredStyles
{
  return (id)sTypeMap;
}

+ (id)registeredAliases
{
  return (id)sTypeAliasMap;
}

+ (void)unregisterStyles
{
  void *v2;

  objc_msgSend((id)sTypeMap, "removeAllObjects");
  objc_msgSend((id)sTypeAliasMap, "removeAllObjects");
  objc_msgSend((id)sInheritMap, "removeAllObjects");
  objc_msgSend((id)sEdgeInsetsStylePositionMap, "removeAllObjects");
  v2 = (void *)sHiddenStyleName;
  sHiddenStyleName = 0;

  +[IKCSSTypeInfo unregisterStyles](IKCSSTypeInfo, "unregisterStyles");
  +[IKViewElementStyle registerStyle:withType:inherited:](IKViewElementStyle, "registerStyle:withType:inherited:", CFSTR("-itml-prototype"), 3, 0);
}

+ (void)addBlockedStyle:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    objc_msgSend((id)sBlockedStyles, "addObject:", v3);

}

+ (void)clearBlockedStyles
{
  objc_msgSend((id)sBlockedStyles, "removeAllObjects");
}

+ (void)registerHiddenStyle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)sHiddenStyleName;
  sHiddenStyleName = (uint64_t)v4;
  v6 = v4;

  objc_msgSend(a1, "registerStyle:aliasName:withType:inherited:", v6, 0, 3, 0);
}

+ (BOOL)isHiddenStyleRegistered
{
  return sHiddenStyleName != 0;
}

+ (unint64_t)transitionFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = transitionFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&transitionFromString__onceToken, &__block_literal_global_14);
  objc_msgSend((id)transitionFromString__sTransitionKeysMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

uint64_t __43__IKViewElementStyle_transitionFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)transitionFromString__sTransitionKeysMap;
  transitionFromString__sTransitionKeysMap = (uint64_t)v0;

  objc_msgSend((id)transitionFromString__sTransitionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4D0, CFSTR("none"));
  objc_msgSend((id)transitionFromString__sTransitionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4E8, CFSTR("dissolve"));
  objc_msgSend((id)transitionFromString__sTransitionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C500, CFSTR("push"));
  objc_msgSend((id)transitionFromString__sTransitionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C518, CFSTR("wipe"));
  return objc_msgSend((id)transitionFromString__sTransitionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C530, CFSTR("magicMove"));
}

+ (unint64_t)positionFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = positionFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&positionFromString__onceToken, &__block_literal_global_166);
  objc_msgSend((id)positionFromString__sPositionKeysMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

uint64_t __41__IKViewElementStyle_positionFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)positionFromString__sPositionKeysMap;
  positionFromString__sPositionKeysMap = (uint64_t)v0;

  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4D0, CFSTR("center"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4E8, CFSTR("top"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C500, CFSTR("bottom"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C518, CFSTR("left"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C530, CFSTR("right"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C548, CFSTR("top-left"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C560, CFSTR("top-right"));
  objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C578, CFSTR("bottom-left"));
  return objc_msgSend((id)positionFromString__sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C590, CFSTR("bottom-right"));
}

+ (unint64_t)alignmentFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = alignmentFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&alignmentFromString__onceToken, &__block_literal_global_189);
  objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

uint64_t __42__IKViewElementStyle_alignmentFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)alignmentFromString__sAlignmentKeysMap;
  alignmentFromString__sAlignmentKeysMap = (uint64_t)v0;

  objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4D0, CFSTR("left"));
  objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4E8, CFSTR("center"));
  objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C500, CFSTR("right"));
  objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C518, CFSTR("justified"));
  return objc_msgSend((id)alignmentFromString__sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C530, CFSTR("natural"));
}

+ (unint64_t)imageTreatmentFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = imageTreatmentFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&imageTreatmentFromString__onceToken, &__block_literal_global_194);
  objc_msgSend((id)imageTreatmentFromString__sImageTreatmentKeysMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

uint64_t __47__IKViewElementStyle_imageTreatmentFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)imageTreatmentFromString__sImageTreatmentKeysMap;
  imageTreatmentFromString__sImageTreatmentKeysMap = (uint64_t)v0;

  objc_msgSend((id)imageTreatmentFromString__sImageTreatmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4E8, CFSTR("corner-small"));
  objc_msgSend((id)imageTreatmentFromString__sImageTreatmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C500, CFSTR("corner-medium"));
  objc_msgSend((id)imageTreatmentFromString__sImageTreatmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C518, CFSTR("corner-large"));
  return objc_msgSend((id)imageTreatmentFromString__sImageTreatmentKeysMap, "setObject:forKeyedSubscript:", &unk_1E9F8C4D0, CFSTR("circle"));
}

- (NSString)classDescriptorString
{
  NSString *classDescriptorString;

  classDescriptorString = self->_classDescriptorString;
  if (classDescriptorString)
    return classDescriptorString;
  else
    return (NSString *)&stru_1E9F50578;
}

+ (id)normalizeClassSelectorString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqualToString:", &stru_1E9F50578, (_QWORD)v18) & 1) == 0)
            objc_msgSend(v5, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
      v16 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v16;
    }

  }
  return v4;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5
{
  return (IKViewElementStyle *)objc_msgSend(a1, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:inlineStyleRangeCorrect:", a3, a4, a5, 0);
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5 inlineStyleRangeCorrect:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  __CFString *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v53;
  _BOOL4 v54;
  unsigned int v55;
  id v56;
  id v57;

  v6 = a6;
  v7 = a5;
  v10 = (__CFString *)a3;
  v11 = a4;
  if (-[__CFString length](v10, "length") || objc_msgSend(v11, "length"))
  {
    +[IKViewElementStyle normalizeClassSelectorString:](IKViewElementStyle, "normalizeClassSelectorString:", v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
      goto LABEL_31;
    v54 = v6;
    if (-[__CFString length](v12, "length"))
    {
      v56 = a1;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString componentsSeparatedByCharactersInSet:](v12, "componentsSeparatedByCharactersInSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        v16 = 0;
        do
        {
          objc_msgSend(v15, "objectAtIndex:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
          {
            if (objc_msgSend(v13, "length"))
              v18 = CFSTR(", .%@");
            else
              v18 = CFSTR(".%@");
            objc_msgSend(v13, "appendFormat:", v18, v17);
          }

          ++v16;
        }
        while (v16 < objc_msgSend(v15, "count"));
      }

      a1 = v56;
    }
    else
    {

      v12 = CFSTR("*");
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("*"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@{%@}"), v13, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "rangeOfString:", v11);
    +[IKCSSParser parse:](IKCSSParser, "parse:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "ruleList");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v23, "ruleAtIndex:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v54)
        {
          v53 = v23;
          v57 = a1;
          v55 = v7;
          objc_msgSend(v24, "selectorList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v27)
          {
            v28 = 0;
            do
            {
              objc_msgSend(v25, "selectorList");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "selectorAtIndex:", v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setRange:", 0, 0);

              ++v28;
              objc_msgSend(v25, "selectorList");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");

            }
            while (v32 > v28);
          }
          objc_msgSend(v25, "declarationList");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

          if (v34)
          {
            v35 = 0;
            do
            {
              objc_msgSend(v25, "declarationList");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "declarationAtIndex:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v38 = objc_msgSend(v37, "range");
              objc_msgSend(v37, "setRange:", v38 - v20, v39);
              v40 = objc_msgSend(v37, "nameRange");
              objc_msgSend(v37, "setNameRange:", v40 - v20, v41);
              v42 = objc_msgSend(v37, "valueRange");
              objc_msgSend(v37, "setValueRange:", v42 - v20, v43);

              ++v35;
              objc_msgSend(v25, "declarationList");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "count");

            }
            while (v45 > v35);
          }
          objc_msgSend(v25, "declarationList");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "range");
          v49 = v48;

          objc_msgSend(v25, "declarationList");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setRange:", v47 - v20, v49);

          v7 = v55;
          a1 = v57;
          v23 = v53;
        }
        v51 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCSSRule:filterBlockedStyles:selStr:", v25, v7, v12);

      }
      else
      {
        v51 = 0;
      }

    }
    else
    {
      v51 = 0;
    }

    if (!v51)
LABEL_31:
      v51 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCSSRule:filterBlockedStyles:selStr:", 0, v7, v12);
  }
  else
  {
    v51 = 0;
    v12 = v10;
  }

  return (IKViewElementStyle *)v51;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 cssRule:(id)a4 filterBlockedStyles:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCSSRule:filterBlockedStyles:selStr:", v8, v5, v9);

  return (IKViewElementStyle *)v10;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 aggregatingStyles:(id)a4
{
  id v5;
  id v6;
  IKViewElementStyle *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (IKViewElementStyle *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[IKViewElementStyle initWithClassSelector:]([IKViewElementStyle alloc], "initWithClassSelector:", v5);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[IKViewElementStyle _addElementStyle:](v7, "_addElementStyle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  return v7;
}

+ (IKViewElementStyle)elementStyleWithParentStyle:(id)a3 elementStyle:(id)a4 elementStyleOverrides:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  IKViewElementStyle *v12;
  IKViewElementStyle *v13;
  id v14;
  IKViewElementStyle *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "styleDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v7)
  {
    if (v8 && v11)
      goto LABEL_8;
    if (v8)
      goto LABEL_16;
    if (!v11)
    {
      v12 = 0;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v12 = -[IKViewElementStyle initWithClassSelector:]([IKViewElementStyle alloc], "initWithClassSelector:", 0);
  -[IKViewElementStyle _addParentStyle:](v12, "_addParentStyle:", v7);
  if (!v8 || !v11)
  {
    if (v8)
    {
      if (v12)
      {
        v13 = v12;
        v14 = v8;
        goto LABEL_11;
      }
LABEL_16:
      v15 = (IKViewElementStyle *)v8;
LABEL_22:
      v12 = v15;
      goto LABEL_23;
    }
    if (!v11)
      goto LABEL_23;
    if (v12)
      goto LABEL_10;
LABEL_21:
    v15 = (IKViewElementStyle *)v9;
    goto LABEL_22;
  }
  if (!v12)
LABEL_8:
    v12 = -[IKViewElementStyle initWithClassSelector:]([IKViewElementStyle alloc], "initWithClassSelector:", 0);
  -[IKViewElementStyle _addElementStyle:](v12, "_addElementStyle:", v8);
LABEL_10:
  v13 = v12;
  v14 = v9;
LABEL_11:
  -[IKViewElementStyle _addElementStyle:](v13, "_addElementStyle:", v14);
LABEL_23:

  return v12;
}

- (IKViewElementStyle)initWithStyle:(id)a3 classSelector:(id)a4
{
  id v6;
  void *v7;
  IKViewElementStyle *v8;

  v6 = a4;
  objc_msgSend(a3, "cssRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IKViewElementStyle initWithCSSRule:filterBlockedStyles:selStr:](self, "initWithCSSRule:filterBlockedStyles:selStr:", v7, 0, v6);

  return v8;
}

- (IKViewElementStyle)initWithCSSRule:(id)a3 filterBlockedStyles:(BOOL)a4 selStr:(id)a5
{
  id v8;
  IKViewElementStyle *v9;
  IKViewElementStyle *v10;
  uint64_t v11;
  IKCSSRule *cssRule;
  IKCSSRule *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[IKViewElementStyle initWithClassSelector:](self, "initWithClassSelector:", a5);
  v10 = v9;
  if (v9)
  {
    v9->_filterBlockedStyles = a4;
    v11 = objc_msgSend(v8, "copy");
    cssRule = v10->_cssRule;
    v10->_cssRule = (IKCSSRule *)v11;

    v13 = v10->_cssRule;
    if (v13)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[IKCSSRule declarationList](v13, "declarationList", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "declarations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            -[IKViewElementStyle _addDeclaration:](v10, "_addDeclaration:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++));
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v18);
      }

    }
  }

  return v10;
}

- (IKViewElementStyle)initWithClassSelector:(id)a3
{
  id v4;
  IKViewElementStyle *v5;
  IKCSSRule *v6;
  IKCSSRule *cssRule;
  IKCSSRule *v8;
  void *v9;
  IKCSSRule *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *classDescriptorString;
  NSMutableDictionary *v15;
  NSMutableDictionary *styleDict;
  uint64_t v17;
  NSMutableDictionary *overridingValuesByStyle;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IKViewElementStyle;
  v5 = -[IKViewElementStyle init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(IKCSSRule);
    cssRule = v5->_cssRule;
    v5->_cssRule = v6;

    v8 = v5->_cssRule;
    v9 = (void *)objc_opt_new();
    -[IKCSSRule setDeclarationList:](v8, "setDeclarationList:", v9);

    v10 = v5->_cssRule;
    v11 = (void *)objc_opt_new();
    -[IKCSSRule setSelectorList:](v10, "setSelectorList:", v11);

    +[IKViewElementStyle normalizeClassSelectorString:](IKViewElementStyle, "normalizeClassSelectorString:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ik_sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    classDescriptorString = v5->_classDescriptorString;
    v5->_classDescriptorString = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    styleDict = v5->_styleDict;
    v5->_styleDict = v15;

    v17 = objc_opt_new();
    overridingValuesByStyle = v5->_overridingValuesByStyle;
    v5->_overridingValuesByStyle = (NSMutableDictionary *)v17;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[IKCSSRule copy](self->_cssRule, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_classDescriptorString);
  v7 = -[NSMutableDictionary mutableCopy](self->_styleDict, "mutableCopy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  *(_BYTE *)(v4 + 8) = self->_filterBlockedStyles;
  objc_storeStrong((id *)(v4 + 32), self->_mediaQueryList);
  return (id)v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[IKViewElementStyle styleDict](self, "styleDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[IKViewElementStyle styleDict](self, "styleDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__IKViewElementStyle_description__block_invoke;
  v9[3] = &unk_1E9F4DCE8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

uint64_t __33__IKViewElementStyle_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@;"), a2, a3);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[IKViewElementStyle styleDict](self, "styleDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[IKViewElementStyle styleDict](self, "styleDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__IKViewElementStyle_debugDescription__block_invoke;
  v9[3] = &unk_1E9F4DCE8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __38__IKViewElementStyle_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@:%@;"), v5, v6);

}

- (id)valueForStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[IKViewElementStyle _styleNameForAlias:](self, "_styleNameForAlias:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyle overridingValuesByStyle](self, "overridingValuesByStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[IKViewElementStyle cssValueForStyle:](self, "cssValueForStyle:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)cssValueForStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v14;

  -[IKViewElementStyle _styleNameForAlias:](self, "_styleNameForAlias:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyle styleDict](self, "styleDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    switch(objc_msgSend(v6, "type"))
    {
      case 0:
        v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v10 = (double)objc_msgSend(v6, "value");
        goto LABEL_7;
      case 1:
        v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
        objc_msgSend(v6, "value");
LABEL_7:
        v7 = objc_msgSend(v9, "initWithDouble:", v10);
        break;
      case 2:
        objc_msgSend(v6, "number");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
      case 5:
      case 9:
        objc_msgSend(v6, "value");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend(v6, "color");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        v11 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v6, "transform");
        objc_msgSend(v11, "valueWithCGAffineTransform:", &v14);
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 7:
        v12 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v6, "insets");
        objc_msgSend(v12, "valueWithUIEdgeInsets:");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 8:
        objc_msgSend(v6, "fourTuple");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v8 = (void *)v7;
  }
  else
  {
LABEL_4:
    v8 = 0;
  }

  return v8;
}

- (unint64_t)edgeFlagForStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[IKViewElementStyle _styleNameForAlias:](self, "_styleNameForAlias:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyle styleDict](self, "styleDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "type") == 7)
    v7 = objc_msgSend(v6, "edgeFlag");
  else
    v7 = 0;

  return v7;
}

- (UIColor)color
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("border-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("background-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (IKColor)ikColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (IKColor)ikHighlightColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("highlight-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (IKColor)ikBackgroundColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("background-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (IKColor)ikBorderColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("border-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (UIEdgeInsets)borderMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[IKViewElementStyle _edgeInsetsForStyleName:](self, "_edgeInsetsForStyleName:", CFSTR("itml-item-border-margin"));
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)borderWidths
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[IKViewElementStyle _edgeInsetsForStyleName:](self, "_edgeInsetsForStyleName:", CFSTR("border-width"));
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)fontSize
{
  void *v2;
  double v3;
  double v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("font-size"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (NSString)fontWeight
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("font-weight"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)textAlignment
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("text-align"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)objc_opt_class(), "alignmentFromString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)elementAlignment
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-align"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)objc_opt_class(), "alignmentFromString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)elementPadding
{
  void *v3;
  const __CFString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("padding"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = CFSTR("padding");
  else
    v4 = CFSTR("itml-padding");
  -[IKViewElementStyle _edgeInsetsForStyleName:](self, "_edgeInsetsForStyleName:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)elementMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[IKViewElementStyle _edgeInsetsForStyleName:](self, "_edgeInsetsForStyleName:", CFSTR("margin"));
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)elementPosition
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-position"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "positionFromString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)maxTextLines
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-text-max-lines"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "value");
  else
    v4 = -1;

  return v4;
}

- (int64_t)columnCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("column-count"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "value");
  else
    v4 = -1;

  return v4;
}

- (NSString)columnType
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-column-type"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)columnItemType
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-column-item-type"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)rowHeight
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-row-height"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)maxWidth
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("max-width"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)itemWidth
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-item-width"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)itemHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-item-height"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "value");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSURL)imagePlaceholderURL
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-placeholder"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (IKColor)imagePlaceholderBackgroundColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-placeholder-background-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (IKColor)imageMaskColor
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-mask-color"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKColor *)v3;
}

- (NSString)lockupType
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-lockup-type"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (int64_t)reflectImage
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-reflect"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (int64_t)fillImage
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-fill"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (unint64_t)imagePosition
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-position"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "positionFromString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)imageTreatment
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-img-treatment"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (CGAffineTransform)transform
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  void *v8;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("transform"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "transform");
    v4 = v8;
  }
  else
  {
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }

  return result;
}

- (NSString)transition
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-transition"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSNumber)transitionInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-transition-interval"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (v2)
    objc_msgSend(v2, "value");
  else
    v5 = 0.0;
  objc_msgSend(v4, "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSString)labelsState
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-labels-state"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)ordinalMaxLength
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-ordinal-max-length"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "value");
  else
    v4 = 0;

  return v4;
}

- (NSString)visibility
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("visibility"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)dividerType
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-divider-type"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)cardType
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-card-type"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)badgeTreatment
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-badge-treatment"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)textScale
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-text-scale"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)textStyle
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("itml-text-style"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (IKFourTuple)borderRadius
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("border-radius"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fourTuple");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (IKFourTuple *)v4;
}

- (NSShadow)textShadow
{
  void *v2;
  void *v3;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("text-shadow"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSShadow *)v3;
}

- (NSString)maxHeight
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("max-height"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSNumber)letterSpacing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("letter-spacing"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "value");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)lineHeight
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", CFSTR("line-height"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "number");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (BOOL)hidden
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!sHiddenStyleName)
    return 0;
  -[IKViewElementStyle styleDict](self, "styleDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", sHiddenStyleName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("true"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresDynamicEvaluation
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IKViewElementStyle styleDict](self, "styleDict", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "color");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "colorMapKey");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)prototype
{
  return -[IKViewElementStyle valueForStyle:](self, "valueForStyle:", CFSTR("-itml-prototype"));
}

- (unint64_t)typeForStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[IKViewElementStyle _styleNameForAlias:](self, "_styleNameForAlias:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sTypeMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = 3;

  return v6;
}

- (id)_gradientFromString:(id)a3
{
  id v4;
  id v5;
  IKColor *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  IKColor *v12;
  id v13;
  uint64_t v14;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(IKColor);
  -[IKColor setColorType:](v6, "setColorType:", 3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v4);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("("), &v24);
  v9 = v24;
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = 0;
  if ((objc_msgSend(v7, "isAtEnd") & 1) != 0)
    goto LABEL_12;
  if (!objc_msgSend(v10, "length") || !objc_msgSend(CFSTR("linear-gradient"), "isEqualToString:", v10))
  {
    v11 = 0;
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  -[IKColor setGradientType:](v6, "setGradientType:", 1);
  objc_msgSend(v7, "scanString:intoString:", CFSTR("("), 0);
  v23 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", CFSTR(","), &v23);
  v13 = v23;
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isAtEnd") & 1) != 0
    || !objc_msgSend(v11, "length")
    || (objc_msgSend(v7, "isAtEnd") & 1) != 0
    || !objc_msgSend(v11, "length"))
  {
    goto LABEL_11;
  }
  if ((objc_msgSend(CFSTR("top"), "isEqualToString:", v11) & 1) != 0)
  {
    v14 = 1;
LABEL_15:
    -[IKColor setGradientDirectionType:](v6, "setGradientDirectionType:", v14);
    goto LABEL_16;
  }
  if (objc_msgSend(CFSTR("left"), "isEqualToString:", v11))
  {
    v14 = 2;
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0, self);
  v22 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", CFSTR(")"), &v22);
  v16 = v22;
  if ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
  {
    while (objc_msgSend(v16, "length"))
    {
      v20 = (void *)objc_msgSend(v19, "_newColorFromString:", v16);
      objc_msgSend(v20, "color");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v5, "addObject:", v18);
      objc_msgSend(v7, "scanString:intoString:", CFSTR(")"), 0);
      objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0);
      v21 = v16;
      objc_msgSend(v7, "scanUpToString:intoString:", CFSTR(")"), &v21);
      v17 = v21;

      v16 = v17;
      if (objc_msgSend(v7, "isAtEnd"))
        goto LABEL_22;
    }
  }
  v17 = v16;
LABEL_22:
  if (objc_msgSend(v5, "count"))
    -[IKColor setGradientColors:](v6, "setGradientColors:", v5);
  v12 = v6;

LABEL_12:
  return v12;
}

- (id)_newColorFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  float v11;
  uint64_t v12;
  IKColor *v13;
  IKColor *v14;
  uint64_t v15;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_29;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v4);
  v21 = 0;
  objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("("), &v21);
  v7 = v21;
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isAtEnd") & 1) != 0 || !objc_msgSend(v8, "length"))
    goto LABEL_28;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("rgb")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("rgba")))
  {
    v19 = -1;
    v20 = -1;
    v18 = -1;
    v17 = 1.0;
    objc_msgSend(v6, "scanString:intoString:", CFSTR("("), 0);
    objc_msgSend(v6, "scanInteger:", &v20);
    objc_msgSend(v6, "scanString:intoString:", CFSTR(","), 0);
    objc_msgSend(v6, "scanInteger:", &v19);
    objc_msgSend(v6, "scanString:intoString:", CFSTR(","), 0);
    objc_msgSend(v6, "scanInteger:", &v18);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("rgba")))
    {
      objc_msgSend(v6, "scanString:intoString:", CFSTR(","), 0);
      objc_msgSend(v6, "scanFloat:", &v17);
    }
    v9 = 0;
    if ((v20 & 0x8000000000000000) == 0 && (v19 & 0x8000000000000000) == 0 && (v18 & 0x8000000000000000) == 0)
    {
      if (v17 > 1.0 || v17 < 0.0)
        v11 = 1.0;
      else
        v11 = v17;
      v17 = v11;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (float)((float)v20 / 255.0), (float)((float)v19 / 255.0), (float)((float)v18 / 255.0), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("hsb")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("linear-gradient")))
    {
      -[IKViewElementStyle _gradientFromString:](self, "_gradientFromString:", v4);
      v13 = (IKColor *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
LABEL_28:

    goto LABEL_29;
  }
  v19 = -1;
  v20 = -1;
  v18 = -1;
  objc_msgSend(v6, "scanString:intoString:", CFSTR("("), 0);
  objc_msgSend(v6, "scanInteger:", &v20);
  objc_msgSend(v6, "scanString:intoString:", CFSTR(","), 0);
  objc_msgSend(v6, "scanInteger:", &v19);
  objc_msgSend(v6, "scanString:intoString:", CFSTR(","), 0);
  objc_msgSend(v6, "scanInteger:", &v18);
  v9 = 0;
  if ((v20 & 0x8000000000000000) == 0 && (v19 & 0x8000000000000000) == 0 && (v18 & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", (double)v20 / 360.0, (double)v19 / 100.0, (double)v18 / 100.0, 1.0);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v9 = (void *)v12;
  }
LABEL_19:

  if (v9)
  {
    v13 = -[IKColor initWithColor:]([IKColor alloc], "initWithColor:", v9);
    -[IKColor setColorType:](v13, "setColorType:", 0);
    v6 = v9;
    goto LABEL_36;
  }
LABEL_29:
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("blurred")))
  {
    v14 = objc_alloc_init(IKColor);
    v13 = v14;
    v15 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("tint-color")))
  {
    v14 = objc_alloc_init(IKColor);
    v13 = v14;
    v15 = 1;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("none")))
    {
      v13 = 0;
      goto LABEL_36;
    }
    v14 = objc_alloc_init(IKColor);
    v13 = v14;
    v15 = 4;
  }
  -[IKColor setColorType:](v14, "setColorType:", v15);
LABEL_36:

  return v13;
}

- (UIEdgeInsets)_edgeInsetsForStyleName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v4 = a3;
  -[IKViewElementStyle _declarationForStyleName:expectedClass:](self, "_declarationForStyleName:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "insets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0CEB4B0];
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_addParentStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "cssRule", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declarationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "declarations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)sInheritMap, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (v15)
          -[IKViewElementStyle _addDeclaration:](self, "_addDeclaration:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)_addElementStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "cssRule", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declarationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "declarations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[IKViewElementStyle _addDeclaration:](self, "_addDeclaration:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_addDeclaration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  char v15;
  id v16;
  void *v17;
  IKCSSDeclarationEdgeInsets *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  char v47;
  _QWORD v48[4];
  id v49;
  id v50;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyle cssRule](self, "cssRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "declarationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "declarations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKViewElementStyle styleDict](self, "styleDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[IKViewElementStyle typeForStyle:](self, "typeForStyle:", v5);
  objc_msgSend((id)sEdgeInsetsStylePositionMap, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v11 != 7 && v12 == 0;
  v15 = !v14;
  if (!v14)
  {
    v45 = v10;
    v47 = v15;
    if (v11 == 7)
    {
      v16 = v5;
    }
    else
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("_IKEdgeInsetStyleParentKey"), v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v16;
    -[IKViewElementStyle styleDict](self, "styleDict", v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v10);
    v18 = (IKCSSDeclarationEdgeInsets *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v18 = objc_alloc_init(IKCSSDeclarationEdgeInsets);
      -[IKCSSDeclarationEdgeInsets setInsets:](v18, "setInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
      -[IKCSSDeclarationEdgeInsets setInsetsFound:](v18, "setInsetsFound:", 1);
      -[IKCSSDeclaration setType:](v18, "setType:", 7);
      -[IKCSSDeclaration setName:](v18, "setName:", v10);
    }
    if (v11 == 7)
    {
      objc_msgSend(v4, "insets");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v27 = 15;
    }
    else
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("_IKEdgeInsetStylePositionKey"));
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_20;
      v29 = (void *)v28;
      objc_msgSend(v13, "objectForKey:", CFSTR("_IKEdgeInsetStylePositionKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntegerValue");

      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_20;
      -[IKCSSDeclarationEdgeInsets insets](v18, "insets");
      v20 = v37;
      v22 = v38;
      v24 = v39;
      v26 = v40;
      v27 = -[IKCSSDeclarationEdgeInsets edgeFlag](v18, "edgeFlag");
      switch(v31)
      {
        case 0:
          objc_msgSend(v4, "value");
          v20 = v41;
          v27 |= 1uLL;
          break;
        case 1:
          objc_msgSend(v4, "value");
          v22 = v42;
          v27 |= 2uLL;
          break;
        case 2:
          objc_msgSend(v4, "value");
          v24 = v43;
          v27 |= 4uLL;
          break;
        case 3:
          objc_msgSend(v4, "value");
          v26 = v44;
          v27 |= 8uLL;
          break;
        default:
          break;
      }
    }
    -[IKCSSDeclarationEdgeInsets setInsets:](v18, "setInsets:", v20, v22, v24, v26);
    -[IKCSSDeclarationEdgeInsets setEdgeFlag:](v18, "setEdgeFlag:", v27);
LABEL_20:
    if (v18)
    {
      -[IKViewElementStyle styleDict](self, "styleDict");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeObjectForKey:", v10);

      -[IKViewElementStyle styleDict](self, "styleDict");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v18, v10);

    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __38__IKViewElementStyle__addDeclaration___block_invoke;
    v48[3] = &unk_1E9F4CA68;
    v49 = v5;
    v50 = v34;
    v35 = v34;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v48);
    objc_msgSend(v8, "removeObjectsAtIndexes:", v35);

    v15 = v47;
    goto LABEL_23;
  }
  if (!v10)
    goto LABEL_24;
  objc_msgSend(v8, "removeObject:", v10);
LABEL_23:

LABEL_24:
  if (objc_msgSend(v8, "indexOfObject:", v4) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "addObject:", v4);
  if ((v15 & 1) == 0)
  {
    -[IKViewElementStyle styleDict](self, "styleDict");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v4, v5);

  }
}

void __38__IKViewElementStyle__addDeclaration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (id)_styleNameForAlias:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)sTypeAliasMap;
  v4 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (id)_declarationForStyleName:(id)a3 expectedClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v5 = a3;
  -[IKViewElementStyle _styleNameForAlias:](self, "_styleNameForAlias:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyle styleDict](self, "styleDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ITMLKitGetLogObject(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IKViewElementStyle _declarationForStyleName:expectedClass:].cold.1((uint64_t)v5, v10);

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (IKCSSRule)cssRule
{
  return self->_cssRule;
}

- (NSArray)mediaQueryList
{
  return self->_mediaQueryList;
}

- (void)setMediaQueryList:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQueryList, a3);
}

- (NSMutableDictionary)styleDict
{
  return self->_styleDict;
}

- (void)setStyleDict:(id)a3
{
  objc_storeStrong((id *)&self->_styleDict, a3);
}

- (NSMutableDictionary)overridingValuesByStyle
{
  return self->_overridingValuesByStyle;
}

- (void)setOverridingValuesByStyle:(id)a3
{
  objc_storeStrong((id *)&self->_overridingValuesByStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingValuesByStyle, 0);
  objc_storeStrong((id *)&self->_styleDict, 0);
  objc_storeStrong((id *)&self->_mediaQueryList, 0);
  objc_storeStrong((id *)&self->_cssRule, 0);
  objc_storeStrong((id *)&self->_classDescriptorString, 0);
}

- (void)_declarationForStyleName:(uint64_t)a1 expectedClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Unexpected declartion type for style \"%@\", (uint8_t *)&v2, 0xCu);
}

@end
