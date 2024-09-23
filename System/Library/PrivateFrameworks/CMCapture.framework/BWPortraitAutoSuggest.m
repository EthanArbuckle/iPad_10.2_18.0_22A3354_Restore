@implementation BWPortraitAutoSuggest

- (BOOL)runAutoSuggestionWithSampleBuffer:(opaqueCMSampleBuffer *)a3 portraitSceneMonitorStatus:(int *)a4
{
  int v7;
  int v8;
  int v9;

  -[BWPortraitAutoSuggest _updateFrameRateDependantParams:]((uint64_t)self, a3);
  -[BWPortraitAutoSuggest processSbuf:]((unint64_t)self, a3);
  if ((*a4 | 8) == 9)
  {
    if (self->_shallowDepthOfFieldRenderingEnabled)
    {
      if (self->_lastDoSuggest)
        v7 = 13;
      else
        v7 = 14;
      if (self->_lastDoSuggest)
        v8 = 13;
      else
        v8 = 12;
      if (self->_portTypeIsFFC)
        v9 = v8;
      else
        v9 = v7;
    }
    else if (self->_lastDoSuggest)
    {
      v9 = 11;
    }
    else
    {
      v9 = 12;
    }
    *a4 = v9;
  }
  -[BWPortraitAutoSuggest _adjustMetadataOfSampleBuffer:]((uint64_t)self, a3);
  return 1;
}

- (uint64_t)processSbuf:(unint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v8;
  CGSize size;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t j;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  char v52;
  int v53;
  int v54;
  id obj;
  uint64_t v57;
  size_t Height;
  size_t Width;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  double v67[2];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGRect rect;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
    v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
    rect = *(CGRect *)ymmword_1A32B1000;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &rect);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    Width = CVPixelBufferGetWidth(ImageBuffer);
    v8 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    Height = CVPixelBufferGetHeight(v8);
    size = rect.size;
    v60 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v5)
    {
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      obj = -[BWPortraitAutoSuggest getFilteredDetectedObjects:detectedFacesArray:](a1, v5, v6);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v61)
      {
        v10 = (double)Width;
        v11 = (double)Height;
        v57 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v61; ++i)
          {
            if (*(_QWORD *)v73 != v57)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "combinedTrackerID");
            objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14));
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v15 = *(void **)(a1 + 120);
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
            if (!v16)
              goto LABEL_18;
            v17 = v16;
            v62 = i;
            v18 = 0;
            v19 = *(_QWORD *)v69;
            v20 = -1;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v69 != v19)
                  objc_enumerationMutation(v15);
                v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                if (objc_msgSend(v22, "combinedTrackerID") == v14)
                {
                  v20 = objc_msgSend(*(id *)(a1 + 120), "indexOfObject:", v22);
                  v18 = v22;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
            }
            while (v17);
            i = v62;
            if (v20 == -1)
            {
LABEL_18:
              v18 = (id)objc_opt_new();
              objc_msgSend(v18, "setCombinedTrackerID:", v14);
              v20 = -1;
            }
            objc_msgSend(v13, "rect");
            v24 = v23;
            objc_msgSend(v13, "rect");
            v26 = v25;
            objc_msgSend(v13, "rect");
            v28 = v27;
            objc_msgSend(v13, "rect");
            v30 = v29;
            if (-[BWPortraitAutoSuggest perFrameObjectValidity:originalFrameWidth:originalFrameHeight:frameWidth:frameHeight:finalCropRect:](a1, v13, Width, Height, (unint64_t)(size.width * (double)Width), (unint64_t)(size.height * (double)Height), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)&& -[BWPortraitAutoSuggest temporalObjectValidity:](a1, v18))
            {
              v31 = objc_msgSend(v18, "validObjectCounter");
              v32 = *(_DWORD *)(a1 + 28);
              if (v31 + 1 < (2 * v32))
              {
                v33 = 1;
LABEL_25:
                v34 = objc_msgSend(v18, "validObjectCounter") + v33;
                goto LABEL_28;
              }
              v34 = (2 * v32);
            }
            else
            {
              if ((int)objc_msgSend(v18, "validObjectCounter") >= 1)
              {
                v33 = -1;
                goto LABEL_25;
              }
              v34 = 0;
            }
