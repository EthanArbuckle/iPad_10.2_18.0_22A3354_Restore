@implementation ICASChecklistAction

- (ICASChecklistAction)initWithChecklistAction:(int64_t)a3
{
  ICASChecklistAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASChecklistAction;
  result = -[ICASChecklistAction init](&v5, sel_init);
  if (result)
    result->_checklistAction = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASChecklistAction checklistAction](self, "checklistAction", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771C3B0[v3 - 1];
}

- (int64_t)checklistAction
{
  return self->_checklistAction;
}

@end
