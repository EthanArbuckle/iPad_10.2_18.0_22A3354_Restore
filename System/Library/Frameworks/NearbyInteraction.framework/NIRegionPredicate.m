@implementation NIRegionPredicate

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5
{
  id v10;
  NIRegionPredicate *v11;
  NIRegionPredicate *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 23, CFSTR("radius must be larger than 0"));

  }
  v16.receiver = self;
  v16.super_class = (Class)NIRegionPredicate;
  v11 = -[NIRegionPredicate init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_radius = a4;
    v12->_regionSizeCategory = 0;
    v12->_preferredUpdateRate = a5;
    v12->_requiresUserIntent = 0;
    v12->_devicePresencePreset = 0;
  }

  return v12;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4
{
  id v6;
  id v7;
  double v8;
  NIRegionPredicate *v9;

  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  *(float *)&v8 = a4;
  v9 = (NIRegionPredicate *)objc_msgSend(v7, "initWithName:radius:preferredUpdateRate:", v6, 0, v8);

  return v9;
}

- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4
{
  id v7;
  id v8;
  NIRegionPredicate *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 42, CFSTR("device presence preset cannot be unspecified"));

LABEL_3:
  v8 = objc_alloc((Class)objc_opt_class());
  +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", a4);
  v9 = (NIRegionPredicate *)objc_msgSend(v8, "initWithName:radius:", v7);

  if (v9)
    v9->_devicePresencePreset = a4;

  return v9;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NIRegionPredicate *v11;
  double v12;
  NIRegionPredicate *v13;

  v6 = a6;
  v10 = a3;
  v11 = [NIRegionPredicate alloc];
  *(float *)&v12 = a4;
  v13 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:](v11, "initWithName:radius:preferredUpdateRate:", v10, a5, v12);
  -[NIRegionPredicate setRequiresUserIntent:](v13, "setRequiresUserIntent:", v6);

  return v13;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  NIRegionPredicate *v13;
  double v14;
  NIRegionPredicate *v15;

  v7 = a7;
  v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&v14 = a5;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:](v13, "initWithName:radius:preferredUpdateRate:requiresUserIntent:", v12, a6, v7, v14);
  -[NIRegionPredicate setRegionSizeCategory:](v15, "setRegionSizeCategory:", a4);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  NIRegionPredicate *v13;
  double v14;
  NIRegionPredicate *v15;

  v8 = a6;
  v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&v14 = a4;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:](v13, "initWithName:radius:preferredUpdateRate:requiresUserIntent:", v12, a5, v8, v14);
  -[NIRegionPredicate setDevicePresencePreset:](v15, "setDevicePresencePreset:", a7);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  NIRegionPredicate *v15;
  double v16;
  NIRegionPredicate *v17;

  v9 = a7;
  v14 = a3;
  v15 = [NIRegionPredicate alloc];
  *(float *)&v16 = a5;
  v17 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:](v15, "initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:", v14, a6, v9, a8, v16);
  -[NIRegionPredicate setRegionSizeCategory:](v17, "setRegionSizeCategory:", a4);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)devicePresencePreset
{
  return self->_devicePresencePreset;
}

- (void)setDevicePresencePreset:(int64_t)a3
{
  self->_devicePresencePreset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->_radius;
  return (id)objc_msgSend(v4, "initWithName:regionSizeCategory:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:", self->_name, self->_regionSizeCategory, self->_preferredUpdateRate, self->_requiresUserIntent, self->_devicePresencePreset, v5);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_regionSizeCategory, CFSTR("regionSizeCategory"));
  *(float *)&v4 = self->_radius;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("radius"), v4);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredUpdateRate, CFSTR("preferredUpdateRate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresUserIntent, CFSTR("requiresUserIntent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_devicePresencePreset, CFSTR("devicePresencePreset"));

}

- (NIRegionPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NIRegionPredicate *v12;
  char v13;
  NIRegionPredicate *v14;
  NIRegionPredicate *v15;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("regionSizeCategory"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("radius"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredUpdateRate"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("devicePresencePreset"));
  if (v5 && ((v11 = v10, v8 >= 0.0) || v10))
  {
    v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresUserIntent"));
    v17.receiver = self;
    v17.super_class = (Class)NIRegionPredicate;
    v14 = -[NIRegionPredicate init](&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_name, v5);
      v15->_radius = v8;
      v15->_regionSizeCategory = v6;
      v15->_preferredUpdateRate = v9;
      v15->_requiresUserIntent = v13;
      v15->_devicePresencePreset = v11;
    }
    self = v15;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIRegionPredicate *v5;
  NIRegionPredicate *v6;
  void *v7;
  float v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIRegionPredicate *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v9 = 1;
    }
    else
    {
      -[NIRegionPredicate name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", self->_name)
        && -[NIRegionPredicate regionSizeCategory](v6, "regionSizeCategory") == self->_regionSizeCategory
        && (-[NIRegionPredicate radius](v6, "radius"), v8 == self->_radius)
        && -[NIRegionPredicate preferredUpdateRate](v6, "preferredUpdateRate") == self->_preferredUpdateRate
        && self->_requiresUserIntent == -[NIRegionPredicate requiresUserIntent](v6, "requiresUserIntent")
        && -[NIRegionPredicate devicePresencePreset](v6, "devicePresencePreset") == self->_devicePresencePreset;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_regionSizeCategory ^ self->_preferredUpdateRate ^ -[NSString hash](self->_name, "hash") ^ self->_requiresUserIntent ^ self->_devicePresencePreset ^ (int)self->_radius;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIRegionPredicate descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  int64_t regionSizeCategory;
  NSString *name;
  const __CFString *v6;
  float radius;
  const char *v8;
  unint64_t devicePresencePreset;

  v3 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  regionSizeCategory = self->_regionSizeCategory;
  if (regionSizeCategory)
  {
    if (regionSizeCategory != 10)
      -[NIRegionPredicate descriptionInternal].cold.1();
    v6 = CFSTR("Large");
  }
  else
  {
    v6 = CFSTR("Default");
  }
  radius = self->_radius;
  v8 = +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_preferredUpdateRate);
  devicePresencePreset = self->_devicePresencePreset;
  if (devicePresencePreset >= 7)
    -[NIRegionPredicate descriptionInternal].cold.2();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@, cat: %@, radius: %0.2f m, rate: %s, intent: %d, presencePreset: %s"), name, v6, radius, v8, self->_requiresUserIntent, off_1E4362C78[devicePresencePreset]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %0.2fm %s C:%d,I:%d,P:%d"), self->_name, self->_radius, +[NIUtils NINearbyObjectUpdateRateToShortString:](NIUtils, "NINearbyObjectUpdateRateToShortString:", self->_preferredUpdateRate), self->_regionSizeCategory, self->_requiresUserIntent, self->_devicePresencePreset);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void)setRegionSizeCategory:(int64_t)a3
{
  self->_regionSizeCategory = a3;
}

- (float)radius
{
  return self->_radius;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_preferredUpdateRate = a3;
}

- (BOOL)requiresUserIntent
{
  return self->_requiresUserIntent;
}

- (void)setRequiresUserIntent:(BOOL)a3
{
  self->_requiresUserIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)descriptionInternal
{
  __assert_rtn("NIDevicePresencePresetToString", "NIRegionPredicate.mm", 193, "false");
}

@end
