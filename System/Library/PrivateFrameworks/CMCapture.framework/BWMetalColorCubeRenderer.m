@implementation BWMetalColorCubeRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (BWMetalColorCubeRenderer)initWithMetalCommandQueue:(id)a3 mixInGammaDomain:(BOOL)a4
{
  BWMetalColorCubeRenderer *v6;
  BWMetalColorCubeRenderer *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWMetalColorCubeRenderer;
  v6 = -[BWMetalColorCubeRenderer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mtlCommandQueue = (MTLCommandQueue *)a3;
    if (!-[BWMetalColorCubeRenderer _loadAndConfigureFilterBundle]((uint64_t)v6))
    {
      v8 = 16;
      while (1)
      {
        *(_BYTE *)(objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "filterDescriptor") + 8) = 1;
        *(_DWORD *)(objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "filterDescriptor") + 4) = 1;
        *(_DWORD *)objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "filterDescriptor") = 32;
        *(_DWORD *)(objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "filterDescriptor") + 12) = 0;
        *(_BYTE *)(objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "filterDescriptor") + 16) = a4;
        v7->_mixingColorCubesInGammaDomain = a4;
        if (objc_msgSend(*(id *)((char *)&v7->super.isa + v8), "prepareToProcess:", 0))
          break;
        v8 += 8;
        if (v8 == 56)
        {
          v7->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
          return v7;
        }
      }
    }

    return 0;
  }
  return v7;
}

- (uint64_t)_loadAndConfigureFilterBundle
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  if (!a1)
    return 0;
  v2 = (id)objc_msgSend((id)objc_opt_class(), "bundle");
  *(_QWORD *)(a1 + 8) = v2;
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v3 = 16;
  while (1)
  {
    v4 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("FigColorCubeMetalFilter"))), "initWithCommandQueue:", *(_QWORD *)(a1 + 384));
    *(_QWORD *)(a1 + v3) = v4;
    if (!v4)
      break;
    v3 += 8;
    if (v3 == 56)
      return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v5 = FigSignalErrorAt();
  if ((_DWORD)v5)
  {

    *(_QWORD *)(a1 + 8) = 0;
    for (i = 16; i != 56; i += 8)
    {

      *(_QWORD *)(a1 + i) = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  BWInterpolatedColorLookupTableEntry *interpolatedForegroundColorLookupTables;
  NSData **p_interpolatedTable;
  uint64_t v5;
  NSData *v6;
  objc_super v7;

  interpolatedForegroundColorLookupTables = self->_interpolatedForegroundColorLookupTables;
  p_interpolatedTable = &self->_interpolatedBackgroundColorLookupTables[0].interpolatedTable;
  v5 = -40;
  do
  {

    v6 = *p_interpolatedTable;
    p_interpolatedTable += 3;

    v5 += 8;
  }
  while (v5);

  v7.receiver = self;
  v7.super_class = (Class)BWMetalColorCubeRenderer;
  -[BWMetalColorCubeRenderer dealloc](&v7, sel_dealloc);
}

- (signed)type
{
  return 5;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("Color Cube Renderer");
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  _BOOL4 v8;
  uint64_t i;
  _DWORD *v10;
  FigColorCubeMetalFilter *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a4, "colorSpaceProperties") - 5 < 0xFFFFFFFE;
  for (i = 16; i != 56; i += 8)
    *(_DWORD *)(objc_msgSend(*(id *)((char *)&self->super.isa + i), "filterDescriptor") + 12) = v8;
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  objc_msgSend(a3, "prepareForRenderingWithInputVideoFormat:", a4);
  v11 = self->_filters[0];
  v17[0] = objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name");
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = objc_msgSend(a3, "foregroundColorLookupTable");
  v13 = -[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v11, "setForegroundCubesWithNames:data:", v12, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1));
  if (!v13)
    v13 = -[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](self->_filters[0], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name"), objc_msgSend(a3, "backgroundColorLookupTable"));
  v14 = v13;
  if (*v10 == 1)
    kdebug_trace();
  return v14;
}

