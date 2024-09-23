@implementation HKHRAFibBurdenHeader

- (HKHRAFibBurdenHeader)initWithText:(id)a3
{
  id v4;
  HKHRAFibBurdenHeader *v5;
  HKHRAFibBurdenHeader *v6;
  HKHRAFibBurdenHeader *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenHeader;
  v5 = -[HKHRAFibBurdenHeader init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKHRAFibBurdenHeader setHeaderText:](v5, "setHeaderText:", v4);
    v7 = v6;
  }

  return v6;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_headerText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end
