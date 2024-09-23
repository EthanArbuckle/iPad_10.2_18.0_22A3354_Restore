@implementation NRMutableDeviceProperty

+ (id)enclosedClassTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;

  v14 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v14, "setWithObjects:", v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  id v4;
  id v5;
  NRDevicePropertyDiff *v6;

  v4 = a3;
  v6 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v4);

  v5 = -[NRMutableDeviceProperty applyDiff:upOnly:notifyParent:unconditional:](self, "applyDiff:upOnly:notifyParent:unconditional:", v6, 0, 1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRMutableDeviceProperty)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRMutableDeviceProperty;
  return -[NRMutableStateBase init](&v3, sel_init);
}

- (NRMutableDeviceProperty)initWithValue:(id)a3
{
  id v5;
  NRMutableDeviceProperty *v6;
  NRMutableDeviceProperty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRMutableDeviceProperty;
  v6 = -[NRMutableStateBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (NRMutableDeviceProperty)initWithProtobuf:(id)a3
{
  id v4;
  NRMutableDeviceProperty *v5;
  void *v6;
  uint64_t v7;
  NSObject *value;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRMutableDeviceProperty;
  v5 = -[NRMutableStateBase init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRDevicePropertyDiff unpackPropertyValue:](NRDevicePropertyDiff, "unpackPropertyValue:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = v7;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_value, CFSTR("property value"), v5);
  }

  return v5;
}

- (NRPBMutableDeviceProperty)protobuf
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  +[NRDevicePropertyDiff packPropertyValue:](NRDevicePropertyDiff, "packPropertyValue:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:", v4);

  return (NRPBMutableDeviceProperty *)v3;
}

- (NRMutableDeviceProperty)initWithCoder:(id)a3
{
  id v4;
  NRMutableDeviceProperty *v5;
  uint64_t v6;
  void *v7;
  NRPBMutableDeviceProperty *v8;
  NRMutableDeviceProperty *v9;
  void *v10;
  uint64_t v11;
  NSObject *value;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NRMutableDeviceProperty;
  v5 = -[NRMutableStateBase init](&v14, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("value"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_value, CFSTR("property value"), v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBMutableDeviceProperty initWithData:]([NRPBMutableDeviceProperty alloc], "initWithData:", v6);
  v9 = -[NRMutableDeviceProperty initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRMutableDeviceProperty protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  NRDevicePropertyDiff *v7;
  _QWORD *v8;
  NRDevicePropertyDiff *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (v5 == v6 || (objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    v9 = [NRDevicePropertyDiff alloc];
    if (v8)
      v10 = v8[4];
    else
      v10 = 0;
    v7 = -[NRDevicePropertyDiff initWithValue:](v9, "initWithValue:", v10);

  }
  return v7;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  NRMutableDeviceProperty *v11;
  NRMutableDeviceProperty *v12;
  NRMutableDeviceProperty *v13;
  uint64_t v14;
  NSObject *value;
  void *v16;

  v7 = a5;
  v9 = a3;
  v10 = (void *)MEMORY[0x1A1B01C40]();
  v11 = self;
  v12 = v11;
  v13 = v11;
  if (!a6)
  {
    v13 = -[NRMutableDeviceProperty copyWithZone:](v11, "copyWithZone:", 0);

  }
  objc_msgSend(v9, "value");
  v14 = objc_claimAutoreleasedReturnValue();
  value = v12->_value;
  v12->_value = v14;

  v16 = v9;
  if (!a6)
  {
    objc_msgSend((id)objc_opt_class(), "diffFrom:to:", v13, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v16)
  {
    if (v7)
      -[NRMutableStateBase notifyParentWithDiff:](v12, "notifyParentWithDiff:", v16);
    -[NRMutableStateBase notifyObserversWithDiff:](v12, "notifyObserversWithDiff:", v16);
  }

  objc_autoreleasePoolPop(v10);
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithValue:", self->_value);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[NSObject hash](self->_value, "hash") - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  NRMutableDeviceProperty *v4;
  NSObject *value;
  char v6;

  v4 = (NRMutableDeviceProperty *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  value = self->_value;
  if (v4->_value == value)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSObject isEqual:](value, "isEqual:");
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  char isKindOfClass;
  NSObject *value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NRTextFormattingUtilities dateFormatter:](NRTextFormattingUtilities, "dateFormatter:", self->_value);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    value = self->_value;
    if ((isKindOfClass & 1) != 0)
      -[NSObject UUIDString](value, "UUIDString");
    else
      -[NSObject description](value, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protobuf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobuf, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
