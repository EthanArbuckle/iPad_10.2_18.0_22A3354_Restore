@implementation HKWheelchairUseObject

- (id)_initWithWheelchairUse:(int64_t)a3
{
  HKWheelchairUseObject *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKWheelchairUseObject;
  v4 = -[HKWheelchairUseObject init](&v10, sel_init);
  if (v4)
  {
    +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierWheelchairUse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_validateCharacteristic:error:", v6, 0);

    if (v7)
      v8 = a3;
    else
      v8 = 0;
    v4->_wheelchairUse = v8;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWheelchairUseObject)initWithCoder:(id)a3
{
  id v4;
  HKWheelchairUseObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  HKWheelchairUseObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWheelchairUseObject;
  v5 = -[HKWheelchairUseObject init](&v12, sel_init);
  if (v5)
  {
    +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierWheelchairUse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wheelchairUse"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "_validateCharacteristic:error:", v8, 0);

    if (!v9)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v5->_wheelchairUse = v7;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_wheelchairUse, CFSTR("wheelchairUse"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t wheelchairUse;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    wheelchairUse = self->_wheelchairUse;
    v6 = wheelchairUse == objc_msgSend(v4, "wheelchairUse");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_wheelchairUse;
}

- (HKWheelchairUse)wheelchairUse
{
  return self->_wheelchairUse;
}

@end
