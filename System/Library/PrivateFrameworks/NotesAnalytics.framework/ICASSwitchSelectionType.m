@implementation ICASSwitchSelectionType

- (ICASSwitchSelectionType)initWithSwitchSelectionType:(int64_t)a3
{
  ICASSwitchSelectionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASSwitchSelectionType;
  result = -[ICASSwitchSelectionType init](&v5, sel_init);
  if (result)
    result->_switchSelectionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASSwitchSelectionType switchSelectionType](self, "switchSelectionType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("on");
  if (v3 == 2)
    return CFSTR("off");
  else
    return (id)v4;
}

- (int64_t)switchSelectionType
{
  return self->_switchSelectionType;
}

@end
