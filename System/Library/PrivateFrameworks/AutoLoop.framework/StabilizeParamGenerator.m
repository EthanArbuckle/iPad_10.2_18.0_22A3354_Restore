@implementation StabilizeParamGenerator

- (void)ICGetIdentityHomographies:(void *)a3 toStabilizeParams:(id)a4 withImageBounds:(CGSize)a5 firstFrameIndex:(unint64_t)a6 lastFrameIndex:(unint64_t)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const __CFDictionary *v11;
  void *v12;
  uint64_t i;
  void *v14;
  int v15;
  id obj;
  id v17;
  CMTime v18;
  _DWORD v19[9];
  CMTime v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  ICGetIdentityHomographies();
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rawTime"));
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v18, v11);
        v20 = v18;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("homography"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 9; ++i)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          v19[i] = v15;

        }
        objc_msgSend(v17, "append:", v19);

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (void)CopyCoordinateShiftedHomographies:(void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 toStabilizeParams:(id)a6 withImageBounds:(CGSize)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const __CFDictionary *v11;
  void *v12;
  uint64_t i;
  void *v14;
  int v15;
  id obj;
  id v17;
  CMTime v18;
  _DWORD v19[9];
  CMTime v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a6;
  ICGetCoordinateShiftedHomographies();
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rawTime"));
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v18, v11);
        v20 = v18;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("homography"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 9; ++i)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          v19[i] = v15;

        }
        objc_msgSend(v17, "append:", v19);

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (id)generateStabilizeParams
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _OWORD *v13;
  __int128 v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  unint64_t v26;
  AutoLoopStabilizer *stabilizer;
  void *v29;
  id v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime rhs;
  CMTime lhs;
  CMTime v37;
  CMTime v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *__p;
  _QWORD *v44;
  char *v45;
  CMTime v46;
  CMTime v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[AutoLoopStabilizer inputMovieDimensions](self->stabilizer, "inputMovieDimensions");
  v4 = v3;
  v6 = v5;
  v7 = -[AutoLoopStabilizer icCorrectionResultRef](self->stabilizer, "icCorrectionResultRef");
  if (v7)
  {
    v8 = v7;
    +[StabilizeParams stabilizeParams](StabilizeParams, "stabilizeParams");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v47 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
    v46 = v47;
    ICGetResultFramePresentationTimes();
    __p = 0;
    v44 = 0;
    v45 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D4C5B0B0(&__p, objc_msgSend(v29, "count"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v29;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v9);
          CMTimeMakeFromDictionary(&v38, *(CFDictionaryRef *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v13 = v44;
          if (v44 >= (_QWORD *)v45)
          {
            v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44 - (_BYTE *)__p) >> 3);
            v17 = v16 + 1;
            if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
              sub_1D4C590D0();
            if (0x5555555555555556 * ((v45 - (_BYTE *)__p) >> 3) > v17)
              v17 = 0x5555555555555556 * ((v45 - (_BYTE *)__p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v45 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
              v18 = 0xAAAAAAAAAAAAAAALL;
            else
              v18 = v17;
            if (v18)
              v19 = (char *)sub_1D4C59158((uint64_t)&v45, v18);
            else
              v19 = 0;
            v20 = &v19[24 * v16];
            v21 = *(_OWORD *)&v38.value;
            *((_QWORD *)v20 + 2) = v38.epoch;
            *(_OWORD *)v20 = v21;
            v23 = (char *)__p;
            v22 = (char *)v44;
            v24 = v20;
            if (v44 != __p)
            {
              do
              {
                v25 = *(_OWORD *)(v22 - 24);
                *((_QWORD *)v24 - 1) = *((_QWORD *)v22 - 1);
                *(_OWORD *)(v24 - 24) = v25;
                v24 -= 24;
                v22 -= 24;
              }
              while (v22 != v23);
              v22 = (char *)__p;
            }
            v15 = v20 + 24;
            __p = v24;
            v44 = v20 + 24;
            v45 = &v19[24 * v18];
            if (v22)
              operator delete(v22);
          }
          else
          {
            v14 = *(_OWORD *)&v38.value;
            v44[2] = v38.epoch;
            *v13 = v14;
            v15 = (_QWORD *)v13 + 3;
          }
          v44 = v15;
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v10);
    }

    if (v44 != __p)
    {
      v47 = *(CMTime *)__p;
      v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44 - (_BYTE *)__p) >> 3) - 1;
      v38 = *(CMTime *)((_BYTE *)__p + v26);
      lhs = v38;
      stabilizer = self->stabilizer;
      if (stabilizer)
        -[AutoLoopStabilizer minimumFrameDuration](stabilizer, "minimumFrameDuration");
      else
        memset(&rhs, 0, sizeof(rhs));
      CMTimeAdd(&v37, &lhs, &rhs);
      v38 = v37;
      v34 = v37;
      v33 = v47;
      CMTimeSubtract(&v37, &v34, &v33);
      v46 = v37;
      if (-[AutoLoopStabilizer lastStabilizationResult](self->stabilizer, "lastStabilizationResult") == 4)
      {
        objc_msgSend(v30, "setPassThrough:", 1);
        objc_msgSend(v30, "setCropRect:", 0.0, 0.0, v4, v6);
        -[StabilizeParamGenerator ICGetIdentityHomographies:toStabilizeParams:withImageBounds:firstFrameIndex:lastFrameIndex:](self, "ICGetIdentityHomographies:toStabilizeParams:withImageBounds:firstFrameIndex:lastFrameIndex:", v8, v30, 0, v26, v4, v6);
      }
      else
      {
        -[AutoLoopStabilizer cropRect](self->stabilizer, "cropRect");
        objc_msgSend(v30, "setCropRect:");
        -[StabilizeParamGenerator CopyCoordinateShiftedHomographies:firstIndex:lastIndex:toStabilizeParams:withImageBounds:](self, "CopyCoordinateShiftedHomographies:firstIndex:lastIndex:toStabilizeParams:withImageBounds:", v8, 0, v26, v30, v4, v6);
      }
    }
    v32 = v47;
    objc_msgSend(v30, "setRoiStart:", &v32, v8);
    v31 = v46;
    objc_msgSend(v30, "setRoiLength:", &v31);
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }

  }
  else
  {
    v30 = 0;
  }
  return v30;
}

