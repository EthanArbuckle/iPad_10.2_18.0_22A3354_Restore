@implementation IKCSSDeclarationColor

+ (id)_stringForColor:(id)a3 sourceType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  double *v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  double *v27;
  double v28;
  double *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  __CFString *v33;
  uint64_t v34;
  double v35;
  double v36;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 <= 1)
  {
    v28 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0;
    objc_msgSend(v5, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v28, &v36, &v35, &v34);

    if (a4)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%i, %i, %i, %.2f)"), (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0), v34);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgb(%i, %i, %i)"), (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0), v24);
LABEL_14:
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v28 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0;
    objc_msgSend(v5, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getHue:saturation:brightness:alpha:", &v28, &v36, &v35, &v34);

    v9 = v35 * 0.5 * (2.0 - v36);
    v10 = v9 * 2.0 + -1.0;
    v11 = -v10;
    if (v10 >= 0.0)
      v11 = v9 * 2.0 + -1.0;
    v12 = v35 * v36 / (1.0 - v11) * 100.0;
    v13 = v9 * 100.0;
    if (a4 == 2)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hsl(%i, %.2f%%, %.2f%%)"), (int)(v28 * 360.0), *(_QWORD *)&v12, *(_QWORD *)&v13, v24);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hsla(%i, %.2f%%, %.2f%%, %.2f)"), (int)(v28 * 360.0), *(_QWORD *)&v12, *(_QWORD *)&v13, v34);
    goto LABEL_14;
  }
  if (a4 == 6)
  {
    v28 = 0.0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__12;
    v32 = __Block_byref_object_dispose__12;
    v33 = CFSTR("NAMED_COLOR_NOT_FOUND");
    objc_msgSend(v5, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[IKColor colorMap](IKColor, "colorMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __52__IKCSSDeclarationColor__stringForColor_sourceType___block_invoke;
      v25[3] = &unk_1E9F4D050;
      v26 = v6;
      v27 = &v28;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v25);

      v16 = v26;
    }
    else
    {
      if (objc_msgSend(v6, "colorType") == 2)
      {
        v22 = v29;
        v16 = (void *)*((_QWORD *)v29 + 5);
        v23 = CFSTR("blurred");
      }
      else if (objc_msgSend(v6, "colorType") == 1)
      {
        v22 = v29;
        v16 = (void *)*((_QWORD *)v29 + 5);
        v23 = CFSTR("tint-color");
      }
      else
      {
        if (objc_msgSend(v6, "colorType") != 4)
        {
LABEL_30:
          v17 = (__CFString *)*((id *)v29 + 5);
          _Block_object_dispose(&v28, 8);

          goto LABEL_15;
        }
        v22 = v29;
        v16 = (void *)*((_QWORD *)v29 + 5);
        v23 = CFSTR("none");
      }
      *((_QWORD *)v22 + 5) = v23;
    }

    goto LABEL_30;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v28 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    v34 = 0;
    objc_msgSend(v5, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "getRed:green:blue:alpha:", &v28, &v36, &v35, &v34);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%X%X%X"), (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (a4 == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%C%C%C"), -[__CFString characterAtIndex:](v20, "characterAtIndex:", 1), -[__CFString characterAtIndex:](v20, "characterAtIndex:", 3), -[__CFString characterAtIndex:](v20, "characterAtIndex:", 5));
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (__CFString *)v21;
    }
  }
  else if (a4 == 7)
  {
    v17 = CFSTR("linear-gradient");
  }
  else
  {
    v17 = &stru_1E9F50578;
  }
LABEL_15:

  return v17;
}

void __52__IKCSSDeclarationColor__stringForColor_sourceType___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "color");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (IKCSSDeclarationColor)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationColor *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKCSSDeclarationColor;
  v8 = -[IKCSSDeclarationColor init](&v20, sel_init);
  if (v8)
  {
    v19 = 8;
    objc_msgSend(v6, "cssValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (objc_msgSend(v9, "count"))
    {
      while (1)
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "type") != 1)
          break;
        objc_msgSend(v11, "token");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 != 1)
          break;
        ++v10;

        if (v10 >= objc_msgSend(v9, "count"))
          goto LABEL_8;
      }

    }
LABEL_8:
    if (v10 >= objc_msgSend(v9, "count"))
    {
      v15 = 0;
      v16 = 8;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSDeclarationColor _colorFromParseObject:sourceType:](v8, "_colorFromParseObject:sourceType:", v14, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v19;
    }
    -[IKCSSDeclarationColor setSourceType:](v8, "setSourceType:", v16);
    -[IKCSSDeclarationColor setColor:](v8, "setColor:", v15);
    objc_msgSend(v7, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclaration setName:](v8, "setName:", v17);

    -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

  }
  return v8;
}

