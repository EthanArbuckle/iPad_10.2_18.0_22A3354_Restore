@implementation SubjectSelectionSession

- (SubjectSelectionSession)init
{
  return -[SubjectSelectionSession initWithCurrentProcessIsCameraCaptureDaemon:](self, "initWithCurrentProcessIsCameraCaptureDaemon:", 0);
}

- (SubjectSelectionSession)initWithCurrentProcessIsCameraCaptureDaemon:(BOOL)a3
{
  SubjectSelectionSession *v4;
  SubjectSelectionSession *v5;
  uint64_t v6;
  NSMutableDictionary *lastUsedFaceRects;
  uint64_t v8;
  NSMutableDictionary *lastUsedBodyRects;
  uint64_t v10;
  NSMutableDictionary *lastGazedFaceRects;
  uint64_t v12;
  NSMutableDictionary *lastFaceUpdatedTimestamp;
  uint64_t v14;
  NSMutableDictionary *lastBodyUpdatedTimestamp;
  uint64_t v16;
  __int128 v17;
  int64_t v18;
  SubjectSelectionSession *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SubjectSelectionSession;
  v4 = -[SubjectSelectionSession init](&v21, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v4->_currentProcessIsCameraCaptureDaemon = a3;
  v6 = objc_opt_new();
  lastUsedFaceRects = v5->_lastUsedFaceRects;
  v5->_lastUsedFaceRects = (NSMutableDictionary *)v6;

  v8 = objc_opt_new();
  lastUsedBodyRects = v5->_lastUsedBodyRects;
  v5->_lastUsedBodyRects = (NSMutableDictionary *)v8;

  v10 = objc_opt_new();
  lastGazedFaceRects = v5->_lastGazedFaceRects;
  v5->_lastGazedFaceRects = (NSMutableDictionary *)v10;

  v12 = objc_opt_new();
  lastFaceUpdatedTimestamp = v5->_lastFaceUpdatedTimestamp;
  v5->_lastFaceUpdatedTimestamp = (NSMutableDictionary *)v12;

  v14 = objc_opt_new();
  lastBodyUpdatedTimestamp = v5->_lastBodyUpdatedTimestamp;
  v5->_lastBodyUpdatedTimestamp = (NSMutableDictionary *)v14;

  v16 = MEMORY[0x1E0CA2E18];
  v17 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v5->_lastGazeTime.value = *MEMORY[0x1E0CA2E18];
  v18 = *(_QWORD *)(v16 + 16);
  v5->_lastGazeTime.epoch = v18;
  *(_OWORD *)&v5->_lastTimestamp.value = v17;
  v5->_lastTimestamp.epoch = v18;
  *(_QWORD *)&v5->_emptySelectionTimeElapsed = 0x3F4CCCCD00000000;
  *(_WORD *)&v5->_enableGazeSelection = 1;
  v5->_espressoContext = 0;
  v5->_espressoPlan = 0;
  if (-[SubjectSelectionSession _initGaze](v5, "_initGaze"))
LABEL_4:
    v19 = 0;
  else
    v19 = v5;

  return v19;
}

- (void)dealloc
{
  __CVBuffer *gazeFacePixelBuffer;
  OpaqueVTPixelTransferSession *pixelTransferSession;
  objc_super v5;

  if (self->_espressoPlan)
  {
    espresso_plan_destroy();
    self->_espressoPlan = 0;
  }
  if (self->_espressoContext)
  {
    espresso_context_destroy();
    self->_espressoContext = 0;
  }
  gazeFacePixelBuffer = self->_gazeFacePixelBuffer;
  if (gazeFacePixelBuffer)
    CFRelease(gazeFacePixelBuffer);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
    self->_pixelTransferSession = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SubjectSelectionSession;
  -[SubjectSelectionSession dealloc](&v5, sel_dealloc);
}

+ (void)filterDetectedObjects:(id)a3 usedFaceIDs:(id)a4 usedBodyIDs:(id)a5 filteredObjects:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x1E0D064A0];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v12;
  v38 = *MEMORY[0x1E0D06498];
  objc_msgSend(v12, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D064D0];
  v40 = v14;
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v15;
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v42 = v9;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v16;
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v50;
    v22 = *MEMORY[0x1E0D08498];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v50 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v10, "containsObject:", v25);

        if (v26)
          objc_msgSend(v44, "addObject:", v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v20);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    v32 = *MEMORY[0x1E0D06460];
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v34, "objectForKeyedSubscript:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v11, "containsObject:", v35);

        if (v36)
          objc_msgSend(v43, "addObject:", v34);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v30);
  }

}

