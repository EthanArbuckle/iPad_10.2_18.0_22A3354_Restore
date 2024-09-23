@implementation PregateFeatureBuilder

- (int)fillVector:(void *)a3 withPerFrameStats:(id)a4
{
  NSArray *movieMetadata;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  unint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  id v29;
  NSArray *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = a4;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  movieMetadata = self->_movieMetadata;
  if (movieMetadata)
  {
    sub_1D4C74918((void **)a3, -[NSArray count](movieMetadata, "count"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = self->_movieMetadata;
    v7 = 0;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = objc_msgSend(v12, "BOOLValue");
          else
            v13 = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v29);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "floatValue");
              v16 = v15;
              v18 = (_DWORD *)*((_QWORD *)a3 + 1);
              v17 = *((_QWORD *)a3 + 2);
              if ((unint64_t)v18 >= v17)
              {
                v20 = *(_DWORD **)a3;
                v21 = ((uint64_t)v18 - *(_QWORD *)a3) >> 2;
                v22 = v21 + 1;
                if ((unint64_t)(v21 + 1) >> 62)
                  sub_1D4C590D0();
                v23 = v17 - (_QWORD)v20;
                if (v23 >> 1 > v22)
                  v22 = v23 >> 1;
                if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
                  v24 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v24 = v22;
                if (v24)
                {
                  v25 = (char *)sub_1D4C61FFC((uint64_t)a3 + 16, v24);
                  v20 = *(_DWORD **)a3;
                  v18 = (_DWORD *)*((_QWORD *)a3 + 1);
                }
                else
                {
                  v25 = 0;
                }
                v26 = &v25[4 * v21];
                *(_DWORD *)v26 = v16;
                v19 = v26 + 4;
                while (v18 != v20)
                {
                  v27 = *--v18;
                  *((_DWORD *)v26 - 1) = v27;
                  v26 -= 4;
                }
                *(_QWORD *)a3 = v26;
                *((_QWORD *)a3 + 1) = v19;
                *((_QWORD *)a3 + 2) = &v25[4 * v24];
                if (v20)
                  operator delete(v20);
              }
              else
              {
                *v18 = v15;
                v19 = v18 + 1;
              }
              *((_QWORD *)a3 + 1) = v19;
            }
            else if (!v13)
            {
              v7 = -4443998;
            }

          }
          else
          {
            NSLog(CFSTR("array entry for frame is not a dictionary\n"));
            v7 = -4444005;
          }

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v8);
    }

  }
  else
  {
    v7 = -4444007;
  }

  return v7;
}

- (int)standardProcessKey:(id)a3 addToDictionary:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void *__p;
  void *v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  __p = 0;
  v30 = 0;
  v31 = 0;
  v8 = -[PregateFeatureBuilder fillVector:withPerFrameStats:](self, "fillVector:withPerFrameStats:", &__p, v6);
  v9 = __p;
  if (!v8 && v30 != __p)
  {
    v27 = 0;
    v28 = 0;
    sub_1D4C74448((uint64_t)&__p, (float *)&v27, (float *)&v28 + 1, (float *)&v28, (float *)&v27 + 1);
    objc_msgSend(CFSTR("pregate_"), "stringByAppendingString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("_mean"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v11);

    objc_msgSend(CFSTR("pregate_"), "stringByAppendingString:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("_max"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v16) = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v15);

    objc_msgSend(CFSTR("pregate_"), "stringByAppendingString:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("_min"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = HIDWORD(v28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v19);

    objc_msgSend(CFSTR("pregate_"), "stringByAppendingString:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("_sd"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v24) = HIDWORD(v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v23);

    v9 = __p;
  }
  if (v9)
  {
    v30 = v9;
    operator delete(v9);
  }

  return v8;
}

- (int)processStandardPerFrameKeys
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->stdProcessInputKeysArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v3);
      v7 = -[PregateFeatureBuilder standardProcessKey:addToDictionary:](self, "standardProcessKey:addToDictionary:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), self->featuresDict, (_QWORD)v9);
      if (v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return v7;
}

- (int)processVideoFaceInfo
{
  double v2;
  NSArray *movieMetadata;
  uint64_t v4;
  uint64_t v5;
  float v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  float v17;
  uint64_t v18;
  float v19;
  void *v20;
  char isKindOfClass;
  double v22;
  float v23;
  void *v24;
  void *v25;
  NSArray *obj;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  uint64_t i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  movieMetadata = self->_movieMetadata;
  if (movieMetadata)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = movieMetadata;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v4)
    {
      v31 = 0;
      v5 = 0;
      v29 = *(_QWORD *)v39;
      v30 = v4;
      v6 = 0.0;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("privDFArray"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v32 = v7;
          if (v7)
          {
            v9 = objc_msgSend(v7, "count");
            v10 = v31;
            if ((int)v31 <= v9)
              v10 = v9;
            v31 = v10;
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v11 = v8;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v35;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v35 != v13)
                    objc_enumerationMutation(v11);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("Rect"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Width"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v17 = 0.0;
                    v18 = 4290523293;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v16, "floatValue");
                      v17 = v19;
                      v18 = v5;
                    }
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Height"));
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();
                    LODWORD(v22) = 0;
                    v5 = 4290523293;
                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v20, "floatValue", v22);
                      v5 = v18;
                    }
                    v23 = v17 * *(float *)&v22;
                    if (v6 < v23)
                      v6 = v23;

                  }
                  else
                  {
                    v5 = 4290523293;
                  }

                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v12);
            }

          }
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v30);
    }
    else
    {
      v31 = 0;
      LODWORD(v5) = 0;
      v6 = 0.0;
    }

  }
  else
  {
    v31 = 0;
    LODWORD(v5) = -4444007;
    v6 = 0.0;
  }
  *(float *)&v2 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v24, CFSTR("PREGATE_VIDEO_FACE_MAX_SIZE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v25, CFSTR("PREGATE_VIDEO_FACE_MAX_COUNT"));

  return v5;
}

