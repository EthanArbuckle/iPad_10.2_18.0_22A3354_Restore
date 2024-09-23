@implementation ICAuthorHighlightValue

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
  -[ICAuthorHighlightValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightValue color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightValue isAboveImplicitHighlights](self, "isAboveImplicitHighlights"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, value: %@, color: %@, aboveImplicitHighlights: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthorHighlightValue value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      LOBYTE(v17) = 0;
LABEL_22:

      return v17;
    }
    -[ICAuthorHighlightValue color](self, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v8)
      v11 = 0;
    else
      v11 = v8;
    v12 = v11;
    if (v10 == v9)
      v13 = 0;
    else
      v13 = v9;
    v14 = v13;
    if (!(v12 | v14))
      goto LABEL_19;
    v15 = (void *)v14;
    if (v12)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {

    }
    else
    {
      v18 = objc_msgSend((id)v12, "isEqual:", v14);

      if (v18)
      {
LABEL_19:
        v19 = objc_msgSend(v5, "isAboveImplicitHighlights");
        v17 = v19 ^ -[ICAuthorHighlightValue isAboveImplicitHighlights](self, "isAboveImplicitHighlights") ^ 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v17) = 0;
    goto LABEL_21;
  }
  LOBYTE(v17) = 1;
  return v17;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAboveImplicitHighlights
{
  return self->_aboveImplicitHighlights;
}

- (void)setAboveImplicitHighlights:(BOOL)a3
{
  self->_aboveImplicitHighlights = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
