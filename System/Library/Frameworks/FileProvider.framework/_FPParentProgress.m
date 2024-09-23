@implementation _FPParentProgress

- (void)dealloc
{
  objc_super v3;

  -[FPProgressProxy stopTrackingIfStarted](self->_progressProxy, "stopTrackingIfStarted");
  v3.receiver = self;
  v3.super_class = (Class)_FPParentProgress;
  -[_FPParentProgress dealloc](&v3, sel_dealloc);
}

- (BOOL)isCancellable
{
  return -[FPProgressProxy isCancellable](self->_progressProxy, "isCancellable");
}

- (BOOL)isPausable
{
  return -[FPProgressProxy isPausable](self->_progressProxy, "isPausable");
}

- (void)setProgressProxy:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  -[FPProgressProxy stopTrackingIfStarted](self->_progressProxy, "stopTrackingIfStarted");
  objc_storeStrong((id *)&self->_progressProxy, a3);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38___FPParentProgress_setProgressProxy___block_invoke;
  v14[3] = &unk_1E444A308;
  v7 = v5;
  v15 = v7;
  -[_FPParentProgress setCancellationHandler:](self, "setCancellationHandler:", v14);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __38___FPParentProgress_setProgressProxy___block_invoke_2;
  v12[3] = &unk_1E444A308;
  v8 = v7;
  v13 = v8;
  -[_FPParentProgress setPausingHandler:](self, "setPausingHandler:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __38___FPParentProgress_setProgressProxy___block_invoke_3;
  v10[3] = &unk_1E444A308;
  v11 = v8;
  v9 = v8;
  -[_FPParentProgress setResumingHandler:](self, "setResumingHandler:", v10);

}

- (FPProgressProxy)progressProxy
{
  return (FPProgressProxy *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProxy, 0);
}

@end