- (int)processPresentationTimes
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  CMTimeEpoch v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  Float64 Seconds;
  void *v19;
  void *v20;
  Float64 v21;
  void *v22;
  void *v23;
  Float64 v24;
  void *v25;
  void *v26;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime time;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime time2;
  CMTime time1;
  CMTime v38;
  CMTime v39;
  CMTime rhs;
  CMTime lhs;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;

  v43 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  begin = self->_frameTimes.__begin_;
  v4 = (self->_frameTimes.__end_ - begin) / 24;
  v5 = 0;
  if (self->_frameTimes.__end_ != begin)
  {
    if (v4 <= 1)
      v6 = 1;
    else
      v6 = (self->_frameTimes.__end_ - begin) / 24;
    v7 = (int *)((char *)begin + 12);
    do
    {
      v8 = *v7;
      v7 += 6;
      if ((v8 & 0x1D) != 1)
        v5 = -4443999;
      --v6;
    }
    while (v6);
  }
  if (v4 > 1)
  {
    memset(&v42, 0, sizeof(v42));
    lhs = *(CMTime *)((_BYTE *)begin + 1);
    v9 = *((_QWORD *)begin + 2);
    *(_OWORD *)&rhs.value = *(_OWORD *)begin;
    rhs.epoch = v9;
    CMTimeSubtract(&v42, &lhs, &rhs);
    v43 = v42;
    v44 = v42;
    v45 = v42;
    v10 = self->_frameTimes.__begin_;
    v11 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - v10) >> 3);
    if (v11 >= 3)
    {
      v12 = 0;
      v13 = 2;
      do
      {
        memset(&v42, 0, sizeof(v42));
        v14 = (char *)v10 + v12;
        v15 = *((_OWORD *)v14 + 3);
        v39.epoch = *((_QWORD *)v14 + 8);
        *(_OWORD *)&v39.value = v15;
        v16 = *(_OWORD *)(v14 + 24);
        v38.epoch = *((_QWORD *)v14 + 5);
        *(_OWORD *)&v38.value = v16;
        CMTimeSubtract(&v42, &v39, &v38);
        time1 = v42;
        time2 = v45;
        if (CMTimeCompare(&time1, &time2) < 0)
          v45 = v42;
        v35 = v42;
        v34 = v44;
        if (CMTimeCompare(&v35, &v34) >= 1)
          v44 = v42;
        v33 = v43;
        v32 = v42;
        CMTimeAdd(&v43, &v33, &v32);
        ++v13;
        v10 = self->_frameTimes.__begin_;
        v11 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - v10) >> 3);
        v12 += 24;
      }
      while (v11 > v13);
    }
    time = v43;
    CMTimeMultiplyByRatio(&v43, &time, 1, v11 - 1);
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v30 = v44;
    Seconds = CMTimeGetSeconds(&v30);
    *(float *)&Seconds = Seconds;
    objc_msgSend(v17, "numberWithFloat:", Seconds);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v19, CFSTR("PREGATE_GAP_MAX"));

    v20 = (void *)MEMORY[0x1E0CB37E8];
    v29 = v45;
    v21 = CMTimeGetSeconds(&v29);
    *(float *)&v21 = v21;
    objc_msgSend(v20, "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v22, CFSTR("PREGATE_GAP_MIN"));

    v23 = (void *)MEMORY[0x1E0CB37E8];
    v28 = v43;
    v24 = CMTimeGetSeconds(&v28);
    *(float *)&v24 = v24;
    objc_msgSend(v23, "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v25, CFSTR("PREGATE_GAP_MEAN"));

    v4 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - self->_frameTimes.__begin_) >> 3);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v26, CFSTR("PREGATE_NUM_FRAMES"));

  return v5;
}

