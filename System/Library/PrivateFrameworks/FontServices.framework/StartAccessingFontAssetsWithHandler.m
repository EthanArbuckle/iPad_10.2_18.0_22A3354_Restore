@implementation StartAccessingFontAssetsWithHandler

uint64_t __StartAccessingFontAssetsWithHandler_block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_199);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __StartAccessingFontAssetsWithHandler_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state") == 2)
  {
    objc_msgSend(v6, "getLocalFileUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      StartAccessingFontAssetsWithHandler_sSuccess = 1;
      *a4 = 1;
    }
  }

}

@end
