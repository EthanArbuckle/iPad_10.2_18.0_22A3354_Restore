@implementation CLKComplicationTemplateActivity

- (CLKComplicationTemplateActivity)initWithFamily:(int64_t)a3
{
  CLKComplicationTemplateActivity *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateActivity;
  result = -[CLKComplicationTemplate initPrivate](&v5, sel_initPrivate);
  if (result)
    result->_family = a3;
  return result;
}

+ (id)activityTemplateWithFamily:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFamily:", a3);
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, uint64_t, _QWORD, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, uint64_t, _QWORD, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("movePercentComplete"), 1, 0, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("exercisePercentComplete"), 1, 0, &v4);
    if (!v4)
      v3[2](v3, CFSTR("standPercentComplete"), 1, 0, &v4);
  }

}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, char *))a3 + 2))(a3, CFSTR("hideDots"), 1, &v3);
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
  v5.super_class = (Class)CLKComplicationTemplateActivity;
  result = -[CLKComplicationTemplate copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 9) = self->_family;
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_movePercentComplete;
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_exercisePercentComplete;
  *((_QWORD *)result + 13) = *(_QWORD *)&self->_standPercentComplete;
  *((_BYTE *)result + 80) = self->_hideDots;
  return result;
}

- (double)movePercentComplete
{
  return self->_movePercentComplete;
}

- (void)setMovePercentComplete:(double)a3
{
  self->_movePercentComplete = a3;
}

- (double)exercisePercentComplete
{
  return self->_exercisePercentComplete;
}

- (void)setExercisePercentComplete:(double)a3
{
  self->_exercisePercentComplete = a3;
}

- (double)standPercentComplete
{
  return self->_standPercentComplete;
}

- (void)setStandPercentComplete:(double)a3
{
  self->_standPercentComplete = a3;
}

- (BOOL)dotsAreHidden
{
  return self->_hideDots;
}

- (void)setHideDots:(BOOL)a3
{
  self->_hideDots = a3;
}

@end