- (int)processOffsetVectors
{
  double v2;
  int64_t v3;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  float *v11;
  float v12;
  float v13;
  float *v14;
  uint64_t v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *__p[3];
  void *v52[3];
  float32x2_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float32x2_t v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = 0;
  v53 = 0;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  v3 = self->_frameOffsets.__end_ - self->_frameOffsets.__begin_;
  if ((int)(v3 >> 3) >= 1)
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if ((v3 >> 3) != 1)
    {
      v9 = (v3 >> 3) - 1;
      sub_1D4C62744(v52, v9);
      sub_1D4C77518(__p, v9);
      begin = self->_frameOffsets.__begin_;
      v12 = *(float *)begin;
      v13 = *((float *)begin + 1);
      v11 = (float *)((char *)begin + 12);
      v14 = (float *)((char *)__p[0] + 4);
      v15 = ((unint64_t)v3 >> 3) - 1;
      v16 = (float *)v52[0];
      v8 = v13;
      v7 = v13;
      v6 = v12;
      v5 = v12;
      do
      {
        v17 = *(v11 - 1);
        v18 = *v11;
        if (v5 < v17)
          v5 = *(v11 - 1);
        if (v7 < v18)
          v7 = *v11;
        if (v17 < v6)
          v6 = *(v11 - 1);
        v19 = v17 - v12;
        v20 = v18 - v13;
        *(v14 - 1) = v19;
        *v14 = v20;
        *v16++ = sqrtf((float)(v20 * v20) + (float)(v19 * v19));
        if (v18 < v8)
          v8 = v18;
        v12 = *(v11 - 1);
        v13 = *v11;
        v11 += 2;
        v14 += 2;
        --v15;
      }
      while (v15);
      sub_1D4C74448((uint64_t)v52, (float *)&v55 + 1, (float *)&v54 + 1, (float *)&v55, (float *)&v54);
      sub_1D4C742B0((uint64_t)__p, &v53, &v57, (float *)&v56);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v52[0])
      {
        v52[1] = v52[0];
        operator delete(v52[0]);
      }
    }
    *(float *)&v2 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v21, CFSTR("PREGATE_MOTION_OFFSET_MAX_X"));

    *(float *)&v22 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v23, CFSTR("PREGATE_MOTION_OFFSET_MAX_Y"));

    *(float *)&v24 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v25, CFSTR("PREGATE_MOTION_OFFSET_MIN_X"));

    *(float *)&v26 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v27, CFSTR("PREGATE_MOTION_OFFSET_MIN_Y"));

    LODWORD(v28) = v53.i32[0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v29, CFSTR("PREGATE_MOTION_DELTA_MEAN_X"));

    LODWORD(v30) = v53.i32[1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v31, CFSTR("PREGATE_MOTION_DELTA_MEAN_Y"));

    LODWORD(v32) = v57.i32[0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v33, CFSTR("PREGATE_MOTION_DELTA_COVAR_X"));

    LODWORD(v34) = HIDWORD(v58);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v35, CFSTR("PREGATE_MOTION_DELTA_COVAR_Y"));

    LODWORD(v36) = v57.i32[1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v37, CFSTR("PREGATE_MOTION_DELTA_COVAR_XY"));

    LODWORD(v38) = v56;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v39, CFSTR("PREGATE_MOTION_DELTA_EIGEN_1"));

    LODWORD(v40) = HIDWORD(v56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v41, CFSTR("PREGATE_MOTION_DELTA_EIGEN_2"));

    LODWORD(v42) = HIDWORD(v55);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v43, CFSTR("PREGATE_MOTION_DELTA_MAG_MEAN"));

    LODWORD(v44) = HIDWORD(v54);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v45, CFSTR("PREGATE_MOTION_DELTA_MAG_MIN"));

    LODWORD(v46) = v55;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v47, CFSTR("PREGATE_MOTION_DELTA_MAG_MAX"));

    LODWORD(v48) = v54;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v49, CFSTR("PREGATE_MOTION_DELTA_MAG_STDDEV"));

  }
  return 0;
}

