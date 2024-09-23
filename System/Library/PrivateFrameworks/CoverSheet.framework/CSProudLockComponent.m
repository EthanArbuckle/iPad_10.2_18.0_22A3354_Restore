@implementation CSProudLockComponent

- (CSProudLockComponent)init
{
  CSProudLockComponent *v2;
  CSProudLockComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSProudLockComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 11);
    -[CSProudLockComponent _setUnsignedIntegerValue:](v3, 0);
  }
  return v3;
}

- (void)_setUnsignedIntegerValue:(void *)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:", v3);

  }
}

- (id)optOutOfAlphaFadesForPageScroll:(int64_t)a3
{
  -[CSProudLockComponent setOptOutOfAlphaFadesForPageScroll:](self, "setOptOutOfAlphaFadesForPageScroll:", a3);
  return self;
}

- (id)shouldResideInALowerSubview:(BOOL)a3
{
  -[CSProudLockComponent setShouldResideInALowerSubview:](self, "setShouldResideInALowerSubview:", a3);
  return self;
}

- (id)prefersInlineCoaching:(BOOL)a3
{
  -[CSProudLockComponent setPrefersInlineCoaching:](self, "setPrefersInlineCoaching:", a3);
  return self;
}

- (void)setOptOutOfAlphaFadesForPageScroll:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

- (BOOL)shouldResideInALowerSubview
{
  void *v2;
  BOOL v3;

  -[CSComponent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue") & 1;

  return v3;
}

- (void)setShouldResideInALowerSubview:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[CSComponent value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[CSProudLockComponent _setUnsignedIntegerValue:](self, v6 & 0xFFFFFFFFFFFFFFFELL | v3);
}

- (BOOL)prefersInlineCoaching
{
  void *v2;
  unint64_t v3;

  -[CSComponent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (v3 >> 1) & 1;
}

- (void)setPrefersInlineCoaching:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  -[CSComponent value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = 2;
  if (!v3)
    v7 = 0;
  -[CSProudLockComponent _setUnsignedIntegerValue:](self, v6 & 0xFFFFFFFFFFFFFFFDLL | v7);
}

@end