LABEL_28:
            v35 = v24 * v10;
            v36 = v26 * v11;
            v37 = v28 * v10;
            v38 = v30 * v11;
            objc_msgSend(v18, "setValidObjectCounter:", v34);
            v67[0] = (float)((float)(v37 * 0.5) + v35);
            v67[1] = (float)((float)(v38 * 0.5) + v36);
            v39 = (void *)objc_msgSend(v18, "centersIn");
            objc_msgSend(v39, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v67, "{CGPoint=dd}"));
            v40 = (void *)objc_msgSend(v18, "objectAreaIn");
            *(float *)&v41 = v37 * v38;
            objc_msgSend(v40, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41));
            objc_msgSend(v13, "rect");
            objc_msgSend(v18, "setRect:");
            -[BWPortraitAutoSuggest updateTrackers:currentTracker:](a1, v20, v18);
          }
          v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        }
        while (v61);
      }
    }
    -[BWPortraitAutoSuggest updateAbsentTrackers:](a1, v60);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v42 = *(void **)(a1 + 120);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
    if (v43)
    {
      v44 = v43;
      v45 = 0;
      v46 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v64 != v46)
            objc_enumerationMutation(v42);
          v48 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          if ((int)objc_msgSend(v48, "validObjectCounter") > (int)v45)
            v45 = objc_msgSend(v48, "validObjectCounter");
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      }
      while (v44);
      v49 = *(_DWORD *)(a1 + 84);
      if (*(_DWORD *)(a1 + 16) < v45)
      {
        if (v45 <= v49)
          goto LABEL_46;
        goto LABEL_45;
      }
      if (v45 > v49)
      {
        if (v45 != 2 * *(_DWORD *)(a1 + 28))
        {
          v50 = *(_DWORD *)(a1 + 12);
LABEL_51:
          *(_DWORD *)(a1 + 12) = v50;
          if (v50 <= (int)(*(_DWORD *)(a1 + 88) - v49))
          {
            v52 = *(_BYTE *)(a1 + 11);
          }
          else
          {
            *(_DWORD *)(a1 + 20) = 0;
            v52 = 1;
          }
          goto LABEL_54;
        }
LABEL_45:
        v50 = *(_DWORD *)(a1 + 12) + 1;
        goto LABEL_51;
      }
    }
    else
    {
      v45 = 0;
    }
LABEL_46:
    v51 = *(_DWORD *)(a1 + 20) + 1;
    *(_DWORD *)(a1 + 20) = v51;
    if (v51 > *(_DWORD *)(a1 + 92))
    {
      v52 = 0;
      v53 = *(_DWORD *)(a1 + 36);
      *(_DWORD *)(a1 + 84) = *(_DWORD *)(a1 + 28);
      *(_DWORD *)(a1 + 88) = v53;
      *(_DWORD *)(a1 + 12) = 0;
      *(_BYTE *)(a1 + 10) = 0;
LABEL_55:
      *(_BYTE *)(a1 + 11) = v52;
      *(_DWORD *)(a1 + 16) = v45;
      return 0;
    }
    v52 = *(_BYTE *)(a1 + 11);
    if (v52)
    {
      v54 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)(a1 + 84) = v54;
      *(_DWORD *)(a1 + 88) = v54;
    }
LABEL_54:
    *(_BYTE *)(a1 + 10) = v52;
    goto LABEL_55;
  }
  return 0;
}

- (uint64_t)updateAbsentTrackers:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v4 = objc_msgSend(*(id *)(a1 + 120), "count");
    if (v4 - 1 >= 0)
    {
      v5 = v4;
      do
      {
        if ((objc_msgSend(a2, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", --v5), "combinedTrackerID"))) & 1) == 0)
        {
          if ((int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter") < 2)v6 = 0;
          else
            v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter")- 1;
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "setValidObjectCounter:", v6);
          if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter"))objc_msgSend(*(id *)(a1 + 120), "removeObjectAtIndex:", v5);
        }
      }
      while (v5 > 0);
    }
  }
  return 0;
}

- (uint64_t)_updateFrameRateDependantParams:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  unsigned int v6;
  unsigned int v7;

  if (result)
  {
    v2 = result;
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v4 = *MEMORY[0x1E0D06978];
    result = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "intValue");
    LODWORD(v5) = 12.0;
    if ((int)result >= 13)
    {
      result = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4, v5), "intValue");
      *(float *)&v5 = (float)result;
    }
    v6 = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 24));
    *(_DWORD *)(v2 + 28) = v6;
    if (!*(_DWORD *)(v2 + 84))
      v6 = 0;
    *(_DWORD *)(v2 + 84) = v6;
    *(_DWORD *)(v2 + 36) = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 32));
    *(_DWORD *)(v2 + 44) = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 40));
    *(int32x2_t *)(v2 + 88) = vrev64_s32((int32x2_t)vcvt_u32_f32(vrndp_f32(vmul_n_f32(*(float32x2_t *)(v2 + 48), *(float *)&v5))));
    v7 = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 96));
    if (v7 <= 2)
      v7 = 2;
    *(_DWORD *)(v2 + 100) = v7;
  }
  return result;
}

