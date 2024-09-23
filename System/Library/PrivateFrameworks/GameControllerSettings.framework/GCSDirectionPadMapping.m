@implementation GCSDirectionPadMapping

- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCSDirectionPadMapping;
  return -[GCSElementMapping initWithElementKey:mappingKey:remappingOrder:](&v6, sel_initWithElementKey_mappingKey_remappingOrder_, a3, a4, *(_QWORD *)&a5);
}

- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5 invertHorizontally:(BOOL)a6 invertVertically:(BOOL)a7 swapAxes:(BOOL)a8
{
  GCSDirectionPadMapping *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCSDirectionPadMapping;
  result = -[GCSElementMapping initWithElementKey:mappingKey:remappingOrder:](&v12, sel_initWithElementKey_mappingKey_remappingOrder_, a3, a4, *(_QWORD *)&a5);
  if (result)
  {
    result->_invertHorizontally = a6;
    result->_invertVertically = a7;
    result->_swapAxes = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCSDirectionPadMapping;
  v4 = -[GCSElementMapping copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInvertHorizontally:", -[GCSDirectionPadMapping invertHorizontally](self, "invertHorizontally"));
  objc_msgSend(v4, "setInvertVertically:", -[GCSDirectionPadMapping invertVertically](self, "invertVertically"));
  objc_msgSend(v4, "setSwapAxes:", -[GCSDirectionPadMapping swapAxes](self, "swapAxes"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[GCSElementMapping elementKey](self, "elementKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCSElementMapping mappingKey](self, "mappingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSDirectionPadMapping: elementKey=%@, mappingKey=%@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isCustomized
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCSDirectionPadMapping;
  return -[GCSElementMapping isCustomized](&v4, sel_isCustomized)
      || self->_invertHorizontally
      || self->_invertVertically
      || self->_swapAxes;
}

- (BOOL)invertHorizontally
{
  return self->_invertHorizontally;
}

- (void)setInvertHorizontally:(BOOL)a3
{
  self->_invertHorizontally = a3;
}

- (BOOL)invertVertically
{
  return self->_invertVertically;
}

- (void)setInvertVertically:(BOOL)a3
{
  self->_invertVertically = a3;
}

- (BOOL)swapAxes
{
  return self->_swapAxes;
}

- (void)setSwapAxes:(BOOL)a3
{
  self->_swapAxes = a3;
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

- (GCSDirectionPadMapping)initWithCoder:(id)a3
{
  id v4;
  GCSDirectionPadMapping *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCSDirectionPadMapping;
  v5 = -[GCSElementMapping initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_invertHorizontally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_invertHorizontally"));
    v5->_invertVertically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_invertVertically"));
    v5->_swapAxes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_swapAxes"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCSDirectionPadMapping;
  v4 = a3;
  -[GCSElementMapping encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_invertHorizontally, CFSTR("_invertHorizontally"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_invertVertically, CFSTR("_invertVertically"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_swapAxes, CFSTR("_swapAxes"));

}

- (GCSDirectionPadMapping)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSDirectionPadMapping *v6;
  void *v7;
  void *v8;
  void *v9;
  GCSDirectionPadMapping *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)GCSDirectionPadMapping;
    v6 = -[GCSElementMapping initWithJSONObject:](&v12, sel_initWithJSONObject_, v5);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("invertHorizontally"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_invertHorizontally = objc_msgSend(v7, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("invertVertically"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_invertVertically = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("swapAxes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_swapAxes = objc_msgSend(v9, "BOOLValue");

    }
    self = v6;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)GCSDirectionPadMapping;
  -[GCSElementMapping jsonObject](&v10, sel_jsonObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionary](&off_254DF4A00, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  v11[0] = CFSTR("invertHorizontally");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_invertHorizontally);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("invertVertically");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_invertVertically);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("swapAxes");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_swapAxes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v8);

  return v4;
}

@end
