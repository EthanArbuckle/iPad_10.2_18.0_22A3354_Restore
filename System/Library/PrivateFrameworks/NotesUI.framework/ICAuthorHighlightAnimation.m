@implementation ICAuthorHighlightAnimation

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation duration](self, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation fromValue](self, "fromValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation toValue](self, "toValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimation isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, duration: %@, fromValue: %@, toValue: %@, color: %@, aboveExistingHighlights: %@, removedOnCompletion: %@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v25;
  void *v26;
  void *v27;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "duration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthorHighlightAnimation duration](self, "duration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      LOBYTE(v23) = 0;
LABEL_26:

      return v23;
    }
    objc_msgSend(v5, "fromValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthorHighlightAnimation fromValue](self, "fromValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      LOBYTE(v23) = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v5, "toValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthorHighlightAnimation toValue](self, "toValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:", v11))
    {
      LOBYTE(v23) = 0;
LABEL_24:

      goto LABEL_25;
    }
    v25 = v10;
    -[ICAuthorHighlightAnimation color](self, "color");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C9B0D0];
    v27 = (void *)v12;
    if (*MEMORY[0x1E0C9B0D0] == v12)
      v15 = 0;
    else
      v15 = (void *)v12;
    v16 = v15;
    v26 = (void *)v13;
    if (v14 == v13)
      v17 = 0;
    else
      v17 = (void *)v13;
    v18 = v17;
    if (!(v16 | v18))
      goto LABEL_15;
    v19 = (void *)v18;
    if (!v16 || !v18)
    {

      goto LABEL_22;
    }
    v20 = objc_msgSend((id)v16, "isEqual:", v18);

    if (v20)
    {
LABEL_15:
      v21 = objc_msgSend(v5, "isAboveExistingHighlights");
      if (v21 == -[ICAuthorHighlightAnimation isAboveExistingHighlights](self, "isAboveExistingHighlights"))
      {
        v22 = objc_msgSend(v5, "isRemovedOnCompletion");
        v23 = v22 ^ -[ICAuthorHighlightAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion") ^ 1;
LABEL_23:
        v10 = v25;

        goto LABEL_24;
      }
    }
LABEL_22:
    LOBYTE(v23) = 0;
    goto LABEL_23;
  }
  LOBYTE(v23) = 1;
  return v23;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isAboveExistingHighlights
{
  return self->_aboveExistingHighlights;
}

- (void)setAboveExistingHighlights:(BOOL)a3
{
  self->_aboveExistingHighlights = a3;
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  self->_removedOnCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
