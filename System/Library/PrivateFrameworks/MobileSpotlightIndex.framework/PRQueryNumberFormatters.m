@implementation PRQueryNumberFormatters

- (PRQueryNumberFormatters)initWithLocale:(id)a3
{
  PRQueryNumberFormatters *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  NSNumberFormatter *v7;
  NSNumberFormatter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRQueryNumberFormatters;
  v4 = -[PRQueryNumberFormatters init](&v10, sel_init);
  if (v4)
  {
    v4->_locale = (NSLocale *)a3;
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4->_numberFormatter = v5;
    -[NSNumberFormatter setLocale:](v5, "setLocale:", a3);
    v6 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4->_decimalFormatter = v6;
    -[NSNumberFormatter setLocale:](v6, "setLocale:", a3);
    -[NSNumberFormatter setNumberStyle:](v4->_decimalFormatter, "setNumberStyle:", 1);
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4->_currencyFormatter = v7;
    -[NSNumberFormatter setLocale:](v7, "setLocale:", a3);
    -[NSNumberFormatter setNumberStyle:](v4->_currencyFormatter, "setNumberStyle:", 2);
    -[NSNumberFormatter setMinimumFractionDigits:](v4->_currencyFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setUsesGroupingSeparator:](v4->_currencyFormatter, "setUsesGroupingSeparator:", 0);
    -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](v4->_currencyFormatter, "setAlwaysShowsDecimalSeparator:", 0);
    v8 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4->_currencyDecimalFormatter = v8;
    -[NSNumberFormatter setLocale:](v8, "setLocale:", a3);
    -[NSNumberFormatter setNumberStyle:](v4->_currencyDecimalFormatter, "setNumberStyle:", 2);
    -[NSNumberFormatter setMinimumFractionDigits:](v4->_currencyDecimalFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setAlwaysShowsDecimalSeparator:](v4->_currencyDecimalFormatter, "setAlwaysShowsDecimalSeparator:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRQueryNumberFormatters;
  -[PRQueryNumberFormatters dealloc](&v3, sel_dealloc);
}

@end
