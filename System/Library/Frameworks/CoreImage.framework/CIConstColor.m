@implementation CIConstColor

+ (id)alloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Alloc on %@ is not allowed"), NSStringFromClass(v4));
  return 0;
}

- (unint64_t)retainCount
{
  return 1;
}

- (unint64_t)numberOfComponents
{
  return 4;
}

- (const)components
{
  return (const double *)&self[1];
}

- (double)red
{
  return *(double *)&self[1].super.super.isa;
}

- (double)green
{
  return *(double *)&self[1].super._priv;
}

- (double)blue
{
  return *(double *)self[1].super._pad;
}

- (double)alpha
{
  return *(double *)&self[1].super._pad[1];
}

- (CGColorSpace)colorSpace
{
  if (GetDefaultColorSpace(void)::onceToken != -1)
    dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
  return (CGColorSpace *)GetDefaultColorSpace(void)::cs;
}

- (CGColor)cgColor
{
  CGColorRef v2;

  v2 = CGColorCreate(-[CIConstColor colorSpace](self, "colorSpace"), (const CGFloat *)&self[1]);
  CFAutorelease(v2);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  const double *v5;
  _QWORD *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CIConstColor components](self, "components");
    v6 = (_QWORD *)objc_msgSend(a3, "components");
    return *(_QWORD *)v5 == *v6
        && *((_QWORD *)v5 + 1) == v6[1]
        && *((_QWORD *)v5 + 2) == v6[2]
        && *((_QWORD *)v5 + 3) == v6[3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(a3, "isEqual:", self);
    else
      return 0;
  }
}

- (unint64_t)hash
{
  int v3;
  const double *v4;
  unint64_t result;
  uint64_t v6;
  double v7;

  v3 = -[CIConstColor numberOfComponents](self, "numberOfComponents");
  v4 = -[CIConstColor components](self, "components");
  result = v3;
  if (v3 >= 1)
  {
    v6 = v3;
    do
    {
      v7 = *v4++;
      result = 33 * result + (int)vcvtd_n_s64_f64(v7, 0xAuLL);
      --v6;
    }
    while (v6);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIConstColor;
  -[CIColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (CIConstColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(CGColorSpace *)a7
{
  CIConstColor *v8;

  v8 = -[CIColor initWithRed:green:blue:alpha:]([CIColor alloc], "initWithRed:green:blue:alpha:", a3, a4, a5, a6);

  return v8;
}

@end
