@implementation MRMediaRemoteServiceUpdateActiveSystemEndpointUID

void __MRMediaRemoteServiceUpdateActiveSystemEndpointUID_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  kdebug_trace();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

@end
