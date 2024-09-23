@implementation NUContentAnalyticsEvent

- (NUContentAnalyticsEvent)initWithEvent:(id)a3
{
  id v5;
  NUContentAnalyticsEvent *v6;
  NUContentAnalyticsEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUContentAnalyticsEvent;
  v6 = -[NUContentAnalyticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (SXAnalyticsEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
