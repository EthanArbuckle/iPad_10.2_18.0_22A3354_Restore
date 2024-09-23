@implementation KMFieldValue

- (KMFieldValue)initWithFieldType:(int64_t)a3 value:(id)a4
{
  id v7;
  KMFieldValue *v8;
  KMFieldValue *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KMFieldValue;
  v8 = -[KMFieldValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fieldType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
