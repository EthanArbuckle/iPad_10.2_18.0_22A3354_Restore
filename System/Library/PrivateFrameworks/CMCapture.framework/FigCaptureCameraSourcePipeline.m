@implementation FigCaptureCameraSourcePipeline

- (uint64_t)captureSource
{
  if (result)
    return *(_QWORD *)(result + 368);
  return result;
}

- (uint64_t)sourceFormatReferenceOutput
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)colorSpaceProperties
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "colorSpaceProperties");
  return result;
}

- (uint64_t)clock
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "clock");
  return result;
}

- (uint64_t)captureSourceVideoFormat
{
  if (result)
    return *(_QWORD *)(result + 376);
  return result;
}

- (uint64_t)hackRetainedBufferCountsForDualStreamSources
{
  id *v1;
  id v2;
  int v3;
  int v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  int *v11;
  int v12;
  int *v13;
  int v14;
  int *v15;
  int v16;
  int *v17;

  if (result)
  {
    v1 = (id *)result;
    switch(*(_DWORD *)(result + 44))
    {
      case 4:
        v9 = *(id *)(result + 64);
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(result + 72), "previewOutput"), "retainedBufferCount");
        if (v10 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "previewOutput"), "retainedBufferCount"))
          v11 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        else
          v11 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode;
        objc_msgSend((id)objc_msgSend(v1[9], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v11), "previewOutput"), "retainedBufferCount"));
        v12 = objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "retainedBufferCount");
        if (v12 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "videoCaptureOutput"), "retainedBufferCount"))
          v13 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        else
          v13 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode;
        objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v13), "videoCaptureOutput"), "retainedBufferCount"));
        objc_msgSend((id)objc_msgSend(v9, "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(v1[9], "previewOutput"), "retainedBufferCount"));
        v7 = objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "retainedBufferCount");
        goto LABEL_24;
      case 6:
      case 0xC:
        v2 = *(id *)(result + 64);
        v3 = objc_msgSend((id)objc_msgSend(*(id *)(result + 88), "previewOutput"), "retainedBufferCount");
        v4 = objc_msgSend((id)objc_msgSend(v2, "previewOutput"), "retainedBufferCount");
        v5 = v2;
        if (v3 > v4)
          v5 = v1[11];
        objc_msgSend((id)objc_msgSend(v1[11], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(v5, "previewOutput"), "retainedBufferCount"));
        v6 = objc_msgSend((id)objc_msgSend(v1[11], "videoCaptureOutput"), "retainedBufferCount");
        if (v6 > (int)objc_msgSend((id)objc_msgSend(v2, "videoCaptureOutput"), "retainedBufferCount"))
          v2 = v1[11];
        v7 = objc_msgSend((id)objc_msgSend(v2, "videoCaptureOutput"), "retainedBufferCount");
        v8 = 11;
        goto LABEL_23;
      case 8:
        result = objc_msgSend(*(id *)(result + 360), "stereoVideoCaptureEnabled");
        if (!(_DWORD)result)
          return result;
        v14 = objc_msgSend((id)objc_msgSend(v1[10], "previewOutput"), "retainedBufferCount");
        if (v14 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "previewOutput"), "retainedBufferCount"))
          v15 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        else
          v15 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode;
        objc_msgSend((id)objc_msgSend(v1[10], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v15), "previewOutput"), "retainedBufferCount"));
        v16 = objc_msgSend((id)objc_msgSend(v1[10], "videoCaptureOutput"), "retainedBufferCount");
        if (v16 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "videoCaptureOutput"), "retainedBufferCount"))
          v17 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        else
          v17 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode;
        v7 = objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v17), "videoCaptureOutput"), "retainedBufferCount");
        v8 = 10;
LABEL_23:
        v9 = v1[v8];
LABEL_24:
        result = objc_msgSend((id)objc_msgSend(v9, "videoCaptureOutput"), "setRetainedBufferCount:", v7);
        break;
      default:
        return result;
    }
  }
  return result;
}

- (_QWORD)portTypesWithGeometricDistortionCorrectionOnPreviewOutputsEnabled
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)v1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnPreviewOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (_QWORD)portTypesWithGeometricDistortionCorrectionOnVideoCaptureOutputsEnabled
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)v1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)videoCaptureDimensionsWithoutOverscan
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "configuration"), "videoCaptureDimensions");
  return result;
}

- (uint64_t)depthType
{
  if (result)
    return *(unsigned int *)(result + 412);
  return result;
}

- (uint64_t)motionAttachmentsSource
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "configuration"), "motionAttachmentsSource");
  return result;
}

- (BOOL)stillImageOutputDerivesFromVideoCaptureOutput
{
  if (result)
    return *(_BYTE *)(result + 392) != 0;
  return result;
}

- (uint64_t)usesFirmwareStillImageOutput
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "configuration"), "usesFirmwareStillImageOutput");
  return result;
}

- (uint64_t)_buildDetectedObjectsOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((csp_cinematicVideoEnabled(a3) & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    if (a3)
      v9 = *(void **)(a3 + 240);
    else
      v9 = 0;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((FigCaptureMetadataObjectConfigurationRequiresObjectDetection(v14) & 1) != 0
            || FigCaptureMetadataObjectConfigurationRequiresEyeReliefStatus(v14))
          {
            objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }
    if (a3)
      v15 = *(_QWORD *)(a3 + 248);
    else
      v15 = 0;
    objc_msgSend(v8, "addObjectsFromArray:", v15);
    v16 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](a1, a2, v8, a3, a4, 2u, 0);
    if ((_DWORD)v16)
    {
      v17 = v16;
      FigDebugAssert3();
      return v17;
    }
    a2 = (id)objc_msgSend(a2, "mutableCopy");
    -[FigCaptureCameraSourcePipeline _rerouteDetectedObjectsOutputsForSourcesWithCinematicFramingEnabled:graph:](a1, a2, a4);
  }
  v17 = 0;
  *(_QWORD *)(a1 + 296) = objc_msgSend(a2, "copy");
  return v17;
}

- (uint64_t)_rerouteDetectedObjectsOutputsForSourcesWithCinematicFramingEnabled:(void *)a3 graph:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t PortTypeForUnderlyingDeviceType;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_msgSend(*(id *)(a1 + 136), "allKeys");
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
          if (objc_msgSend(a2, "objectForKeyedSubscript:", v10, v15, v16))
          {
            v11 = (void *)objc_msgSend(*(id *)(a1 + 136), "objectForKeyedSubscript:", v10);
            PortTypeForUnderlyingDeviceType = BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(v10, "intValue"), (void *)objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "allKeys"));
            if (objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "objectForKeyedSubscript:", PortTypeForUnderlyingDeviceType))
            {
              if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v10), objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "objectForKeyedSubscript:", PortTypeForUnderlyingDeviceType), 0) & 1) != 0)
              {
                if (objc_msgSend(v11, "detectionMetadataOutput"))
                {
                  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(v11, "detectionMetadataOutput"), v10);
                  goto LABEL_12;
                }
                v16 = v17;
                LODWORD(v15) = 0;
              }
              else
              {
                v16 = v17;
                LODWORD(v15) = 0;
              }
            }
            else
            {
              v16 = v17;
              LODWORD(v15) = 0;
            }
            FigDebugAssert3();
          }
LABEL_12:
          ++v9;
        }
        while (v7 != v9);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v7 = v13;
      }
      while (v13);
    }
  }
  return 0;
}

- (id)_addDepthFromInfraredSynchronizer:(void *)a3 previewOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(uint64_t)a6 sourceDeviceType:
{
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  int v32;
  objc_super v33;
  id *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = result;
    v34 = 0;
    if (a4)
    {
      v11 = *(void **)(a4 + 192);
      v12 = *(void **)(a4 + 200);
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    v32 = objc_msgSend(v11, "previewDepthFilterRenderingEnabled");
    v13 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6));
    v14 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6));
    if (v13 | v14)
    {
      v15 = v14;
      v31 = v10;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v16)
      {
        v17 = v16;
        v29 = a5;
        v30 = a2;
        v18 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v12);
            v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v21 = (void *)objc_msgSend(v20, "sinkConfiguration");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v21, "sinkType") == 11)
            {
              if (v20)
                v23 = v15 == 0;
              else
                v23 = 1;
              v22 = v23;
              goto LABEL_21;
            }
          }
          v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v17)
            continue;
          break;
        }
        v22 = 1;
LABEL_21:
        a2 = v30;
        a5 = v29;
      }
      else
      {
        v22 = 1;
      }
      if (((v13 != 0) & v22) != 0)
        v24 = v13;
      else
        v24 = v15;
      v25 = -[BWDepthSynchronizerNode initForStreaming:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:separateDepthComponentsEnabled:", 1, 0);
      objc_msgSend(v25, "setName:", CFSTR("Source Depth Synchronizer"));
      v33.receiver = v31;
      v33.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v33, sel_addNode_error_, v25, &v34) & 1) != 0
        && (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v24, objc_msgSend(v25, "imageInput"), 0) & 1) != 0
        && (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v31[11], "depthOutput"), objc_msgSend(v25, "depthInput"), 0) & 1) != 0)
      {
        objc_msgSend(v25, "setDiscardsDegradedDepthBuffers:", v32 ^ 1u);
        v26 = objc_msgSend(v25, "output");
        v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
        if (v24 == v15)
          v28 = a3;
        else
          v28 = a2;
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, v27);
      }
      else
      {
        FigDebugAssert3();
      }
    }
    result = v34;
    if (v34)
      return (id *)objc_msgSend(v34, "code");
  }
  return result;
}

- (uint64_t)allocateSharedBufferPools
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1[8], "allocateOrReuseBufferPoolsFromSourceNode:", 0);
  if ((_DWORD)v2)
  {
    v5 = v2;
    goto LABEL_10;
  }
  v3 = objc_msgSend(a1[9], "allocateOrReuseBufferPoolsFromSourceNode:", a1[8]);
  if ((_DWORD)v3)
  {
    v5 = v3;
    goto LABEL_10;
  }
  v4 = objc_msgSend(a1[10], "allocateOrReuseBufferPoolsFromSourceNode:", a1[8]);
  if ((_DWORD)v4)
  {
    v5 = v4;
    goto LABEL_10;
  }
  v5 = objc_msgSend(a1[11], "allocateOrReuseBufferPoolsFromSourceNode:", 0);
  if ((_DWORD)v5)
LABEL_10:
    FigDebugAssert3();
  return v5;
}

- (uint64_t)captureDevice
{
  if (result)
    return *(_QWORD *)(result + 360);
  return result;
}

- (uint64_t)stillImageSensorRawOutputsByPortType
{
  if (result)
    return *(_QWORD *)(result + 168);
  return result;
}

- (uint64_t)stillImageOutputsByPortType
{
  if (result)
    return *(_QWORD *)(result + 160);
  return result;
}

- (uint64_t)stillImageOutputColorInfo
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "colorInfoForOutput:", objc_msgSend(*(id *)(result + 64), "stillImageOutput"));
  return result;
}

- (_QWORD)portTypesWithGeometricDistortionCorrectionOnStillImageOutputEnabled
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)v1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnStillImageOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)videoCaptureOutputTransformForSourceDeviceType:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2)), "count"))
    {
      v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2)), "objectAtIndexedSubscript:", 0);
      if (v4)
      {
        v5 = (void *)v4;
        while (1)
        {
          v6 = (void *)objc_msgSend(v5, "formatRequirements");
          if (objc_msgSend(v6, "width"))
          {
            if (objc_msgSend(v6, "height"))
              break;
          }
          v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "node"), "input"), "connection"), "output");
          if (!v5)
            goto LABEL_8;
        }
      }
      else
      {
LABEL_8:
        v6 = 0;
      }
    }
    else
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "videoCaptureOutput"), "formatRequirements");
    }
    objc_msgSend(v6, "width");
    objc_msgSend(v6, "height");
  }
  return 0;
}

- (id)_buildPointCloudOutputNetworkWithPipelineConfiguration:(void *)a3 graph:
{
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BWFanOutNode *v9;
  uint64_t v10;
  id *v11;

  if (result)
  {
    v5 = result;
    v11 = 0;
    if (a2)
    {
      if (!objc_msgSend(*(id *)(a2 + 256), "count"))
        goto LABEL_10;
      v6 = *(void **)(a2 + 256);
    }
    else
    {
      v10 = objc_msgSend(0, "count");
      v6 = 0;
      if (!v10)
        return 0;
    }
    v7 = objc_msgSend(v6, "count");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if ((int)v7 < 2)
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(v5[8], "pointCloudOutput"));
    }
    else
    {
      v9 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v7, 1885564004);
      objc_msgSend(v5, "addNode:error:", v9, &v11);
      if (v11)
      {
        FigDebugAssert3();
LABEL_10:
        result = v11;
        if (v11)
          return (id *)objc_msgSend(v11, "code");
        return result;
      }
      objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(v5[8], "pointCloudOutput"), -[BWNode input](v9, "input"), 0);
      objc_msgSend(v8, "addObjectsFromArray:", -[BWNode outputs](v9, "outputs"));
    }
    v5[35] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);
    goto LABEL_10;
  }
  return result;
}

- (_QWORD)_updateNumberOfFaceTrackingConnectionConfigurations:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(a2);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v9))
          {
            v10 = objc_msgSend((id)objc_msgSend(v9, "sourceConfiguration"), "sourceDeviceType");
            v11 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10)), "intValue");
            v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 + 1));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10));
          }
        }
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    result = v4;
    v3[23] = result;
  }
  return result;
}

- (_QWORD)setFaceFilteringDelegate:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[9];
    if (v4)
    {
      if (v3[8])
        objc_msgSend(v4, "setDetectedFacesFilterDelegate:", a2);
    }
    else if (!v3[10])
    {
      result = (_QWORD *)v3[8];
      return (_QWORD *)objc_msgSend(result, "setDetectedFacesFilterDelegate:", a2);
    }
    result = (_QWORD *)v3[8];
    if (result && v3[10])
      return (_QWORD *)objc_msgSend(result, "setDetectedFacesFilterDelegate:", a2);
  }
  return result;
}

- (uint64_t)_buildSemanticMasksOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  void *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  if (a3)
  {
    v8 = *(void **)(a3 + 200);
    if (!v8)
      v8 = *(void **)(a3 + 208);
  }
  else
  {
    v8 = 0;
  }
  v9 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)a1, a2, v8, a3, a4, 0x76696465u, (uint64_t)CFSTR("SemanticMasks"));
  if ((_DWORD)v9)
    FigDebugAssert3();
  else
    *(_QWORD *)(a1 + 352) = objc_msgSend(a2, "copy");
  return v9;
}

- (uint64_t)_insertFunnelOnMetadataOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 mediaType:(uint64_t)a7 metadataName:
{
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  BWFanOutNode *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  BWFanOutNode *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  id obj;
  id obja;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  unsigned int v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v62 = 0;
  v61 = 0;
  if (!objc_msgSend(a2, "count"))
  {
LABEL_45:
    if (v61)
      return objc_msgSend(v61, "code");
    return 0;
  }
  if (a4)
    v11 = *(void **)(a4 + 184);
  else
    v11 = 0;
  v12 = objc_msgSend(v11, "sourceDeviceType");
  v13 = (id)objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3), "mutableCopy");
  if (!objc_msgSend(a1[45], "isBravoVariant"))
  {
LABEL_36:
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v35 = (void *)objc_msgSend(a2, "allKeys");
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((objc_msgSend(v13, "containsObject:", v40) & 1) == 0)
            objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v40);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v37);
    }
    goto LABEL_45;
  }
  v14 = objc_msgSend(a2, "count");
  v15 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, v12), "count");
  if (v14 < 2 || !v15)
  {
    if (v15)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      obja = (id)objc_msgSend(a2, "allKeys");
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v53;
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v53 != v26)
              objc_enumerationMutation(obja);
            v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            if (objc_msgSend(v13, "containsObject:", v28))
            {
              v29 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, a6);
              v51.receiver = a1;
              v51.super_class = (Class)FigCaptureCameraSourcePipeline;
              if ((objc_msgSendSuper2(&v51, sel_addNode_error_, v29, &v61) & 1) == 0
                || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v28), -[BWNode input](v29, "input"), 0) & 1) == 0)
              {
LABEL_49:
                FigDebugAssert3();
                goto LABEL_45;
              }
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v29, "outputs"), "objectAtIndexedSubscript:", 0), v28);
              v30 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v29, "outputs"), "objectAtIndexedSubscript:", 1);
              v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
              v32 = a2;
              v33 = v30;
            }
            else
            {
              v34 = objc_msgSend(a2, "objectForKeyedSubscript:", v28);
              objc_msgSend(a2, "setObject:forKeyedSubscript:", v34, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
              v32 = a2;
              v33 = 0;
              v31 = v28;
            }
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v31);
          }
          v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v25)
            continue;
          break;
        }
      }
      goto LABEL_45;
    }
    goto LABEL_36;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_msgSend(a2, "allKeys");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v58 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
        if (objc_msgSend(v13, "containsObject:", v21))
        {
          v22 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, a6);
          v56.receiver = a1;
          v56.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v56, sel_addNode_error_, v22, &v61) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v21), -[BWNode input](v22, "input"), 0) & 1) == 0)
          {
            goto LABEL_49;
          }
          objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v22, "outputs"), "objectAtIndexedSubscript:", 0), v21);
          objc_msgSend(v16, "addObject:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v22, "outputs"), "objectAtIndexedSubscript:", 1));
        }
        else
        {
          objc_msgSend(v16, "addObject:", objc_msgSend(a2, "objectForKeyedSubscript:", v21));
          objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v21);
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v18);
  }
  objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _addFunnelNodeToGraph:inputs:mediaType:name:outErr:]((uint64_t)a1, a5, v16, a6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Metadata Funnel"), a7), &v62), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
  v23 = v62;
  if (!v62)
    goto LABEL_45;
  FigDebugAssert3();
  return v23;
}

- (uint64_t)_getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:(uint64_t)a1
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  result = 0;
  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      result = objc_msgSend(a2, "count");
      if (result)
      {
        v11 = 0u;
        v12 = 0u;
        v9 = 0u;
        v10 = 0u;
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (result)
        {
          v5 = result;
          v6 = *(_QWORD *)v10;
          while (2)
          {
            for (i = 0; i != v5; ++i)
            {
              if (*(_QWORD *)v10 != v6)
                objc_enumerationMutation(a2);
              v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v8, "deviceOrientationCorrectionEnabled") & 1) != 0)
              {
                return 1;
              }
            }
            v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
            result = 0;
            if (v5)
              continue;
            break;
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)setMasterClock:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(void **)(result + 112);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setMasterClock:", a2);
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(char *)a3 sharesBuffersWithOtherConnections:
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = *(int *)(result + 192 + 4 * (int)a2);
    *(_DWORD *)(result + 192 + 4 * (int)a2) = v6 + 1;
    v7 = 0x1E0CB3000uLL;
    result = objc_msgSend(*(id *)(result + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
    if (result)
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2)), "count") <= v6)return 0;
      if (!a3)
        return objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v7 + 2024), "numberWithInt:", a2)), "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
      if (*(_DWORD *)(v5 + 44) != (_DWORD)a2)
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
      switch((_DWORD)a2)
      {
        case 4:
          v9 = &unk_1E4A009B0;
          break;
        case 9:
          v9 = &unk_1E4A009E0;
          break;
        case 8:
          v9 = &unk_1E4A009C8;
          break;
        default:
LABEL_14:
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
          {
            v11 = v10;
            v18 = a3;
            v19 = v6;
            v12 = 0;
            v13 = *(_QWORD *)v21;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(v8);
                v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
                v16 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", v15, v18, v19), "count")+ v12;
                v12 = v16
                    + (int)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 184), "objectForKeyedSubscript:", v15), "intValue");
                if (v12 > 1)
                {
                  v17 = 1;
                  goto LABEL_24;
                }
              }
              v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
              if (v11)
                continue;
              break;
            }
            v17 = 0;
LABEL_24:
            a3 = v18;
            v6 = v19;
            v7 = 0x1E0CB3000;
          }
          else
          {
            v17 = 0;
          }
          *a3 = v17;
          return objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v7 + 2024), "numberWithInt:", a2)), "objectAtIndexedSubscript:", v6);
      }
      objc_msgSend(v8, "addObjectsFromArray:", v9);
      goto LABEL_14;
    }
  }
  return result;
}

- (uint64_t)eyeReliefStatusOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 312), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)detectedObjectsOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 296), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  if (result)
    return *(_BYTE *)(result + 417) != 0;
  return result;
}

- (uint64_t)trackedFacesOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 320), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)previewOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 152), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return -[FigCaptureCameraSourcePipeline nextVideoCaptureOutputForSourceDeviceType:sharesBuffersWithOtherConnections:](result, a2, 0);
  return result;
}

- (uint64_t)isLightSourceMaskAndKeypointDescriptorDataOnVideoCaptureOutputsEnabledForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 344), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (BOOL)hardwareDepthFilteringEnabled
{
  if (result)
    return *(_BYTE *)(result + 416) != 0;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (id)initWithConfiguration:(void *)a3 captureDevice:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 renderDelegate:(uint64_t)a7 ispFastSwitchEnabled:(int *)a8 error:
{
  id v8;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, const __CFString *, _QWORD, id *);
  int v18;
  void *v19;
  void *v20;
  void *v21;
  CFTypeRef v22;
  void *v23;
  void *v24;
  float v25;
  int v26;
  int v27;
  id v29;
  objc_super v30;
  id v31;

  v8 = a1;
  if (!a1)
    return v8;
  v31 = 0;
  if (a2)
    v15 = *(void **)(a2 + 184);
  else
    v15 = 0;
  v16 = objc_msgSend(v15, "source");
  v17 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (v17)
  {
    v18 = v17(v16, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v31);
    if (v18)
    {
      v27 = v18;
    }
    else
    {
      if (a2)
        v19 = *(void **)(a2 + 184);
      else
        v19 = 0;
      v30.receiver = v8;
      v30.super_class = (Class)FigCaptureCameraSourcePipeline;
      v8 = objc_msgSendSuper2(&v30, sel_initWithGraph_name_sourceID_, a4, a5, objc_msgSend(v19, "sourceID"));
      if (!v8)
      {
LABEL_21:

        return v8;
      }
      if (a2)
        v20 = *(void **)(a2 + 184);
      else
        v20 = 0;
      if (!objc_msgSend(v20, "source"))
      {
        v27 = FigSignalErrorAt();
        goto LABEL_24;
      }
      *((_QWORD *)v8 + 7) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *((_DWORD *)v8 + 11) = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
      *((_DWORD *)v8 + 12) = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Position")), "intValue");
      *((_QWORD *)v8 + 45) = a3;
      if (a2)
        v21 = *(void **)(a2 + 184);
      else
        v21 = 0;
      v22 = (CFTypeRef)objc_msgSend(v21, "source");
      if (v22)
        v22 = CFRetain(v22);
      *((_QWORD *)v8 + 46) = v22;
      if (a2)
      {
        *((_QWORD *)v8 + 47) = (id)objc_msgSend(*(id *)(a2 + 184), "requiredFormat");
        v23 = *(void **)(a2 + 184);
      }
      else
      {
        v29 = (id)objc_msgSend(0, "requiredFormat");
        v23 = 0;
        *((_QWORD *)v8 + 47) = v29;
      }
      *((_QWORD *)v8 + 48) = (id)objc_msgSend(v23, "depthDataFormat");
      *((_QWORD *)v8 + 50) = (id)objc_msgSend(a4, "memoryPool");
      if (a2)
      {
        *((_BYTE *)v8 + 408) = *(float *)(a2 + 148) != 0.0;
        *((_BYTE *)v8 + 417) = *(_BYTE *)(a2 + 266);
        v24 = *(void **)(a2 + 184);
      }
      else
      {
        v24 = 0;
        *((_BYTE *)v8 + 408) = 0;
        *((_BYTE *)v8 + 417) = 0;
      }
      objc_msgSend(v24, "maxFrameRateClientOverride");
      *((_DWORD *)v8 + 105) = (int)v25;
      *((_QWORD *)v8 + 57) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v8 + 58) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = -[FigCaptureCameraSourcePipeline _buildMultiStreamCameraSourcePipeline:graph:renderDelegate:fastModeSwitch:]((uint64_t)v8, a2, a4, a6);
      if (!v26)
        goto LABEL_21;
      v27 = v26;
    }
  }
  else
  {
    v27 = -12782;
  }
  FigDebugAssert3();
LABEL_24:

  if (a8)
    *a8 = v27;

  return 0;
}

- (uint64_t)_buildMultiStreamCameraSourcePipeline:(uint64_t)result graph:(uint64_t)a2 renderDelegate:(void *)a3 fastModeSwitch:(uint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  char v28;
  int v29;
  unsigned int v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  float v35;
  char v36;
  int v37;
  int v38;
  int v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  void *v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  int v74;
  int v75;
  char v76;
  uint64_t v77;
  int v78;
  int v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  unsigned int v84;
  unsigned int v85;
  uint64_t v86;
  float v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  void *v91;
  void *v92;
  unsigned int v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, const __CFString *, uint64_t, __int128 *);
  void *v98;
  id v99;
  int v100;
  int v101;
  void *v102;
  void *j;
  void *v104;
  uint64_t v105;
  const void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t k;
  unsigned int v114;
  uint64_t v115;
  uint64_t v116;
  const void *v117;
  int v118;
  int v119;
  uint64_t v120;
  double v121;
  id *v122;
  void *v123;
  double v124;
  void *v125;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v127;
  void (*v128)(uint64_t, const __CFString *, CFDictionaryRef);
  uint64_t v129;
  void *v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  void *v134;
  unsigned int v135;
  void *v136;
  unsigned int v137;
  double v138;
  unsigned int v139;
  unsigned int v140;
  uint64_t v141;
  double v142;
  unsigned int v143;
  uint64_t v144;
  int v145;
  unsigned int v146;
  int v147;
  int v148;
  int v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t m;
  float v156;
  float v157;
  _BOOL8 v158;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL8 v160;
  int v161;
  int v162;
  _BOOL4 v163;
  void *v164;
  uint64_t v165;
  int v166;
  double v167;
  int v168;
  void *v169;
  double v170;
  unsigned int v171;
  unsigned int v172;
  uint64_t v173;
  uint64_t v174;
  char v175;
  char **v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  int v181;
  uint64_t v182;
  int v183;
  void *v184;
  void *v185;
  _BOOL4 v186;
  uint64_t v187;
  int v188;
  double v189;
  int v190;
  int v191;
  char v192;
  int v193;
  void *v194;
  int v195;
  int v196;
  void *v197;
  void *v198;
  int v199;
  void *v200;
  int v201;
  void *v202;
  uint64_t v203;
  BWMultiStreamCameraSourceNode *v204;
  const char *v205;
  BWMultiStreamCameraSourceNode *v206;
  int *v207;
  char v208;
  char v209;
  void *v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  float v214;
  float v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  char v219;
  char v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  char v224;
  char v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t n;
  CFArrayRef Identifiers;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  void *v238;
  void *v239;
  uint64_t v240;
  int v241;
  char v242;
  BWMultiStreamCameraSourceNode *v243;
  int v244;
  float v245;
  uint64_t v246;
  int v247;
  int v248;
  void *v249;
  BWMultiStreamCameraSourceNode *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  _BOOL4 v260;
  uint64_t v261;
  char v262;
  char v263;
  uint64_t v264;
  BWMultiStreamCameraSourceNode *v265;
  BWMultiStreamCameraSourceNode *v266;
  uint64_t v267;
  uint64_t v268;
  const void *v269;
  uint64_t v270;
  void *v271;
  FigCaptureSourceConfiguration *v272;
  unint64_t v273;
  void *v274;
  unsigned __int8 v275;
  unsigned __int8 v276;
  unsigned __int8 v277;
  unsigned __int8 v278;
  unint64_t v279;
  int *v280;
  uint64_t v281;
  void *v282;
  uint64_t (*v283)(uint64_t, const __CFString *, uint64_t, id *);
  int v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t ii;
  void *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  void *v293;
  float v294;
  void *v295;
  void *v296;
  int v297;
  int v298;
  double v299;
  double v300;
  double v301;
  double v302;
  void *v303;
  double v304;
  float v305;
  float v306;
  float v307;
  double v308;
  void *v309;
  void *v310;
  uint64_t v311;
  unint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  void *v316;
  float v317;
  float v318;
  float v319;
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  double v333;
  float v334;
  float v335;
  void *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t jj;
  void *v341;
  void *v342;
  unint64_t v343;
  void *v344;
  char v345;
  unint64_t v346;
  _BOOL4 v347;
  double v348;
  double v349;
  uint64_t v350;
  uint64_t v351;
  unint64_t v352;
  int v353;
  uint64_t v354;
  double v355;
  double v356;
  uint64_t kk;
  void *v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  _BOOL4 v365;
  double v366;
  double v367;
  uint64_t v368;
  unint64_t v369;
  uint64_t v370;
  unint64_t v371;
  double v372;
  double v374;
  int v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  void *v379;
  uint64_t v380;
  void *v381;
  uint64_t v382;
  uint64_t v383;
  unsigned int v384;
  unint64_t v385;
  uint64_t v386;
  uint64_t mm;
  void *v388;
  _BOOL4 v389;
  unint64_t v390;
  uint64_t v391;
  unint64_t v392;
  BOOL v393;
  unsigned int v394;
  unsigned int v395;
  uint64_t v396;
  void *v397;
  int v398;
  void *v399;
  void *v400;
  uint64_t v401;
  void *v402;
  int v403;
  void *v404;
  int v405;
  void *v406;
  int v407;
  void *v408;
  int v409;
  void *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t nn;
  void *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  unsigned __int8 v423;
  char v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  int v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  int v434;
  void *v436;
  BWNodeOutput *v437;
  uint64_t v438;
  id v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  const char *v446;
  id v447;
  uint64_t v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  uint64_t v457;
  unsigned __int8 v458;
  unsigned __int8 v459;
  unsigned int v460;
  uint64_t v461;
  void *v462;
  void *v463;
  int v464;
  int v465;
  void *v466;
  unsigned __int8 v467;
  unsigned __int8 v468;
  unsigned __int8 shouldUseDepthCompanionIndex;
  unsigned __int8 v470;
  unsigned int v471;
  int v472;
  char v473;
  unsigned int v474;
  uint64_t v475;
  unint64_t v476;
  unsigned __int8 v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  unsigned __int8 v482;
  _BOOL4 v483;
  int v484;
  int v485;
  unsigned __int8 v486;
  _BOOL4 v487;
  char v488;
  uint64_t v489;
  unsigned int v490;
  _BOOL4 v491;
  uint64_t v492;
  int v493;
  _BOOL4 v494;
  uint64_t v495;
  unsigned int v496;
  uint64_t v497;
  _BOOL4 v498;
  _BOOL4 v499;
  void *v500;
  unsigned __int8 v501;
  uint64_t v502;
  char v503;
  unsigned int v504;
  char v505;
  uint64_t v506;
  uint64_t v507;
  _BOOL4 v508;
  uint64_t v509;
  unsigned int v510;
  _BOOL4 v511;
  unsigned __int8 v512;
  unsigned int v513;
  unsigned int v514;
  unsigned int v515;
  void *v516;
  unsigned int v517;
  void *v518;
  _BOOL4 v519;
  void *v520;
  unsigned int v521;
  unsigned __int8 v522;
  int shouldUseFESCompanionIndex;
  unsigned int v524;
  uint64_t v525;
  unsigned int v526;
  void *v527;
  int v528;
  void *v529;
  int v530;
  _BOOL4 v531;
  uint64_t v532;
  _BOOL4 v533;
  int v534;
  void *v535;
  _BOOL4 v536;
  void *v537;
  void *v538;
  unint64_t v539;
  void *v540;
  void *v541;
  unsigned int v542;
  void *v543;
  uint64_t v544;
  void *v545;
  void *v546;
  uint64_t v547;
  void *v548;
  unsigned int obj;
  id obja;
  id objb;
  unsigned __int8 objc;
  id objd;
  int v554;
  uint64_t v555;
  void *v556;
  uint64_t v557;
  void *v558;
  unsigned int v559;
  void *v560;
  int v561;
  id v562;
  BWMultiStreamCameraSourceNode *v563;
  id v564;
  void *v565;
  void *v566;
  int v567;
  id v568;
  unsigned int v569;
  id v570;
  id v571;
  id v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  objc_super v585;
  objc_super v586;
  __int128 v587;
  uint64_t v588;
  __int128 v589;
  uint64_t v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  id v603;
  unsigned int v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  os_log_type_t type[16];
  __int128 v614;
  __int128 v615;
  __int128 v616;
  unsigned int v617;
  _BYTE v618[128];
  _BYTE v619[128];
  _BYTE v620[128];
  _QWORD v621[9];
  _QWORD v622[2];
  _QWORD v623[2];
  _QWORD v624[2];
  _BYTE v625[128];
  _BYTE v626[128];
  _BYTE v627[128];
  id v628[16];
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  BOOL (*v634)(uint64_t, void *);
  void *v635;
  int v636;
  int v637;
  uint64_t v638;
  CGSize v639;

  v638 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v6 = result;
  v604 = 0;
  v603 = 0;
  v463 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v462 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v466 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v449 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v452 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v454 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v453 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v456 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v450 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v451 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v436 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v455 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a2)
  {
    v529 = *(void **)(a2 + 16);
    v542 = *(_DWORD *)(a2 + 28);
    v498 = *(_BYTE *)(a2 + 117) != 0;
    v7 = *(void **)(a2 + 184);
    v8 = *(void **)(a2 + 192);
    v543 = *(void **)(a2 + 200);
    v9 = *(void **)(a2 + 216);
    v545 = *(void **)(a2 + 208);
    v527 = *(void **)(a2 + 224);
    v10 = *(void **)(a2 + 256);
  }
  else
  {
    v527 = 0;
    v545 = 0;
    v8 = 0;
    v498 = 0;
    v529 = 0;
    v542 = 0;
    v7 = 0;
    v543 = 0;
    v9 = 0;
    v10 = 0;
  }
  v547 = a2;
  if (objc_msgSend(v10, "count") && objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      v12 = objc_msgSend((id)objc_msgSend(v10, "firstObject"), "pointCloudOutputDisabled");
      if ((v12 & 1) == 0)
        break;
      ++v11;
    }
    while (objc_msgSend(v10, "count") > v11);
    v474 = v12 ^ 1;
    a2 = v547;
    if (v547)
      goto LABEL_10;
  }
  else
  {
    v474 = 0;
    if (a2)
    {
LABEL_10:
      v13 = *(void **)(a2 + 256);
      goto LABEL_11;
    }
  }
  v13 = 0;
