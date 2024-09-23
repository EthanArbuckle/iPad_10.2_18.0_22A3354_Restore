@implementation MAPurgeCatalogsWithPurpose

void __MAPurgeCatalogsWithPurpose_block_invoke(uint64_t a1, void *a2)
{
  int64_t int64;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    errorStringForMAPurgeResult(1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Purge"), 1, CFSTR("%@ due to XPC_TYPE_ERROR"), v12, v13, v14, v15, v16, (uint64_t)v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    _MobileAssetLog(0, 6, (uint64_t)"MAPurgeCatalogsWithPurpose_block_invoke", CFSTR("Asset purge catalogs failed due to XPC"), v17, v18, v19, v20, v22);
  }
  else
  {
    int64 = xpc_dictionary_get_int64(xdict, "Result");
    v4 = (void *)int64;
    if (int64)
    {
      errorStringForPurgeResult(int64);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MAError(CFSTR("com.apple.MobileAssetError.Purge"), (uint64_t)v4, CFSTR("%@"), v6, v7, v8, v9, v10, (uint64_t)v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v4);

}

@end