- (uint64_t)_adjustMetadataOfSampleBuffer:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v2 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
    v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06480]);
    v5 = *MEMORY[0x1E0D064D0];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D064D0]);
    v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06490]), "setObject:forKeyedSubscript:", v6, v5);
  }
  return result;
}

- (id)getFilteredDetectedObjects:(void *)a3 detectedFacesArray:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id obj;
  id obja;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGRect rect;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  obj = a3;
  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  memset(&rect, 0, sizeof(rect));
  v44 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v36 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v58;
    v33 = *MEMORY[0x1E0D064D0];
    v4 = *MEMORY[0x1E0D06D58];
    v5 = *MEMORY[0x1E0D064A0];
    v41 = *MEMORY[0x1E0D06480];
    v40 = *MEMORY[0x1E0D06490];
    v39 = *MEMORY[0x1E0D06460];
    v38 = *MEMORY[0x1E0D06A48];
    v42 = *MEMORY[0x1E0D06958];
    v35 = a2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(a2);
        v37 = v6;
        v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v7, obj), "objectForKeyedSubscript:", v33);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v54 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              if (objc_msgSend(v13, "objectForKeyedSubscript:", v4))
              {
                v14 = (id)objc_opt_new();
                if (objc_msgSend(v7, "compare:", v5))
                {
                  if (objc_msgSend(v7, "compare:", v41))
                  {
                    if (objc_msgSend(v7, "compare:", v40))
                      continue;
                    v15 = 5;
                  }
                  else
                  {
                    v15 = 3;
                  }
                  v16 = v39;
                }
                else
                {
                  v15 = 1;
                  v16 = v38;
                }
                objc_msgSend(v14, "setObjectType:", v15);
                objc_msgSend(v14, "setTrackerID:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v16), "intValue"));
                objc_msgSend(v14, "setCombinedTrackerID:", (int)objc_msgSend(v14, "trackerID") | (unint64_t)(objc_msgSend(v14, "objectType") << 32));
                objc_msgSend(v14, "setConfidenceLevel:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v42), "intValue"));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v13, "objectForKeyedSubscript:", v4), &rect);
                objc_msgSend(v14, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                objc_msgSend(v44, "addObject:", v14);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
          }
          while (v10);
        }
        v6 = v37 + 1;
        a2 = v35;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v36);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16, obj);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    v20 = *MEMORY[0x1E0D06A48];
    v43 = *MEMORY[0x1E0D06958];
    v21 = *MEMORY[0x1E0D06D58];
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(obja);
        v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        v24 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v20), "intValue");
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v46;
LABEL_32:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v46 != v27)
              objc_enumerationMutation(v44);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v28), "trackerID") == v24)
              break;
            if (v26 == ++v28)
            {
              v26 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
              if (v26)
                goto LABEL_32;
              goto LABEL_38;
            }
          }
        }
        else
        {
LABEL_38:
          v29 = (id)objc_opt_new();
          objc_msgSend(v29, "setObjectType:", 1);
          objc_msgSend(v29, "setTrackerID:", objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v20), "intValue"));
          objc_msgSend(v29, "setCombinedTrackerID:", (int)objc_msgSend(v29, "trackerID") | (unint64_t)(objc_msgSend(v29, "objectType") << 32));
          objc_msgSend(v29, "setConfidenceLevel:", objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v43), "intValue"));
          CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v23, "objectForKeyedSubscript:", v21), &rect);
          objc_msgSend(v29, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          objc_msgSend(v44, "addObject:", v29);
        }
      }
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v18);
  }
  return v44;
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
  self->_shallowDepthOfFieldRenderingEnabled = a3;
}

- (void)setPortTypeIsFFC:(BOOL)a3
{
  self->_portTypeIsFFC = a3;
}

