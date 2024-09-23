@implementation HFAnalyticsSceneDetailsVisitEvent

- (HFAnalyticsSceneDetailsVisitEvent)initWithData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFAnalyticsSceneDetailsVisitEvent;
  return -[HFAnalyticsEvent initWithEventType:](&v4, sel_initWithEventType_, 35);
}

@end