- (id)generatePassThruForAsset:(id)a3 trimStart:(id *)a4 trimLength:(id *)a5
{
  id v8;
  AutoLoopStabilizer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v19;
  __int128 v20;
  int64_t v21;
  __int128 v22;
  int64_t var3;

  v8 = a3;
  v9 = objc_alloc_init(AutoLoopStabilizer);
  -[StabilizeParamGenerator setStabilizer:](self, "setStabilizer:", v9);

  -[StabilizeParamGenerator stabilizer](self, "stabilizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMovieAssetIn:", v8);

  if ((a4->var2 & 0x1D) == 1)
  {
    -[StabilizeParamGenerator stabilizer](self, "stabilizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v11, "setTrimStart:", &v22);

  }
  if ((a5->var2 & 0x1D) == 1)
  {
    -[StabilizeParamGenerator stabilizer](self, "stabilizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_OWORD *)&a5->var0;
    v21 = a5->var3;
    objc_msgSend(v12, "setTrimLength:", &v20);

  }
  v19 = 0;
  -[StabilizeParamGenerator stabilizer](self, "stabilizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "analyzeForAutoloopWithDirect:toAnalysisOutput:", 0, &v19);

  if (v14
    && (-[StabilizeParamGenerator stabilizer](self, "stabilizer"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "processStabilizationAnalysis:forcePassThru:forceSmoothing:forceSequentialTripod:", v19, 1, 0, 0), v15, v16 == 4))
  {
    -[StabilizeParamGenerator generateStabilizeParams](self, "generateStabilizeParams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)generateTrivialPassThruForFrameTimes:(void *)a3 totalDuration:(id *)a4
{
  void *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v10;
  int64_t var3;
  __int128 v12;
  uint64_t v13;

  +[StabilizeParams stabilizeParams](StabilizeParams, "stabilizeParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassThrough:", 1);
  objc_msgSend(v6, "setCropRect:", 0.0, 0.0, 1.0, 1.0);
  v7 = *(__int128 **)a3;
  if (*((_QWORD *)a3 + 1) == *(_QWORD *)a3)
    sub_1D4C62870();
  v8 = *v7;
  v13 = *((_QWORD *)v7 + 2);
  v12 = v8;
  objc_msgSend(v6, "setRoiStart:", &v12);
  v10 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  objc_msgSend(v6, "setRoiLength:", &v10);
  return v6;
}

- (StabilizeParamGenerator)initWithStabilizer:(id)a3
{
  -[StabilizeParamGenerator setStabilizer:](self, "setStabilizer:", a3);
  return self;
}

- (AutoLoopStabilizer)stabilizer
{
  return self->stabilizer;
}

- (void)setStabilizer:(id)a3
{
  objc_storeStrong((id *)&self->stabilizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->stabilizer, 0);
}

@end
