@implementation CLDeviceMotionProperties

- (CLDeviceMotionProperties)initWithMode:(int)a3
{
  CLDeviceMotionProperties *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDeviceMotionProperties;
  result = -[CLDeviceMotionProperties init](&v5, sel_init);
  if (result)
    result->_mode = a3;
  return result;
}

- (int)mode
{
  return self->_mode;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  int mode;
  id result;
  const __CFString *v7;
  const __CFString *v8;

  v4 = 0;
  mode = self->_mode;
  if (mode > 14)
  {
    v7 = CFSTR("3AxisDynamicGyro");
    v8 = CFSTR("6AxisThrottledGyro");
    if (mode != 67)
      v8 = 0;
    if (mode != 34)
      v7 = v8;
    if (mode == 19)
      v4 = CFSTR("BuildGYTT");
    if (mode == 15)
      v4 = CFSTR("9AxisWithNorthReference");
    if (mode > 33)
      v4 = v7;
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, v4);
  }
  else
  {
    switch(mode)
    {
      case 0:
        result = (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, CFSTR("Unknown"));
        break;
      case 2:
        result = (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, CFSTR("GyroOnly"));
        break;
      case 3:
        result = (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, CFSTR("6Axis"));
        break;
      case 7:
        result = (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, CFSTR("9Axis"));
        break;
      default:
        return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2, v3, v4);
    }
  }
  return result;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end