- (int)processPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 detectedObjects:(id)a5 usedFaceIDs:(id)a6 usedBodyIDs:(id)a7
{
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastTimestamp;
  __int128 v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastGazeTime;
  __int128 v30;
  float v31;
  __int128 v32;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  id v41;
  CMTime v42;
  CMTime rhs;
  CMTime time;
  CMTime lhs;

  v41 = a6;
  v11 = a7;
  v12 = *MEMORY[0x1E0D064A0];
  v13 = a5;
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D064D0];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06498]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v39 = self->_lastUsedFaceRects;
  v40 = self->_lastUsedBodyRects;
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  -[SubjectSelectionSession _convertDetectionArrayToDict:bodyObjects:faceRects:bodyRects:](self, "_convertDetectionArrayToDict:bodyObjects:faceRects:bodyRects:", v16, v18, v19, v20);
  -[SubjectSelectionSession _pairFaceBody:bodyObjects:face2Body:body2Face:](self, "_pairFaceBody:bodyObjects:face2Body:body2Face:", v19, v20, v21, v22);
  p_lastTimestamp = &self->_lastTimestamp;
  if ((self->_lastTimestamp.flags & 1) == 0)
  {
    v24 = *(_OWORD *)&a4->var0;
    self->_lastTimestamp.epoch = a4->var3;
    *(_OWORD *)&p_lastTimestamp->value = v24;
  }
  if (!self->_enableGazeSelection)
    goto LABEL_20;
  if (objc_msgSend(v16, "count") || objc_msgSend(v18, "count"))
  {
    lhs = (CMTime)*a4;
    -[SubjectSelectionSession _updateDetectionRects:bodyObjects:timestamp:](self, "_updateDetectionRects:bodyObjects:timestamp:", v19, v20, &lhs);
    v34 = v18;
    v35 = v16;
    if (self->_singleSubjectSelection)
    {
      lhs = (CMTime)*a4;
      v25 = v39;
      -[SubjectSelectionSession _selectSingleSubject:bodyRects:selectedFaceRects:selectedBodyRects:timestamp:inputPixelBuffer:](self, "_selectSingleSubject:bodyRects:selectedFaceRects:selectedBodyRects:timestamp:inputPixelBuffer:", v19, v20, v39, v40, &lhs, a3);
    }
    else if (objc_msgSend(v16, "count") == 1)
    {
      v25 = v39;
      if (objc_msgSend(v19, "count")
        && !-[NSMutableDictionary count](self->_lastUsedFaceRects, "count")
        && !-[NSMutableDictionary count](self->_lastUsedBodyRects, "count"))
      {
        objc_msgSend(v19, "allKeys");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "objectForKeyedSubscript:", v28);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v38, v28);

      }
    }
    else
    {
      p_lastGazeTime = &self->_lastGazeTime;
      v25 = v39;
      if ((self->_lastGazeTime.flags & 1) == 0
        || (lhs = (CMTime)*a4,
            *(_OWORD *)&rhs.value = *(_OWORD *)&p_lastGazeTime->value,
            rhs.epoch = self->_lastGazeTime.epoch,
            CMTimeSubtract(&time, &lhs, &rhs),
            CMTimeGetSeconds(&time) > self->_gazeElapsedThreshold))
      {
        v30 = *(_OWORD *)&a4->var0;
        self->_lastGazeTime.epoch = a4->var3;
        *(_OWORD *)&p_lastGazeTime->value = v30;
        -[SubjectSelectionSession _runGazeDetection:faceObjects:selectedFaceRects:](self, "_runGazeDetection:faceObjects:selectedFaceRects:", a3, v19, v39);
      }
    }
    -[SubjectSelectionSession _selectPairRects:bodyRects:face2Body:body2Face:selectedFaceRects:selectedBodyRects:](self, "_selectPairRects:bodyRects:face2Body:body2Face:selectedFaceRects:selectedBodyRects:", v19, v20, v21, v22, v25, v40);
    -[NSMutableDictionary allKeys](v25, "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObjectsFromArray:", v26);

    -[NSMutableDictionary allKeys](v40, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v27);

    if (objc_msgSend(v41, "count") || objc_msgSend(v11, "count"))
    {
      self->_emptySelectionTimeElapsed = 0.0;
      v18 = v34;
      v16 = v35;
      goto LABEL_21;
    }
    lhs = (CMTime)*a4;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_lastTimestamp->value;
    rhs.epoch = self->_lastTimestamp.epoch;
    CMTimeSubtract(&v42, &lhs, &rhs);
    v31 = CMTimeGetSeconds(&v42) + self->_emptySelectionTimeElapsed;
    self->_emptySelectionTimeElapsed = v31;
    v18 = v34;
    v16 = v35;
    if (v31 < 1.6)
      goto LABEL_21;