- (int)processBlurVectors
{
  uint64_t *p_frameBlurVectors;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  begin = self->_frameBlurVectors.__begin_;
  end = self->_frameBlurVectors.__end_;
  p_frameBlurVectors = (uint64_t *)&self->_frameBlurVectors;
  if (end != begin)
  {
    v15 = 0;
    v16 = 0;
    sub_1D4C74510(p_frameBlurVectors, (float *)&v16 + 1, (float *)&v16, (float *)&v15 + 1, (float *)&v15);
    LODWORD(v6) = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v7, CFSTR("PREGATE_BLUR_MIN"));

    LODWORD(v8) = HIDWORD(v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v9, CFSTR("PREGATE_BLUR_MAX"));

    LODWORD(v10) = HIDWORD(v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v11, CFSTR("PREGATE_BLUR_MEAN"));

    LODWORD(v12) = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v13, CFSTR("PREGATE_BLUR_STDDEV"));

  }
  return 0;
}

- (int)readPerFrameMetadataToArrays
{
  vector<CMTime, std::allocator<CMTime>> *p_frameTimes;
  vector<FloatPoint, std::allocator<FloatPoint>> *p_frameOffsets;
  vector<FloatPoint, std::allocator<FloatPoint>> *p_frameBlurVectors;
  NSArray *movieMetadata;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  __int128 v28;
  void *v29;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v39;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v40;
  uint64_t v41;
  void *v42;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v43;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v44;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v53;
  uint64_t v54;
  __compressed_pair<FloatPoint *, std::allocator<FloatPoint>> *p_end_cap;
  vector<FloatPoint, std::allocator<FloatPoint>> *v57;
  vector<FloatPoint, std::allocator<FloatPoint>> *v58;
  vector<CMTime, std::allocator<CMTime>> *v59;
  NSArray *obj;
  CMTime v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  p_frameTimes = &self->_frameTimes;
  self->_frameTimes.__end_ = self->_frameTimes.__begin_;
  p_frameOffsets = &self->_frameOffsets;
  self->_frameOffsets.__end_ = self->_frameOffsets.__begin_;
  p_frameBlurVectors = &self->_frameBlurVectors;
  self->_frameBlurVectors.__end_ = self->_frameBlurVectors.__begin_;
  movieMetadata = self->_movieMetadata;
  if (!movieMetadata)
    return -4444007;
  sub_1D4C5B0B0((void **)&p_frameTimes->__begin_, -[NSArray count](movieMetadata, "count"));
  sub_1D4C6736C((void **)&p_frameOffsets->__begin_, -[NSArray count](self->_movieMetadata, "count"));
  sub_1D4C6736C((void **)&p_frameBlurVectors->__begin_, -[NSArray count](self->_movieMetadata, "count"));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = self->_movieMetadata;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v7)
  {
    v57 = p_frameBlurVectors;
    v58 = p_frameOffsets;
    v59 = p_frameTimes;
    v8 = 0;
    v9 = *(_QWORD *)v63;
    p_end_cap = &self->_frameBlurVectors.__end_cap_;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v63 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"), p_end_cap);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v12, "BOOLValue") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
            v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              CMTimeMakeFromDictionary(&v61, v13);
              end = self->_frameTimes.__end_;
              value = self->_frameTimes.__end_cap_.__value_;
              if (end >= value)
              {
                v18 = 0xAAAAAAAAAAAAAAABLL * ((end - v59->__begin_) >> 3);
                v19 = v18 + 1;
                if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
                  sub_1D4C590D0();
                v20 = 0xAAAAAAAAAAAAAAABLL * ((value - v59->__begin_) >> 3);
                if (2 * v20 > v19)
                  v19 = 2 * v20;
                if (v20 >= 0x555555555555555)
                  v21 = 0xAAAAAAAAAAAAAAALL;
                else
                  v21 = v19;
                if (v21)
                  v22 = (char *)sub_1D4C59158((uint64_t)&self->_frameTimes.__end_cap_, v21);
                else
                  v22 = 0;
                v23 = &v22[24 * v18];
                v24 = *(_OWORD *)&v61.value;
                *((_QWORD *)v23 + 2) = v61.epoch;
                *(_OWORD *)v23 = v24;
                begin = self->_frameTimes.__begin_;
                v25 = self->_frameTimes.__end_;
                v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v23;
                if (v25 != begin)
                {
                  do
                  {
                    v28 = *(_OWORD *)((char *)v25 - 24);
                    *((_QWORD *)v27 - 1) = *((_QWORD *)v25 - 1);
                    *(_OWORD *)((char *)v27 - 24) = v28;
                    v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v27 - 24);
                    v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v25 - 24);
                  }
                  while (v25 != begin);
                  v25 = v59->__begin_;
                }
                v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v23 + 24);
                self->_frameTimes.__begin_ = v27;
                self->_frameTimes.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v23 + 24);
                self->_frameTimes.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v22[24 * v21];
                if (v25)
                  operator delete(v25);
              }
              else
              {
                v16 = *(_OWORD *)&v61.value;
                *((_QWORD *)end + 2) = v61.epoch;
                *(_OWORD *)end = v16;
                v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
              }
              self->_frameTimes.__end_ = v17;
            }
            else
            {
              v8 = -4444002;
            }
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("privECMVct"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v29, "getBytes:length:", &v61, 8);
              v31 = self->_frameOffsets.__end_;
              v30 = self->_frameOffsets.__end_cap_.__value_;
              if (v31 >= v30)
              {
                v33 = (v31 - v58->__begin_) >> 3;
                if ((unint64_t)(v33 + 1) >> 61)
                  sub_1D4C590D0();
                v34 = v30 - v58->__begin_;
                v35 = v34 >> 2;
                if (v34 >> 2 <= (unint64_t)(v33 + 1))
                  v35 = v33 + 1;
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
                  v36 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v36 = v35;
                if (v36)
                  v37 = (char *)sub_1D4C60BD8((uint64_t)&self->_frameOffsets.__end_cap_, v36);
                else
                  v37 = 0;
                v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v33];
                *(_QWORD *)v38 = v61.value;
                v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 + 8);
                v40 = self->_frameOffsets.__begin_;
                v39 = self->_frameOffsets.__end_;
                if (v39 != v40)
                {
                  do
                  {
                    v41 = *((_QWORD *)v39 - 1);
                    v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 - 8);
                    *((_QWORD *)v38 - 1) = v41;
                    v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 - 8);
                  }
                  while (v39 != v40);
                  v39 = v58->__begin_;
                }
                self->_frameOffsets.__begin_ = v38;
                self->_frameOffsets.__end_ = v32;
                self->_frameOffsets.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v36];
                if (v39)
                  operator delete(v39);
              }
              else
              {
                *(_QWORD *)v31 = v61.value;
                v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + 8);
              }
              self->_frameOffsets.__end_ = v32;
            }
            else
            {
              v8 = -4444001;
            }
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v42, "getBytes:length:", &v61, 8);
              v44 = self->_frameBlurVectors.__end_;
              v43 = self->_frameBlurVectors.__end_cap_.__value_;
              if (v44 >= v43)
              {
                v46 = (v44 - v57->__begin_) >> 3;
                if ((unint64_t)(v46 + 1) >> 61)
                  sub_1D4C590D0();
                v47 = v43 - v57->__begin_;
                v48 = v47 >> 2;
                if (v47 >> 2 <= (unint64_t)(v46 + 1))
                  v48 = v46 + 1;
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
                  v49 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v49 = v48;
                if (v49)
                  v50 = (char *)sub_1D4C60BD8((uint64_t)p_end_cap, v49);
                else
                  v50 = 0;
                v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[8 * v46];
                *(_QWORD *)v51 = v61.value;
                v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v51 + 8);
                v53 = self->_frameBlurVectors.__begin_;
                v52 = self->_frameBlurVectors.__end_;
                if (v52 != v53)
                {
                  do
                  {
                    v54 = *((_QWORD *)v52 - 1);
                    v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v52 - 8);
                    *((_QWORD *)v51 - 1) = v54;
                    v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v51 - 8);
                  }
                  while (v52 != v53);
                  v52 = v57->__begin_;
                }
                self->_frameBlurVectors.__begin_ = v51;
                self->_frameBlurVectors.__end_ = v45;
                self->_frameBlurVectors.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[8 * v49];
                if (v52)
                  operator delete(v52);
              }
              else
              {
                *(_QWORD *)v44 = v61.value;
                v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v44 + 8);
              }
              self->_frameBlurVectors.__end_ = v45;
            }
            else
            {
              v8 = -4444000;
            }

          }
          else
          {
            v8 = -4444005;
          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)processVidTrackMetadata
{
  NSDictionary *videoTrackMetadataDict;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  videoTrackMetadataDict = self->_videoTrackMetadataDict;
  if (!videoTrackMetadataDict)
    return -4444006;
  -[NSDictionary objectForKeyedSubscript:](videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackTotalDur"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v4, CFSTR("vidTrackTotalDur"));

  -[NSDictionary objectForKeyedSubscript:](self->_videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackNaturalW"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v5, CFSTR("vidTrackNaturalW"));

  -[NSDictionary objectForKeyedSubscript:](self->_videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackNaturalH"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v6, CFSTR("vidTrackNaturalH"));

  -[NSDictionary objectForKeyedSubscript:](self->_videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackCleanW"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v7, CFSTR("vidTrackCleanW"));

  -[NSDictionary objectForKeyedSubscript:](self->_videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackCleanH"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v8, CFSTR("vidTrackCleanH"));

  -[NSDictionary objectForKeyedSubscript:](self->_videoTrackMetadataDict, "objectForKeyedSubscript:", CFSTR("vidTrackStillFrameTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v9, CFSTR("vidTrackStillFrameTime"));

  return 0;
}

- (int)processMovieMetadata
{
  int result;

  result = -[PregateFeatureBuilder processStandardPerFrameKeys](self, "processStandardPerFrameKeys");
  if (!result)
  {
    result = -[PregateFeatureBuilder readPerFrameMetadataToArrays](self, "readPerFrameMetadataToArrays");
    if (!result)
    {
      result = -[PregateFeatureBuilder processBlurVectors](self, "processBlurVectors");
      if (!result)
      {
        result = -[PregateFeatureBuilder processOffsetVectors](self, "processOffsetVectors");
        if (!result)
        {
          result = -[PregateFeatureBuilder processPresentationTimes](self, "processPresentationTimes");
          if (!result)
            return MEMORY[0x1E0DE7D20](self, sel_processVideoFaceInfo);
        }
      }
    }
  }
  return result;
}

- (int)processStillImageFaceData
{
  NSArray *facesArray;
  float v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  float v15;
  void *v16;
  char isKindOfClass;
  double v18;
  float v19;
  void *v20;
  uint64_t v21;
  float v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t j;
  float v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  facesArray = self->_facesArray;
  v3 = 0.0;
  if (facesArray && (v4 = -[NSArray count](facesArray, "count"), (_DWORD)v4))
  {
    v37 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = self->_facesArray;
    v6 = 0;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Width"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v13 = 0.0;
            v14 = 4290523292;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "floatValue");
              v13 = v15;
              v14 = v6;
            }
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Height"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            LODWORD(v18) = 0;
            v6 = 4290523292;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v16, "floatValue", v18);
              v6 = v14;
            }
            v19 = v13 * *(float *)&v18;
            if (v9 <= v19)
              v9 = v19;
            *(float *)&v18 = v19;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v20);

            v3 = v3 + v19;
          }
          else
          {
            v6 = 4290523292;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = v39;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    v22 = v3 / (float)(int)v37;
    if (v24)
    {
      v25 = *(_QWORD *)v41;
      v26 = 0.0;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "floatValue");
          v26 = v26 + (float)((float)(v22 - v28) * (float)(v22 - v28));
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 0.0;
    }

    v3 = sqrtf(v26 / (float)(int)v37);
    v21 = v37;
  }
  else
  {
    LODWORD(v6) = 0;
    v21 = 0;
    v22 = 0.0;
    v9 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v29, CFSTR("PREGATE_STILL_FACECOUNT"));

  *(float *)&v30 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v31, CFSTR("PREGATE_STILL_FACEMEANSIZE"));

  *(float *)&v32 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v33, CFSTR("PREGATE_STILL_FACESTDDEV"));

  *(float *)&v34 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v35, CFSTR("PREGATE_STILL_FACEMAXSIZE"));

  return v6;
}

