@implementation GEONavdServerProxy

- (GEONavdServerProxy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEONavdServerProxy;
  return -[GEONavdServerProxy init](&v3, sel_init);
}

- (void)open
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)close
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)statusWithCallback:(id)a3
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)getDirectionsForClient:(id)a3 withRouteHypothesisRequest:(id)a4 andCallback:(id)a5
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)forceCacheRefresh
{
  -[GEONavdServerProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

@end
