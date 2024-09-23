@implementation _HDMaintenanceWorkCoordinatorSynchronousOperation

- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  return -[_HDMaintenanceWorkCoordinatorSynchronousOperation initWithName:queue:block:canceledBlock:](self, "initWithName:queue:block:canceledBlock:", a3, a4, a5, 0);
}

- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5 canceledBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  _HDMaintenanceWorkCoordinatorSynchronousOperation *v14;
  _HDMaintenanceWorkCoordinatorSynchronousOperation *v15;
  void *v16;
  id block;
  void *v18;
  id canceledBlock;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HDMaintenanceWorkCoordinatorSynchronousOperation;
  v14 = -[HDMaintenanceOperation initWithName:](&v21, sel_initWithName_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a4);
    v16 = _Block_copy(v12);
    block = v15->_block;
    v15->_block = v16;

    v18 = _Block_copy(v13);
    canceledBlock = v15->_canceledBlock;
    v15->_canceledBlock = v18;

  }
  return v15;
}

- (void)cancel
{
  void (**canceledBlock)(_QWORD);
  NSObject *queue;

  canceledBlock = (void (**)(_QWORD))self->_canceledBlock;
  if (canceledBlock)
  {
    queue = self->_queue;
    if (queue)
      dispatch_sync(queue, canceledBlock);
    else
      canceledBlock[2](canceledBlock);
  }
  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void)main
{
  NSObject *queue;
  void (**block)(_QWORD);

  queue = self->_queue;
  block = (void (**)(_QWORD))self->_block;
  if (queue)
    dispatch_sync(queue, block);
  else
    ((void (**)(id))block)[2](self->_block);
  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
