@implementation AVURLAsset(HeartRhythmUI)

- (double)hrui_assetSize
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  NSObject *v4;
  double v5;
  _QWORD v7[5];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  const char *v13;
  __int128 v14;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = "";
  v14 = *MEMORY[0x24BDBF148];
  v2 = dispatch_semaphore_create(0);
  v3 = *MEMORY[0x24BDB1D50];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke;
  v7[3] = &unk_24D34A9C8;
  v9 = &v10;
  v7[4] = a1;
  v4 = v2;
  v8 = v4;
  objc_msgSend(a1, "loadTracksWithMediaType:completionHandler:", v3, v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = v11[4];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)hrui_thumbnailImage
{
  void *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(MEMORY[0x24BDB23B0], "assetImageGeneratorWithAsset:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke;
  v9[3] = &unk_24D34A9F0;
  v11 = &v12;
  v9[4] = a1;
  v4 = v3;
  v10 = v4;
  v7 = *MEMORY[0x24BDC0D88];
  v8 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(v2, "generateCGImageAsynchronouslyForTime:completionHandler:", &v7, v9);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v5;
}

@end
