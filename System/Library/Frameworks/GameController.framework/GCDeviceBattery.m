@implementation GCDeviceBattery

- (GCDeviceBattery)initWithLevel:(float)a3 batteryState:(int64_t)a4
{
  GCDeviceBattery *v6;
  double v7;
  GCDeviceBattery *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCDeviceBattery;
  v6 = -[GCDeviceBattery init](&v10, sel_init);
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = a3;
    -[GCDeviceBattery _setBatteryLevel:](v6, "_setBatteryLevel:", v7);
    -[GCDeviceBattery _setBatteryState:](v8, "_setBatteryState:", a4);
  }
  return v8;
}

- (GCDeviceBattery)initWithLevel:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  GCDeviceBattery *v6;
  double v7;
  GCDeviceBattery *v8;
  float batteryLevel;
  uint64_t v11;
  objc_super v13;

  v4 = a4;
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCDeviceBattery;
  v6 = -[GCDeviceBattery init](&v13, sel_init);
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = (float)v5 / 100.0;
    -[GCDeviceBattery _setBatteryLevel:](v6, "_setBatteryLevel:", v7);
    batteryLevel = v8->_batteryLevel;
    if (batteryLevel >= 1.0 && !v4)
    {
      v11 = 2;
    }
    else if (batteryLevel <= 0.0)
    {
      v11 = -1;
    }
    else
    {
      v11 = v4;
    }
    -[GCDeviceBattery _setBatteryState:](v8, "_setBatteryState:", v11);
  }
  return v8;
}

- (void)_setBatteryLevel:(float)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  *(float *)&v3 = v3;
  -[GCDeviceBattery setBatteryLevel:](self, "setBatteryLevel:", v3);
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ - battery=%2.1f, state=%d>"), objc_opt_class(), self->_batteryLevel, self->_batteryState);
}

- (BOOL)isEqual:(id)a3
{
  GCDeviceBattery *v4;
  GCDeviceBattery *v5;
  int64_t batteryState;
  float batteryLevel;
  float v8;
  BOOL v9;
  objc_super v11;

  v4 = (GCDeviceBattery *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GCDeviceBattery;
    if (-[GCDeviceBattery isEqual:](&v11, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      batteryState = self->_batteryState;
      if (batteryState == -[GCDeviceBattery batteryState](v5, "batteryState"))
      {
        batteryLevel = self->_batteryLevel;
        -[GCDeviceBattery batteryLevel](v5, "batteryLevel");
        v9 = batteryLevel == v8;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDeviceBattery;
  return -[GCDeviceBattery hash](&v3, sel_hash);
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (GCDeviceBatteryState)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_batteryState = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceBattery)initWithCoder:(id)a3
{
  id v4;
  GCDeviceBattery *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GCDeviceBattery;
  v5 = -[GCDeviceBattery init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("batteryLevel"));
    v5->_batteryLevel = v6;
    v5->_batteryState = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("batteryState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float batteryLevel;
  double v5;
  id v6;

  batteryLevel = self->_batteryLevel;
  v6 = a3;
  *(float *)&v5 = batteryLevel;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("batteryLevel"), v5);
  objc_msgSend(v6, "encodeInt:forKey:", LODWORD(self->_batteryState), CFSTR("batteryState"));

}

@end