- (int)processStillImageMetadata
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  int v7;
  int v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;

  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", CFSTR("AEAverage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v3, CFSTR("PREGATE_STILL_AEAVERAGE"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", CFSTR("AESTable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v4, CFSTR("PREGATE_STILL_AESTABLE"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", CFSTR("AFStable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = -4444008;
  if (v6 || v5 == 0)
    v9 = -4444008;
  else
    v9 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v5, CFSTR("PREGATE_STILL_AFSTABLE"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -4444008;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v13, CFSTR("PREGATE_STILL_ISO"));

        v11 = v9;
      }

    }
  }
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB00]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v14, CFSTR("PREGATE_STILL_BRIGHTNESS"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB78]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v15, CFSTR("PREGATE_STILL_EXPOSURETIME"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v16, CFSTR("PREGATE_STILL_DIGITALZOOM"));
  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB88]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v18 = v15 == 0;
  else
    v18 = 1;
  if (v18 || v16 == 0 || v17 == 0)
    v21 = -4444008;
  else
    v21 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "integerValue") & 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v22, CFSTR("PREGATE_STILL_DIDFLASH"));

  -[NSDictionary objectForKeyedSubscript:](self->_stillImageMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBE0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v23, "rangeOfString:options:", CFSTR("front"), 1) != 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featuresDict, "setObject:forKeyedSubscript:", v25, CFSTR("PREGATE_STILL_IS_FRONT_FACING_CAMERA"));

    v7 = v21;
  }

  return v7;
}

