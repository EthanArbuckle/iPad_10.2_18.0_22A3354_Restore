@implementation NSExpressionDescription

- (_QWORD)setUnderlyingAttribute:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[18];
    if (v4 != a2)
    {

      result = a2;
      v3[18] = result;
    }
  }
  return result;
}

- (unint64_t)_propertyType
{
  return 5;
}

- (NSExpression)expression
{
  return self->_expression;
}

- (NSAttributeType)expressionResultType
{
  return self->_expressionResultType;
}

- (void)dealloc
{
  objc_super v3;

  self->_expression = 0;
  self->_underlyingAttribute = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSExpressionDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (void)setExpressionResultType:(NSAttributeType)expressionResultType
{
  self->_expressionResultType = expressionResultType;
}

- (void)setExpression:(NSExpression *)expression
{
  NSExpression *v5;

  if (self->_expression != expression)
  {
    v5 = expression;

    self->_expression = expression;
  }
}

- (NSExpressionDescription)init
{
  NSExpressionDescription *v2;
  NSExpressionDescription *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSExpressionDescription;
  v2 = -[NSPropertyDescription init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSPropertyDescription _setEntitysReferenceID:](v2, "_setEntitysReferenceID:", -1);
    -[NSPropertyDescription setReadOnly:](v3, "setReadOnly:", 1);
    v3->_reservedtype1_1 = 0;
    v3->_reservedtype1_2 = 0;
    v3->_reservedtype1_3 = 0;
    v3->_reservedtype1_4 = 0;
    v3->_reservedtype1_5 = 0;
    v3->_reservedtype1_6 = 0;
    v3->_reservedtype2_1 = 0;
    v3->_reservedtype2_2 = 0;
    v3->_underlyingAttribute = 0;
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(<%@ : %p>), name %@, expression %@, resultType %lu, userInfo %@"), objc_opt_class(), self, -[NSPropertyDescription name](self, "name"), -[NSExpressionDescription expression](self, "expression"), -[NSExpressionDescription expressionResultType](self, "expressionResultType"), -[NSPropertyDescription userInfo](self, "userInfo"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExpressionDescription)initWithCoder:(id)a3
{
  NSExpressionDescription *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSExpressionDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_expression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("NSExpression"));
    v4->_expressionResultType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSExpressionType"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSExpressionDescription;
  -[NSPropertyDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_expression, CFSTR("NSExpression"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_expressionResultType, CFSTR("NSExpressionType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSExpressionDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
  {
    v4[19] = -[NSExpression copy](self->_expression, "copy");
    v4[20] = self->_expressionResultType;
    v4[18] = self->_underlyingAttribute;
  }
  return v4;
}

- (NSString)attributeValueClassName
{
  if (self)
    self = (NSExpressionDescription *)self->_underlyingAttribute;
  return -[NSExpressionDescription attributeValueClassName](self, "attributeValueClassName");
}

- (NSString)valueTransformerName
{
  if (self)
    self = (NSExpressionDescription *)self->_underlyingAttribute;
  return -[NSExpressionDescription valueTransformerName](self, "valueTransformerName");
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  uint64_t v16;
  unsigned int v17;
  objc_super v18;

  _writeInt32IntoData(a3, 0);
  v16 = objc_msgSend(a3, "length") - 4;
  v18.receiver = self;
  v18.super_class = (Class)NSExpressionDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:](&v18, sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_, a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, self->_expressionResultType);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", self->_expression), "unsignedIntegerValue"));
  v17 = bswap32(objc_msgSend(a3, "length") - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v16, 4, &v17);
}

@end
