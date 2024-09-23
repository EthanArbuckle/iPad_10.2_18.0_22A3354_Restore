@implementation IKCSSFactory

+ (id)createDeclaration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;

  v3 = a3;
  +[IKViewElementStyle registeredAliases](IKViewElementStyle, "registeredAliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = v5;
    v5 = 0;
  }
  +[IKCSSTypeInfo getTypeInfoForPropertyName:](IKCSSTypeInfo, "getTypeInfoForPropertyName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v3, "cssValue"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11 < 1))
  {
    ITMLKitGetLogObject(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[IKCSSFactory createDeclaration:].cold.1(v3, v22);

    goto LABEL_14;
  }
  v12 = objc_msgSend(v9, "type");
  if (v12 >= 0xA)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v13 = (void *)objc_msgSend(objc_alloc(*off_1E9F4D148[v12]), "initWithParseDeclaration:info:", v3, v9);
  v14 = v13;
  if (v13)
  {
    if (v5)
      objc_msgSend(v13, "setAliasedName:", v5);
    v15 = objc_msgSend(v3, "range");
    objc_msgSend(v14, "setRange:", v15, v16);
    v17 = objc_msgSend(v3, "nameRange");
    objc_msgSend(v14, "setNameRange:", v17, v18);
    v19 = objc_msgSend(v3, "valueRange");
    objc_msgSend(v14, "setValueRange:", v19, v20);
    objc_msgSend(v9, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", v21);

    objc_msgSend(v14, "setType:", objc_msgSend(v9, "type"));
    objc_msgSend(v14, "setImportant:", objc_msgSend(v3, "important"));
  }
LABEL_15:

  return v14;
}

+ (id)createDeclarationForName:(id)a3 withObject:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  IKCSSDeclarationInteger *v10;
  uint64_t v11;
  IKCSSDeclarationInteger *v12;
  int v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v18;
  __int128 v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v5 = a3;
  v6 = a4;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_3;
  v23[3] = &unk_1E9F4D0E0;
  v24 = &__block_literal_global_413;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_4;
  v21[3] = &unk_1E9F4D0E0;
  v7 = (id)MEMORY[0x1DF092410](v23);
  v22 = v7;
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF092410](v21);
  +[IKCSSTypeInfo getTypeInfoForPropertyName:](IKCSSTypeInfo, "getTypeInfoForPropertyName:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v10 = objc_alloc_init(IKCSSDeclarationInteger);
      -[IKCSSDeclaration setType:](v10, "setType:", 0);
      v11 = objc_msgSend(v6, "integerValue");
      v12 = v10;
      goto LABEL_8;
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v10 = objc_alloc_init(IKCSSDeclarationDouble);
      -[IKCSSDeclaration setType:](v10, "setType:", 1);
      objc_msgSend(v6, "doubleValue");
      -[IKCSSDeclarationInteger setValue:](v10, "setValue:");
      break;
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v10 = objc_alloc_init(IKCSSDeclarationString);
      -[IKCSSDeclaration setType:](v10, "setType:", 3);
      v12 = v10;
      v11 = (uint64_t)v6;
LABEL_8:
      -[IKCSSDeclarationInteger setValue:](v12, "setValue:", v11);
      break;
    case 4:
      v20 = 0;
      v13 = ((uint64_t (**)(_QWORD, id, id *))v8)[2](v8, v6, &v20);
      v14 = v20;
      v10 = 0;
      if (v13)
      {
        v10 = objc_alloc_init(IKCSSDeclarationColor);
        -[IKCSSDeclaration setType:](v10, "setType:", 4);
        -[IKCSSDeclarationInteger setColor:](v10, "setColor:", v14);
      }

      break;
    case 7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_alloc_init(IKCSSDeclarationEdgeInsets);
        v15 = -[IKCSSDeclaration setType:](v10, "setType:", 7);
        v16 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
        v18 = *MEMORY[0x1E0CEB4B0];
        v19 = v16;
        -[IKCSSDeclarationInteger setInsetsFound:](v10, "setInsetsFound:", __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke(v15, v6, &v18));
        -[IKCSSDeclarationInteger setInsets:](v10, "setInsets:", v18, v19);
      }
      else
      {
LABEL_14:
        v10 = 0;
      }
      break;
    default:
      break;
  }
  -[IKCSSDeclaration setName:](v10, "setName:", v5);

  return v10;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend(a2, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  objc_msgSend(v4, "nextObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v5;
  v13 = v12;

  objc_msgSend(v4, "nextObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v9;
  v17 = v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "doubleValue");
    v19 = v18;
    objc_msgSend(v17, "doubleValue");
    v21 = v20;
    objc_msgSend(v13, "doubleValue");
    v23 = v22;
    objc_msgSend(v9, "doubleValue");
    *a3 = v19;
    a3[1] = v21;
    a3[2] = v23;
    a3[3] = v24;
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_2(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = (a2 - 48);
  if (v3 <= 9)
    goto LABEL_4;
  v4 = (a2 - 97);
  if (v4 <= 5)
  {
    v3 = v4 + 10;
LABEL_4:
    *a3 = v3;
    return 1;
  }
  return 0;
}

BOOL __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("#")))
    {
      if (objc_msgSend(v6, "length") == 4 || objc_msgSend(v6, "length") == 7)
      {
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v7 = objc_msgSend(v6, "length");
        v8 = 0;
        v9 = 0;
        while (1)
        {
          v30 = 0;
          v31 = 0;
          v10 = v7 == 4 ? v9 : v8;
          if (!(*(unsigned int (**)(_QWORD, uint64_t, uint64_t *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "characterAtIndex:", v10 + 1, v30), &v31))break;
          if (v7 == 4)
          {
            v11 = v31;
            v12 = v31;
          }
          else
          {
            if (!(*(unsigned int (**)(_QWORD, uint64_t, uint64_t *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "characterAtIndex:", v8 + 2), &v30))break;
            v11 = v30;
            v12 = v31;
          }
          *(&v32 + v9++) = v11 + 16 * v12;
          v8 += 2;
          if (v9 == 3)
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)v32 / 255.0, (double)v33 / 255.0, (double)v34 / 255.0, 1.0);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            v13 = 1;
            goto LABEL_23;
          }
        }
      }
      v13 = 0;
    }
    else
    {
      +[IKColor colorMap](IKColor, "colorMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v13 = *a3 != 0;
    }
LABEL_23:

    v20 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v5;
      if ((unint64_t)objc_msgSend(v14, "count") < 3)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "count") < 4)
        {
          v18 = &unk_1E9F8C9E0;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v21 = (void *)MEMORY[0x1E0CEA478];
          objc_msgSend(v15, "doubleValue");
          v23 = v22 / 255.0;
          objc_msgSend(v16, "doubleValue");
          v25 = v24 / 255.0;
          objc_msgSend(v17, "doubleValue");
          v27 = v26 / 255.0;
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v21, "colorWithRed:green:blue:alpha:", v23, v25, v27, v28);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          v20 = 1;
        }
        else
        {
          v20 = 0;
        }

      }
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_4(uint64_t a1, void *a2, id *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v51[0] = CFSTR("type");
      v51[1] = CFSTR("color");
      v52[0] = CFSTR("plain");
      v52[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = 0;
  }
  v8 = v7;
LABEL_7:
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("plain")))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("color"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v13 = (*(uint64_t (**)(uint64_t, void *, id *))(v11 + 16))(v11, v12, &v48);
      v14 = v48;

      if ((_DWORD)v13)
      {
        v15 = (id)objc_opt_new();
        *a3 = v15;
        objc_msgSend(v15, "setColorType:", 0);
        objc_msgSend(*a3, "setColor:", v14);
      }
LABEL_42:

      goto LABEL_43;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("linear-gradient")))
    {
      v37 = a3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v38 = v9;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("colors"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v45 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(a1 + 32);
            v43 = 0;
            v22 = (*(uint64_t (**)(void))(v21 + 16))();
            v23 = 0;
            if ((v22 & 1) == 0)
            {
              objc_msgSend(v14, "removeAllObjects");

              goto LABEL_23;
            }
            objc_msgSend(v14, "addObject:", v23);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_23:

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("points"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v40;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v40 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v24, "removeAllObjects");
              goto LABEL_33;
            }
            objc_msgSend(v24, "addObject:", v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v27)
            continue;
          break;
        }
      }
