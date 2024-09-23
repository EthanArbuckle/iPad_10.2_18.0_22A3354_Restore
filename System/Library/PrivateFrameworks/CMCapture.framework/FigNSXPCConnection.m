@implementation FigNSXPCConnection

- (void)setInvalidationHandler:(id)a3
{
  objc_super v3;
  objc_super v4;
  _QWORD v5[6];

  if (a3)
    -[FigNSXPCConnection setInvalidationHandler:](&v4, sel_setInvalidationHandler_, v5, v3.receiver, v3.super_class, self, FigNSXPCConnection, MEMORY[0x1E0C809B0], 3221225472, __45__FigNSXPCConnection_setInvalidationHandler___block_invoke, &unk_1E491F480, self, a3);
  else
    -[FigNSXPCConnection setInvalidationHandler:](&v3, sel_setInvalidationHandler_, 0, self, FigNSXPCConnection, v4.receiver, v4.super_class, v5[0], v5[1], v5[2], v5[3], v5[4], v5[5]);
}

- (void)resume
{
  OS_dispatch_group *v3;
  objc_super v4;

  if (!self->_connectionRunningGroup)
  {
    v3 = (OS_dispatch_group *)dispatch_group_create();
    self->_connectionRunningGroup = v3;
    dispatch_group_enter((dispatch_group_t)v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigNSXPCConnection;
  -[FigNSXPCConnection resume](&v4, sel_resume);
}

void __45__FigNSXPCConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 160));
}

- (void)blockUntilInvalidateHandlerHasBeenCalled
{
  NSObject *connectionRunningGroup;

  connectionRunningGroup = self->_connectionRunningGroup;
  if (connectionRunningGroup)
    dispatch_group_wait(connectionRunningGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigNSXPCConnection;
  -[FigNSXPCConnection invalidate](&v3, sel_invalidate);
  self->_explicitlyInvalidated = 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigNSXPCConnection;
  -[FigNSXPCConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)explicitlyInvalidated
{
  return self->_explicitlyInvalidated;
}

@end