LABEL_11:
  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_msgSend((id)objc_msgSend(v13, "firstObject"), "supplementalPointCloudData");
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      v15 = 1;
      do
      {
        if (v14 != objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v15), "supplementalPointCloudData"))objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Point cloud connection configs with the same source should have the same supplementalPointCloudData value"), 0));
        ++v15;
      }
      while (objc_msgSend(v13, "count") > v15);
      a2 = v547;
    }
    if (a2)
      goto LABEL_18;
  }
  else
  {
    v14 = 0;
    if (a2)
    {
LABEL_18:
      v16 = *(void **)(a2 + 256);
      goto LABEL_19;
    }
  }
  v16 = 0;
LABEL_19:
  v629 = 0u;
  v630 = 0u;
  v631 = 0u;
  v632 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
  v541 = v9;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v630;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v630 != v19)
          objc_enumerationMutation(v16);
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v629 + 1) + 8 * i), "sinkConfiguration"), "sinkType") == 15)
        {
          v434 = 1;
          goto LABEL_29;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
      if (v18)
        continue;
      break;
    }
    v434 = 0;
LABEL_29:
    v9 = v541;
  }
  else
  {
    v434 = 0;
  }
  v21 = objc_msgSend(v7, "depthDataDeliveryEnabled");
  if (v542 == 3)
    v22 = 0;
  else
    v22 = v21;
  v534 = v22;
  v473 = objc_msgSend(v8, "previewDepthFilterRenderingEnabled");
  v548 = (void *)objc_msgSend(v7, "requiredFormat");
  v470 = objc_msgSend((id)objc_msgSend(v9, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization");
  v23 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 360), "captureStream"), "stream"), "supportedProperties");
  v24 = objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D07458]);
  v25 = objc_msgSend(v7, "cinematicFramingEnabled");
  v26 = objc_msgSend(v7, "manualCinematicFramingEnabled");
  v27 = v26;
  v535 = v8;
  v471 = v14;
  v557 = v24;
  if ((v25 & 1) != 0)
  {
    if (v547)
      v28 = v26;
    else
      v28 = 1;
    if ((v28 & 1) == 0)
LABEL_41:
      v27 = 0;
  }
  else
  {
    if (v547)
      v36 = v26;
    else
      v36 = 1;
    if (v547)
      v27 = 1;
    else
      v27 = v26;
    if ((v36 & 1) == 0)
      goto LABEL_41;
  }
  v29 = objc_msgSend(v7, "deskCamEnabled");
  v30 = FigCaptureCinematicFramingNodeRequiredInGraph(v25, objc_msgSend((id)objc_msgSend(v7, "requiredFormat"), "isCinematicFramingProvidedBySource"), v27);
  v567 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("backgroundblur"), objc_msgSend(v7, "backgroundBlurEnabled"), objc_msgSend(v7, "isBackgroundBlurSupported"), objc_msgSend((id)objc_msgSend(v7, "requiredFormat"), "isBackgroundBlurProvidedBySource"), v9 != 0, 0);
  v561 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("studiolighting"), objc_msgSend(v7, "studioLightingEnabled"), objc_msgSend(v7, "isStudioLightingSupported"), objc_msgSend((id)objc_msgSend(v7, "requiredFormat"), "isStudioLightingProvidedBySource"), v9 != 0, 0);
  v472 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("reactioneffects"), objc_msgSend(v7, "reactionEffectsEnabled"), objc_msgSend(v7, "reactionEffectsSupported"), objc_msgSend((id)objc_msgSend(v7, "requiredFormat"), "reactionEffectsProvidedBySource"), v9 != 0, 0);
  v31 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("backgroundreplacement"), objc_msgSend(v7, "backgroundReplacementEnabled"), objc_msgSend(v7, "isBackgroundReplacementSupported"), objc_msgSend((id)objc_msgSend(v7, "requiredFormat"), "isBackgroundReplacementProvidedBySource"), v9 != 0, 0);
  v554 = v29;
  obj = v30;
  v493 = v29 | v30;
  v32 = csp_videoCaptureDimensionsFromConnectionConfigurations((void *)objc_msgSend(v7, "requiredFormat"), v9, (uint64_t)v545, v543, (uint64_t)v527, v29 | v30);
  shouldUseFESCompanionIndex = csp_shouldUseFESCompanionIndex(v7, v545, v32);
  v565 = v7;
  v539 = v32;
  shouldUseDepthCompanionIndex = csp_shouldUseDepthCompanionIndex(v7, v545, v32);
  v468 = objc_msgSend(*(id *)(v6 + 360), "hasFlash");
  if ((int)FigCapturePlatformIdentifier() > 10)
  {
    v467 = 0;
    v33 = v547;
    if (!v547)
      goto LABEL_47;
LABEL_57:
    v35 = *(float *)(v33 + 148);
    v533 = v35 != 0.0;
    goto LABEL_58;
  }
  v33 = v547;
  if (v547)
    v34 = *(void **)(v547 + 192);
  else
    v34 = 0;
  if (objc_msgSend((id)objc_msgSend(v34, "sinkConfiguration"), "sinkType") != 1)
  {
    v467 = 0;
    if (!v547)
      goto LABEL_47;
    goto LABEL_57;
  }
  v467 = objc_msgSend(v34, "enabled");
  if (v547)
    goto LABEL_57;
LABEL_47:
  v533 = 0;
  v35 = 0.0;
LABEL_58:
  v528 = csp_dockKitNodeEnabled(v33, objc_msgSend(a3, "isRunningForContinuityCapture"));
  v37 = csp_willDecoupleWarperFromStreamProcessing(v529);
  v540 = a3;
  v544 = v6;
  if ((v534 & 1) != 0)
  {
    v38 = objc_msgSend(*(id *)(v6 + 360), "isBravoVariant");
    v39 = v38;
    v526 = 0;
    v40 = v539 == 3840;
    if ((_DWORD)v539 == 3840 && v38)
    {
      v41 = *(void **)(v6 + 360);
      v629 = 0u;
      v630 = 0u;
      v631 = 0u;
      v632 = 0u;
      v42 = (void *)objc_msgSend(v41, "captureStreams");
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
      if (!v43)
        goto LABEL_97;
      v44 = v43;
      v45 = *(_QWORD *)v630;
      v46 = *MEMORY[0x1E0D05A18];
      v47 = *MEMORY[0x1E0D05A28];
LABEL_63:
      v48 = 0;
      while (1)
      {
        if (*(_QWORD *)v630 != v45)
          objc_enumerationMutation(v42);
        v49 = *(void **)(*((_QWORD *)&v629 + 1) + 8 * v48);
        if (objc_msgSend(v41, "bravoTelephotoCaptureStream"))
        {
          if ((objc_msgSend((id)objc_msgSend(v49, "portType"), "isEqualToString:", v46) & 1) != 0)
            break;
        }
        if (objc_msgSend(v41, "bravoSuperWideCaptureStream")
          && (objc_msgSend((id)objc_msgSend(v49, "portType"), "isEqualToString:", v47) & 1) != 0)
        {
          break;
        }
        if (v44 == ++v48)
        {
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
          if (!v44)
            goto LABEL_97;
          goto LABEL_63;
        }
      }
      if (!v49)
      {
LABEL_97:
        v604 = FigSignalErrorAt();
        goto LABEL_467;
      }
      v50 = BWUtilitiesUnderlyingDeviceTypeFromPortType((void *)objc_msgSend(v49, "portType"), objc_msgSend(v565, "sourceDeviceType"));
      v51 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v545);
      v52 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v543);
      v6 = v544;
      if ((objc_msgSend(v51, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50)) & 1) != 0)
        v53 = 1;
      else
        v53 = objc_msgSend(v52, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50));
      v33 = v547;
      v526 = v53 ^ 1;
      v40 = 1;
      v39 = 1;
    }
  }
  else
  {
    v39 = 0;
    v526 = 0;
    v40 = v539 == 3840;
  }
  v54 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 360), "captureStream"), "supportedOutputs");
  if (((objc_msgSend(v54, "containsObject:", *MEMORY[0x1E0D07FE0]) ^ 1 | v37) & 1) != 0)
    v55 = 1;
  else
    v55 = v39 & (v526 ^ 1);
  v56 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 360), "captureStream"), "supportedOutputs");
  if (objc_msgSend(v56, "containsObject:", *MEMORY[0x1E0D07FF0]))
  {
    v57 = objc_msgSend(v548, "isSecondaryScalerUnavailable");
    if (v557)
      v58 = 0;
    else
      v58 = v37;
    v59 = v57 | v58;
  }
  else
  {
    v59 = 1;
  }
  v530 = v59;
  if ((v534 & v40) == 1)
  {
    v60 = objc_msgSend(v545, "count");
    v61 = v530;
    if (v60)
      v61 = 1;
    v530 = v61;
  }
  v62 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 360), "captureStream"), "supportedOutputs");
  v63 = objc_msgSend(v62, "containsObject:", *MEMORY[0x1E0D07FC8]);
  v64 = objc_msgSend(v565, "geometricDistortionCorrectionEnabled");
  if ((int)FigCapturePlatformIdentifier() <= 9
    && v64
    && ((objc_msgSend(v529, "containsObject:", &unk_1E49F9BD0) & 1) != 0
     || objc_msgSend(v529, "containsObject:", &unk_1E49F9C00)))
  {
    goto LABEL_97;
  }
  v536 = v40;
  if (v33)
  {
    HIDWORD(v461) = *(_BYTE *)(v33 + 138) != 0;
    v465 = *(_BYTE *)(v33 + 137) != 0;
    HIDWORD(v475) = *(_DWORD *)(v33 + 160);
    LODWORD(v475) = *(_DWORD *)(v33 + 164);
    LODWORD(v461) = *(_DWORD *)(v33 + 168);
    v460 = *(_DWORD *)(v33 + 172);
    if (objc_msgSend(v548, "sushiRawSupported"))
      v459 = *(_BYTE *)(v33 + 264) == 0;
    else
      v459 = 0;
    v65 = v567;
    v66 = v561;
    v458 = *(_BYTE *)(v33 + 176) != 0;
  }
  else
  {
    v459 = objc_msgSend(v548, "sushiRawSupported");
    v461 = 0;
    v475 = 0;
    v465 = 0;
    v460 = 0;
    v458 = 0;
    v65 = v567;
    v66 = v561;
  }
  v67 = v65 | v66;
  v68 = v472 | v31;
  if ((int)FigCapturePlatformIdentifier() < 7)
    v69 = 1;
  else
    v69 = v55;
  if (((v69 | v530) & 1) != 0)
  {
    LOBYTE(v70) = 0;
    v71 = v565;
  }
  else
  {
    v71 = v565;
    v70 = csp_gdcExpandsImageDimensions(objc_msgSend(v565, "source")) ^ 1;
  }
  v464 = v67 | v68;
  v72 = v548;
  v73 = v544;
  *(_BYTE *)(v544 + 392) = csp_shouldCaptureStillsFromVideoStream(v71, v548, shouldUseFESCompanionIndex, v541 != 0);
  *(_BYTE *)(v544 + 40) = 0;
  if (v543)
  {
    if (v541)
      v74 = objc_msgSend(v548, "capturesStillsFromVideoStream");
    else
      v74 = 0;
    if (objc_msgSend(v545, "count"))
      v74 = 1;
    if (v64)
      v75 = objc_msgSend(*(id *)(v544 + 360), "isBravoVariant") & v526;
    else
      LOBYTE(v75) = 1;
    v76 = v70 | v75;
    if ((v530 ^ 1) + (v55 ^ 1u) + v63 <= 1)
      v76 = 0;
    if (!v74 || (v76 & 1) != 0)
    {
      v73 = v544;
      v72 = v548;
      if (objc_msgSend(v545, "count") || *(_BYTE *)(v544 + 392))
      {
        if ((v554 | v55 & v530 | v533 | obj | v464) == 1)
        {
          *(_BYTE *)(v544 + 40) = 1;
          LOBYTE(v465) = v64;
        }
        else if (HIDWORD(v461) == v465)
        {
          if ((objc_msgSend(v529, "containsObject:", &unk_1E49F9D50) ^ 1 | v64) == 1)
          {
            v77 = objc_msgSend(v548, "previewDimensions");
            v78 = HIDWORD(v539) * v539;
            v79 = HIDWORD(v77) * v77;
            if (HIDWORD(v77) * (int)v77 <= HIDWORD(v539) * (int)v539 && (float)((float)v79 * 1.5385) >= (float)v78
              || v78 <= v79 && (float)((float)v78 * 1.5385) >= (float)v79)
            {
              *(_BYTE *)(v544 + 40) = 1;
            }
            else if ((int)v77 < (int)v539 && v530 | v55)
            {
              v80 = (void *)objc_msgSend(v71, "requiredFormat");
              if (shouldUseFESCompanionIndex)
                v81 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v80, "frontEndScalerCompanionFormats"), "firstObject"), "fesDimensions");
              else
                v81 = objc_msgSend(v80, "nativeDimensions");
              *(_BYTE *)(v544 + 40) = (float)((float)(int)v539 * 1.2) < (float)v81;
            }
          }
        }
        else
        {
          *(_BYTE *)(v544 + 40) = 0;
        }
      }
    }
    else
    {
      v73 = v544;
      *(_BYTE *)(v544 + 40) = 1;
      v72 = v548;
    }
  }
  v82 = v547;
  if (v547)
  {
    *(_BYTE *)(v73 + 472) = csp_trueVideoCaptureEnabled(*(void **)(v547 + 208));
    if (*(_BYTE *)(v547 + 336) && !*(_BYTE *)(v73 + 472))
    {
      if (dword_1ECFE9690)
      {
        LODWORD(v628[0]) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v428 = 0;
        v73 = v544;
        v72 = v548;
      }
      else
      {
        v428 = 0;
      }
    }
    else
    {
      v428 = 8;
    }
    v82 = v547;
    v83 = *(void **)(v547 + 256);
  }
  else
  {
    v345 = csp_trueVideoCaptureEnabled(0);
    v83 = 0;
    *(_BYTE *)(v73 + 472) = v345;
    v428 = 8;
  }
  v84 = csp_projectorModeFromPointCloudDataConnectionConfigurations(v83);
  v85 = csp_cinematicVideoEnabled(v82);
  if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v72, "sensorCropDimensions")))
    v86 = objc_msgSend(v72, "sensorCropDimensions");
  else
    v86 = objc_msgSend(v72, "sensorDimensions");
  v87 = (float)((float)(int)v86 * (float)(int)objc_msgSend(v72, "horizontalSensorBinningFactor", v417, v421))
      / (float)SHIDWORD(v86);
  if ((float)((float)((float)(int)v539 / (float)SHIDWORD(v539))
             - (float)(v87 * (float)(int)objc_msgSend(v72, "verticalSensorBinningFactor"))) <= 0.01
    || ((objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "videoStabilizationAdaptiveOverscanSupported") ^ 1 | v85) & 1) != 0)
  {
    goto LABEL_152;
  }
  if (v547 && *(_BYTE *)(v547 + 24))
  {
    v515 = 0;
    goto LABEL_154;
  }
  if ((objc_msgSend(v71, "cinematicFramingEnabled") & 1) != 0
    || (objc_msgSend(v71, "manualCinematicFramingEnabled") & 1) != 0)
  {
LABEL_152:
    v515 = 0;
  }
  else
  {
    v515 = v536 & ~objc_msgSend(v71, "deskCamEnabled");
  }
  if (v547)
  {
LABEL_154:
    v88 = v547;
    v89 = *(_QWORD *)(v547 + 208);
    goto LABEL_155;
  }
  v89 = 0;
  v88 = 0;
LABEL_155:
  v90 = csp_stabilizationMethodWithMostOverscan(+[FigVideoCaptureConnectionConfiguration videoStabilizationMethods:includeIris:](FigVideoCaptureConnectionConfiguration, "videoStabilizationMethods:includeIris:", v89, 1));
  v91 = *(void **)(v73 + 360);
  v513 = v90;
  if (v88)
  {
    v504 = *(_DWORD *)(v88 + 180);
    LODWORD(v506) = *(_BYTE *)(v88 + 142) != 0;
    HIDWORD(v506) = *(_BYTE *)(v88 + 152) != 0;
    v508 = *(_BYTE *)(v88 + 153) != 0;
    v499 = *(_BYTE *)(v88 + 143) != 0;
    v483 = *(_BYTE *)(v88 + 159) != 0;
    v92 = *(void **)(v88 + 224);
  }
  else
  {
    v483 = 0;
    v508 = 0;
    v506 = 0;
    v504 = 0;
    v499 = 0;
    v92 = 0;
  }
  v502 = *(_QWORD *)(v73 + 400);
  v93 = objc_msgSend((id)objc_msgSend(v92, "depthDataSinkConfiguration"), "filteringEnabled");
  *(_QWORD *)&v633 = 0;
  v524 = v84;
  v521 = v85;
  v517 = v93;
  if (v88)
    v94 = *(void **)(v88 + 184);
  else
    v94 = 0;
  v95 = objc_msgSend(v94, "source");
  v96 = *MEMORY[0x1E0C9AE00];
  v97 = *(void (**)(uint64_t, const __CFString *, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
  if (v97)
  {
    v97(v95, CFSTR("AttributesDictionary"), v96, &v633);
    v98 = (void *)v633;
  }
  else
  {
    v98 = 0;
  }
  v99 = v98;
  v425 = v96;
  v510 = objc_msgSend((id)objc_msgSend((id)v633, "objectForKeyedSubscript:", CFSTR("VideoZoomSmoothingSupported")), "BOOLValue");
  if (v547)
  {
    v519 = *(_BYTE *)(v547 + 155) != 0;
    v489 = *(_QWORD *)(v547 + 312);
    v100 = *(_DWORD *)(v547 + 304);
    v101 = *(_DWORD *)(v547 + 32);
    v531 = *(_BYTE *)(v547 + 346) != 0;
    v487 = *(_BYTE *)(v547 + 156) != 0;
    v494 = *(_BYTE *)(v547 + 336) != 0;
    v496 = *(_DWORD *)(v547 + 340);
    v491 = *(_BYTE *)(v547 + 300) != 0;
    v511 = *(_BYTE *)(v547 + 349) != 0;
  }
  else
  {
    v491 = 0;
    v494 = 0;
    v531 = 0;
    v519 = 0;
    v489 = 0;
    v487 = 0;
    v496 = 0;
    v511 = 0;
    v100 = 0;
    v101 = 0;
  }
  v485 = *(unsigned __int8 *)(v73 + 472);
  v617 = 0;
  v102 = (void *)objc_msgSend(v71, "requiredFormat");
  v558 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  *(_OWORD *)type = 0u;
  v614 = 0u;
  v615 = 0u;
  v616 = 0u;
  v537 = v91;
  obja = (id)objc_msgSend(v91, "captureStreams");
  v562 = v102;
  v568 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", type, &v633, 16);
  if (v568)
  {
    v555 = *(_QWORD *)v614;
    do
    {
      for (j = 0; j != v568; j = (char *)j + 1)
      {
        if (*(_QWORD *)v614 != v555)
          objc_enumerationMutation(obja);
        v104 = *(void **)(*(_QWORD *)&type[8] + 8 * (_QWORD)j);
        v105 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(objc_msgSend(v71, "source"), v102, objc_msgSend(v104, "portType"), &v617);
        if (v617)
        {
          v604 = v617;
LABEL_466:
          FigDebugAssert3();
          goto LABEL_467;
        }
        v106 = (const void *)v105;
        if (v105)
          v107 = (void *)v105;
        else
          v107 = v102;
        v108 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v609 = 0u;
        v610 = 0u;
        v611 = 0u;
        v612 = 0u;
        v109 = (void *)objc_msgSend(v107, "highResStillImageDimensions");
        v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v609, &v629, 16);
        if (v110)
        {
          v111 = v110;
          v112 = *(_QWORD *)v610;
          do
          {
            for (k = 0; k != v111; ++k)
            {
              if (*(_QWORD *)v610 != v112)
                objc_enumerationMutation(v109);
              objc_msgSend(v108, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v609 + 1) + 8 * k), "flavor")));
            }
            v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v609, &v629, 16);
          }
          while (v111);
        }
        objc_msgSend(v558, "setObject:forKeyedSubscript:", objc_msgSend(v108, "allObjects"), objc_msgSend(v104, "portType"));
        if (v106)
          CFRelease(v106);
        v71 = v565;
        v102 = v562;
      }
      v568 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", type, &v633, 16);
    }
    while (v568);
  }
  v114 = objc_msgSend(v71, "depthDataDeliveryEnabled");
  if (v542 == 3)
    v115 = 0;
  else
    v115 = v114;
  v116 = objc_msgSend(v102, "isStereoFusionSupported") & (v115 ^ 1);
  v117 = (const void *)objc_msgSend(v71, "source");
  v118 = 0;
  if (((v115 ^ 1) & 1) == 0)
  {
    objc_msgSend(v71, "depthDataMaxFrameRate");
    v118 = v119;
  }
  v569 = objc_msgSend((id)objc_msgSend(v541, "irisSinkConfiguration"), "bravoConstituentPhotoDeliveryEnabled");
  if (objc_msgSend(v535, "previewDepthFilterRenderingEnabled"))
    v120 = objc_msgSend(v535, "portraitAutoSuggestEnabled") ^ 1;
  else
    v120 = 0;
  objc_msgSend(v537, "setStillImageSupportedHighResolutionFlavorsByPortType:", v558);
  objc_msgSend(v537, "setStereoFusionEnabled:", v116);
  objc_msgSend(v537, "setBravoConstituentPhotoDeliveryEnabled:", v569);
  objc_msgSend(v537, "setDepthDataDeliveryEnabled:", v115);
  objc_msgSend(v537, "setShallowDepthOfFieldEffectEnabled:", v120);
  objc_msgSend(v537, "setWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled:", objc_msgSend(v562, "isWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled"));
  objc_msgSend(v537, "setPortraitAutoSuggestEnabled:", objc_msgSend(v535, "portraitAutoSuggestEnabled"));
  LODWORD(v121) = v101;
  objc_msgSend(v537, "setMaxContinuousZoomFactorForDepthDataDelivery:", v121);
  objc_msgSend(v537, "setStillImageISPMultiBandNoiseReductionEnabled:", objc_msgSend(v562, "isStillImageISPMultiBandNoiseReductionSupported"));
  objc_msgSend(v537, "setFocusPixelsEnabled:", objc_msgSend(v562, "autoFocusSystem") == 2);
  objc_msgSend(v537, "setRedEyeReductionEnabled:", (int)objc_msgSend(v562, "redEyeReductionVersion") > 0);
  objc_msgSend(v537, "setStillImageFocusPixelDataCaptureWithDepthEnabled:", HIDWORD(v475) != 0);
  objc_msgSend(v537, "setStillImageSashimiRawCaptureWithDepthEnabled:", (_DWORD)v475 != 0);
  objc_msgSend(v562, "maxVisibleSensorRect");
  objc_msgSend(v537, "setSensorRegionOfInterestForCameraControls:");
  objc_msgSend(v537, "setWideCaptureStreamAsStatsMasterPreferred:", objc_msgSend(v562, "isWideAsStatsMasterEnabled"));
  objc_msgSend(v537, "setSmartCameraEnabled:", objc_msgSend(v71, "smartCameraEnabled"));
  objc_msgSend(v537, "setFullBinSIFROnSecondaryCameraAllowed:", objc_msgSend(v562, "fullBinSIFROnSecondaryCameraAllowed"));
  objc_msgSend(v537, "setAttachesUprightExifOrientationMetadataToStreamingFrames:", 0);
  objc_msgSend(v537, "setStereoVideoCaptureEnabled:", v531);
  objc_msgSend(v537, "setCinematicFramingSupported:", objc_msgSend(v71, "isCinematicFramingSupported"));
  objc_msgSend(v537, "setCinematicFramingEnabled:", objc_msgSend(v71, "cinematicFramingEnabled"));
  objc_msgSend(v537, "setManualCinematicFramingEnabled:", objc_msgSend(v71, "manualCinematicFramingEnabled"));
  v122 = (id *)v544;
  if ((objc_msgSend(v537, "manualCinematicFramingEnabled") & 1) != 0
    || objc_msgSend(v537, "isCMIOZoomStreamPropertySupported"))
  {
    v123 = (void *)objc_msgSend(v537, "zoomCommandHandler");
    LODWORD(v124) = 1.0;
    objc_msgSend(v123, "setRequestedZoomFactor:", v124);
  }
  objc_msgSend(v537, "setCinematicFramingControlMode:", objc_msgSend(v71, "cinematicFramingControlMode"));
  objc_msgSend(v537, "setBackgroundBlurSupported:", objc_msgSend(v71, "isBackgroundBlurSupported"));
  objc_msgSend(v537, "setBackgroundBlurEnabled:", objc_msgSend(v71, "backgroundBlurEnabled"));
  objc_msgSend(v537, "setStudioLightingSupported:", objc_msgSend(v71, "isStudioLightingSupported"));
  objc_msgSend(v537, "setStudioLightingEnabled:", objc_msgSend(v71, "studioLightingEnabled"));
  objc_msgSend(v537, "setReactionEffectsSupported:", objc_msgSend(v71, "reactionEffectsSupported"));
  objc_msgSend(v537, "setReactionEffectsEnabled:", objc_msgSend(v71, "reactionEffectsEnabled"));
  objc_msgSend(v537, "setBackgroundReplacementSupported:", objc_msgSend(v71, "isBackgroundReplacementSupported"));
  objc_msgSend(v537, "setBackgroundReplacementEnabled:", objc_msgSend(v71, "backgroundReplacementEnabled"));
  objc_msgSend(v537, "setFaceDrivenAEAFEnabledByDefault:", objc_msgSend(v71, "faceDrivenAEAFEnabledByDefault"));
  objc_msgSend(v537, "setPhotoFormat:", objc_msgSend(v562, "isPhotoFormat"));
  v125 = v540;
  if (objc_msgSend(v537, "isBravoVariant"))
    objc_msgSend(v537, "setMidFrameSynchronizationEnabled:", v483);
  if (objc_msgSend(v71, "nonDestructiveCropEnabled"))
  {
    objc_msgSend(v71, "normalizedNonDestructiveCropSize");
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v639);
    v127 = objc_msgSend(v71, "source");
    v128 = *(void (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 56);
    if (v128)
      v128(v127, CFSTR("NonDestructiveCropSize"), DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
  v129 = v547;
  if (v117)
  {
    if ((objc_msgSend(v71, "hasSetVideoZoomFactorOnCaptureSource") & 1) == 0)
    {
      v130 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v71, "videoZoomFactor");
      v131 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("VideoZoomFactor"), (const __CFDictionary *)objc_msgSend(v130, "numberWithFloat:"));
      v617 = v131;
      if (v131)
      {
        v422 = v445;
        LODWORD(v418) = v131;
        goto LABEL_565;
      }
      objc_msgSend(v71, "setHasSetVideoZoomFactorOnCaptureSource:", 1);
      v129 = v547;
    }
    if (objc_msgSend(v537, "isBravoVariant")
      && (v129 = v547,
          v132 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("EligibleFallbackCaptureSourceDeviceTypes"), (const __CFDictionary *)objc_msgSend(v71, "fallbackPrimaryConstituentDeviceTypes")), (v617 = v132) != 0))
    {
      v422 = v445;
      LODWORD(v418) = v132;
    }
    else
    {
      v133 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("ActiveFormat_FigCaptureSessionOnly"), (const __CFDictionary *)v562);
      v617 = v133;
      if (!v133)
      {
        v134 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v71, "requiredMaxFrameRate");
        v135 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("ActiveMaxFrameRate_FigCaptureSessionOnly"), (const __CFDictionary *)objc_msgSend(v134, "numberWithFloat:"));
        v617 = v135;
        if (v135)
        {
          v422 = v445;
          LODWORD(v418) = v135;
        }
        else
        {
          v136 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v71, "requiredMinFrameRate");
          v137 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("ActiveMinFrameRate_FigCaptureSessionOnly"), (const __CFDictionary *)objc_msgSend(v136, "numberWithFloat:"));
          v617 = v137;
          if (v137)
          {
            v422 = v445;
            LODWORD(v418) = v137;
          }
          else
          {
            LODWORD(v138) = v118;
            v139 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("ActiveDepthDataMaxFrameRate"), (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v138));
            v617 = v139;
            if (!v139)
            {
              v140 = FigVideoCaptureSourceSetSessionProperty(v117, (uint64_t)v537, CFSTR("FaceDrivenAEAFMode"), (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v71, "faceDrivenAEAFMode")));
              v617 = v140;
              v129 = v547;
              if (!v140)
                goto LABEL_212;
              v422 = v445;
              LODWORD(v418) = v140;
              goto LABEL_567;
            }
            v422 = v445;
            LODWORD(v418) = v139;
          }
        }