LABEL_20:
    -[SubjectSelectionSession _selectAllObjects:bodyObjects:usedFaceIDs:usedBodyIDs:](self, "_selectAllObjects:bodyObjects:usedFaceIDs:usedBodyIDs:", v16, v18, v41, v11);
  }
LABEL_21:
  v32 = *(_OWORD *)&a4->var0;
  self->_lastTimestamp.epoch = a4->var3;
  *(_OWORD *)&p_lastTimestamp->value = v32;

  return 0;
}

- (BOOL)singleSubjectSelection
{
  return self->_singleSubjectSelection;
}

- (void)setSingleSubjectSelection:(BOOL)a3
{
  if (a3)
  {
    self->_singleSubjectSelection = 1;
    -[NSMutableDictionary removeAllObjects](self->_lastUsedFaceRects, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_lastUsedBodyRects, "removeAllObjects");
  }
  else
  {
    self->_singleSubjectSelection = 0;
  }
}

- (BOOL)gazeSubjectSelection
{
  return self->_enableGazeSelection;
}

- (void)setGazeSubjectSelection:(BOOL)a3
{
  self->_enableGazeSelection = a3;
}

- (void)_runGazeDetection:(__CVBuffer *)a3 faceObjects:(id)a4 selectedFaceRects:(id)a5
{
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v19;
  const __CFDictionary *v20;
  void *v21;
  double v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *lastGazedFaceRects;
  NSMutableDictionary *v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float v31;
  CGRect rect;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (NSMutableDictionary *)a5;
  v26 = (NSMutableDictionary *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v28 = (float64x2_t)vdupq_n_s64(0x3F947AE140000000uLL);
    v29 = (float64x2_t)vdupq_n_s64(0xBF847AE140000000);
    __asm { FMOV            V0.2D, #1.0 }
    v27 = _Q0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v19);
        v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&rect, 0, sizeof(rect));
        CGRectMakeWithDictionaryRepresentation(v20, &rect);
        -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v31 = 0.0;
          rect.origin = (CGPoint)vmaxnmq_f64(vaddq_f64((float64x2_t)rect.origin, v29), (float64x2_t)0);
          rect.size = (CGSize)vminnmq_f64(vaddq_f64((float64x2_t)rect.size, v28), vsubq_f64(v27, (float64x2_t)rect.origin));
          -[SubjectSelectionSession _runGazeInference:faceRect:gazeScore:](self, "_runGazeInference:faceRect:gazeScore:", a3, &v31, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          *(float *)&v22 = v31;
          if (v31 >= self->_gazeScoreThreshold)
          {
            -[NSMutableDictionary objectForKey:](self->_lastGazedFaceRects, "objectForKey:", v19, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              v24 = v8;
            else
              v24 = v26;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v20, v19);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  lastGazedFaceRects = self->_lastGazedFaceRects;
  self->_lastGazedFaceRects = v26;

}

- (void)_convertDetectionArrayToDict:(id)a3 bodyObjects:(id)a4 faceRects:(id)a5 bodyRects:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v10 = a5;
  v11 = a6;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    v15 = *MEMORY[0x1E0D08498];
    v16 = *MEMORY[0x1E0D06D58];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v15, v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v19);

      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }
  v32 = v9;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v31;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    v25 = *MEMORY[0x1E0D06460];
    v26 = *MEMORY[0x1E0D06D58];
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v28, "objectForKeyedSubscript:", v25, v31, v32, (_QWORD)v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, v29);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v23);
  }

}

