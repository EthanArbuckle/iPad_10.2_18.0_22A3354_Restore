@implementation LTLanguageAssetRequest

void __56___LTLanguageAssetRequest_assetRequestWithService_done___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v2 = objc_msgSend(a1[5], "copy");
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v2;

    objc_storeStrong((id *)WeakRetained + 2, a1[4]);
    objc_msgSend(*((id *)WeakRetained + 2), "assetRequestHandler:");
  }

}

void __68___LTLanguageAssetRequest_assetResponseWithProgress_finished_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)WeakRetained + 4);
    objc_msgSend(v4, "assetResponseWithProgress:finished:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

    if (*(_BYTE *)(a1 + 56))
    {
      v3 = v8;
      v5 = v8[8];
      if (v5)
      {
        (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));
        v3 = v8;
      }
      v6 = v3[3];
      if (v6)
      {
        (*(void (**)(void))(v6 + 16))();
LABEL_9:
        v3 = v8;
      }
    }
    else
    {
      v3 = v8;
      v7 = v8[7];
      if (v7)
      {
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 32));
        goto LABEL_9;
      }
    }
  }

}

@end
