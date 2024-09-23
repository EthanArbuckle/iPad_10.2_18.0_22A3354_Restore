@implementation BWIrisStillImageMovieMetadataCache

- (void)cacheStillImageTransformDataFromMetadata:(id)a3 transformReferenceDimensions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = *MEMORY[0x1E0D088D8];
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D088D8]);
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A00]);
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FinalCropRectForIrisStillImageMovieMetadataCache"));
  if (!v10)
    v10 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]);
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PreviewShiftForIrisStillImageMovieMetadataCache"));
  if (v8)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = v11;
    pthread_mutex_lock((pthread_mutex_t *)self->super._propertyMutex);
    v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->super._cache, "objectForKeyedSubscript:", v9);
    v15 = (void *)v14;
    if (!v14)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._cache, "setObject:forKeyedSubscript:", v15, v9);
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v7);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D05E68]);
    if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)&a4))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4), CFSTR("VitalityTransformReferenceWidth"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&a4)), CFSTR("VitalityTransformReferenceHeight"));
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("PreviewShiftTranslation"));
    pthread_mutex_unlock((pthread_mutex_t *)self->super._propertyMutex);
  }
}

- (void)cacheStillImageVideoToPhotoTransform:(id)a3 forSettingsID:(id)a4
{
  void *v7;

  if (a3 && a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->super._propertyMutex);
    v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._cache, "objectForKeyedSubscript:", a4);
    if (!v7)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._cache, "setObject:forKeyedSubscript:", v7, a4);
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, CFSTR("VideoToPhotoTransform"));
    pthread_mutex_unlock((pthread_mutex_t *)self->super._propertyMutex);
  }
}

