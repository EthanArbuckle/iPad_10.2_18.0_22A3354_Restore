@implementation _FPItemDecorationValueResolver

+ (id)resolverForItem:(id)a3 style:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItem:style:", v6, a4);

  return v7;
}

- (_FPItemDecorationValueResolver)initWithItem:(id)a3 style:(unint64_t)a4
{
  id v7;
  _FPItemDecorationValueResolver *v8;
  _FPItemDecorationValueResolver *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FPItemDecorationValueResolver;
  v8 = -[_FPItemDecorationValueResolver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_item, a3);
    v9->_style = a4;
  }

  return v9;
}

- (id)_formatNameComponents:(id)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = self->_style - 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_1A0B53B38[v3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a3, v4, 0);
}

- (id)fp_valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ownerNameComponents")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("mostRecentEditorNameComponents")))
  {
    if (self->_style)
      goto LABEL_4;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "substringToIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "capitalizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("preformatted%@%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(CFSTR("Components"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPItem valueForKey:](self->_item, "valueForKey:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_4:
      -[FPItem valueForKey:](self->_item, "valueForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[_FPItemDecorationValueResolver _formatNameComponents:](self, "_formatNameComponents:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    FPExtensionMatchingDictionaryForItem(self->_item, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)fp_valueForKeyPath:(id)a3
{
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v4 = objc_msgSend(a3, "fp_splitKeyPathInProperty:remainder:", &v12, &v11);
  v5 = v12;
  v6 = v11;
  v7 = 0;
  if (v4)
  {
    -[_FPItemDecorationValueResolver fp_valueForKey:](self, "fp_valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v6)
        goto LABEL_6;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "fp_valueForKeyPath:", v6);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
LABEL_6:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_FPItemDecorationValueResolver _formatNameComponents:](self, "_formatNameComponents:", v8);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = v8;
          v8 = v7;
        }
        goto LABEL_10;
      }
    }
    v7 = 0;
LABEL_10:

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
