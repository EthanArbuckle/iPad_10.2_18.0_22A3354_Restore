@implementation AVSinkSubscriber

- (void)dealloc
{
  objc_super v3;

  -[AVSinkSubscriber cancel](self, "cancel");
  if (self->_cancelMutex)
    FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVSinkSubscriber;
  -[AVSinkSubscriber dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  MEMORY[0x194033BF8](self->_cancelMutex, a2);
  -[AVCancellable cancel](self->_token, "cancel");

  self->_token = 0;
  self->_publisher = 0;

  self->_sink = 0;
  JUMPOUT(0x194033C04);
}

- (AVSinkSubscriber)initWithPublisher:(id)a3 requestingInitialValue:(BOOL)a4 sink:(id)a5
{
  _BOOL8 v6;
  AVSinkSubscriber *v8;
  uint64_t v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVSinkSubscriber;
  v8 = -[AVSinkSubscriber init](&v11, sel_init);
  if (v8)
  {
    v8->_publisher = (AVPublisher *)a3;
    v9 = objc_msgSend(a5, "copy");
    v8->_sink = (id)v9;
    v8->_token = (AVCancellable *)-[AVPublisher subscribeRequestingInitialValue:block:](v8->_publisher, "subscribeRequestingInitialValue:block:", v6, v9);
    v8->_cancelMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p publisher=%@>"), objc_opt_class(), self, self->_publisher);
}

@end
