@implementation ASKAtomicBox

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (ASKAtomicBox)init
{
  return -[ASKAtomicBox initWithValue:](self, "initWithValue:", 0);
}

- (ASKAtomicBox)initWithValue:(id)a3
{
  id v4;
  ASKAtomicBox *v5;
  ASKAtomicBox *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASKAtomicBox;
  v5 = -[ASKAtomicBox init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ASKAtomicBox setValue:](v5, "setValue:", v4);

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ASKAtomicBox value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AtomicBox(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASKAtomicBox value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ASKAtomicBox *v4;
  ASKAtomicBox *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ASKAtomicBox *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v8 = 1;
    }
    else
    {
      v5 = v4;
      -[ASKAtomicBox value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASKAtomicBox value](v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
