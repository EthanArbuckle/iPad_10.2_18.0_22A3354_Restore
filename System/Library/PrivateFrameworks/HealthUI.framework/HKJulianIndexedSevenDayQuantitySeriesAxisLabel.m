@implementation HKJulianIndexedSevenDayQuantitySeriesAxisLabel

- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4
{
  return -[HKJulianIndexedSevenDayQuantitySeriesAxisLabel initWithText:location:type:](self, "initWithText:location:type:", a3, 1, a4);
}

- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4 type:(int64_t)a5
{
  id v9;
  HKJulianIndexedSevenDayQuantitySeriesAxisLabel *v10;
  HKJulianIndexedSevenDayQuantitySeriesAxisLabel *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKJulianIndexedSevenDayQuantitySeriesAxisLabel;
  v10 = -[HKJulianIndexedSevenDayQuantitySeriesAxisLabel init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_location = a4;
    v11->_type = a5;
  }

  return v11;
}

- (double)location
{
  return self->_location;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
