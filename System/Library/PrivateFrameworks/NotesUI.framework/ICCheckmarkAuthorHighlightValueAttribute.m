@implementation ICCheckmarkAuthorHighlightValueAttribute

- (ICCheckmarkAuthorHighlightValueAttribute)init
{
  ICCheckmarkAuthorHighlightValueAttribute *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCheckmarkAuthorHighlightValueAttribute;
  result = -[ICCheckmarkAuthorHighlightValueAttribute init](&v3, sel_init);
  if (result)
    result->_foregroundAlpha = 1.0;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCheckmarkAuthorHighlightValueAttribute foregroundAlpha](self, "foregroundAlpha");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCheckmarkAuthorHighlightValueAttribute highlightColor](self, "highlightColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, foregroundAlpha: %@, highlightColor: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "foregroundAlpha");
  v7 = v6;
  -[ICCheckmarkAuthorHighlightValueAttribute foregroundAlpha](self, "foregroundAlpha");
  if (v7 == v8)
  {
    objc_msgSend(v5, "highlightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCheckmarkAuthorHighlightValueAttribute highlightColor](self, "highlightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCheckmarkAuthorHighlightValueAttribute foregroundAlpha](self, "foregroundAlpha");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[ICCheckmarkAuthorHighlightValueAttribute highlightColor](self, "highlightColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v15 = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCheckmarkAuthorHighlightValueAttribute *v4;
  void *v5;

  v4 = -[ICCheckmarkAuthorHighlightValueAttribute init](+[ICCheckmarkAuthorHighlightValueAttribute allocWithZone:](ICCheckmarkAuthorHighlightValueAttribute, "allocWithZone:", a3), "init");
  -[ICCheckmarkAuthorHighlightValueAttribute foregroundAlpha](self, "foregroundAlpha");
  -[ICCheckmarkAuthorHighlightValueAttribute setForegroundAlpha:](v4, "setForegroundAlpha:");
  -[ICCheckmarkAuthorHighlightValueAttribute highlightColor](self, "highlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCheckmarkAuthorHighlightValueAttribute setHighlightColor:](v4, "setHighlightColor:", v5);

  return v4;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
