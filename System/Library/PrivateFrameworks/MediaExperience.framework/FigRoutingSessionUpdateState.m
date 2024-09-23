@implementation FigRoutingSessionUpdateState

- (FigRoutingSessionUpdateState)initWithNewSession:(OpaqueFigRoutingSession *)a3
{
  FigRoutingSessionUpdateState *v4;
  OpaqueFigRoutingSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigRoutingSessionUpdateState;
  v4 = -[FigRoutingSessionUpdateState init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigRoutingSession *)CFRetain(a3);
    else
      v5 = 0;
    v4->_newSession = v5;
  }
  return v4;
}

- (void)dealloc
{
  OpaqueFigRoutingSession *newSession;
  objc_super v4;

  newSession = self->_newSession;
  if (newSession)
    CFRelease(newSession);

  v4.receiver = self;
  v4.super_class = (Class)FigRoutingSessionUpdateState;
  -[FigRoutingSessionUpdateState dealloc](&v4, sel_dealloc);
}

- (OpaqueFigRoutingSession)newSession
{
  return self->_newSession;
}

- (void)setNewSession:(OpaqueFigRoutingSession *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (ARPPredictionContext)predictionContext
{
  return self->_predictionContext;
}

- (void)setPredictionContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
