@implementation JFXCaptureCallObserver

- (JFXCaptureCallObserver)init
{
  JFXCaptureCallObserver *v2;
  uint64_t v3;
  CXCallObserver *callObserver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXCaptureCallObserver;
  v2 = -[JFXCaptureCallObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    callObserver = v2->_callObserver;
    v2->_callObserver = (CXCallObserver *)v3;

    -[CXCallObserver setDelegate:queue:](v2->_callObserver, "setDelegate:queue:", v2, MEMORY[0x24BDAC9B8]);
  }
  return v2;
}

- (int64_t)callCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[JFXCaptureCallObserver callObserver](self, "callObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
