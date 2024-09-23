@implementation PHAssetCanPerformAdditionalProcessingOnAsset

void __PHAssetCanPerformAdditionalProcessingOnAsset_block_invoke_270()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supportedFileTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0CEC568];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "conformsToType:", v6);

        if (v10)
          objc_msgSend(v1, "addObject:", v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  v11 = objc_msgSend(v1, "copy");
  v12 = (void *)PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats;
  PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats = v11;

}

void __PHAssetCanPerformAdditionalProcessingOnAsset_block_invoke()
{
  CFArrayRef v0;
  void *v1;

  v0 = CGImageSourceCopyTypeIdentifiers();
  v1 = (void *)PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats;
  PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats = (uint64_t)v0;

}

@end
