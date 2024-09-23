@implementation MRMediaRemoteServiceGetPlayerProperties

void __MRMediaRemoteServiceGetPlayerProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  MRCreatePlayerFromXPCMessage(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

@end