- (void)_pairFaceBody:(id)a3 bodyObjects:(id)a4 face2Body:(id)a5 body2Face:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  const __CFDictionary *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t i;
  uint64_t v26;
  const __CFDictionary *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  CGFloat x;
  CGFloat v34;
  double v35;
  double v36;
  uint64_t j;
  void *v38;
  const __CFDictionary *v39;
  double width;
  double height;
  CGFloat y;
  BOOL IsNull;
  CGFloat v44;
  CGFloat v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id obj;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CGRect rect;
  CGRect v68;
  CGRect v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v49 = a5;
  v48 = a6;
  memset(&v69, 0, sizeof(v69));
  memset(&v68, 0, sizeof(v68));
  v11 = (void *)objc_opt_new();
  v12 = objc_alloc(MEMORY[0x1E0C99E20]);
  v58 = v9;
  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  while (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&rect, 0, sizeof(rect));
    objc_msgSend(v58, "objectForKeyedSubscript:", v16);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGRectMakeWithDictionaryRepresentation(v17, &rect);

    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      v18 = 1;
      do
      {
        objc_msgSend(v14, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v58, "objectForKeyedSubscript:", v20);
        v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGRectMakeWithDictionaryRepresentation(v21, &v69);

        if (v69.size.width * v69.size.height > rect.size.width * rect.size.height)
        {
          rect = v69;
          v22 = v20;

          v16 = v22;
        }

        ++v18;
      }
      while (objc_msgSend(v14, "count") > v18);
    }
    objc_msgSend(v11, "addObject:", v16);
    objc_msgSend(v14, "removeObject:", v16);

  }
  v47 = v14;
  v23 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v23, "initWithArray:", v24);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v11;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v64;
    v53 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v54 = *MEMORY[0x1E0C9D628];
    v51 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v52 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v64 != v55)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v58, "objectForKeyedSubscript:", v26, v47);
        v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGRectMakeWithDictionaryRepresentation(v27, &v69);

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v28 = v56;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        if (v29)
        {
          v30 = v29;
          v31 = 0;
          v32 = *(_QWORD *)v60;
          v34 = v53;
          x = v54;
          v36 = v51;
          v35 = v52;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v60 != v32)
                objc_enumerationMutation(v28);
              v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
              objc_msgSend(v10, "objectForKeyedSubscript:", v38);
              v39 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v39, &v68);

              width = v69.size.width;
              height = v69.size.height;
              v73 = CGRectIntersection(v68, v69);
              y = v73.size.width * v73.size.height;
              *(float *)&y = v73.size.width * v73.size.height;
              *(float *)&v73.origin.y = width * height;
              *(float *)&y = *(float *)&y / *(float *)&v73.origin.y;
              if (*(float *)&y >= 0.8)
              {
                y = v69.origin.y;
                if (v69.origin.y < v68.origin.y + v68.size.height / 3.0)
                {
                  v74.origin.x = x;
                  v74.origin.y = v34;
                  v74.size.width = v35;
                  v74.size.height = v36;
                  IsNull = CGRectIsNull(v74);
                  v44 = v68.size.width;
                  v45 = v68.size.height;
                  if (IsNull || (y = v68.size.width * v68.size.height, v68.size.width * v68.size.height > v35 * v36))
                  {
                    x = v68.origin.x;
                    v34 = v68.origin.y;
                    v46 = v38;

                    v31 = v46;
                    v35 = v44;
                    v36 = v45;
                  }
                }
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v70, 16, y);
          }
          while (v30);
        }
        else
        {
          v31 = 0;
          v34 = v53;
          x = v54;
          v36 = v51;
          v35 = v52;
        }

        v75.origin.x = x;
        v75.origin.y = v34;
        v75.size.width = v35;
        v75.size.height = v36;
        if (!CGRectIsNull(v75) && v31)
        {
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v31, v26);
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v26, v31);
          objc_msgSend(v28, "removeObject:", v31);
        }

      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v57);
  }

}

- (void)_selectPairRects:(id)a3 bodyRects:(id)a4 face2Body:(id)a5 body2Face:(id)a6 selectedFaceRects:(id)a7 selectedBodyRects:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
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
  v33 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v22);

          }
        }

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v19);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v29));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v33, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v33, "objectForKeyedSubscript:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v32, v30);

          }
        }

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v27);
  }

}

