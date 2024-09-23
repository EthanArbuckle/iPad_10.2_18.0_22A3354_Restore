@implementation VCPInterAssetAnalyzer

- (VCPInterAssetAnalyzer)init
{
  VCPInterAssetAnalyzer *v2;
  VCPInterAssetAnalyzer *v3;
  VCPInterAssetAnalyzer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPInterAssetAnalyzer;
  v2 = -[VCPInterAssetAnalyzer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (BOOL)canUseLastFrameOfAsset:(id)a3 withResources:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "mediaType") == 1)
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(v5, "mediaType") == 2
         && objc_msgSend(v6, "vcp_hasLocalMovie:", objc_msgSend(v5, "hasAdjustments")))
  {
    v7 = objc_msgSend(v5, "vcp_isVideoSlowmo") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (CGSize)thumbnailSizeForAsset:(id)a3 withResources:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v12;
  unint64_t v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  CGSize result;

  v5 = a3;
  objc_msgSend(a4, "vcp_thumbnailResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vcp_size");
  v9 = v8;
  v10 = v7;
  if (v8 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v12 = objc_msgSend(v5, "pixelWidth");
    v13 = objc_msgSend(v5, "pixelHeight");
    v9 = (double)v12;
    v10 = (double)v13;
    if ((double)v13 >= (double)v12)
      v14 = (double)v12;
    else
      v14 = (double)v13;
    if (v14 > 256.0)
    {
      v15 = v9 * 256.0 / v14;
      v9 = (double)(int)((vcvtps_s32_f32(v15) + 1) & 0xFFFFFFFE);
      v16 = v10 * 256.0 / v14;
      v10 = (double)(int)((vcvtps_s32_f32(v16) + 1) & 0xFFFFFFFE);
    }
  }

  v17 = v9;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (int)_generateLastFrameDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  VCPImageConverter *v16;
  VCPImageConverter *v17;
  int v18;
  id v19;
  _BYTE v21[80];
  CMTime rhs;
  CMTime v23;
  CMTime lhs;
  CMTime v25;
  CFTypeRef v26[2];

  v7 = a5;
  if (objc_msgSend(v7, "mediaType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = 0;
    objc_msgSend(v8, "vcp_avAsset:", objc_msgSend(v7, "hasAdjustments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      memset(&v25, 0, sizeof(v25));
      objc_msgSend(v10, "timeRange");
      lhs = v23;
      objc_msgSend(v11, "timeRange");
      rhs = *(CMTime *)&v21[56];
      CMTimeAdd(&v25, &lhs, &rhs);
      v12 = (void *)MEMORY[0x1E0C8AFC8];
      objc_msgSend(v11, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetImageGeneratorWithAsset:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[VCPInterAssetAnalyzer thumbnailSizeForAsset:withResources:](VCPInterAssetAnalyzer, "thumbnailSizeForAsset:withResources:", v7, v8);
      objc_msgSend(v14, "setMaximumSize:");
      objc_msgSend(v14, "setAppliesPreferredTrackTransform:", 1);
      v23 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      *(CMTime *)v21 = v25;
      v15 = (const void *)objc_msgSend(v14, "copyCGImageAtTime:actualTime:error:", v21, &v23, 0);
      if (v15)
      {
        v16 = -[VCPImageConverter initWithPixelFormat:]([VCPImageConverter alloc], "initWithPixelFormat:", -[objc_class preferredPixelFormat](a4, "preferredPixelFormat"));
        v17 = v16;
        if (v16)
        {
          v18 = -[VCPImageConverter convertImage:yuvFrame:](v16, "convertImage:yuvFrame:", v15, v26);
          if (!v18)
          {
            -[objc_class descriptorWithImage:](a4, "descriptorWithImage:", v26[0]);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            *a3 = v19;
            if (v19)
              v18 = 0;
            else
              v18 = -108;
          }
        }
        else
        {
          v18 = -50;
        }

      }
      else
      {

        v18 = -108;
      }
    }
    else
    {
      v15 = 0;
      v18 = 0;
    }
    if (v26[0])
      CFRelease(v26[0]);
    if (v15)
      CFRelease(v15);

  }
  else
  {
    v18 = -50;
  }

  return v18;
}

- (__CVBuffer)_getThumbnailForAsset:(id)a3 withResouces:(id)a4 andPixelFormat:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CVBuffer *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = *(_QWORD *)&a5;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "vcp_thumbnailResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "vcp_isLocallyAvailable"))
  {
    +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CVBuffer *)objc_msgSend(v10, "imageForResource:pixelFormat:", v9, v5);

  }
  else
  {
    objc_msgSend(v8, "vcp_localPhotoResourcesSorted:", objc_msgSend(v7, "hasAdjustments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      +[VCPInterAssetAnalyzer thumbnailSizeForAsset:withResources:](VCPInterAssetAnalyzer, "thumbnailSizeForAsset:withResources:", v7, v8);
      v15 = v13;
      v16 = v14;
      if (v13 >= v14)
        v17 = v13;
      else
        v17 = v14;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v30;
        v21 = v15 * v16;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v23, "vcp_size");
            if (v24 * v25 >= v21)
            {
              +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (__CVBuffer *)objc_msgSend(v27, "imageForResource:pixelFormat:maxDimension:", v23, v5, (unint64_t)v17);
              goto LABEL_17;
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v19)
            continue;
          break;
        }
      }

      +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CVBuffer *)objc_msgSend(v26, "imageForResource:pixelFormat:", v27, v5);
      v18 = v26;
LABEL_17:

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (int)generateDistanceDescriptor:(id *)a3 withDescriptorClass:(Class)a4 forAsset:(id)a5 withResources:(id)a6 lastFrame:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  __CVBuffer *v15;
  id v16;
  int v17;
  int v19;
  void *v20;
  uint64_t v21;

  v7 = a7;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (v7
    && objc_msgSend(v12, "mediaType") == 2
    && +[VCPInterAssetAnalyzer canUseLastFrameOfAsset:withResources:](VCPInterAssetAnalyzer, "canUseLastFrameOfAsset:withResources:", v12, v13))
  {
    if (!-[VCPInterAssetAnalyzer _generateLastFrameDistanceDescriptor:withDescriptorClass:forAsset:](self, "_generateLastFrameDistanceDescriptor:withDescriptorClass:forAsset:", a3, a4, v12))
    {
      v17 = 0;
      goto LABEL_14;
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  [%@] Failed to decode last frame of video, fall back to thumbnail ", (uint8_t *)&v19, 0xCu);

    }
  }
  v15 = -[VCPInterAssetAnalyzer _getThumbnailForAsset:withResouces:andPixelFormat:](self, "_getThumbnailForAsset:withResouces:andPixelFormat:", v12, v13, -[objc_class preferredPixelFormat](a4, "preferredPixelFormat"));
  if (v15)
  {
    -[objc_class descriptorWithImage:](a4, "descriptorWithImage:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v16;
    if (v16)
      v17 = 0;
    else
      v17 = -108;
    CFRelease(v15);
  }
  else
  {
    v17 = -18;
  }
LABEL_14:

  return v17;
}

- (int)computeDistance:(float *)a3 withDescriptorClass:(id)a4 fromAsset:(id)a5 toAsset:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v15 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](self, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v20, v10, v11, v13, 1);
  v16 = v20;
  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v19 = 0;
    v15 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](self, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v19, v10, v12, v14, 0);
    v17 = v19;
    if (!v15)
      v15 = objc_msgSend(v16, "computeDistance:toDescriptor:", a3, v17);
  }

  return v15;
}

