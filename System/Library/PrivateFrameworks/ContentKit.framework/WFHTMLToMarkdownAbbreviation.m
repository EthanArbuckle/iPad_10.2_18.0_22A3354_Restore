@implementation WFHTMLToMarkdownAbbreviation

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFHTMLToMarkdownAbbreviation abbreviation](self, "abbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFHTMLToMarkdownAbbreviation *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFHTMLToMarkdownAbbreviation *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFHTMLToMarkdownAbbreviation abbreviation](self, "abbreviation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHTMLToMarkdownAbbreviation abbreviation](v4, "abbreviation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (void)setAbbreviation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
