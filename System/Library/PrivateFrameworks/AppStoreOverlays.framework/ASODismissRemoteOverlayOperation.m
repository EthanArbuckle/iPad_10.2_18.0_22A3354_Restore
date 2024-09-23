@implementation ASODismissRemoteOverlayOperation

- (ASODismissRemoteOverlayOperation)initWithContextProvider:(id)a3
{
  id v4;
  ASODismissRemoteOverlayOperation *v5;
  ASODismissRemoteOverlayOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASODismissRemoteOverlayOperation;
  v5 = -[ASODismissRemoteOverlayOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_contextProvider, v4);

  return v6;
}

- (void)cancel
{
  objc_super v3;
  uint8_t buf[4];
  ASODismissRemoteOverlayOperation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3.receiver = self;
  v3.super_class = (Class)ASODismissRemoteOverlayOperation;
  -[ASODismissRemoteOverlayOperation cancel](&v3, sel_cancel);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v5 = self;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Canceling dismiss operation: %@", buf, 0xCu);
  }
  if (-[ASODismissRemoteOverlayOperation isExecuting](self, "isExecuting"))
    -[ASODismissRemoteOverlayOperation finishExecuting](self, "finishExecuting");
}

- (void)finishExecuting
{
  int v3;
  ASODismissRemoteOverlayOperation *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = self;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finishing executing dismiss operation: %@", (uint8_t *)&v3, 0xCu);
  }
  -[ASODismissRemoteOverlayOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[ASODismissRemoteOverlayOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[ASODismissRemoteOverlayOperation setIsExecuting:](self, "setIsExecuting:", 0);
  -[ASODismissRemoteOverlayOperation setIsFinished:](self, "setIsFinished:", 1);
  -[ASODismissRemoteOverlayOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[ASODismissRemoteOverlayOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Skipping dismiss operation because it was canceled: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __41__ASODismissRemoteOverlayOperation_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishExecuting");
}

- (ASORemoteOverlayHost)contextProvider
{
  return (ASORemoteOverlayHost *)objc_loadWeakRetained((id *)&self->_contextProvider);
}

- (void)setContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_contextProvider, a3);
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextProvider);
}

@end
