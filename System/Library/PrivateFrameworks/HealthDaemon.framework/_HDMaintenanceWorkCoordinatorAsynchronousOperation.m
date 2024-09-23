@implementation _HDMaintenanceWorkCoordinatorAsynchronousOperation

- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4
{
  return -[_HDMaintenanceWorkCoordinatorAsynchronousOperation initWithName:operationBlock:canceledBlock:](self, "initWithName:operationBlock:canceledBlock:", a3, a4, 0);
}

- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4 canceledBlock:(id)a5
{
  id v8;
  id v9;
  _HDMaintenanceWorkCoordinatorAsynchronousOperation *v10;
  uint64_t v11;
  id operationBlock;
  void *v13;
  id canceledBlock;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_HDMaintenanceWorkCoordinatorAsynchronousOperation;
  v10 = -[HDMaintenanceOperation initWithName:](&v16, sel_initWithName_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    operationBlock = v10->_operationBlock;
    v10->_operationBlock = (id)v11;

    v13 = _Block_copy(v9);
    canceledBlock = v10->_canceledBlock;
    v10->_canceledBlock = v13;

  }
  return v10;
}

- (void)cancel
{
  void (**canceledBlock)(id, _QWORD *);
  _QWORD v4[5];

  canceledBlock = (void (**)(id, _QWORD *))self->_canceledBlock;
  if (canceledBlock)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60___HDMaintenanceWorkCoordinatorAsynchronousOperation_cancel__block_invoke;
    v4[3] = &unk_1E6CE80E8;
    v4[4] = self;
    canceledBlock[2](canceledBlock, v4);
  }
  else
  {
    -[HDMaintenanceOperation finish]((uint64_t)self);
  }
}

- (void)main
{
  void (**operationBlock)(id, _QWORD *);
  _QWORD v3[5];

  operationBlock = (void (**)(id, _QWORD *))self->_operationBlock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58___HDMaintenanceWorkCoordinatorAsynchronousOperation_main__block_invoke;
  v3[3] = &unk_1E6CE80E8;
  v3[4] = self;
  operationBlock[2](operationBlock, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_storeStrong(&self->_operationBlock, 0);
}

@end
