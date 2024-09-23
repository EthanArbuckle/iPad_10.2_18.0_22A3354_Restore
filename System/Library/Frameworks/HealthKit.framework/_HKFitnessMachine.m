@implementation _HKFitnessMachine

- (_HKFitnessMachine)initWithType:(unint64_t)a3 identifier:(id)a4
{
  id v7;
  _HKFitnessMachine *v8;
  _HKFitnessMachine *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKFitnessMachine;
  v8 = -[_HKFitnessMachine init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    v9->_type = a3;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t type;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 6)
    v8 = 0;
  else
    v8 = off_1E37F3190[type];
  -[HKDevice name](self->_device, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKWorkout _stringFromWorkoutActivityType:](HKWorkout, "_stringFromWorkoutActivityType:", self->_activityType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ %@ %@ %@"), v5, self, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (void)_setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)_setBrand:(id)a3
{
  objc_storeStrong((id *)&self->_brand, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKFitnessMachine)initWithCoder:(id)a3
{
  id v4;
  _HKFitnessMachine *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  HKDevice *device;
  uint64_t v10;
  NSString *brand;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKFitnessMachine;
  v5 = -[_HKFitnessMachine init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Device"));
    v8 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Brand"));
    v10 = objc_claimAutoreleasedReturnValue();
    brand = v5->_brand;
    v5->_brand = (NSString *)v10;

    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WorkoutActivityType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("Device"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brand, CFSTR("Brand"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activityType, CFSTR("WorkoutActivityType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:identifier:", self->_type, self->_identifier);
  v5 = -[HKDevice copy](self->_device, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_brand, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v4[3] = self->_activityType;
  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (HKDevice)device
{
  return self->_device;
}

- (NSString)brand
{
  return self->_brand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
