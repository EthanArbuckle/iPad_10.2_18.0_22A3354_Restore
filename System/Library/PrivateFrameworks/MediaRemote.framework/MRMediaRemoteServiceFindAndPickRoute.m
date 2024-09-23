@implementation MRMediaRemoteServiceFindAndPickRoute

void __MRMediaRemoteServiceFindAndPickRoute_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  _MRServiceCreateGenericErrorFromReply(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