LABEL_565:
        FigDebugAssert3();
        v129 = v547;
LABEL_568:
        v169 = v541;
        goto LABEL_262;
      }
      v422 = v445;
      LODWORD(v418) = v133;
    }
LABEL_567:
    FigDebugAssert3();
    goto LABEL_568;
  }
LABEL_212:
  objc_msgSend(v537, "setAutoImageControlMode:", v504);
  objc_msgSend(v537, "setZeroShutterLagEnabled:", v506);
  if ((_DWORD)v506)
    v141 = 4;
  else
    v141 = 1;
  objc_msgSend(v537, "setZeroShutterLagTimeMachineBufferCapacity:", v141);
  objc_msgSend(v537, "setMemoryPool:", v502);
  objc_msgSend(v537, "setOverCaptureEnabled:", v533);
  *(float *)&v142 = v35;
  objc_msgSend(v537, "setOverCapturePercentage:", v142);
  objc_msgSend(v537, "setAllocateResourcesCompatibleWithOverCapture:", HIDWORD(v506));
  v143 = objc_msgSend((id)objc_msgSend(v541, "irisSinkConfiguration"), "digitalFlashCaptureEnabled");
  objc_msgSend(v537, "setDigitalFlashMetadataEnabled:", v508 | v143);
  if (v143)
    v144 = objc_msgSend(v562, "digitalFlashDetectedObjectTypes");
  else
    v144 = 0;
  objc_msgSend(v537, "setDigitalFlashDetectedObjectTypes:", v144);
  objc_msgSend(v537, "setMomentCaptureVideoRecordingSupported:", objc_msgSend((id)objc_msgSend(v541, "irisSinkConfiguration"), "momentCaptureMovieRecordingEnabled"));
  v145 = objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "variableFrameRateVideoCaptureFromFWSupported");
  v146 = objc_msgSend((id)objc_msgSend(v71, "requiredFormat"), "isVariableFrameRateVideoCaptureSupported");
  v147 = objc_msgSend(v71, "videoStabilizationStrength");
  v148 = objc_msgSend(v71, "variableFrameRateVideoCaptureEnabled");
  if (v147 < 3)
    v149 = v148;
  else
    v149 = 0;
  v150 = v149 & v146;
  objc_msgSend(v537, "setVariableFrameRateControlEnabled:", v150 & (v145 ^ 1));
  v608 = 0u;
  v607 = 0u;
  v606 = 0u;
  v605 = 0u;
  v151 = (void *)objc_msgSend(v537, "captureStreams");
  v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v605, v628, 16);
  if (v152)
  {
    v153 = v152;
    v154 = *(_QWORD *)v606;
    do
    {
      for (m = 0; m != v153; ++m)
      {
        if (*(_QWORD *)v606 != v154)
          objc_enumerationMutation(v151);
        objc_msgSend(*(id *)(*((_QWORD *)&v605 + 1) + 8 * m), "setVariableFrameRateVideoEnabled:", v150);
      }
      v153 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v605, v628, 16);
    }
    while (v153);
  }
  objc_msgSend(v537, "setCinematicVideoEnabled:", v521);
  objc_msgSend(v537, "setDepthType:", v542);
  objc_msgSend(v537, "setMaxOverscanVideoStabilizationMethod:", v513);
  objc_msgSend(v537, "setVideoStabilizationStrength:", objc_msgSend(v71, "videoStabilizationStrength"));
  if (v513 == 5)
  {
    objc_msgSend(v562, "stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced");
    if (v156 == 0.0)
    {
      v158 = 0;
    }
    else
    {
      objc_msgSend(v562, "stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced");
      v158 = v157 < 28.0;
    }
    objc_msgSend(v537, "setVideoStabilizationModeUsesReducedOverscan:", v158);
  }
  objc_msgSend(v537, "setAdaptiveOverscanEnabled:", v515);
  objc_msgSend(v537, "setOptimizesZoomRampsForVISZoomSmoothing:", v510);
  v160 = (int)objc_msgSend(v562, "temporalNoiseReductionMode") >= 1
      && objc_msgSend(v71, "imageControlMode") != 4;
  v122 = (id *)v544;
  objc_msgSend(v537, "setTemporalNoiseReductionEnabled:", v160);
  v161 = objc_msgSend(v537, "cinematicVideoEnabled");
  if ((_DWORD)v539 == 3840)
    v162 = v161;
  else
    v162 = 0;
  v163 = (int)FigCapturePlatformIdentifier() > 8;
  if (v160
    && (v163 & ~v162 & v115 & 1) == 0
    && (objc_msgSend(v537, "cinematicVideoEnabled") ^ 1 | v162) == 1)
  {
    v164 = v537;
    objc_msgSend(v537, "setTemporalNoiseReductionBand0Disabled:", objc_msgSend(v562, "temporalNoiseReductionBand0Disabled"));
    v165 = objc_msgSend(v562, "temporalNoiseReductionRawEnabled");
  }
  else
  {
    v164 = v537;
    objc_msgSend(v537, "setTemporalNoiseReductionBand0Disabled:", 0);
    v165 = 0;
  }
  objc_msgSend(v164, "setTemporalNoiseReductionRawEnabled:", v165);
  objc_msgSend(v164, "setTemporalNoiseReductionStrengthHighEnabled:", v511);
  objc_msgSend(v164, "setDepthFormatDimensions:", objc_msgSend((id)objc_msgSend(v71, "depthDataFormat"), "dimensions"));
  objc_msgSend(v164, "setDepthPixelFormat:", objc_msgSend((id)objc_msgSend(v71, "depthDataFormat"), "format"));
  objc_msgSend(v164, "setDepthFilteringEnabled:", v517);
  objc_msgSend(v164, "setTimeOfFlightProjectorMode:", v524);
  objc_msgSend(v164, "setAllocateResourcesCompatibleWithDepthDataDelivery:", v519);
  v166 = objc_msgSend((id)objc_msgSend(v535, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  LODWORD(v167) = 0;
  v168 = 0;
  v169 = v541;
  if (!v166)
    goto LABEL_254;
  *(float *)&v167 = FigVideoCaptureSourceUIBaseZoomFactor(objc_msgSend(v71, "source", v167), &v617);
  if (!v617)
  {
    v168 = LODWORD(v167);
    LODWORD(v167) = v100;
    v164 = v537;
LABEL_254:
    objc_msgSend(v164, "setZoomPIPMinimumUIZoomFactor:", v167);
    LODWORD(v170) = v168;
    objc_msgSend(v164, "setUiBaseZoomFactor:", v170);
    v171 = objc_msgSend((id)objc_msgSend(v164, "captureStreams"), "count");
    if (((v519 || v499 && v487) & objc_msgSend(v164, "isBravoVariant")) != 0)
      v172 = 2;
    else
      v172 = 1;
    if (v569)
      v173 = v171;
    else
      v173 = v172;
    objc_msgSend(v164, "setNumberOfActiveTimeMachines:", v173);
    objc_msgSend(v164, "setPreferredMasterPortType:", v489);
    objc_msgSend(v164, "setStreamingSessionAnalyticsPixelFormat:", objc_msgSend(v562, "format"));
    objc_msgSend(v164, "setStreamingSessionAnalyticsVideoDimensions:", objc_msgSend(v562, "dimensions"));
    objc_msgSend(v164, "setStreamingSessionAnalyticsHighlightRecoveryEnabled:", objc_msgSend(v71, "highlightRecoveryEnabled"));
    objc_msgSend(v164, "setStreamingSessionAnalyticsClientIsVOIP:", v491);
    objc_msgSend(v164, "setTrueVideoCaptureEnabled:", v485 != 0);
    objc_msgSend(v164, "setRebuildingGraphForTrueVideoTransition:", v494);
    objc_msgSend(v164, "setTargetFrameRateWhenNotRecording:", v496);
    objc_msgSend(v164, "setFrameSkippingWhenNotRecordingEnabled:", (int)v496 > 0);
    goto LABEL_261;
  }
  v422 = v445;
  LODWORD(v418) = v617;
  FigDebugAssert3();
LABEL_261:
  v129 = v547;
LABEL_262:
  v604 = v617;
  if (v617)
    goto LABEL_466;
  v602 = 0u;
  v601 = 0u;
  v600 = 0u;
  v599 = 0u;
  v447 = (id)objc_msgSend(v122[45], "captureStreams");
  v495 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v599, v627, 16);
  if (!v495)
  {
    v439 = 0;
    v437 = 0;
    goto LABEL_472;
  }
  v439 = 0;
  v437 = 0;
  v497 = *(_QWORD *)v600;
  v457 = *MEMORY[0x1E0D05A40];
  v448 = *MEMORY[0x1E0D05A18];
  v174 = *MEMORY[0x1E0D05A30];
  v438 = *MEMORY[0x1E0D05A28];
  v175 = v498;
  if (v527)
    v175 = 1;
  v424 = v175;
  v525 = *MEMORY[0x1E0D064A0];
  v492 = *MEMORY[0x1E0D06498];
  v433 = *MEMORY[0x1E0D064B0];
  v442 = v129 + 68;
  v427 = *MEMORY[0x1E0D05CB0];
  v441 = v129 + 92;
  v176 = &selRef__prepareToTerminateImmediatelyDueToError_;
  v177 = 0x1E0CB3000uLL;
  v426 = *MEMORY[0x1E0D069A0];
  v444 = *MEMORY[0x1E0D06480];
  v443 = *MEMORY[0x1E0D06490];
  v432 = *MEMORY[0x1E0D064B8];
  v431 = *MEMORY[0x1E0D06488];
  v430 = *MEMORY[0x1E0D06478];
  v429 = *MEMORY[0x1E0D064C8];
  v440 = *MEMORY[0x1E0D05A30];
  while (2)
  {
    v178 = 0;
    v446 = v176[200];
    do
    {
      if (*(_QWORD *)v600 != v497)
      {
        v179 = v178;
        objc_enumerationMutation(v447);
        v178 = v179;
      }
      v532 = v178;
      objb = *(id *)(*((_QWORD *)&v599 + 1) + 8 * v178);
      v180 = (void *)objc_msgSend(objb, "portType", v418, v422);
      v181 = objc_msgSend(v71, "sourceDeviceType");
      if ((v181 == 12 || v181 == 6) && (objc_msgSend(v180, "isEqualToString:", v457) & 1) != 0)
      {
        v439 = objb;
        goto LABEL_435;
      }
      v556 = v180;
      v182 = BWUtilitiesUnderlyingDeviceTypeFromPortType(v180, objc_msgSend(v71, "sourceDeviceType"));
      v183 = objc_msgSend(v71, "sourceDeviceType");
      if (v183 == 6 || v183 == 12 || objc_msgSend(v71, "sourceDeviceType") == 13)
        v182 = objc_msgSend(v71, "sourceDeviceType");
      if (objc_msgSend(v71, "sourceDeviceType") == 14)
        v182 = objc_msgSend(v71, "sourceDeviceType");
      if (objc_msgSend(v71, "sourceDeviceType") - 17 <= 3)
        v182 = objc_msgSend(v71, "sourceDeviceType");
      v184 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v545);
      v185 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v543);
      v559 = v182;
      if ((objc_msgSend(v184, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v182)) & 1) != 0)
      {
        v186 = 1;
        v187 = v547;
      }
      else
      {
        v188 = objc_msgSend(v185, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v182));
        if (v542 == 3)
          v186 = 1;
        else
          v186 = v188;
        v187 = v547;
        if (v547 && !v186)
          v186 = *(_BYTE *)(v547 + 346) != 0;
      }
      v190 = 0;
      if (objc_msgSend((id)objc_msgSend(v535, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled"))
      {
        v191 = objc_msgSend(v556, "isEqualToString:", v448);
        v192 = v186 | v191;
        if (v187)
        {
          if (v191)
          {
            v192 = *(_BYTE *)(v187 + 302) == 0;
            if (!*(_BYTE *)(v187 + 302) && !v186 && !v533)
            {
              v190 = *(_DWORD *)(v187 + 308);
              v192 = 1;
            }
          }
        }
      }
      else
      {
        v192 = v186;
      }
      v522 = v192;
      LODWORD(v189) = v190;
      objc_msgSend(objb, "setStreamingFrameRateForZoomPIPOverlay:", v189);
      v193 = objc_msgSend(v71, "sourceDeviceType");
      v194 = *(void **)(v177 + 2176);
      *(_QWORD *)&v633 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v633 + 1) = 3221225472;
      v634 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v635 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      v636 = v182;
      v637 = v193;
      v520 = (void *)objc_msgSend(v543, "filteredArrayUsingPredicate:", objc_msgSend(v194, "predicateWithBlock:", &v633));
      v195 = objc_msgSend(v71, "sourceDeviceType");
      if (objc_msgSend(v169, "underlyingDeviceType") == (_DWORD)v182
        || objc_msgSend(v169, "underlyingDeviceType") == v195)
      {
        v538 = v169;
      }
      else
      {
        v538 = 0;
      }
      v196 = objc_msgSend(v71, "sourceDeviceType");
      v197 = *(void **)(v177 + 2176);
      *(_QWORD *)&v633 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v633 + 1) = 3221225472;
      v634 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v635 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      v636 = v182;
      v637 = v196;
      v518 = (void *)objc_msgSend(v545, "filteredArrayUsingPredicate:", objc_msgSend(v197, "predicateWithBlock:", &v633));
      if (v187)
      {
        v516 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(*(void **)(v187 + 232), v182);
        v198 = *(void **)(v187 + 240);
      }
      else
      {
        v516 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(0, v182);
        v198 = 0;
      }
      v199 = objc_msgSend(v71, "sourceDeviceType");
      v200 = *(void **)(v177 + 2176);
      *(_QWORD *)&v633 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v633 + 1) = 3221225472;
      v634 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v635 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      v636 = v182;
      v637 = v199;
      v570 = (id)objc_msgSend(v198, "filteredArrayUsingPredicate:", objc_msgSend(v200, "predicateWithBlock:", &v633));
      if (v187)
        v187 = *(_QWORD *)(v187 + 248);
      v201 = objc_msgSend(v71, "sourceDeviceType");
      v202 = *(void **)(v177 + 2176);
      *(_QWORD *)&v633 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v633 + 1) = 3221225472;
      v634 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v635 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      v636 = v182;
      v637 = v201;
      v203 = objc_msgSend((id)v187, "filteredArrayUsingPredicate:", objc_msgSend(v202, "predicateWithBlock:", &v633));
      v204 = -[BWMultiStreamCameraSourceNode initWithCaptureDevice:captureStream:]([BWMultiStreamCameraSourceNode alloc], "initWithCaptureDevice:captureStream:", v122[45], objb);
      if (!v204)
        goto LABEL_97;
      v206 = v204;
      -[BWNode setName:](v204, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Camera"), BWPortTypeToDisplayString(v556, v205)));
      v563 = v206;
      objc_msgSend(v122[7], "addObject:", v206);
      if (!objc_msgSend(v556, "isEqualToString:", v174)
        || (v207 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode,
            (unint64_t)objc_msgSend((id)objc_msgSend(v122[45], "captureStreams"), "count") <= 1))
      {
        if (!objc_msgSend(v556, "isEqualToString:", v438)
          || (v207 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode,
              (unint64_t)objc_msgSend((id)objc_msgSend(v122[45], "captureStreams"), "count") <= 1))
        {
          v207 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
      }
      *(id *)((char *)v122 + *v207) = v206;
      if (((v493 | v528) & 1) != 0)
      {
        v208 = 1;
        v209 = 1;
LABEL_313:
        v503 = v209;
        v210 = v556;
        goto LABEL_321;
      }
      v210 = v556;
      if (v547 && *(_BYTE *)(v547 + 178))
      {
        v503 = 0;
        v208 = 1;
        goto LABEL_321;
      }
      if (v206 == v122[8])
      {
        if (v534 && objc_msgSend(v122[45], "pearlInfraredCaptureStream"))
        {
          v260 = 1;
          v208 = v424;
          goto LABEL_450;
        }
        if (objc_msgSend((id)objc_msgSend(v538, "irisSinkConfiguration"), "depthDataDeliveryEnabled"))
        {
          v261 = objc_msgSend((id)objc_msgSend(v122[45], "captureStreams"), "count");
          v260 = v261 == 1;
          v262 = v534;
          if (v261 == 1)
            v262 = 0;
          if ((v262 & 1) == 0)
          {
            v208 = 0;
            goto LABEL_449;
          }
        }
        else if (!v534)
        {
          v260 = 0;
          v208 = 0;
          goto LABEL_453;
        }
        v260 = 0;
        if (objc_msgSend(v122[45], "bravoSuperWideCaptureStream"))
          v208 = v424;
        else
          v208 = 0;
LABEL_449:
        if (v534)
        {
LABEL_450:
          if (objc_msgSend(v71, "sourceDeviceType") == 13)
            v208 = 1;
        }
LABEL_453:
        if (objc_msgSend((id)objc_msgSend(v538, "irisSinkConfiguration"), "depthDataDeliveryEnabled")
          && objc_msgSend((id)objc_msgSend(v538, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
        {
          v260 = 1;
        }
        v263 = objc_msgSend((id)objc_msgSend(v538, "irisSinkConfiguration"), "stereoPhotoCaptureEnabled");
        if (v260)
          v209 = 1;
        else
          v209 = v263;
        goto LABEL_313;
      }
      v503 = 0;
      if (v206 == v122[9])
        v208 = v424;
      else
        v208 = 0;
LABEL_321:
      if (objc_msgSend(v122[45], "bravoTelephotoCaptureStream")
        && (objc_msgSend(v210, "isEqualToString:", v174) & 1) != 0)
      {
        v211 = v542;
        v212 = v542;
        goto LABEL_330;
      }
      if (objc_msgSend(v122[45], "bravoSuperWideCaptureStream"))
      {
        v213 = objc_msgSend(v210, "isEqualToString:", v448);
        if (v213)
          v212 = v542;
        else
          v212 = 0;
        if (v213)
        {
          v211 = v542;
LABEL_330:
          if (v542 - 1 < 2)
            goto LABEL_336;
        }
      }
      else
      {
        v212 = 0;
      }
      if ((objc_msgSend(v122[45], "isBravoVariant") & 1) != 0)
      {
        v514 = v212;
        v509 = 0;
        v512 = 0;
        v214 = -1.0;
        v215 = 0.0;
        v507 = v526;
        goto LABEL_342;
      }
      v211 = v212;
LABEL_336:
      v214 = -1.0;
      v215 = 0.0;
      if (!v547)
      {
        v509 = 0;
        v512 = 0;
        goto LABEL_340;
      }
      v512 = *(_BYTE *)(v547 + 177) != 0;
      if (!*(_BYTE *)(v547 + 118))
      {
        v509 = 0;
LABEL_340:
        BYTE4(v507) = 0;
        goto LABEL_341;
      }
      HIDWORD(v509) = *(_DWORD *)(v547 + 120);
      v215 = *(float *)(v547 + 124);
      LOBYTE(v509) = *(_BYTE *)(v547 + 128) != 0;
      v214 = *(float *)(v547 + 132);
      BYTE4(v507) = 1;
LABEL_341:
      v514 = v211;
LABEL_342:
      v500 = (void *)v203;
      v505 = v208;
      v216 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v595 = 0u;
      v596 = 0u;
      v597 = 0u;
      v598 = 0u;
      v217 = objc_msgSend(v570, "countByEnumeratingWithState:objects:count:", &v595, v626, 16);
      if (v217)
      {
        v218 = v217;
        v219 = 0;
        v220 = 0;
        v221 = *(_QWORD *)v596;
LABEL_344:
        v222 = 0;
        while (1)
        {
          if (*(_QWORD *)v596 != v221)
            objc_enumerationMutation(v570);
          v223 = *(void **)(*((_QWORD *)&v595 + 1) + 8 * v222);
          FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet((void *)objc_msgSend(v223, "metadataIdentifiers"), v216);
          v224 = objc_msgSend(v223, "attentionDetectionEnabled");
          v225 = FigCaptureMetadataObjectConfigurationRequiresEyeReliefStatus(v223);
          if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v223))
            FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v223, "sourceConfiguration"), "source"), &v604);
          if (v604)
            goto LABEL_466;
          v219 |= v224;
          v220 |= v225;
          if (v218 == ++v222)
          {
            v218 = objc_msgSend(v570, "countByEnumeratingWithState:objects:count:", &v595, v626, 16);
            if (v218)
              goto LABEL_344;
            goto LABEL_354;
          }
        }
      }
      v219 = 0;
      v220 = 0;
LABEL_354:
      v594 = 0u;
      v593 = 0u;
      v592 = 0u;
      v591 = 0u;
      v226 = objc_msgSend(v500, "countByEnumeratingWithState:objects:count:", &v591, v625, 16);
      if (v226)
      {
        v227 = v226;
        v228 = *(_QWORD *)v592;
        do
        {
          for (n = 0; n != v227; ++n)
          {
            if (*(_QWORD *)v592 != v228)
              objc_enumerationMutation(v500);
            Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v591 + 1) + 8 * n), "formatDescription"));
            FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet(Identifiers, v216);
          }
          v227 = objc_msgSend(v500, "countByEnumeratingWithState:objects:count:", &v591, v625, 16);
        }
        while (v227);
      }
      v231 = (void *)objc_msgSend(v548, "digitalFlashDetectedObjectTypes");
      if (objc_msgSend(v231, "count")
        && objc_msgSend((id)objc_msgSend(v538, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
      {
        objc_msgSend(v216, "addObjectsFromArray:", v231);
      }
      v232 = v547;
      if (v528)
      {
        v624[0] = v525;
        v624[1] = v492;
        objc_msgSend(v216, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v624, 2));
      }
      if (v493)
      {
        v623[0] = v525;
        v623[1] = v492;
        objc_msgSend(v216, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v623, 2));
      }
      if (v464)
      {
        objc_msgSend(v216, "addObject:", v525);
        if (objc_msgSend(v540, "isRunningForContinuityCapture"))
          objc_msgSend(v216, "addObject:", v492);
        if (v472 && (!v547 || *(_DWORD *)(v547 + 296) != 4))
          objc_msgSend(v216, "addObject:", v433);
      }
      v233 = (void *)objc_msgSend(FigCaptureConnectionConfigurationWithSinkType(v545, 6), "videoDataSinkConfiguration");
      if (v233)
      {
        v234 = v233;
        if (objc_msgSend(v233, "requestedBufferAttachmentsTrie"))
        {
          v622[0] = v427;
          v622[1] = v426;
          v235 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v622, 2);
          v236 = (void *)objc_msgSend(v234, "requestedBufferAttachmentsTrie");
          v237 = v235;
          v232 = v547;
          v238 = (void *)objc_msgSend(v236, "getSubTrie:", v237);
          if (v238)
          {
            v239 = v238;
            if ((objc_msgSend(v238, "isComplete") & 1) == 0)
            {
              if (objc_msgSend((id)objc_msgSend(v239, "children"), "count"))
                objc_msgSend(v216, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v239, "children"), "allKeys"));
            }
          }
        }
      }
      if (v232)
      {
        objc_msgSend(objb, "setContinuityCameraIsWired:", *(unsigned __int8 *)(v232 + 294));
        v240 = *(unsigned int *)(v232 + 296);
      }
      else
      {
        objc_msgSend(objb, "setContinuityCameraIsWired:", 0);
        v240 = 0;
      }
      objc_msgSend(objb, "setContinuityCameraClientDeviceClass:", v240);
      v241 = csp_cinematicVideoEnabled(v232);
      if (objc_msgSend(v535, "portraitAutoSuggestEnabled"))
      {
        objc_msgSend(v216, "addObject:", v525);
        objc_msgSend(v216, "addObject:", v444);
        objc_msgSend(v216, "addObject:", v443);
        if (!v241)
          goto LABEL_385;
      }
      else if (!v241)
      {
LABEL_385:
        if (v232)
          goto LABEL_386;
        goto LABEL_396;
      }
      v621[0] = v525;
      v621[1] = v433;
      v621[2] = v492;
      v621[3] = v432;
      v621[4] = v431;
      v621[5] = v430;
      v621[6] = v444;
      v621[7] = v443;
      v621[8] = v429;
      objc_msgSend(v216, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v621, 9));
      if (v232)
      {
LABEL_386:
        v242 = *(_BYTE *)(v232 + 136);
        v243 = v563;
        if (v242)
        {
          v244 = objc_msgSend((id)objc_msgSend(v565, "requiredFormat"), "stillImageGDCSourceMode");
          v242 = 1;
          if (v244)
          {
            if (v244 != 3)
            {
              v242 = v534;
              if (v244 != 2)
                v242 = 0;
            }
          }
        }
        goto LABEL_391;
      }
LABEL_396:
      v242 = 0;
      v243 = v563;
