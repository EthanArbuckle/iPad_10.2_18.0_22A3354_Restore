@implementation _XRSpaceNotificationShim

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  if (self->_token)
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_(v6, v7, (uint64_t)self->_token, v8, v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)_XRSpaceNotificationShim;
  -[_XRSpaceNotificationShim dealloc](&v10, sel_dealloc);
}

- (NSObject)observer
{
  return objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSObject)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (BOOL)targetIsSet
{
  return self->_targetIsSet;
}

- (void)setTargetIsSet:(BOOL)a3
{
  self->_targetIsSet = a3;
}

- (NSObject)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (XRSpace)space
{
  return (XRSpace *)objc_loadWeakRetained((id *)&self->_space);
}

- (void)setSpace:(id)a3
{
  objc_storeWeak((id *)&self->_space, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_space);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_destroyWeak((id *)&self->_observer);
}

@end