- (BWPortraitAutoSuggest)initWithTuningParameters:(id)a3
{
  BWPortraitAutoSuggest *v4;
  void *v5;
  float v6;
  int v7;
  int v8;
  int v9;
  int v10;
  float v11;
  float v12;
  uint64_t v13;
  int v14;
  double v15;
  int v16;
  int v17;
  int v18;
  float v19;
  float v20;
  int v21;
  int v22;
  int v23;
  int v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BWPortraitAutoSuggest;
  v4 = -[BWPortraitAutoSuggest init](&v26, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PortraitAutoSuggest")));
    *(_WORD *)&v4->_doSuggest = 0;
    v4->_validityCounter = 0;
    v4->_invalidityCounter = 0;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectFrameRatio")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectFrameRatio")), "floatValue");
    else
      v6 = 3.0;
    v4->_objectFrameRatio = v6;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginInRatioWidth")))
      v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginInRatioWidth")), "intValue");
    else
      v7 = 13;
    v4->_marginInRatioWidth = v7;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginInRatioHeight")))
      v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginInRatioHeight")), "intValue");
    else
      v8 = 13;
    v4->_marginInRatioHeight = v8;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginOutRatioWidth")))
      v9 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginOutRatioWidth")), "intValue");
    else
      v9 = 77;
    v4->_marginOutRatioWidth = v9;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginOutRatioHeight")))
      v10 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MarginOutRatioHeight")), "intValue");
    else
      v10 = 77;
    v4->_marginOutRatioHeight = v10;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThCst")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThCst")), "floatValue");
    else
      v11 = 0.5;
    v4->_fadeValidThCst = v11;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeInvalidThCst")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeInvalidThCst")), "floatValue");
    else
      v12 = 2.0;
    v4->_fadeInvalidThCst = v12;
    v13 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("xObjectCenterStdTh"));
    v14 = 973279855;
    LODWORD(v15) = 973279855;
    if (v13)
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("xObjectCenterStdTh"), v15), "floatValue");
    v4->_xObjectCenterStdTh = *(float *)&v15;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("yObjectCenterStdTh")))
    {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("yObjectCenterStdTh")), "floatValue");
      v14 = v16;
    }
    LODWORD(v4->_yObjectCenterStdTh) = v14;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxMotionThreshold")))
      v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxMotionThreshold")), "intValue");
    else
      v17 = 30;
    v4->_maxMotionThreshold = v17;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinMotionThreshold")))
      v18 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinMotionThreshold")), "intValue");
    else
      v18 = 15;
    v4->_minMotionThreshold = v18;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThInvalidityActive")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThInvalidityActive")), "floatValue");
    else
      v19 = 0.5;
    v4->_fadeValidThInvalidityActiveSec = v19;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThInvalidityBuild")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FadeValidThInvalidityBuild")), "floatValue");
    else
      v20 = 0.0;
    v4->_fadeValidThInvalidityBuildSec = v20;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ValidObjectIntervalTh")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ValidObjectIntervalTh")), "floatValue");
    else
      v21 = 1051372203;
    LODWORD(v4->_validObjectIntervalThSec) = v21;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectCentersLookbackInterval")))
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectCentersLookbackInterval")), "floatValue");
    else
      v22 = 1042983595;
    LODWORD(v4->_objectCentersLookbackIntervalSec) = v22;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectBoxFrameAreaValidityRatio")))
      v23 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectBoxFrameAreaValidityRatio")), "intValue");
    else
      v23 = 250;
    v4->_objectBoxFrameAreaValidityRatio = v23;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectBoxFrameAreaValidityRatioWhenOn")))
      v24 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ObjectBoxFrameAreaValidityRatioWhenOn")), "intValue");
    else
      v24 = 260;
    v4->_objectBoxFrameAreaValidityRatioWhenOn = v24;
    v4->_validObjectCounterOld = 0;
    v4->_trackers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_temporalValidityTh = 1000;
  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  self->_trackers = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPortraitAutoSuggest;
  -[BWPortraitAutoSuggest dealloc](&v3, sel_dealloc);
}