LABEL_391:
      objc = v242;
      v486 = v533
          && objc_msgSend(v565, "sourceDeviceType") == 9
          && v243 == *(BWMultiStreamCameraSourceNode **)(v544 + 72);
      v571 = *(id *)(v544 + 360);
      v484 = *(unsigned __int8 *)(v544 + 40);
      if (v232)
      {
        v501 = *(_BYTE *)(v232 + 24) != 0;
        v490 = *(_DWORD *)(v232 + 8);
        v488 = *(_BYTE *)(v232 + 116) != 0;
        v589 = *(_OWORD *)v442;
        v590 = *(_QWORD *)(v442 + 16);
        v587 = *(_OWORD *)v441;
        v588 = *(_QWORD *)(v441 + 16);
      }
      else
      {
        v501 = 0;
        v490 = 0;
        v488 = 0;
        v589 = 0uLL;
        v590 = 0;
        v588 = 0;
        v587 = 0uLL;
      }
      objc_msgSend((id)objc_msgSend(v527, "depthDataSinkConfiguration"), "filteringEnabled");
      if (v232)
      {
        v482 = *(float *)(v232 + 32) > 0.0;
        BYTE4(v481) = *(_BYTE *)(v232 + 142) != 0;
        LOBYTE(v481) = *(_BYTE *)(v232 + 143) != 0;
        v245 = *(float *)(v232 + 268);
        BYTE4(v480) = *(_BYTE *)(v232 + 266) != 0;
        LOBYTE(v480) = *(_BYTE *)(v232 + 144) != 0;
        BYTE4(v479) = *(_BYTE *)(v232 + 146) != 0;
        LOBYTE(v479) = *(_BYTE *)(v232 + 154) != 0;
        BYTE4(v478) = *(_BYTE *)(v232 + 147) != 0;
        LOBYTE(v478) = *(_BYTE *)(v232 + 139) != 0;
        v477 = *(_BYTE *)(v232 + 140) != 0;
        v476 = *(_QWORD *)(v232 + 352);
        csp_portraitPhotoModeEnabled(v232);
        objc_msgSend(v540, "isRunningForContinuityCapture");
      }
      else
      {
        csp_portraitPhotoModeEnabled(0);
        objc_msgSend(v540, "isRunningForContinuityCapture");
        v476 = 0;
        v478 = 0;
        v479 = 0;
        v480 = 0;
        v481 = 0;
        v482 = 0;
        v477 = 0;
        v245 = 0.0;
      }
      v423 = v219 & 1;
      v71 = v565;
      v604 = csp_configureMultiStreamCameraNode(v563, v565, v571, v520, v538, v518, v474, v471, v215, v214, v245, v484 != 0, v498, v529, v501, v490, v470, v468, v488,
               shouldUseFESCompanionIndex,
               shouldUseDepthCompanionIndex,
               v530,
               v467,
               &v589,
               &v587,
               v514,
               v473,
               v534,
               v482,
               v505,
               v503,
               BYTE4(v481),
               v481,
               HIDWORD(v475),
               v475,
               v461,
               v460,
               v459,
               v458,
               v516,
               v512,
               BYTE4(v507),
               HIDWORD(v509),
               v509,
               0,
               v533,
               v522,
               v216,
               v423,
               v220 & 1,
               BYTE4(v480),
               v480,
               SBYTE4(v479),
               v479,
               SBYTE4(v478),
               objc,
               v465,
               BYTE4(v461),
               v478,
               v477,
               v486,
               v539,
               v476);
      if (v604)
        goto LABEL_466;
      v122 = (id *)v544;
      v586.receiver = (id)v544;
      v586.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v586, v446, v563, &v603) & 1) == 0)
        goto LABEL_466;
      v246 = csp_stabilizationMethodWithMostOverscan(-[BWMultiStreamCameraSourceNodeConfiguration videoStabilizationMethods](-[BWMultiStreamCameraSourceNode configuration](v563, "configuration"), "videoStabilizationMethods"));
      v125 = v540;
      if ((int)v246 <= (int)objc_msgSend((id)objc_msgSend(v540, "memoryAnalyticsPayload"), "maxVideoStabilizationMethod"))v246 = objc_msgSend((id)objc_msgSend(v540, "memoryAnalyticsPayload"), "maxVideoStabilizationMethod");
      objc_msgSend((id)objc_msgSend(v540, "memoryAnalyticsPayload"), "setMaxVideoStabilizationMethod:", v246);
      v247 = objc_msgSend(v565, "videoStabilizationStrength");
      v248 = objc_msgSend((id)objc_msgSend(v540, "memoryAnalyticsPayload"), "videoStabilizationStrength");
      v249 = v565;
      v129 = v547;
      v169 = v541;
      v174 = v440;
      v177 = 0x1E0CB3000;
      if (v247 <= v248)
        v249 = (void *)objc_msgSend(v540, "memoryAnalyticsPayload");
      objc_msgSend((id)objc_msgSend(v540, "memoryAnalyticsPayload"), "setVideoStabilizationStrength:", objc_msgSend(v249, "videoStabilizationStrength"));
      if (v526)
        v559 = objc_msgSend(v565, "sourceDeviceType");
      v250 = v563;
      if (-[BWMultiStreamCameraSourceNodeConfiguration previewOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v563, "configuration"), "previewOutputEnabled"))
      {
        v251 = -[BWMultiStreamCameraSourceNode previewOutput](v563, "previewOutput");
        v250 = v563;
        objc_msgSend(v463, "setObject:forKeyedSubscript:", v251, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration videoCaptureOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "videoCaptureOutputEnabled"))
      {
        v252 = -[BWMultiStreamCameraSourceNode videoCaptureOutput](v250, "videoCaptureOutput");
        v250 = v563;
        objc_msgSend(v462, "setObject:forKeyedSubscript:", v252, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration detectedObjectsOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "detectedObjectsOutputEnabled"))
      {
        v253 = -[BWMultiStreamCameraSourceNode detectedObjectsOutput](v250, "detectedObjectsOutput");
        v250 = v563;
        objc_msgSend(v452, "setObject:forKeyedSubscript:", v253, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "stillImageOutputEnabled"))
      {
        objc_msgSend(v466, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageOutput](v250, "stillImageOutput"), v556);
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration sensorRawStillImageOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "sensorRawStillImageOutputEnabled"))
      {
        objc_msgSend(v449, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageSensorRawOutput](v250, "stillImageSensorRawOutput"), v556);
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration depthOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "depthOutputEnabled"))
      {
        v437 = -[BWMultiStreamCameraSourceNode depthOutput](v250, "depthOutput");
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration lightSourceMaskOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "lightSourceMaskOutputEnabled"))
      {
        v254 = -[BWMultiStreamCameraSourceNode lightSourceMaskOutput](v250, "lightSourceMaskOutput");
        v250 = v563;
        objc_msgSend(v454, "setObject:forKeyedSubscript:", v254, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration keypointDescriptorDataOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "keypointDescriptorDataOutputEnabled"))
      {
        v255 = -[BWMultiStreamCameraSourceNode keypointDescriptorDataOutput](v250, "keypointDescriptorDataOutput");
        v250 = v563;
        objc_msgSend(v453, "setObject:forKeyedSubscript:", v255, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration semanticMasksOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "semanticMasksOutputEnabled"))
      {
        v256 = -[BWMultiStreamCameraSourceNode semanticMasksOutput](v250, "semanticMasksOutput");
        v250 = v563;
        objc_msgSend(v456, "setObject:forKeyedSubscript:", v256, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWSecureMetadataOutputConfiguration objectDetectionEnabled](-[BWMultiStreamCameraSourceNodeConfiguration secureMetadataOutputConfiguration](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "secureMetadataOutputConfiguration"), "objectDetectionEnabled"))
      {
        v257 = -[BWMultiStreamCameraSourceNode secureDetectedObjectsOutput](v250, "secureDetectedObjectsOutput");
        v250 = v563;
        objc_msgSend(v450, "setObject:forKeyedSubscript:", v257, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWSecureMetadataOutputConfiguration eyeReliefStatusDetectionEnabled](-[BWMultiStreamCameraSourceNodeConfiguration secureMetadataOutputConfiguration](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "secureMetadataOutputConfiguration"), "eyeReliefStatusDetectionEnabled"))
      {
        v258 = -[BWMultiStreamCameraSourceNode eyeReliefStatusOutput](v250, "eyeReliefStatusOutput");
        v250 = v563;
        objc_msgSend(v451, "setObject:forKeyedSubscript:", v258, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      if (-[BWMultiStreamCameraSourceNodeConfiguration preLTMThumbnailOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v250, "configuration"), "preLTMThumbnailOutputEnabled"))
      {
        v259 = -[BWMultiStreamCameraSourceNode preLTMThumbnailOutput](v250, "preLTMThumbnailOutput");
        v250 = v563;
        objc_msgSend(v455, "setObject:forKeyedSubscript:", v259, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v559));
      }
      *(_BYTE *)(v544 + 416) |= -[BWMultiStreamCameraSourceNode hardwareDepthFilteringEnabled](v250, "hardwareDepthFilteringEnabled");
LABEL_435:
      v178 = v532 + 1;
    }
    while (v532 + 1 != v495);
    v264 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v599, v627, 16);
    v495 = v264;
    v176 = &selRef__prepareToTerminateImmediatelyDueToError_;
    if (v264)
      continue;
    break;
  }
LABEL_472:
  if (!v129 || *(_DWORD *)(v129 + 28) != 3 && !*(_BYTE *)(v129 + 346))
  {
    objc_msgSend(v122[9], "updateFormatRequirementsFromSourceNode:", v122[8], v418, v422);
    objc_msgSend(v122[10], "updateFormatRequirementsFromSourceNode:", v122[8]);
    if (v122[9])
    {
      objc_msgSend(v122[8], "updateFormatRequirementsFromSourceNode:");
      objc_msgSend(v122[10], "updateFormatRequirementsFromSourceNode:", v122[9]);
    }
    if (v122[10])
    {
      objc_msgSend(v122[9], "updateFormatRequirementsFromSourceNode:");
      objc_msgSend(v122[8], "updateFormatRequirementsFromSourceNode:", v122[10]);
    }
  }
  if (!v439)
  {
LABEL_497:
    v280 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
    goto LABEL_503;
  }
  objc_msgSend(v122[8], "setName:", CFSTR("RGB Camera"));
  v265 = -[BWMultiStreamCameraSourceNode initWithCaptureDevice:captureStream:]([BWMultiStreamCameraSourceNode alloc], "initWithCaptureDevice:captureStream:", v122[45], v439);
  if (!v265)
    goto LABEL_97;
  v266 = v265;
  -[BWNode setName:](v265, "setName:", CFSTR("Infrared Camera"));
  objc_msgSend(v122[7], "addObject:", v266);
  LODWORD(v633) = 0;
  v267 = objc_msgSend(v71, "source");
  v268 = *MEMORY[0x1E0D05A40];
  v269 = (const void *)FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType(v267, *MEMORY[0x1E0D05A40], &v633);
  if ((_DWORD)v633)
  {
    FigDebugAssert3();
    v272 = 0;
    v271 = 0;
  }
  else
  {
    v270 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v267, (void *)objc_msgSend(v71, "requiredFormat"), v268, &v633);
    v271 = (void *)v270;
    if ((_DWORD)v633 || !v270)
    {
      FigDebugAssert3();
      v272 = 0;
    }
    else
    {
      v272 = -[FigCaptureSourceConfiguration initWithSource:]([FigCaptureSourceConfiguration alloc], "initWithSource:", v269);
      -[FigCaptureSourceConfiguration setRequiredFormat:](v272, "setRequiredFormat:", v271);
      objc_msgSend(v71, "maxFrameRateClientOverride");
      -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v272, "setMaxFrameRateClientOverride:");
      objc_msgSend(v71, "requiredMinFrameRate");
      -[FigCaptureSourceConfiguration setRequiredMinFrameRate:](v272, "setRequiredMinFrameRate:");
      objc_msgSend(v71, "requiredMaxFrameRate");
      -[FigCaptureSourceConfiguration setRequiredMaxFrameRate:](v272, "setRequiredMaxFrameRate:");
      -[FigCaptureSourceConfiguration setDepthDataFormat:](v272, "setDepthDataFormat:", objc_msgSend(v71, "depthDataFormat"));
      -[FigCaptureSourceConfiguration setDepthDataDeliveryEnabled:](v272, "setDepthDataDeliveryEnabled:", objc_msgSend(v71, "depthDataDeliveryEnabled"));
    }
  }
  if (v269)
    CFRelease(v269);

  if (!v272)
    goto LABEL_97;
  v273 = -[FigCaptureSourceVideoFormat nativeDimensions](-[FigCaptureSourceConfiguration requiredFormat](v272, "requiredFormat"), "nativeDimensions");
  v274 = *(void **)(v544 + 360);
  objc_msgSend((id)objc_msgSend(v527, "depthDataSinkConfiguration"), "filteringEnabled");
  if (v547)
  {
    v275 = *(float *)(v547 + 32) > 0.0;
    v276 = *(_BYTE *)(v547 + 142) != 0;
    v277 = *(_BYTE *)(v547 + 143) != 0;
    v278 = *(_BYTE *)(v547 + 64) != 0;
    v279 = *(_QWORD *)(v547 + 352);
  }
  else
  {
    v279 = 0;
    v277 = 0;
    v275 = 0;
    v276 = 0;
    v278 = 0;
  }
  v633 = *MEMORY[0x1E0CA2E18];
  v634 = *(BOOL (**)(uint64_t, void *))(MEMORY[0x1E0CA2E18] + 16);
  v604 = csp_configureMultiStreamCameraNode(v266, v272, v274, 0, v169, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E0CA2E18],
           &v633,
           v542,
           v473,
           v534,
           v275,
           0,
           1,
           v276,
           v277,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v278,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v273,
           v279);

  if (v604)
    goto LABEL_466;
  v122 = (id *)v544;
  *(_BYTE *)(v544 + 416) |= -[BWMultiStreamCameraSourceNode hardwareDepthFilteringEnabled](v266, "hardwareDepthFilteringEnabled");
  v585.receiver = (id)v544;
  v585.super_class = (Class)FigCaptureCameraSourcePipeline;
  if ((objc_msgSendSuper2(&v585, sel_addNode_error_, v266, &v603) & 1) == 0)
    goto LABEL_466;
  *(_QWORD *)(v544 + 88) = v266;
  if (-[BWMultiStreamCameraSourceNodeConfiguration stillImageOutputEnabled](-[BWMultiStreamCameraSourceNode configuration](v266, "configuration"), "stillImageOutputEnabled"))
  {
    objc_msgSend(v466, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageOutput](v266, "stillImageOutput"), v268);
  }
  if (v547 && *(_BYTE *)(v547 + 292))
  {
    v437 = -[BWMultiStreamCameraSourceNode depthOutput](v266, "depthOutput");
    goto LABEL_497;
  }
  v604 = -[FigCaptureCameraSourcePipeline _addDepthFromInfraredSynchronizer:previewOutputsBySourceDeviceType:pipelineConfiguration:graph:sourceDeviceType:]((id *)v544, v462, v463, v547, v125, objc_msgSend(v71, "sourceDeviceType"));
  v280 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
  if (v604)
    goto LABEL_466;
LABEL_503:
  v281 = objc_msgSend(v71, "source", v418);
  v564 = v122[7];
  v282 = *(id *)((char *)v122 + v280[393]);
  v628[0] = 0;
  v283 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
  if (!v283)
  {
    v284 = -12782;
    *(_DWORD *)type = -12782;
LABEL_546:
    v422 = v445;
    LODWORD(v419) = v284;
LABEL_547:
    FigDebugAssert3();
    goto LABEL_548;
  }
  objd = v282;
  v284 = v283(v281, CFSTR("AttributesDictionary"), v425, v628);
  *(_DWORD *)type = v284;
  if (v284)
    goto LABEL_546;
  v566 = (void *)objc_msgSend(v628[0], "objectForKeyedSubscript:", 0x1E4952A38);
  if (!v566 || (v546 = (void *)objc_msgSend(v628[0], "objectForKeyedSubscript:", 0x1E4952A98)) == 0)
  {
LABEL_548:

    v311 = v544;
    goto LABEL_549;
  }
  v560 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v564, "count"));
  v572 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v564, "count"));
  v629 = 0u;
  v630 = 0u;
  v631 = 0u;
  v632 = 0u;
  v285 = objc_msgSend(v564, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
  if (v285)
  {
    v286 = v285;
    v287 = *(_QWORD *)v630;
    while (2)
    {
      for (ii = 0; ii != v286; ++ii)
      {
        if (*(_QWORD *)v630 != v287)
          objc_enumerationMutation(v564);
        v289 = *(void **)(*((_QWORD *)&v629 + 1) + 8 * ii);
        v290 = objc_msgSend(v289, "portType");
        if (objc_msgSend((id)objc_msgSend(v289, "configuration"), "geometricDistortionCorrectionSupported"))
        {
          v291 = objc_msgSend((id)objc_msgSend(v566, "objectForKeyedSubscript:", v290), "objectForKeyedSubscript:", 0x1E4952A78);
          if (!v291)
            goto LABEL_548;
          v292 = (void *)v291;
          v293 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v289, "geometricDistortionCorrectionStrengthOnStreamingOutputs");
          objc_msgSend(v560, "setObject:forKeyedSubscript:", objc_msgSend(v292, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v293, "numberWithLong:", llroundf(v294 * 100.0)), "stringValue")), v290);
        }
        v295 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v281, v548, v290, type);
        if (*(_DWORD *)type)
        {
          v422 = v445;
          LODWORD(v419) = *(_DWORD *)type;
          goto LABEL_547;
        }
        v296 = v295;
        if (!v295)
        {
          v422 = v445;
          LODWORD(v419) = 0;
          FigDebugAssert3();
          *(_DWORD *)type = -12780;
          goto LABEL_548;
        }
        v297 = objc_msgSend(v295, "sensorCropDimensions");
        if (!v297)
          v297 = objc_msgSend(v296, "sensorDimensions");
        v298 = objc_msgSend(v296, "horizontalSensorBinningFactor");
        objc_msgSend((id)objc_msgSend(v289, "configuration"), "sensorOverscan");
        v300 = v299;
        objc_msgSend((id)objc_msgSend(v289, "configuration"), "visOverscan");
        v302 = v301;
        v303 = (void *)objc_msgSend(v289, "configuration");
        if (v300 <= v302)
          objc_msgSend(v303, "visOverscan");
        else
          objc_msgSend(v303, "sensorOverscan");
        v305 = v304;
        v306 = (float)(v298 * v297) / (float)(v305 + 1.0);
        objc_msgSend((id)objc_msgSend(v289, "configuration"), "additionalVISOverscanReservedInZoom");
        *(float *)&v308 = v306 / (float)(v307 + 1.0);
        objc_msgSend(v572, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v308), v290);

      }
      v286 = objc_msgSend(v564, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
      if (v286)
        continue;
      break;
    }
  }
  v309 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v546);
  v310 = objd;
  v311 = v544;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(objd, "captureStreamsByFocalLength"), "count") >= 2)
  {
    v312 = 1;
    do
    {
      v313 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v310, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v312), "portType");
      v314 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v310, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v312 - 1), "portType");
      v315 = (void *)objc_msgSend(v566, "objectForKeyedSubscript:", v313);
      v316 = (void *)objc_msgSend(v566, "objectForKeyedSubscript:", v314);
      LODWORD(v315) = objc_msgSend((id)objc_msgSend(v315, "objectForKeyedSubscript:", 0x1E4952A58), "intValue");
      v317 = (float)(int)objc_msgSend((id)objc_msgSend(v316, "objectForKeyedSubscript:", 0x1E4952A58), "intValue");
      objc_msgSend((id)objc_msgSend(v572, "objectForKeyedSubscript:", v314), "floatValue");
      v319 = v317 / v318;
      objc_msgSend((id)objc_msgSend(v572, "objectForKeyedSubscript:", v313), "floatValue");
      v321 = (float)(int)v315 / v320;
      objc_msgSend((id)objc_msgSend(v560, "objectForKeyedSubscript:", v314), "floatValue");
      if (v322 == 0.0)
        v323 = 1.0;
      else
        v323 = v322;
      objc_msgSend((id)objc_msgSend(v560, "objectForKeyedSubscript:", v313), "floatValue");
      if (v324 == 0.0)
        v324 = 1.0;
      v325 = v319 * v323;
      v326 = v321 * v324;
      objc_msgSend((id)objc_msgSend(v546, "objectForKeyedSubscript:", v313), "floatValue");
      v328 = v327;
      objc_msgSend((id)objc_msgSend(v546, "objectForKeyedSubscript:", v314), "floatValue");
      v330 = (float)(v326 / v325) * (float)(v328 / v329);
      v310 = objd;
      objc_msgSend((id)objc_msgSend(v309, "objectForKeyedSubscript:", v314), "floatValue");
      v332 = v331 * v330;
      if ((objc_msgSend(objd, "overCaptureEnabled") & 1) == 0
        && (int)objc_msgSend(objd, "maxOverscanVideoStabilizationMethod") <= 0)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(objd, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v312 - 1), "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
        v335 = v334;
        if (BWWiderNonDisruptiveSwitchingFormatZoomFactorAndNarrowerBaseZoomFactorShouldBeCombined(v334, v332))
          v332 = v335;
      }
      *(float *)&v333 = v332;
      objc_msgSend(v309, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v333), v313);
      ++v312;
    }
    while (objc_msgSend((id)objc_msgSend(objd, "captureStreamsByFocalLength"), "count") > v312);
  }

  if (v309)
  {
    objc_msgSend(*(id *)(v544 + 360), "setBaseZoomFactorsByPortType:", v309);
    v584 = 0u;
    v583 = 0u;
    v582 = 0u;
    v581 = 0u;
    v336 = *(void **)(v544 + 56);
    v337 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v581, v620, 16);
    if (v337)
    {
      v338 = v337;
      v339 = *(_QWORD *)v582;
      do
      {
        for (jj = 0; jj != v338; ++jj)
        {
          if (*(_QWORD *)v582 != v339)
            objc_enumerationMutation(v336);
          objc_msgSend(*(id *)(*((_QWORD *)&v581 + 1) + 8 * jj), "updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping");
        }
        v338 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v581, v620, 16);
      }
      while (v338);
    }
  }
LABEL_549:
  if (v547)
  {
    v341 = *(void **)(v311 + 56);
    v342 = v540;
    if (*(_BYTE *)(v547 + 24))
    {
      v343 = objc_msgSend((id)objc_msgSend(v548, "actionCameraCompanionFormat"), "sensorDimensions");
      v344 = (void *)objc_msgSend(v548, "actionCameraCompanionFormat");
      goto LABEL_585;
    }
  }
  else
  {
    v341 = *(void **)(v311 + 56);
    v342 = v540;
  }
  v343 = objc_msgSend(v548, "sensorDimensions", v419, v422);
  v344 = v548;
LABEL_585:
  v346 = objc_msgSend(v344, "sensorCropDimensions", v419);
  v347 = FigCaptureVideoDimensionsAreValid(v346);
  v349 = *MEMORY[0x1E0C9D820];
  v348 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v629 = 0u;
  v630 = 0u;
  v631 = 0u;
  v632 = 0u;
  v350 = objc_msgSend(v341, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
  if (v350)
  {
    v351 = v350;
    v352 = HIDWORD(v346);
    if (v347)
    {
      v353 = v346;
    }
    else
    {
      LODWORD(v352) = HIDWORD(v343);
      v353 = v343;
    }
    v354 = *(_QWORD *)v630;
    v355 = (double)v353;
    v356 = (double)(int)v352;
    do
    {
      for (kk = 0; kk != v351; ++kk)
      {
        if (*(_QWORD *)v630 != v354)
          objc_enumerationMutation(v341);
        v358 = *(void **)(*((_QWORD *)&v629 + 1) + 8 * kk);
        objc_msgSend((id)objc_msgSend(v358, "configuration"), "visOverscan");
        v360 = v359;
        v362 = v361;
        objc_msgSend((id)objc_msgSend(v358, "configuration"), "sensorOverscan");
        v365 = v360 > v363;
        if (v362 > v364)
          v365 = 1;
        if (v365)
        {
          v363 = v360;
          v364 = v362;
        }
        v366 = v355 / (v363 + 1.0);
        v367 = v356 / (v364 + 1.0);
        if (v349 <= v366)
          v349 = v366;
        if (v348 <= v367)
          v348 = v367;
      }
      v351 = objc_msgSend(v341, "countByEnumeratingWithState:objects:count:", &v629, &v633, 16);
    }
    while (v351);
  }
  v368 = (int)v349;
  v369 = (int)v348;
  v370 = objc_msgSend(v548, "sourceCropAspectRatio");
  if ((int)v370 >= 1 && SHIDWORD(v370) >= 1)
  {
    v371 = FigCaptureFitAspectInsideDimensions(v368 | (v369 << 32), 0x200000002, (float)(int)v370 / (float)SHIDWORD(v370));
    v369 = HIDWORD(v371);
    LODWORD(v368) = v371;
  }
  v372 = 0.0;
  if ((int)v343 <= (int)v368 && SHIDWORD(v343) <= (int)v369)
  {
    v369 = HIDWORD(v343);
    LODWORD(v368) = v343;
    v374 = 0.0;
  }
  else
  {
    v374 = (double)(((int)v343 - (int)v368) / 2);
    v375 = HIDWORD(v343) - v369;
    if (SHIDWORD(v343) < (int)v369)
      ++v375;
    v372 = (double)(v375 >> 1);
  }
  v376 = v544;
  objc_msgSend(*(id *)(v544 + 360), "setRegionOfInterestWithoutOverscan:", v374, v372, (double)(int)v368, (double)(int)v369);
  v377 = v547;
  v378 = v463;
  v379 = v462;
  if (v547)
  {
    objc_msgSend(*(id *)(v544 + 360), "setLumaHistogramsEnabled:", *(unsigned __int8 *)(v547 + 293));
    if (*(_BYTE *)(v547 + 145) || *(_BYTE *)(v547 + 154))
    {
      objc_msgSend(*(id *)(v544 + 360), "setSensorRawPoolEnabled:", 1);
      v580 = 0u;
      v579 = 0u;
      v578 = 0u;
      v577 = 0u;
      v381 = *(void **)(v544 + 56);
      v382 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v577, v619, 16);
      if (v382)
      {
        v383 = v382;
        v384 = 0;
        v385 = 0;
        v386 = *(_QWORD *)v578;
        do
        {
          for (mm = 0; mm != v383; ++mm)
          {
            if (*(_QWORD *)v578 != v386)
              objc_enumerationMutation(v381);
            v388 = *(void **)(*((_QWORD *)&v577 + 1) + 8 * mm);
            v389 = FigCaptureVideoDimensionsAreValid(v384 | (v385 << 32));
            v390 = objc_msgSend(v388, "ultraHighResSensorRawStillImageOutputDimensions");
            v391 = v390;
            v392 = HIDWORD(v390);
            if (v389)
            {
              if (FigCaptureVideoDimensionsAreValid(v390))
              {
                v393 = FigCaptureVideoDimensionsAreEqual(v384 | (v385 << 32), v391);
                if ((int)v384 <= (int)v391)
                  v394 = v391;
                else
                  v394 = v384;
                if ((int)v385 <= (int)v392)
                  v395 = v392;
                else
                  v395 = v385;
                if (v393)
                {
                  v385 = v385;
                }
                else
                {
                  v384 = v394;
                  v385 = v395;
                }
              }
            }
            else
            {
              v384 = v390;
              v385 = HIDWORD(v390);
            }
          }
          v383 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v577, v619, 16);
        }
        while (v383);
      }
      else
      {
        v384 = 0;
        v385 = 0;
      }
      v376 = v544;
      objc_msgSend(*(id *)(v544 + 360), "setUltraHighResSensorRawPoolDimensions:", v384 | (v385 << 32));
      v342 = v540;
      v377 = v547;
      v378 = v463;
      v379 = v462;
    }
  }
  else
  {
    objc_msgSend(*(id *)(v544 + 360), "setLumaHistogramsEnabled:", 0);
  }
  -[FigCaptureCameraSourcePipeline _insertPreLTMThumbnailOutputsBySourceDeviceType:previewOutputsBySourceDeviceType:videoCaptureOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v376, v455, v378, v379, v380, v342);
  v604 = 0;
  v604 = -[FigCaptureCameraSourcePipeline _buildSemanticMasksOutputNetwork:pipelineConfiguration:graph:](v376, v456, v377, v342);
  if (v604)
    goto LABEL_466;
  v604 = -[FigCaptureCameraSourcePipeline _buildVideoCaptureOutputNetwork:previewOutputsBySourceDeviceType:stillImageOutputsByPortType:lightSourceMaskOutputsBySourceDeviceType:keypointDescriptorDataOutputsBySourceDeviceType:pipelineConfiguration:graph:videoCaptureDimensions:numberOfSecondaryFramesToSkip:](v376, v379, v378, v466, v454, v453, v377, v342, v420, v428);
  if (v604)
    goto LABEL_466;
  v604 = -[FigCaptureCameraSourcePipeline _buildPreviewOutputNetwork:videoCaptureOutputsBySourceDeviceType:pipelineConfiguration:graph:numberOfSecondaryFramesToSkip:](v376, v378, v396, v377, v342, v428);
  if (v604)
    goto LABEL_466;
  v604 = -[FigCaptureCameraSourcePipeline _buildDetectedObjectsOutputNetwork:pipelineConfiguration:graph:](v376, v452, v377, v342);
  if (v604)
    goto LABEL_466;
  if (v498)
  {
    if (v377)
      v397 = *(void **)(v377 + 240);
    else
      v397 = 0;
    -[FigCaptureCameraSourcePipeline _updateNumberOfFaceTrackingConnectionConfigurations:]((_QWORD *)v376, v397);
  }
  *(_QWORD *)(v376 + 304) = objc_msgSend(v450, "copy");
  *(_QWORD *)(v376 + 312) = objc_msgSend(v451, "copy");
  *(_QWORD *)(v376 + 320) = objc_msgSend(v436, "copy");
  v604 = -[FigCaptureCameraSourcePipeline _buildPointCloudOutputNetworkWithPipelineConfiguration:graph:]((id *)v376, v377, v342);
  if (v604)
    goto LABEL_466;
  *(_QWORD *)(v376 + 336) = v437;
  objc_msgSend(*(id *)(v376 + 64), "setRenderDelegate:", a4);
  v398 = objc_msgSend((id)objc_msgSend(*(id *)(v376 + 64), "configuration"), "videoCaptureOutputEnabled");
  v399 = *(void **)(v376 + 64);
  if (v398)
  {
    v400 = (void *)objc_msgSend(v399, "videoCaptureOutput");
    goto LABEL_662;
  }
  if (objc_msgSend((id)objc_msgSend(v399, "configuration"), "previewOutputEnabled"))
  {
    v400 = (void *)objc_msgSend(*(id *)(v376 + 64), "previewOutput");
    goto LABEL_662;
  }
  v401 = objc_msgSend(v466, "count");
  v402 = *(void **)(v376 + 64);
  if (v401)
  {
    v400 = (void *)objc_msgSend(v402, "stillImageOutput");
    goto LABEL_662;
  }
  v403 = objc_msgSend((id)objc_msgSend(v402, "configuration"), "detectedObjectsOutputEnabled");
  v404 = *(void **)(v376 + 64);
  if (v403)
  {
    v400 = (void *)objc_msgSend(v404, "detectedObjectsOutput");
    goto LABEL_662;
  }
  v405 = objc_msgSend((id)objc_msgSend(v404, "configuration"), "pointCloudOutputEnabled");
  v406 = *(void **)(v376 + 64);
  if (v405)
  {
    v400 = (void *)objc_msgSend(v406, "pointCloudOutput");
    goto LABEL_662;
  }
  v407 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v406, "configuration"), "secureMetadataOutputConfiguration"), "objectDetectionEnabled");
  v408 = *(void **)(v376 + 64);
  if (v407)
  {
    v400 = (void *)objc_msgSend(v408, "secureDetectedObjectsOutput");
    goto LABEL_662;
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v408, "configuration"), "secureMetadataOutputConfiguration"), "eyeReliefStatusDetectionEnabled"))
  {
    v400 = (void *)objc_msgSend(*(id *)(v376 + 64), "eyeReliefStatusOutput");
LABEL_662:
    *(_QWORD *)(v376 + 104) = v400;
  }
  *(_QWORD *)(v376 + 160) = v466;
  *(_QWORD *)(v376 + 168) = v449;
  *(_DWORD *)(v376 + 412) = v542;
  if (v377)
  {
    *(_BYTE *)(v376 + 473) = *(_BYTE *)(v377 + 344);
    *(_BYTE *)(v376 + 474) = *(_BYTE *)(v377 + 345);
    v409 = v474 ^ 1;
    if (!*(_BYTE *)(v377 + 265))
      v409 = 1;
    if (((v434 | v409) & 1) == 0)
    {
      v576 = 0u;
      v575 = 0u;
      v573 = 0u;
      v574 = 0u;
      v410 = *(void **)(v376 + 56);
      v411 = objc_msgSend(v410, "countByEnumeratingWithState:objects:count:", &v573, v618, 16);
      if (v411)
      {
        v412 = v411;
        v413 = *(_QWORD *)v574;
        v414 = *MEMORY[0x1E0D05A20];
        do
        {
          for (nn = 0; nn != v412; ++nn)
          {
            if (*(_QWORD *)v574 != v413)
              objc_enumerationMutation(v410);
            v416 = *(void **)(*((_QWORD *)&v573 + 1) + 8 * nn);
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v416, "captureStream"), "portType"), "isEqualToString:", v414))objc_msgSend(v342, "enableDeferredStartForSourceNode:mustStartAfterNonDeferred:", v416, 1);
          }
          v412 = objc_msgSend(v410, "countByEnumeratingWithState:objects:count:", &v573, v618, 16);
        }
        while (v412);
      }
    }
  }
  else
  {
    *(_BYTE *)(v376 + 473) = 0;
    *(_BYTE *)(v376 + 474) = 0;
  }