- (void)_updateDetectionRects:(id)a3 bodyObjects:(id)a4 timestamp:(id *)a5
{
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  const __CFDictionary *v16;
  CFDictionaryRef v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  const __CFDictionary *v24;
  void *v25;
  uint64_t m;
  uint64_t v27;
  const __CFDictionary *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  void *v34;
  const __CFDictionary *v35;
  CFDictionaryRef v36;
  void *v37;
  double width;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  uint64_t v45;
  const __CFDictionary *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t jj;
  uint64_t v52;
  const __CFDictionary *v53;
  id obj;
  id obja;
  const __CFAllocator *allocator;
  const __CFAllocator *allocatora;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v66;
  id v67;
  const __CFDictionary *v68;
  const __CFDictionary *v69;
  CMTime v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CMTime rhs;
  CMTime lhs;
  CMTime v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CMTime time;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  CGRect v103;
  CGRect v104;
  CGRect rect;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v67 = a4;
  memset(&rect, 0, sizeof(rect));
  memset(&v104, 0, sizeof(v104));
  memset(&v103, 0, sizeof(v103));
  v58 = (id)objc_opt_new();
  v63 = (void *)objc_opt_new();
  v64 = (void *)objc_opt_new();
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v66 = v7;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v100;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v100 != v59)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v66, "objectForKeyedSubscript:", v9);
        v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGRectMakeWithDictionaryRepresentation(v68, &rect);
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        -[NSMutableDictionary allKeys](self->_lastUsedFaceRects, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v96;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v96 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_lastUsedFaceRects, "objectForKeyedSubscript:", v15);
              v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v16, &v103);

              if (_isRectAlmostEqual(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.4))
              {
                objc_msgSend(v15, "isEqual:", v9);
                -[NSMutableDictionary removeObjectForKey:](self->_lastUsedFaceRects, "removeObjectForKey:", v15);
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v68, v9);
                objc_msgSend(v66, "removeObjectForKey:", v9);
                -[NSMutableDictionary removeObjectForKey:](self->_lastFaceUpdatedTimestamp, "removeObjectForKey:", v15);
                time = (CMTime)*a5;
                v17 = CMTimeCopyAsDictionary(&time, allocator);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastFaceUpdatedTimestamp, "setObject:forKeyedSubscript:", v17, v9);

                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v18 = self->_lastGazedFaceRects;
        v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v91;
          while (2)
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v91 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_lastGazedFaceRects, "objectForKeyedSubscript:", v23);
              v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v24, &v103);

              if (_isRectAlmostEqual(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.4))
              {
                objc_msgSend(v23, "isEqual:", v9);
                -[NSMutableDictionary removeObjectForKey:](self->_lastGazedFaceRects, "removeObjectForKey:", v23);
                objc_msgSend(v58, "setObject:forKeyedSubscript:", v68, v9);
                goto LABEL_26;
              }
            }
            v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
            if (v20)
              continue;
            break;
          }
        }
LABEL_26:

        if (!self->_singleSubjectSelection)
        {
          objc_msgSend(v63, "objectForKey:", v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 || rect.size.width < 0.08)
          {

          }
          else if (rect.size.height >= 0.08)
          {
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v68, v9, rect.size.height);
            objc_msgSend(v66, "removeObjectForKey:", v9);
          }
        }

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    }
    while (v61);
  }

  objc_storeStrong((id *)&self->_lastGazedFaceRects, v58);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend(v67, "allKeys");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
  if (v62)
  {
    v60 = *(_QWORD *)v87;
    allocatora = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (m = 0; m != v62; ++m)
      {
        if (*(_QWORD *)v87 != v60)
          objc_enumerationMutation(obja);
        v27 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * m);
        objc_msgSend(v67, "objectForKeyedSubscript:", v27);
        v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CGRectMakeWithDictionaryRepresentation(v28, &v104);
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        -[NSMutableDictionary allKeys](self->_lastUsedBodyRects, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v108, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v83;
          v69 = v28;
          while (2)
          {
            for (n = 0; n != v31; ++n)
            {
              if (*(_QWORD *)v83 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * n);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_lastUsedBodyRects, "objectForKeyedSubscript:", v34);
              v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v35, &v103);

              if (_isRectAlmostEqual(v104.origin.x, v104.origin.y, v104.size.width, v104.size.height, v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, 0.3))
              {
                objc_msgSend(v34, "isEqual:", v27);
                -[NSMutableDictionary removeObjectForKey:](self->_lastUsedBodyRects, "removeObjectForKey:", v34);
                v28 = v69;
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v69, v27);
                -[NSMutableDictionary removeObjectForKey:](self->_lastBodyUpdatedTimestamp, "removeObjectForKey:", v34);
                time = (CMTime)*a5;
                v36 = CMTimeCopyAsDictionary(&time, allocatora);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastBodyUpdatedTimestamp, "setObject:forKeyedSubscript:", v36, v27);

                objc_msgSend(v67, "removeObjectForKey:", v27);
                goto LABEL_49;
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v108, 16);
            v28 = v69;
            if (v31)
              continue;
            break;
          }
        }
