@implementation AVAsset(MediaAnalysis)

- (id)vcp_firstEnabledTrackWithMediaType:()MediaAnalysis
{
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "tracksWithMediaType:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)vcp_enabledTracksWithMediaType:()MediaAnalysis
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "tracksWithMediaType:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled"))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)vcp_isShortMovie
{
  CMTime time;

  objc_msgSend(a1, "duration");
  return CMTimeGetSeconds(&time) < 1.0;
}

- (uint64_t)vcp_isMontage
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  objc_msgSend(a1, "availableMetadataFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A908];
  v4 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8A908]);

  if (!v4)
    return 0;
  v5 = *MEMORY[0x1E0C8A968];
  objc_msgSend(a1, "metadataForFormat:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8A9E8];
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v6, v5, *MEMORY[0x1E0C8A9E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v6, *MEMORY[0x1E0C8AAB0], v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_12:

    return 0;
  }
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Memories")) & 1) == 0
    && !objc_msgSend(v11, "isEqualToString:", CFSTR("iMovie")))
  {

    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "AVAsset: Montage asset detected", v13, 2u);
  }

  return 1;
}

- (void)vcp_livePhotoStillDisplayTime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  opaqueCMSampleBuffer *v16;
  opaqueCMSampleBuffer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CMTimeEpoch v24;
  uint64_t v25;
  uint64_t v26;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  id obj;
  void *v32;
  CMTime v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (!v2)
  {

LABEL_30:
    v25 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v25 + 16);
    return;
  }
  v32 = 0;
  v3 = *(_QWORD *)v39;
  v4 = *MEMORY[0x1E0CA4CC0];
  do
  {
    for (i = 0; i != v2; ++i)
    {
      if (*(_QWORD *)v39 != v3)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v6, "formatDescriptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v35;
        while (2)
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v35 != v9)
              objc_enumerationMutation(v7);
            CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((_QWORD *)&v34 + 1) + 8 * j));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "containsObject:", v4))
            {
              v12 = v6;

              v32 = v12;
              goto LABEL_16;
            }

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_16:

    }
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  }
  while (v2);

  if (!v32)
    goto LABEL_30;
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v32, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", a1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "addOutput:", v13);
    if (!objc_msgSend(v15, "startReading"))
    {
      v26 = MEMORY[0x1E0CA2E18];
      v23 = a2;
      *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
      v24 = *(_QWORD *)(v26 + 16);
      goto LABEL_32;
    }
    do
    {
      v16 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "copyNextSampleBuffer");
      v17 = v16;
      if (!v16)
        break;
      if (CMSampleBufferGetNumSamples(v16))
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", v17);
        v19 = (void *)MEMORY[0x1E0C8B220];
        objc_msgSend(v18, "items");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "metadataItemsFromArray:filteredByIdentifier:", v20, v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          CMSampleBufferGetOutputPresentationTimeStamp(&v33, v17);
          value = v33.value;
          flags = v33.flags;
          timescale = v33.timescale;
          epoch = v33.epoch;
        }

      }
      CFRelease(v17);
    }
    while ((flags & 1) == 0);
    objc_msgSend(v15, "cancelReading");
  }
  v23 = a2;
  *(_QWORD *)a2 = value;
  *(_DWORD *)(a2 + 8) = timescale;
  *(_DWORD *)(a2 + 12) = flags;
  v24 = epoch;
LABEL_32:
  *(_QWORD *)(v23 + 16) = v24;

}

- (CFTypeRef)vcp_keyFrameWithMaxDimension:()MediaAnalysis
{
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  const void *v9;
  CFTypeRef v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  const void **(*v21)(uint64_t);
  void *v22;
  const void *v23;

  v5 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppliesPreferredTrackTransform:", 1);
  if (a3)
    objc_msgSend(v6, "setMaximumSize:", (double)a3, (double)a3);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3812000000;
  v20 = __Block_byref_object_copy__29;
  v21 = __Block_byref_object_dispose__29;
  v22 = &unk_1B706A4DA;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  v15 = *MEMORY[0x1E0CA2E68];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__AVAsset_MediaAnalysis__vcp_keyFrameWithMaxDimension___block_invoke;
  v12[3] = &unk_1E6B19670;
  v14 = &v17;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "generateCGImageAsynchronouslyForTime:completionHandler:", &v15, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (const void *)v18[6];
  if (v9)
    v10 = CFRetain(v9);
  else
    v10 = 0;

  _Block_object_dispose(&v17, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v23);

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (CFTypeRef)vcp_frameAtTimeStamp:()MediaAnalysis withMaxDimension:
{
  void *v7;
  void *v8;
  __int128 *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  const void *v12;
  CFTypeRef v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  const void **(*v24)(uint64_t);
  void *v25;
  const void *v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppliesPreferredTrackTransform:", 0);
  objc_msgSend(v8, "setApertureMode:", *MEMORY[0x1E0C89ED0]);
  v9 = (__int128 *)MEMORY[0x1E0CA2E68];
  v29 = *MEMORY[0x1E0CA2E68];
  v30 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v8, "setRequestedTimeToleranceBefore:", &v29);
  v27 = *v9;
  v28 = *((_QWORD *)v9 + 2);
  objc_msgSend(v8, "setRequestedTimeToleranceAfter:", &v27);
  if (a4)
    objc_msgSend(v8, "setMaximumSize:", (double)a4, (double)a4);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3812000000;
  v23 = __Block_byref_object_copy__29;
  v24 = __Block_byref_object_dispose__29;
  v25 = &unk_1B706A4DA;
  v26 = 0;
  v10 = dispatch_semaphore_create(0);
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AVAsset_MediaAnalysis__vcp_frameAtTimeStamp_withMaxDimension___block_invoke;
  v15[3] = &unk_1E6B19670;
  v17 = &v20;
  v11 = v10;
  v16 = v11;
  objc_msgSend(v8, "generateCGImageAsynchronouslyForTime:completionHandler:", &v18, v15);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (const void *)v21[6];
  if (v12)
    v13 = CFRetain(v12);
  else
    v13 = 0;

  _Block_object_dispose(&v20, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v26);

  objc_autoreleasePoolPop(v7);
  return v13;
}

@end
