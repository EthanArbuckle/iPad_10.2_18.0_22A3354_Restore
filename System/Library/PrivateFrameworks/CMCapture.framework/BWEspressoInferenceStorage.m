@implementation BWEspressoInferenceStorage

- (void)clear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceStorage;
  -[BWInferenceProviderStorage clear](&v3, sel_clear);
  -[NSMutableSet removeAllObjects](self->_requirementsUsingTensors, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_requirementsUsingPixelBuffers, "removeAllObjects");
}

- (BWEspressoInferenceStorage)initWithBindingNameByRequirement:(id)a3 requirementsNeedingPixelBuffers:(id)a4 requirementsNeedingPixelBufferPools:(id)a5 requirementsNeedingTensors:(id)a6
{
  BWEspressoInferenceStorage *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)BWEspressoInferenceStorage;
  v8 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v22, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a4, a5);
  if (v8)
  {
    v8->_bindingNameByRequirement = (NSDictionary *)objc_msgSend(a3, "copy");
    v9 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v10 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 259);
    v8->_tensorByRequirement = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v9, v10, objc_msgSend(a6, "count"));
    v8->_requirementsUsingTensors = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8->_requirementsUsingPixelBuffers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(a6);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
          v16 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          *v16 = 0u;
          v16[1] = 0u;
          v16[2] = 0u;
          v16[3] = 0u;
          v16[4] = 0u;
          v16[5] = 0u;
          v16[6] = 0u;
          v16[7] = 0u;
          v16[8] = 0u;
          v16[9] = 0u;
          *((_QWORD *)v16 + 20) = 0;
          -[NSMapTable setObject:forKey:](v8->_tensorByRequirement, "setObject:forKey:", v16, v15);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }
  }
  return v8;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (id)bindingNameForRequirement:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_bindingNameByRequirement, "objectForKeyedSubscript:", a3);
}

- ($FD4688982923A924290ECB669CAF1EC2)tensorForRequirement:(id)a3
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)-[NSMapTable objectForKey:](self->_tensorByRequirement, "objectForKey:", a3);
}

- (void)addTensorInUseRequirement:(id)a3
{
  -[NSMutableSet addObject:](self->_requirementsUsingTensors, "addObject:", a3);
}

- (void)addPixelBufferInUseRequirement:(id)a3
{
  -[NSMutableSet addObject:](self->_requirementsUsingPixelBuffers, "addObject:", a3);
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  $FD4688982923A924290ECB669CAF1EC2 *v13;
  $FD4688982923A924290ECB669CAF1EC2 *v14;
  size_t Height;
  size_t v16;
  int var14;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *var0;
  unint64_t var10;
  uint64_t v25;
  size_t Width;
  size_t v27;
  size_t BytesPerRow;
  char *BaseAddress;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CFTypeRef v34;
  uint64_t i;
  uint64_t v37;
  _DWORD *v38;
  unint64_t var4;
  unint64_t var5;
  __int128 v41;
  uint64_t v42;
  CMSampleBufferRef v43;
  CFTypeRef cf;

  v43 = 0;
  v7 = -[NSMutableSet containsObject:](self->_requirementsUsingTensors, "containsObject:");
  v8 = -[NSMutableSet containsObject:](self->_requirementsUsingPixelBuffers, "containsObject:", a3);
  if ((v7 & 1) == 0 && !v8)
    return v43;
  v9 = objc_msgSend(a3, "videoFormat");
  if (!v9)
    return v43;
  v10 = (void *)v9;
  v11 = -[BWInferenceProviderStorage pixelBufferForRequirement:](self, "pixelBufferForRequirement:", a3);
  if (!v11)
    return v43;
  v12 = v11;
  if (v7)
  {
    v13 = -[BWEspressoInferenceStorage tensorForRequirement:](self, "tensorForRequirement:", a3);
    if (!v13)
      return v43;
    v14 = v13;
    Height = CVPixelBufferGetHeight(v12);
    v16 = CVPixelBufferGetBytesPerRow(v12) * Height;
    var14 = v14->var14;
    v18 = 4;
    if (var14 <= 131079)
    {
      if (var14 == 65552)
      {
        v18 = 2;
LABEL_16:
        if (v16 == v14->var4 * v18 * v14->var5)
        {
          if (objc_msgSend(v10, "deviceOriented")
            && objc_msgSend(v10, "pixelFormat") == 1278226534
            && ((v19 = (void *)CMGetAttachment(a4, CFSTR("UprightExifOrientation"), 0)) != 0
             || (v19 = (void *)objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50])) != 0)&& (LOBYTE(v41) = 0, (v20 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(objc_msgSend(v19, "intValue"), (char *)&v41)) != 0))
          {
            v21 = v20;
            CVPixelBufferLockBaseAddress(v12, 0);
            if (v21 != 360)
            {
              v22 = 360 - v21;
              var0 = v14->var0;
              var4 = v14->var4;
              var5 = v14->var5;
              var10 = v14->var10;
              v25 = 4 * var10;
              Width = CVPixelBufferGetWidth(v12);
              v27 = CVPixelBufferGetHeight(v12);
              BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
              switch(v22)
              {
                case 270:
                  v31 = (uint64_t)var0 + 4 * var4 - 4;
                  v32 = -4;
                  v30 = 4 * var10;
                  break;
                case 180:
                  v31 = (uint64_t)var0 + 4 * var4 + v25 * (var5 - 1) - 4;
                  v32 = -4 * (int)var10;
                  v30 = -4;
                  break;
                case 90:
                  v30 = -4 * var10;
                  v31 = (uint64_t)var0 + v25 * (var5 - 1);
                  v32 = 4;
                  break;
                default:
                  CVPixelBufferUnlockBaseAddress(v12, 0);
                  fig_log_get_emitter();
LABEL_45:
                  FigDebugAssert3();
                  return v43;
              }
              if (v27)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (Width)
                  {
                    v37 = 0;
                    v38 = (_DWORD *)v31;
                    do
                    {
                      *(_DWORD *)&BaseAddress[4 * v37++] = *v38;
                      v38 = (_DWORD *)((char *)v38 + v30);
                    }
                    while (Width != v37);
                  }
                  BaseAddress += BytesPerRow;
                  v31 += v32;
                }
              }
              goto LABEL_29;
            }
          }
          else
          {
            CVPixelBufferLockBaseAddress(v12, 0);
          }
          v33 = CVPixelBufferGetBaseAddress(v12);
          memcpy(v33, v14->var0, v16);
LABEL_29:
          CVPixelBufferUnlockBaseAddress(v12, 0);
          goto LABEL_30;
        }
        fig_log_get_emitter();
        goto LABEL_45;
      }
      if (var14 == 65568)
        goto LABEL_16;
    }
    else
    {
      switch(var14)
      {
        case 131080:
          goto LABEL_11;
        case 131104:
          goto LABEL_16;
        case 262152:
LABEL_11:
          v18 = 1;
          goto LABEL_16;
      }
    }
    v18 = 0;
    goto LABEL_16;
  }
