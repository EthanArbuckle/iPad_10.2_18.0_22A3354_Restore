@implementation Complex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4
{
  id v7;
  id v8;
  Complex *v9;
  Complex *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)Complex;
  v9 = -[Complex init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_real, a3);
    objc_storeStrong((id *)&v10->_imag, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[Complex real](self, "real");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[Complex imag](self, "imag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithRealPart:imagPart:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_real, CFSTR("realValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imag, CFSTR("imagValue"));

}

- (Complex)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Complex *v7;
  Complex *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("realValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imagValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)Complex;
  v7 = -[Complex init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[Complex setReal:](v7, "setReal:", v5);
    -[Complex setImag:](v8, "setImag:", v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSNumber *real;
  void *v8;
  NSNumber *v9;
  BOOL v10;
  NSNumber *imag;
  void *v12;
  NSNumber *v13;
  BOOL v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = v5;
  real = self->_real;
  if (real)
    goto LABEL_5;
  objc_msgSend(v5, "real");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    real = self->_real;
LABEL_5:
    objc_msgSend(v6, "real");
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v10 = real == v9;

    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:
  imag = self->_imag;
  if (!imag)
  {
    objc_msgSend(v6, "imag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = 1;
      goto LABEL_10;
    }
    imag = self->_imag;
  }
  objc_msgSend(v6, "imag");
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = imag == v13;

LABEL_10:
  v15 = v10 && v14;

LABEL_12:
  return v15;
}

- (id)description
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSNumber doubleValue](self->_real, "doubleValue");
  v5 = (int)v4;
  -[NSNumber doubleValue](self->_imag, "doubleValue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("RealVal=%d, ImagVal=%d"), v5, (int)v6);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_real, "hash");
  return -[NSNumber hash](self->_imag, "hash") ^ v3;
}

- (NSNumber)real
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)imag
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imag, 0);
  objc_storeStrong((id *)&self->_real, 0);
}

@end
