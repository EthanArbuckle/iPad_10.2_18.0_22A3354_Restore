@implementation IKCSSDeclarationShadow

- (IKCSSDeclarationShadow)initWithParseDeclaration:(id)a3 info:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  IKCSSDeclarationColor *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSShadow *v19;
  NSShadow *value;
  NSShadow *v21;
  void *v22;
  id v24;
  id v25;
  IKCSSDeclarationShadow *v26;
  _QWORD v27[4];
  NSShadow *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  v41.receiver = self;
  v41.super_class = (Class)IKCSSDeclarationShadow;
  v26 = -[IKCSSDeclarationShadow init](&v41, sel_init);
  if (!v26)
    goto LABEL_25;
  objc_msgSend(v25, "cssValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v9)
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  v10 = *(_QWORD *)v38;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (objc_msgSend(v13, "type") == 1)
      {
        objc_msgSend(v13, "token");
        v14 = (IKCSSDeclarationColor *)objc_claimAutoreleasedReturnValue();
        if (-[IKCSSDeclaration type](v14, "type") == 1
          || -[IKCSSDeclaration type](v14, "type") != 13 && -[IKCSSDeclaration type](v14, "type") != 11)
        {
          goto LABEL_17;
        }
        v15 = (void *)MEMORY[0x1E0CB37E8];
        -[IKCSSDeclarationColor doubleValue](v14, "doubleValue");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);
      }
      else
      {
        if (objc_msgSend(v13, "type") != 7)
          continue;
        v14 = objc_alloc_init(IKCSSDeclarationColor);
        -[IKCSSDeclarationColor _colorFromParseObject:sourceType:](v14, "_colorFromParseObject:sourceType:", v13, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v7, "addObject:", v17);
          v11 = objc_msgSend(v7, "count") - 1;
        }

      }
LABEL_17:

    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  }
  while (v9);
LABEL_22:

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CEA240]);
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x3010000000;
    v35 = &unk_1D96B5DDD;
    v36 = *MEMORY[0x1E0C9D820];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __56__IKCSSDeclarationShadow_initWithParseDeclaration_info___block_invoke;
    v27[3] = &unk_1E9F4D078;
    v30 = &v32;
    v31 = v11;
    v19 = (NSShadow *)v18;
    v28 = v19;
    v29 = v7;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v27);
    -[NSShadow setShadowOffset:](v19, "setShadowOffset:", v33[4], v33[5]);
    value = v26->_value;
    v26->_value = v19;
    v21 = v19;

    _Block_object_dispose(&v32, 8);
  }
  objc_msgSend(v24, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclaration setName:](v26, "setName:", v22);

  -[IKCSSDeclaration setType:](v26, "setType:", objc_msgSend(v24, "type"));
  -[IKCSSDeclaration setImportant:](v26, "setImportant:", objc_msgSend(v25, "important"));

LABEL_25:
  return v26;
}

void __56__IKCSSDeclarationShadow_initWithParseDeclaration_info___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  switch(a3)
  {
    case 2:
      if (*(_QWORD *)(a1 + 56) != 2)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v7, "setShadowBlurRadius:");
      }
      break;
    case 1:
      objc_msgSend(v10, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v6;
      break;
    case 0:
      objc_msgSend(v10, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v5;
      break;
  }
  if (*(_QWORD *)(a1 + 56) == a3)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowColor:", v9);

  }
}

- (id)stringValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NSShadow description](self->_value, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclarationShadow value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSShadow)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
