@implementation WFEncodeAssetToAIFF

void __WFEncodeAssetToAIFF_block_invoke(id *a1)
{
  uint64_t v2;
  const void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  if (objc_msgSend(a1[4], "isReadyForMoreMediaData"))
  {
    v2 = MEMORY[0x24BDAC760];
    do
    {
      v3 = (const void *)objc_msgSend(a1[5], "copyNextSampleBuffer");
      v4 = a1[4];
      if (v3)
      {
        objc_msgSend(v4, "appendSampleBuffer:", v3);
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v5 = getCMSampleBufferInvalidateSymbolLoc_ptr;
        v20 = getCMSampleBufferInvalidateSymbolLoc_ptr;
        if (!getCMSampleBufferInvalidateSymbolLoc_ptr)
        {
          v6 = CoreMediaLibrary_4323();
          v5 = dlsym(v6, "CMSampleBufferInvalidate");
          v18[3] = (uint64_t)v5;
          getCMSampleBufferInvalidateSymbolLoc_ptr = v5;
        }
        _Block_object_dispose(&v17, 8);
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "OSStatus soft_CMSampleBufferInvalidate(CMSampleBufferRef _Nonnull)");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFAudioInterchangeFormatEncoder.m"), 17, CFSTR("%s"), dlerror());

          __break(1u);
          return;
        }
        ((void (*)(const void *))v5)(v3);
        CFRelease(v3);
      }
      else
      {
        objc_msgSend(v4, "markAsFinished");
        v7 = a1[6];
        v10[0] = v2;
        v10[1] = 3221225472;
        v10[2] = __WFEncodeAssetToAIFF_block_invoke_2;
        v10[3] = &unk_24C4DCCF8;
        v16 = a1[11];
        v11 = a1[7];
        v12 = a1[8];
        v13 = a1[9];
        v14 = a1[6];
        v15 = a1[10];
        objc_msgSend(v7, "finishWritingWithCompletionHandler:", v10);

      }
    }
    while ((objc_msgSend(a1[4], "isReadyForMoreMediaData") & 1) != 0);
  }
}

void __WFEncodeAssetToAIFF_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 72);
  +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      v5 = *(void **)(a1 + 64);
    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v5);

  }
}

@end
