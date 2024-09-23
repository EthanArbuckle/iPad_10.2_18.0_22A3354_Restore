@implementation FigCaptureMovieFileSinkMiddlePipeline

- (uint64_t)_buildMovieFileSinkExtendedCVISMiddleWithConfiguration:(void *)a3 graph:(id *)a4 parentPipeline:(void *)a5 headPipeline:(void *)a6 captureDevice:(uint64_t)a7 workgroup:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  FigCaptureVISPipeline *v17;
  int v18;
  uint64_t v19;
  _BOOL4 v20;
  FigCaptureVISPipeline *v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  BWPipelineStage *v26;
  unsigned int v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  char v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  void *v33;
  char *v34;
  _BOOL4 v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  BWAttachedMediaSwapNode *v41;
  BWAttachedMediaSwapNode *v42;
  BWAttachedMediaSwapNode *v43;
  uint64_t v44;
  int v45;
  int v46;
  char *v47;
  uint64_t v48;
  BOOL v49;
  BWAttachedMediaSwapNode *v50;
  BWAttachedMediaSwapNode *v51;
  BWOverCaptureAttachedMediaSplitNode *v52;
  BWOverCaptureFanOutNode *v53;
  uint64_t v54;
  BWOverCaptureFanOutNode *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  char v60;
  __CFString *v61;
  uint64_t v64;
  BWPipelineStage *v65;
  id v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = result;
    v66 = 0;
    v12 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
    v13 = objc_msgSend(a2, "movieFilePipelineStage");
    v65 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", CFSTR("com.apple.coremedia.capture.moviefile.middle"), 14, a7);
    v14 = objc_msgSend(*(id *)(v11 + 72), "videoOutput");
    if (!v14)
      goto LABEL_54;
    v15 = v14;
    if (v12)
    {
      v16 = *(__CFString **)(v12 + 16);
      if (+[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, *(_DWORD *)(v12 + 104))|| *(_BYTE *)(v12 + 122))
      {
LABEL_6:
        v61 = v16;
        v64 = objc_msgSend((id)objc_msgSend(a5, "irisStagingNode"), "motionDataTimeMachine");
        v60 = -[__CFString isEqualToString:](mfsp_avVideoCodec(v16), "isEqualToString:", CFSTR("hvc1"));
        if (v12 && *(_BYTE *)(v12 + 122))
        {
          v17 = [FigCaptureVISPipeline alloc];
          v18 = 1;
          v59 = 4;
        }
        else
        {
          if (a4)
            v19 = objc_msgSend(a4[7], "irisStagingNode");
          else
            v19 = 0;
          v20 = v19 != 0;
          v17 = [FigCaptureVISPipeline alloc];
          v59 = v20;
          if (!v12)
          {
            v21 = v17;
            v57 = 0;
            v58 = 0;
            v23 = 0;
            v22 = 0.0;
LABEL_14:
            v24 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
            if (v24)
              v25 = *(_QWORD *)(v24 + 96);
            else
              v25 = 0;
            v26 = v65;
            if (v12)
            {
              v27 = *(_DWORD *)(v12 + 144);
              v28 = *(_BYTE *)(v12 + 148) != 0;
              v29 = *(_BYTE *)(v12 + 149) != 0;
              v30 = *(_BYTE *)(v12 + 184) != 0;
              v31 = *(_BYTE *)(v12 + 187) != 0;
              v32 = *(_BYTE *)(v12 + 188) != 0;
              v33 = *(void **)(v12 + 128);
            }
            else
            {
              v32 = 0;
              v30 = 0;
              v28 = 0;
              v27 = 0;
              v29 = 0;
              v31 = 0;
              v33 = 0;
            }
            v34 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v21, v15, a3, v22, (uint64_t)CFSTR("Middle Over-Capture VIS Pipeline Transforms"), a4, v61, v65, 0, HIDWORD(v58), v58, v60, SBYTE4(v57), 0, v23, v64 != 0, v59, 0x50u, a6,
                    v25,
                    0,
                    0,
                    0,
                    v27,
                    v28,
                    v29,
                    v30,
                    0,
                    v31,
                    v32,
                    0,
                    v33);
            *(_QWORD *)(v11 + 32) = v34;
            if (v34)
            {
              if (v12)
                v35 = *(_BYTE *)(v12 + 138) != 0;
              else
                v35 = 0;
              v36 = (v57 | v35) ^ 1;
              if (v64)
                v37 = v36;
              else
                v37 = 0;
              objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v34), "setGeneratesDroppedSampleMarkerBuffers:", v37);
              if (v64)
              {
                v38 = objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v11 + 32)), "cinematicLookAheadFrameCount");
                v39 = (void *)objc_msgSend(a5, "fileCoordinatorNode");
                v40 = v38;
                v26 = v65;
                objc_msgSend(v39, "setCinematicLookAheadFrameCount:", v40);
              }
              v15 = objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v11 + 32)), "output");
              if (!v12 || !*(_BYTE *)(v12 + 138))
                goto LABEL_45;
              v41 = [BWAttachedMediaSwapNode alloc];
              v67[0] = *MEMORY[0x1E0D08890];
              v42 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:](v41, "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", 0x1E492C078, CFSTR("SynchronizedSlaveFrame"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1), 0);
              if (!v42)
                goto LABEL_70;
              v43 = v42;
              -[BWNode setName:](v42, "setName:", CFSTR("Swap Primary and Synchronized Slave"));
              if ((objc_msgSend(a4, "addNode:error:", v43, &v66) & 1) == 0
                || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v15, -[BWNode input](v43, "input"), v65) & 1) == 0)
              {
                goto LABEL_70;
              }
              v44 = -[BWNode output](v43, "output");
              v45 = *(unsigned __int8 *)(v12 + 122);
              if (*(_BYTE *)(v12 + 122))
                v46 = 4;
              else
                v46 = 2;
              v56 = v46;
              v26 = v65;
              v47 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:]([FigCaptureVISPipeline alloc], v44, a3, *(float *)(v12 + 156), (uint64_t)CFSTR("Middle Over-Capture VIS Pipeline Synchronized Slave Transforms"), a4, v61, v65, 0, *(_DWORD *)(v12 + 104), *(_DWORD *)(v12 + 112), v60, *(_BYTE *)(v12 + 138), 0, *(_DWORD *)(v12 + 160), 0, v56, 0x50u, a6,
                      *(_QWORD *)(v12 + 96),
                      0,
                      0,
                      0,
                      *(_DWORD *)(v12 + 144),
                      *(_WORD *)(v12 + 148),
                      HIBYTE(*(_WORD *)(v12 + 148)),
                      *(_BYTE *)(v12 + 184),
                      0,
                      *(_WORD *)(v12 + 187),
                      HIBYTE(*(_WORD *)(v12 + 187)),
                      0,
                      *(void **)(v12 + 128));
              *(_QWORD *)(v11 + 48) = v47;
              if (v47)
              {
                v48 = objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v47), "output");
                if (v64)
                  v49 = v45 == 0;
                else
                  v49 = 0;
                v37 = v49;
                v50 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:]([BWAttachedMediaSwapNode alloc], "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", CFSTR("SynchronizedSlaveFrame"), 0x1E492C078, 0, v37);
                if (!v50)
                  goto LABEL_70;
                v51 = v50;
                -[BWNode setName:](v50, "setName:", CFSTR("Unswap Primary and Synchronized Slave"));
                if ((objc_msgSend(a4, "addNode:error:", v51, &v66) & 1) == 0
                  || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v48, -[BWNode input](v51, "input"), v65) & 1) == 0)
                {
                  goto LABEL_70;
                }
                v15 = -[BWNode output](v51, "output");
