@implementation BWLearnedNRInferenceProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWLearnedNRInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  BWLearnedNRInferenceProvider *v4;
  BWInferenceLazyVideoRequirement *v7;
  BWInferenceLazyVideoRequirement *v8;
  BWLearnedNRInferenceProvider *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v4 = self;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_13;
  self->_configuration = (BWLearnedNRInferenceConfiguration *)a3;
  v7 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_29);
  if (!v7
    || (v8 = v7,
        v22[0] = v7,
        v20.receiver = v4,
        v20.super_class = (Class)BWLearnedNRInferenceProvider,
        v9 = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v20, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1), objc_msgSend(a3, "outputVideoRequirements"), a4), (v4 = v9) == 0))
  {
    FigSignalErrorAt();
LABEL_13:

    return 0;
  }
  v9->_inputVideoRequirement = &v8->super;
  v9->_outputVideoRequirements = (NSArray *)(id)objc_msgSend(a3, "outputVideoRequirements");
  v4->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_msgSend(a3, "outputVideoRequirements", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputFormatDescriptionByAttachedMediaKey, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "videoFormat"), "underlyingVideoFormat"), "formatDescription"), objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "attachedMediaKey"));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }
  return v4;
}

id __71__BWLearnedNRInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unsigned int v5;

  v3 = objc_msgSend(a2, "pixelFormat");
  LOWORD(v5) = objc_msgSend(a2, "width");
  HIWORD(v5) = objc_msgSend(a2, "height");
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", v3, v5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRInferenceProvider;
  -[BWTiledEspressoInferenceProvider dealloc](&v3, sel_dealloc);
}

- (int)type
{
  return -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType");
}

- (uint64_t)_tuningParametersForPortType:(uint64_t)result
{
  uint64_t v3;
  const __CFString *v4;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(*(id *)(result + 136), "inferenceType") == 171)
      v4 = CFSTR("QuadraLearnedNRParameters");
    else
      v4 = CFSTR("LearnedNRParameters");
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 136), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", a2), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", v4);
  }
  return result;
}

- (uint64_t)_tileOverlapForGain:(float)a3 value:
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  uint64_t v16;
  uint64_t v17;

  if (result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(a2, "count");
      v7 = v6;
      if ((int)v6 < 1 || (v6 & 1) != 0)
      {
        fig_log_get_emitter();
        v17 = v3;
        LODWORD(v16) = 0;
        FigDebugAssert3();
      }
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0, v16, v17), "floatValue");
      if (v8 >= a3)
      {
        v11 = 1;
      }
      else
      {
        v9 = ((v7 << 32) - 0x200000000) >> 32;
        objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v9), "floatValue");
        if (v10 > a3)
        {
          v11 = -1;
          while (v11 + 1 < v9)
          {
            objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:"), "floatValue");
            v13 = v12;
            objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v11 + 3), "floatValue");
            v11 += 2;
            if (v13 <= a3 && v14 > a3)
              goto LABEL_19;
          }
          return 64;
        }
        v11 = ((v7 << 32) - 0x100000000) >> 32;
      }
LABEL_19:
      a2 = (void *)objc_msgSend(a2, "objectAtIndexedSubscript:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return 64;
    }
    return objc_msgSend(a2, "unsignedIntValue");
  }
  return result;
}

- (uint64_t)_tileOverlapForMetadata:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    FigCaptureComputeImageGainFromMetadata();
    v4 = (void *)objc_msgSend((id)-[BWLearnedNRInferenceProvider _tuningParametersForPortType:](v3, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), "objectForKeyedSubscript:", CFSTR("TileOverlap"));
    return -[BWLearnedNRInferenceProvider _tileOverlapForGain:value:](v3, v4, 1.0);
  }
  return result;
}