LABEL_467:
  result = v604;
  if (!v604)
  {
    if (v603)
      return objc_msgSend(v603, "code");
  }
  return result;
}

- (void)dealloc
{
  OpaqueFigCaptureSource *captureSource;
  objc_super v4;

  captureSource = self->_captureSource;
  if (captureSource)
    CFRelease(captureSource);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureCameraSourcePipeline;
  -[FigCaptureSourcePipeline dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> captureDevice:%@ captureSource:%@"), NSStringFromClass(v4), self, self->_captureDevice, self->_captureSource);
}

- (uint64_t)videoOutputColorInfo
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "colorInfoForOutput:", objc_msgSend(*(id *)(result + 64), "videoCaptureOutput"));
  return result;
}

- (uint64_t)secureDetectedObjectsOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 304), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)visionDataOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 328), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)depthOutput
{
  if (result)
    return *(_QWORD *)(result + 336);
  return result;
}

- (uint64_t)semanticMasksOutputsBySourceDeviceType:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 352), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return result;
}

- (uint64_t)preferredPreviewDimensions
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "configuration"), "preferredPreviewDimensions");
  return result;
}

- (_QWORD)ultraHighResolutionSensorRawDimensionsByPortType
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)v1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v8, "ultraHighResSensorRawStillImageOutputDimensions")))
            objc_msgSend(v2, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(v8, "ultraHighResSensorRawStillImageOutputDimensions")), objc_msgSend(v8, "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (_QWORD)zoomBasedQSubSensorRawDimensionsByPortType
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)v1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v8, "zoomBasedQSubSensorRawStillImageOutputDimensions")))
            objc_msgSend(v2, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(v8, "zoomBasedQSubSensorRawStillImageOutputDimensions")), objc_msgSend(v8, "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)firmwareStillImageDimensionsAfterOverscanCropping
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "firmwareStillImageDimensionsAfterOverscanCropping");
  return result;
}

- (uint64_t)stillImageOutputVideoFormat
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "stillImageOutput"), "videoFormat");
  return result;
}

- (uint64_t)nextPointCloudOutput
{
  void *v1;

  if (result)
  {
    v1 = *(void **)(result + 280);
    ++*(_DWORD *)(result + 288);
    return objc_msgSend(v1, "objectAtIndexedSubscript:");
  }
  return result;
}

- (uint64_t)setSmartStyle:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(result + 456), "allValues", 0);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setSmartStyle:", a2);
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)getSmartStyle
{
  if (result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 456), "allValues"), "firstObject"), "smartStyle");
  return result;
}

- (double)trueVideoCaptureAdditionalZoomFactor
{
  if (a1)
    return dbl_1A32B1210[*(_DWORD *)(a1 + 48) == 2];
  else
    return 0.0;
}

- (uint64_t)semanticStyleSceneObserver
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 456), "allValues"), "firstObject");
  return result;
}

- (uint64_t)logCameraStreamingInformationToAggd:(uint64_t)a3 applicationID:
{
  uint64_t v5;
  BWAggdDataReporter *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    if (a2 >= 1)
      -[BWAggdDataReporter reportCameraStreamingTimeInMilliseconds:deviceType:devicePosition:](v6, "reportCameraStreamingTimeInMilliseconds:deviceType:devicePosition:", llroundf((float)(FigHostTimeToNanoseconds() / 1000) / 1000.0), *(unsigned int *)(v5 + 44), *(unsigned int *)(v5 + 48));
    if (*(_DWORD *)(v5 + 44) == 6)
    {
      v7 = *(void **)(v5 + 88);
      v8 = objc_msgSend(v7, "infraredProjectorUptimeInUsForLowPowerSparse");
      if (v8 >= 0x3E8)
        -[BWAggdDataReporter reportPearlInfraredProjectorUptime:current:pattern:applicationID:](v6, "reportPearlInfraredProjectorUptime:current:pattern:applicationID:", v8 / 0x3E8, 1, 0, a3);
      v9 = objc_msgSend(v7, "infraredProjectorUptimeInUsForHighPowerSparse");
      if (v9 >= 0x3E8)
        -[BWAggdDataReporter reportPearlInfraredProjectorUptime:current:pattern:applicationID:](v6, "reportPearlInfraredProjectorUptime:current:pattern:applicationID:", v9 / 0x3E8, 2, 0, a3);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = *(void **)(v5 + 56);
    result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          v15 = objc_msgSend((id)objc_msgSend(v14, "captureStream"), "autoFocusPositionSensorMode");
          if ((_DWORD)v15)
            -[BWAggdDataReporter reportAutoFocusPositionSensorMode:portType:](v6, "reportAutoFocusPositionSensorMode:portType:", v15, objc_msgSend(v14, "portType"));
          ++v13;
        }
        while (v11 != v13);
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)startIncrementalPrefetchingOfSourcePoolsIfNecessary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = *(void **)(result + 56);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "startIncrementalPrefetchingOfSourcePoolsIfNecessary");
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setCinematicVideoFocusDetectionsProvider:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 96), "setCinematicVideoFocusDetectionsProvider:", a2);
  return result;
}

- (uint64_t)prepareForStillImageCaptureWithStillImageOutputRetainedBufferCountOverride:(unsigned int)a3 infraRedStillImageOutputRetainedBufferCountOverride:(uint64_t)a4 clientBracketCount:(uint64_t)a5 enableSushiRawAttachmentOption:
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = *(void **)(a1 + 56);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v13 = *MEMORY[0x1E0D05A40];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "portType"), "isEqualToString:", v13))
            v16 = a3;
          else
            v16 = a2;
          v17 = objc_msgSend(v15, "prepareForStillImageCaptureWithFirmwareStillImageOutputRetainedBufferCountOverride:clientBracketCount:enableSushiRawAttachmentOption:", v16, a4, a5);
          if ((_DWORD)v17)
          {
            v18 = v17;
            FigDebugAssert3();
            return v18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
  }
  return 0;
}

- (uint64_t)newConfigurationRequiresStreamRestart:(_BYTE *)a3 tnrConfigurationChanged:(_QWORD *)a4 newFormatIndexByPortTypeOut:
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, const __CFString *, _QWORD, id *);
  int v11;
  char v12;
  char v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  int shouldCaptureStillsFromVideoStream;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  int v29;
  int v30;
  id *v31;
  void *v32;
  int v33;
  float v34;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int shouldUseFullBinSIFRCompanionIndex;
  _BOOL4 v53;
  _BOOL4 v54;
  char v55;
  unsigned __int8 v56;
  float v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  int v62;
  float v63;
  float v64;
  float v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  void *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v80;
  void *v81;
  int v82;
  char v83;
  id obj;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int shouldUseActionCameraCompanionIndex;
  int shouldUseDepthCompanionIndex;
  char v93;
  int shouldUseFESCompanionIndex;
  void *v96;
  int v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  id v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
  {
    v6 = *(void **)(a2 + 184);
    v7 = *(void **)(a2 + 208);
    v96 = *(void **)(a2 + 216);
    v87 = *(_DWORD *)(a2 + 8);
    v8 = *(_BYTE *)(a2 + 143) != 0;
  }
  else
  {
    v87 = 0;
    v96 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a1, "sourceID"), "isEqual:", objc_msgSend(v6, "sourceID"))
    || (int)FigCapturePlatformIdentifier() < 4
    || objc_msgSend(v6, "sourceDeviceType") == 10 && (int)FigCapturePlatformIdentifier() < 10)
  {
    return 1;
  }
  v103 = 0;
  v9 = objc_msgSend(v6, "source");
  v10 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (v10)
  {
    v102 = v10(v9, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v103);
    if (v102)
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("DepthDataDeliveryConfigurations")), "objectForKeyedSubscript:", CFSTR("FastModeSwitchingSupported")), "BOOLValue");

    }
  }
  else
  {
    v11 = 0;
    v102 = -12782;
  }
  if ((objc_msgSend(a1[45], "depthDataDeliveryEnabled") & 1) != 0)
  {
    if (!v11)
      return 1;
  }
  else if (((objc_msgSend(v6, "depthDataDeliveryEnabled") ^ 1 | v11) & 1) == 0)
  {
    return 1;
  }
  v93 = objc_msgSend(v6, "bravoShiftMitigationEnabled");
  v12 = objc_msgSend(v6, "cinematicFramingEnabled");
  v13 = objc_msgSend(v6, "deskCamEnabled");
  v14 = 1;
  if ((v12 & 1) == 0 && (v13 & 1) == 0)
    v14 = objc_msgSend(v6, "manualCinematicFramingEnabled");
  v15 = (void *)objc_msgSend(v6, "requiredFormat");
  if (a2)
  {
    v16 = *(void **)(a2 + 200);
    v17 = *(_QWORD *)(a2 + 224);
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v18 = csp_videoCaptureDimensionsFromConnectionConfigurations(v15, v96, (uint64_t)v7, v16, v17, v14);
  shouldUseFESCompanionIndex = csp_shouldUseFESCompanionIndex(v6, v7, v18);
  shouldUseDepthCompanionIndex = csp_shouldUseDepthCompanionIndex(v6, v7, v18);
  if (a2)
    v19 = *(_BYTE *)(a2 + 24) != 0;
  else
    v19 = 0;
  shouldUseActionCameraCompanionIndex = csp_shouldUseActionCameraCompanionIndex(v6, (uint64_t)v7, v19);
  shouldCaptureStillsFromVideoStream = csp_shouldCaptureStillsFromVideoStream(v6, (void *)objc_msgSend(v6, "requiredFormat"), shouldUseFESCompanionIndex, v96 != 0);
  if (v96)
    v21 = shouldCaptureStillsFromVideoStream;
  else
    v21 = 1;
  if ((v8 | v21 ^ 1) == 1)
  {
    if (v8)
      v22 = 4;
    else
      v22 = 1;
    v85 = v22;
    if (a2)
      v97 = *(_BYTE *)(a2 + 144) != 0;
    else
      v97 = 0;
  }
  else
  {
    v97 = 0;
    v85 = 0;
  }
  v23 = objc_msgSend((id)objc_msgSend(v96, "irisSinkConfiguration"), "bravoConstituentPhotoDeliveryEnabled");
  if (v23 != objc_msgSend(a1[45], "bravoConstituentPhotoDeliveryEnabled"))
    return 1;
  v24 = objc_msgSend((id)objc_msgSend(a1[45], "captureStreams"), "count");
  v25 = objc_msgSend(a1[45], "isBravoVariant");
  v78 = a4;
  if (a2)
  {
    v26 = *(_BYTE *)(a2 + 155) != 0;
    v27 = *(_BYTE *)(a2 + 156) != 0;
  }
  else
  {
    v26 = 0;
    v27 = 0;
  }
  v28 = 1;
  if ((v25 & (v26 || v8 && v27)) != 0)
    v29 = 2;
  else
    v29 = 1;
  if (v23)
    v30 = v24;
  else
    v30 = v29;
  v31 = a1;
  if (objc_msgSend(a1[45], "numberOfActiveTimeMachines") == v30)
  {
    v32 = a2 ? *(void **)(a2 + 216) : 0;
    v33 = objc_msgSend((id)objc_msgSend(v32, "irisSinkConfiguration"), "ultraHighResolutionZeroShutterLagSupportEnabled");
    if (v33 == objc_msgSend(a1[45], "ultraHighResolutionZeroShutterLagSupportEnabled"))
    {
      if (a2)
        v86 = *(_BYTE *)(a2 + 144) != 0;
      else
        v86 = 0;
      if (objc_msgSend((id)objc_msgSend(v6, "requiredFormat"), "isVideoHDRFusionSupported"))
        BWColorSpaceIsHDR(objc_msgSend(v6, "colorSpace"));
      if (a2)
        v34 = *(float *)(a2 + 148);
      else
        v34 = 0.0;
      if ((objc_msgSend(a1[45], "overCaptureEnabled") & 1) != 0)
      {
        if (v34 == 0.0 && (!a2 || !*(_BYTE *)(a2 + 152)))
          return v28;
      }
      else
      {
        v35 = objc_msgSend(a1[45], "allocateResourcesCompatibleWithOverCapture");
        if (v34 == 0.0)
        {
          if (a2)
          {
            if (((v35 ^ (*(_BYTE *)(a2 + 152) != 0)) & 1) != 0)
              return v28;
          }
          else if ((v35 & 1) != 0)
          {
            return v28;
          }
        }
        else if ((v35 & 1) == 0)
        {
          return v28;
        }
      }
      if ((objc_msgSend(a1[45], "digitalFlashEnabled") & 1) != 0)
        v36 = 1;
      else
        v36 = objc_msgSend(a1[45], "digitalFlashMetadataEnabled");
      if (a2 && *(_BYTE *)(a2 + 153))
      {
        if ((v36 & 1) == 0)
          return v28;
      }
      else if (v36 != objc_msgSend((id)objc_msgSend(v96, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
      {
        return v28;
      }
      v37 = objc_msgSend((id)objc_msgSend(a1[8], "configuration"), "faceTrackingEnabled");
      if (a2)
      {
        if (((v37 ^ (*(_BYTE *)(a2 + 118) != 0)) & 1) != 0)
          return v28;
        v38 = objc_msgSend(a1[45], "timeOfFlightProjectorMode");
        v39 = *(void **)(a2 + 256);
      }
      else
      {
        if ((v37 & 1) != 0)
          return v28;
        v31 = a1;
        v38 = objc_msgSend(a1[45], "timeOfFlightProjectorMode");
        v39 = 0;
      }
      if (v38 == csp_projectorModeFromPointCloudDataConnectionConfigurations(v39))
      {
        v40 = objc_msgSend(v31[45], "temporalNoiseReductionBand0Disabled");
        v41 = objc_msgSend((id)objc_msgSend(v6, "requiredFormat"), "temporalNoiseReductionBand0Disabled");
        v42 = objc_msgSend(v31[45], "temporalNoiseReductionRawEnabled");
        v43 = v42 ^ objc_msgSend((id)objc_msgSend(v6, "requiredFormat"), "temporalNoiseReductionRawEnabled");
        if (a2)
        {
          v90 = *(_BYTE *)(a2 + 146) != 0;
          if (*(_BYTE *)(a2 + 146))
            v44 = v21;
          else
            v44 = 0;
          if (v44 == 1)
            v90 = *(_BYTE *)(a2 + 154) != 0;
        }
        else
        {
          v90 = 0;
        }
        v45 = v43 | v40 ^ v41;
        v81 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        obj = v31[7];
        v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
        if (v89)
        {
          v82 = v45;
          v88 = *(_QWORD *)v99;
          v80 = *MEMORY[0x1E0D07EE0];
          v46 = v97;
          if (v85)
            v46 = 1;
          v83 = v46;
LABEL_85:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v99 != v88)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v47);
            v49 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(objc_msgSend(v6, "source"), (void *)objc_msgSend(v6, "requiredFormat"), objc_msgSend(v48, "portType"), &v102);
            if (v102)
              break;
            v50 = (void *)v49;
            if (!v49)
              break;
            v51 = (void *)objc_msgSend((id)objc_msgSend(v48, "captureStream"), "supportedFormats");
            if (a2)
            {
              shouldUseFullBinSIFRCompanionIndex = csp_shouldUseFullBinSIFRCompanionIndex(v50, v51, v96, v97, *(unsigned __int8 *)(a2 + 154));
              v53 = *(_BYTE *)(a2 + 159) != 0;
              v54 = *(_BYTE *)(a2 + 346) != 0;
            }
            else
            {
              shouldUseFullBinSIFRCompanionIndex = csp_shouldUseFullBinSIFRCompanionIndex(v50, v51, v96, v97, 0);
              v53 = 0;
              v54 = 0;
            }
            v55 = objc_msgSend(v6, "sensorHDREnabled");
            v56 = objc_msgSend(v6, "highlightRecoveryEnabled");
            objc_msgSend(v6, "geometricDistortionCorrectionEnabled");
            if (a2)
              v57 = *(float *)(a2 + 32);
            else
              v57 = 0.0;
            v58 = csp_formatIndex(v50, shouldUseFESCompanionIndex, shouldUseDepthCompanionIndex, 0, shouldUseActionCameraCompanionIndex, shouldUseFullBinSIFRCompanionIndex, v53, v54, v93, v55, v56, v57 > 0.0, 0, 0, 0, 0, 0, 0);
            if (objc_msgSend((id)objc_msgSend(v48, "captureStream"), "isNondisruptiveFastSwitchingSupported")&& objc_msgSend(v50, "isFastSwitchingConfigurationRequired")&& objc_msgSend((id)objc_msgSend(v48, "configuration"), "fastSwitchingNondisruptiveFormatIndices"))
            {
              if ((_DWORD)v58 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "formatIndex"))
              {
                v59 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "captureStream"), "supportedFormats"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(v48, "configuration"), "formatIndex"));
                v60 = (void *)objc_msgSend(v59, "objectForKeyedSubscript:", v80);
                if (!objc_msgSend(v60, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58)))return 1;
                v61 = csp_formatUsesFES(v59);
                if (v61 != csp_formatUsesFES((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "captureStream"), "supportedFormats"), "objectAtIndexedSubscript:", (int)v58)))return 1;
                v62 = v82;
                if ((v82 & 1) == 0)
                  v62 = 1;
                v82 = v62;
                objc_msgSend(v81, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58), objc_msgSend(v48, "portType"));
              }
            }
            else
            {
              objc_msgSend((id)objc_msgSend(a1[8], "captureStream"), "maximumSupportedFrameRate");
              v64 = v63;
              objc_msgSend(v6, "maxFrameRateClientOverride");
              if (v64 != v65
                || (_DWORD)v58 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "formatIndex"))
              {
                return 1;
              }
            }

            if (v87 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "motionAttachmentsSource")
              || v90 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "sensorRawStillImageOutputEnabled"))
            {
              return 1;
            }
            if (objc_msgSend((id)objc_msgSend(v48, "configuration"), "stillImageOutputEnabled")
              && (objc_msgSend((id)objc_msgSend(v48, "configuration"), "usesFirmwareStillImageOutput") & 1) != 0
              || objc_msgSend((id)objc_msgSend(v48, "configuration"), "forceFirmwareStillImageOutputEnabled"))
            {
              if (v85 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "firmwareTimeMachineBufferCapacity"))return 1;
              v28 = 1;
              if (v97 != objc_msgSend((id)objc_msgSend(v48, "configuration"), "firmwareTimeMachineSIFREnabled"))return v28;
            }
            else
            {
              if ((v83 & 1) != 0)
                return 1;
              LODWORD(v28) = 0;
            }
            if ((objc_msgSend((id)objc_msgSend(v48, "configuration"), "videoHDRFusionEnabled") & 1) != 0)
              return 1;
            v66 = (_DWORD)v28
                ? objc_msgSend((id)objc_msgSend(v48, "configuration"), "maximumNumberOfBracketedSIFRFrames")
                : 0;
            if (v66 != v86 || (objc_msgSend((id)objc_msgSend(v48, "captureStream"), "suspended") & 1) != 0)
              return 1;
            v67 = objc_msgSend((id)objc_msgSend(v48, "configuration"), "stillImageLocalHistogramClippingDataMetadataEnabled");
            if (a2)
            {
              if (((v67 ^ (*(_BYTE *)(a2 + 140) != 0)) & 1) != 0)
                return 1;
            }
            else if ((v67 & 1) != 0)
            {
              return 1;
            }
            v68 = objc_msgSend((id)objc_msgSend(v48, "configuration"), "ltmThumbnailMetadataEnabledForStreaming");
            if (a2)
            {
              if (((v68 ^ (*(_BYTE *)(a2 + 272) != 0)) & 1) != 0)
                return 1;
            }
            else if ((v68 & 1) != 0)
            {
              return 1;
            }
            if (csp_gdcExpandsImageDimensions(objc_msgSend(v6, "source")))
            {
              v69 = objc_msgSend((id)objc_msgSend(v48, "configuration"), "geometricDistortionCorrectionOnPreviewOutputEnabled");
              if (a2)
              {
                if (((v69 ^ (*(_BYTE *)(a2 + 138) != 0)) & 1) != 0)
                  return 1;
              }
              else if ((v69 & 1) != 0)
              {
                return 1;
              }
              v70 = objc_msgSend((id)objc_msgSend(v48, "configuration"), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled");
              if (a2)
              {
                if (((v70 ^ (*(_BYTE *)(a2 + 137) != 0)) & 1) != 0)
                  return 1;
              }
              else if ((v70 & 1) != 0)
              {
                return 1;
              }
              v71 = objc_msgSend((id)objc_msgSend(v48, "configuration"), "geometricDistortionCorrectionOnStillImageOutputEnabled");
              if (a2)
              {
                if (((v71 ^ (*(_BYTE *)(a2 + 136) != 0)) & 1) != 0)
                  return 1;
              }
              else if ((v71 & 1) != 0)
              {
                return 1;
              }
            }
            if (objc_msgSend((id)objc_msgSend(v48, "configuration"), "secureMetadataOutputConfiguration"))
              return 1;
            if (v89 == ++v47)
            {
              v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
              v89 = v72;
              if (!v72)
              {
                LOBYTE(v45) = v82 & 1;
                goto LABEL_149;
              }
              goto LABEL_85;
            }
          }
          FigDebugAssert3();
          return 1;
        }
LABEL_149:
        if (!a3)
        {
          v76 = v77;
          LODWORD(v75) = 0;
          FigDebugAssert3();
        }
        *a3 = v45;
        v28 = 0;
        if (objc_msgSend(v81, "count", v75, v76))
          v73 = v81;
        else
          v73 = 0;
        *v78 = v73;
      }
    }
  }
  return v28;
}

- (void)nondisruptiveSwitchingFormatIndicesByPortTypeForConfiguration:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int CGRectIfPresent;
  double v14;
  int v15;
  int v16;
  int v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  double v28;
  int v29;
  BOOL v30;
  id obj;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a2)
    v4 = *(void **)(a2 + 184);
  else
    v4 = 0;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = *(id *)(a1 + 56);
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v50;
    v5 = *MEMORY[0x1E0D07EA8];
    v42 = *MEMORY[0x1E0D07EA0];
    v33 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v34 = *MEMORY[0x1E0C9D648];
    v36 = v4;
    v37 = a2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v6);
        v8 = objc_msgSend((id)objc_msgSend(v7, "configuration"), "formatIndex");
        v41 = v7;
        v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "captureStream"), "supportedFormats");
        v39 = v6;
        if (a2 && *(_BYTE *)(a2 + 142))
          v10 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 216), "irisSinkConfiguration"), "ultraHighResolutionZeroShutterLagSupportEnabled");
        else
          v10 = 0;
        v11 = csp_activeStreamingNondisruptiveSwitchingFormatIndices(v8, v9, objc_msgSend((id)objc_msgSend(v4, "requiredFormat"), "configureForNonDisruptiveFullBinSIFRSwitching"), v10);
        v47 = v34;
        v48 = v33;
        v12 = (void *)objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
        v14 = *(double *)&v48;
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v5), "BOOLValue"))
          v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v42), "intValue");
        else
          v15 = 0;
        v16 = objc_msgSend((id)objc_msgSend(v4, "requiredFormat"), "sifrBinningFactorOverrideForNondisruptiveSwitching");
        if (v16 <= 0 || v15 <= 0)
          v18 = v15;
        else
          v18 = v16;
        v19 = csp_formatUsesFES(v12);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v44;
          if (CGRectIfPresent)
            v23 = (double)(int)v14;
          else
            v23 = 0.0;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v44 != v22)
                objc_enumerationMutation(v11);
              v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              v26 = (void *)objc_msgSend(v9, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v5), "BOOLValue");
              if (v27)
                v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v42), "intValue");
              if (v18 == v27 && v19 == csp_formatUsesFES(v26))
              {
                v29 = FigCFDictionaryGetCGRectIfPresent();
                v28 = *(double *)&v48;
                if (v29)
                  v30 = *(double *)&v48 == v23;
                else
                  v30 = 0;
                if (v30)
                  objc_msgSend(v40, "setObject:forKeyedSubscript:", v25, objc_msgSend(v41, "portType", *(double *)&v48));
              }
            }
            v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16, v28);
          }
          while (v21);
        }
        v6 = v39 + 1;
        v4 = v36;
        a2 = v37;
      }
      while (v39 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v38);
  }
  return v40;
}

- (uint64_t)setBlackenFramesForContinuityDisplayConnected:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(result + 360), "captureStreams", 0);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setBlackenFramesForContinuityDisplayConnected:", a2);
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setKeepISPStreamingWhenStopping:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(void **)(result + 56);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setKeepISPStreamingWhenStopping:", a2);
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setDisableTemporalNoiseReductionWhenStopping:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 360), "setDisableTemporalNoiseReductionWhenStopping:", a2);
  return result;
}

- (uint64_t)setEmitsFramesWhileStopping:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(void **)(result + 56);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setEmitsFramesWhileStopping:", a2);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    return objc_msgSend(*(id *)(v3 + 120), "setEmitsUnsynchronizedFramesWhileStopping:", a2);
  }
  return result;
}

- (uint64_t)setCinematicFramingControlsWhileRunning:(float)a3 panningAngleX:(float)a4 panningAngleY:(float)a5 videoZoomFactor:(double)a6 manualFramingDefaultZoomFactor:
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void (*v12)(uint64_t, const __CFString *, uint64_t);
  uint64_t CenterStageFramingMode;
  char CinematicFramingFieldOfViewRestrictedToWide;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  float v33;
  void *v34;
  _BYTE *v35;
  unint64_t v36;
  uint64_t v37;
  _BYTE v39[3];
  int v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  float v47;
  uint64_t v48;
  double v49;
  int v50;
  int v51;
  int v52;
  int v53;
  _BYTE v54[3];
  int v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  float v62;
  uint64_t v63;
  double v64;
  int v65;
  int v66;
  int v67;
  int v68;

  v36 = __PAIR64__(LODWORD(a4), LODWORD(a3));
  if (!result)
    return result;
  v7 = a2;
  v8 = result;
  objc_msgSend(*(id *)(result + 360), "setCinematicFramingEnabled:", a2);
  result = objc_msgSend(*(id *)(v8 + 376), "isCinematicFramingProvidedBySource");
  if ((result & 1) != 0)
    return result;
  objc_msgSend(*(id *)(v8 + 360), "setManualCinematicFramingEnabled:", v7 ^ 1u);
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 360), "manualCinematicFramingDelegate"), "setCinematicFramingControlsSuspended:", 1);
  v9 = *(_QWORD *)(v8 + 368);
  *(float *)&v10 = a5;
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v12 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v12)
    v12(v9, CFSTR("VideoZoomFactor"), v11);
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 360), "manualCinematicFramingDelegate", v36), "setCinematicFramingControlsSuspended:", 0);
  CenterStageFramingMode = csp_getCenterStageFramingMode(*(_QWORD *)(v8 + 368));
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 360), "subjectSelectionDelegate"), "didChangeCenterStageFramingMode:", CenterStageFramingMode);
  CinematicFramingFieldOfViewRestrictedToWide = csp_getCinematicFramingFieldOfViewRestrictedToWide(*(_QWORD *)(v8 + 368));
  csp_getCenterStageRectOfInterest(*(_QWORD *)(v8 + 368));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = +[FigCaptureCameraParameters cinematicFramingVirtualCameraConfigurationForPortType:sensorIDString:](FigCaptureCameraParameters, "cinematicFramingVirtualCameraConfigurationForPortType:sensorIDString:", objc_msgSend((id)objc_msgSend(*(id *)(v8 + 360), "captureStream"), "portType"), objc_msgSend((id)objc_msgSend(*(id *)(v8 + 360), "captureStream"), "sensorIDString"));
  v24 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DefaultVirtualCameraRotationAngleX"));
  v25 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DefaultVirtualCameraRotationAngleY"));
  v26 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DefaultVirtualCameraRotationAngleZ"));
  v27 = 0;
  v28 = 0;
  if (v24)
  {
    objc_msgSend(v24, "floatValue");
    v28 = v29;
  }
  if (v25)
  {
    objc_msgSend(v25, "floatValue");
    v27 = v30;
  }
  if (!v26)
  {
    v32 = 0;
    if (!v23)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v26, "floatValue");
  v32 = v31;
  if (v23)
  {
LABEL_11:
    objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ManualFramingDefaultZoomFactor")), "floatValue");
    a6 = v33;
  }
LABEL_12:
  if (v7)
  {
    v56 = 0;
    v55 = 0;
    v34 = (void *)objc_msgSend(*(id *)(v8 + 360), "manualCinematicFramingDelegate");
    v54[0] = v7;
    v54[1] = 1;
    v54[2] = CinematicFramingFieldOfViewRestrictedToWide;
    v57 = v16;
    v58 = v18;
    v59 = v20;
    v60 = v22;
    v61 = CenterStageFramingMode;
    v62 = a5;
    v63 = v37;
    v64 = a6;
    v65 = v28;
    v66 = v27;
    v67 = v32;
    v68 = 0;
    v35 = v54;
  }
  else
  {
    v41 = 0;
    v40 = 0;
    v34 = (void *)objc_msgSend(*(id *)(v8 + 360), "centerStageDelegate");
    v39[0] = 0;
    v39[1] = 1;
    v39[2] = CinematicFramingFieldOfViewRestrictedToWide;
    v42 = v16;
    v43 = v18;
    v44 = v20;
    v45 = v22;
    v46 = CenterStageFramingMode;
    v47 = a5;
    v48 = v37;
    v49 = a6;
    v50 = v28;
    v51 = v27;
    v52 = v32;
    v53 = 0;
    v35 = v39;
  }
  return objc_msgSend(v34, "setCinematicFramingControls:", v35);
}

