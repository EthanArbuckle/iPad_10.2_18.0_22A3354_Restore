@implementation HFValueSetFormatter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stringProvider, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFValueSetFormatter stringProvider](self, "stringProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStringProvider:", v5);

  objc_msgSend(v6, "setUnitStyle:", -[HFValueSetFormatter unitStyle](self, "unitStyle"));
  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[HFValueSetFormatter stringProvider](self, "stringProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFValueSetFormatter stringProvider](self, "stringProvider");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, int64_t))v6)[2](v6, v4, -[HFValueSetFormatter unitStyle](self, "unitStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stringProvider
{
  return self->_stringProvider;
}

- (int64_t)unitStyle
{
  return self->_unitStyle;
}

+ (id)formatterWithStringProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStringProvider:", v4);

  return v5;
}

- (HFValueSetFormatter)initWithStringProvider:(id)a3
{
  id v5;
  HFValueSetFormatter *v6;
  HFValueSetFormatter *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFValueSetFormatter.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HFValueSetFormatter;
  v6 = -[HFValueSetFormatter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HFValueSetFormatter setStringProvider:](v6, "setStringProvider:", v5);
    -[HFValueSetFormatter setUnitStyle:](v7, "setUnitStyle:", 2);
  }

  return v7;
}

- (void)setUnitStyle:(int64_t)a3
{
  self->_unitStyle = a3;
}

- (void)setStringProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HFValueSetFormatter)init
{
  HFValueSetFormatter *v2;
  HFValueSetFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFValueSetFormatter;
  v2 = -[HFValueSetFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HFValueSetFormatter setUnitStyle:](v2, "setUnitStyle:", 2);
  return v3;
}

@end