- (id)stringValue
{
  void *v3;
  void *v4;

  -[IKCSSDeclarationColor color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclarationColor _stringForColor:sourceType:](IKCSSDeclarationColor, "_stringForColor:sourceType:", v3, -[IKCSSDeclarationColor sourceType](self, "sourceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  const __CFString *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  -[IKCSSDeclarationColor color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v27 = 0;
    v28 = 0;
    v25 = 0;
    v26 = 0;
    -[IKCSSDeclarationColor color](self, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v28, &v27, &v26, &v25);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{red:%.3f, green:%.3f, blue:%.3f, alpha:%.3f}"), v28, v27, v26, v25);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IKCSSDeclarationColor color](self, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "colorType");

    if (v9 == 2)
    {
      v7 = CFSTR("blurred");
    }
    else
    {
      -[IKCSSDeclarationColor color](self, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "colorType");

      if (v11 == 1)
      {
        v7 = CFSTR("tint-color");
      }
      else
      {
        -[IKCSSDeclarationColor color](self, "color");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "colorType");

        if (v13 == 4)
        {
          v7 = CFSTR("none");
        }
        else
        {
          -[IKCSSDeclarationColor color](self, "color");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "colorType");

          if (v15 == 3)
            v7 = CFSTR("linear-gradient");
          else
            v7 = CFSTR("null");
        }
      }
    }
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclarationColor color](self, "color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclarationColor _stringForColor:sourceType:](IKCSSDeclarationColor, "_stringForColor:sourceType:", v19, -[IKCSSDeclarationColor sourceType](self, "sourceType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IKCSSDeclaration important](self, "important");
  v22 = CFSTR("false");
  if (v21)
    v22 = CFSTR("true");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", stringVal:\"%@\", color:%@, important: %@}"), v17, v18, v20, v7, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_colorFromParseObject:(id)a3 sourceType:(int64_t *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int64_t v14;

  v6 = a3;
  v14 = 8;
  if (objc_msgSend(v6, "type") == 1)
  {
    objc_msgSend(v6, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "type") == 18)
    {
      -[IKCSSDeclarationColor _keywordKolorFromParseToken:](self, "_keywordKolorFromParseToken:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        v14 = 6;

        goto LABEL_11;
      }
    }

  }
  else if (objc_msgSend(v6, "type") == 7)
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("linear-gradient"));

    if (v11)
    {
      -[IKCSSDeclarationColor _linearGradientKolorFromParseFunction:](self, "_linearGradientKolorFromParseFunction:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v9 = (void *)v12;
        v14 = 7;
        goto LABEL_11;
      }
    }
  }
  -[IKCSSDeclarationColor _kolorFromParseObject:sourceType:](self, "_kolorFromParseObject:sourceType:", v6, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  if (a4)
    *a4 = v14;

  return v9;
}

- (id)_keywordKolorFromParseToken:(id)a3
{
  void *v3;
  void *v4;
  IKColor *v5;
  IKColor *v6;
  uint64_t v7;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("blurred")))
  {
    v5 = objc_alloc_init(IKColor);
    v6 = v5;
    v7 = 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tint-color")))
  {
    v5 = objc_alloc_init(IKColor);
    v6 = v5;
    v7 = 1;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("none")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = objc_alloc_init(IKColor);
    v6 = v5;
    v7 = 4;
  }
  -[IKColor setColorType:](v5, "setColorType:", v7);
LABEL_8:

  return v6;
}

