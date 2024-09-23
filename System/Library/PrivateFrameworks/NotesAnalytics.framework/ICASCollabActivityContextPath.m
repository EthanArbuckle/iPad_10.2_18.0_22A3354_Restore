@implementation ICASCollabActivityContextPath

- (ICASCollabActivityContextPath)initWithCollabActivityContextPath:(int64_t)a3
{
  ICASCollabActivityContextPath *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollabActivityContextPath;
  result = -[ICASCollabActivityContextPath init](&v5, sel_init);
  if (result)
    result->_collabActivityContextPath = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollabActivityContextPath collabActivityContextPath](self, "collabActivityContextPath", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C818[v3 - 1];
}

- (int64_t)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

@end
