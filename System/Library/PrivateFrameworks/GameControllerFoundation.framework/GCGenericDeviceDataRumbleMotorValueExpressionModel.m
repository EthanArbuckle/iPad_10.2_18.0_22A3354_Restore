@implementation GCGenericDeviceDataRumbleMotorValueExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataRumbleMotorValueExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataRumbleMotorValueExpressionModel *v4;
  uint64_t v5;
  NSString *motorName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("motorName"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  motorName = v4->_motorName;
  v4->_motorName = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataRumbleMotorValueExpressionModel motorName](self, "motorName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("motorName"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v9, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataRumbleMotorValueExpressionModel motorName](self, "motorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "motorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)description
{
  return CFSTR("Rumble Motor Value Expression");
}

- (id)description
{
  void *v2;
  void *v3;

  -[GCGenericDeviceDataRumbleMotorValueExpressionModel motorName](self, "motorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(rumble-motor-value %@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataRumbleMotorValueExpressionModel motorName](self, "motorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t motorName = %@\n}"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)motorName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motorName, 0);
}

@end
