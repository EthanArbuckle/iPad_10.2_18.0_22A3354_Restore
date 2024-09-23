@implementation IKCSSRule

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IKCSSRule declarationList](self, "declarationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDeclarationList:", v6);

  -[IKCSSRule selectorList](self, "selectorList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSelectorList:", v8);

  return v4;
}

- (IKCSSMediaQuery)mediaQuery
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  -[IKCSSRule selectorList](self, "selectorList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IKCSSRule selectorList](self, "selectorList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("null");
  }
  -[IKCSSRule declarationList](self, "declarationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IKCSSRule declarationList](self, "declarationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("null");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{selectorList: %@, declarationList: %@}"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IKCSSSelectorList)selectorList
{
  return self->_selectorList;
}

- (void)setSelectorList:(id)a3
{
  objc_storeStrong((id *)&self->_selectorList, a3);
}

- (IKCSSDeclarationList)declarationList
{
  return self->_declarationList;
}

- (void)setDeclarationList:(id)a3
{
  objc_storeStrong((id *)&self->_declarationList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationList, 0);
  objc_storeStrong((id *)&self->_selectorList, 0);
}

@end
