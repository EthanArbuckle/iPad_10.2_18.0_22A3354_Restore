@implementation _SFOpenURLOperationDelegate

- (_SFOpenURLOperationDelegate)initWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id completionHandler;
  _SFOpenURLOperationDelegate *v7;
  objc_super v9;

  v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)_SFOpenURLOperationDelegate,
        (self = -[_SFOpenURLOperationDelegate init](&v9, sel_init)) != 0))
  {
    v5 = (void *)MEMORY[0x1A8598C40](v4);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v5;

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_didFinishWithSuccess:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___SFOpenURLOperationDelegate__didFinishWithSuccess___block_invoke;
  v3[3] = &unk_1E4AC08D8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)openResourceOperationDidComplete:(id)a3
{
  -[_SFOpenURLOperationDelegate _didFinishWithSuccess:](self, "_didFinishWithSuccess:", 1);
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  -[_SFOpenURLOperationDelegate _didFinishWithSuccess:](self, "_didFinishWithSuccess:", 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
