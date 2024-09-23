@implementation MRContentItemSetAssetURL

BOOL __MRContentItemSetAssetURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;

  v5 = a2;
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != a3;
  if (v7 == a3)
  {

LABEL_8:
    goto LABEL_9;
  }
  v9 = v7;
  if (!a3)
  {

    goto LABEL_7;
  }
  objc_msgSend(v5, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", a3);

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssetURL:", v13);
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

@end
