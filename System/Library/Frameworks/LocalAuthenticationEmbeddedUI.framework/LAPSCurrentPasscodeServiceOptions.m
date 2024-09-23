@implementation LAPSCurrentPasscodeServiceOptions

- (LAPSCurrentPasscodeServiceOptions)init
{
  LAPSCurrentPasscodeServiceOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAPSCurrentPasscodeServiceOptions;
  result = -[LAPSCurrentPasscodeServiceOptions init](&v3, sel_init);
  if (result)
    result->_skipSuccessNotification = 1;
  return result;
}

- (BOOL)skipSuccessNotification
{
  return self->_skipSuccessNotification;
}

- (void)setSkipSuccessNotification:(BOOL)a3
{
  self->_skipSuccessNotification = a3;
}

@end
