@implementation FPCrossDeviceItemIDForItemAtURL

void __FPCrossDeviceItemIDForItemAtURL_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "itemID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    FPCrossDeviceItemIDForItemID(v4, *(void **)(a1 + 32));

  }
}

@end