- (void)_interpolatedLookupTableForEntry:(void *)a3 inputLookupTable:(float)a4 strength:
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;

  if (!a1)
    return 0;
  if (*(void **)a2 != a3 || *(float *)(a2 + 8) != a4)
  {
    if (a4 == 0.0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 376), "identityColorLookupTable");
    }
    else
    {
      v8 = a3;
      if (a4 == 1.0)
      {
LABEL_10:

        *(_QWORD *)a2 = a3;
        *(float *)(a2 + 8) = a4;
        *(_QWORD *)(a2 + 16) = v8;
        return v8;
      }
      v9 = *(void **)(a1 + 376);
      v10 = objc_msgSend(v9, "identityColorLookupTable");
      *(float *)&v11 = a4;
      v7 = objc_msgSend(v9, "interpolatedColorLookupTableFromTable:toTable:fractionComplete:", v10, a3, v11);
    }
    v8 = (void *)v7;
    goto LABEL_10;
  }
  return *(void **)(a2 + 16);
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  _DWORD *v11;
  float v12;
  FigColorCubeMetalFilter *v13;
  uint64_t v14;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData **currentForegroundColorLookupTables;
  FigColorCubeMetalFilter **filters;
  NSData **currentBackgroundColorLookupTables;
  unsigned int v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  id v28;
  void *v29;
  void *v30;
  NSData *v31;
  NSData *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *ImageBuffer;
  FigColorCubeMetalFilter *v42;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  NSData *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  -[BWMetalColorCubeRenderer _attachFiltersForZoomPIPWithInputBuffer:rendererParameters:]((uint64_t)self, a5, a3);
  objc_msgSend(a3, "interpolationFractionComplete");
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v12 != 1.0)
  {
    v13 = self->_filters[0];
    v50[0] = objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name");
    v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v49 = objc_msgSend(a3, "foregroundColorLookupTable");
    if (-[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v13, "setForegroundCubesWithNames:data:", v14, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1))|| -[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](self->_filters[0], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(a3, "colorFilter"), "name"), objc_msgSend(a3, "backgroundColorLookupTable")))
    {
      v36 = 0;
      goto LABEL_31;
    }
  }
  ImageBuffer = (void *)CMGetAttachment(a5, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), 0);
  if (ImageBuffer)
    goto LABEL_5;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AF78);
  if (!AttachedMedia)
  {
    ImageBuffer = 0;
LABEL_5:
    v38 = 0;
    goto LABEL_8;
  }
  v16 = AttachedMedia;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  v38 = (void *)CMGetAttachment(v16, CFSTR("PersonSegmentationMaskToMainImageRotationDegrees"), 0);
