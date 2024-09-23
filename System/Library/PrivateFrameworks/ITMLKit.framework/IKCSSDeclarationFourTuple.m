@implementation IKCSSDeclarationFourTuple

- (IKCSSDeclarationFourTuple)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationFourTuple *v8;
  IKCSSDeclarationEdgeInsets *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  IKFourTuple *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  IKFourTuple *v25;
  void *v26;
  IKFourTuple *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IKCSSDeclarationFourTuple;
  v8 = -[IKCSSDeclarationFourTuple init](&v34, sel_init);
  if (v8)
  {
    v9 = -[IKCSSDeclarationEdgeInsets initWithParseDeclaration:info:]([IKCSSDeclarationEdgeInsets alloc], "initWithParseDeclaration:info:", v6, v7);
    if (-[IKCSSDeclarationEdgeInsets insetsFound](v9, "insetsFound"))
    {
      -[IKCSSDeclarationEdgeInsets insets](v9, "insets");
      v11 = v10;
      -[IKCSSDeclarationEdgeInsets insets](v9, "insets");
      v13 = v12;
      -[IKCSSDeclarationEdgeInsets insets](v9, "insets");
      v15 = v14;
      -[IKCSSDeclarationEdgeInsets insets](v9, "insets");
      v17 = -[IKFourTuple initWithCornerRadii:]([IKFourTuple alloc], "initWithCornerRadii:", v16, v15, v11, v13);
      -[IKCSSDeclarationFourTuple setFourTuple:](v8, "setFourTuple:", v17);
    }
    else
    {
      objc_msgSend(v6, "cssValue");
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = (IKFourTuple *)(id)objc_claimAutoreleasedReturnValue();
      v18 = -[IKFourTuple countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v22, "type", (_QWORD)v30) == 1)
            {
              objc_msgSend(v22, "token");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "type") != 1 && objc_msgSend(v23, "type") == 18)
              {
                objc_msgSend(v23, "stringValue");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = -[IKFourTuple initWithStyleString:]([IKFourTuple alloc], "initWithStyleString:", v24);
                -[IKCSSDeclarationFourTuple setFourTuple:](v8, "setFourTuple:", v25);

                goto LABEL_17;
              }

            }
          }
          v19 = -[IKFourTuple countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v19)
            continue;
          break;
        }
      }
LABEL_17:

    }
    -[IKCSSDeclarationFourTuple fourTuple](v8, "fourTuple");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = -[IKFourTuple initWithCornerRadii:]([IKFourTuple alloc], "initWithCornerRadii:", 0.0, 0.0, 0.0, 0.0);
      -[IKCSSDeclarationFourTuple setFourTuple:](v8, "setFourTuple:", v27);

    }
    objc_msgSend(v7, "name", (_QWORD)v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclaration setName:](v8, "setName:", v28);

    -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

  }
  return v8;
}

- (id)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[IKCSSDeclarationFourTuple fourTuple](self, "fourTuple");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[IKCSSDeclarationFourTuple fourTuple](self, "fourTuple");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerRadiiValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f %.3f %.3f %.3f"), v11, v13, v9, v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  const __CFString *v17;
  void *v18;

  -[IKCSSDeclarationFourTuple fourTuple](self, "fourTuple");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadiiValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{topLeft:%.3f, topRight:%.3f, bottomRight:%.3f, bottomLeft:%.3f}"), v9, v11, v7, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IKCSSDeclaration important](self, "important");
  v17 = CFSTR("false");
  if (v16)
    v17 = CFSTR("true");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", insets:%@, important: %@}"), v14, v15, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (IKFourTuple)fourTuple
{
  return self->_fourTuple;
}

- (void)setFourTuple:(id)a3
{
  objc_storeStrong((id *)&self->_fourTuple, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fourTuple, 0);
}

@end
