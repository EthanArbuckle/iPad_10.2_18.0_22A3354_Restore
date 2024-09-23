@implementation ICASPwdModeChangeContextPath

- (ICASPwdModeChangeContextPath)initWithPwdModeChangeContextPath:(int64_t)a3
{
  ICASPwdModeChangeContextPath *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASPwdModeChangeContextPath;
  result = -[ICASPwdModeChangeContextPath init](&v5, sel_init);
  if (result)
    result->_pwdModeChangeContextPath = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASPwdModeChangeContextPath pwdModeChangeContextPath](self, "pwdModeChangeContextPath", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771C420[v3 - 1];
}

- (int64_t)pwdModeChangeContextPath
{
  return self->_pwdModeChangeContextPath;
}

@end
