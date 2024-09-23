@implementation PHAssetResource

uint64_t __61__PHAssetResource_MediaAnalysis__vcp_ascendingSizeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "pixelWidth");
  v7 = objc_msgSend(v4, "pixelHeight");
  v8 = objc_msgSend(v5, "pixelWidth");
  v9 = objc_msgSend(v5, "pixelHeight");
  v10 = v7 * v6;
  if (v7 * v6)
  {
    v11 = v9 * v8;
    if (v9 * v8)
    {
      if (v10 > v11)
      {
        v12 = 1;
        goto LABEL_13;
      }
      if (v10 < v11)
      {
        v12 = -1;
        goto LABEL_13;
      }
LABEL_12:
      objc_msgSend(v4, "assetLocalIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetLocalIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "compare:", v16);

      goto LABEL_13;
    }
  }
  v13 = objc_msgSend(v5, "type");
  v14 = objc_msgSend(v4, "type");
  if (v13 > v14)
    v12 = 1;
  else
    v12 = -1;
  if (v13 == v14)
    goto LABEL_12;
LABEL_13:

  return v12;
}

uint64_t __62__PHAssetResource_MediaAnalysis__vcp_descendingSizeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "pixelWidth");
  v7 = objc_msgSend(v4, "pixelHeight");
  v8 = objc_msgSend(v5, "pixelWidth");
  v9 = objc_msgSend(v5, "pixelHeight");
  v10 = v7 * v6;
  if (v7 * v6)
  {
    v11 = v9 * v8;
    if (v9 * v8)
    {
      if (v10 > v11)
      {
        v12 = -1;
        goto LABEL_13;
      }
      if (v10 < v11)
      {
        v12 = 1;
        goto LABEL_13;
      }
LABEL_12:
      objc_msgSend(v4, "assetLocalIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetLocalIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "compare:", v16);

      goto LABEL_13;
    }
  }
  v13 = objc_msgSend(v5, "type");
  v14 = objc_msgSend(v4, "type");
  if (v13 > v14)
    v12 = -1;
  else
    v12 = 1;
  if (v13 == v14)
    goto LABEL_12;
LABEL_13:

  return v12;
}

@end