- (uint64_t)_maxTileOverlap
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 136), "sensorConfigurationsByPortType", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 64;
  v4 = v3;
  v5 = *(_QWORD *)v12;
  LODWORD(v6) = 64;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v8 = (void *)objc_msgSend((id)-[BWLearnedNRInferenceProvider _tuningParametersForPortType:](a1, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)), "objectForKeyedSubscript:", CFSTR("TileOverlap"));
      v9 = -[BWLearnedNRInferenceProvider _tileOverlapForGain:value:](a1, v8, 3.4028e38);
      if (v6 <= v9)
        v6 = v9;
      else
        v6 = v6;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v4);
  return v6;
}

- (unint64_t)computeTileParametersForPosition:(double)a3
{
  int8x8_t v9;
  unsigned int v10;
  double v11;
  int32x2_t v12;
  uint64_t v13;
  int v14;
  int8x8_t v15;
  int v16;
  int32x2_t v17;
  int8x8_t v18;
  int8x8_t v19;
  int32x2_t v20;
  unsigned int v21;
  unsigned int v22;

  if (result)
  {
    v10 = *(_DWORD *)(result + 160);
    v11 = COERCE_DOUBLE(vdup_n_s32(v10 >> 1));
    if (*(unsigned __int16 *)(result + 154) - 1 == HIWORD(a2))
    {
      v12.i32[1] = *(unsigned __int16 *)(result + 200) - *(unsigned __int16 *)(result + 158) + 4;
      v13 = LODWORD(v11) | 0x400000000;
      v14 = 4;
    }
    else
    {
      v12.i32[1] = (*(unsigned __int16 *)(result + 158) - v10) * HIWORD(a2) - 4;
      v13 = LODWORD(v11) | 0x400000000;
      v14 = HIDWORD(v11);
    }
    a8.i32[0] = 0;
    a9.i32[0] = 0;
    v9.i32[0] = HIWORD(a2);
    v15 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)vand_s8(a8, (int8x8_t)0xFFFF0000FFFFLL)), 0), (int8x8_t)v13, *(int8x8_t *)&v11);
    v16 = *(unsigned __int16 *)(result + 156);
    HIDWORD(v11) = v12.i32[1];
    v12.i32[0] = *(unsigned __int16 *)(result + 192) - v16 + 4;
    v17.i32[1] = v14;
    if ((unsigned __int16)a2 != *(unsigned __int16 *)(result + 152) - 1)
    {
      LODWORD(v11) = (v16 - v10) * a2 - 4;
      *(double *)&v12 = v11;
    }
    v17.i32[0] = (unsigned __int16)a2;
    v18.i32[1] = v15.i32[1];
    v18.i32[0] = 4;
    v19 = vbsl_s8((int8x8_t)*(_OWORD *)&vmovl_s16((int16x4_t)vceq_s32(v17, a9)), v18, v15);
    HIWORD(v22) = v19.i16[2];
    LOWORD(v22) = v19.i16[0];
    v20 = vadd_s32(v12, vmovn_s64(*(int64x2_t *)(result + 168)));
    HIWORD(v21) = v20.i16[2];
    LOWORD(v21) = v20.i16[0];
    return v21 | ((unint64_t)v22 << 32);
  }
  return result;
}

- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  id v6;
  NSArray *outputVideoRequirements;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = -[BWLearnedNRInferenceConfiguration outputAttachedMediaKeyForInputDimensions:](self->_configuration, "outputAttachedMediaKeyForInputDimensions:", BWPixelBufferDimensionsFromSampleBuffer(a3));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(outputVideoRequirements);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "attachedMediaKey"), "isEqualToString:", v6))
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v5;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  $26DCD7B8397090CBB87D2EBE22D35089 *p_renderROI;
  size_t width;
  size_t height;

  p_renderROI = &self->_renderROI;
  width = self->_renderROI.size.width;
  if (width >= CVPixelBufferGetWidth(a3) && (height = p_renderROI->size.height, height >= CVPixelBufferGetHeight(a3)))
    return 0;
  else
    return -[LearnedNRMetalStage clearBuffer:](self->_metalStage, "clearBuffer:", a3);
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int8x8_t v16;
  int32x2_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  LearnedNRMetalStage *metalStage;

  v6 = v5;
  v7 = a5;
  if (objc_msgSend(a3, "count") != 1)
    goto LABEL_14;
  v18 = -[BWLearnedNRInferenceProvider computeTileParametersForPosition:]((unint64_t)self, v7, v11, v12, v13, v14, v15, v16, v17);
  if (!self)
    return FigSignalErrorAt();
  v19 = v18;
  v20 = -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType") == 171 ? 3 : 1;
  if ((v20 & (v19 | WORD1(v19))) != 0)
    return FigSignalErrorAt();
  v21 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PrimaryFormat"));
  v22 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("input"));
  if (!v22)
  {
LABEL_14:
    FigSignalErrorAt();
    return 0;
  }
  metalStage = self->_metalStage;
  if (self->_isInputFormatRaw)
  {
    if (-[LearnedNRMetalStage createRawTile:fromInputRaw:tileStart:cmdBuffer:](metalStage, "createRawTile:fromInputRaw:tileStart:cmdBuffer:", v22, v21, v19, v6))return FigSignalErrorAt();
    return 0;
  }
  if (!-[LearnedNRMetalStage createRawTile:fromInputYuv:tileStart:cmdBuffer:](metalStage, "createRawTile:fromInputYuv:tileStart:cmdBuffer:", v22, v21, v19, v6))return 0;
  return FigSignalErrorAt();
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int8x8_t v14;
  int32x2_t v15;
  unint64_t v20;
  __int32 v21;
  unint64_t v22;
  __int32 v23;
  int32x2_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint16x4_t v33;
  uint16x4_t v34;
  uint64_t v35;
  int32x2_t v36;
  LearnedNRMetalStage *metalStage;
  int result;
  int32x2_t v39;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;

  v20 = -[BWLearnedNRInferenceProvider computeTileParametersForPosition:]((unint64_t)self, a9, v9, v10, v11, v12, v13, v14, v15);
  if (!self)
    return FigSignalErrorAt();
  v22 = v20;
  v23 = v21;
  v25 = -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType") == 171 ? 3 : 1;
  if ((v25 & (v22 | WORD1(v22))) != 0)
    return FigSignalErrorAt();
  v24.i16[0] = *(_WORD *)self->_tileSize;
  v24.i16[2] = *(_WORD *)&self->_tileSize[2];
  v39 = v24;
  v26 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("output"));
  if (!v26)
    return FigSignalErrorAt();
  v27 = v26;
  v28 = objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("PrimaryFormat"));
  if (!v28)
    return FigSignalErrorAt();
  v29 = v28;
  v30 = objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateLumaTile_%i"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")));
  if (!v30)
    return FigSignalErrorAt();
  v31 = v30;
  v32 = objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateDeltaTile_%i"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")));
  if (!v32)
    return FigSignalErrorAt();
  v35 = v32;
  v33.i32[0] = v23;
  v34.i32[0] = HIDWORD(v22);
  v36 = vsub_s32(v39, (int32x2_t)*(_OWORD *)&vaddl_u16(v34, v33));
  metalStage = self->_metalStage;
  HIWORD(v42) = HIWORD(v22) + WORD1(v22);
  LOWORD(v42) = WORD2(v22) + v22;
  HIWORD(v41) = v36.i16[2];
  LOWORD(v41) = v36.i16[0];
  if (self->_isInputFormatRaw)
  {
    result = -[LearnedNRMetalStage writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origRawInputBuffer:srcStart:dstStart:size:cmdBuffer:](metalStage, "writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origRawInputBuffer:srcStart:dstStart:size:cmdBuffer:", v27, a4, v31, v35, v29, __PAIR64__(v41, v42), v43);
    if (!result)
      return result;
    return FigSignalErrorAt();
  }
  result = -[LearnedNRMetalStage writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origYuvInputBuffer:srcStart:dstStart:size:cmdBuffer:](metalStage, "writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origYuvInputBuffer:srcStart:dstStart:size:cmdBuffer:", v27, a4, v31, v35, v29, __PAIR64__(v41, v42), v43);
  if (result)
    return FigSignalErrorAt();
  return result;
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  uint64_t v9;
  uint64_t v10;
  __CVBuffer *v11;
  CFTypeRef v12;
  int v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v19;
  CFTypeRef v21;
  CFTypeRef cf;

  v21 = 0;
  cf = 0;
  v9 = objc_msgSend(a3, "attachedMediaKey");
  v10 = objc_msgSend(a4, "pixelBufferForRequirement:", a3);
  if (v10)
  {
    v11 = (__CVBuffer *)v10;
    v12 = (CFTypeRef)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputFormatDescriptionByAttachedMediaKey, "objectForKeyedSubscript:", v9);
    if (v12)
      v12 = CFRetain(v12);
    v21 = v12;
    v13 = BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v11, 0, &v21, (CMSampleBufferRef *)&cf);
    if (v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputFormatDescriptionByAttachedMediaKey, "setObject:forKeyedSubscript:", v21, v9);
      BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf);
      BWSampleBufferSetAttachedMedia(a5, v9, (uint64_t)cf);
      v14 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      x = (double)self->_renderROI.origin.x;
      y = (double)self->_renderROI.origin.y;
      width = (double)self->_renderROI.size.width;
      height = (double)self->_renderROI.size.height;
      v19 = psn_pixelBufferDimensions(v11);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, v19, v19, x, y, width, height, x, y, width, height);
    }
  }
  else
  {
    v13 = 0;
  }
  if (cf)
    CFRelease(cf);
  if (v21)
    CFRelease(v21);
  return v13;
}