- (uint64_t)setWhileRunningBackgroundBlurEnabled:(uint64_t)a3 studioLightingEnabled:(uint64_t)a4 reactionEffectsEnabled:(uint64_t)a5 backgroundReplacementEnabled:
{
  unsigned int v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int PIDFromAuditToken;
  const void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  int *v27;
  char v28;
  char v29;
  char v30;
  id obj;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = a2;
    v9 = result;
    v10 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
    objc_msgSend(*(id *)(result + 360), "setBackgroundBlurEnabled:", a2);
    objc_msgSend(*(id *)(v9 + 360), "setStudioLightingEnabled:", a3);
    objc_msgSend(*(id *)(v9 + 360), "setReactionEffectsEnabled:", a4);
    objc_msgSend(*(id *)(v9 + 360), "setBackgroundReplacementEnabled:", a5);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = (id)objc_msgSend(*(id *)(v9 + 144), "allValues");
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    v35 = result;
    if (result)
    {
      v34 = *(_QWORD *)v49;
      v33 = (a4 | a5 | a3 | v8) ^ 1;
      v11 = v8;
      if ((_DWORD)a3)
        v11 = v8 | 2;
      if ((_DWORD)a4)
        v11 |= 0x10uLL;
      if ((_DWORD)a5)
        v11 |= 0x40uLL;
      v32 = v11;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v49 != v34)
            objc_enumerationMutation(obj);
          v36 = v12;
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
          objc_msgSend(v13, "setEffectBypassed:", v33);
          objc_msgSend(v13, "setActiveBlurEffect:", v32);
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v39 = (id)objc_msgSend(*(id *)(v9 + v10[393]), "captureStreams");
          v14 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v45;
            v37 = *(_QWORD *)v45;
            do
            {
              v17 = 0;
              v38 = v15;
              do
              {
                if (*(_QWORD *)v45 != v16)
                  objc_enumerationMutation(v39);
                v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
                if (objc_msgSend((id)objc_msgSend(v18, "stream"), "streaming"))
                {
                  v43 = 0;
                  v41 = 0u;
                  v42 = 0u;
                  LOBYTE(v41) = objc_msgSend(v18, "pixelFormatIsTenBit");
                  objc_msgSend(v18, "maximumSupportedFrameRate");
                  DWORD1(v41) = v19;
                  BYTE8(v41) = objc_msgSend(v18, "highlightRecoveryEnabled");
                  HIDWORD(v41) = objc_msgSend(v18, "sensorDimensions");
                  LODWORD(v42) = (unint64_t)objc_msgSend(v18, "sensorDimensions") >> 32;
                  DWORD1(v42) = objc_msgSend(v18, "videoCaptureDimensions");
                  DWORD2(v42) = (unint64_t)objc_msgSend(v18, "videoCaptureDimensions") >> 32;
                  BYTE12(v42) = objc_msgSend(*(id *)(v9 + v10[393]), "backgroundBlurEnabled");
                  BYTE13(v42) = objc_msgSend(*(id *)(v9 + v10[393]), "studioLightingEnabled");
                  BYTE14(v42) = objc_msgSend(*(id *)(v9 + v10[393]), "reactionEffectsEnabled");
                  HIBYTE(v42) = objc_msgSend(*(id *)(v9 + v10[393]), "backgroundReplacementEnabled");
                  LOBYTE(v43) = objc_msgSend(*(id *)(v9 + v10[393]), "cinematicFramingEnabled");
                  if (v18)
                    objc_msgSend(v18, "clientAuditToken");
                  else
                    memset(v40, 0, sizeof(v40));
                  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(v40);
                  v21 = (const void *)objc_msgSend(*(id *)(v9 + v10[393]), "applicationID");
                  v22 = *(_DWORD *)(v9 + 44);
                  v23 = objc_msgSend(v18, "portType");
                  v24 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  objc_msgSend(v18, "averageFrameRate");
                  v26 = v25;
                  v27 = v10;
                  v28 = objc_msgSend(v18, "continuityCameraIsWired");
                  v29 = objc_msgSend(v18, "isDeskCamActive");
                  v30 = v28;
                  v10 = v27;
                  FigCaptureLogCameraStreamingPowerEvent(PIDFromAuditToken, v21, v22, 1, v23, v24, v30, v29, v26, &v41);
                  v16 = v37;
                  v15 = v38;
                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v15);
          }
          v12 = v36 + 1;
        }
        while (v36 + 1 != v35);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setStreamsSuspendedBySourceDeviceType:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = *(id *)(result + 56);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    v26 = result;
    if (result)
    {
      v24 = *MEMORY[0x1E0D05A18];
      v25 = *(_QWORD *)v32;
      v20 = *MEMORY[0x1E0D05A30];
      v22 = v3;
      v23 = *MEMORY[0x1E0D05A28];
      v18 = *MEMORY[0x1E0D05A50];
      v19 = *MEMORY[0x1E0D05A38];
      v17 = *MEMORY[0x1E0D05A40];
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v4);
          v6 = (void *)objc_msgSend(v5, "portType", v17);
          v7 = &unk_1E4A009F8;
          if ((objc_msgSend(v6, "isEqualToString:", v24) & 1) != 0
            || (v7 = &unk_1E4A00A10, (objc_msgSend(v6, "isEqualToString:", v20) & 1) != 0)
            || (v7 = &unk_1E4A00A28, (objc_msgSend(v6, "isEqualToString:", v23) & 1) != 0)
            || (v7 = &unk_1E4A00A40, (objc_msgSend(v6, "isEqualToString:", v19) & 1) != 0)
            || (v7 = &unk_1E4A00A58, (objc_msgSend(v6, "isEqualToString:", v18) & 1) != 0)
            || (v7 = &unk_1E4A00A70, objc_msgSend(v6, "isEqualToString:", v17)))
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v28;
              v11 = 1;
              do
              {
                for (i = 0; i != v9; ++i)
                {
                  if (*(_QWORD *)v28 != v10)
                    objc_enumerationMutation(v7);
                  v13 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "intValue");
                  if (objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13)))
                  {
                    v11 &= objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13)), "BOOLValue");
                  }
                }
                v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v9);
            }
            else
            {
              LOBYTE(v11) = 1;
            }
            v14 = (void *)objc_msgSend(v5, "captureStream");
            if (objc_msgSend(v14, "suspendingSupported"))
              objc_msgSend(v14, "setSuspended:", v11 & 1);
            v15 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E49F9C60), "BOOLValue");
            if (((objc_msgSend((id)objc_msgSend(*(id *)(v22 + 360), "applicationID"), "isEqualToString:", 0x1E493D838) & 1) != 0|| objc_msgSend((id)objc_msgSend(*(id *)(v22 + 360), "applicationID"), "isEqualToString:", 0x1E493D538))&& objc_msgSend((id)objc_msgSend(v5, "portType"), "isEqualToString:", v23)&& *(_QWORD *)(v22 + 440))
            {
              objc_msgSend(v14, "setDeskCamActive:", v15 ^ 1);
            }
            v16 = *(void **)(v22 + 440);
            if (v16)
            {
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "input"), "connection"), "output"), "setDiscardsSampleData:", v15);
              objc_msgSend(*(id *)(v22 + 360), "setDeskCamActive:", v15 ^ 1);
              if (objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E49F9BE8))
                objc_msgSend(*(id *)(v22 + 360), "setUltraWideActive:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E49F9BE8), "BOOLValue") ^ 1);
            }
          }
          ++v4;
        }
        while (v4 != v26);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        v26 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)requiresMasterClock
{
  if (result)
    return objc_msgSend(*(id *)(result + 112), "count") != 0;
  return result;
}

- (uint64_t)setPreviewShift:(double)a3 previewScaleFactor:(double)a4 forPortType:(float)a5 previewShiftAtBaseZoom:(double)a6
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = *(void **)(result + 56);
    result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (result)
    {
      v14 = result;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if (objc_msgSend((id)objc_msgSend(v17, "portType"), "isEqualToString:", a2))
          {
            *(float *)&v18 = a5;
            return objc_msgSend(v17, "setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:", a3, a4, v18, a6, a7);
          }
          ++v16;
        }
        while (v14 != v16);
        result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v14 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_insertPreLTMThumbnailOutputsBySourceDeviceType:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 videoCaptureOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  BWMetadataSynchronizerNode *v17;
  BWMetadataSynchronizerNode *v18;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a2, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    if (!objc_msgSend(a3, "count"))
      a3 = a4;
    v27 = 0uLL;
    v28 = 0uLL;
    obj = (id)objc_msgSend(a3, "allKeys");
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v23 = *MEMORY[0x1E0D06BD8];
      v20 = *MEMORY[0x1E0D06EC0];
      v22 = *MEMORY[0x1E0D06748];
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(a2, "objectForKeyedSubscript:", v15))
          {
            v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v16, "addObject:", v23);
            if (objc_msgSend(a1[45], "isBravoVariant"))
              objc_msgSend(v16, "addObject:", v20);
            v17 = [BWMetadataSynchronizerNode alloc];
            v29 = v22;
            v18 = -[BWMetadataSynchronizerNode initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:](v17, "initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1), 0, 0, 0, v16);
            v24.receiver = a1;
            v24.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v24, sel_addNode_error_, v18, 0) & 1) == 0
              || (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", v15), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v18, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v15), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v18, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
            {
              FigDebugAssert3();
              return 0;
            }
            objc_msgSend(a3, "setObject:forKeyedSubscript:", -[BWNode output](v18, "output"), v15);
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v12)
          continue;
        break;
      }
    }
  }
  return 0;
}

- (uint64_t)_buildVideoCaptureOutputNetwork:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 stillImageOutputsByPortType:(void *)a5 lightSourceMaskOutputsBySourceDeviceType:(void *)a6 keypointDescriptorDataOutputsBySourceDeviceType:(uint64_t)a7 pipelineConfiguration:(void *)a8 graph:(uint64_t)a9 videoCaptureDimensions:(int)a10 numberOfSecondaryFramesToSkip:
{
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BWFanOutNode *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BWVISOverscanPredictionNode *v38;
  void *v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v50;
  BWDockKitNode *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  BWFanOutNode *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  unsigned int v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;
  _BOOL8 v81;
  BWBackgroundBlurNode *v82;
  BWBackgroundBlurNode *v83;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  uint64_t v89;
  void (*v90)(uint64_t, const __CFString *, _QWORD, id *);
  id v91;
  BWDeskCamNode *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  uint64_t v99;
  uint64_t v100;
  BWSynchronizerNode *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t k;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *VideoDataConfigurationFromConfigurations;
  BWDepthConverterNode *v109;
  BWDepthConverterNode *v110;
  BWDepthConverterNode *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  unint64_t v122;
  void *v123;
  __CFString **v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  BWAttachedMediaSplitNode *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  char **v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL4 v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  int v152;
  void *v153;
  uint64_t v154;
  id v155;
  int v156;
  BWFanOutNode *v157;
  BWFanOutNode *v158;
  const __CFString *v159;
  id v160;
  uint64_t v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t m;
  void *v170;
  void *v171;
  BWMetadataSynchronizerNode *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  id v181;
  BWFanOutNode *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  BWFanOutNode *v193;
  uint64_t v194;
  int v195;
  void *v196;
  int v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v203;
  void *v204;
  uint64_t v205;
  uint64_t v207;
  int v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  uint64_t v212;
  unsigned int v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  int v217;
  SEL v218;
  const char *v219;
  id obj;
  unsigned int obja;
  id objb;
  id objc;
  id objd;
  id obje;
  void *v226;
  uint64_t v227;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  void *v235;
  uint64_t v236;
  objc_super v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  objc_super v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  objc_super v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  objc_super v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  objc_super v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  objc_super v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  objc_super v267;
  os_log_type_t type;
  int v269;
  objc_super v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  objc_super v275;
  objc_super v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  objc_super v281;
  unsigned __int8 v282;
  unsigned __int8 v283;
  unsigned __int8 v284;
  unsigned __int8 v285;
  objc_super v286;
  id v287;
  unsigned int v288;
  uint64_t v289;
  _BYTE v290[128];
  _BYTE v291[128];
  uint64_t v292;
  uint64_t v293;
  _BYTE v294[128];
  uint64_t v295;
  __CFString *v296;
  _QWORD v297[2];
  _BYTE v298[128];
  _BYTE v299[128];
  _BYTE v300[128];
  id v301[16];
  _BYTE v302[128];
  _BYTE v303[128];
  uint64_t v304;

  v304 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v13 = result;
  v288 = 0;
  v287 = 0;
  if (a7)
  {
    v14 = *(void **)(a7 + 184);
    v15 = *(_QWORD *)(a7 + 208);
    v204 = *(void **)(a7 + 224);
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v204 = 0;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v15)
    objc_msgSend(v16, "addObjectsFromArray:", v15);
  v210 = v16;
  if (*(_BYTE *)(v13 + 40))
  {
    v18 = v16;
    if (a7)
      v19 = *(_QWORD *)(a7 + 200);
    else
      v19 = 0;
    v20 = v16;
  }
  else
  {
    v18 = v16;
    if (a7)
      v19 = *(_QWORD *)(a7 + 200);
    else
      v19 = 0;
    v20 = v17;
  }
  objc_msgSend(v20, "addObjectsFromArray:", v19);
  v21 = a7;
  if (*(_BYTE *)(v13 + 392))
  {
    if (a7)
      v22 = *(_QWORD *)(a7 + 216);
    else
      v22 = 0;
    objc_msgSend(v18, "addObject:", v22, a7);
    v21 = a7;
  }
  v235 = a8;
  v236 = v13;
  v229 = a2;
  v226 = v14;
  if (!v21)
  {
    v288 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](v13, a2, v18, 0, a8, 1u, a10);
    if (v288)
      goto LABEL_311;
    v30 = 0;
    v28 = a7;
    goto LABEL_28;
  }
  if (*(_BYTE *)(v21 + 346) && *(_BYTE *)(v13 + 40))
  {
    v23 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
    -[BWNode setName:](v23, "setName:", CFSTR("Video Preview/Capture Splitter"));
    v24 = objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E49F9BB8);
    v286.receiver = (id)v13;
    v286.super_class = (Class)FigCaptureCameraSourcePipeline;
    if ((objc_msgSendSuper2(&v286, sel_addNode_error_, v23, &v287) & 1) == 0
      || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v24, -[BWNode input](v23, "input"), 0) & 1) == 0)
    {
      goto LABEL_311;
    }
    v25 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v23, "outputs"), "objectAtIndexedSubscript:", 0);
    objc_msgSend(v25, "setName:", CFSTR("Preview"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v25, &unk_1E49F9BB8);
    objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v23, "outputs"), "objectAtIndexedSubscript:", 1), &unk_1E49F9BB8);
    v21 = a7;
    v18 = v16;
  }
  v26 = v18;
  v27 = v21;
  v288 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](v13, a2, v26, v21, a8, 1u, a10);
  if (v288)
  {
LABEL_311:
    FigDebugAssert3();
    goto LABEL_312;
  }
  v28 = v27;
  if (!*(_BYTE *)(v27 + 320))
  {
    v30 = 0;
LABEL_28:
    v29 = v16;
    goto LABEL_31;
  }
  v29 = v16;
  if (*(_DWORD *)(v27 + 28) == 3)
  {
    v30 = 0;
  }
  else
  {
    v288 = -[FigCaptureCameraSourcePipeline _insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:ifAllowedByAdditionalPreviewConnectionConfigurations:semanticMasksOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v13, a2, v17, *(void **)(v13 + 352), v27, a8);
    if (v288)
      goto LABEL_311;
    v30 = 1;
    v28 = a7;
  }
LABEL_31:
  v31 = v28;
  v200 = *MEMORY[0x1E0D06738];
  v288 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)v13, a5, v29, v28, a8, 0x76696465u, *MEMORY[0x1E0D06738]);
  if (v288)
    goto LABEL_311;
  v199 = *MEMORY[0x1E0D06730];
  v288 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)v13, a6, v29, v31, a8, 0x76696465u, *MEMORY[0x1E0D06730]);
  if (v288)
    goto LABEL_311;
  if (v31)
    v32 = *(_QWORD *)(v31 + 216);
  else
    v32 = 0;
  v207 = v32;
  v33 = v32 != 0;
  v285 = 0;
  v217 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("backgroundblur"), objc_msgSend(v14, "backgroundBlurEnabled"), objc_msgSend(v14, "isBackgroundBlurSupported"), objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "isBackgroundBlurProvidedBySource"), v33, &v285);
  v284 = 0;
  v214 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("studiolighting"), objc_msgSend(v14, "studioLightingEnabled"), objc_msgSend(v14, "isStudioLightingSupported"), objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "isStudioLightingProvidedBySource"), v33, &v284);
  v283 = 0;
  v208 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("reactioneffects"), objc_msgSend(v14, "reactionEffectsEnabled"), objc_msgSend(v14, "reactionEffectsSupported"), objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "reactionEffectsProvidedBySource"), v33, &v283);
  v282 = 0;
  v34 = FigCaptureVideoEffectEnabledInGraph((uint64_t)CFSTR("backgroundreplacement"), objc_msgSend(v14, "backgroundReplacementEnabled"), objc_msgSend(v14, "isBackgroundReplacementSupported"), objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "isBackgroundReplacementProvidedBySource"), v33, &v282);
  if (objc_msgSend(*(id *)(v13 + 360), "adaptiveOverscanEnabled"))
  {
    if (objc_msgSend(a2, "count") == 1)
    {
      v35 = objc_msgSend((id)objc_msgSend(a2, "allKeys"), "firstObject");
      if (v35)
      {
        v36 = v35;
        v37 = objc_msgSend(a2, "objectForKeyedSubscript:", v35);
        v38 = -[BWVISOverscanPredictionNode initWithCameraInfoByPortType:delegate:]([BWVISOverscanPredictionNode alloc], "initWithCameraInfoByPortType:delegate:", objc_msgSend(*(id *)(v13 + 360), "cameraInfoByPortType"), v13);
        -[BWNode setName:](v38, "setName:", CFSTR("Overscan prediction"));
        v281.receiver = (id)v13;
        v281.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v281, sel_addNode_error_, v38, &v287) & 1) == 0
          || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v37, -[BWNode input](v38, "input"), 0) & 1) == 0)
        {
          goto LABEL_311;
        }
        objc_msgSend(a2, "setObject:forKeyedSubscript:", -[BWNode output](v38, "output"), v36);
      }
    }
  }
  v195 = v30;
  v196 = a3;
  if (objc_msgSend(a2, "count"))
    v39 = a2;
  else
    v39 = a3;
  v230 = v39;
  if (csp_dockKitNodeEnabled(a7, objc_msgSend(a8, "isRunningForContinuityCapture")))
  {
    v40 = csp_cinematicVideoEnabled(a7);
    v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v226, "requiredFormat"), "AVCaptureSessionPresets"), "containsObject:", CFSTR("AVCaptureSessionPresetPhoto"));
    v42 = csp_portraitPhotoModeEnabled(a7);
    v43 = FigCaptureClientApplicationIDIsCameraOrDerivative((void *)objc_msgSend(*(id *)(v13 + 360), "applicationID"));
    v277 = 0u;
    v278 = 0u;
    v279 = 0u;
    v280 = 0u;
    obj = (id)objc_msgSend(v230, "allKeys");
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v277, v303, 16);
    if (v44)
    {
      v45 = v44;
      v46 = (v40 | v43 & (v41 | v42)) ^ 1;
      v47 = *(_QWORD *)v278;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v278 != v47)
            objc_enumerationMutation(obj);
          v49 = *(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * i);
          v50 = objc_msgSend(v230, "objectForKeyedSubscript:", v49);
          v51 = -[BWDockKitNode initWithIsRunningForContinuityCapture:cinematicVideoEnabled:]([BWDockKitNode alloc], "initWithIsRunningForContinuityCapture:cinematicVideoEnabled:", objc_msgSend(v235, "isRunningForContinuityCapture"), v40);
          v276.receiver = (id)v236;
          v276.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v276, sel_addNode_error_, v51, &v287) & 1) == 0
            || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v50, -[BWNode input](v51, "input"), 0) & 1) == 0)
          {
            goto LABEL_311;
          }
          objc_msgSend(v230, "setObject:forKeyedSubscript:", -[BWNode output](v51, "output"), v49);
          -[BWDockKitNode setCustomInferenceEnabled:](v51, "setCustomInferenceEnabled:", v46);
          -[BWDockKitNode setClientApplicationID:](v51, "setClientApplicationID:", objc_msgSend(*(id *)(v236 + 360), "applicationID"));
          *(_QWORD *)(v236 + 96) = v51;
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v277, v303, 16);
      }
      while (v45);
    }
  }
  v52 = v217 | v214;
  if ((objc_msgSend((id)objc_msgSend(v226, "requiredFormat"), "isCinematicFramingProvidedBySource") & 1) == 0
    && ((objc_msgSend(v226, "cinematicFramingEnabled") & 1) != 0
     || objc_msgSend(v226, "manualCinematicFramingEnabled")))
  {
    v53 = v236;
    v197 = objc_msgSend(v226, "deskCamEnabled");
    if (v197)
    {
      v56 = objc_msgSend(v229, "objectForKeyedSubscript:", &unk_1E49F9BE8);
      v54 = v235;
      if (!v56)
        goto LABEL_311;
      v57 = v56;
      v58 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
      -[BWNode setName:](v58, "setName:", CFSTR("Cinematic Framing/DeskCam Splitter"));
      v275.receiver = (id)v236;
      v275.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v275, sel_addNode_error_, v58, &v287) & 1) == 0
        || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v58, "input"), 0) & 1) == 0)
      {
        goto LABEL_311;
      }
      objc_msgSend(v230, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v58, "outputs"), "objectAtIndexedSubscript:", 0), &unk_1E49F9BE8);
    }
    else
    {
      v58 = 0;
      v54 = v235;
    }
    v59 = objc_msgSend(*(id *)(v236 + 360), "cameraInfoByPortType");
    v60 = v197 ^ 1;
    if (v58)
      v60 = 1;
    if ((v60 & 1) == 0)
      goto LABEL_311;
    v193 = v58;
    v61 = v59;
    *(_QWORD *)(v236 + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v230, "count"));
    v62 = v207 ? (v52 | v34) ^ 1 : 0;
    v55 = v210;
    v194 = v61;
    v288 = -[FigCaptureCameraSourcePipeline _insertSubjectSelectionAndCinematicFramingNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:cameraInfoByPortType:graph:stillImageCaptureEnabled:stillImageOutputsByPortType:](v236, v230, v210, a7, v61, v54, v62);
    if (v288)
      goto LABEL_311;
  }
  else
  {
    v53 = v236;
    v193 = 0;
    v194 = objc_msgSend(*(id *)(v236 + 360), "cameraInfoByPortType");
    v197 = 0;
    v54 = v235;
    v55 = v210;
  }
  if (v52 | v208 | v34)
  {
    v63 = objc_alloc(MEMORY[0x1E0C99E08]);
    v64 = objc_msgSend(v230, "count");
    v65 = v63;
    v55 = v210;
    *(_QWORD *)(v53 + 144) = objc_msgSend(v65, "initWithCapacity:", v64);
    v271 = 0u;
    v272 = 0u;
    v273 = 0u;
    v274 = 0u;
    v203 = (id)objc_msgSend(v230, "allKeys");
    v209 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v271, v302, 16);
    if (v209)
    {
      v205 = *(_QWORD *)v272;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v272 != v205)
            objc_enumerationMutation(v203);
          v67 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * v66);
          v68 = objc_msgSend(v230, "objectForKeyedSubscript:", v67, v187, v190);
          v69 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v55, objc_msgSend(v67, "intValue"));
          v212 = v66;
          v215 = v68;
          if (FigCapturePlatformSupportsUniversalLossyCompression())
            obja = csp_maxLossyCompressionLevelForConnectionConfigurations(v69, (unsigned int *)a7);
          else
            obja = 0;
          v70 = -[FigCaptureCameraSourcePipeline _getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:](v53, v69);
          v71 = objc_msgSend(v226, "backgroundBlurEnabled");
          if (objc_msgSend(v226, "studioLightingEnabled"))
            v71 |= 2uLL;
          if (objc_msgSend(v226, "reactionEffectsEnabled"))
            v71 |= 0x10uLL;
          if (objc_msgSend(v226, "backgroundReplacementEnabled"))
            v72 = v71 | 0x40;
          else
            v72 = v71;
          v73 = v285;
          v74 = v72 | v285;
          v75 = v284;
          if (v284)
            v74 |= 2uLL;
          v76 = v283;
          if (v283)
            v74 |= 0x10uLL;
          v77 = v282;
          if (v282)
            v74 |= 0x40uLL;
          v218 = (SEL)v74;
          v78 = v72;
          if (v207)
            v79 = v72 == 16;
          else
            v79 = 1;
          v80 = !v79;
          v81 = ((objc_msgSend(v235, "isRunningForContinuityCapture") & 1) != 0 || BWDeviceIsiPad())
             && (int)FigCapturePlatformIdentifier() > 6;
          v82 = [BWBackgroundBlurNode alloc];
          if (v70)
          {
            if ((objc_msgSend(v226, "cinematicFramingEnabled") & 1) != 0)
              LOBYTE(v70) = 1;
            else
              LOBYTE(v70) = objc_msgSend(v226, "manualCinematicFramingEnabled");
          }
          HIDWORD(v188) = objc_msgSend(v67, "intValue");
          LOBYTE(v188) = v70;
          v83 = -[BWBackgroundBlurNode initWithStillImageCaptureEnabled:maxLossyCompressionLevel:fastSwitchEnabled:availableEffects:activeEffect:isHighQualitySupported:upstreamDeviceOrientationCorrectionEnabled:deviceType:](v82, "initWithStillImageCaptureEnabled:maxLossyCompressionLevel:fastSwitchEnabled:availableEffects:activeEffect:isHighQualitySupported:upstreamDeviceOrientationCorrectionEnabled:deviceType:", v80, obja, (v75 | v73 | v76 | v77) != 0, v218, v78, v81, v188);
          v53 = v236;
          objc_msgSend(*(id *)(v236 + 360), "setPortraitEffectPropertiesDelegate:", v83);
          -[BWBackgroundBlurNode setClientApplicationID:](v83, "setClientApplicationID:", objc_msgSend(*(id *)(v236 + 360), "applicationID"));
          -[BWBackgroundBlurNode setContinuityCameraClientDeviceClass:](v83, "setContinuityCameraClientDeviceClass:", objc_msgSend((id)objc_msgSend(*(id *)(v236 + 360), "captureStream"), "continuityCameraClientDeviceClass"));
          v270.receiver = (id)v236;
          v270.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v270, sel_addNode_error_, v83, &v287) & 1) == 0
            || !-[BWBackgroundBlurNode videoInput](v83, "videoInput")
            || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v215, -[BWBackgroundBlurNode videoInput](v83, "videoInput"), 0) & 1) == 0|| !-[BWBackgroundBlurNode videoOutput](v83, "videoOutput"))
          {
            goto LABEL_311;
          }
          objc_msgSend(*(id *)(v236 + 144), "setObject:forKeyedSubscript:", v83, v67);
          objc_msgSend(v230, "setObject:forKeyedSubscript:", -[BWBackgroundBlurNode videoOutput](v83, "videoOutput"), v67);
          if ((_DWORD)v80)
          {
            if (!-[BWBackgroundBlurNode stillImageInput](v83, "stillImageInput")
              || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(v236 + 360), "captureStream"), "portType")), -[BWBackgroundBlurNode stillImageInput](v83, "stillImageInput"), 0) & 1) == 0|| !-[BWBackgroundBlurNode stillImageOutput](v83, "stillImageOutput"))
            {
              goto LABEL_311;
            }
            objc_msgSend(a4, "setObject:forKeyedSubscript:", -[BWBackgroundBlurNode stillImageOutput](v83, "stillImageOutput"), objc_msgSend((id)objc_msgSend(*(id *)(v236 + 360), "captureStream"), "portType"));
          }
          -[BWBackgroundBlurNode setEffectBypassed:](v83, "setEffectBypassed:", v78 == 0);
          v54 = v235;
          if (dword_1ECFE9690)
          {
            v269 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v55 = v210;
          v66 = v212 + 1;
        }
        while (v209 != v212 + 1);
        v209 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v271, v302, 16);
      }
      while (v209);
    }
  }
  if (objc_msgSend(v226, "deskCamEnabled", v187, v190))
  {
    v85 = v55;
    if (v197)
      v86 = 7;
    else
      v86 = 14;
    objb = (id)objc_msgSend(v230, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v86));
    v87 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v85, v86);
    if (FigCapturePlatformSupportsUniversalLossyCompression())
      v88 = csp_maxLossyCompressionLevelForConnectionConfigurations(v87, (unsigned int *)a7);
    else
      v88 = 0;
    v301[0] = 0;
    v89 = objc_msgSend(v226, "source");
    v90 = *(void (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
    if (v90)
      v90(v89, CFSTR("OverheadCameraMode"), *MEMORY[0x1E0C9AE00], v301);
    v91 = v301[0];
    LODWORD(v192) = objc_msgSend(v301[0], "intValue");
    LODWORD(v189) = v88;
    v92 = -[BWDeskCamNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portType:overheadCameraMode:captureDevice:]([BWDeskCamNode alloc], "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portType:overheadCameraMode:captureDevice:", objc_msgSend(v226, "deskCamOutputDimensions"), v194, objc_msgSend((id)objc_msgSend(v226, "requiredFormat"), "horizontalSensorBinningFactor"), objc_msgSend((id)objc_msgSend(v226, "requiredFormat"), "verticalSensorBinningFactor"), v207 != 0, 0, v189, *MEMORY[0x1E0D05A28], v192, *(_QWORD *)(v53 + 360));
    *(_QWORD *)(v53 + 440) = v92;
    -[BWDeskCamNode setClientApplicationID:](v92, "setClientApplicationID:", objc_msgSend(*(id *)(v53 + 360), "applicationID"));
    v267.receiver = (id)v53;
    v267.super_class = (Class)FigCaptureCameraSourcePipeline;
    if ((objc_msgSendSuper2(&v267, sel_addNode_error_, v92, &v287) & 1) == 0
      || !-[BWDeskCamNode videoCaptureInput](v92, "videoCaptureInput"))
    {
      goto LABEL_311;
    }
    if (v197)
    {
      if ((objc_msgSend(v54, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v193, "outputs"), "objectAtIndexedSubscript:", 1), -[BWDeskCamNode videoCaptureInput](v92, "videoCaptureInput"), 0) & 1) == 0)goto LABEL_311;
    }
    else if ((objc_msgSend(v54, "connectOutput:toInput:pipelineStage:", objb, -[BWDeskCamNode videoCaptureInput](v92, "videoCaptureInput"), 0) & 1) == 0)
    {
      goto LABEL_311;
    }
    if (!-[BWDeskCamNode videoCaptureOutput](v92, "videoCaptureOutput"))
      goto LABEL_311;
    objc_msgSend(v230, "setObject:forKeyedSubscript:", -[BWDeskCamNode videoCaptureOutput](v92, "videoCaptureOutput"), &unk_1E49F9C60);
  }
  v93 = a7;
  if (a7)
  {
    v94 = v229;
    if (*(_BYTE *)(a7 + 157))
    {
      *(_QWORD *)(v236 + 112) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v229, "count"));
      v263 = 0u;
      v264 = 0u;
      v265 = 0u;
      v266 = 0u;
      v231 = (id)objc_msgSend(v229, "allKeys");
      v95 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v263, v300, 16);
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v264;
        do
        {
          for (j = 0; j != v96; ++j)
          {
            if (*(_QWORD *)v264 != v97)
              objc_enumerationMutation(v231);
            v99 = *(_QWORD *)(*((_QWORD *)&v263 + 1) + 8 * j);
            v100 = objc_msgSend(v94, "objectForKeyedSubscript:", v99);
            v101 = -[BWSynchronizerNode initWithMediaType:]([BWSynchronizerNode alloc], "initWithMediaType:", 1986618469);
            v262.receiver = (id)v236;
            v262.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v262, sel_addNode_error_, v101, &v287) & 1) == 0)
              goto LABEL_311;
            objc_msgSend(*(id *)(v236 + 112), "addObject:", v101);
            -[BWSynchronizerNode setSourceClock:](v101, "setSourceClock:", objc_msgSend(*(id *)(v236 + 64), "clock"));
            if ((objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v100, -[BWNode input](v101, "input"), 0) & 1) == 0)
              goto LABEL_311;
            v94 = v229;
            objc_msgSend(v229, "setObject:forKeyedSubscript:", -[BWNode output](v101, "output"), v99);
          }
          v96 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v263, v300, 16);
        }
        while (v96);
      }
    }
    if (*(_BYTE *)(a7 + 158))
    {
      v260 = 0u;
      v261 = 0u;
      v258 = 0u;
      v259 = 0u;
      objc = (id)objc_msgSend(v94, "allKeys");
      v102 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v258, v299, 16);
      if (v102)
      {
        v103 = v102;
        v232 = *(id *)v259;
        do
        {
          for (k = 0; k != v103; ++k)
          {
            if (*(id *)v259 != v232)
              objc_enumerationMutation(objc);
            v105 = *(_QWORD *)(*((_QWORD *)&v258 + 1) + 8 * k);
            v106 = objc_msgSend(v94, "objectForKeyedSubscript:", v105);
            v107 = *(void **)(a7 + 200);
            VideoDataConfigurationFromConfigurations = csp_getVideoDataConfigurationFromConfigurations(*(void **)(a7 + 208));
            if (!VideoDataConfigurationFromConfigurations)
              VideoDataConfigurationFromConfigurations = csp_getVideoDataConfigurationFromConfigurations(v107);
            v109 = FigCaptureCreateAndConfigureDepthConverterNode(v204, VideoDataConfigurationFromConfigurations, 0, (void *)objc_msgSend(v226, "requiredFormat"), objc_msgSend(*(id *)(v236 + 360), "cameraInfoByPortType"), objc_msgSend(*(id *)(v236 + 360), "depthDataBaseRotation"), *(unsigned __int8 *)(v236 + 416), 0, &v288);
            if (v288)
              goto LABEL_311;
            v110 = v109;
            v111 = v109;
            if (!v110)
            {
LABEL_310:
              FigDebugAssert3();
              v288 = -12780;
              goto LABEL_312;
            }
            v257.receiver = (id)v236;
            v257.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v257, sel_addNode_error_, v110, &v287) & 1) == 0
              || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v106, -[BWNode input](v110, "input"), 0) & 1) == 0)
            {
              goto LABEL_311;
            }
            v94 = v229;
            objc_msgSend(v229, "setObject:forKeyedSubscript:", -[BWNode output](v110, "output"), v105);
          }
          v103 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v258, v299, 16);
        }
        while (v103);
      }
    }
    v93 = a7;
    if (!objc_msgSend(*(id *)(a7 + 232), "count"))
    {
      v113 = 0;
      v255 = 0u;
      v256 = 0u;
      v253 = 0u;
      v254 = 0u;
LABEL_167:
      v114 = *(void **)(v93 + 232);
      goto LABEL_168;
    }
    v112 = *(void **)(a7 + 232);
