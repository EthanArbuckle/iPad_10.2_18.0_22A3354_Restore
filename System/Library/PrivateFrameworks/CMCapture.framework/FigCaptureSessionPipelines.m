@implementation FigCaptureSessionPipelines

- (NSArray)cameraSourcePipelines
{
  return &self->_cameraSourcePipelines->super;
}

- (NSArray)movieFileSinkPipelines
{
  return &self->_movieFileSinkPipelines->super;
}

- (NSArray)videoDataSinkPipelines
{
  return &self->_videoDataSinkPipelines->super;
}

- (NSArray)previewSinkPipelines
{
  return &self->_previewSinkPipelines->super;
}

- (NSArray)videoThumbnailSinkPipelines
{
  return &self->_videoThumbnailSinkPipelines->super;
}

- (id)cinematographyPipelineWithSourceID:(id)a3
{
  NSMutableArray *cinematographyPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  cinematographyPipelines = self->_cinematographyPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cinematographyPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(cinematographyPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)-[FigCaptureCinematographyPipeline sourceID]((uint64_t)v9), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cinematographyPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)cameraSourcePipelineWithSourceID:(id)a3
{
  NSMutableArray *cameraSourcePipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(cameraSourcePipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sourceID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (FigCaptureMicSourcePipeline)micSourcePipeline
{
  return self->_micSourcePipeline;
}

- (id)movieFileSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(movieFileSinkPipelines);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v11) == a4
      && (objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline videoSourceID]((uint64_t)v11), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)previewSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *previewSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  previewSinkPipelines = self->_previewSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](previewSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(previewSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](previewSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)metadataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *metadataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  metadataSinkPipelines = self->_metadataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metadataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(metadataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metadataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)videoThumbnailSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *videoThumbnailSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  videoThumbnailSinkPipelines = self->_videoThumbnailSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoThumbnailSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(videoThumbnailSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoThumbnailSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)videoDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *videoDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(videoDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)depthDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *depthDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](depthDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(depthDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](depthDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)stillImageSinkPipelineSessionStorageWithSinkID:(id)a3
{
  NSMutableArray *stillImageSinkPipelineStorages;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageSinkPipelineStorages, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(stillImageSinkPipelineStorages);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stillImageSinkPipeline"), "sinkID"), "isEqualToString:", a3) & 1) != 0)return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageSinkPipelineStorages, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithIrisStagingNode:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(movieFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureMovieFileSinkPipeline irisStagingNode]((uint64_t)v9) == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)videoDataSinkPipelineForMetadataWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  NSMutableArray *videoDataSinkPipelines;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(videoDataSinkPipelines);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureVideoDataSinkPipeline sourceDeviceType]((uint64_t)v11) == a4
      && objc_msgSend((id)-[FigCaptureVideoDataSinkPipeline sourceID]((uint64_t)v11), "isEqualToString:", a3)&& (-[FigCaptureVideoDataSinkPipeline faceTrackingVideoCaptureOutput]((uint64_t)v11)|| -[FigCaptureVideoDataSinkPipeline offlineVISMotionDataCaptureOutput]((uint64_t)v11)))
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSArray)stillImageSinkPipelineSessionStorages
{
  return &self->_stillImageSinkPipelineStorages->super;
}

