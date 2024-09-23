@implementation IMMessageContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_xpcMessage, 0);
}

- (void)setXpcMessage:(id)a3
{
  IMMessageContext *v5;
  OS_xpc_object *v6;

  v6 = (OS_xpc_object *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_xpcMessage != v6)
    objc_storeStrong((id *)&v5->_xpcMessage, a3);
  objc_sync_exit(v5);

}

- (void)setLocalObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (IMMessageContext)init
{
  IMMessageContext *v2;
  IMMessageContext *v3;
  uint64_t v4;
  OS_voucher *voucher;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMMessageContext;
  v2 = -[IMMessageContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_needReply = 0;
    *(_DWORD *)&v2->_boost = 257;
    v4 = voucher_copy();
    voucher = v3->_voucher;
    v3->_voucher = (OS_voucher *)v4;

  }
  return v3;
}

- (IMLocalObject)localObject
{
  return (IMLocalObject *)objc_getProperty(self, a2, 24, 1);
}

- (OS_xpc_object)xpcMessage
{
  IMMessageContext *v2;
  OS_xpc_object *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcMessage;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (BOOL)isReply
{
  return self->_reply;
}

- (void)setReply:(BOOL)a3
{
  self->_reply = a3;
}

- (id)context
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)shouldBoost
{
  return self->_shouldBoost;
}

- (void)setShouldBoost:(BOOL)a3
{
  self->_shouldBoost = a3;
}

- (BOOL)sync
{
  return self->_sync;
}

- (BOOL)reply
{
  return self->_reply;
}

- (BOOL)needReply
{
  return self->_needReply;
}

- (void)setNeedReply:(BOOL)a3
{
  self->_needReply = a3;
}

- (OS_voucher)voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVoucher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
