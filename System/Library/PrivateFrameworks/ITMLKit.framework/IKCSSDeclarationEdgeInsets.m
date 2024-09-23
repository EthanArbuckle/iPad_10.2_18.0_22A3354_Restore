@implementation IKCSSDeclarationEdgeInsets

- (IKCSSDeclarationEdgeInsets)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationEdgeInsets *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL *p_insetsFound;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v32;
  id v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IKCSSDeclarationEdgeInsets;
  v8 = -[IKCSSDeclarationEdgeInsets init](&v34, sel_init);
  if (!v8)
    goto LABEL_42;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "cssValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") < 1)
  {
LABEL_39:
    p_insetsFound = &v8->_insetsFound;
    v8->_insetsFound = 1;
LABEL_40:
    *p_insetsFound = 0;
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    goto LABEL_41;
  }
  v32 = v7;
  v33 = v6;
  v10 = 0;
  v11 = 0;
  while (1)
  {
    objc_msgSend(v9, "objectAtIndex:", v10, v32, v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "type") != 1)
      break;
    objc_msgSend(v12, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "type") != 13)
    {
      if (objc_msgSend(v13, "type") != 11)
      {
        if (objc_msgSend(v13, "type") != 1)
          goto LABEL_28;
        ++v10;
        v14 = v11;
        goto LABEL_23;
      }
      objc_msgSend(v13, "properties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("unit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16
        || objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("pt"))
        && objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("px")))
      {
        goto LABEL_27;
      }
      v14 = v11 + 1;
      if (v11 == 4)
      {
        v11 = 5;
LABEL_27:

LABEL_28:
        break;
      }
      objc_msgSend(v13, "doubleValue");
      *((_QWORD *)&v35 + v11) = v20;
      if (objc_msgSend(v9, "count") > ++v10)
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "type") == 1)
        {
          objc_msgSend(v21, "token");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "type");

          if (v23 != 1)
          {

LABEL_38:
            v7 = v32;
            v6 = v33;
            goto LABEL_39;
          }
        }

      }
      goto LABEL_20;
    }
    v14 = v11 + 1;
    if (v11 == 4)
    {
      v11 = 5;
      goto LABEL_28;
    }
    objc_msgSend(v13, "doubleValue");
    *((double *)&v35 + v11) = (double)(int)v15;
    if (objc_msgSend(v9, "count") > ++v10)
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "type") == 1)
      {
        objc_msgSend(v16, "token");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "type");

        if (v18 != 1)
          goto LABEL_38;
      }
LABEL_20:

    }
LABEL_23:

    v11 = v14;
    if (objc_msgSend(v9, "count") <= v10)
      goto LABEL_30;
  }

  v14 = v11;
LABEL_30:
  p_insetsFound = &v8->_insetsFound;
  v8->_insetsFound = 1;
  v25 = v14 - 1;
  v7 = v32;
  v6 = v33;
  switch(v25)
  {
    case 0:
      v26 = *(double *)&v35;
      v27 = *(double *)&v35;
      v28 = *(double *)&v35;
      v29 = *(double *)&v35;
      break;
    case 1:
      v27 = *((double *)&v35 + 1);
      v26 = *(double *)&v35;
      v28 = *(double *)&v35;
      goto LABEL_35;
    case 2:
      v27 = *((double *)&v35 + 1);
      v28 = *(double *)&v36;
      v26 = *(double *)&v35;
LABEL_35:
      v29 = v27;
      break;
    case 3:
      v27 = *((double *)&v36 + 1);
      v28 = *(double *)&v36;
      v29 = *((double *)&v35 + 1);
      v26 = *(double *)&v35;
      break;
    default:
      v7 = v32;
      v6 = v33;
      goto LABEL_40;
  }
LABEL_41:
  -[IKCSSDeclarationEdgeInsets setInsets:](v8, "setInsets:", v26, v27, v28, v29);
  -[IKCSSDeclarationEdgeInsets setEdgeFlag:](v8, "setEdgeFlag:", 15);
  objc_msgSend(v7, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclaration setName:](v8, "setName:", v30);

  -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
  -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

LABEL_42:
  return v8;
}

- (id)stringValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f %.3f %.3f %.3f"), *(_QWORD *)&self->_insets.top, *(_QWORD *)&self->_insets.right, *(_QWORD *)&self->_insets.bottom, *(_QWORD *)&self->_insets.left);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{top:%.3f, right:%.3f, bottom:%.3f, left:%.3f}"), *(_QWORD *)&self->_insets.top, *(_QWORD *)&self->_insets.right, *(_QWORD *)&self->_insets.bottom, *(_QWORD *)&self->_insets.left);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", insets:%@, important: %@}"), v5, v6, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_insets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_insets, &v3, 32, 1, 0);
}

- (unint64_t)edgeFlag
{
  return self->_edgeFlag;
}

- (void)setEdgeFlag:(unint64_t)a3
{
  self->_edgeFlag = a3;
}

- (BOOL)insetsFound
{
  return self->_insetsFound;
}

- (void)setInsetsFound:(BOOL)a3
{
  self->_insetsFound = a3;
}

@end
