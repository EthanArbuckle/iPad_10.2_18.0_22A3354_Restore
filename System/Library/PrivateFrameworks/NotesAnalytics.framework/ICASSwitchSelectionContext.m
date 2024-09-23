@implementation ICASSwitchSelectionContext

- (ICASSwitchSelectionContext)initWithSwitchSelectionContext:(int64_t)a3
{
  ICASSwitchSelectionContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSwitchSelectionContext;
  result = -[ICASSwitchSelectionContext init](&v5, sel_init);
  if (result)
    result->_switchSelectionContext = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASSwitchSelectionContext switchSelectionContext](self, "switchSelectionContext", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("inAppAlert");
  if (v3 == 2)
    return CFSTR("fromDeviceSettings");
  else
    return (id)v4;
}

- (int64_t)switchSelectionContext
{
  return self->_switchSelectionContext;
}

@end
