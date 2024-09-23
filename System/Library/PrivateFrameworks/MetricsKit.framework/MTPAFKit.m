@implementation MTPAFKit

- (MTPAFKit)initWithTopic:(id)a3
{
  MTPAFKit *v3;
  MTPAFEventHandlers *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPAFKit;
  v3 = -[MTMetricsKitTemplate initWithTopic:](&v6, sel_initWithTopic_, a3);
  if (v3)
  {
    v4 = -[MTObject initWithMetricsKit:]([MTPAFEventHandlers alloc], "initWithMetricsKit:", v3);
    -[MTMetricsKitTemplate setEventHandlers:](v3, "setEventHandlers:", v4);

  }
  return v3;
}

@end
