@implementation DNDMeDeviceState

- (DNDMeDeviceState)initWithStatus:(unint64_t)a3 name:(id)a4
{
  id v6;
  DNDMeDeviceState *v7;
  DNDMeDeviceState *v8;
  uint64_t v9;
  NSString *meDeviceName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDMeDeviceState;
  v7 = -[DNDMeDeviceState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_meDeviceStatus = a3;
    v9 = objc_msgSend(v6, "copy");
    meDeviceName = v8->_meDeviceName;
    v8->_meDeviceName = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[DNDMeDeviceState meDeviceStatus](self, "meDeviceStatus");
  -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DNDMeDeviceState *v4;
  DNDMeDeviceState *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (DNDMeDeviceState *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDMeDeviceState meDeviceStatus](self, "meDeviceStatus");
      if (v6 == -[DNDMeDeviceState meDeviceStatus](v5, "meDeviceStatus"))
      {
        -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDMeDeviceState meDeviceName](v5, "meDeviceName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v13 = 1;
        }
        else
        {
          -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDMeDeviceState meDeviceName](v5, "meDeviceName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDMeDeviceState meDeviceName](v5, "meDeviceName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v11, "isEqual:", v12);

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[DNDMeDeviceState meDeviceStatus](self, "meDeviceStatus") - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E39B5948[v5];
  -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; meDeviceStatus: %@; meDeviceName: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDMeDeviceState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  DNDMeDeviceState *v7;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("meDeviceStatus")))
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("meDeviceStatus"));
  else
    v5 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("meDeviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDMeDeviceState initWithStatus:name:](self, "initWithStatus:name:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMeDeviceState meDeviceStatus](self, "meDeviceStatus"), CFSTR("meDeviceStatus"));
  -[DNDMeDeviceState meDeviceName](self, "meDeviceName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("meDeviceName"));

}

- (unint64_t)meDeviceStatus
{
  return self->_meDeviceStatus;
}

- (NSString)meDeviceName
{
  return self->_meDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDeviceName, 0);
}

@end
