@implementation NightShiftDisplayWrapper

- (NightShiftDisplayWrapper)initWithDisplay:(__Display *)a3
{
  objc_super v4;
  __Display *v5;
  SEL v6;
  NightShiftDisplayWrapper *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)NightShiftDisplayWrapper;
  v7 = -[NightShiftDisplayWrapper init](&v4, sel_init);
  if (v7 && v5)
  {
    v7->_display = v5;
    CFRetain(v7->_display);
  }
  return v7;
}

- (NightShiftDisplayWrapper)init
{
  objc_super v3;
  SEL v4;
  NightShiftDisplayWrapper *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)NightShiftDisplayWrapper;
  return -[NightShiftDisplayWrapper init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  NightShiftDisplayWrapper *v4;

  v4 = self;
  v3 = a2;
  if (self->_display)
    CFRelease(v4->_display);

  v2.receiver = v4;
  v2.super_class = (Class)NightShiftDisplayWrapper;
  -[NightShiftDisplayWrapper dealloc](&v2, sel_dealloc);
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  if (self->_display)
    DisplaySetProperty((uint64_t)self->_display, (uint64_t)CFSTR("BlueLightReductionFactor"), (uint64_t)a3);
  else
    -[CBContainerProtocol setProperty:forKey:](self->_container, "setProperty:forKey:", a3, CFSTR("BlueLightReductionFactor"));
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  return 0;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
  ;
}

- (CBContainerProtocol)container
{
  return (CBContainerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