LABEL_49:

        if (!self->_singleSubjectSelection)
        {
          objc_msgSend(v64, "objectForKey:", v27);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          width = v104.size.width;

          if (!v37 && width >= 0.25)
          {
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v28, v27);
            objc_msgSend(v67, "removeObjectForKey:", v27);
          }
        }

      }
      v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
    }
    while (v62);
  }

  -[NSMutableDictionary addEntriesFromDictionary:](self->_lastUsedFaceRects, "addEntriesFromDictionary:", v63);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_lastUsedBodyRects, "addEntriesFromDictionary:", v64);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[NSMutableDictionary allKeys](self->_lastFaceUpdatedTimestamp, "allKeys");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v79;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v79 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * ii);
        memset(&time, 0, sizeof(time));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_lastFaceUpdatedTimestamp, "objectForKeyedSubscript:", v45);
        v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&time, v46);

        lhs = (CMTime)*a5;
        rhs = time;
        CMTimeSubtract(&v77, &lhs, &rhs);
        if (CMTimeGetSeconds(&v77) >= 1.6)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_lastUsedFaceRects, "removeObjectForKey:", v45);
          -[NSMutableDictionary removeObjectForKey:](self->_lastFaceUpdatedTimestamp, "removeObjectForKey:", v45);
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
    }
    while (v42);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[NSMutableDictionary allKeys](self->_lastBodyUpdatedTimestamp, "allKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v106, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v72;
    do
    {
      for (jj = 0; jj != v49; ++jj)
      {
        if (*(_QWORD *)v72 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * jj);
        memset(&time, 0, sizeof(time));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_lastBodyUpdatedTimestamp, "objectForKeyedSubscript:", v52);
        v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&time, v53);

        lhs = (CMTime)*a5;
        rhs = time;
        CMTimeSubtract(&v70, &lhs, &rhs);
        if (CMTimeGetSeconds(&v70) >= 1.6)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_lastUsedBodyRects, "removeObjectForKey:", v52);
          -[NSMutableDictionary removeObjectForKey:](self->_lastBodyUpdatedTimestamp, "removeObjectForKey:", v52);
        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v106, 16);
    }
    while (v49);
  }

}

- (void)_selectAllObjects:(id)a3 bodyObjects:(id)a4 usedFaceIDs:(id)a5 usedBodyIDs:(id)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *lastUsedFaceRects;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *lastUsedBodyRects;
  void *v33;
  id v34;
  id obj;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v37 = a5;
  obj = v10;
  v36 = a6;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    v14 = *MEMORY[0x1E0D08498];
    v15 = *MEMORY[0x1E0D06D58];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v14, v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v18);

        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        lastUsedFaceRects = self->_lastUsedFaceRects;
        objc_msgSend(v17, "objectForKeyedSubscript:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](lastUsedFaceRects, "setObject:forKeyedSubscript:", v19, v21);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v12);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v34;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    v26 = *MEMORY[0x1E0D06460];
    v27 = *MEMORY[0x1E0D06D58];
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v29, "objectForKeyedSubscript:", v26, v34);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v30);

        objc_msgSend(v29, "objectForKeyedSubscript:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        lastUsedBodyRects = self->_lastUsedBodyRects;
        objc_msgSend(v29, "objectForKeyedSubscript:", v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](lastUsedBodyRects, "setObject:forKeyedSubscript:", v31, v33);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v24);
  }

}

