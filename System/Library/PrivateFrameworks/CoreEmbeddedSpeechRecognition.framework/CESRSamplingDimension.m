@implementation CESRSamplingDimension

- (CESRSamplingDimension)initWithAsrLocale:(id)a3
{
  id v5;
  CESRSamplingDimension *v6;
  CESRSamplingDimension *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CESRSamplingDimension;
  v6 = -[CESRSamplingDimension init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_asrLocale, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CESRSamplingDimension asrLocale](self, "asrLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("< asrLocale=%@ >"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)matches:(id)a3
{
  CESRSamplingDimension *v4;
  NSString *asrLocale;
  void *v6;
  char v7;

  v4 = (CESRSamplingDimension *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_7;
  }
  asrLocale = self->_asrLocale;
  if (!asrLocale)
  {
LABEL_5:
    v7 = 1;
  }
  else
  {
    -[CESRSamplingDimension asrLocale](v4, "asrLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](asrLocale, "isEqual:", v6);

  }
LABEL_7:

  return v7;
}

- (NSString)asrLocale
{
  return self->_asrLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrLocale, 0);
}

@end
