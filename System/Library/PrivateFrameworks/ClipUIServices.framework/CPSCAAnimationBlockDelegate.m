@implementation CPSCAAnimationBlockDelegate

+ (void)attachToAnimation:(id)a3 didStartHandler:(id)a4 didStopHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v19, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The provided animation already has a delegate."), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v11 = objc_alloc_init((Class)a1);
  v12 = MEMORY[0x1D17E1B78](v8);
  v13 = (void *)v11[2];
  v11[2] = v12;

  v14 = MEMORY[0x1D17E1B78](v9);
  v15 = (void *)v11[3];
  v11[3] = v14;

  v16 = (void *)v11[1];
  v11[1] = v11;
  v17 = v11;

  objc_msgSend(v19, "setDelegate:", v17);
}

- (void)animationDidStart:(id)a3
{
  void (**didStartHandler)(id, id);

  didStartHandler = (void (**)(id, id))self->_didStartHandler;
  if (didStartHandler)
    didStartHandler[2](didStartHandler, a3);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**didStopHandler)(id, id, BOOL);
  id referenceToSelf;

  didStopHandler = (void (**)(id, id, BOOL))self->_didStopHandler;
  if (didStopHandler)
    didStopHandler[2](didStopHandler, a3, a4);
  referenceToSelf = self->_referenceToSelf;
  self->_referenceToSelf = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStopHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong(&self->_referenceToSelf, 0);
}

@end