- (int)_initGaze
{
  uint64_t v3;
  const __CFDictionary *v4;
  NSString *gazeInputName;
  void *v6;
  id VisionCoreProcessingDescriptorClass;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CGFloat v21;
  unint64_t v22;
  NSString *v23;
  NSString *v24;
  int v25;
  int v26;
  void *context;
  void *v28;
  void *plan;
  const __CFAllocator *v30;
  CVReturn v31;
  void *v33;
  const __CFDictionary *v34;
  OSType v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA8FE8];
  v39[0] = *MEMORY[0x1E0CA9010];
  v39[1] = v3;
  v40[0] = MEMORY[0x1E0C9AAB0];
  v40[1] = MEMORY[0x1E0C9AAB0];
  v39[2] = *MEMORY[0x1E0CA8FF0];
  v40[2] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  gazeInputName = self->_gazeInputName;
  self->_gazeInputName = (NSString *)CFSTR("image");

  self->_gazeFaceSize = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
  self->_gazeScoreThreshold = 0.4;
  if (!VisionCoreLibraryCore_frameworkLibrary)
  {
    v41 = xmmword_1E98A7730;
    v42 = 0;
    VisionCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (VisionCoreLibraryCore_frameworkLibrary)
  {
    v34 = v4;
    v6 = (void *)objc_msgSend(objc_alloc((Class)getVisionCoreResourceVersionClass()), "initWithMajor:minor:micro:", 2, 0, 0);
    VisionCoreProcessingDescriptorClass = getVisionCoreProcessingDescriptorClass();
    getVisionCoreInferenceNetworkIdentifierCamGaze();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(VisionCoreProcessingDescriptorClass, "descriptorForIdentifier:version:error:", v8, v6, &v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v38;

    if (v9)
    {
      v11 = v10;
      v12 = (uint64_t)v6;
    }
    else
    {
      v12 = objc_msgSend(objc_alloc((Class)getVisionCoreResourceVersionClass()), "initWithMajor:minor:micro:", 1, 0, 0);

      v15 = getVisionCoreProcessingDescriptorClass();
      getVisionCoreInferenceNetworkIdentifierCamGaze();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v10;
      objc_msgSend(v15, "descriptorForIdentifier:version:error:", v16, v12, &v37);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v37;

      if (!v9)
      {
        v33 = (void *)v12;
        v35 = 1111970369;
        v18 = 0;
        v17 = 0;
        goto LABEL_32;
      }
      self->_gazeScoreThreshold = 0.2;
    }
    objc_msgSend(v9, "onlyInputImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v12;
    if (v17)
    {
      objc_msgSend(v9, "gazeProbabilitiesOutput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v9, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v11;
        objc_msgSend(v19, "VisionCoreFileSystemPathAndReturnError:", &v36);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = v36;

        if (v13)
        {
          v21 = (double)(unint64_t)objc_msgSend(v17, "pixelWidth");
          v22 = objc_msgSend(v17, "pixelHeight");
          self->_gazeFaceSize.width = v21;
          self->_gazeFaceSize.height = (double)v22;
          objc_msgSend(v17, "name");
          v23 = (NSString *)objc_claimAutoreleasedReturnValue();
          v24 = self->_gazeInputName;
          self->_gazeInputName = v23;

          v35 = objc_msgSend(v17, "pixelFormatType");
          objc_msgSend(v18, "name");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v26 = 1;
          v11 = v20;
          goto LABEL_13;
        }
        v35 = 1111970369;
        v26 = 0;
        v25 = -12782;
        v11 = v20;
LABEL_33:
        v14 = CFSTR("camgaze_probs");
LABEL_13:

        v4 = v34;
        if (!v26)
          goto LABEL_25;
        goto LABEL_14;
      }
      v35 = 1111970369;
    }
    else
    {
      v35 = 1111970369;
      v18 = 0;
    }
LABEL_32:
    v26 = 0;
    v25 = -12782;
    v13 = CFSTR("/System/Library/PrivateFrameworks/VisionCore.framework/camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso.net");
    goto LABEL_33;
  }
  v35 = 1111970369;
  v11 = 0;
  v13 = CFSTR("/System/Library/PrivateFrameworks/VisionCore.framework/camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso.net");
  v14 = CFSTR("camgaze_probs");
LABEL_14:
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if ((context || (v28 = (void *)espresso_create_context(), (self->_espressoContext = v28) != 0))
    && (plan = (void *)espresso_create_plan(), (self->_espressoPlan = plan) != 0))
  {
    v13 = objc_retainAutorelease(v13);
    -[__CFString UTF8String](v13, "UTF8String");
    if (espresso_plan_add_network())
      goto LABEL_26;
    if (espresso_plan_set_priority())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (espresso_plan_build()
      || (v14 = objc_retainAutorelease(v14),
          -[__CFString UTF8String](v14, "UTF8String"),
          espresso_network_bind_buffer()))
    {
LABEL_26:
      v25 = -12782;
    }
    else
    {
      v30 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v31 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)self->_gazeFaceSize.width, (unint64_t)self->_gazeFaceSize.height, v35, v4, &self->_gazeFacePixelBuffer);
      if (!v31)
        v31 = VTPixelTransferSessionCreate(v30, &self->_pixelTransferSession);
      v25 = v31;
    }
  }
  else
  {
    v25 = -12786;
  }
LABEL_25:

  return v25;
}

- (int)_runGazeInference:(__CVBuffer *)a3 faceRect:(CGRect)a4 gazeScore:(float *)a5
{
  double height;
  double width;
  double y;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CFDictionaryRef DictionaryRepresentation;
  OSStatus v15;
  CFDictionaryRef v16;
  OSStatus v17;
  int v18;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  *a5 = 0.0;
  v11 = a4.origin.x * (double)CVPixelBufferGetWidth(a3);
  v12 = y * (double)CVPixelBufferGetHeight(a3);
  v13 = width * (double)CVPixelBufferGetWidth(a3);
  v20.size.height = height * (double)CVPixelBufferGetHeight(a3);
  v20.origin.x = v11;
  v20.origin.y = v12;
  v20.size.width = v13;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v20);
  v15 = VTSessionSetProperty(self->_pixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
  if (v15)
  {
    v18 = v15;
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
  }
  else
  {
    v21.size.width = self->_gazeFaceSize.width;
    v21.size.height = self->_gazeFaceSize.height;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v16 = CGRectCreateDictionaryRepresentation(v21);
    v17 = VTSessionSetProperty(self->_pixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED7D0], v16);
    if (v17
      || (v17 = VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, self->_gazeFacePixelBuffer)) != 0)
    {
      v18 = v17;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      -[NSString UTF8String](self->_gazeInputName, "UTF8String");
      if (espresso_network_bind_cvpixelbuffer() || espresso_plan_execute_sync())
      {
        v18 = -12782;
      }
      else
      {
        v18 = 0;
        *a5 = *((float *)self->_gazeOutput.data + 1);
      }
    }
  }
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if (v16)
    CFRelease(v16);
  return v18;
}

