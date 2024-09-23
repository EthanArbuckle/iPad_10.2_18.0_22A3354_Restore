@implementation CSHomeAffordanceComponent

- (CSHomeAffordanceComponent)init
{
  CSHomeAffordanceComponent *v2;
  CSHomeAffordanceComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSHomeAffordanceComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 12);
    -[CSHomeAffordanceComponent setSuppressTeachableMomentsAnimation:](v3, "setSuppressTeachableMomentsAnimation:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)viewStyle:(unint64_t)a3
{
  -[CSHomeAffordanceComponent setViewStyle:](self, "setViewStyle:", a3);
  return self;
}

- (id)suppressTeachableMomentsAnimation:(int64_t)a3
{
  -[CSHomeAffordanceComponent setSuppressTeachableMomentsAnimation:](self, "setSuppressTeachableMomentsAnimation:", a3);
  return self;
}

- (void)setViewStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CSComponent value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CSComponent setValue:](self, "setValue:", v8);

  }
}

- (void)setSuppressTeachableMomentsAnimation:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

- (unint64_t)viewStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CSComponent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 1;

  return v4;
}

@end
