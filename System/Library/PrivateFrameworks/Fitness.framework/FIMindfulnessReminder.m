@implementation FIMindfulnessReminder

- (FIMindfulnessReminder)initWithType:(int64_t)a3
{
  return -[FIMindfulnessReminder initWithType:customDateComponents:customWeekdaySelection:enabled:](self, "initWithType:customDateComponents:customWeekdaySelection:enabled:", a3, 0, 0, 1);
}

- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4
{
  return -[FIMindfulnessReminder initWithType:customDateComponents:customWeekdaySelection:enabled:](self, "initWithType:customDateComponents:customWeekdaySelection:enabled:", a3, a4, 0, 1);
}

- (FIMindfulnessReminder)initWithType:(int64_t)a3 customDateComponents:(id)a4 customWeekdaySelection:(unint64_t)a5 enabled:(BOOL)a6
{
  id v11;
  FIMindfulnessReminder *v12;
  FIMindfulnessReminder *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FIMindfulnessReminder;
  v12 = -[FIMindfulnessReminder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_customDateComponents, a4);
    v13->_enabled = a6;
    v13->_customWeekdaySelection = a5;
    v13->_type = a3;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  FIMindfulnessReminder *v4;
  FIMindfulnessReminder *v5;
  int64_t type;
  NSDateComponents *customDateComponents;
  NSDateComponents *v8;
  NSDateComponents *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t customWeekdaySelection;

  v4 = (FIMindfulnessReminder *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_13;
  }
  type = self->_type;
  if (type == -[FIMindfulnessReminder type](v4, "type"))
  {
    customDateComponents = self->_customDateComponents;
    -[FIMindfulnessReminder customDateComponents](v5, "customDateComponents");
    v8 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    if (customDateComponents == v8)
    {
      customWeekdaySelection = self->_customWeekdaySelection;
      v12 = customWeekdaySelection == -[FIMindfulnessReminder customWeekdaySelection](v5, "customWeekdaySelection");
    }
    else
    {
      v9 = self->_customDateComponents;
      -[FIMindfulnessReminder customDateComponents](v5, "customDateComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDateComponents isEqual:](v9, "isEqual:", v10))
      {
        v11 = self->_customWeekdaySelection;
        v12 = v11 == -[FIMindfulnessReminder customWeekdaySelection](v5, "customWeekdaySelection");
      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
LABEL_7:
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (unint64_t)hash
{
  int64_t type;

  type = self->_type;
  return -[NSDateComponents hash](self->_customDateComponents, "hash") ^ type;
}

- (id)description
{
  void *v3;
  _BOOL8 enabled;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  enabled = self->_enabled;
  -[FIMindfulnessReminder _typeDescription](self, "_typeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FIMindfulnessReminder (%p): enabled: %d, type: %@, date components: (hour: %ld, minute: %ld)"), self, enabled, v5, -[NSDateComponents hour](self->_customDateComponents, "hour"), -[NSDateComponents minute](self->_customDateComponents, "minute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_typeDescription
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 2)
    return CFSTR("Unknown");
  else
    return off_24CC4E3D0[v2];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDateComponents *customDateComponents;
  id v6;

  v4 = a3;
  customDateComponents = self->_customDateComponents;
  v6 = v4;
  if (customDateComponents)
  {
    objc_msgSend(v4, "encodeObject:forKey:", customDateComponents, CFSTR("CustomDateComponents"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_customWeekdaySelection, CFSTR("CustomWeekdaySelection"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_enabled, CFSTR("Enabled"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("Type"));

}

- (FIMindfulnessReminder)initWithCoder:(id)a3
{
  id v4;
  FIMindfulnessReminder *v5;
  uint64_t v6;
  NSDateComponents *customDateComponents;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIMindfulnessReminder;
  v5 = -[FIMindfulnessReminder init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CustomDateComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    customDateComponents = v5->_customDateComponents;
    v5->_customDateComponents = (NSDateComponents *)v6;

    v5->_customWeekdaySelection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CustomWeekdaySelection"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    if (v8 <= 3)
      v9 = v8;
    else
      v9 = 0;
    v5->_type = v9;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateComponents)customDateComponents
{
  return self->_customDateComponents;
}

- (unint64_t)customWeekdaySelection
{
  return self->_customWeekdaySelection;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDateComponents, 0);
}

@end
