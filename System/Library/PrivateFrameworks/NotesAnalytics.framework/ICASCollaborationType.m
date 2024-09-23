@implementation ICASCollaborationType

- (ICASCollaborationType)initWithCollaborationType:(int64_t)a3
{
  ICASCollaborationType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationType;
  result = -[ICASCollaborationType init](&v5, sel_init);
  if (result)
    result->_collaborationType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollaborationType collaborationType](self, "collaborationType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C2E0[v3 - 1];
}

- (int64_t)collaborationType
{
  return self->_collaborationType;
}

@end
