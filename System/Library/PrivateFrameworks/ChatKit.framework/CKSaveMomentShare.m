@implementation CKSaveMomentShare

void ___CKSaveMomentShare_block_invoke(_QWORD *a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = (void *)a1[4];
  v5 = a2[1];
  v11 = *a2;
  v12 = v5;
  objc_msgSend(v4, "assetAtItemIndexPath:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[5];
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    v9 = (void *)a1[6];
    v10 = a2[1];
    v11 = *a2;
    v12 = v10;
    objc_msgSend(v9, "addIndexPath:", &v11);
  }

}

uint64_t ___CKSaveMomentShare_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t ___CKSaveMomentShare_block_invoke_57(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

@end
