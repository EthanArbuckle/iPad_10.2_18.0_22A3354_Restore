@implementation AMSMetricsBatch

- (NSArray)skippedEvents
{
  return self->_skippedEvents;
}

- (void)setSkippedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_skippedEvents, a3);
}

- (void)setReportURL:(id)a3
{
  objc_storeStrong((id *)&self->_reportURL, a3);
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void)setEventDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_eventDictionaries, a3);
}

- (void)setDroppedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_droppedEvents, a3);
}

- (void)setContainsLoadURL:(BOOL)a3
{
  self->_containsLoadURL = a3;
}

- (void)setCanaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_canaryIdentifier, a3);
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSArray)droppedEvents
{
  return self->_droppedEvents;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (NSURL)reportURL
{
  return self->_reportURL;
}

- (NSArray)eventDictionaries
{
  return self->_eventDictionaries;
}

- (ACAccount)account
{
  return self->_account;
}

- (BOOL)containsLoadURL
{
  return self->_containsLoadURL;
}

- (NSString)canaryIdentifier
{
  return self->_canaryIdentifier;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedEvents, 0);
  objc_storeStrong((id *)&self->_reportURL, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_eventDictionaries, 0);
  objc_storeStrong((id *)&self->_droppedEvents, 0);
  objc_storeStrong((id *)&self->_canaryIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
