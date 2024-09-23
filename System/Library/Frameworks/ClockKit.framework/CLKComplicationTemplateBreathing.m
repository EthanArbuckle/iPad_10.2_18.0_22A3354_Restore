@implementation CLKComplicationTemplateBreathing

- (CLKComplicationTemplateBreathing)initWithFamily:(int64_t)a3
{
  CLKComplicationTemplateBreathing *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateBreathing;
  result = -[CLKComplicationTemplate initPrivate](&v5, sel_initPrivate);
  if (result)
    result->_family = a3;
  return result;
}

+ (id)breathingTemplateWithFamily:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFamily:", a3);
}

- (int64_t)compatibleFamily
{
  return self->_family;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateBreathing;
  result = -[CLKComplicationTemplate copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 9) = self->_family;
  return result;
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, _QWORD, char *))a3 + 2))(a3, CFSTR("sessionCount"), 0, 0, &v3);
}

- (int64_t)sessionCount
{
  return self->_sessionCount;
}

- (void)setSessionCount:(int64_t)a3
{
  self->_sessionCount = a3;
}

@end