- (id)_linearGradientKolorFromParseFunction:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  IKColor *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  double v40;
  void *v41;
  unint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "cssValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_62;
  while (1)
  {
    if (objc_msgSend(v9, "type") == 1)
    {
      objc_msgSend(v9, "token");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "type");

      if (v11 == 18)
        break;
    }
    objc_msgSend(v8, "nextObject");
    v12 = (IKColor *)objc_claimAutoreleasedReturnValue();

    v9 = v12;
    if (!v12)
      goto LABEL_63;
  }
  objc_msgSend(v9, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("top"), "isEqualToString:", v14) & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    if ((objc_msgSend(CFSTR("left"), "isEqualToString:", v14) & 1) == 0)
    {

      goto LABEL_62;
    }
    v15 = 2;
  }
  v63 = v15;

  objc_msgSend(v8, "nextObject");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v16)
  {
    v18 = 0.0;
    do
    {
      v19 = (void *)v16;
      while (objc_msgSend(v19, "type") == 1)
      {
        objc_msgSend(v19, "token");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "type");

        if (v21 != 13)
          break;
        objc_msgSend(v19, "token");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        if (v24 >= v18 && v24 <= 1.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v25;
        }
        objc_msgSend(v8, "nextObject");
        v26 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v26;
        if (!v26)
          goto LABEL_33;
      }
      if (objc_msgSend(v19, "type") == 1)
      {
        objc_msgSend(v19, "token");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "type") == 18)
        {

LABEL_26:
          -[IKCSSDeclarationColor _kolorFromParseObject:sourceType:](self, "_kolorFromParseObject:sourceType:", v19, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "color");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v6, "addObject:", v30);
            if (v17)
            {
              objc_msgSend(v17, "floatValue");
              v18 = v31;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v17);
          }

          v17 = 0;
          goto LABEL_32;
        }
        v28 = objc_msgSend(v19, "type");

        if (v28 == 7)
          goto LABEL_26;
      }
      else if (objc_msgSend(v19, "type") == 7)
      {
        goto LABEL_26;
      }
LABEL_32:
      objc_msgSend(v8, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

    }
    while (v16);
  }
LABEL_33:
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {

    v5 = 0;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)v32;
    if ((void *)v32 == v34)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", 0, &unk_1E9F8C9D0);
    v60 = v8;
    v61 = v6;
    v62 = v4;
    objc_msgSend(v5, "lastObject");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (void *)v35;
    v37 = v35 == (_QWORD)v36;
    v38 = 0x1E0C99000uLL;
    if (v37)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", objc_msgSend(v5, "count") - 1, &unk_1E9F8C9E0);
    if (objc_msgSend(v5, "count") != 1)
    {
      v39 = 0;
      v40 = 0.0;
      do
      {
        objc_msgSend(*(id *)(v38 + 3560), "array");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ++v39;
        v42 = objc_msgSend(v5, "count") - 1;
        v43 = 1.0;
        while (v39 < v42)
        {
          objc_msgSend(v5, "objectAtIndex:", v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v33 + 3640), "null");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44 != v45)
          {
            objc_msgSend(v44, "floatValue");
            v43 = v47;

            break;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v46);

          ++v39;
          v42 = objc_msgSend(v5, "count") - 1;
        }
        if (objc_msgSend(v41, "count"))
        {
          v48 = objc_msgSend(v41, "count");
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v49 = v41;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v50)
          {
            v51 = v50;
            v52 = (v43 - v40) / (double)(unint64_t)(v48 + 1);
            v53 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v51; ++i)
              {
                if (*(_QWORD *)v65 != v53)
                  objc_enumerationMutation(v49);
                v40 = v52 + v40;
                v55 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "integerValue");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v55, v56);

              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
            }
            while (v51);
          }

          v38 = 0x1E0C99000;
          v33 = 0x1E0C99000;
        }

        v40 = v43;
      }
      while (v39 < objc_msgSend(v5, "count") - 1);
    }

    v6 = v61;
    v4 = v62;
    v8 = v60;
  }

  if (!objc_msgSend(v6, "count"))
  {
    v9 = 0;
LABEL_62:
    v12 = 0;
    goto LABEL_63;
  }
  v12 = objc_alloc_init(IKColor);
  -[IKColor setColorType:](v12, "setColorType:", 3);
  -[IKColor setGradientType:](v12, "setGradientType:", 1);
  -[IKColor setGradientDirectionType:](v12, "setGradientDirectionType:", v63);
  -[IKColor setGradientColors:andPoints:](v12, "setGradientColors:andPoints:", v6, v5);
  v9 = 0;
LABEL_63:

  return v12;
}