LABEL_164:
    v113 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v112, "count"));
    v253 = 0u;
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    if (!v93)
    {
      v114 = 0;
      goto LABEL_168;
    }
    goto LABEL_167;
  }
  v186 = objc_msgSend(0, "count");
  v112 = 0;
  if (v186)
    goto LABEL_164;
  v113 = 0;
  v114 = 0;
  v255 = 0u;
  v256 = 0u;
  v253 = 0u;
  v254 = 0u;
LABEL_168:
  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v253, v298, 16);
  if (v115)
  {
    v116 = v115;
    v233 = *(id *)v254;
    objd = v114;
    do
    {
      v117 = 0;
      do
      {
        if (*(id *)v254 != v233)
          objc_enumerationMutation(objd);
        v118 = objc_msgSend(*(id *)(*((_QWORD *)&v253 + 1) + 8 * v117), "underlyingDeviceType");
        v119 = objc_msgSend(v229, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v118));
        if (a7)
          v120 = *(void **)(a7 + 208);
        else
          v120 = 0;
        v121 = v113;
        v122 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v120, v118), "count");
        if (v122 < 2)
        {
          v296 = CFSTR("VisionData");
          v123 = (void *)MEMORY[0x1E0C99D20];
          v124 = &v296;
          v125 = 1;
        }
        else
        {
          v297[0] = CFSTR("PrimaryFormat");
          v297[1] = 0x1E4947718;
          v123 = (void *)MEMORY[0x1E0C99D20];
          v124 = (__CFString **)v297;
          v125 = 2;
        }
        v126 = objc_msgSend(v123, "arrayWithObjects:count:", v124, v125);
        v127 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (a7
          && *(_BYTE *)(a7 + 320)
          && objc_msgSend(*(id *)(v236 + 456), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v118)))
        {
          objc_msgSend(v127, "addObjectsFromArray:", BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(a7 + 321)));
        }
        v128 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:]([BWAttachedMediaSplitNode alloc], "initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:", v126, v127);
        -[BWNode setName:](v128, "setName:", CFSTR("Vision Data Splitter"));
        v252.receiver = (id)v236;
        v252.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v252, sel_addNode_error_, v128, &v287) & 1) == 0
          || (objc_msgSend(v235, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v128, "input"), 0) & 1) == 0)
        {
          goto LABEL_311;
        }
        if (v122 < 2)
        {
          v129 = 0;
          v130 = 0;
        }
        else
        {
          v129 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v128, "outputs"), "objectAtIndexedSubscript:", 0);
          v130 = 1;
        }
        objc_msgSend(v229, "setObject:forKeyedSubscript:", v129, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v118));
        v131 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v128, "outputs"), "objectAtIndexedSubscript:", v130);
        v113 = v121;
        objc_msgSend(v121, "setObject:forKeyedSubscript:", v131, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v118));
        ++v117;
      }
      while (v116 != v117);
      v132 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v253, v298, 16);
      v116 = v132;
    }
    while (v132);
  }
  v133 = objc_msgSend(v113, "count");
  if (v133)
    v133 = objc_msgSend(v113, "copy");
  v135 = v235;
  v134 = v236;
  *(_QWORD *)(v236 + 328) = v133;
  v136 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a7 && *(_DWORD *)(a7 + 28) == 3)
  {
    v295 = objc_msgSend(v229, "objectForKeyedSubscript:", &unk_1E49F9BE8);
    objc_msgSend(v136, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v295, 1), &unk_1E49F9BE8);
    objc_msgSend(v229, "setObject:forKeyedSubscript:", objc_msgSend(v229, "objectForKeyedSubscript:", &unk_1E49F9BB8), &unk_1E49F9C18);
  }
  if (v195)
  {
    v288 = -[FigCaptureCameraSourcePipeline _insertSmartStyleMetadataSynchronizerNodeOnOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v236, v229, a7, v235);
    if (v288)
      goto LABEL_311;
  }
  v250 = 0u;
  v251 = 0u;
  v248 = 0u;
  v249 = 0u;
  v211 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v248, v294, 16);
  if (!v211)
    goto LABEL_295;
  v137 = &selRef__prepareToTerminateImmediatelyDueToError_;
  v216 = *(_QWORD *)v249;
  obje = v136;
  while (2)
  {
    v138 = 0;
    v219 = v137[200];
    do
    {
      if (*(_QWORD *)v249 != v216)
        objc_enumerationMutation(v229);
      v139 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * v138);
      v140 = objc_msgSend(v139, "intValue");
      v141 = objc_msgSend(v229, "objectForKeyedSubscript:", v139);
      if (a7)
        v142 = *(void **)(a7 + 208);
      else
        v142 = 0;
      v143 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v142, v140);
      v144 = objc_msgSend(v143, "count");
      v227 = v138;
      if (a7)
        v145 = *(void **)(a7 + 200);
      else
        v145 = 0;
      v146 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v145);
      v147 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v147, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:", v139), v200);
      objc_msgSend(v147, "setObject:forKeyedSubscript:", objc_msgSend(a6, "objectForKeyedSubscript:", v139), v199);
      v234 = v139;
      if (*(_BYTE *)(v236 + 40)
        && objc_msgSend(v146, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v140))&& (csp_cinematicVideoEnabled(a7) & 1) == 0)
      {
        v149 = a7;
        if (a7)
        {
          v148 = *(_BYTE *)(a7 + 346) == 0;
          if (!*(_BYTE *)(a7 + 346))
            ++v144;
LABEL_211:
          v150 = *(void **)(v149 + 232);
          goto LABEL_212;
        }
        v150 = 0;
        ++v144;
        v148 = 1;
      }
      else
      {
        v148 = 0;
        v149 = a7;
        if (a7)
          goto LABEL_211;
        v150 = 0;
      }
LABEL_212:
      v151 = v149;
      v152 = objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v150), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v140));
      if (v151)
        v153 = *(void **)(v151 + 248);
      else
        v153 = 0;
      v154 = (v144 - v152);
      v155 = v234;
      if (objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v153), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v140)))v154 = v154- (FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v143, 4, 1986618469) != 0);
      v156 = v154 - 1;
      if ((_DWORD)v154 == 1)
      {
        if (v148)
        {
          if (objc_msgSend(v196, "objectForKeyedSubscript:", v234))
          {
            v191 = v198;
            LODWORD(v189) = 0;
            FigDebugAssert3();
          }
          objc_msgSend(v196, "setObject:forKeyedSubscript:", v141, v234, v189, v191);
LABEL_225:
          LODWORD(v154) = 0;
          goto LABEL_252;
        }
        v293 = v141;
        objc_msgSend(obje, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v293, 1), v234);
        LODWORD(v154) = objc_msgSend(v147, "count") != 0;
      }
      else
      {
        if ((int)v154 < 2)
          goto LABEL_225;
        if (objc_msgSend(v147, "count"))
        {
          if (!v148)
          {
            v292 = v141;
            objc_msgSend(obje, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v292, 1), v234);
            goto LABEL_252;
          }
          v154 = 2;
        }
        else
        {
          v156 = 0;
        }
        v157 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v154, 1986618469);
        v158 = v157;
        if (v148)
          v159 = CFSTR("Video Preview/Capture Splitter");
        else
          v159 = CFSTR("Video Capture Splitter");
        -[BWNode setName:](v157, "setName:", v159);
        v247.receiver = (id)v236;
        v247.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v247, v219, v158, &v287) & 1) == 0
          || (objc_msgSend(v135, "connectOutput:toInput:pipelineStage:", v141, -[BWNode input](v158, "input"), 0) & 1) == 0)
        {
          goto LABEL_311;
        }
        if (v148)
        {
          v160 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v158, "outputs"), "objectAtIndexedSubscript:", 0);
          objc_msgSend(v160, "setName:", CFSTR("Preview"));
          objc_msgSend(v196, "setObject:forKeyedSubscript:", v160, v234);
          v161 = 1;
        }
        else
        {
          v161 = 0;
        }
        objc_msgSend(obje, "setObject:forKeyedSubscript:", -[NSArray subarrayWithRange:](-[BWNode outputs](v158, "outputs"), "subarrayWithRange:", v161, (v154 - v161)), v234);
        if (!*(_BYTE *)(v236 + 448))
          goto LABEL_246;
        if (!a7 || !*(_BYTE *)(a7 + 320))
        {
          do
          {
            -[BWFanOutNode setDiscardsAttachedMedia:forOutputIndex:](v158, "setDiscardsAttachedMedia:forOutputIndex:", 1, v161);
            v161 = (v161 + 1);
          }
          while ((int)v161 < (int)v154);
LABEL_246:
          LODWORD(v154) = v156;
          goto LABEL_252;
        }
        if (*(_BYTE *)(a7 + 321))
          v162 = objc_msgSend((id)objc_msgSend(*(id *)(a7 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
        else
          v162 = 0;
        v163 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v162);
        do
        {
          -[BWFanOutNode setAllowedAttachedMediaKeys:forOutputIndex:](v158, "setAllowedAttachedMediaKeys:forOutputIndex:", v163, v161);
          v161 = (v161 + 1);
        }
        while ((int)v161 < (int)v154);
        LODWORD(v154) = v156;
        v155 = v234;
      }
LABEL_252:
      if (objc_msgSend(v147, "count"))
      {
        v164 = 0;
        v213 = v154;
        if (v140 <= 9 && ((1 << v140) & 0x310) != 0)
        {
          v164 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v243 = 0u;
          v244 = 0u;
          v245 = 0u;
          v246 = 0u;
          v165 = *(void **)(v236 + 56);
          v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v243, v291, 16);
          if (v166)
          {
            v167 = v166;
            v168 = *(_QWORD *)v244;
            do
            {
              for (m = 0; m != v167; ++m)
              {
                if (*(_QWORD *)v244 != v168)
                  objc_enumerationMutation(v165);
                v170 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * m);
                v171 = (void *)BWUnderlyingDeviceTypesForCompositeDeviceType(v140);
                if (objc_msgSend(v171, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BWUtilitiesUnderlyingDeviceTypeFromPortType((void *)objc_msgSend(v170, "portType"), v140)))&& ((objc_msgSend((id)objc_msgSend(v170, "configuration"), "lightSourceMaskOutputEnabled") & 1) != 0|| objc_msgSend((id)objc_msgSend(v170, "configuration"), "keypointDescriptorDataOutputEnabled")))
                {
                  objc_msgSend(v164, "addObject:", objc_msgSend(v170, "portType"));
                }
              }
              v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v243, v291, 16);
            }
            while (v167);
          }
          v155 = v234;
          v135 = v235;
          if (!objc_msgSend(v164, "count"))
            goto LABEL_310;
        }
        v172 = -[BWMetadataSynchronizerNode initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:]([BWMetadataSynchronizerNode alloc], "initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", objc_msgSend(v147, "allKeys"), 0, 0, v164, 0);
        -[BWNode setName:](v172, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Metadata Synchronizer"), objc_msgSend((id)v236, "name")));
        v242.receiver = (id)v236;
        v242.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v242, v219, v172, &v287) & 1) == 0
          || (objc_msgSend(v135, "connectOutput:toInput:pipelineStage:", objc_msgSend((id)objc_msgSend(obje, "objectForKeyedSubscript:", v155), "objectAtIndexedSubscript:", 0), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v172, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
        {
          goto LABEL_311;
        }
        v240 = 0u;
        v241 = 0u;
        v238 = 0u;
        v239 = 0u;
        v173 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v238, v290, 16);
        if (v173)
        {
          v174 = v173;
          v175 = *(_QWORD *)v239;
          v176 = 1;
LABEL_271:
          v177 = 0;
          v178 = v176;
          while (1)
          {
            if (*(_QWORD *)v239 != v175)
              objc_enumerationMutation(v147);
            if (!objc_msgSend(v135, "connectOutput:toInput:pipelineStage:", objc_msgSend(v147, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * v177)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v172, "inputs"), "objectAtIndexedSubscript:", v178 + v177), 0))goto LABEL_311;
            if (v174 == ++v177)
            {
              v174 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v238, v290, 16);
              v176 = v178 + v177;
              if (v174)
                goto LABEL_271;
              break;
            }
          }
        }
        if (v213 == 1)
        {
          v289 = -[BWNode output](v172, "output");
          v179 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v289, 1);
          v180 = obje;
          v181 = v234;
        }
        else
        {
          v182 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v213, 1986618469);
          -[BWNode setName:](v182, "setName:", CFSTR("Video Capture Splitter"));
          v237.receiver = (id)v236;
          v237.super_class = (Class)FigCaptureCameraSourcePipeline;
          v181 = v234;
          if ((objc_msgSendSuper2(&v237, v219, v182, &v287) & 1) == 0)
            goto LABEL_311;
          v180 = obje;
          if ((objc_msgSend(v135, "connectOutput:toInput:pipelineStage:", -[BWNode output](v172, "output"), -[BWNode input](v182, "input"), 0) & 1) == 0)goto LABEL_311;
          v179 = -[BWNode outputs](v182, "outputs");
        }
        objc_msgSend(v180, "setObject:forKeyedSubscript:", v179, v181);
        if (objc_msgSend(a5, "objectForKeyedSubscript:", v181) && objc_msgSend(a6, "objectForKeyedSubscript:", v181))
        {
          v183 = *(id *)(v236 + 344);
          if (!v183)
          {
            v183 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            *(_QWORD *)(v236 + 344) = v183;
          }
          objc_msgSend(v183, "addObject:", v181);
        }
      }
      v138 = v227 + 1;
    }
    while (v227 + 1 != v211);
    v184 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v248, v294, 16);
    v134 = v236;
    v136 = obje;
    v211 = v184;
    v137 = &selRef__prepareToTerminateImmediatelyDueToError_;
    if (v184)
      continue;
    break;
  }
LABEL_295:
  v185 = objc_msgSend(v136, "count");
  if (v185)
    v185 = objc_msgSend(v136, "copy");
  *(_QWORD *)(v134 + 176) = v185;
LABEL_312:
  result = v288;
  if (!v288)
  {
    if (v287)
      return objc_msgSend(v287, "code");
  }
  return result;
}

- (uint64_t)_buildPreviewOutputNetwork:(uint64_t)a3 videoCaptureOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(int)a6 numberOfSecondaryFramesToSkip:
{
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  int v22;
  int v23;
  double v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a4)
  {
    v10 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](a1, a2, 0, 0, a5, 0, a6);
    if (!(_DWORD)v10)
      goto LABEL_7;
    goto LABEL_30;
  }
  v10 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](a1, a2, *(void **)(a4 + 200), a4, a5, 0, a6);
  if ((_DWORD)v10)
  {
LABEL_30:
    v27 = v10;
    goto LABEL_31;
  }
  if (*(_BYTE *)(a4 + 320))
  {
    if (*(_DWORD *)(a4 + 28) != 3)
    {
      v11 = -[FigCaptureCameraSourcePipeline _insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:ifAllowedByAdditionalPreviewConnectionConfigurations:semanticMasksOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)a1, a2, 0, *(void **)(a1 + 352), a4, a5);
      if ((_DWORD)v11)
      {
        v27 = (uint64_t)v11;
LABEL_31:
        FigDebugAssert3();
        return v27;
      }
    }
  }
LABEL_7:
  if (!objc_msgSend((id)objc_msgSend(a2, "allKeys"), "count"))
    return 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v12)
    goto LABEL_25;
  v13 = v12;
  v14 = *(_QWORD *)v30;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(a2);
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15));
      v17 = (void *)v16;
      if (a4)
      {
        v18 = *(void **)(a4 + 184);
        if (!v16)
          goto LABEL_20;
      }
      else
      {
        v18 = 0;
        if (!v16)
          goto LABEL_20;
      }
      objc_msgSend(v18, "requiredMinFrameRate");
      v20 = v19;
      objc_msgSend(v18, "requiredMaxFrameRate");
      if (v20 == v21)
      {
        v22 = BWGetMaximumDisplayFrequency();
        v23 = objc_msgSend((id)objc_msgSend(v18, "requiredFormat"), "preferredPreviewMaxFrameRate");
        if (v23 >= 1)
        {
          v25 = v23;
          if (v23 <= v22)
          {
            objc_msgSend(v18, "requiredMaxFrameRate");
            v22 = (int)*(float *)&v24 / ((v25 + (int)*(float *)&v24 - 1) / v25);
          }
        }
        *(float *)&v24 = (float)v22;
        objc_msgSend(v17, "setMaxSampleDataOutputRate:", v24);
      }
LABEL_20:
      ++v15;
    }
    while (v13 != v15);
    v26 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v13 = v26;
  }
  while (v26);
LABEL_25:
  v27 = 0;
  *(_QWORD *)(a1 + 152) = objc_msgSend(a2, "copy");
  return v27;
}

- (uint64_t)_addCrossOverNodeToGraph:(int)a3 outputNetworkType:(void *)a4 inputs:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:
{
  uint64_t v7;
  void *v13;
  BWCrossoverNode *v14;
  BWPipelineStage *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = (void *)result;
    v29 = 0;
    v14 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", a5, objc_msgSend(a4, "count"));
    -[BWNode setName:](v14, "setName:", a6);
    v28.receiver = v13;
    v28.super_class = (Class)FigCaptureCameraSourcePipeline;
    if ((objc_msgSendSuper2(&v28, sel_addNode_error_, v14, &v29) & 1) != 0)
    {
      if (a3 == 2)
        v15 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.detectedObjects"), 14);
      else
        v15 = 0;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(a4);
            if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", (v18 + i)), v15) & 1) == 0)
            {
              v23 = v7;
              LODWORD(v22) = 0;
              goto LABEL_16;
            }
          }
          v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          v18 += i;
          if (v17)
            continue;
          break;
        }
      }
    }
    else
    {
      v23 = v7;
      LODWORD(v22) = 0;
LABEL_16:
      FigDebugAssert3();
    }
    v21 = (int)v29;
    if (v29)
      v21 = objc_msgSend(v29, "code");
    *a7 = v21;
    return (uint64_t)-[BWNode output](v14, "output", v22, v23);
  }
  return result;
}

- (uint64_t)_stereoVideoAddSlaveFrameSynchronizerNode:(uint64_t)a3 input1:(uint64_t)a4 input2:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:
{
  void *v12;
  BWSlaveFrameSynchronizerNode *v13;
  BWSlaveFrameSynchronizerNode *v14;
  int v15;
  __int128 v16;
  id v17;

  if (result)
  {
    v12 = (void *)result;
    v17 = 0;
    BYTE12(v16) = 0;
    *(_QWORD *)((char *)&v16 + 4) = 1;
    LOBYTE(v16) = 1;
    v13 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", 0, 2, 0, 0, 0, 0, v16);
    v14 = v13;
    if (!a3
      || !a4
      || (-[BWNode setName:](v13, "setName:", a6), (objc_msgSend(v12, "addNode:error:", v14, &v17) & 1) == 0)
      || (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", a3, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
    {
      FigDebugAssert3();
    }
    if (v17)
    {
      v15 = objc_msgSend(v17, "code");
      result = 0;
      *a7 = v15;
    }
    else
    {
      return (uint64_t)-[BWNode output](v14, "output");
    }
  }
  return result;
}

- (uint64_t)_addFunnelNodeToGraph:(void *)a3 inputs:(uint64_t)a4 mediaType:(uint64_t)a5 name:(_DWORD *)a6 outErr:
{
  uint64_t v6;
  void *v10;
  BWFunnelNode *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = (void *)result;
    v26 = 0;
    v11 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(a3, "count"), a4);
    -[BWNode setName:](v11, "setName:", a5);
    v25.receiver = v10;
    v25.super_class = (Class)FigCaptureCameraSourcePipeline;
    if ((objc_msgSendSuper2(&v25, sel_addNode_error_, v11, &v26) & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(a3);
            if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v11, "inputs"), "objectAtIndexedSubscript:", (v14 + i)), 0) & 1) == 0)
            {
              v19 = v6;
              LODWORD(v18) = 0;
              goto LABEL_13;
            }
          }
          v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
          v14 += i;
          if (v13)
            continue;
          break;
        }
      }
    }
    else
    {
      v19 = v6;
      LODWORD(v18) = 0;
LABEL_13:
      FigDebugAssert3();
    }
    v17 = (int)v26;
    if (v26)
      v17 = objc_msgSend(v26, "code");
    *a6 = v17;
    return (uint64_t)-[BWNode output](v11, "output", v18, v19);
  }
  return result;
}

- (uint64_t)_addOverCaptureSourcePipelineToGraph:(void *)a3 upstreamVideoCaptureOutputsBySourceDeviceType:(unsigned int)a4 depthEnabled:(uint64_t)a5 depthFilterRenderingEnabled:(unsigned int)a6 preLTMThumbnailEnabled:(unsigned int)a7 postColorProcessingThumbnailEnabled:(int)a8 forPreview:(unsigned int)a9 maxLossyCompressionLevel:(int)a10 numberOfSecondaryFramesToSkip:(_DWORD *)a11 outErr:
{
  char v11;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  _DWORD *v23;
  void *v24;
  float v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  float v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  BOOL v42;
  unint64_t v43;
  uint64_t v44;
  _UNKNOWN **v45;
  id v46;
  void *v47;
  float v48;
  double v49;
  double v50;
  double v51;
  float v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  float v62;
  double v63;
  uint64_t v64;
  BWSlaveFrameSynchronizerNode *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t j;
  BWSlaveFrameSynchronizerNode *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  const __CFString *v77;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  objc_super v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  _BYTE v92[128];
  uint64_t v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = a8;
    v15 = result;
    v91 = 0;
    v16 = CFSTR("Video Capture Synchronizer");
    if (a8)
      v16 = CFSTR("Preview Synchronizer");
    v77 = v16;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v18 = objc_msgSend(&unk_1E4A00A88, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v88 != v20)
            objc_enumerationMutation(&unk_1E4A00A88);
          v22 = objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
          if (v22)
            objc_msgSend(v17, "addObject:", v22);
        }
        v19 = objc_msgSend(&unk_1E4A00A88, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      }
      while (v19);
    }
    v23 = a11;
    if ((unint64_t)objc_msgSend(v17, "count") <= 1)
    {
      v74 = v75;
      LODWORD(v73) = 0;
      FigDebugAssert3();
      v72 = FigSignalErrorAt();
      v65 = 0;
      if (v72)
      {
LABEL_47:
        *v23 = v72;
        return (uint64_t)-[BWNode output](v65, "output", v73, v74);
      }
LABEL_45:
      if (v91)
        v72 = objc_msgSend(v91, "code");
      goto LABEL_47;
    }
    v76 = a7;
    if (!a4 || (v11 & 1) != 0)
      goto LABEL_28;
    v24 = *(void **)(v15 + 64);
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "overscanForShiftMitigation");
    v26 = v25 + 1.0;
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "sensorOverscan");
    v28 = v26 * (v27 + 1.0);
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "overscanForShiftMitigation");
    v30 = v29 + 1.0;
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "sensorOverscan");
    v32 = v30 * (v31 + 1.0);
    v33 = objc_msgSend((id)objc_msgSend(v24, "configuration"), "videoCaptureDimensions");
    v34 = HIDWORD(v33);
    v35 = v28 * (double)(int)v33;
    LODWORD(v36) = FigCaptureRoundFloatToMultipleOf(2, v35);
    v37 = v32 * (double)(int)v34;
    LODWORD(v38) = FigCaptureRoundFloatToMultipleOf(2, v37);
    v39 = (void *)objc_msgSend((id)objc_msgSend(v24, "videoCaptureOutput"), "formatRequirements");
    v40 = objc_msgSend(v39, "width");
    v41 = objc_msgSend(v39, "height");
    v42 = (_DWORD)v36 == v40 && (_DWORD)v38 == v41;
    if (v42 || !objc_msgSend(v17, "count"))
    {
LABEL_28:
      if (*(_BYTE *)(v15 + 448))
      {
        v93 = *MEMORY[0x1E0D05A30];
        v64 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      }
      else
      {
        v64 = 0;
      }
      LODWORD(v73) = a10;
      v65 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:numberOfSecondaryFramesToSkip:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:numberOfSecondaryFramesToSkip:", a4, objc_msgSend(v17, "count"), v64, 0, a6, v76, v73);
      -[BWNode setName:](v65, "setName:", v77);
      v85.receiver = (id)v15;
      v85.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v85, sel_addNode_error_, v65, &v91) & 1) != 0)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v66 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        if (v66)
        {
          v67 = v66;
          v68 = 0;
          v69 = *(_QWORD *)v82;
          while (2)
          {
            for (j = 0; j != v67; ++j)
            {
              if (*(_QWORD *)v82 != v69)
                objc_enumerationMutation(v17);
              if (!objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v65, "inputs"), "objectAtIndexedSubscript:", (v68 + j)), 0))
              {
                v74 = v75;
                LODWORD(v73) = 0;
                goto LABEL_42;
              }
            }
            v67 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
            v68 += j;
            if (v67)
              continue;
            break;
          }
        }

        v71 = v65;
        v72 = 0;
        *(_QWORD *)(v15 + 120) = v71;
        goto LABEL_44;
      }
      v74 = v75;
      LODWORD(v73) = 0;