- (int)purgeIntermediateResources
{
  return 0;
}

+ (int32x2_t)numTilesForFullImageSize:(unsigned int)a3 tileSize:(unsigned int)a4 tileOverlap:
{
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;

  objc_opt_self();
  v7.i32[0] = (unsigned __int16)a2;
  v7.i32[1] = vshl_u32((uint32x2_t)vdup_n_s32(a2), (uint32x2_t)0xFFFFFFF0FFFF0001).i32[1];
  v8.i32[0] = (unsigned __int16)a3;
  v8.i32[1] = vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF0FFFF0001).i32[1];
  v9 = vdup_n_s32(a4);
  return vcvt_s32_f32(vrndp_f32(vdiv_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(vsub_s32(v7, v9), (int32x2_t)0x800000008)), vcvt_f32_u32((uint32x2_t)vsub_s32(v8, v9)))));
}

- (uint64_t)_verifyInputFormat
{
  uint64_t v1;
  int v2;
  BOOL v3;
  int v4;

  if (!result)
    return result;
  v1 = result;
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "videoFormat"), "pixelFormat");
  result = 0;
  if (v2 <= 792229423)
  {
    if (v2 <= 758670895)
    {
      v3 = v2 == 641230384 || v2 == 641234480;
      v4 = 645424688;
    }
    else if (v2 > 762865199)
    {
      v3 = v2 == 762865200;
      v4 = 792225328;
    }
    else
    {
      v3 = v2 == 758670896;
      v4 = 758674992;
    }
LABEL_20:
    if (!v3 && v2 != v4)
      return result;
LABEL_25:
    *(_BYTE *)(v1 + 216) = 0;
    return objc_msgSend(*(id *)(v1 + 136), "inferenceType") != 171;
  }
  if (v2 > 2019963439)
  {
    if (v2 > 2084075055)
    {
      v3 = v2 == 2084075056;
      v4 = 2088265264;
    }
    else
    {
      v3 = v2 == 2019963440;
      v4 = 2084070960;
    }
    goto LABEL_20;
  }
  if (v2 <= 875704437)
  {
    v3 = v2 == 792229424;
    v4 = 796419632;
    goto LABEL_20;
  }
  if (v2 == 875704438)
    goto LABEL_25;
  if (v2 == 1651926376)
  {
    result = 1;
    *(_BYTE *)(v1 + 216) = 1;
  }
  return result;
}

