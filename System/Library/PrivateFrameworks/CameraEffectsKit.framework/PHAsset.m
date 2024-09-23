@implementation PHAsset

uint64_t __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke()
{
  return 1;
}

void __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void (*v8)(void);
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9
    || (objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDE3798]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v6,
        !v7))
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

void __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7
    || (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE3810]),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        !v12))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (!*(_BYTE *)(a1 + 64)
      && ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight") > 0x86F
       || (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelWidth") >= 0x870)
      && !+[CFXVideoSettings canDecodeHEVC2160P](CFXVideoSettings, "canDecodeHEVC2160P"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setDeliveryMode:", 2);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_4;
      v17[3] = &unk_24EE584C0;
      v16 = *(void **)(a1 + 48);
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v16, "requestAVAssetForVideo:options:resultHandler:", v14, v15, v17);

      goto LABEL_7;
    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v13();
LABEL_7:

}

uint64_t __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
