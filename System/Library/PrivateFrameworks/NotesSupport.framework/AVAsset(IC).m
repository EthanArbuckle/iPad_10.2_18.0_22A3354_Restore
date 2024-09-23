@implementation AVAsset(IC)

- (__CFData)previewImageDataWithUTType:()IC
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFData *v9;
  void *v10;
  CGImage *v11;
  __CFData *v12;
  CGImageDestination *v13;
  uint64_t v15;
  CMTime time1;
  int32_t timescale[4];
  uint64_t v18;
  CMTime v19;

  v4 = a3;
  objc_msgSend(a1, "commonMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v5, *MEMORY[0x1E0C8A888], *MEMORY[0x1E0C8A9D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v5, *MEMORY[0x1E0C8AA78], *MEMORY[0x1E0C8A9F0]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (!objc_msgSend(v6, "count")
    || (objc_msgSend(v6, "objectAtIndexedSubscript:", 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "dataValue"),
        v9 = (__CFData *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", a1);
    objc_msgSend(v10, "setAppliesPreferredTrackTransform:", 1);
    v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    memset(timescale, 0, sizeof(timescale));
    v18 = 0;
    objc_msgSend(a1, "duration");
    v15 = 0;
    time1 = v19;
    v11 = (CGImage *)objc_msgSend(v10, "copyCGImageAtTime:actualTime:error:", &time1, 0, &v15);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v12 = (__CFData *)objc_claimAutoreleasedReturnValue();
    v13 = CGImageDestinationCreateWithData(v12, v4, 1uLL, 0);
    CGImageDestinationAddImage(v13, v11, 0);
    v9 = 0;
    if (CGImageDestinationFinalize(v13))
      v9 = v12;
    CFRelease(v13);
    CGImageRelease(v11);

  }
  return v9;
}

- (CGImageSourceRef)newPreviewImageSource
{
  void *v2;
  const __CFData *v3;
  CGImageSourceRef v4;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "previewImageDataWithUTType:", v2);
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = CGImageSourceCreateWithData(v3, 0);
  else
    v4 = 0;

  return v4;
}

@end
