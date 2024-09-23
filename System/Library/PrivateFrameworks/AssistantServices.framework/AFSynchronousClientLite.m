@implementation AFSynchronousClientLite

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  objc_super v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v19[1] = 3221225472;
  v19[2] = __97__AFSynchronousClientLite__handleCommand_afterCurrentRequest_isOneWay_commandHandler_completion___block_invoke;
  v19[3] = &unk_1E3A31EA8;
  v20 = v15;
  v21 = v12;
  v18.receiver = self;
  v18.super_class = (Class)AFSynchronousClientLite;
  v19[0] = MEMORY[0x1E0C809B0];
  v16 = v15;
  v17 = v12;
  -[AFClientLite _handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:](&v18, sel__handleCommand_afterCurrentRequest_isOneWay_commandHandler_completion_, v14, v9, v8, v13, v19);

  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

void __97__AFSynchronousClientLite__handleCommand_afterCurrentRequest_isOneWay_commandHandler_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
