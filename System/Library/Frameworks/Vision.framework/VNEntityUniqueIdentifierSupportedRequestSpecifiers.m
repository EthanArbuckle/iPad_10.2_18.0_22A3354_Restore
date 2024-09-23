@implementation VNEntityUniqueIdentifierSupportedRequestSpecifiers

void __VNEntityUniqueIdentifierSupportedRequestSpecifiers_block_invoke()
{
  id v0;
  id v1;
  void (**v2)(void *, void *, void *);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD aBlock[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __VNEntityUniqueIdentifierSupportedRequestSpecifiers_block_invoke_2;
  aBlock[3] = &unk_1E4544240;
  v1 = v0;
  v16 = v1;
  v2 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (VNEntityUniqueIdentifierSupportedRequestClasses::ourOnceToken != -1)
    dispatch_once(&VNEntityUniqueIdentifierSupportedRequestClasses::ourOnceToken, &__block_literal_global_21_6095);
  v3 = (id)VNEntityUniqueIdentifierSupportedRequestClasses::ourClasses;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "allSupportedRevisions", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v2[2](v2, v7, v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)VNEntityUniqueIdentifierSupportedRequestSpecifiers::ourRequestSpecifiers;
  VNEntityUniqueIdentifierSupportedRequestSpecifiers::ourRequestSpecifiers = v9;

}

void __VNEntityUniqueIdentifierSupportedRequestSpecifiers_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __VNEntityUniqueIdentifierSupportedRequestSpecifiers_block_invoke_3;
  v4[3] = &unk_1E4544218;
  v6 = a2;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v4);

}

void __VNEntityUniqueIdentifierSupportedRequestSpecifiers_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", *(_QWORD *)(a1 + 40), a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
