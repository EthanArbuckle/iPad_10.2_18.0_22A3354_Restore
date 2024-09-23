@implementation GEOMapRequest

- (GEOMapRequest)initWithManager:(id)a3
{
  id v5;
  GEOMapRequest *v6;
  GEOMapRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapRequest;
  v6 = -[GEOMapRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestManager, a3);
    objc_msgSend(v5, "trackRequest:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapRequest;
  -[GEOMapRequest dealloc](&v2, sel_dealloc);
}

- (void)cancel
{
  -[GEOMapRequest _finishAndCallHandler:](self, "_finishAndCallHandler:", self->_cancellationHandler);
}

- (void)complete
{
  -[GEOMapRequest _finishAndCallHandler:](self, "_finishAndCallHandler:", self->_completionHandler);
}

- (void)_finishAndCallHandler:(id)a3
{
  id v4;
  id completionHandler;
  id cancellationHandler;
  GEOMapRequestManager *requestManager;
  GEOMapRequestManager *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    if (v4)
      (*((void (**)(id, GEOMapRequest *))v4 + 2))(v4, self);
  }
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  cancellationHandler = self->_cancellationHandler;
  self->_cancellationHandler = 0;

  requestManager = self->_requestManager;
  self->_requestManager = 0;
  v8 = requestManager;

  -[GEOMapRequestManager requestComplete:](v8, "requestComplete:", self);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
