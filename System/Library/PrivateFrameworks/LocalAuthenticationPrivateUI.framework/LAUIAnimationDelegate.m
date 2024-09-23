@implementation LAUIAnimationDelegate

- (void)dealloc
{
  id didStopHandler;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  objc_super v6;

  didStopHandler = self->_didStopHandler;
  if (didStopHandler)
  {
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1B708](didStopHandler, a2);
    v5 = self->_didStopHandler;
    self->_didStopHandler = 0;

    v4[2](v4, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)LAUIAnimationDelegate;
  -[LAUIAnimationDelegate dealloc](&v6, sel_dealloc);
}

- (void)animationDidStart:(id)a3
{
  id didStartHandler;
  id v5;
  void (**v6)(void);

  didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    v6 = (void (**)(void))MEMORY[0x20BD1B708](didStartHandler, a2, a3);
    v5 = self->_didStartHandler;
    self->_didStartHandler = 0;

    v6[2]();
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id didStopHandler;
  _BOOL8 v6;
  id v7;
  void (**v8)(id, _BOOL8);

  didStopHandler = self->_didStopHandler;
  if (didStopHandler)
  {
    v6 = a4;
    v8 = (void (**)(id, _BOOL8))MEMORY[0x20BD1B708](didStopHandler, a2, a3);
    v7 = self->_didStopHandler;
    self->_didStopHandler = 0;

    v8[2](v8, v6);
  }
}

- (void)setDidStopHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id didStopHandler;
  void *v8;

  v4 = a3;
  if (self->_didStopHandler != v4)
  {
    v8 = v4;
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1B708]();
    v6 = (void *)objc_msgSend(v8, "copy");
    didStopHandler = self->_didStopHandler;
    self->_didStopHandler = v6;

    if (v5)
      v5[2](v5, 0);

    v4 = v8;
  }

}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didStopHandler
{
  return self->_didStopHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStopHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
}

@end
