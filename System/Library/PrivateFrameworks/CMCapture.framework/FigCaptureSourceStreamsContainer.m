@implementation FigCaptureSourceStreamsContainer

- (void)initWithDeviceType:(uint64_t)a3 position:(int)a4 stillImageDepthDataType:(void *)a5 device:(uint64_t)a6 baseZoomFactorOverrides:(uint64_t)a7 clientBaseZoomFactorsByPortType:
{
  id v13;
  void *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)FigCaptureSourceStreamsContainer;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    *((_DWORD *)v13 + 2) = a2;
    *((_DWORD *)v13 + 3) = a4;
    *((_QWORD *)v13 + 2) = a5;
    if (-[FigCaptureSourceStreamsContainer _populateStreamsFromDeviceVendorForPosition:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:]((uint64_t)v14, a3, a6, a7))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (uint64_t)_populateStreamsFromDeviceVendorForPosition:(uint64_t)a3 baseZoomFactorOverrides:(uint64_t)a4 clientBaseZoomFactorsByPortType:
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unsigned int v18;
  void *v19;
  BWFigVideoCaptureSynchronizedStreamsGroup *v20;
  NSDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v26 = 0;
    v8 = FigCaptureSourceUnderlyingDeviceTypes(*(_DWORD *)(result + 8));
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v8, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
        ++v11;
      }
      while (objc_msgSend(v8, "count") > v11);
    }
    v12 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", *(_QWORD *)(v7 + 16), v9, v8, 3, 0, &v26);
    *(_QWORD *)(v7 + 24) = v12;
    if (v26)
    {
      FigDebugAssert3();
    }
    else
    {
      *(_QWORD *)(v7 + 32) = (id)objc_msgSend(v12, "firstObject");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = *(void **)(v7 + 24);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "portType"));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v15);
      }
      *(_QWORD *)(v7 + 40) = objc_msgSend(v10, "copy");
      v18 = *(_DWORD *)(v7 + 8);
      if (v18 <= 9 && ((1 << v18) & 0x310) != 0)
      {
        v19 = (void *)objc_msgSend(*(id *)(v7 + 16), "copySynchronizedStreamsGroupForStreams:error:", *(_QWORD *)(v7 + 24), &v26);
        if (v26)
        {
          FigDebugAssert3();

        }
        else
        {
          v20 = -[BWFigVideoCaptureSynchronizedStreamsGroup initWithSynchronizedStreamsGroup:activeStreams:readOnly:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:error:]([BWFigVideoCaptureSynchronizedStreamsGroup alloc], "initWithSynchronizedStreamsGroup:activeStreams:readOnly:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:error:", v19, *(_QWORD *)(v7 + 24), 1, a3, a4, &v26);

          if (v26)
          {
            FigDebugAssert3();
          }
          else
          {
            v21 = -[BWFigVideoCaptureSynchronizedStreamsGroup clientBaseZoomFactorsByPortType](v20, "clientBaseZoomFactorsByPortType");
            if (!v21)
              v21 = -[BWFigVideoCaptureSynchronizedStreamsGroup baseZoomFactorsByPortType](v20, "baseZoomFactorsByPortType");
            *(_QWORD *)(v7 + 48) = v21;
          }

        }
      }
    }

    return v26;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceStreamsContainer;
  -[FigCaptureSourceStreamsContainer dealloc](&v3, sel_dealloc);
}

