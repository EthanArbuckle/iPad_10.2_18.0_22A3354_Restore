@implementation CBDisplayRamps

- (BOOL)isDisplayRampRunning
{
  return self->_ammoliteRamp == 1 || self->_twilightRamp == 1 || self->_minimumIndicatorRamp == 1;
}

- (CBDisplayRamps)init
{
  objc_super v3;
  SEL v4;
  CBDisplayRamps *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBDisplayRamps;
  v5 = -[CBDisplayRamps init](&v3, sel_init);
  if (!v5)
    return 0;
  v5->_ammoliteRamp = 0;
  v5->_twilightRamp = 0;
  v5->_minimumIndicatorRamp = 0;
  return v5;
}

- (void)handleRampStart:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Ammolite")) & 1) != 0)
  {
    self->_ammoliteRamp = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Twilight")) & 1) != 0)
  {
    self->_twilightRamp = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IndicatorBrightness")) & 1) != 0)
  {
    self->_minimumIndicatorRamp = 1;
  }
}

- (void)handleRampEnd:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Ammolite")) & 1) != 0)
  {
    self->_ammoliteRamp = 2;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Twilight")) & 1) != 0)
  {
    self->_twilightRamp = 2;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IndicatorBrightness")) & 1) != 0)
  {
    self->_minimumIndicatorRamp = 2;
  }
}

@end
