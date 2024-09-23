@implementation PurgeFontAssetsWithHandler

void __PurgeFontAssetsWithHandler_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PurgeFontAssetsWithHandler_block_invoke_2;
  v3[3] = &unk_1E4255FF0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __PurgeFontAssetsWithHandler_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "state") == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    if ((_DWORD)v3)
      objc_msgSend(v5, "purge:", &__block_literal_global_202);
  }

}

@end