- (uint64_t)perFrameObjectValidity:(unint64_t)a3 originalFrameWidth:(unint64_t)a4 originalFrameHeight:(unint64_t)a5 frameWidth:(unint64_t)a6 frameHeight:(double)a7 finalCropRect:(double)a8
{
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  float v32;
  float v33;
  double v34;
  double v35;
  double v36;
  float v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  float v43;
  _BOOL4 v44;
  float v45;
  float v46;
  BOOL v47;
  float v48;
  int v49;
  float v50;

  if (result)
  {
    v17 = result;
    objc_msgSend(a2, "rect");
    v19 = (double)a3;
    v20 = (v18 - a7) * (double)a3;
    objc_msgSend(a2, "rect");
    v22 = v21;
    objc_msgSend(a2, "rect");
    v24 = v23;
    objc_msgSend(a2, "rect");
    v26 = v25;
    objc_msgSend(a2, "rect");
    v28 = v27;
    objc_msgSend(a2, "rect");
    result = 0;
    if (v20 >= 0.0)
    {
      v50 = v20;
      v30 = (double)a4;
      v31 = (v26 - a8) * (double)a4;
      if (v31 >= 0.0)
      {
        v32 = (v22 + v24 - a7) * v19;
        if (a9 * v19 >= v32)
        {
          v33 = (v28 + v29 - a8) * v30;
          if (a10 * v30 >= v33)
          {
            objc_msgSend(a2, "rect", v33, a10 * v30);
            v35 = v34;
            objc_msgSend(a2, "rect");
            v37 = v36 * v30;
            v38 = a6 / *(_DWORD *)(v17 + 72);
            v39 = 68;
            if (*(_BYTE *)(v17 + 11))
              v39 = 76;
            v40 = 64;
            if (!*(_BYTE *)(v17 + 11))
              v40 = 60;
            v41 = a5 / *(_DWORD *)(v17 + v39);
            if (v50 <= (float)v41 || v31 <= (float)v38)
            {
              v44 = 0;
            }
            else
            {
              v43 = (float)(a6 - v38);
              v44 = v32 < (float)(a5 - v41);
              if (v33 >= v43)
                v44 = 0;
            }
            v45 = *(float *)(v17 + 56);
            if ((float)((float)a6 / v45) <= v37)
            {
              if (!*(_BYTE *)(v17 + 9))
                goto LABEL_31;
            }
            else
            {
              v46 = v35 * v19;
              v47 = (float)(v46 * v37) < (float)((float)(a6 * a5) / (float)*(unsigned int *)(v17 + v40));
              v48 = (float)a5 / v45;
              v49 = !v47 && v44;
              if (*(_BYTE *)(v17 + 9))
              {
                result = 0;
                if (v48 <= v46 || ((v49 ^ 1) & 1) != 0)
                  return result;
                goto LABEL_31;
              }
              if (v48 <= v46)
                v49 = 1;
              if (v49 == 1)
              {
LABEL_31:
                if (objc_msgSend(a2, "objectType") == 1
                  || objc_msgSend(a2, "objectType") == 3
                  || objc_msgSend(a2, "objectType") == 5)
                {
                  return 1;
                }
              }
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)temporalObjectValidity:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  unsigned int v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  unsigned int v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  double v55;
  double v56;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", objc_msgSend(a2, "centersIn"));
    if (*(_DWORD *)(v3 + 100) < 2u)
      return 1;
    v5 = v4;
    if (objc_msgSend(v4, "count") < (unint64_t)*(unsigned int *)(v3 + 100))
    {
      objc_msgSend((id)objc_msgSend(a2, "centerVx"), "addObject:", &unk_1E49F97B0);
      objc_msgSend((id)objc_msgSend(a2, "centerVy"), "addObject:", &unk_1E49F97B0);
      objc_msgSend((id)objc_msgSend(a2, "centerDx"), "addObject:", &unk_1E49F97B0);
      objc_msgSend((id)objc_msgSend(a2, "centerDy"), "addObject:", &unk_1E49F97B0);
      return 0;
    }
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        v56 = 0.0;
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v8, 0), "getValue:", &v55);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55));
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56));
        ++v8;
      }
      while (objc_msgSend(v5, "count") > v8);
    }
    v9 = stdDeviation(v6);
    v10 = stdDeviation(v7);
    v11 = (void *)objc_msgSend(a2, "centerVx");
    *(float *)&v12 = v9;
    objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12));
    v13 = (void *)objc_msgSend(a2, "centerVy");
    *(float *)&v14 = v10;
    objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14));
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 1), "floatValue");
    v16 = v15;
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2), "floatValue");
    v18 = vabds_f32(v16, v17);
    objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "floatValue");
    v20 = v19;
    objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 2), "floatValue");
    v22 = vabds_f32(v20, v21);
    v23 = (void *)objc_msgSend(a2, "centerDx");
    *(float *)&v24 = v18;
    objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24));
    v25 = (void *)objc_msgSend(a2, "centerDy");
    *(float *)&v26 = v22;
    objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26));
    v27 = (float)*(unsigned int *)(v3 + 108);
    v28 = (float)*(unsigned int *)(v3 + 104);
    v29 = *(float *)(v3 + 112);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
    if ((float)(v29 * v30) <= v28)
    {
      v32 = *(float *)(v3 + 112);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
      v31 = v32 * v33;
    }
    else
    {
      v31 = (float)*(unsigned int *)(v3 + 104);
    }
    if (v31 >= v27)
    {
      v35 = (float)*(unsigned int *)(v3 + 104);
      v36 = *(float *)(v3 + 112);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
      if ((float)(v36 * v37) <= v35)
      {
        v39 = *(float *)(v3 + 112);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
        v38 = v39 * v40;
LABEL_17:
        v41 = (float)*(unsigned int *)(v3 + 108);
        v42 = (float)*(unsigned int *)(v3 + 104);
        v43 = *(float *)(v3 + 116);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
        if ((float)(v43 * v44) <= v42)
        {
          v46 = *(float *)(v3 + 116);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
          v45 = v46 * v47;
        }
        else
        {
          v45 = (float)*(unsigned int *)(v3 + 104);
        }
        if (v45 >= v41)
        {
          v49 = (float)*(unsigned int *)(v3 + 104);
          v50 = *(float *)(v3 + 116);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
          if ((float)(v50 * v51) <= v49)
          {
            v53 = *(float *)(v3 + 116);
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
            v52 = v53 * v54;
            return v10 <= v52 && v9 <= v38;
          }
          v48 = *(_DWORD *)(v3 + 104);
        }
        else
        {
          v48 = *(_DWORD *)(v3 + 108);
        }
        v52 = (float)v48;
        return v10 <= v52 && v9 <= v38;
      }
      v34 = *(_DWORD *)(v3 + 104);
    }
    else
    {
      v34 = *(_DWORD *)(v3 + 108);
    }
    v38 = (float)v34;
    goto LABEL_17;
  }
  return result;
}

