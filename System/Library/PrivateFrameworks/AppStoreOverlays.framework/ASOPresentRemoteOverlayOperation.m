@implementation ASOPresentRemoteOverlayOperation

- (ASOPresentRemoteOverlayOperation)initWithRemoteOverlay:(id)a3
{
  id v5;
  ASOPresentRemoteOverlayOperation *v6;
  ASOPresentRemoteOverlayOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOPresentRemoteOverlayOperation;
  v6 = -[ASOPresentRemoteOverlayOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_remoteOverlay, a3);

  return v7;
}

- (void)cancel
{
  objc_super v3;
  uint8_t buf[4];
  ASOPresentRemoteOverlayOperation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3.receiver = self;
  v3.super_class = (Class)ASOPresentRemoteOverlayOperation;
  -[ASOPresentRemoteOverlayOperation cancel](&v3, sel_cancel);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v5 = self;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Canceling presentation operation: %@", buf, 0xCu);
  }
  if (-[ASOPresentRemoteOverlayOperation isExecuting](self, "isExecuting"))
    -[ASOPresentRemoteOverlayOperation finishExecuting](self, "finishExecuting");
}

- (void)finishExecuting
{
  int v3;
  ASOPresentRemoteOverlayOperation *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = self;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finishing executing presentation operation: %@", (uint8_t *)&v3, 0xCu);
  }
  -[ASOPresentRemoteOverlayOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[ASOPresentRemoteOverlayOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[ASOPresentRemoteOverlayOperation setIsExecuting:](self, "setIsExecuting:", 0);
  -[ASOPresentRemoteOverlayOperation setIsFinished:](self, "setIsFinished:", 1);
  -[ASOPresentRemoteOverlayOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[ASOPresentRemoteOverlayOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Skipping presentation operation because it was canceled: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __41__ASOPresentRemoteOverlayOperation_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "remoteOverlay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteStoreOverlayDidFailToLoadWithError:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishExecuting");
}

- (ASORemoteOverlay)remoteOverlay
{
  return self->_remoteOverlay;
}

- (void)setRemoteOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_remoteOverlay, a3);
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
  objc_storeStrong((id *)&self->_remoteOverlay, 0);
}

@end