- (id)_kolorFromParseObject:(id)a3 sourceType:(int64_t *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  IKColor *v39;
  IKColor *v40;
  uint64_t i;
  int v43;
  unsigned int v44;
  unsigned int v45;
  char v46;
  char v47;
  char __dst[16];
  double v49[3];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "type") == 7)
  {
    v6 = v5;
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("rgb")) & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("rgba")) & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("hsl")) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("hsla")))
    {
      v14 = 0;
      v17 = 8;
      goto LABEL_51;
    }
    v9 = (objc_msgSend(v8, "isEqualToString:", CFSTR("hsl")) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("hsla"));
    *(_OWORD *)__dst = xmmword_1D96A7A60;
    *(_OWORD *)v49 = unk_1D96A7A70;
    objc_msgSend(v6, "cssValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (!v24)
    {
      if (v9)
        v17 = 0;
      else
        v17 = 2;
      if (v9)
        goto LABEL_49;
      goto LABEL_42;
    }
    v25 = 0;
    v26 = 0;
    while (1)
    {
      objc_msgSend(v6, "cssValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "type") == 1)
        break;
LABEL_30:

      ++v26;
      objc_msgSend(v6, "cssValue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v26 >= v33)
      {
        if (v9)
          v17 = 0;
        else
          v17 = 2;
        v34 = 3;
        if (v9)
          v34 = 1;
        if (v25 > 3)
          v17 = v34;
LABEL_48:
        if (v9)
        {
LABEL_49:
          objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *(double *)__dst / 255.0, *(double *)&__dst[8] / 255.0, v49[0] / 255.0, v49[1]);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
LABEL_42:
        v35 = v49[0] * 2.0 + -1.0;
        v36 = -v35;
        if (v35 >= 0.0)
          v36 = v49[0] * 2.0 + -1.0;
        v37 = (*(double *)&__dst[8] * (1.0 - v36) + v49[0] * 2.0) * 0.5;
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", *(double *)__dst / 360.0, (v37 - v49[0] + v37 - v49[0]) / v37);
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_50:
        v14 = (void *)v38;
LABEL_51:

        v16 = 0;
        if (a4)
LABEL_52:
          *a4 = v17;
        goto LABEL_53;
      }
    }
    objc_msgSend(v28, "token");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "type") == 13)
    {
      objc_msgSend(v29, "doubleValue");
    }
    else
    {
      if (objc_msgSend(v29, "type") != 12)
        goto LABEL_29;
      objc_msgSend(v29, "doubleValue");
      v30 = v31 / 100.0;
    }
    *(double *)&__dst[8 * v25++] = v30;
LABEL_29:

    if (v25 == 4)
    {

      if (v9)
        v17 = 1;
      else
        v17 = 3;
      goto LABEL_48;
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "type") == 1)
  {
    objc_msgSend(v5, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "type") == 18)
    {
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[IKColor colorMap](IKColor, "colorMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = v14;
        v16 = v12;
      }
      else
      {
        v16 = 0;
      }

      v17 = 6;
    }
    else if (objc_msgSend(v10, "type") == 6)
    {
      objc_msgSend(v10, "stringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&__dst[3] = 0;
      *(_DWORD *)__dst = 0;
      if (objc_msgSend(v18, "length") == 3)
      {
        v19 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        v20 = 0;
        v21 = &__dst[1];
        do
        {
          v22 = *(_BYTE *)(v19 + v20);
          *(v21 - 1) = v22;
          *v21 = v22;
          v21 += 2;
          ++v20;
        }
        while (v20 != 3);
        __dst[6] = 0;
        v17 = 5;
      }
      else if (objc_msgSend(v18, "length") == 6)
      {
        strncpy(__dst, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), 6uLL);
        v17 = 4;
      }
      else
      {
        v17 = 8;
      }
      for (i = 0; i != 6; ++i)
      {
        v43 = __dst[i];
        v44 = v43 - 48;
        v45 = v43 - 97;
        if ((v43 - 65) >= 6)
          v46 = 0;
        else
          v46 = v43 - 55;
        v47 = v43 - 87;
        if (v45 > 5)
          v47 = v46;
        if (v44 < 0xA)
          v47 = v44;
        __dst[i] = v47;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)(__dst[1] + 16 * __dst[0]) / 255.0, (double)(__dst[3] + 16 * __dst[2]) / 255.0, (double)(__dst[5] + 16 * __dst[4]) / 255.0, 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
    }
    else
    {
      v16 = 0;
      v14 = 0;
      v17 = 8;
    }

    if (a4)
      goto LABEL_52;
  }
  else
  {
    v16 = 0;
    v14 = 0;
    v17 = 8;
    if (a4)
      goto LABEL_52;
  }
LABEL_53:
  if (v16)
  {
    v39 = -[IKColor initWithColorMapKey:]([IKColor alloc], "initWithColorMapKey:", v16);
  }
  else
  {
    if (!v14)
    {
      v40 = 0;
      goto LABEL_58;
    }
    v39 = -[IKColor initWithColor:]([IKColor alloc], "initWithColor:", v14);
  }
  v40 = v39;
LABEL_58:
  -[IKColor setColorType:](v40, "setColorType:", 0);

  return v40;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (IKColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
