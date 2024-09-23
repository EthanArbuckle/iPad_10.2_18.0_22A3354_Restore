@implementation MAIgnoreProgressReporter

- (MAIgnoreProgressReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAIgnoreProgressReporter;
  return (MAIgnoreProgressReporter *)-[MAProgressReporter initForSubclasses](&v3, sel_initForSubclasses);
}

- (BOOL)isCancelled
{
  return 0;
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  return 0;
}

@end
