@implementation ICDidMoveToWindowSpy

- (ICDidMoveToWindowSpy)initWithOwner:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  ICDidMoveToWindowSpy *v8;
  ICDidMoveToWindowSpy *v9;
  void *v10;
  id handler;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICDidMoveToWindowSpy;
  v8 = -[ICDidMoveToWindowSpy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    v10 = _Block_copy(v7);
    handler = v9->_handler;
    v9->_handler = v10;

  }
  return v9;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDidMoveToWindowSpy;
  -[ICDidMoveToWindowSpy didMoveToWindow](&v3, sel_didMoveToWindow);
  -[ICDidMoveToWindowSpy scheduleCallHandler](self, "scheduleCallHandler");
}

- (void)scheduleCallHandler
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_callHandler, 0);
  v4[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDidMoveToWindowSpy performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_callHandler, 0, v3, 0.0);

}

- (void)callHandler
{
  void (**handler)(_QWORD, _QWORD, _QWORD);
  id v4;

  -[ICDidMoveToWindowSpy owner](self, "owner");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICDidMoveToWindowSpy handler](self, "handler");
    handler = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ICDidMoveToWindowSpy *, id))handler)[2](handler, self, v4);
  }
  else
  {
    handler = (void (**)(_QWORD, _QWORD, _QWORD))self->_handler;
    self->_handler = 0;
  }

}

- (id)owner
{
  return objc_loadWeakRetained(&self->_owner);
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak(&self->_owner);
}

@end
