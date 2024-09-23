@implementation MXMSample

- (NSMeasurement)asMeasurementValue
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  -[MXMSample asNumberValue](self, "asNumberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[MXMSample unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v7, v6);

  return (NSMeasurement *)v8;
}

- (NSNumber)asNumberValue
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[MXMSample valueType](self, "valueType");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MXMSample unsignedValue](self, "unsignedValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MXMSample integerValue](self, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[MXMSample floatValue](self, "floatValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v5;
}

- (NSString)shortDesc
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MXMSample floatValue](self, "floatValue");
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[MXMSample unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "symbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%0.3f %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSUnit)unit
{
  return self->_unit;
}

- (double)floatValue
{
  double result;

  result = 0.0;
  if (self->_underlyingValueLength >= 8)
    return *(double *)-[NSData bytes](self->_underlyingValue, "bytes", 0.0);
  return result;
}

- (int64_t)integerValue
{
  if (self->_underlyingValueLength >= 8)
    return *(_QWORD *)-[NSData bytes](self->_underlyingValue, "bytes");
  else
    return 0;
}

- (unint64_t)unsignedValue
{
  if (self->_underlyingValueLength >= 8)
    return *(_QWORD *)-[NSData bytes](self->_underlyingValue, "bytes");
  else
    return 0;
}

- (id)attributeWithName:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_attributes;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5
{
  return -[MXMSample initWithTag:attributes:doubleValue:unit:](self, "initWithTag:attributes:doubleValue:unit:", a3, a4, 0, a5);
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6
{
  return -[MXMSample initWithTag:attributes:doubleValue:unit:timestamp:](self, "initWithTag:attributes:doubleValue:unit:timestamp:", a3, a4, a6, 0, a5);
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6 timestamp:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  MXMSample *v16;
  MXMSample *v17;
  uint64_t v18;
  NSData *underlyingValue;
  objc_super v21;
  double v22;

  v13 = a3;
  v14 = a4;
  v22 = a5;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MXMSample;
  v16 = -[MXMSample init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_unit, a6);
    objc_storeStrong((id *)&v17->_tag, a3);
    objc_storeStrong((id *)&v17->_attributes, a4);
    v17->_underlyingValueLength = 8;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v22, 8);
    v18 = objc_claimAutoreleasedReturnValue();
    underlyingValue = v17->_underlyingValue;
    v17->_underlyingValue = (NSData *)v18;

    v17->_timestamp = a7;
  }

  return v17;
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 pixelBufferValue:(__CVBuffer *)a5
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXMSampleTag *tag;
  id v5;

  tag = self->_tag;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tag, CFSTR("tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unit, CFSTR("unit"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", -[NSData bytes](self->_underlyingValue, "bytes"), self->_underlyingValueLength, CFSTR("underlyingValue"));

}

- (MXMSample)initWithCoder:(id)a3
{
  id v4;
  MXMSample *v5;
  uint64_t v6;
  MXMSampleTag *tag;
  uint64_t v8;
  NSUnit *unit;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSData *underlyingValue;
  unint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MXMSample;
  v5 = -[MXMSample init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v6 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unit"));
    v8 = objc_claimAutoreleasedReturnValue();
    unit = v5->_unit;
    v5->_unit = (NSUnit *)v8;

    v15 = 0;
    v10 = (void *)MEMORY[0x24BDBCE50];
    v11 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("underlyingValue"), &v15);
    objc_msgSend(v10, "dataWithBytes:length:", v11, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    underlyingValue = v5->_underlyingValue;
    v5->_underlyingValue = (NSData *)v12;

    v5->_underlyingValueLength = v15;
  }

  return v5;
}

- (id)copy
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleTag domainNameString](self->_tag, "domainNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSample floatValue](self, "floatValue");
  v8 = v7;
  -[NSUnit symbol](self->_unit, "symbol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@' %f %@>"), v5, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)convertToUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MXMSample *v8;
  void *v9;
  void *v10;
  MXMSample *v11;

  v4 = a3;
  -[MXMSample unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MXMSample asMeasurementValue](self, "asMeasurementValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "measurementByConvertingToUnit:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MXMSample alloc];
    -[MXMSample tag](self, "tag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMSample attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v11 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v8, "initWithTag:attributes:doubleValue:unit:", v9, v10, v4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSData)date
{
  return self->_date;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (unint64_t)length
{
  return self->_length;
}

- (MXMSampleTag)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_underlyingValue, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
