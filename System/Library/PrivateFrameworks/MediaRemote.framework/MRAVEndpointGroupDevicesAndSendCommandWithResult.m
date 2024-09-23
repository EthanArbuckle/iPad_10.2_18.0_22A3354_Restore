@implementation MRAVEndpointGroupDevicesAndSendCommandWithResult

void __MRAVEndpointGroupDevicesAndSendCommandWithResult_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  MRCommandResult *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[MRCommandResult initWithResultStatuses:sendError:playerPath:]([MRCommandResult alloc], "initWithResultStatuses:sendError:playerPath:", v9, a2, *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
