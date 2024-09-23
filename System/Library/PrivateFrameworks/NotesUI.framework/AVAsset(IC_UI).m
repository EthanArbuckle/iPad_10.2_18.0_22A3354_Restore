@implementation AVAsset(IC_UI)

- (id)ic_previewImage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v12;
  CMTime time1;
  int32_t timescale[4];
  uint64_t v15;
  CMTime v16;

  objc_msgSend(a1, "commonMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v2, *MEMORY[0x1E0C8A888], *MEMORY[0x1E0C8A9D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v2, *MEMORY[0x1E0C8AA78], *MEMORY[0x1E0C8A9F0]);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", a1);
  objc_msgSend(v8, "setAppliesPreferredTrackTransform:", 1);
  v16 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  memset(timescale, 0, sizeof(timescale));
  v15 = 0;
  objc_msgSend(a1, "duration");
  v12 = 0;
  time1 = v16;
  v9 = objc_msgSend(v8, "copyCGImageAtTime:actualTime:error:", &time1, 0, &v12);
  if (v9)
  {
    v10 = (const void *)v9;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
  }
  else
  {
    v7 = 0;
  }

LABEL_12:
  return v7;
}

@end