- (uint64_t)updateTrackers:(void *)a3 currentTracker:
{
  void *v6;

  if (a1)
  {
    -[BWPortraitAutoSuggest _pruneTrackerArrays:](a1, a3);
    v6 = *(void **)(a1 + 120);
    if (a2 == -1)
      objc_msgSend(v6, "addObject:", a3);
    else
      objc_msgSend(v6, "setObject:atIndexedSubscript:", a3, a2);
  }
  return 0;
}

- (unint64_t)_pruneTrackerArrays:(unint64_t)result
{
  unint64_t v3;

  if (result)
  {
    v3 = result;
    if (objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "count") > (unint64_t)*(unsigned int *)(result + 100))
      objc_msgSend(a2, "setObjectAreaIn:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "count") - *(unsigned int *)(v3 + 100))));
    if (objc_msgSend((id)objc_msgSend(a2, "centersIn"), "count") > (unint64_t)*(unsigned int *)(v3 + 100))
      objc_msgSend(a2, "setCentersIn:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centersIn"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centersIn"), "count") - *(unsigned int *)(v3 + 100))));
    result = objc_msgSend((id)objc_msgSend(a2, "centerVx"), "count");
    if (result > *(unsigned int *)(v3 + 100))
    {
      objc_msgSend(a2, "setCenterVx:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerVx"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerVx"), "count") - *(unsigned int *)(v3 + 100))));
      objc_msgSend(a2, "setCenterVy:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerVy"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerVy"), "count") - *(unsigned int *)(v3 + 100))));
      objc_msgSend(a2, "setCenterDx:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerDx"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerDx"), "count") - *(unsigned int *)(v3 + 100))));
      return objc_msgSend(a2, "setCenterDy:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerDy"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerDy"), "count") - *(unsigned int *)(v3 + 100))));
    }
  }
  return result;
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return self->_shallowDepthOfFieldRenderingEnabled;
}

- (BOOL)portTypeIsFFC
{
  return self->_portTypeIsFFC;
}

@end
