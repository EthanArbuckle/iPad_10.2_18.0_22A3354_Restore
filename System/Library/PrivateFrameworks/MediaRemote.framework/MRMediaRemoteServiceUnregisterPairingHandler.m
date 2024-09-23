@implementation MRMediaRemoteServiceUnregisterPairingHandler

void __MRMediaRemoteServiceUnregisterPairingHandler_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
    _MRServiceLogReplyError();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  kdebug_trace();

}

@end