- (id)copyAndClearStillImageTransformDataForSettingsID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  int CGRectIfPresent;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  float32x4_t *v20;
  uint64_t v21;
  float32x4_t v22;
  uint64_t i;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  int *v27;
  int v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  uint64_t v33;
  float32x4_t v34;
  uint64_t v35;
  uint64_t v36;
  __int32 v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  uint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  uint64_t v56;
  uint64_t v57;
  float32x4_t *v58;
  uint64_t v59;
  __int128 v60;
  float32x4_t *v61;
  float32x4_t v63;
  float64x2_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  __int128 v71;
  __int128 v72;
  CGPoint point;
  __int128 v74;
  float64x2_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = -[BWSimpleCache copyAndClearObjectForKey:](self, "copyAndClearObjectForKey:", a3);
  v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D088D8]);
  v5 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VideoToPhotoTransform"));
  v6 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PreviewShiftTranslation"));
  if (v4)
  {
    v7 = (const __CFDictionary *)v6;
    if (v5 | v6)
    {
      v74 = 0u;
      v75 = 0u;
      CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
      __asm { FMOV            V0.2D, #1.0 }
      if (!CGRectIfPresent)
      {
        v74 = 0uLL;
        v75 = _Q0;
      }
      v64 = _Q0;
      v14 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VitalityTransformReferenceWidth")), "intValue");
      v15 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VitalityTransformReferenceHeight")), "intValue");
      v16 = v15 << 32;
      v17 = v14;
      if (FigCaptureVideoDimensionsAreValid(v14 | ((unint64_t)v15 << 32)))
      {
        v18 = v16;
      }
      else
      {
        v17 = 1920;
        v18 = 0x5A000000000;
      }
      v19 = objc_msgSend(v4, "length");
      v20 = (float32x4_t *)MEMORY[0x1E0C83FE8];
      if (v19 <= 0x23)
      {
        v29 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 16);
        v76 = *(float32x4_t *)MEMORY[0x1E0C83FE8];
        v77 = v29;
        v78 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32);
      }
      else
      {
        v21 = objc_msgSend(v4, "bytes");
        v22 = v20[1];
        v76 = *v20;
        v77 = v22;
        v78 = v20[2];
        if (v21)
        {
          for (i = 0; i != 3; ++i)
          {
            v24 = 0;
            v25 = (_OWORD *)&v76.f32[4 * i];
            v26 = *v25;
            v27 = (int *)v21;
            do
            {
              v28 = *v27;
              v27 += 3;
              v72 = v26;
              *(_DWORD *)((unint64_t)&v72 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3))) = v28;
              v26 = v72;
              ++v24;
            }
            while (v24 != 3);
            *((_DWORD *)v25 + 2) = DWORD2(v72);
            *(_QWORD *)v25 = v26;
            v21 += 4;
          }
        }
      }
      v30 = v76;
      v31 = v77;
      v32 = v78;
      v30.i32[3] = 0;
      v31.i32[3] = 0;
      v32.i32[3] = 0;
      if (v5)
      {
        v65 = v31;
        v67 = v30;
        v69 = v32;
        v33 = 0;
        v34 = v20[1];
        v76 = *v20;
        v77 = v34;
        v78 = v20[2];
        do
        {
          v35 = 0;
          v36 = v33;
          do
          {
            objc_msgSend((id)objc_msgSend((id)v5, "objectAtIndexedSubscript:", v36), "floatValue");
            v76.i32[4 * v33 + v35++] = v37;
            v36 += 3;
          }
          while (v35 != 3);
          ++v33;
        }
        while (v33 != 3);
        v38 = v76;
        v39 = v77;
        v40 = v78;
        v38.i32[3] = 0;
        v39.i32[3] = 0;
        v40.i32[3] = 0;
        *(double *)v41.i64 = scaleHomography(v38, v39, v40, v75.f64[0], v75.f64[1]);
        *(double *)v44.i64 = bwsc_convertHomographyToPixelCoordinates(v18 | v17, v41, v42, v43);
        v47 = 0;
        v79 = v67;
        v80 = v65;
        v81 = v69;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v76 + v47 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)((char *)&v79 + v47 * 4))), v45, *(float32x2_t *)&v79.f32[v47], 1), v46, *(float32x4_t *)((char *)&v79 + v47 * 4), 2);
          v47 += 4;
        }
        while (v47 != 12);
        v30 = v76;
        v31 = v77;
        v32 = v78;
      }
      if (v7)
      {
        v63 = v20[2];
        v68 = v30;
        v70 = v32;
        point = (CGPoint)*MEMORY[0x1E0C9D538];
        v66 = v31;
        CGPointMakeWithDictionaryRepresentation(v7, &point);
        v48.i64[1] = *(_QWORD *)&point.y;
        *(float32x2_t *)v48.f32 = vcvt_f32_f64((float64x2_t)point);
        v49.i64[0] = vnegq_f32(v48).u64[0];
        v49.i64[1] = v63.i64[1];
        v75 = vdivq_f64(v64, v75);
        *(double *)v50.i64 = scaleHomography(*v20, v20[1], v49, v75.f64[0], v75.f64[1]);
        *(double *)v53.i64 = bwsc_convertHomographyToPixelCoordinates(v18 | v17, v50, v51, v52);
        v56 = 0;
        v79 = v68;
        v80 = v66;
        v81 = v70;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v76 + v56 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(_OWORD *)((char *)&v79 + v56 * 4))), v54, *(float32x2_t *)&v79.f32[v56], 1), v55, *(float32x4_t *)((char *)&v79 + v56 * 4), 2);
          v56 += 4;
        }
        while (v56 != 12);
        v30 = v76;
        v31 = v77;
        v32 = v78;
      }
      v57 = 0;
      v76 = v30;
      v77 = v31;
      v58 = &v79;
      v78 = v32;
      do
      {
        v59 = 0;
        v60 = *((_OWORD *)&v76 + v57);
        v61 = v58;
        do
        {
          v71 = v60;
          v61->i32[0] = *(_DWORD *)((unint64_t)&v71 & 0xFFFFFFFFFFFFFFF3 | (4 * (v59 & 3)));
          v61 = (float32x4_t *)((char *)v61 + 12);
          ++v59;
        }
        while (v59 != 3);
        ++v57;
        v58 = (float32x4_t *)((char *)v58 + 4);
      }
      while (v57 != 3);
      v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v79, 36);
    }
  }
  return v4;
}

@end
