@implementation IsOriginalKnownUnsupportedFormatForAsset

void ___IsOriginalKnownUnsupportedFormatForAsset_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v2, "originalVideoComplementUniformTypeIdentifier");
  else
    objc_msgSend(v2, "originalUniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isVideo") & 1) != 0)
  {
    v5 = 1;
    if (!v4)
    {
LABEL_9:
      if (v5)
      {
        if (*(_BYTE *)(a1 + 65))
        {
          v16 = 0;
          v8 = objc_msgSend(v3, "isPlayableVideo:", &v16);
          v9 = v16;
        }
        else
        {
          v8 = objc_msgSend(v3, "isPlayableVideo:", 0);
          v9 = 0;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8 ^ 1;
        if (*(_BYTE *)(a1 + 65))
        {
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            v12 = v9 == 0;
          else
            v12 = 1;
          if (!v12)
          {
            v17 = CFSTR("CodecName");
            v18 = v9;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
  else
  {
    v5 = *(_BYTE *)(a1 + 64) != 0;
    if (!v4)
      goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x1E0D75130];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "canGenerateImageDerivativesFromType:", v7);

  if ((v6 & 1) != 0)
    goto LABEL_9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_BYTE *)(a1 + 65) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v19 = CFSTR("UTI");
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(id *)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
LABEL_22:

  }
LABEL_23:

}

@end
