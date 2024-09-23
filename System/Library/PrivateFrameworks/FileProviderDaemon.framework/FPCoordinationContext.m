@implementation FPCoordinationContext

- (FPCoordinationContext)initWithProgress:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  FPCoordinationContext *v9;
  FPCoordinationContext *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPCoordinationContext;
  v9 = -[FPCoordinationContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    v11 = MEMORY[0x1D17D1C84](v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
