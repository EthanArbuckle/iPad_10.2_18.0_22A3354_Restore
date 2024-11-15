@implementation NWStatsPollHandler

- (id)deliveryBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setNtstatContext:(unint64_t)a3
{
  self->_ntstatContext = a3;
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setDeliveryBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NWStatsPollHandler)init
{
  NWStatsPollHandler *result;
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NWStatsPollHandler;
  result = -[NWStatsPollHandler init](&v4, sel_init);
  if (result)
  {
    v3 = pollHandlerNextSeqno++;
    result->_instanceNumber = v3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsPollHandler at %p instance %lld, context %lld"), self, -[NWStatsPollHandler instanceNumber](self, "instanceNumber"), self->_ntstatContext);
}

- (void)handleSnapshot:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[NWStatsPollHandler deliveryBlock](self, "deliveryBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWStatsPollHandler deliveryBlock](self, "deliveryBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (int64_t)instanceNumber
{
  return self->_instanceNumber;
}

- (void)setInstanceNumber:(int64_t)a3
{
  self->_instanceNumber = a3;
}

- (unint64_t)ntstatContext
{
  return self->_ntstatContext;
}

- (NWStatsManager)manager
{
  return (NWStatsManager *)objc_getProperty(self, a2, 48, 1);
}

@end
