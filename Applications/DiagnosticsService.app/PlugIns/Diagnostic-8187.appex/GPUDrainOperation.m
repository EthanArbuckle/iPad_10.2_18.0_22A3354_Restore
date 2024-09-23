@implementation GPUDrainOperation

- (GPUDrainOperation)initWithIterationDelay:(id)a3
{
  id v5;
  GPUDrainOperation *v6;
  GPUDrainOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GPUDrainOperation;
  v6 = -[GPUDrainOperation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iterationDelay, a3);

  return v7;
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GPUDrainOperation;
  -[DrainOperation cancel](&v2, "cancel");
}

- (void)main
{
  Renderer *v3;
  Renderer *renderer;
  Renderer *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = -[Renderer initWithSize:]([Renderer alloc], "initWithSize:", 1365.0, 720.0);
  renderer = self->_renderer;
  self->_renderer = v3;

  v5 = self->_renderer;
  if (v5 && -[Renderer hasRenderDevice](v5, "hasRenderDevice"))
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting metal rendering", v10, 2u);
    }

    while (1)
    {
      -[Renderer render](self->_renderer, "render");
      if (-[NSNumber unsignedIntValue](self->_iterationDelay, "unsignedIntValue"))
        usleep(1000 * -[NSNumber unsignedIntValue](self->_iterationDelay, "unsignedIntValue"));
      if (-[DrainOperation isFinished](self, "isFinished"))
        break;
      -[DrainOperation waitIfPaused](self, "waitIfPaused");
    }
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100009260(v9);

  }
}

- (NSNumber)iterationDelay
{
  return self->_iterationDelay;
}

- (void)setIterationDelay:(id)a3
{
  objc_storeStrong((id *)&self->_iterationDelay, a3);
}

- (Renderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_iterationDelay, 0);
}

@end
