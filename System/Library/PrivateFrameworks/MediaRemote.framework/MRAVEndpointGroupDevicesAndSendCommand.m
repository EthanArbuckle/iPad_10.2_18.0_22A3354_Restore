@implementation MRAVEndpointGroupDevicesAndSendCommand

void __MRAVEndpointGroupDevicesAndSendCommand_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v9, "sendError");
  objc_msgSend(v9, "handlerReturnStatuses");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, id, id))(v6 + 16))(v6, v10, v8, v7, v11);
}

@end
