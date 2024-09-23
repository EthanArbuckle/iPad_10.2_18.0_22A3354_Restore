@implementation HIDAnalyticsEventField

- (HIDAnalyticsEventField)initWithName:(id)a3
{
  id v5;
  HIDAnalyticsEventField *v6;
  HIDAnalyticsEventField *v7;
  HIDAnalyticsEventField *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDAnalyticsEventField;
  v6 = -[HIDAnalyticsEventField init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fieldName, a3);
    v8 = v7;
  }

  return v7;
}

- (id)value
{
  NSString *stringValue;

  stringValue = self->stringValue;
  if (stringValue)
    return stringValue;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->integerValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setIntegerValue:(unint64_t)a3
{
  self->integerValue = a3;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->stringValue, a3);
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->stringValue, 0);
}

@end
