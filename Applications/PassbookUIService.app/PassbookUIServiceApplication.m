@implementation PassbookUIServiceApplication

- (double)statusBarHeight
{
  float v2;
  double result;
  objc_super v4;

  if (self->_statusBarHeightOverride)
  {
    -[NSNumber floatValue](self->_statusBarHeightOverride, "floatValue");
    return v2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PassbookUIServiceApplication;
    -[PassbookUIServiceApplication statusBarHeight](&v4, "statusBarHeight");
  }
  return result;
}

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

- (NSNumber)statusBarHeightOverride
{
  return self->_statusBarHeightOverride;
}

- (void)setStatusBarHeightOverride:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarHeightOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarHeightOverride, 0);
}

@end