- (BOOL)_verifyOutputFormatForRequirement:(_BOOL8)result
{
  uint64_t v2;
  int v3;
  int v4;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend((id)objc_msgSend(a2, "videoFormat"), "pixelFormat");
    if (!*(_BYTE *)(v2 + 216))
      return v3 == objc_msgSend((id)objc_msgSend(*(id *)(v2 + 104), "videoFormat"), "pixelFormat");
    result = 1;
    if (v3 <= 795371055)
    {
      if (v3 == 644376112)
        return result;
      v4 = 761816624;
      goto LABEL_10;
    }
    if (v3 != 795371056 && v3 != 1751527984)
    {
      v4 = 2087216688;
LABEL_10:
      if (v3 != v4)
        return 0;
    }
  }
  return result;
}

- (const)_networkName
{
  id v1;

  if (result)
  {
    if (objc_msgSend((id)result[4].info, "inferenceType") == 171)
    {
      return CFSTR("learnednoisereduction-quadra-v1");
    }
    else
    {
      v1 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", CFSTR("learnednoisereduction-v3"), 1);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v1, "path")))return CFSTR("learnednoisereduction-v3");
      else
        return CFSTR("learnednoisereduction-v2");
    }
  }
  return result;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  LearnedNRMetalStage *v17;
  NSArray *outputVideoRequirements;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  objc_class *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unsigned int v37;
  int32x2_t v38;
  int32x2_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  BWInferenceVideoRequirement *v44;
  id v45;
  BWInferenceVideoRequirement *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v52;
  uint64_t v53;
  id v54;
  objc_class *v55;
  Class v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  objc_super v60;
  objc_super v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!-[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"))goto LABEL_39;
  v5 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
  if (!(_DWORD)v5)
    goto LABEL_39;
  v6 = BWLoadProcessorBundle((uint64_t)CFSTR("NRF"), v5);
  if (!v6)
    goto LABEL_39;
  v7 = objc_msgSend(v6, "classNamed:", CFSTR("LearnedNRMetalStage"));
  if (!v7)
    goto LABEL_39;
  v54 = a3;
  v55 = (objc_class *)v7;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v10 = -[BWLearnedNRInferenceConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType");
  v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v67;
LABEL_7:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v14);
      v16 = -[NSDictionary objectForKeyedSubscript:](-[BWLearnedNRInferenceConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v15);
      if (!objc_msgSend(v16, "cameraInfo"))
        goto LABEL_39;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v16, "cameraInfo"), v15);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", -[BWLearnedNRInferenceProvider _tuningParametersForPortType:]((uint64_t)self, v15), v15);
      if (v12 == ++v14)
      {
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        if (v12)
          goto LABEL_7;
        break;
      }
    }
  }
  v17 = (LearnedNRMetalStage *)objc_msgSend([v55 alloc], "initWithCommandQueue:cameraInfo:tuningParameters:isQuadra:", -[BWTiledEspressoInferenceConfiguration metalCommandQueue](self->_configuration, "metalCommandQueue"), v8, v9, -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType") == 171);
  self->_metalStage = v17;
  if (!v17)
    goto LABEL_39;
  -[LearnedNRMetalStage setDeviceGeneration:](self->_metalStage, "setDeviceGeneration:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
  if (!-[BWLearnedNRInferenceProvider _verifyInputFormat]((uint64_t)self))
    return -31711;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v63;
LABEL_17:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v21)
        objc_enumerationMutation(outputVideoRequirements);
      if (!-[BWLearnedNRInferenceProvider _verifyOutputFormatForRequirement:]((_BOOL8)self, *(void **)(*((_QWORD *)&v62 + 1) + 8 * v22)))return -31711;
      if (v20 == ++v22)
      {
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        if (v20)
          goto LABEL_17;
        break;
      }
    }
  }
  v23 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", -[BWLearnedNRInferenceProvider _networkName]((const __CFString *)self), 1);
  if (!v23
    || (v24 = v23,
        (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[objc_class path](v23, "path")) & 1) == 0))
  {
LABEL_39:
    FigSignalErrorAt();
    return 0;
  }
  v25 = self->_outputVideoRequirements;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  v56 = v24;
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v71 != v29)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v32 = objc_msgSend((id)objc_msgSend(v31, "videoFormat"), "width");
        v33 = objc_msgSend((id)objc_msgSend(v31, "videoFormat"), "height") * v32;
        v34 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "width");
        if (v33 > objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "height") * v34)
          v28 = v31;
      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }
  self->_renderROI.origin.y = 0;
  self->_renderROI.origin.z = 0;
  self->_renderROI.origin.x = 0;
  v35 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "width");
  v36 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "height");
  self->_renderROI.size.width = v35;
  self->_renderROI.size.height = v36;
  self->_renderROI.size.depth = 0;
  *(_DWORD *)self->_tileSize = 48235296;
  v37 = -[BWLearnedNRInferenceProvider _maxTileOverlap]((uint64_t)self);
  self->_tileOverlap = v37;
  v38 = vmovn_s64(*(int64x2_t *)&self->_renderROI.size.width);
  HIWORD(v59) = v38.i16[2];
  LOWORD(v59) = v38.i16[0];
  v39 = +[BWLearnedNRInferenceProvider numTilesForFullImageSize:tileSize:tileOverlap:]((uint64_t)BWLearnedNRInferenceProvider, v59, *(_DWORD *)self->_tileSize, v37);
  *(_WORD *)self->_numTiles = v39.i16[0];
  *(_WORD *)&self->_numTiles[2] = v39.i16[2];
  LOWORD(v58) = *(_WORD *)self->_tileSize >> 1;
  HIWORD(v58) = (5 * *(unsigned __int16 *)&self->_tileSize[2]) >> 1;
  v40 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, v58);
  v53 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v40, CFSTR("input"), 0);
  LOWORD(v57) = *(_WORD *)self->_tileSize;
  HIWORD(v57) = 3 * *(_WORD *)&self->_tileSize[2];
  v41 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, v57);
  v52 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v41, CFSTR("output"), 0);
  v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, *(unsigned int *)self->_tileSize);
  v44 = [BWInferenceVideoRequirement alloc];
  objc_msgSend(v42, "addObject:", -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](v44, "initWithAttachedMediaKey:videoFormat:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateLumaTile_%i"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")), v43));
  v45 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, *(unsigned int *)self->_tileSize);
  v46 = [BWInferenceVideoRequirement alloc];
  objc_msgSend(v42, "addObject:", -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](v46, "initWithAttachedMediaKey:videoFormat:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateDeltaTile_%i"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")), v45));
  v47 = -[BWLearnedNRInferenceProvider type](self, "type");
  v48 = *(unsigned int *)self->_numTiles;
  v61.receiver = self;
  v61.super_class = (Class)BWLearnedNRInferenceProvider;
  v49 = -[BWTiledEspressoInferenceProvider loadNetworkWithURL:configName:inferenceType:maxTileCount:inputFormatsByBindingName:outputFormatsByBindingName:additionalVideoRequirements:](&v61, sel_loadNetworkWithURL_configName_inferenceType_maxTileCount_inputFormatsByBindingName_outputFormatsByBindingName_additionalVideoRequirements_, v56, 0, v47, v48, v53, v52, v42);
  if (v49)
    return v49;
  v60.receiver = self;
  v60.super_class = (Class)BWLearnedNRInferenceProvider;
  v50 = -[BWTiledEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](&v60, sel_prepareForSubmissionWithWorkQueue_, v54);
  if (v50)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {

    self->_preparedOutputVideoRequirement = (BWInferenceVideoRequirement *)v28;
  }
  return v50;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  void *v13;
  const __CFDictionary *v14;
  CGSize v15;
  int v16;
  int32x2_t v17;
  unsigned int v18;
  unsigned int v19;
  float32x2_t v20;
  uint32x2_t v21;
  uint32x2_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t height;
  unsigned int v26;
  int32x2_t v27;
  int32x2_t v28;
  int v29;
  uint64x2_t v31;
  unint64_t v32;
  unsigned int v33;
  unsigned int v34;
  __int128 v35;
  int64_t var3;
  objc_super v37;
  CGRect rect;

  v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!-[LearnedNRMetalStage updateParametersFromMetadata:lscSampleBuffer:](self->_metalStage, "updateParametersFromMetadata:lscSampleBuffer:", v13, BWSampleBufferGetAttachedMedia(a3, 0x1E495B158))&& (v14 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("LearnedNRRegionOfInterest"), 0)) != 0&& (v15 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16), rect.origin = (CGPoint)*MEMORY[0x1E0C9D628], rect.size = v15, CGRectMakeWithDictionaryRepresentation(v14, &rect)))
  {
    v16 = -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType");
    if (v16 == 171)
      v18 = 4;
    else
      v18 = 2;
    *(float *)v17.i32 = (float)v18;
    if (v16 == 171)
      v19 = 2;
    else
      v19 = 1;
    self->_renderROI.origin.z = 0;
    v20 = (float32x2_t)vdup_lane_s32(v17, 0);
    v21 = (uint32x2_t)vdup_n_s32(v19);
    v22 = vshl_u32(vcvt_u32_f32(vrndm_f32(vdiv_f32(vcvt_f32_f64((float64x2_t)rect.origin), v20))), v21);
    *(_QWORD *)&v23 = v22.u32[0];
    *((_QWORD *)&v23 + 1) = v22.u32[1];
    v31 = vsubl_u32(vshl_u32(vcvt_u32_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)rect.origin, (float64x2_t)rect.size)), v20))), v21), v22);
    *(_OWORD *)&self->_renderROI.origin.x = v23;
    *(uint64x2_t *)&self->_renderROI.size.width = v31;
    self->_renderROI.size.depth = 0;
    v24 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_preparedOutputVideoRequirement, "videoFormat", *(_OWORD *)&v31), "width");
    if (v32 <= v24)
    {
      height = self->_renderROI.size.height;
      if (height <= -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_preparedOutputVideoRequirement, "videoFormat"), "height"))
      {
        v26 = -[BWLearnedNRInferenceProvider _tileOverlapForMetadata:]((uint64_t)self, v13);
        self->_tileOverlap = v26;
        v27 = vmovn_s64(*(int64x2_t *)&self->_renderROI.size.width);
        HIWORD(v34) = v27.i16[2];
        LOWORD(v34) = v27.i16[0];
        v28 = +[BWLearnedNRInferenceProvider numTilesForFullImageSize:tileSize:tileOverlap:]((uint64_t)BWLearnedNRInferenceProvider, v34, *(_DWORD *)self->_tileSize, v26);
        HIWORD(v33) = v28.i16[2];
        LOWORD(v33) = v28.i16[0];
        *(_WORD *)&self->_numTiles[2] = v28.i16[2];
        *(_WORD *)self->_numTiles = v28.i16[0];
        v37.receiver = self;
        v37.super_class = (Class)BWLearnedNRInferenceProvider;
        v35 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        return -[BWTiledEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:](&v37, sel_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount_, a3, a4, &v35, a6, a7, v33);
      }
    }
    v29 = -31710;
  }
  else
  {
    v29 = FigSignalErrorAt();
  }
  if (a7)
    (*((void (**)(id, uint64_t, BWLearnedNRInferenceProvider *))a7 + 2))(a7, 4294935586, self);
  return v29;
}

@end
