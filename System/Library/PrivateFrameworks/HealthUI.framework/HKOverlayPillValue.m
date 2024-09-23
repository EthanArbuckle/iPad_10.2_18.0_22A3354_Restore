@implementation HKOverlayPillValue

- (HKOverlayPillValue)initWithValueString:(id)a3 unitString:(id)a4
{
  id v7;
  id v8;
  HKOverlayPillValue *v9;
  HKOverlayPillValue *v10;
  NSAttributedString *attributedValue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKOverlayPillValue;
  v9 = -[HKOverlayPillValue init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueString, a3);
    objc_storeStrong((id *)&v10->_unitString, a4);
    attributedValue = v10->_attributedValue;
    v10->_attributedValue = 0;

  }
  return v10;
}

- (HKOverlayPillValue)initWithAttributedValue:(id)a3
{
  id v5;
  HKOverlayPillValue *v6;
  HKOverlayPillValue *v7;
  NSString *valueString;
  NSString *unitString;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayPillValue;
  v6 = -[HKOverlayPillValue init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    valueString = v6->_valueString;
    v6->_valueString = 0;

    unitString = v7->_unitString;
    v7->_unitString = 0;

    objc_storeStrong((id *)&v7->_attributedValue, a3);
  }

  return v7;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (NSAttributedString)attributedValue
{
  return self->_attributedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedValue, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

@end
