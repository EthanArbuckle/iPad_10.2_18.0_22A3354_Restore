@implementation WFAddImageFileToGIF

void __WFAddImageFileToGIF_block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v33[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WFAutoSizeFromInputSize(v2, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = v4;

  v6 = WFImageSizeFromFile(*(void **)(a1 + 40), 0);
  v8 = v7;
  v9 = dispatch_group_create();
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18;
  v31 = __Block_byref_object_dispose__19;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__19;
  v26 = 0;
  dispatch_group_enter(v9);
  v10 = v6 == v3 && v8 == v5;
  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    objc_storeStrong(v28 + 5, *(id *)(a1 + 40));
    dispatch_group_leave(v9);
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __WFAddImageFileToGIF_block_invoke_3;
    v22[3] = &unk_24C4E0CB8;
    v24 = &v27;
    v23 = v9;
    WFAsyncTransformedImageFromImage(v12, 0, &__block_literal_global_28, v22, v3, v5);

  }
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __WFAddImageFileToGIF_block_invoke_4;
  v15[3] = &unk_24C4DC5A0;
  v19 = v25;
  v18 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 80);
  v17 = v14;
  v20 = &v27;
  dispatch_group_notify(v9, v13, v15);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

}

void __WFAddImageFileToGIF_block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __WFAddImageFileToGIF_block_invoke_4(uint64_t a1)
{
  CGImageSource *v2;
  size_t Count;
  void *v4;
  void *v5;
  const __CFURL *v6;
  __CFString *v7;
  CGImageDestination *v8;
  CFDictionaryRef v9;
  uint64_t v10;
  void *v11;
  const __CFDictionary *v12;
  size_t i;
  void *v14;
  void *v15;
  const __CFDictionary *v16;
  CGImageSource *v17;
  size_t j;
  uint64_t v19;
  void *v20;
  CFDictionaryRef v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v2 = WFImageSourceCreateFromFile(*(void **)(a1 + 32), 0);
    Count = CGImageSourceGetCount(v2);
    v4 = (void *)*MEMORY[0x24BDF83D8];
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v5);
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = CGImageDestinationCreateWithURL(v6, v7, Count + 1, 0);

    v9 = CGImageSourceCopyProperties(v2, 0);
    v10 = *MEMORY[0x24BDD9598];
    v27 = v10;
    v21 = v9;
    -[__CFDictionary objectForKey:](v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGImageDestinationSetProperties(v8, v12);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
        CGImageDestinationAddImageFromSource(v8, v2, i, 0);
    }
    CFRelease(v2);
    v25 = v10;
    v23 = *MEMORY[0x24BDD9590];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v17 = WFImageSourceCreateFromFile(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0);
    for (j = 0; j < CGImageSourceGetCount(v17); ++j)
      CGImageDestinationAddImageFromSource(v8, v17, j, v16);
    CFRelease(v17);
    CGImageDestinationFinalize(v8);
    CFRelease(v8);
    v19 = *(_QWORD *)(a1 + 48);
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v6, 1, v22, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);

  }
}

uint64_t __WFAddImageFileToGIF_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "drawInContext:inRect:");
}

@end