LABEL_33:

      v9 = v38;
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("direction"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToString:", CFSTR("top")) & 1) != 0)
      {
        v32 = 1;
      }
      else
      {
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("direction"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isEqualToString:", CFSTR("left")))
          v32 = 2;
        else
          v32 = 0;

      }
      v34 = objc_msgSend(v14, "count");
      v13 = v34 != 0;
      if (v34)
      {
        v35 = (id)objc_opt_new();
        *v37 = v35;
        objc_msgSend(v35, "setColorType:", 3);
        objc_msgSend(*v37, "setGradientType:", 1);
        objc_msgSend(*v37, "setGradientDirectionType:", v32);
        objc_msgSend(*v37, "setGradientColors:andPoints:", v14, v24);
      }

      goto LABEL_42;
    }
  }
  v13 = 0;
LABEL_43:

  return v13;
}

+ (id)createSelectorList:(id)a3
{
  id v3;
  IKCSSSelectorList *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSUInteger v15;
  NSRange v16;
  NSUInteger length;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  IKCSSSelector *v22;
  void *v23;
  uint64_t v24;
  IKCSSSelectorList *v25;
  IKCSSSelectorList *v27;
  NSUInteger location;
  NSRange v29;
  NSRange v30;

  v3 = a3;
  v4 = objc_alloc_init(IKCSSSelectorList);
  if (!v3)
    goto LABEL_39;
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v27 = v4;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5, v27);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "type") == 1)
      {
        objc_msgSend(v6, "token");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "type") == 1)
        {
          v8 = 1;
        }
        else
        {
          if (objc_msgSend(v7, "type") == 5 && objc_msgSend(v7, "charValue") == 46)
          {
            v9 = objc_msgSend(v7, "range");
            v11 = v10;
            if (++v5 < objc_msgSend(v3, "count"))
            {
              objc_msgSend(v3, "objectAtIndex:", v5);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "type") == 1)
              {
                objc_msgSend(v12, "token");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v13, "type") == 18)
                {
                  objc_msgSend(v13, "stringValue");
                  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v30.location = objc_msgSend(v13, "range");
                  v30.length = v15;
                  v29.location = v9;
                  v29.length = v11;
                  v16 = NSUnionRange(v29, v30);
                  location = v16.location;
                  length = v16.length;

                  v18 = 0;
                  v4 = v27;
                  goto LABEL_21;
                }

              }
            }

            v25 = 0;
            v4 = v27;
            goto LABEL_41;
          }
          if (objc_msgSend(v7, "type") == 5 && objc_msgSend(v7, "charValue") == 42)
          {
            location = objc_msgSend(v7, "range");
            length = v19;
            v14 = CFSTR("*");
            v18 = 3;
            goto LABEL_21;
          }
          if (objc_msgSend(v7, "type") == 6)
          {
            objc_msgSend(v7, "stringValue");
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            location = objc_msgSend(v7, "range");
            length = v20;
            v18 = 1;
            goto LABEL_21;
          }
          if (objc_msgSend(v7, "type") == 18)
          {
            objc_msgSend(v7, "stringValue");
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            location = objc_msgSend(v7, "range");
            length = v21;
            v18 = 2;
            while (1)
            {
LABEL_21:
              if (++v5 >= objc_msgSend(v3, "count"))
                goto LABEL_29;
              objc_msgSend(v3, "objectAtIndex:", v5);
              v22 = (IKCSSSelector *)objc_claimAutoreleasedReturnValue();
              if (-[IKCSSSelector type](v22, "type") != 1)
              {
                v8 = 0;
                goto LABEL_30;
              }
              -[IKCSSSelector token](v22, "token");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "type") != 1)
                break;

            }
            v24 = objc_msgSend(v23, "type");

            if (v24 == 14)
            {
              v4 = v27;
LABEL_29:
              v22 = objc_alloc_init(IKCSSSelector);
              -[IKCSSSelector setRange:](v22, "setRange:", location, length);
              -[IKCSSSelector setName:](v22, "setName:", v14);
              -[IKCSSSelector setType:](v22, "setType:", v18);
              -[IKCSSSelectorList addSelector:](v4, "addSelector:", v22);
              v8 = 1;
LABEL_30:

              goto LABEL_31;
            }
            v8 = 0;
            v4 = v27;
LABEL_31:

          }
          else
          {
            v8 = 0;
          }
        }

      }
      else
      {
        v8 = 0;
      }

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count") && (v8 & 1) != 0);
    if (!v8)
      goto LABEL_40;
  }
  if (!-[IKCSSSelectorList count](v4, "count"))
LABEL_40:
    v25 = 0;
  else
LABEL_39:
    v25 = v4;
LABEL_41:

  return v25;
}

+ (void)createDeclaration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "Failed to parse CSS declaration with name: %@", (uint8_t *)&v4, 0xCu);

}

@end
