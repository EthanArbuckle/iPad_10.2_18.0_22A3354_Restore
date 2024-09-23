@implementation BKSMutableHIDUISensorCharacteristics

- (BKSMutableHIDUISensorCharacteristics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSMutableHIDUISensorCharacteristics;
  return (BKSMutableHIDUISensorCharacteristics *)-[BKSHIDUISensorCharacteristics _init](&v3, sel__init);
}

- (void)setHasDiscreteProximitySensor:(BOOL)a3
{
  self->super._hasDiscreteProximitySensor = a3;
}

- (void)setSuggestedSystemApertureGracePeriodForScreenOff:(int64_t)a3
{
  self->super._suggestedSystemApertureGracePeriodForScreenOff = a3;
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BKSMutableHIDUISensorCharacteristics;
  return (id)objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "_init");
}

@end
