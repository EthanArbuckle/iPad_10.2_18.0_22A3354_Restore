@implementation ICSSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (ICSSecureWindow)initWithWindowScene:(id)a3
{
  ICSSecureWindow *result;

  sub_100151970(a3);
  return result;
}

- (ICSSecureWindow)initWithFrame:(CGRect)a3
{
  ICSSecureWindow *result;

  sub_1001519D0();
  return result;
}

- (ICSSecureWindow)initWithCoder:(id)a3
{
  ICSSecureWindow *result;

  sub_100151A20(a3);
  return result;
}

- (ICSSecureWindow)initWithContentRect:(CGRect)a3
{
  ICSSecureWindow *result;

  sub_100151A80();
  return result;
}

@end
