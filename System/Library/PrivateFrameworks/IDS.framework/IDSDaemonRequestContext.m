@implementation IDSDaemonRequestContext

- (void)dealloc
{
  objc_super v3;

  -[IMTimer invalidate](self->_systemTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)IDSDaemonRequestContext;
  -[IDSDaemonRequestContext dealloc](&v3, sel_dealloc);
}

- (IDSDaemonRequestContext)initWithResponseHandler:(id)a3 timeoutBlock:(id)a4 systemTimer:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSDaemonRequestContext *v12;
  IDSDaemonRequestContext *v13;
  uint64_t v14;
  id timeoutBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSDaemonRequestContext;
  v12 = -[IDSDaemonRequestContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseHandler, a3);
    v14 = objc_msgSend(v10, "copy");
    timeoutBlock = v13->_timeoutBlock;
    v13->_timeoutBlock = (id)v14;

    objc_storeStrong((id *)&v13->_systemTimer, a5);
  }

  return v13;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (id)timeoutBlock
{
  return (id)MEMORY[0x19400FE1C](self->_timeoutBlock, a2);
}

- (id)systemTimer
{
  return self->_systemTimer;
}

- (void)killSystemTimer
{
  IMTimer *systemTimer;

  -[IMTimer invalidate](self->_systemTimer, "invalidate");
  systemTimer = self->_systemTimer;
  self->_systemTimer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemTimer, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_responseHandler, 0);
}

@end