- (uint64_t)portTypesSupportingDepth
{
  int v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    switch(*(_DWORD *)(result + 12))
    {
      case 1:
      case 2:
      case 8:
        v1 = *(_DWORD *)(result + 8);
        switch(v1)
        {
          case 9:
            v4 = *MEMORY[0x1E0D05A30];
            v8 = *MEMORY[0x1E0D05A18];
            v9 = v4;
            v2 = (void *)MEMORY[0x1E0C99D20];
            v3 = &v8;
            v5 = 2;
            goto LABEL_14;
          case 8:
            v10 = *MEMORY[0x1E0D05A18];
            v2 = (void *)MEMORY[0x1E0C99D20];
            v3 = &v10;
            break;
          case 4:
            v11 = *MEMORY[0x1E0D05A30];
            v2 = (void *)MEMORY[0x1E0C99D20];
            v3 = &v11;
            break;
          default:
            goto LABEL_8;
        }
        goto LABEL_13;
      case 3:
        v12 = *MEMORY[0x1E0D05A40];
        v2 = (void *)MEMORY[0x1E0C99D20];
        v3 = &v12;
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        v7 = objc_msgSend(*(id *)(result + 32), "portType");
        v2 = (void *)MEMORY[0x1E0C99D20];
        v3 = &v7;
        goto LABEL_13;
      case 7:
        v6 = *MEMORY[0x1E0D05A20];
        v2 = (void *)MEMORY[0x1E0C99D20];
        v3 = &v6;
LABEL_13:
        v5 = 1;
LABEL_14:
        result = objc_msgSend(v2, "arrayWithObjects:count:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13);
        break;
      default:
LABEL_8:
        result = 0;
        break;
    }
  }
  return result;
}

- (void)zoomFactorsForDepth
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  BOOL v4;
  int v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  float v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = *(_DWORD *)(v1 + 8);
  v4 = v3 > 9;
  v5 = (1 << v3) & 0x310;
  if (v4 || v5 == 0)
    return &unk_1E4A00848;
  v7 = (void *)v2;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)-[FigCaptureSourceStreamsContainer portTypesSupportingDepth](v1);
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v44;
    v32 = v1;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v34 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v8);
        objc_msgSend((id)objc_msgSend(*(id *)(v1 + 48), "objectForKeyedSubscript:", v9), "floatValue");
        v11 = v10;
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:", v9), "getProperty:error:", CFSTR("SupportedFormatsArray"), 0);
        if (objc_msgSend(v13, "count"))
        {
          v15 = 0;
          do
          {
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v16 = csu_secondaryNativeResolutionZoomFactorsForFormatIndex(v13, v15);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v40;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v40 != v19)
                    objc_enumerationMutation(v16);
                  v21 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "floatValue");
                  *(float *)&v23 = v11 * v22;
                  objc_msgSend(v12, "addObject:", objc_msgSend(v21, "numberWithFloat:", v23));
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              }
              while (v18);
            }
            ++v15;
          }
          while (objc_msgSend(v13, "count") > v15);
        }
        *(float *)&v14 = v11;
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14));
        v24 = (void *)objc_msgSend((id)objc_msgSend(v12, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          }
          while (v26);
        }
        v8 = v34 + 1;
        v1 = v32;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v33);
  }
  return v7;
}

- (uint64_t)streamProvidingSDOFRenderingParameters
{
  if (result)
    return objc_msgSend(*(id *)(result + 40), "objectForKeyedSubscript:", objc_msgSend((id)-[FigCaptureSourceStreamsContainer portTypesSupportingDepth](result), "firstObject"));
  return result;
}

- (uint64_t)switchOverZoomFactors
{
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[2];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 8);
    switch(v2)
    {
      case 9:
        v6[0] = objc_msgSend(*(id *)(result + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
        v6[1] = objc_msgSend(*(id *)(v1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]);
        v3 = (void *)MEMORY[0x1E0C99D20];
        v4 = v6;
        v5 = 2;
        return objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
      case 8:
        v7 = objc_msgSend(*(id *)(result + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
        v3 = (void *)MEMORY[0x1E0C99D20];
        v4 = &v7;
        goto LABEL_8;
      case 4:
        v8[0] = objc_msgSend(*(id *)(result + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]);
        v3 = (void *)MEMORY[0x1E0C99D20];
        v4 = v8;
LABEL_8:
        v5 = 1;
        return objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
    }
    return 0;
  }
  return result;
}

@end