LABEL_45:
                if (!a4)
                  goto LABEL_47;
                goto LABEL_46;
              }
            }
            FigDebugAssert3();
            result = FigSignalErrorAt();
            if ((_DWORD)result)
              return result;
            goto LABEL_67;
          }
          v18 = 0;
        }
        v21 = v17;
        LODWORD(v57) = v18;
        LODWORD(v58) = *(_DWORD *)(v12 + 112);
        HIDWORD(v58) = *(_DWORD *)(v12 + 104);
        BYTE4(v57) = *(_BYTE *)(v12 + 138) != 0;
        v22 = *(float *)(v12 + 156);
        v23 = *(_DWORD *)(v12 + 160);
        goto LABEL_14;
      }
    }
    else if (+[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, 0))
    {
      v16 = 0;
      goto LABEL_6;
    }
    v37 = 0;
    v26 = v65;
    if (!a4)
    {
LABEL_47:
      if (v12 && *(_BYTE *)(v12 + 138))
      {
        v52 = -[BWOverCaptureAttachedMediaSplitNode initWithBackPressureExtraRetainBufferCount:]([BWOverCaptureAttachedMediaSplitNode alloc], "initWithBackPressureExtraRetainBufferCount:", 0);
      }
      else
      {
        v52 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 1, 1986618469);
        -[BWNode setName:](v52, "setName:", CFSTR("Just Here To Drop Tagged Buffers"));
      }
      -[BWNodeInput setDiscardsSampleDataTaggedToBeDropped:](-[BWNode input](v52, "input"), "setDiscardsSampleDataTaggedToBeDropped:", v37);
      if ((objc_msgSend(a4, "addNode:error:", v52, 0) & 1) == 0
        || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v15, -[BWNode input](v52, "input"), v26) & 1) == 0)
      {
        goto LABEL_70;
      }
      *(_QWORD *)(v11 + 40) = v52;
