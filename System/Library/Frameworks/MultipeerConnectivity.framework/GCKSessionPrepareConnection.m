@implementation GCKSessionPrepareConnection

intptr_t __GCKSessionPrepareConnection_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __GCKSessionPrepareConnection_block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "ICE connectivity check failsafe timer for participant [%08X] fired!", (uint8_t *)v4, 8u);
  }
  gckCallICEListRemoveSignalBlock(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40));
}

@end
