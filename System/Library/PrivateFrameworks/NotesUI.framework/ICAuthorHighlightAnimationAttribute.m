@implementation ICAuthorHighlightAnimationAttribute

- (ICAuthorHighlightAnimationAttribute)initWithStartDate:(id)a3
{
  id v5;
  ICAuthorHighlightAnimationAttribute *v6;
  ICAuthorHighlightAnimationAttribute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAuthorHighlightAnimationAttribute;
  v6 = -[ICAuthorHighlightAnimationAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_startDate, a3);

  return v7;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute duration](self, "duration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute fromValue](self, "fromValue");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute toValue](self, "toValue");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute color](self, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, startDate: %@, duration: %@, fromValue: %@, toValue: %@, color: %@, aboveExistingHighlights: %@, removedOnCompletion: %@>"), v5, self, v6, v8, v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;

  if (a3 == self)
  {
    LOBYTE(v28) = 1;
    return v28;
  }
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v5, "duration");
    v9 = v8;
    -[ICAuthorHighlightAnimationAttribute duration](self, "duration");
    if (v9 == v10)
    {
      objc_msgSend(v5, "fromValue");
      v12 = v11;
      -[ICAuthorHighlightAnimationAttribute fromValue](self, "fromValue");
      if (v12 == v13)
      {
        objc_msgSend(v5, "toValue");
        v15 = v14;
        -[ICAuthorHighlightAnimationAttribute toValue](self, "toValue");
        if (v15 == v16)
        {
          -[ICAuthorHighlightAnimationAttribute color](self, "color");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "color");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)*MEMORY[0x1E0C9B0D0];
          if ((void *)*MEMORY[0x1E0C9B0D0] == v17)
            v20 = 0;
          else
            v20 = v17;
          v21 = v20;
          if (v19 == v18)
            v22 = 0;
          else
            v22 = v18;
          v23 = v22;
          if (!(v21 | v23))
            goto LABEL_16;
          v24 = (void *)v23;
          if (!v21 || !v23)
          {

            goto LABEL_23;
          }
          v25 = objc_msgSend((id)v21, "isEqual:", v23);

          if (v25)
          {
LABEL_16:
            v26 = objc_msgSend(v5, "isAboveExistingHighlights");
            if (v26 == -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"))
            {
              v27 = objc_msgSend(v5, "isRemovedOnCompletion");
              v28 = v27 ^ -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion") ^ 1;
LABEL_24:

              goto LABEL_19;
            }
          }
LABEL_23:
          LOBYTE(v28) = 0;
          goto LABEL_24;
        }
      }
    }
  }
  LOBYTE(v28) = 0;
LABEL_19:

  return v28;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;

  -[ICAuthorHighlightAnimationAttribute startDate](self, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v23, "hash");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute duration](self, "duration");
  objc_msgSend(v3, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v22, "hash");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute fromValue](self, "fromValue");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightAnimationAttribute toValue](self, "toValue");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  -[ICAuthorHighlightAnimationAttribute color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  v18 = ICHashWithHashKeys(v21, v11, v12, v13, v14, v15, v16, v17, v20);

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICAuthorHighlightAnimationAttribute *v4;
  void *v5;
  void *v6;

  v4 = -[ICAuthorHighlightAnimationAttribute init](+[ICAuthorHighlightAnimationAttribute allocWithZone:](ICAuthorHighlightAnimationAttribute, "allocWithZone:", a3), "init");
  -[ICAuthorHighlightAnimationAttribute startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute setStartDate:](v4, "setStartDate:", v5);

  -[ICAuthorHighlightAnimationAttribute duration](self, "duration");
  -[ICAuthorHighlightAnimationAttribute setDuration:](v4, "setDuration:");
  -[ICAuthorHighlightAnimationAttribute fromValue](self, "fromValue");
  -[ICAuthorHighlightAnimationAttribute setFromValue:](v4, "setFromValue:");
  -[ICAuthorHighlightAnimationAttribute toValue](self, "toValue");
  -[ICAuthorHighlightAnimationAttribute setToValue:](v4, "setToValue:");
  -[ICAuthorHighlightAnimationAttribute color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute setColor:](v4, "setColor:", v6);

  -[ICAuthorHighlightAnimationAttribute setAboveExistingHighlights:](v4, "setAboveExistingHighlights:", -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  -[ICAuthorHighlightAnimationAttribute setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(double)a3
{
  self->_fromValue = a3;
}

- (double)toValue
{
  return self->_toValue;
}

- (void)setToValue:(double)a3
{
  self->_toValue = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