- (void)_selectSingleSubject:(id)a3 bodyRects:(id)a4 selectedFaceRects:(id)a5 selectedBodyRects:(id)a6 timestamp:(id *)a7 inputPixelBuffer:(__CVBuffer *)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CGFloat y;
  double width;
  double height;
  CGFloat x;
  uint64_t i;
  void *v29;
  const __CFDictionary *v30;
  double v31;
  id v32;
  CFDictionaryRef DictionaryRepresentation;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  uint64_t j;
  void *v44;
  const __CFDictionary *v45;
  double v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGRect rect;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
    goto LABEL_37;
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
LABEL_21:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v16);

    goto LABEL_37;
  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v11, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v20)
    {
      v21 = v20;
      v48 = v14;
      v22 = 0;
      v23 = *(_QWORD *)v56;
      y = 0.0;
      width = 0.0;
      height = 0.0;
      x = 0.0;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v56 != v23)
            objc_enumerationMutation(v19);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          memset(&rect, 0, sizeof(rect));
          objc_msgSend(v11, "objectForKeyedSubscript:", v29);
          v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGRectMakeWithDictionaryRepresentation(v30, &rect);

          if (v22)
          {
            v31 = width * height;
            if (width * height >= rect.size.width * rect.size.height)
              continue;
          }
          v32 = v29;

          x = rect.origin.x;
          y = rect.origin.y;
          v22 = v32;
          width = rect.size.width;
          height = rect.size.height;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v60, 16, v31);
      }
      while (v21);

      v14 = v48;
      if (v22)
      {
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v62);
        v34 = v13;
LABEL_18:
        objc_msgSend(v34, "setObject:forKeyedSubscript:", DictionaryRepresentation, v22);

LABEL_36:
        goto LABEL_37;
      }
      goto LABEL_37;
    }
LABEL_35:
    v22 = v19;
    goto LABEL_36;
  }
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
    goto LABEL_37;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v12, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (!v36)
    goto LABEL_35;
  v37 = v36;
  v49 = v14;
  v22 = 0;
  v38 = *(_QWORD *)v51;
  v39 = 0.0;
  v40 = 0.0;
  v41 = 0.0;
  v42 = 0.0;
  do
  {
    for (j = 0; j != v37; ++j)
    {
      if (*(_QWORD *)v51 != v38)
        objc_enumerationMutation(v19);
      v44 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
      memset(&rect, 0, sizeof(rect));
      objc_msgSend(v12, "objectForKeyedSubscript:", v44);
      v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGRectMakeWithDictionaryRepresentation(v45, &rect);

      if (v22)
      {
        v46 = v41 * v42;
        if (v41 * v42 >= rect.size.width * rect.size.height)
          continue;
      }
      v47 = v44;

      v39 = rect.origin.x;
      v40 = rect.origin.y;
      v22 = v47;
      v41 = rect.size.width;
      v42 = rect.size.height;
    }
    v37 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16, v46);
  }
  while (v37);

  v14 = v49;
  if (v22)
  {
    v63.origin.x = v39;
    v63.origin.y = v40;
    v63.size.width = v41;
    v63.size.height = v42;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v63);
    v34 = v49;
    goto LABEL_18;
  }
LABEL_37:

}

- (BOOL)enableGazeSelection
{
  return self->_enableGazeSelection;
}

- (void)setEnableGazeSelection:(BOOL)a3
{
  self->_enableGazeSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gazeInputName, 0);
  objc_storeStrong((id *)&self->_lastGazedFaceRects, 0);
  objc_storeStrong((id *)&self->_lastUsedBodyRects, 0);
  objc_storeStrong((id *)&self->_lastUsedFaceRects, 0);
  objc_storeStrong((id *)&self->_lastBodyUpdatedTimestamp, 0);
  objc_storeStrong((id *)&self->_lastFaceUpdatedTimestamp, 0);
}

@end
