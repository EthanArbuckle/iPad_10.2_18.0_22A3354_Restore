@implementation ML3RemovePathsFromPurchaseManifests

void __ML3RemovePathsFromPurchaseManifests_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  if (v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v6 = (void *)getSSDownloadFileManifestClass_softClass;
    v13 = getSSDownloadFileManifestClass_softClass;
    if (!getSSDownloadFileManifestClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getSSDownloadFileManifestClass_block_invoke;
      v9[3] = &unk_1E5B64C48;
      v9[4] = &v10;
      __getSSDownloadFileManifestClass_block_invoke((uint64_t)v9);
      v6 = (void *)v11[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v10, 8);
    v8 = (void *)objc_msgSend([v7 alloc], "initWithManifestType:", a3);
    objc_msgSend(v8, "removeItemsWithAssetPaths:completionBlock:", v5, *(_QWORD *)(a1 + 32));

  }
}

@end
