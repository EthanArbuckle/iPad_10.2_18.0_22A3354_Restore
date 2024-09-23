@implementation IKCSSDeclarationTransform

- (IKCSSDeclarationTransform)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v5;
  IKCSSDeclarationTransform *v6;
  IKCSSDeclarationTransform *v7;
  __int128 v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  uint64_t v27;
  char v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  IKCSSDeclarationTransform *v37;
  id v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  objc_super v42;

  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)IKCSSDeclarationTransform;
  v6 = -[IKCSSDeclarationTransform init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    v37 = v6;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v41.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v41.c = v8;
    *(_OWORD *)&v41.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v38 = v5;
    objc_msgSend(v5, "cssValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
      goto LABEL_36;
    v10 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") == 1)
      {
        objc_msgSend(v11, "token");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 == 1)
          goto LABEL_35;
      }
      if (objc_msgSend(v11, "type") != 7)
        goto LABEL_35;
      v14 = v11;
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("rotate"));

      if (v16)
      {
        objc_msgSend(v14, "cssValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v18 = 0;
          do
          {
            objc_msgSend(v17, "objectAtIndex:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "type") == 1)
            {
              objc_msgSend(v19, "token");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "type") == 13)
              {
                objc_msgSend(v20, "doubleValue");
                v40 = v41;
                CGAffineTransformRotate(&v41, &v40, v21 * 0.0174532925);
              }

            }
            ++v18;
          }
          while (v18 < objc_msgSend(v17, "count"));
        }
        goto LABEL_33;
      }
      objc_msgSend(v14, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("scale")))
      {

      }
      else
      {
        objc_msgSend(v14, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("translate"));

        if (!v24)
          goto LABEL_34;
      }
      objc_msgSend(v14, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("scale"));

      objc_msgSend(v14, "cssValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "count"))
        goto LABEL_33;
      v27 = 0;
      v28 = 0;
      v29 = 0.0;
      v30 = 0.0;
      while (1)
      {
        objc_msgSend(v17, "objectAtIndex:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "type") == 1)
          break;
LABEL_26:

        if (++v27 >= (unint64_t)objc_msgSend(v17, "count"))
        {
          if ((v28 & 1) == 0)
            goto LABEL_33;
          if (v26)
            goto LABEL_29;
          goto LABEL_31;
        }
      }
      objc_msgSend(v31, "token");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "type") != 13)
        goto LABEL_25;
      objc_msgSend(v32, "doubleValue");
      v34 = v33;
      if ((v28 & 1) == 0)
        break;

      v29 = v34;
      if (v26)
      {
LABEL_29:
        v39 = v41;
        CGAffineTransformScale(&v40, &v39, v30, v29);
        goto LABEL_32;
      }
LABEL_31:
      v39 = v41;
      CGAffineTransformTranslate(&v40, &v39, v30, v29);
LABEL_32:
      v41 = v40;
LABEL_33:

LABEL_34:
LABEL_35:
      ++v10;

      if (v10 >= objc_msgSend(v9, "count"))
      {
LABEL_36:
        v40 = v41;
        v7 = v37;
        -[IKCSSDeclarationTransform setTransform:](v37, "setTransform:", &v40);

        v5 = v38;
        goto LABEL_37;
      }
    }
    objc_msgSend(v32, "doubleValue");
    v29 = v35;
    v28 = 1;
    v30 = v34;
LABEL_25:

    goto LABEL_26;
  }
LABEL_37:

  return v7;
}

- (id)stringValue
{
  CGAffineTransform v3;

  -[IKCSSDeclarationTransform transform](self, "transform");
  NSStringFromCGAffineTransform(&v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_transform, a3, 48, 1, 0);
}

@end