- (PregateFeatureBuilder)init
{
  PregateFeatureBuilder *v2;
  uint64_t v3;
  NSArray *stdProcessInputKeysArray;
  objc_super v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PregateFeatureBuilder;
  v2 = -[PregateFeatureBuilder init](&v6, sel_init);
  v7[0] = CFSTR("privET");
  v7[1] = CFSTR("privTZF");
  v7[2] = CFSTR("privImgG");
  v7[3] = CFSTR("privAFS");
  v7[4] = CFSTR("privAFSt");
  v7[5] = CFSTR("privFM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  stdProcessInputKeysArray = v2->stdProcessInputKeysArray;
  v2->stdProcessInputKeysArray = (NSArray *)v3;

  return v2;
}

- (int)processStillInternal
{
  ExifMetadataExtractor *irisStillExtractor;
  int result;
  NSDictionary *v5;
  NSDictionary *stillImageMetadata;
  NSArray *v7;
  NSArray *facesArray;

  irisStillExtractor = self->irisStillExtractor;
  if (!irisStillExtractor)
    return -4443997;
  result = -[ExifMetadataExtractor processFile](irisStillExtractor, "processFile");
  if (!result)
  {
    -[ExifMetadataExtractor metadataDictionary](self->irisStillExtractor, "metadataDictionary");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    stillImageMetadata = self->_stillImageMetadata;
    self->_stillImageMetadata = v5;

    if (self->_stillImageMetadata)
    {
      result = -[PregateFeatureBuilder processStillImageMetadata](self, "processStillImageMetadata");
      if (!result)
      {
        -[ExifMetadataExtractor facesArray](self->irisStillExtractor, "facesArray");
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        facesArray = self->_facesArray;
        self->_facesArray = v7;

        return MEMORY[0x1E0DE7D20](self, sel_processStillImageFaceData);
      }
    }
    else
    {
      return -4444008;
    }
  }
  return result;
}

- (int)processVideoInternal
{
  IrisVideoMetadataExtractor *irisVideoExtractor;
  int result;
  NSArray *v5;
  NSArray *movieMetadata;
  NSDictionary *v7;
  NSDictionary *videoTrackMetadataDict;

  irisVideoExtractor = self->irisVideoExtractor;
  if (!irisVideoExtractor)
    return -4443997;
  result = -[IrisVideoMetadataExtractor processFile](irisVideoExtractor, "processFile");
  if (!result)
  {
    -[IrisVideoMetadataExtractor framesMetadataArray](self->irisVideoExtractor, "framesMetadataArray");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    movieMetadata = self->_movieMetadata;
    self->_movieMetadata = v5;

    if (self->_movieMetadata)
    {
      result = -[PregateFeatureBuilder processMovieMetadata](self, "processMovieMetadata");
      if (!result)
      {
        -[IrisVideoMetadataExtractor videoTrackMetadataDict](self->irisVideoExtractor, "videoTrackMetadataDict");
        v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        videoTrackMetadataDict = self->_videoTrackMetadataDict;
        self->_videoTrackMetadataDict = v7;

        if (self->_videoTrackMetadataDict)
          return MEMORY[0x1E0DE7D20](self, sel_processVidTrackMetadata);
        else
          return -4444006;
      }
    }
    else
    {
      return -4444007;
    }
  }
  return result;
}

- (int)processStill
{
  NSMutableDictionary *v3;
  NSMutableDictionary *featuresDict;

  if (!self->featuresDict)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    featuresDict = self->featuresDict;
    self->featuresDict = v3;

  }
  if (self->irisStillExtractor)
    return -[PregateFeatureBuilder processStillInternal](self, "processStillInternal");
  else
    return 0;
}