LABEL_30:
  v34 = (CFTypeRef)objc_msgSend((id)objc_msgSend(v10, "underlyingVideoFormat"), "formatDescription");
  if (v34)
    v34 = CFRetain(v34);
  cf = v34;
  v41 = *MEMORY[0x1E0CA2E18];
  v42 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  BWSampleBufferCreateFromPixelBuffer(v12, (uint64_t)&v41, &cf, &v43);
  if (cf)
    CFRelease(cf);
  return v43;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5;
  void *v6;
  $FD4688982923A924290ECB669CAF1EC2 *v7;
  $FD4688982923A924290ECB669CAF1EC2 *v8;
  unint64_t v9;
  int v10;
  int v11;
  void *v12;
  double v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t i;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(a3, "metadataKeys");
  v7 = -[BWEspressoInferenceStorage tensorForRequirement:](self, "tensorForRequirement:", a3);
  if (!v7 || (v8 = v7, !v7->var0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v5;
  }
  v9 = v7->var5 * v7->var4 * v7->var6 * v7->var7 * v7->var8;
  v10 = objc_msgSend(a3, "mappingOption");
  v11 = v10;
  if (!v10 || v10 == 2)
  {
    v18 = objc_msgSend(v6, "count");
    if (v18 >= v9)
      v19 = v9;
    else
      v19 = v18;
    if (v19)
    {
      v20 = v18;
      for (i = 0; i != v19; ++i)
      {
        v22 = objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        LODWORD(v23) = *((_DWORD *)v8->var0 + i);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), v22);
      }
      if (v11 == 2 && v20 < v9)
      {
        v24 = objc_msgSend(v6, "objectAtIndexedSubscript:", v19 - 1);
        v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v25, 0);
        do
        {
          LODWORD(v26) = *((_DWORD *)v8->var0 + v19);
          objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26));
          ++v19;
        }
        while (v9 != v19);
        v16 = v5;
        v17 = v12;
        v15 = v24;
LABEL_21:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v15);

      }
    }
  }
  else if (v10 == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    if (v9)
    {
      for (j = 0; j != v9; ++j)
      {
        LODWORD(v13) = *((_DWORD *)v8->var0 + j);
        objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13));
      }
    }
    v15 = objc_msgSend(v6, "firstObject");
    v16 = v5;
    v17 = v12;
    goto LABEL_21;
  }
  return v5;
}

@end
