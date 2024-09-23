@implementation CNMonitorSetQueueAndHandler

void __CNMonitorSetQueueAndHandler_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *HandlerQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[5];

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[7] + 16);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(_QWORD *)(a1[7] + 24);
  *(_QWORD *)(a1[7] + 16) = a1[8];
  v2 = a1[7];
  *(_QWORD *)(v2 + 24) = a1[4];
  v3 = a1[8];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    *(_BYTE *)(v2 + 32) = 1;
LABEL_4:
  if (*(_BYTE *)(v2 + 32))
  {
    if (*(_QWORD *)v2)
    {
      HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)v2);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 0x40000000;
      v6[2] = __CNMonitorSetQueueAndHandler_block_invoke_2;
      v6[3] = &__block_descriptor_tmp;
      v6[4] = a1[7];
      v5 = v6;
LABEL_7:
      dispatch_async(HandlerQueue, v5);
      return;
    }
    if (!*(_BYTE *)(v2 + 33))
    {
      *(_BYTE *)(v2 + 33) = 1;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 0x40000000;
      v9[2] = __CNMonitorSetupConnection_block_invoke;
      v9[3] = &__block_descriptor_tmp_5;
      v9[4] = v2;
      v7[6] = v2;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 0x40000000;
      v8[2] = __CNMonitorSetupConnection_block_invoke_2;
      v8[3] = &__block_descriptor_tmp_7;
      v8[4] = v2;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 0x40000000;
      v7[2] = __CNMonitorSetupConnection_block_invoke_8;
      v7[3] = &unk_24BF213A8;
      v7[4] = v9;
      v7[5] = v8;
      HandlerQueue = dispatch_get_global_queue(0, 0);
      v5 = v7;
      goto LABEL_7;
    }
  }
}

void __CNMonitorSetQueueAndHandler_block_invoke_2(uint64_t a1)
{
  CNMonitorSyncState(*(_QWORD *)(a1 + 32));
}

@end