- (int)processVideo
{
  NSMutableDictionary *v3;
  NSMutableDictionary *featuresDict;

  if (!self->featuresDict)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    featuresDict = self->featuresDict;
    self->featuresDict = v3;

  }
  if (self->irisVideoExtractor)
    return -[PregateFeatureBuilder processVideoInternal](self, "processVideoInternal");
  else
    return -4443997;
}

- (void)buildFullDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *fullFeaturesDict;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[IrisVideoMetadataExtractor allMetadata](self->irisVideoExtractor, "allMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, CFSTR("FullMetadata"));

  -[IrisVideoMetadataExtractor framesMetadataArray](self->irisVideoExtractor, "framesMetadataArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("framesMetadata"));

  -[IrisVideoMetadataExtractor videoTrackMetadataDict](self->irisVideoExtractor, "videoTrackMetadataDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("videoTrackMetadata"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, CFSTR("videoMetadata"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ExifMetadataExtractor allMetadata](self->irisStillExtractor, "allMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("fullMetadata"));

  -[ExifMetadataExtractor metadataDictionary](self->irisStillExtractor, "metadataDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("stillFrameData"));

  -[ExifMetadataExtractor facesArray](self->irisStillExtractor, "facesArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("facesArray"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("stillMetadata"));
  fullFeaturesDict = self->fullFeaturesDict;
  self->fullFeaturesDict = v3;

}

- (int)processFullDictionary:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableDictionary *fullFeaturesDict;
  NSMutableDictionary *v6;
  NSMutableDictionary *featuresDict;
  ExifMetadataExtractor *irisStillExtractor;
  int v9;
  IrisVideoMetadataExtractor *irisVideoExtractor;

  v3 = a3;
  fullFeaturesDict = self->fullFeaturesDict;
  self->fullFeaturesDict = 0;

  if (!self->featuresDict)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    featuresDict = self->featuresDict;
    self->featuresDict = v6;

  }
  irisStillExtractor = self->irisStillExtractor;
  if (irisStillExtractor)
  {
    -[ExifMetadataExtractor setSaveAllMetadata:](irisStillExtractor, "setSaveAllMetadata:", 1);
    v9 = -[PregateFeatureBuilder processStillInternal](self, "processStillInternal");
    if (v9 && !v3)
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
  }
  irisVideoExtractor = self->irisVideoExtractor;
  if (irisVideoExtractor)
  {
    -[IrisVideoMetadataExtractor setSaveAllMetadata:](irisVideoExtractor, "setSaveAllMetadata:", 1);
    v9 = -[PregateFeatureBuilder processVideoInternal](self, "processVideoInternal");
  }
LABEL_10:
  -[PregateFeatureBuilder buildFullDictionary](self, "buildFullDictionary");
  return v9;
}

- (NSMutableDictionary)featuresDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)stdProcessInputKeysArray
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStdProcessInputKeysArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (IrisVideoMetadataExtractor)irisVideoExtractor
{
  return (IrisVideoMetadataExtractor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIrisVideoExtractor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (ExifMetadataExtractor)irisStillExtractor
{
  return (ExifMetadataExtractor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIrisStillExtractor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)fullFeaturesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (vector<CMTime,)frameTimes
{
  vector<CMTime, std::allocator<CMTime>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_frameTimes, (void (__cdecl *)(void *, const void *))sub_1D4C7713C);
  return result;
}

- (void)setFrameTimes:()vector<CMTime
{
  objc_copyCppObjectAtomic(&self->_frameTimes, a3, (void (__cdecl *)(void *, const void *))sub_1D4C77178);
}

- (vector<FloatPoint,)frameOffsets
{
  vector<FloatPoint, std::allocator<FloatPoint>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_frameOffsets, (void (__cdecl *)(void *, const void *))sub_1D4C771B8);
  return result;
}

- (void)setFrameOffsets:()vector<FloatPoint
{
  objc_copyCppObjectAtomic(&self->_frameOffsets, a3, (void (__cdecl *)(void *, const void *))sub_1D4C771E8);
}

- (vector<FloatPoint,)frameBlurVectors
{
  vector<FloatPoint, std::allocator<FloatPoint>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_frameBlurVectors, (void (__cdecl *)(void *, const void *))sub_1D4C7721C);
  return result;
}

- (void)setFrameBlurVectors:()vector<FloatPoint
{
  objc_copyCppObjectAtomic(&self->_frameBlurVectors, a3, (void (__cdecl *)(void *, const void *))sub_1D4C7724C);
}

- (NSDictionary)stillImageMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStillImageMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)facesArray
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFacesArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)movieMetadata
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMovieMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)videoTrackMetadataDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVideoTrackMetadataDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  begin = self->_frameBlurVectors.__begin_;
  if (begin)
  {
    self->_frameBlurVectors.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_frameOffsets.__begin_;
  if (v4)
  {
    self->_frameOffsets.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_frameTimes.__begin_;
  if (v5)
  {
    self->_frameTimes.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_videoTrackMetadataDict, 0);
  objc_storeStrong((id *)&self->_movieMetadata, 0);
  objc_storeStrong((id *)&self->_facesArray, 0);
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->fullFeaturesDict, 0);
  objc_storeStrong((id *)&self->irisStillExtractor, 0);
  objc_storeStrong((id *)&self->irisVideoExtractor, 0);
  objc_storeStrong((id *)&self->stdProcessInputKeysArray, 0);
  objc_storeStrong((id *)&self->featuresDict, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

@end
