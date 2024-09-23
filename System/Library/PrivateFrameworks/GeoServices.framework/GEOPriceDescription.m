@implementation GEOPriceDescription

- (GEOPriceDescription)initWithGEOPDPriceDescription:(id)a3
{
  id v5;
  GEOPriceDescription *v6;
  GEOPriceDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPriceDescription;
  v6 = -[GEOPriceDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geoPriceDescription, a3);

  return v7;
}

- (BOOL)hasPriceDescription
{
  _QWORD *v2;
  BOOL v3;

  -[GEOPriceDescription geoPriceDescription](self, "geoPriceDescription");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[2] != 0;
  else
    v3 = 0;

  return v3;
}

- (NSString)priceDescription
{
  id *v2;
  void *v3;

  -[GEOPriceDescription geoPriceDescription](self, "geoPriceDescription");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPriceDescription priceDescription](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOPDPriceDescription)geoPriceDescription
{
  return self->_geoPriceDescription;
}

- (void)setGeoPriceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_geoPriceDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPriceDescription, 0);
}

@end