- (int)computeDistance:(float *)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  size_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  float v22;
  float v23;
  void *v24;
  unint64_t v25;
  char *v26;
  void *v27;
  float v28;
  float *v30;
  int v31;
  int v32;
  char *v33;
  float v34;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  v10 = 0;
  v11 = -50;
  if (a3 && v7)
  {
    v12 = 0;
    if (v8)
    {
      if (objc_msgSend(v7, "count") && objc_msgSend(v9, "count"))
      {
        if (objc_msgSend(v7, "count") == 1 && objc_msgSend(v9, "count") == 1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("attributes"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "computeDistance:toDescriptor:", a3, v12);
        }
        else
        {
          v15 = objc_msgSend(v7, "count");
          v16 = objc_msgSend(v9, "count") * v15;
          if (v16 < 0)
            v17 = -1;
          else
            v17 = 4 * v16;
          v33 = (char *)operator new[](v17, MEMORY[0x1E0DE4E10]);
          if (v33)
          {
            v30 = a3;
            v31 = v16;
            v18 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0.0;
            v23 = 3.4028e38;
            while (objc_msgSend(v7, "count") > v18)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("attributes"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              v25 = 0;
              v32 = v21;
              v26 = &v33[4 * v21];
              while (objc_msgSend(v9, "count") > v25)
              {
                v34 = 0.0;
                objc_msgSend(v9, "objectAtIndexedSubscript:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("attributes"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                v11 = objc_msgSend(v10, "computeDistance:toDescriptor:", &v34, v12);
                if (v11)
                  goto LABEL_26;
                v28 = v34;
                *(float *)&v26[4 * v25] = v34;
                v22 = v22 + v28;
                if (v28 < v23)
                  v23 = v28;
                ++v25;
                v20 = v12;
              }
              ++v18;
              v21 = v32 + v25;
              v19 = v10;
            }
            v11 = 0;
            *v30 = (float)((float)(v22 / (float)v31) * 0.4) + (float)(v23 * 0.6);
            v10 = v19;
            v12 = v20;
LABEL_26:
            MEMORY[0x1BCCA128C](v33, 0x1000C8052888210);
          }
          else
          {
            v10 = 0;
            v12 = 0;
            v11 = -108;
          }
        }
      }
      else
      {
        v10 = 0;
        v12 = 0;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v11;
}

@end
