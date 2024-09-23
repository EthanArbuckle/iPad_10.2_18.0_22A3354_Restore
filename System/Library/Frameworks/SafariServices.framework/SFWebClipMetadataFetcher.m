@implementation SFWebClipMetadataFetcher

void __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke_2;
  v5[3] = &unk_1E4AC2618;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "parseRawMetadataDictionary:consumer:", v3, v5);

}

void __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects", (_QWORD)v13);
}

@end