LABEL_8:
  v17 = (void *)CMGetAttachment(a5, CFSTR("FiltersAndRegionArray"), 0);
  v18 = v17;
  v37 = a8;
  if (!v17)
  {
    -[FigColorCubeMetalFilter setInputPixelBuffer:](self->_filters[0], "setInputPixelBuffer:", a4);
    -[FigColorCubeMetalFilter setMattePixelbuffer:](self->_filters[0], "setMattePixelbuffer:", ImageBuffer);
    -[FigColorCubeMetalFilter setOutputPixelBuffer:](self->_filters[0], "setOutputPixelBuffer:", a7);
    -[FigColorCubeMetalFilter setTargetRectangle:](self->_filters[0], "setTargetRectangle:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[FigColorCubeMetalFilter setMatteToInputPixelBufferRotationDegrees:](self->_filters[0], "setMatteToInputPixelBufferRotationDegrees:", objc_msgSend(v38, "intValue"));
    if (*v11 == 1)
      kdebug_trace();
    if (-[FigColorCubeMetalFilter process](self->_filters[0], "process"))
    {
      v36 = 0;
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  if (!objc_msgSend(v17, "count"))
  {
LABEL_27:
    if (objc_msgSend(v18, "count"))
      v35 = objc_msgSend(v18, "count") - 1;
    else
      v35 = 0;
    a8 = v37;
    v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    v36 = 2
        * (-[FigColorCubeMetalFilter finishProcessing](self->_filters[v35], "finishProcessing") == 0);
    goto LABEL_31;
  }
  v19 = 0;
  currentForegroundColorLookupTables = self->_currentForegroundColorLookupTables;
  filters = self->_filters;
  currentBackgroundColorLookupTables = self->_currentBackgroundColorLookupTables;
  v23 = 1;
  while (1)
  {
    v24 = (void *)objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "objectForKeyedSubscript:", 0x1E495A938);
    if (!objc_msgSend(v24, "count"))
      break;
    v25 = (void *)objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "objectForKeyedSubscript:", 0x1E495A978);
    v44 = v23;
    if (v25)
    {
      objc_msgSend(v25, "floatValue");
      v27 = v26;
    }
    else
    {
      v27 = 1.0;
    }
    v28 = -[BWColorLookupCache colorLookupTablesForFilter:](self->_colorLookupCache, "colorLookupTablesForFilter:", objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
    v29 = (void *)objc_msgSend(v28, "foregroundColorLookupTable");
    v30 = (void *)objc_msgSend(v28, "backgroundColorLookupTable");
    v31 = (NSData *)-[BWMetalColorCubeRenderer _interpolatedLookupTableForEntry:inputLookupTable:strength:]((uint64_t)self, (uint64_t)&self->_interpolatedForegroundColorLookupTables[v19], v29, v27);
    v32 = (NSData *)-[BWMetalColorCubeRenderer _interpolatedLookupTableForEntry:inputLookupTable:strength:]((uint64_t)self, (uint64_t)&self->_interpolatedBackgroundColorLookupTables[v19], v30, v27);
    if (currentForegroundColorLookupTables[v19] != v31)
    {
      v42 = filters[v19];
      v48 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "name");
      v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v47 = v31;
      if (-[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](v42, "setForegroundCubesWithNames:data:", v33, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1)))break;

      currentForegroundColorLookupTables[v19] = v31;
    }
    if (currentBackgroundColorLookupTables[v19] != v32)
    {
      if (-[FigColorCubeMetalFilter setBackgroundCubeWithName:data:](filters[v19], "setBackgroundCubeWithName:data:", objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "name"), v32))break;

      currentBackgroundColorLookupTables[v19] = v32;
    }
    v34 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v45 = *MEMORY[0x1E0C9D648];
    v46 = v34;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "objectForKeyedSubscript:", 0x1E495A958), "getValue:", &v45);
    -[FigColorCubeMetalFilter setInputPixelBuffer:](filters[v19], "setInputPixelBuffer:", a4);
    -[FigColorCubeMetalFilter setMattePixelbuffer:](filters[v19], "setMattePixelbuffer:", ImageBuffer);
    -[FigColorCubeMetalFilter setOutputPixelBuffer:](filters[v19], "setOutputPixelBuffer:", a7);
    -[FigColorCubeMetalFilter setTargetRectangle:](filters[v19], "setTargetRectangle:", v45, v46);
    -[FigColorCubeMetalFilter setMatteToInputPixelBufferRotationDegrees:](filters[v19], "setMatteToInputPixelBufferRotationDegrees:", objc_msgSend(v38, "intValue"));
    if (-[FigColorCubeMetalFilter process](filters[v19], "process"))
      break;
    v19 = v23++;
    if (objc_msgSend(v18, "count") <= (unint64_t)v44)
      goto LABEL_27;
  }
  v36 = 0;
  a8 = v37;
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_31:
  if (*v11 == 1)
    kdebug_trace();
  if (a8)
    (*((void (**)(id, uint64_t, _QWORD))a8 + 2))(a8, v36, 0);
}

