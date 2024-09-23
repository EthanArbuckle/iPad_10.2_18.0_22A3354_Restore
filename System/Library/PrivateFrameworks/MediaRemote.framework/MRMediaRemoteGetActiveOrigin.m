@implementation MRMediaRemoteGetActiveOrigin

void __MRMediaRemoteGetActiveOrigin_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v5 = v4;
  msv_dispatch_async_on_queue();

}

void __MRMediaRemoteGetActiveOrigin_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

  }
}

uint64_t __MRMediaRemoteGetActiveOrigin_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
