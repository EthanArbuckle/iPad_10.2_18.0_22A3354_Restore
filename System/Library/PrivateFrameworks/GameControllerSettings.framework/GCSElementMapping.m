@implementation GCSElementMapping

- (GCSElementMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5
{
  id v8;
  id v9;
  GCSElementMapping *v10;
  uint64_t v11;
  NSString *elementKey;
  uint64_t v13;
  NSString *mappingKey;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GCSElementMapping;
  v10 = -[GCSElementMapping init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    elementKey = v10->_elementKey;
    v10->_elementKey = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    mappingKey = v10->_mappingKey;
    v10->_mappingKey = (NSString *)v13;

    v10->_remappingOrder = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[GCSElementMapping elementKey](self, "elementKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCSElementMapping mappingKey](self, "mappingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithElementKey:mappingKey:remappingOrder:", v5, v6, -[GCSElementMapping remappingOrder](self, "remappingOrder"));

  return v7;
}

- (NSString)id
{
  return self->_elementKey;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSElementMapping: elementKey=%@, mappingKey=%@>"), self->_elementKey, self->_mappingKey);
}

- (BOOL)isCustomized
{
  return -[NSString isEqual:](self->_elementKey, "isEqual:", self->_mappingKey) ^ 1;
}

- (NSString)elementKey
{
  return self->_elementKey;
}

- (void)setElementKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)mappingKey
{
  return self->_mappingKey;
}

- (void)setMappingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)remappingOrder
{
  return self->_remappingOrder;
}

- (void)setRemappingOrder:(int)a3
{
  self->_remappingOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingKey, 0);
  objc_storeStrong((id *)&self->_elementKey, 0);
}

+ (id)archivalClasses
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class();
  v3 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSElementMapping)initWithCoder:(id)a3
{
  id v4;
  GCSElementMapping *v5;
  uint64_t v6;
  NSString *elementKey;
  uint64_t v8;
  NSString *mappingKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCSElementMapping;
  v5 = -[GCSElementMapping init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_elementKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    elementKey = v5->_elementKey;
    v5->_elementKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mappingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    mappingKey = v5->_mappingKey;
    v5->_mappingKey = (NSString *)v8;

    v5->_remappingOrder = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_remappingOrder"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *elementKey;
  id v5;

  elementKey = self->_elementKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elementKey, CFSTR("_elementKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mappingKey, CFSTR("_mappingKey"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_remappingOrder, CFSTR("_remappingOrder"));

}

- (GCSElementMapping)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSElementMapping *v6;
  uint64_t v7;
  NSString *elementKey;
  uint64_t v9;
  NSString *mappingKey;
  void *v11;
  GCSElementMapping *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)GCSElementMapping;
    v6 = -[GCSElementMapping init](&v14, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("elementKey"));
      v7 = objc_claimAutoreleasedReturnValue();
      elementKey = v6->_elementKey;
      v6->_elementKey = (NSString *)v7;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("mappingKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      mappingKey = v6->_mappingKey;
      v6->_mappingKey = (NSString *)v9;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("remappingOrder"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_remappingOrder = objc_msgSend(v11, "intValue");

    }
    self = v6;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (GCSJSONObject)jsonObject
{
  NSString *mappingKey;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("elementKey");
  v6[1] = CFSTR("mappingKey");
  mappingKey = self->_mappingKey;
  v7[0] = self->_elementKey;
  v7[1] = mappingKey;
  v6[2] = CFSTR("remappingOrder");
  +[NSNumber numberWithInt:](&off_254DF4058, "numberWithInt:", self->_remappingOrder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCSJSONObject *)v4;
}

@end