LABEL_42:
      FigDebugAssert3();
    }
    else
    {
      v43 = 0;
      v44 = a9;
      v36 = (int)v36;
      v38 = (int)v38;
      v45 = &off_1E4914000;
      while (1)
      {
        v80 = objc_msgSend(v17, "objectAtIndexedSubscript:", v43);
        v46 = objc_alloc_init((Class)v45[471]);
        v86.receiver = (id)v15;
        v86.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v86, sel_addNode_error_, v46, &v91) & 1) == 0)
        {
          v74 = v75;
          LODWORD(v73) = 0;
          goto LABEL_51;
        }
        objc_msgSend(v46, "setOutputWidth:", v36);
        objc_msgSend(v46, "setOutputHeight:", v38);
        objc_msgSend(v46, "setUpdatesSampleBufferMetadataForIrisVIS:", 1);
        objc_msgSend(v46, "setMaxLossyCompressionLevel:", v44);
        if (objc_msgSend(&unk_1E4A00AA0, "containsObject:", FigCaptureGetModelSpecificName()) && v43 == 1)
        {
          objc_msgSend(v46, "setCropMode:", 2);
          v47 = *(void **)(v15 + 72);
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "overscanForShiftMitigation");
          v49 = v48 + 1.0;
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "sensorOverscan");
          v51 = v49 * (v50 + 1.0);
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "overscanForShiftMitigation");
          v53 = v52 + 1.0;
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "sensorOverscan");
          v55 = v53 * (v54 + 1.0);
          v56 = objc_msgSend((id)objc_msgSend(v47, "configuration"), "videoCaptureDimensions");
          v57 = v38;
          v58 = v36;
          v59 = v44;
          v60 = v15;
          v61 = HIDWORD(v56);
          v62 = v51 * (double)(int)v56;
          LODWORD(v47) = FigCaptureRoundFloatToMultipleOf(2, v62);
          v63 = (double)(int)v61;
          v15 = v60;
          v44 = v59;
          v36 = v58;
          v38 = v57;
          v45 = &off_1E4914000;
          *(float *)&v63 = v55 * v63;
          objc_msgSend(v46, "setValidOutputDimensions:", v47 | (unint64_t)(FigCaptureRoundFloatToMultipleOf(2, *(float *)&v63) << 32));
        }
        if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", v80, objc_msgSend(v46, "input"), 0) & 1) == 0)
          break;
        objc_msgSend(v17, "setObject:atIndexedSubscript:", objc_msgSend(v46, "output"), v43++);
        if (objc_msgSend(v17, "count") <= v43)
          goto LABEL_28;
      }
      v74 = v75;
      LODWORD(v73) = 0;
LABEL_51:
      FigDebugAssert3();
      v65 = 0;
    }
    v72 = 0;
LABEL_44:
    v23 = a11;
    goto LABEL_45;
  }
  return result;
}

- (uint64_t)_connectSubjectSelectionNode:(void *)a3 videoOutputsBySourceDeviceType:(uint64_t)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v30.receiver = (id)result;
    v30.super_class = (Class)FigCaptureCameraSourcePipeline;
    v31 = 0;
    if ((objc_msgSendSuper2(&v30, sel_addNode_error_, a2, &v31) & 1) != 0)
    {
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "allValues"))
        return 4294954514;
      v10 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "count");
      if (v10 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count"))
        return 4294954514;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (void *)objc_msgSend(a3, "allKeys");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            if (!objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i)), objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "intValue"), a5)), 0))return 4294954516;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
          if (v13)
            continue;
          break;
        }
      }
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "allValues"))
        return 4294954514;
      v16 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "count");
      if (v16 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count"))
        return 4294954514;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v17 = (void *)objc_msgSend(a3, "allKeys");
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v23 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "intValue"), a5)), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v19);
      }
    }
    else
    {
      FigDebugAssert3();
    }
    result = (uint64_t)v31;
    if (v31)
      return objc_msgSend(v31, "code");
  }
  return result;
}

- (uint64_t)_connectCinematicFramingNode:(void *)a3 videoOutputsBySourceDeviceType:(void *)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:(void *)a7 cameraConfiguration:stillImageCaptureEnabled:stillImageOutputsByPortType:
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = result;
    v28.receiver = (id)result;
    v28.super_class = (Class)FigCaptureCameraSourcePipeline;
    v29 = 0;
    if ((objc_msgSendSuper2(&v28, sel_addNode_error_, a2, &v29) & 1) != 0)
    {
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "allValues"))
        return 4294954514;
      v13 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "count");
      if (v13 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count"))
        return 4294954514;
      v20 = v12;
      v21 = a7;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = (id)objc_msgSend(a3, "allKeys");
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (!objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", v18), objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(v18, "intValue"), a5)), 0))return 4294954516;
            if ((unint64_t)objc_msgSend(a4, "count") >= 2)
              objc_msgSend(a3, "setObject:forKeyedSubscript:", 0, v18);
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v15)
            continue;
          break;
        }
      }
      if (objc_msgSend(a2, "videoCaptureOutput"))
      {
        v19 = objc_msgSend(a2, "videoCaptureOutput");
        objc_msgSend(a3, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "sourceDeviceType")));
        objc_msgSend(a2, "setClientApplicationID:", objc_msgSend(*(id *)(v20 + 360), "applicationID"));
        objc_msgSend(a2, "setCinematicFramingControlMode:", objc_msgSend(v21, "cinematicFramingControlMode"));
        objc_msgSend(*(id *)(v20 + 136), "setObject:forKeyedSubscript:", a2, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "sourceDeviceType")));
      }
    }
    else
    {
      FigDebugAssert3();
    }
    result = (uint64_t)v29;
    if (v29)
      return objc_msgSend(v29, "code");
  }
  return result;
}

- (uint64_t)_insertSubjectSelectionAndCinematicFramingNodesOnOutputsBySourceDeviceType:(uint64_t)a1 connectionConfigurations:(void *)a2 pipelineConfiguration:(void *)a3 cameraInfoByPortType:(uint64_t)a4 graph:(uint64_t)a5 stillImageCaptureEnabled:(void *)a6 stillImageOutputsByPortType:(unsigned int)a7
{
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  int v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  BWSubjectSelectionNode *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BWSubjectSelectionNode *v34;
  uint64_t v35;
  BWSubjectSelectionNode *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, const __CFString *, uint64_t, id *);
  id v41;
  int v42;
  int v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  const void *v51;
  int v52;
  int v53;
  int v54;
  int v55;
  double v56;
  double v57;
  uint64_t v58;
  void (*v59)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  void *v60;
  uint64_t v61;
  void *v62;
  BWCinematicFramingNode *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BWCinematicFramingNode *v67;
  BWCinematicFramingNode *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  char v77;
  char v78;
  char CinematicFramingFieldOfViewRestrictedToWide;
  uint64_t v80;
  int v81;
  id obj;
  id obja;
  char v86;
  uint64_t v87;
  int CenterStageFramingMode;
  unsigned int v89;
  CFTypeRef cf[5];
  int v94;
  int v95;
  int v96;
  int v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  int v105;
  char v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  _BYTE v121[128];
  uint64_t v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = a4;
    if (a4)
      v9 = *(void **)(a4 + 184);
    else
      v9 = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v11 = *(void **)(a1 + 56);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v117 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "portType"));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
      }
      while (v13);
    }
    v16 = objc_msgSend(v10, "count");
    if (v16 != objc_msgSend((id)objc_msgSend(a2, "allKeys"), "count"))
      return 4294954510;
    v17 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, objc_msgSend(v9, "sourceDeviceType"));
    v89 = -[FigCaptureCameraSourcePipeline _getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:](a1, v17);
    if (FigCapturePlatformSupportsUniversalLossyCompression())
      v81 = csp_maxLossyCompressionLevelForConnectionConfigurations(v17, (unsigned int *)v7);
    else
      v81 = 0;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    if (v7)
      v7 = *(_QWORD *)(v7 + 240);
    v18 = objc_msgSend((id)v7, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v113;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v113 != v20)
            objc_enumerationMutation((id)v7);
          v22 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
          v23 = objc_msgSend((id)objc_msgSend(v22, "sourceConfiguration"), "sourceDeviceType");
          if (v23 == objc_msgSend(v9, "sourceDeviceType"))
          {
            v80 = objc_msgSend(v22, "metadataIdentifiers");
            goto LABEL_27;
          }
        }
        v19 = objc_msgSend((id)v7, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
        if (v19)
          continue;
        break;
      }
    }
    v80 = 0;
LABEL_27:
    CenterStageFramingMode = csp_getCenterStageFramingMode(objc_msgSend(v9, "source"));
    v24 = a1;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "captureStreams"), "count") != 1)
    {
      FigDebugAssert3();
      return 4294954516;
    }
    v87 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "captureStream"), "geometricDistortionCoefficients");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "captureStream"), "calibrationValidRadiusForFullFieldOfView"), "floatValue");
    if (v25 <= 0.0)
      v86 = BWDeviceIsiPad();
    else
      v86 = 1;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = (id)objc_msgSend(a2, "allKeys");
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v109;
      while (2)
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(obj);
          v122 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
          v30 = [BWSubjectSelectionNode alloc];
          v31 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "cinematicFramingOutputDimensions");
          v32 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "horizontalSensorBinningFactor");
          v33 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "verticalSensorBinningFactor");
          LOBYTE(v73) = objc_msgSend(v9, "gazeSelectionEnabled");
          HIDWORD(v72) = CenterStageFramingMode;
          BYTE1(v72) = v86;
          LOBYTE(v72) = v87 != 0;
          v34 = -[BWSubjectSelectionNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:portTypes:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageFramingMode:gazeSelectionEnabled:](v30, "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:portTypes:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageFramingMode:gazeSelectionEnabled:", v31, a5, v32, v33, v89, v10, v72, v73);
          if (!v34)
          {
            FigDebugAssert3();
            return 0;
          }
          v36 = v34;
          v24 = a1;
          v37 = -[FigCaptureCameraSourcePipeline _connectSubjectSelectionNode:videoOutputsBySourceDeviceType:sourceDeviceTypes:portTypes:graph:](a1, v34, a2, v35, v10, a6);
          if ((_DWORD)v37)
          {
            v70 = v37;
LABEL_69:
            FigDebugAssert3();
            return v70;
          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
        if (v27)
          continue;
        break;
      }
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(*(id *)(v24 + 360), "setSubjectSelectionDelegate:", v36);
    CinematicFramingFieldOfViewRestrictedToWide = csp_getCinematicFramingFieldOfViewRestrictedToWide(objc_msgSend(v9, "source"));
    v107 = 0;
    v38 = objc_msgSend(v9, "source");
    v39 = *MEMORY[0x1E0C9AE00];
    v40 = *(void (**)(uint64_t, const __CFString *, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
    if (v40)
    {
      v40(v38, CFSTR("VideoZoomFactor"), v39, &v107);
      v41 = v107;
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(v41, "floatValue");
    v43 = v42;

    v106 = 0;
    v105 = 0;
    csp_getCenterStageRectOfInterest(objc_msgSend(v9, "source"));
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v78 = objc_msgSend(v9, "cinematicFramingEnabled");
    objc_msgSend(v9, "manualFramingPanningAngleX");
    v53 = v52;
    objc_msgSend(v9, "manualFramingPanningAngleY");
    v55 = v54;
    objc_msgSend(v9, "manualFramingDefaultZoomFactor");
    v57 = v56;
    LODWORD(v56) = 1.0;
    objc_msgSend(*(id *)(v24 + 360), "setZoomFactor:", v56);
    v58 = objc_msgSend(v9, "source");
    cf[0] = 0;
    v59 = *(void (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
    if (v59)
    {
      v59(v58, CFSTR("CenterStageMetadataDeliveryEnabled"), v39, cf);
      v60 = (void *)cf[0];
    }
    else
    {
      v60 = 0;
    }
    v77 = objc_msgSend(v60, "BOOLValue");
    if (cf[0])
      CFRelease(cf[0]);
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v75 = (id)objc_msgSend(a2, "allKeys");
    obja = (id)objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    if (obja)
    {
      v76 = *(_QWORD *)v102;
LABEL_52:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v102 != v76)
          objc_enumerationMutation(v75);
        v120 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v61);
        v62 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
        v63 = [BWCinematicFramingNode alloc];
        v64 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "cinematicFramingOutputDimensions");
        v65 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "horizontalSensorBinningFactor");
        v66 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "verticalSensorBinningFactor");
        LOBYTE(cf[0]) = v78;
        BYTE1(cf[0]) = 1;
        BYTE2(cf[0]) = CinematicFramingFieldOfViewRestrictedToWide;
        *(_DWORD *)((char *)cf + 3) = v105;
        HIBYTE(cf[0]) = v106;
        cf[1] = v45;
        cf[2] = v47;
        cf[3] = v49;
        cf[4] = v51;
        v94 = CenterStageFramingMode;
        v95 = v43;
        v96 = v53;
        v97 = v55;
        v98 = v57;
        v99 = 0;
        v100 = 0;
        BYTE2(v74) = v77;
        BYTE1(v74) = v86;
        LOBYTE(v74) = v87 != 0;
        LODWORD(v73) = v81;
        v67 = -[BWCinematicFramingNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portTypes:cinematicFramingControls:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageMetadataDeliveryEnabled:pipelineType:](v63, "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portTypes:cinematicFramingControls:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageMetadataDeliveryEnabled:pipelineType:", v64, a5, v65, v66, v89, a7, v80, v73, v10, cf, v74, 0);
        if (!v67)
          return 4294954510;
        v68 = v67;
        v24 = a1;
        objc_msgSend(*(id *)(a1 + 360), "setManualCinematicFramingDelegate:", v67);
        if (a7)
          *(_QWORD *)(a1 + 432) = v68;
        v69 = -[FigCaptureCameraSourcePipeline _connectCinematicFramingNode:videoOutputsBySourceDeviceType:sourceDeviceTypes:portTypes:graph:cameraConfiguration:stillImageCaptureEnabled:stillImageOutputsByPortType:](a1, v68, a2, v62, v10, a6, v9);
        if ((_DWORD)v69)
        {
          v70 = v69;
          goto LABEL_69;
        }
        if (obja == (id)++v61)
        {
          obja = (id)objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
          if (obja)
            goto LABEL_52;
          goto LABEL_63;
        }
      }
    }
    v68 = 0;
LABEL_63:
    objc_msgSend(*(id *)(v24 + 360), "setCenterStageDelegate:", v68);
  }
  return 0;
}

- (uint64_t)_insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 outputNetworkType:(int)a7 numberOfSecondaryFramesToSkip:
{
  void *v11;
  id v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  int v17;
  _BOOL4 v18;
  unint64_t v19;
  uint64_t v20;
  float v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  BWFanOutNode *v35;
  __CFString *v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  unsigned int v54;
  uint64_t v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  unsigned int v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v57 = result;
  if (!result)
    return result;
  v73 = 0;
  v72 = 0;
  if (a4)
  {
    if (*(_DWORD *)(a4 + 28) == 3)
      goto LABEL_89;
    v11 = *(void **)(a4 + 184);
  }
  else
  {
    v11 = 0;
  }
  v54 = objc_msgSend(v11, "sourceDeviceType");
  v12 = (id)objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3), "mutableCopy");
  if (a4)
    v13 = *(void **)(a4 + 192);
  else
    v13 = 0;
  v14 = objc_msgSend((id)objc_msgSend(v13, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  if (a4)
    v15 = *(_BYTE *)(a4 + 302) != 0;
  else
    v15 = 0;
  *(_BYTE *)(v57 + 448) = 0;
  v16 = objc_msgSend(*(id *)(v57 + 360), "isBravoVariant");
  v17 = 0;
  v18 = 0;
  if (v16)
  {
    v19 = objc_msgSend(a2, "count");
    v20 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, v54), "count");
    v17 = 0;
    v18 = 0;
    if (v19 >= 2)
    {
      if (v20)
      {
        if (a4)
          v21 = *(float *)(a4 + 148);
        else
          v21 = 0.0;
        v22 = v21 == 0.0 || a6 == 2;
        v18 = !v22;
        v23 = v14 ^ 1;
        if (!v22)
          v23 = 1;
        if (((v15 | v23) & 1) != 0)
          goto LABEL_29;
        if (a6)
        {
          v24 = v57;
          if (a6 != 1)
          {
LABEL_28:
            v18 = *(_BYTE *)(v24 + 448) != 0;
LABEL_29:
            v17 = !v18;
            goto LABEL_30;
          }
          v25 = *(_BYTE *)(v57 + 40);
        }
        else
        {
          v25 = 1;
          v24 = v57;
        }
        *(_BYTE *)(v24 + 448) = v25;
        goto LABEL_28;
      }
    }
  }
LABEL_30:
  if (!a4 || !*(_BYTE *)(a4 + 346))
  {
    if (!v17)
    {
      if (v18)
      {
        if (a4)
          v38 = *(_DWORD *)(a4 + 28) != 0;
        else
          v38 = 0;
        if (FigCapturePlatformSupportsUniversalLossyCompression())
          v39 = csp_maxLossyCompressionLevelForConnectionConfigurations(a3, (unsigned int *)a4);
        else
          v39 = 0;
        if (a4)
        {
          objc_msgSend(*(id *)(a4 + 192), "previewDepthFilterRenderingEnabled");
          v46 = *(_BYTE *)(a4 + 344) != 0;
          v47 = *(_BYTE *)(a4 + 345) != 0;
        }
        else
        {
          objc_msgSend(0, "previewDepthFilterRenderingEnabled");
          v46 = 0;
          v47 = 0;
        }
        objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _addOverCaptureSourcePipelineToGraph:upstreamVideoCaptureOutputsBySourceDeviceType:depthEnabled:depthFilterRenderingEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:forPreview:maxLossyCompressionLevel:numberOfSecondaryFramesToSkip:outErr:](v57, a5, a2, v38, 0, v46, v47, a6 == 0, v39, a7, &v73), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v54));
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v48 = (void *)objc_msgSend(a2, "allKeys");
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v64 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
              if (objc_msgSend(v53, "intValue") != v54)
                objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v53);
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          }
          while (v50);
        }
      }
      else
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v40 = (void *)objc_msgSend(a2, "allKeys");
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v60 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
              if ((objc_msgSend(v12, "containsObject:", v45) & 1) == 0)
                objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v45);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
          }
          while (v42);
        }
      }
      goto LABEL_89;
    }
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = (id)objc_msgSend(a2, "allKeys");
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v69 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
          if (objc_msgSend(v12, "containsObject:", v34))
          {
            v35 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
            v67.receiver = (id)v57;
            v67.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v67, sel_addNode_error_, v35, &v72) & 1) == 0
              || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v34), -[BWNode input](v35, "input"), 0) & 1) == 0)
            {
              goto LABEL_88;
            }
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v35, "outputs"), "objectAtIndexedSubscript:", 0), v34);
            objc_msgSend(v29, "addObject:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v35, "outputs"), "objectAtIndexedSubscript:", 1));
          }
          else
          {
            objc_msgSend(v29, "addObject:", objc_msgSend(a2, "objectForKeyedSubscript:", v34));
            objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, v34);
          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v31);
    }
    if (a6 > 2)
      v36 = 0;
    else
      v36 = off_1E49223D8[a6];
    objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _addCrossOverNodeToGraph:outputNetworkType:inputs:mediaType:name:outErr:](v57, a5, a6, v29, 1986618469, (uint64_t)v36, &v73), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v54));
    if (!v73)
      goto LABEL_89;
LABEL_88:
    FigDebugAssert3();
    goto LABEL_89;
  }
  if (!a6 || a6 == 2)
  {
    v37 = objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E49F9BB8);
    objc_msgSend(a2, "setObject:forKeyedSubscript:", v37, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v54));
    goto LABEL_89;
  }
  if (a6 == 1)
  {
    if (!objc_msgSend(*(id *)(v57 + 360), "isBravoVariant"))
      goto LABEL_88;
    if (!objc_msgSend(a2, "objectForKey:", &unk_1E49F9BB8))
      goto LABEL_88;
    if (!objc_msgSend(a2, "objectForKey:", &unk_1E49F9BE8))
      goto LABEL_88;
    if (objc_msgSend(a2, "count") != 2)
      goto LABEL_88;
    v26 = objc_msgSend(a2, "objectForKey:", &unk_1E49F9BE8);
    v27 = objc_msgSend(a2, "objectForKey:", &unk_1E49F9BB8);
    objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _stereoVideoAddSlaveFrameSynchronizerNode:input1:input2:mediaType:name:outErr:](v57, a5, v26, v27, v28, (uint64_t)CFSTR("Back Wide S-Wide sync node"), &v73), &unk_1E49F9C18);
    objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, &unk_1E49F9BB8);
    objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, &unk_1E49F9BE8);
    if (v73)
      goto LABEL_88;
  }
LABEL_89:
  result = v73;
  if (!v73)
  {
    if (v72)
      return objc_msgSend(v72, "code");
  }
  return result;
}

- (id)_insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:(void *)a3 ifAllowedByAdditionalPreviewConnectionConfigurations:(void *)a4 semanticMasksOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:
{
  id *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  _BOOL4 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BWSmartStyleLearningNode *v28;
  uint64_t v29;
  BWSmartStyleLearningNode *v30;
  BWSmartStyleLearningNode *v31;
  uint64_t v32;
  uint64_t v33;
  BWFanOutNode *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  objc_super v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = result;
    v51 = 0;
    v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (a5)
      v10 = *(void **)(a5 + 184);
    else
      v10 = 0;
    if ((objc_msgSend(v10, "cinematicFramingEnabled") & 1) != 0)
    {
      v11 = 2;
    }
    else
    {
      v12 = objc_msgSend(v10, "manualCinematicFramingEnabled");
      v11 = 2;
      if (!v12)
        v11 = 3;
    }
    v41 = v11;
    if (a5)
    {
      if (*(_BYTE *)(a5 + 321))
      {
        v43 = objc_msgSend((id)objc_msgSend(*(id *)(a5 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
        if (*(_BYTE *)(a5 + 321))
        {
          v13 = *(void **)(a5 + 200);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v53;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v53 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "sinkType") == 14
                  && objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "subType") == 3)
                {
                  v19 = 1;
                  goto LABEL_23;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
              if (v15)
                continue;
              break;
            }
            v19 = 0;
LABEL_23:
            v43 |= v19;
          }
        }
      }
      else
      {
        v43 = 0;
      }
      v20 = (*(_DWORD *)(a5 + 180) - 4) < 0xFFFFFFFD;
    }
    else
    {
      v43 = 0;
      v20 = 1;
    }
    v40 = v20;
    v21 = (id)objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3), "copy");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      v37 = a5;
      v38 = *(_QWORD *)v48;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(a2);
          v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v25);
          v27 = objc_msgSend(v9[57], "objectForKeyedSubscript:", v26);
          if ((objc_msgSend(v21, "containsObject:", v26) & 1) == 0 && !v27)
          {
            v28 = [BWSmartStyleLearningNode alloc];
            if (a5 && *(_BYTE *)(a5 + 264))
              v29 = objc_msgSend((id)objc_msgSend(*(id *)(a5 + 184), "requiredFormat"), "isPhotoFormat");
            else
              v29 = 0;
            v30 = -[BWSmartStyleLearningNode initWithOutputs:masksRefinerEnabled:propagateMasks:](v28, "initWithOutputs:masksRefinerEnabled:propagateMasks:", v41, v29, v43);
            if (!v30)
              goto LABEL_55;
            v31 = v30;
            -[BWNode setName:](v30, "setName:", CFSTR("Source SmartStyle Learning"));
            if (a5)
            {
              -[BWSmartStyleLearningNode setDisableWaitForCoefficientsOnFirstFrame:](v31, "setDisableWaitForCoefficientsOnFirstFrame:", *(unsigned __int8 *)(a5 + 336));
              -[BWSmartStyleLearningNode setSubjectRelightingEnabled:](v31, "setSubjectRelightingEnabled:", v40);
              -[BWSmartStyleLearningNode setCameraInfoByPortType:](v31, "setCameraInfoByPortType:", objc_msgSend(v9[45], "cameraInfoByPortType"));
              v32 = *(_QWORD *)(a5 + 328);
            }
            else
            {
              -[BWSmartStyleLearningNode setDisableWaitForCoefficientsOnFirstFrame:](v31, "setDisableWaitForCoefficientsOnFirstFrame:", 0);
              -[BWSmartStyleLearningNode setSubjectRelightingEnabled:](v31, "setSubjectRelightingEnabled:", v40);
              -[BWSmartStyleLearningNode setCameraInfoByPortType:](v31, "setCameraInfoByPortType:", objc_msgSend(v9[45], "cameraInfoByPortType"));
              v32 = 0;
            }
            -[BWSmartStyleLearningNode setSmartStyle:](v31, "setSmartStyle:", v32);
            v46.receiver = v9;
            v46.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v46, sel_addNode_error_, v31, &v51) & 1) == 0
              || (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v26), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v31, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (v33 = objc_msgSend(a4, "objectForKeyedSubscript:", v26)) != 0&& (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", v33, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v31, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
            {
LABEL_54:
              FigDebugAssert3();
              goto LABEL_55;
            }
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v31, v26);
            if (objc_msgSend(v9[58], "objectForKeyedSubscript:", v26))
            {
              v34 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
              -[BWNode setName:](v34, "setName:", CFSTR("SmartStyle Preview/Capture FanOut"));
              v45.receiver = v9;
              v45.super_class = (Class)FigCaptureCameraSourcePipeline;
              if ((objc_msgSendSuper2(&v45, sel_addNode_error_, v34, &v51) & 1) == 0)
                goto LABEL_54;
              if ((objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", -[BWNode output](v31, "output"), -[BWNode input](v34, "input"), 0) & 1) == 0)goto LABEL_54;
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v34, "outputs"), "objectAtIndexedSubscript:", 0), v26);
              v35 = objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v34, "outputs"), "objectAtIndexedSubscript:", 1), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9[58], "objectForKeyedSubscript:", v26), "inputs"), "objectAtIndexedSubscript:", 1), 0);
              a5 = v37;
              v24 = v38;
              if ((v35 & 1) == 0)
                goto LABEL_54;
            }
            else
            {
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[BWNode output](v31, "output"), v26);
              v24 = v38;
            }
          }
          ++v25;
        }
        while (v23 != v25);
        v36 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        v23 = v36;
      }
      while (v36);
    }
    objc_msgSend(v9[57], "addEntriesFromDictionary:", v42);
LABEL_55:
    result = v51;
    if (v51)
      return (id *)objc_msgSend(v51, "code");
  }
  return result;
}

- (id)_insertSmartStyleMetadataSynchronizerNodeOnOutputsBySourceDeviceType:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  id *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BWMetadataSynchronizerNode *v13;
  uint64_t v14;
  uint64_t v15;
  BWMetadataSynchronizerNode *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id *v33;
  _QWORD v34[6];
  uint64_t v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v33 = 0;
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (a3 && *(_BYTE *)(a3 + 321))
      v7 = objc_msgSend((id)objc_msgSend(*(id *)(a3 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
    else
      v7 = 0;
    v25 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v7);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      v22 = *MEMORY[0x1E0D060B0];
      v23 = *MEMORY[0x1E0D05D88];
      v20 = *MEMORY[0x1E0D060F8];
      v21 = *MEMORY[0x1E0D060E0];
      v19 = *MEMORY[0x1E0D06100];
      v18 = *MEMORY[0x1E0D060D0];
      v17 = *MEMORY[0x1E0D060C0];
      while (2)
      {
        v11 = 0;
        v27 = v9;
        do
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(a2);
          v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
          if (!objc_msgSend(v6[57], "objectForKeyedSubscript:", v12))
          {
            v13 = [BWMetadataSynchronizerNode alloc];
            v36 = v25;
            v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
            v35 = v23;
            v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
            v34[0] = v22;
            v34[1] = v21;
            v34[2] = v20;
            v34[3] = v19;
            v34[4] = v18;
            v34[5] = v17;
            v16 = -[BWMetadataSynchronizerNode initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:](v13, "initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", v14, v15, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6), 0, 0);
            -[BWNode setName:](v16, "setName:", CFSTR("SmartStyle AttachedMedia Synchronizer"));
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, v12);
            v28.receiver = v6;
            v28.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v28, sel_addNode_error_, v16, &v33) & 1) == 0
              || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v12), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
            {
              FigDebugAssert3();
              goto LABEL_18;
            }
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v16, "outputs"), "objectAtIndexedSubscript:", 0), v12);
            v9 = v27;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v9)
          continue;
        break;
      }
    }
    objc_msgSend(v6[58], "addEntriesFromDictionary:", v26);
LABEL_18:
    result = v33;
    if (v33)
      return (id *)objc_msgSend(v33, "code");
  }
  return result;
}

- (void)visOverscanPredictor:(id)a3 allowsReducedOverscan:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *sourceNodes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_powerOptimizedVISOverscanEnabled != a4)
  {
    v4 = a4;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    sourceNodes = self->_sourceNodes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(sourceNodes);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setPowerOptimizedVISOverscanEnabled:", v4);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sourceNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
    self->_powerOptimizedVISOverscanEnabled = v4;
  }
}

- (uint64_t)captureSourceDepthDataFormat
{
  if (result)
    return *(_QWORD *)(result + 384);
  return result;
}

- (uint64_t)maxFrameRateClientOverride
{
  if (result)
    return *(unsigned int *)(result + 420);
  return result;
}

- (BOOL)trueVideoCaptureEnabled
{
  if (result)
    return *(_BYTE *)(result + 472) != 0;
  return result;
}

- (BOOL)preLTMThumbnailEnabled
{
  if (result)
    return *(_BYTE *)(result + 473) != 0;
  return result;
}

- (BOOL)postColorProcessingThumbnailEnabled
{
  if (result)
    return *(_BYTE *)(result + 474) != 0;
  return result;
}

- (uint64_t)cinematicFramingCameraStatesProvider
{
  if (result)
    return *(_QWORD *)(result + 432);
  return result;
}

@end