- (void)_attachFiltersForZoomPIPWithInputBuffer:(void *)a3 rendererParameters:
{
  const void *AttachedMedia;
  const void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  unsigned int v13;
  __int128 *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  float v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;

  if (a1)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a2, 0x1E495B198);
    if (AttachedMedia)
    {
      v6 = AttachedMedia;
      v7 = (void *)CMGetAttachment(AttachedMedia, CFSTR("FiltersForZoomPIPOverlay"), 0);
      if (!v7)
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)CMGetAttachment(a2, CFSTR("FiltersAndRegionArray"), 0);
      if (v8)
      {
        v9 = v8;
        if (objc_msgSend(v8, "count"))
        {
          v10 = 0;
          v11 = 0;
          v12 = 0.0;
          v13 = 1;
          v14 = (__int128 *)MEMORY[0x1E0C9D648];
          do
          {
            v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", 0x1E495A938);
            if (v15)
            {
              v16 = (void *)v15;
              v17 = v14[1];
              v26 = *v14;
              v27 = v17;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", 0x1E495A958), "getValue:", &v26);
              v18 = *(double *)&v27 * *((double *)&v27 + 1);
              if (v12 < v18)
              {
                v11 = v16;
                v12 = *(double *)&v27 * *((double *)&v27 + 1);
              }
            }
            v10 = v13;
          }
          while (objc_msgSend(v9, "count") > (unint64_t)v13++);
        }
        else
        {
          v11 = 0;
        }
        v20 = (void *)objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        NSClassFromString(CFSTR("CIColorCubesMixedWithMask"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = objc_msgSend(v20, "cube1Data");
        else
          v22 = 0;
        if (!v20)
          goto LABEL_30;
      }
      else
      {
        v20 = (void *)objc_msgSend(a3, "colorFilter");
        if (objc_msgSend(a3, "backgroundColorLookupTable"))
          v21 = objc_msgSend(a3, "backgroundColorLookupTable");
        else
          v21 = objc_msgSend(a3, "foregroundColorLookupTable");
        v22 = v21;
        if (!v20)
          goto LABEL_30;
      }
      NSClassFromString(CFSTR("CIColorCubesMixedWithMask"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "colorCubeWithColorSpaceFilter");
        objc_msgSend(v23, "setName:", objc_msgSend(v20, "name"));
        objc_msgSend(v20, "cubeDimension");
        objc_msgSend(v23, "setCubeDimension:");
        objc_msgSend(v23, "setColorSpace:", objc_msgSend(v20, "colorSpace"));
      }
      else
      {
        NSClassFromString(CFSTR("CIPhotoEffect3D"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(CFSTR("CIPhotoEffect"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v24 = v7;
            v25 = v20;
            goto LABEL_29;
          }
        }
        v23 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "colorCubeWithColorSpaceFilter");
        objc_msgSend(v23, "setName:", objc_msgSend(v20, "name"));
        objc_msgSend(v23, "setCubeDimension:", 8589936700.0);
      }
      objc_msgSend(v23, "setCubeData:", v22);
      v24 = v7;
      v25 = v23;
LABEL_29:
      objc_msgSend(v24, "addObject:", v25);
LABEL_30:
      if (objc_msgSend(v7, "count"))
        CMSetAttachment(v6, CFSTR("FiltersForZoomPIPOverlay"), v7, 1u);
    }
  }
}

+ (id)bundle
{
  void *v2;
  void *v3;
  uint64_t v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/MetalFilter.bundle"));
  v3 = v2;
  if (!v2)
  {
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    return v3;
  }
  v5 = 0;
  if ((objc_msgSend(v2, "loadAndReturnError:", &v5) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v3;
}

- (BOOL)supportsAnimation
{
  return 1;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (BOOL)mixingColorCubesInGammaDomain
{
  return self->_mixingColorCubesInGammaDomain;
}

@end