LABEL_54:
      if (objc_msgSend(*(id *)(v11 + 72), "audioOutput") && *(_QWORD *)(v11 + 80) >= 2uLL)
      {
        v53 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWOverCaptureFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1936684398);
        if ((objc_msgSend(a4, "addNode:error:", v53, 0) & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(*(id *)(v11 + 72), "audioOutput"), -[BWNode input](v53, "input"), v13) & 1) == 0)
        {
          goto LABEL_70;
        }
        *(_QWORD *)(v11 + 56) = v53;
      }
      result = objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count");
      if (!result)
        goto LABEL_67;
      if (*(_QWORD *)(v11 + 80) < 2uLL)
        goto LABEL_66;
      *(_QWORD *)(v11 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count"));
      result = objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count");
      if (!result)
        goto LABEL_67;
      v54 = 0;
      while (1)
      {
        v55 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWOverCaptureFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1835365473);
        if ((objc_msgSend(a4, "addNode:error:", v55, 0) & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "objectAtIndexedSubscript:", v54), -[BWNode input](v55, "input"), v13) & 1) == 0)
        {
          break;
        }
        objc_msgSend(*(id *)(v11 + 64), "addObject:", v55);
        if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count") <= (unint64_t)++v54)
          goto LABEL_66;
      }
LABEL_70:
      FigDebugAssert3();
LABEL_66:
      result = 0;
LABEL_67:
      if (v66)
        return objc_msgSend(v66, "code");
      return result;
    }
LABEL_46:
    objc_msgSend(a4[7], "irisStagingNode");
    goto LABEL_47;
  }
  return result;
}

- (FigCaptureVISPipeline)visPipeline
{
  return self->_visPipeline;
}

- (id)videoOutputForTailIndex:(unint64_t)a3
{
  if (self->_videoFanOut)
    return -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self->_videoFanOut, "outputs"), "objectAtIndexedSubscript:", a3);
  else
    return -[FigCaptureMovieFileSinkHeadPipeline videoOutput](self->_headPipeline, "videoOutput", a3);
}

- (id)metadataOutputsForTailIndex:(unint64_t)a3
{
  NSMutableArray *metadataFanOuts;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  metadataFanOuts = self->_metadataFanOuts;
  if (!metadataFanOuts)
    return -[FigCaptureMovieFileSinkHeadPipeline metadataOutputs](self->_headPipeline, "metadataOutputs", a3);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](metadataFanOuts, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_metadataFanOuts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "outputs"), "objectAtIndexedSubscript:", a3));
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  return v6;
}

- (FigCaptureMovieFileSinkMiddlePipeline)initWithConfiguration:(id)a3 graph:(id)a4 parentPipeline:(id)a5 headPipeline:(id)a6 captureDevice:(id)a7 workgroup:(id)a8
{
  FigCaptureMovieFileSinkMiddlePipeline *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _BOOL4 v19;
  uint64_t v20;
  char v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FigCaptureMovieFileSinkMiddlePipeline;
  v14 = -[FigCapturePipeline initWithGraph:name:](&v23, sel_initWithGraph_name_, a4, CFSTR("Middle Pipeline"));
  if (!v14)
    return v14;
  v15 = objc_msgSend(a3, "movieFileSinkPipelineConfiguration");
  if (v15)
  {
    v16 = 1;
    if (*(_BYTE *)(v15 + 138))
      v16 = 2;
  }
  else
  {
    v16 = 1;
  }
  v14->_numberOfTailsToSupport = v16;
  v17 = (_QWORD *)objc_msgSend(a3, "movieFileSinkPipelineConfiguration");
  if (v17)
    v17 = (_QWORD *)v17[2];
  if (objc_msgSend(v17, "irisVISMethod") == 3)
    goto LABEL_11;
  v18 = (_QWORD *)objc_msgSend(a3, "movieFileSinkPipelineConfiguration");
  if (v18)
    v18 = (_QWORD *)v18[2];
  if (objc_msgSend(v18, "irisVISMethod") == 5)
LABEL_11:
    v19 = v14->_numberOfTailsToSupport == 1;
  else
    v19 = 0;
  v14->_headPipeline = (FigCaptureMovieFileSinkHeadPipeline *)a6;
  v20 = objc_msgSend(a3, "movieFileSinkPipelineConfiguration");
  if (!v20)
  {
    if (!v19)
      return v14;
    goto LABEL_18;
  }
  if (*(_BYTE *)(v20 + 138))
    v21 = 1;
  else
    v21 = v19;
  if ((v21 & 1) != 0)
  {
LABEL_18:
    if (-[FigCaptureMovieFileSinkMiddlePipeline _buildMovieFileSinkExtendedCVISMiddleWithConfiguration:graph:parentPipeline:headPipeline:captureDevice:workgroup:]((uint64_t)v14, a3, a4, (id *)a5, a6, a7, (uint64_t)a8))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (id)audioOutputForTailIndex:(unint64_t)a3
{
  if (self->_audioFanOut)
    return -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self->_audioFanOut, "outputs"), "objectAtIndexedSubscript:", a3);
  else
    return -[FigCaptureMovieFileSinkHeadPipeline audioOutput](self->_headPipeline, "audioOutput", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (FigCaptureVISPipeline)overCaptureVISPipeline
{
  return self->_overCaptureVISPipeline;
}

@end
