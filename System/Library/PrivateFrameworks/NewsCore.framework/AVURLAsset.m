@implementation AVURLAsset

void __78__AVURLAsset_FCAdditions__fc_fetchContentKeyIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fc_firstObjectPassingTest:", &__block_literal_global_163);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    FCKeyIdentifiersFromHLSMetadata(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, MEMORY[0x1E0C9AA60]);
  }

}

uint64_t __50__AVURLAsset_FCAdditions___fc_hlsKeysMetadataItem__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.hls.keys"));

  return v3;
}

@end
