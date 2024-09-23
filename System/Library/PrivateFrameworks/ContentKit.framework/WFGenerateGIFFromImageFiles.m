@implementation WFGenerateGIFFromImageFiles

void __WFGenerateGIFFromImageFiles_block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD v15[6];

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = WFAutoSizeFromInputSize(*(void **)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __WFGenerateGIFFromImageFiles_block_invoke_2;
  v15[3] = &__block_descriptor_48_e53_v32__0__WFFileRepresentation_8Q16___v_____NSError__24l;
  *(double *)&v15[4] = v2;
  v15[5] = v4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __WFGenerateGIFFromImageFiles_block_invoke_5;
  v8[3] = &unk_24C4DC4B8;
  v11 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 80);
  v14 = *(_DWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v3, "if_mapAsynchronously:completionHandler:", v15, v8);

}

uint64_t __WFGenerateGIFFromImageFiles_block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __WFGenerateGIFFromImageFiles_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, id, _QWORD);
  id v7;
  double v8;
  _QWORD v10[4];
  void (**v11)(id, id, _QWORD);

  v6 = a4;
  v7 = a2;
  if (WFImageSizeFromFile(v7, 0) == *(double *)(a1 + 32) && v8 == *(double *)(a1 + 40))
  {
    v6[2](v6, v7, 0);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __WFGenerateGIFFromImageFiles_block_invoke_4;
    v10[3] = &unk_24C4E2ED8;
    v11 = v6;
    WFAsyncTransformedImageFromImage(v7, 0, &__block_literal_global_3044, v10, *(double *)(a1 + 32), *(double *)(a1 + 40));

    v7 = v11;
  }

}

void __WFGenerateGIFFromImageFiles_block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  const __CFURL *v7;
  __CFString *v8;
  CGImageDestination *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  double v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGImageSourceRef v23;
  CGImageSource *v24;
  size_t v25;
  void *v26;
  const __CFURL *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const __CFDictionary *v33;
  const __CFURL *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = (void *)*MEMORY[0x24BDF83D8];
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
    v36 = objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", *(_QWORD *)(a1 + 32));
    v35 = objc_claimAutoreleasedReturnValue();
    +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:");
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = v7;
    v9 = CGImageDestinationCreateWithURL(v7, v8, objc_msgSend(*(id *)(a1 + 40), "count"), 0);

    v48 = *MEMORY[0x24BDD9598];
    v10 = v48;
    v46[0] = *MEMORY[0x24BDD95B0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = *MEMORY[0x24BDD95A8];
    v47[0] = v11;
    v47[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v33 = v13;
    CGImageDestinationSetProperties(v9, v13);
    v44 = v10;
    v42 = *MEMORY[0x24BDD9590];
    *(float *)&v14 = 1.0 / *(float *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
LABEL_5:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          break;
        v23 = WFImageSourceCreateFromFile(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v22), 0);
        if (v23)
        {
          v24 = v23;
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            v25 = 0;
            do
            {
              if (v25 >= CGImageSourceGetCount(v24))
                break;
              CGImageDestinationAddImageFromSource(v9, v24, v25++, v17);
            }
            while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
          }
          CFRelease(v24);
        }
        if (++v22 == v20)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16, v33);
          if (v20)
            goto LABEL_5;
          break;
        }
      }
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      CFRelease(v9);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v34;
      objc_msgSend(v26, "removeItemAtURL:error:", v34, 0);

      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v29);
      v31 = (void *)v35;
      v30 = (void *)v36;
    }
    else
    {
      CGImageDestinationFinalize(v9);
      CFRelease(v9);
      v32 = *(_QWORD *)(a1 + 48);
      v27 = v34;
      v31 = (void *)v35;
      v30 = (void *)v36;
      +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v34, 1, v36, v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v32 + 16))(v32, v29, 0);
    }

  }
}

uint64_t __WFGenerateGIFFromImageFiles_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __WFGenerateGIFFromImageFiles_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "drawInContext:inRect:");
}

@end
