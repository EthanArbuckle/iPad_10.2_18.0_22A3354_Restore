@implementation ICASActionMenuContextType

- (ICASActionMenuContextType)initWithActionMenuContextType:(int64_t)a3
{
  ICASActionMenuContextType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASActionMenuContextType;
  result = -[ICASActionMenuContextType init](&v5, sel_init);
  if (result)
    result->_actionMenuContextType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASActionMenuContextType actionMenuContextType](self, "actionMenuContextType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("note");
  if (v3 == 2)
    return CFSTR("folder");
  else
    return (id)v4;
}

- (int64_t)actionMenuContextType
{
  return self->_actionMenuContextType;
}

@end
