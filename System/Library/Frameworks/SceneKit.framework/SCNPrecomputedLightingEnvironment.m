@implementation SCNPrecomputedLightingEnvironment

- (NSData)radianceData
{
  return self->_radianceData;
}

- (NSData)irradianceData
{
  return self->_irradianceData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNPrecomputedLightingEnvironment)initWithCoder:(id)a3
{
  SCNPrecomputedLightingEnvironment *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNPrecomputedLightingEnvironment;
  v4 = -[SCNPrecomputedLightingEnvironment init](&v6, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("version")) < 1)
    {

      return 0;
    }
    else
    {
      v4->_radianceData = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radiance"));
      v4->_irradianceData = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("irradiance"));
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_radianceData, CFSTR("radiance"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_irradianceData, CFSTR("irradiance"));
}

- (void)dealloc
{
  CFNumberRef v3;
  __CFNotificationCenter *LocalCenter;
  objc_super v5;
  SCNPrecomputedLightingEnvironment *valuePtr;

  valuePtr = self;
  v3 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kC3DNotificationPrecomputedLightingEnvironmentWillDie"), v3, 0, 1u);
  CFRelease(v3);

  v5.receiver = self;
  v5.super_class = (Class)SCNPrecomputedLightingEnvironment;
  -[SCNPrecomputedLightingEnvironment dealloc](&v5, sel_dealloc);
}

- (void)setRadianceData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setIrradianceData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
