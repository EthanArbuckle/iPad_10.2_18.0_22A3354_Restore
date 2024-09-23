@implementation PHAssetExportRequestPerformMediaConversion

void __PHAssetExportRequestPerformMediaConversion_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v13 = 0;
    PHAssetExportRequestCopyFileURL(v3, v4, v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v6)
    {
      v8 = v6;
      v9 = 0;
    }
    else
    {
      v8 = 0;
      v9 = v7;
    }
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v8, v9);
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "removeTemporaryFiles");
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v12);

  }
}

@end
