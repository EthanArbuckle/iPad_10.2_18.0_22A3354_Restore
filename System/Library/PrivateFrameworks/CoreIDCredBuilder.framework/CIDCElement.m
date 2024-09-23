@implementation CIDCElement

- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CIDCElement *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CIDCElement;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[CIDCElement init](&v24, sel_init);
  -[CIDCElement setElementIdentifier:](v22, "setElementIdentifier:", v21, v24.receiver, v24.super_class);

  -[CIDCElement setStringValue:](v22, "setStringValue:", v20);
  -[CIDCElement setDateValue:](v22, "setDateValue:", v18);

  -[CIDCElement setDataValue:](v22, "setDataValue:", v19);
  -[CIDCElement setNumberValue:](v22, "setNumberValue:", v17);

  -[CIDCElement setArrayValue:](v22, "setArrayValue:", v16);
  -[CIDCElement setDictionaryValue:](v22, "setDictionaryValue:", v15);

  return v22;
}

- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, a4, 0, 0, 0, 0, 0);
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, 0, a4, 0, 0, 0, 0);
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, 0, 0, a4, 0, 0, 0);
}

- (CIDCElement)initWithElementIdentifier:(id)a3 numberValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, 0, 0, 0, a4, 0, 0);
}

- (CIDCElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, 0, 0, 0, 0, a4, 0);
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4
{
  return -[CIDCElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:", a3, 0, 0, 0, 0, 0, a4);
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_elementIdentifier, a3);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
  objc_storeStrong((id *)&self->_numberValue, a3);
}

- (NSArray)arrayValue
{
  return self->_arrayValue;
}

- (void)setArrayValue:(id)a3
{
  objc_storeStrong((id *)&self->_arrayValue, a3);
}

- (NSDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