- (id)previewSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  NSMutableArray *previewSinkPipelines;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  previewSinkPipelines = self->_previewSinkPipelines;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](previewSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(previewSinkPipelines);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (objc_msgSend(v11, "sourceDeviceType") == a4
      && (objc_msgSend((id)objc_msgSend(v11, "sourceID"), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](previewSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSArray)metadataSourcePipelines
{
  return &self->_metadataSourcePipelines->super;
}

- (id)depthDataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  NSMutableArray *depthDataSinkPipelines;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](depthDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(depthDataSinkPipelines);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (objc_msgSend(v11, "sourceDeviceType") == a4
      && (objc_msgSend((id)objc_msgSend(v11, "sourceID"), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](depthDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addMetadataSinkPipeline:(id)a3
{
  NSMutableArray *metadataSinkPipelines;

  metadataSinkPipelines = self->_metadataSinkPipelines;
  if (!metadataSinkPipelines)
  {
    metadataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_metadataSinkPipelines = metadataSinkPipelines;
  }
  -[NSMutableArray addObject:](metadataSinkPipelines, "addObject:", a3);
}

- (void)addCameraSourcePipeline:(id)a3
{
  NSMutableArray *cameraSourcePipelines;

  cameraSourcePipelines = self->_cameraSourcePipelines;
  if (!cameraSourcePipelines)
  {
    cameraSourcePipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_cameraSourcePipelines = cameraSourcePipelines;
  }
  -[NSMutableArray addObject:](cameraSourcePipelines, "addObject:", a3);
}

- (void)setMicSourcePipeline:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)movieFileSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(movieFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)lidarDepthPipelineWithRGBCameraSourceID:(id)a3
{
  NSMutableArray *lidarDepthPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  lidarDepthPipelines = self->_lidarDepthPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lidarDepthPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(lidarDepthPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "rgbCameraSourceID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lidarDepthPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addVideoThumbnailSinkPipeline:(id)a3
{
  NSMutableArray *videoThumbnailSinkPipelines;

  videoThumbnailSinkPipelines = self->_videoThumbnailSinkPipelines;
  if (!videoThumbnailSinkPipelines)
  {
    videoThumbnailSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_videoThumbnailSinkPipelines = videoThumbnailSinkPipelines;
  }
  -[NSMutableArray addObject:](videoThumbnailSinkPipelines, "addObject:", a3);
}

- (void)addVideoDataSinkPipeline:(id)a3
{
  NSMutableArray *videoDataSinkPipelines;

  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  if (!videoDataSinkPipelines)
  {
    videoDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_videoDataSinkPipelines = videoDataSinkPipelines;
  }
  -[NSMutableArray addObject:](videoDataSinkPipelines, "addObject:", a3);
}

- (void)addStillImageSinkPipelineSessionStorage:(id)a3
{
  NSMutableArray *stillImageSinkPipelineStorages;
  void *v6;

  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  if (!stillImageSinkPipelineStorages)
  {
    stillImageSinkPipelineStorages = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_stillImageSinkPipelineStorages = stillImageSinkPipelineStorages;
  }
  if (!a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failure to create still image sink pipeline! This is a fatal error. Please file a radar against %s"), FigCaptureGetFrameworkRadarComponentName()), 0);
    objc_exception_throw(v6);
  }
  -[NSMutableArray addObject:](stillImageSinkPipelineStorages, "addObject:", a3);
}

- (void)addPreviewSinkPipeline:(id)a3
{
  NSMutableArray *previewSinkPipelines;

  previewSinkPipelines = self->_previewSinkPipelines;
  if (!previewSinkPipelines)
  {
    previewSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_previewSinkPipelines = previewSinkPipelines;
  }
  -[NSMutableArray addObject:](previewSinkPipelines, "addObject:", a3);
}

- (void)addMovieFileSinkPipeline:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;

  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  if (!movieFileSinkPipelines)
  {
    movieFileSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_movieFileSinkPipelines = movieFileSinkPipelines;
  }
  -[NSMutableArray addObject:](movieFileSinkPipelines, "addObject:", a3);
}

- (void)addDepthDataSinkPipeline:(id)a3
{
  NSMutableArray *depthDataSinkPipelines;

  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  if (!depthDataSinkPipelines)
  {
    depthDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_depthDataSinkPipelines = depthDataSinkPipelines;
  }
  -[NSMutableArray addObject:](depthDataSinkPipelines, "addObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionPipelines;
  -[FigCaptureSessionPipelines dealloc](&v3, sel_dealloc);
}

- (id)cameraSourcePipelineCompatibleWithCameraConfiguration:(id)a3
{
  int v5;
  int v6;
  NSMutableArray *cameraSourcePipelines;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "sourceDeviceType");
  v6 = objc_msgSend(a3, "sourcePosition");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v16;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v10)
      objc_enumerationMutation(cameraSourcePipelines);
    v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
    if (objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v12), "position") == v6)
    {
      v13 = objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v12), "deviceType");
      if ((FigCaptureSourceDeviceTypeIsSubsetOfDeviceType(v5, v13, v6) & 1) != 0)
        return v12;
    }
    if (v9 == ++v11)
    {
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (FigCaptureCameraSourcePipeline)firstColorCameraSourcePipeline
{
  NSMutableArray *cameraSourcePipelines;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  FigCaptureCameraSourcePipeline *v7;
  unsigned int v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v12;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v5)
      objc_enumerationMutation(cameraSourcePipelines);
    v7 = *(FigCaptureCameraSourcePipeline **)(*((_QWORD *)&v11 + 1) + 8 * v6);
    v8 = objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v7), "deviceType");
    v9 = v8 > 0x14 || ((1 << v8) & 0x100420) == 0;
    if (v9 && v8 - 21 < 0xFFFFFFFC)
      return v7;
    if (v4 == ++v6)
    {
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraSourcePipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addMetadataSourcePipeline:(id)a3
{
  NSMutableArray *metadataSourcePipelines;

  metadataSourcePipelines = self->_metadataSourcePipelines;
  if (!metadataSourcePipelines)
  {
    metadataSourcePipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_metadataSourcePipelines = metadataSourcePipelines;
  }
  -[NSMutableArray addObject:](metadataSourcePipelines, "addObject:", a3);
}

- (id)movieFileSinkPipelineWithFileSinkNode:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(movieFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v9), "indexOfObjectIdenticalTo:", a3) != 0x7FFFFFFFFFFFFFFFLL)return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithVideoConnectionID:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(movieFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline videoConnectionID]((uint64_t)v9), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithFileCoordinatorNode:(id)a3
{
  NSMutableArray *movieFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(movieFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode]((uint64_t)v9) == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](movieFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)stillImageSinkPipelineSessionStorageWithStillImageCoordinator:(id)a3
{
  NSMutableArray *stillImageSinkPipelineStorages;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageSinkPipelineStorages, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(stillImageSinkPipelineStorages);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)objc_msgSend((id)objc_msgSend(v9, "stillImageSinkPipeline"), "stillImageCoordinatorNode") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stillImageSinkPipelineStorages, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)metadataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  NSMutableArray *metadataSinkPipelines;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  metadataSinkPipelines = self->_metadataSinkPipelines;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metadataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(metadataSinkPipelines);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureMetadataSinkPipeline sourceDeviceType]((uint64_t)v11) == a4
      && (objc_msgSend((id)-[FigCaptureMetadataSinkPipeline sourceID]((uint64_t)v11), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metadataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addVisionDataSinkPipeline:(id)a3
{
  NSMutableArray *visionDataSinkPipelines;

  visionDataSinkPipelines = self->_visionDataSinkPipelines;
  if (!visionDataSinkPipelines)
  {
    visionDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_visionDataSinkPipelines = visionDataSinkPipelines;
  }
  -[NSMutableArray addObject:](visionDataSinkPipelines, "addObject:", a3);
}

- (id)visionDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *visionDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  visionDataSinkPipelines = self->_visionDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visionDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(visionDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visionDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addAudioDataSinkPipeline:(id)a3
{
  NSMutableArray *audioDataSinkPipelines;

  audioDataSinkPipelines = self->_audioDataSinkPipelines;
  if (!audioDataSinkPipelines)
  {
    audioDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_audioDataSinkPipelines = audioDataSinkPipelines;
  }
  -[NSMutableArray addObject:](audioDataSinkPipelines, "addObject:", a3);
}

- (id)audioDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *audioDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  audioDataSinkPipelines = self->_audioDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(audioDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addAudioFileSinkPipeline:(id)a3
{
  NSMutableArray *audioFileSinkPipelines;

  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  if (!audioFileSinkPipelines)
  {
    audioFileSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_audioFileSinkPipelines = audioFileSinkPipelines;
  }
  -[NSMutableArray addObject:](audioFileSinkPipelines, "addObject:", a3);
}

- (id)audioFileSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *audioFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(audioFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)audioFileSinkPipelineWithFileSinkNode:(id)a3
{
  NSMutableArray *audioFileSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(audioFileSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureAudioFileSinkPipeline audioFileSinkNode]((uint64_t)v9) == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioFileSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addPointCloudDataSinkPipeline:(id)a3
{
  NSMutableArray *pointCloudDataSinkPipelines;

  pointCloudDataSinkPipelines = self->_pointCloudDataSinkPipelines;
  if (!pointCloudDataSinkPipelines)
  {
    pointCloudDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_pointCloudDataSinkPipelines = pointCloudDataSinkPipelines;
  }
  -[NSMutableArray addObject:](pointCloudDataSinkPipelines, "addObject:", a3);
}

- (id)pointCloudDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *pointCloudDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pointCloudDataSinkPipelines = self->_pointCloudDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pointCloudDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(pointCloudDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pointCloudDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addCameraCalibrationDataSinkPipeline:(id)a3
{
  NSMutableArray *cameraCalibrationDataSinkPipelines;

  cameraCalibrationDataSinkPipelines = self->_cameraCalibrationDataSinkPipelines;
  if (!cameraCalibrationDataSinkPipelines)
  {
    cameraCalibrationDataSinkPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_cameraCalibrationDataSinkPipelines = cameraCalibrationDataSinkPipelines;
  }
  -[NSMutableArray addObject:](cameraCalibrationDataSinkPipelines, "addObject:", a3);
}

- (id)cameraCalibrationDataSinkPipelineWithSinkID:(id)a3
{
  NSMutableArray *cameraCalibrationDataSinkPipelines;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  cameraCalibrationDataSinkPipelines = self->_cameraCalibrationDataSinkPipelines;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraCalibrationDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(cameraCalibrationDataSinkPipelines);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cameraCalibrationDataSinkPipelines, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addCinematographyPipeline:(id)a3
{
  NSMutableArray *cinematographyPipelines;

  cinematographyPipelines = self->_cinematographyPipelines;
  if (!cinematographyPipelines)
  {
    cinematographyPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_cinematographyPipelines = cinematographyPipelines;
  }
  -[NSMutableArray addObject:](cinematographyPipelines, "addObject:", a3);
}

- (void)addLiDARDepthPipeline:(id)a3
{
  NSMutableArray *lidarDepthPipelines;

  lidarDepthPipelines = self->_lidarDepthPipelines;
  if (!lidarDepthPipelines)
  {
    lidarDepthPipelines = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->_lidarDepthPipelines = lidarDepthPipelines;
  }
  -[NSMutableArray addObject:](lidarDepthPipelines, "addObject:", a3);
}

- (void)updateClientAuditToken:(id *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  NSArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v5 = -[FigCaptureSessionPipelines previewSinkPipelines](self, "previewSinkPipelines");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v103;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v103 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v9);
        v11 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v11;
        objc_msgSend(v10, "updateClientAuditToken:", &v100);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    }
    while (v7);
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v12 = -[FigCaptureSessionPipelines videoDataSinkPipelines](self, "videoDataSinkPipelines");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v97;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v97 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v16);
        v18 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v18;
        objc_msgSend(v17, "updateClientAuditToken:", &v100);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
    }
    while (v14);
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v19 = -[FigCaptureSessionPipelines depthDataSinkPipelines](self, "depthDataSinkPipelines");
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v93;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v93 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v23);
        v25 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v25;
        objc_msgSend(v24, "updateClientAuditToken:", &v100);
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    }
    while (v21);
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v26 = -[FigCaptureSessionPipelines videoThumbnailSinkPipelines](self, "videoThumbnailSinkPipelines");
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v89;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v89 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v30);
        v32 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v32;
        -[FigCaptureVideoThumbnailSinkPipeline updateClientAuditToken:](v31, &v100);
        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
    }
    while (v28);
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v33 = -[FigCaptureSessionPipelines metadataSinkPipelines](self, "metadataSinkPipelines");
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v85;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v85 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v37);
        v39 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v39;
        objc_msgSend(v38, "updateClientAuditToken:", &v100);
        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
    }
    while (v35);
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v40 = -[FigCaptureSessionPipelines visionDataSinkPipelines](self, "visionDataSinkPipelines");
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v81;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v81 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v44);
        v46 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v46;
        objc_msgSend(v45, "updateClientAuditToken:", &v100);
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
    }
    while (v42);
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v47 = -[FigCaptureSessionPipelines audioDataSinkPipelines](self, "audioDataSinkPipelines");
  v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v77;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v77 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v51);
        v53 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v53;
        objc_msgSend(v52, "updateClientAuditToken:", &v100);
        ++v51;
      }
      while (v49 != v51);
      v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
    }
    while (v49);
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v54 = -[FigCaptureSessionPipelines pointCloudDataSinkPipelines](self, "pointCloudDataSinkPipelines");
  v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v72, v107, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v73;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v73 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v58);
        v60 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v60;
        objc_msgSend(v59, "updateClientAuditToken:", &v100);
        ++v58;
      }
      while (v56 != v58);
      v56 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v72, v107, 16);
    }
    while (v56);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v61 = -[FigCaptureSessionPipelines cameraCalibrationDataSinkPipelines](self, "cameraCalibrationDataSinkPipelines", 0);
  v62 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v68, v106, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v69;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v69 != v64)
          objc_enumerationMutation(v61);
        v66 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v65);
        v67 = *(_OWORD *)&a3->var0[4];
        v100 = *(_OWORD *)a3->var0;
        v101 = v67;
        objc_msgSend(v66, "updateClientAuditToken:", &v100);
        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v68, v106, 16);
    }
    while (v63);
  }
}

- (NSArray)depthDataSinkPipelines
{
  return &self->_depthDataSinkPipelines->super;
}

- (NSArray)metadataSinkPipelines
{
  return &self->_metadataSinkPipelines->super;
}

- (NSArray)visionDataSinkPipelines
{
  return &self->_visionDataSinkPipelines->super;
}

- (NSArray)audioDataSinkPipelines
{
  return &self->_audioDataSinkPipelines->super;
}

- (NSArray)audioFileSinkPipelines
{
  return &self->_audioFileSinkPipelines->super;
}

- (NSArray)pointCloudDataSinkPipelines
{
  return &self->_pointCloudDataSinkPipelines->super;
}

- (NSArray)cameraCalibrationDataSinkPipelines
{
  return &self->_cameraCalibrationDataSinkPipelines->super;
}

- (NSArray)cinematographyPipelines
{
  return &self->_cinematographyPipelines->super;
}

@end
