@implementation IMDelayedInvocationTrampoline

- (IMDelayedInvocationTrampoline)initWithTarget:(id)a3 delay:(double)a4 modes:(id)a5
{
  id v8;
  id v9;
  IMDelayedInvocationTrampoline *v10;
  const char *v11;
  uint64_t v12;
  IMDelayedInvocationTrampoline *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMDelayedInvocationTrampoline;
  v10 = -[IMDelayedInvocationTrampoline init](&v15, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setTarget_(v10, v11, (uint64_t)v8, v12);
    objc_storeStrong((id *)&v13->_modes, a5);
    v13->_delay = a4;
  }

  return v13;
}

- (void)forwardInvocation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  double delay;
  id v9;

  v9 = a3;
  objc_msgSend_retainArguments(v9, v4, v5, v6);
  delay = self->_delay;
  if (self->_modes)
    objc_msgSend_performSelector_withObject_afterDelay_inModes_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v9, delay);
  else
    objc_msgSend_performSelector_withObject_afterDelay_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v9, delay);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modes, 0);
}

@end
