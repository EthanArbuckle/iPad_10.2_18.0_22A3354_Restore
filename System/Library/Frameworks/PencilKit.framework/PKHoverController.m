@implementation PKHoverController

- (id)hoverDebugLayerColor
{
  if (a1)
  {
    if (qword_1ECEE6260 != -1)
      dispatch_once(&qword_1ECEE6260, &__block_literal_global_46);
    a1 = (id)_MergedGlobals_133;
  }
  return a1;
}

void __41__PKHoverController_hoverDebugLayerColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_133;
  _MergedGlobals_133 = v0;

}

- ($78FB54F4A6B442EA15B736438C71FAD1)currentInputPoint
{
  void *v4;
  $78FB54F4A6B442EA15B736438C71FAD1 *result;
  id v6;

  objc_msgSend(*(id *)&self->_intentionalHoverStartTimestamp, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentFilteredPoint");
  }
  else
  {
    *(_OWORD *)&retstr->var11 = 0u;
    *(_OWORD *)&retstr->var13 = 0u;
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
  }

  return result;
}

- (void)updateCurrentInputPointWithInputPoint:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  $9076B28992D74D3AA2059476C2B9E2A9 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[8];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = *(id *)&self->_intentionalHoverStartTimestamp;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = *(_OWORD *)&a3->var9;
        v22[4] = *(_OWORD *)&a3->var7;
        v22[5] = v10;
        v11 = *(_OWORD *)&a3->var13;
        v22[6] = *(_OWORD *)&a3->var11;
        v22[7] = v11;
        v12 = *(_OWORD *)&a3->var1;
        v22[0] = a3->var0;
        v22[1] = v12;
        v13 = *(_OWORD *)&a3->var5;
        v22[2] = *(_OWORD *)&a3->var3;
        v22[3] = v13;
        objc_msgSend(v9, "addInputPoint:", v22, *(_OWORD *)&v14, v15, v16, v17, v18, v19, v20, v21);
        if (v9)
        {
          objc_msgSend(v9, "currentFilteredPoint");
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v14 = 0u;
          v15 = 0u;
        }
        *(_OWORD *)&a3->var7 = v18;
        *(_OWORD *)&a3->var9 = v19;
        *(_OWORD *)&a3->var11 = v20;
        *(_OWORD *)&a3->var13 = v21;
        a3->var0 = v14;
        *(_OWORD *)&a3->var1 = v15;
        ++v8;
        *(_OWORD *)&a3->var3 = v16;
        *(_OWORD *)&a3->var5 = v17;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  ++self->_gestureRecognizer;
}

- (int64x2_t)initWithDelegate:(void *)a3 view:
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  PKInputPointAltitudeAndAzimuthNoiseFilter *v18;
  void *v19;
  PKInputPointWeightedAverageFilter *v20;
  void *v21;
  PKInputPointAltitudeAndAzimuthBucketingFilter *v22;
  void *v23;
  PKInputPointAltitudeAndAzimuthZLimitFilter *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  PKInputPointAltitudeAndAzimuthEdgeFilter *v28;
  void *v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  PKInputPointExtraLatencyFilter *v33;
  void *v34;
  PKInputPointReduceFramerateFilter *v35;
  void *v36;
  PKInputPointPredictionFilter *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  objc_super v47;
  _QWORD v48[9];

  v48[8] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v47.receiver = a1;
    v47.super_class = (Class)PKHoverController;
    v7 = (id *)-[int64x2_t init](&v47, sel_init);
    v8 = v7;
    a1 = (int64x2_t *)v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, v6);
      objc_storeWeak(v8 + 54, v5);
      a1[14] = vdupq_n_s64(0x7FF8000000000000uLL);
      a1[15].i64[0] = 0x7FF8000000000000;
      a1[26].i8[8] = 0;
      a1[16].i64[0] = 0;
      a1->i16[4] = a1->i16[4] & 0xFFFE | objc_opt_respondsToSelector() & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 4;
      else
        v9 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFFB | v9;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFFD | v10;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 8;
      else
        v11 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFF7 | v11;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 16;
      else
        v12 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFEF | v12;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 32;
      else
        v13 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFDF | v13;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 64;
      else
        v14 = 0;
      a1->i16[4] = a1->i16[4] & 0xFFBF | v14;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = 128;
      else
        v15 = 0;
      a1->i16[4] = a1->i16[4] & 0xFF7F | v15;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 256;
      else
        v16 = 0;
      a1->i16[4] = a1->i16[4] & 0xFEFF | v16;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = 512;
      else
        v17 = 0;
      a1->i16[4] = a1->i16[4] & 0xFDFF | v17;
      -[int64x2_t _setupHoverGestureRecognizerInView:](a1, "_setupHoverGestureRecognizerInView:", v6);
      v18 = objc_alloc_init(PKInputPointAltitudeAndAzimuthNoiseFilter);
      v19 = (void *)a1[18].i64[1];
      a1[18].i64[1] = (uint64_t)v18;

      v20 = objc_alloc_init(PKInputPointWeightedAverageFilter);
      v21 = (void *)a1[18].i64[0];
      a1[18].i64[0] = (uint64_t)v20;

      v22 = objc_alloc_init(PKInputPointAltitudeAndAzimuthBucketingFilter);
      v23 = (void *)a1[19].i64[0];
      a1[19].i64[0] = (uint64_t)v22;

      v24 = objc_alloc_init(PKInputPointAltitudeAndAzimuthZLimitFilter);
      v25 = (void *)a1[19].i64[1];
      a1[19].i64[1] = (uint64_t)v24;

      v26 = v8[39];
      if (v26)
      {
        v26[20] = 0x400F6A7A2955385ELL;
        v27 = a1[19].i64[1];
        if (v27)
          *(_QWORD *)(v27 + 168) = 0;
      }
      v28 = objc_alloc_init(PKInputPointAltitudeAndAzimuthEdgeFilter);
      v29 = (void *)a1[20].i64[0];
      a1[20].i64[0] = (uint64_t)v28;

      v30 = (id *)v8[40];
      if (v30)
      {
        objc_storeWeak(v30 + 19, a1);
        v31 = a1[20].i64[0];
        if (v31)
        {
          *(_QWORD *)(v31 + 168) = 0x400F6A7A2955385ELL;
          v32 = a1[20].i64[0];
          if (v32)
            *(_QWORD *)(v32 + 176) = 0;
        }
      }
      v33 = objc_alloc_init(PKInputPointExtraLatencyFilter);
      v34 = (void *)a1[20].i64[1];
      a1[20].i64[1] = (uint64_t)v33;

      v35 = objc_alloc_init(PKInputPointReduceFramerateFilter);
      v36 = (void *)a1[21].i64[0];
      a1[21].i64[0] = (uint64_t)v35;

      v37 = objc_alloc_init(PKInputPointPredictionFilter);
      v38 = (void *)a1[21].i64[1];
      a1[21].i64[1] = (uint64_t)v37;

      v39 = a1[18].i64[0];
      v40 = a1[20].i64[0];
      v41 = a1[20].i64[1];
      v48[0] = a1[18].i64[1];
      v48[1] = v40;
      v42 = a1[19].i64[0];
      v48[2] = a1[19].i64[1];
      v48[3] = v39;
      v48[4] = v42;
      v48[5] = v41;
      v43 = v8[43];
      v48[6] = a1[21].i64[0];
      v48[7] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 8);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)a1[22].i64[0];
      a1[22].i64[0] = v44;

      -[int64x2_t _updateInputPointFilters](a1, "_updateInputPointFilters");
    }
  }

  return a1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKHoverController pauseDisplayLink](self, "pauseDisplayLink");
  objc_msgSend(*(id *)&self->_useUpdateCycle, "invalidate");
  v3 = *(void **)&self->_useUpdateCycle;
  *(_QWORD *)&self->_useUpdateCycle = 0;

  v4.receiver = self;
  v4.super_class = (Class)PKHoverController;
  -[PKHoverController dealloc](&v4, sel_dealloc);
}

- (void)_setupHoverGestureRecognizerInView:(id)a3
{
  NSTimer *v4;
  NSTimer *eventGeneratorTimer;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  char v12;
  id v13;

  v13 = a3;
  v4 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel__hoverGesture_);
  eventGeneratorTimer = self->_eventGeneratorTimer;
  self->_eventGeneratorTimer = v4;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportTouchPad");

  if ((v7 & 1) == 0)
    -[NSTimer setAllowedTouchTypes:](self->_eventGeneratorTimer, "setAllowedTouchTypes:", &unk_1E77ECB20);
  objc_msgSend(v13, "addGestureRecognizer:", self->_eventGeneratorTimer);
  +[PKPencilObserverGestureRecognizer pencilObserverWithDelegate:]((uint64_t)PKPencilObserverGestureRecognizer, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v8);
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 2;
  else
    v9 = 0;
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFD | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 4;
  else
    v10 = 0;
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFB | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 8;
  else
    v11 = 0;
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xF7 | v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 16;
  else
    v12 = 0;
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xEF | v12;

}

- (id)hoverGestureRecognizer
{
  if (a1)
    a1 = (id *)a1[33];
  return a1;
}

- (void)setShouldGenerate120HzEvents:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  PKHoverControllerDisplayLinkDelegate *v7;
  CAFrameRateRange v8;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 429) != a2)
    {
      *(_BYTE *)(a1 + 429) = a2;
      if (a2)
      {
        *(_BYTE *)(a1 + 408) = 0;
        if (_UIUpdateCycleEnabled())
          *(_BYTE *)(a1 + 408) = 1;
        if (!*(_QWORD *)(a1 + 400) && !*(_BYTE *)(a1 + 408))
        {
          v7 = objc_alloc_init(PKHoverControllerDisplayLinkDelegate);
          -[PKHoverControllerDisplayLinkDelegate setController:](v7, "setController:", a1);
          objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v7, sel_display_);
          v3 = objc_claimAutoreleasedReturnValue();
          v4 = *(void **)(a1 + 400);
          *(_QWORD *)(a1 + 400) = v3;

          v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
          objc_msgSend(*(id *)(a1 + 400), "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
          objc_msgSend(*(id *)(a1 + 400), "setHighFrameRateReason:", 1507329);
          objc_msgSend(*(id *)(a1 + 400), "setPaused:", 1);
          v5 = *(void **)(a1 + 400);
          objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

        }
      }
    }
  }
}

- (void)vsync
{
  uint64_t v3;
  _BYTE v4[128];

  kdebug_trace();
  if (BYTE5(self->_delegate))
  {
    if (LOBYTE(self->_updateCycleItem))
    {
      if (!LOBYTE(self->_timestampForLatestGestureUpdate))
      {
        if (LOBYTE(self->_waitingForHoverHoldTimestamp))
        {
          -[PKHoverController _setupPredictorForNewPoint:](self, "_setupPredictorForNewPoint:", 0);
          -[PKHoverController currentInputPoint](self, "currentInputPoint");
          -[PKHoverController _sendDidUpdate:](self, "_sendDidUpdate:", v4);
        }
      }
      LOBYTE(self->_timestampForLatestGestureUpdate) = 0;
    }
    else if (LOBYTE(self->_timestampForLatestGestureUpdate)
           && LOBYTE(self->_waitingForHoverHoldTimestamp)
           && CACurrentMediaTime() - *(double *)&self->_displayLink > 0.00208333333)
    {
      LOBYTE(self->_timestampForLatestGestureUpdate) = 0;
      -[PKHoverController _setupPredictorForNewPoint:](self, "_setupPredictorForNewPoint:", 0);
      -[PKHoverController currentInputPoint](self, "currentInputPoint");
      -[PKHoverController _sendDidUpdate:](self, "_sendDidUpdate:", &v3);
    }
  }
}

- (void)_updateInputPointFilters
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PKInputPointAltitudeAndAzimuthNoiseFilter *altitudeAndAzimuthNoiseFilter;
  void *v13;
  double v14;
  PKInputPointAltitudeAndAzimuthNoiseFilter *v15;
  void *v16;
  double v17;
  PKInputPointAltitudeAndAzimuthNoiseFilter *v18;
  void *v19;
  uint64_t v20;
  PKInputPointAltitudeAndAzimuthNoiseFilter *v21;
  void *v22;
  char v23;
  PKInputPointAltitudeAndAzimuthBucketingFilter *altitudeAndAzimuthBucketingFilter;
  void *v25;
  int64_t v26;
  PKInputPointAltitudeAndAzimuthBucketingFilter *v27;
  void *v28;
  CGFloat v29;
  PKInputPointAltitudeAndAzimuthBucketingFilter *v30;
  void *v31;
  double v32;
  PKInputPointAltitudeAndAzimuthBucketingFilter *v33;
  void *v34;
  double v35;
  PKInputPointAltitudeAndAzimuthBucketingFilter *v36;
  void *v37;
  int v38;
  PKInputPointAltitudeAndAzimuthZLimitFilter *altitudeAndAzimuthZLimitFilter;
  void *v40;
  int v41;
  PKInputPointAltitudeAndAzimuthZLimitFilter *v42;
  void *v43;
  PKInputPointAltitudeAndAzimuthEdgeFilterDelegate *v44;
  PKInputPointAltitudeAndAzimuthEdgeFilter *altitudeAndAzimuthEdgeFilter;
  double v46;
  void *v47;
  double v48;
  PKInputPointExtraLatencyFilter *extraLatencyFilter;
  void *v50;
  uint64_t v51;
  PKInputPointReduceFramerateFilter *reduceFramerateFilter;
  void *v53;
  uint64_t v54;
  PKInputPointPredictionFilter *predictionFilter;
  void *v56;
  objc_class *v57;
  NSArray *allInputPointFilters;
  NSArray *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v3 = *(id *)&self->_intentionalHoverStartTimestamp;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v61 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings", (_QWORD)v60);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "maxZDistance");
        if (v7)
          *(_QWORD *)(v7 + 8) = v9;

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v4);
  }

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "weightedAverageLocationFactor");
  altitudeAndAzimuthNoiseFilter = self->_altitudeAndAzimuthNoiseFilter;
  if (altitudeAndAzimuthNoiseFilter)
    *(_QWORD *)&altitudeAndAzimuthNoiseFilter->generator.__x_ = v11;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "weightedAverageLocationFactor");
  v15 = self->_altitudeAndAzimuthNoiseFilter;
  if (v15)
    v15->currentAzimuthOffsetValue = v14;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "weightedAverageAltitudeFactor");
  v18 = self->_altitudeAndAzimuthNoiseFilter;
  if (v18)
    v18->currentAltitudeOffsetValue = v17;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "weightedAverageAzimuthFactor");
  v21 = self->_altitudeAndAzimuthNoiseFilter;
  if (v21)
    *(_QWORD *)&v21->_noiseIsHeightBased = v20;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "noiseIsHeightBased");
  altitudeAndAzimuthBucketingFilter = self->_altitudeAndAzimuthBucketingFilter;
  if (altitudeAndAzimuthBucketingFilter)
    LOBYTE(altitudeAndAzimuthBucketingFilter[1].super._maxZDistance) = v23;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "altitudeJitterNoise");
  v27 = self->_altitudeAndAzimuthBucketingFilter;
  if (v27)
    v27[1].super._numInputPoints = v26;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "azimuthJitterNoise");
  v30 = self->_altitudeAndAzimuthBucketingFilter;
  if (v30)
    v30[1].super._filteredPoint.var0.point.x = v29;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "altitudeOffsetNoise");
  v33 = self->_altitudeAndAzimuthBucketingFilter;
  if (v33 && v33[1].super._filteredPoint.var0.point.y != v32)
  {
    v33[1].super._filteredPoint.var0.point.y = v32;
    -[PKInputPointAltitudeAndAzimuthBucketingFilter _recalculateOffsets](v33, "_recalculateOffsets");
  }

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "azimuthOffsetNoise");
  v36 = self->_altitudeAndAzimuthBucketingFilter;
  if (v36 && v36[1].super._filteredPoint.force != v35)
  {
    v36[1].super._filteredPoint.force = v35;
    -[PKInputPointAltitudeAndAzimuthBucketingFilter _recalculateOffsets](v36, "_recalculateOffsets");
  }

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "altitudeBuckets");
  altitudeAndAzimuthZLimitFilter = self->_altitudeAndAzimuthZLimitFilter;
  if (altitudeAndAzimuthZLimitFilter)
    *(_QWORD *)&altitudeAndAzimuthZLimitFilter->_lastKnownAzimuth = v38;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "azimuthBuckets");
  v42 = self->_altitudeAndAzimuthZLimitFilter;
  if (v42)
    *(_QWORD *)&v42->_altitudeAndAzimuthZLimit = v41;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "toolPreviewAzimuthTiltMaxZDistance");
  altitudeAndAzimuthEdgeFilter = self->_altitudeAndAzimuthEdgeFilter;
  if (altitudeAndAzimuthEdgeFilter)
    altitudeAndAzimuthEdgeFilter->_delegate = v44;

  if (-[PKHoverController pointsPerMillimeter]::onceToken != -1)
    dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_74_0);
  v46 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings", (_QWORD)v60);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "screenEdgeSizeInMillimeters");
  extraLatencyFilter = self->_extraLatencyFilter;
  if (extraLatencyFilter)
    *(double *)&extraLatencyFilter->_inputPoints.__end_ = v46 * v48;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "numFramesExtraLatency");
  reduceFramerateFilter = self->_reduceFramerateFilter;
  if (reduceFramerateFilter)
    *(_QWORD *)&reduceFramerateFilter[1].super._maxZDistance = v51;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "numFramesReduceFramerate");
  predictionFilter = self->_predictionFilter;
  if (predictionFilter)
    *(_QWORD *)&predictionFilter->_fullPredictionTimeIntervalPoint.var0.point.x = v54;

  if (isPencilGesture((UIHoverGestureRecognizer *)self->_eventGeneratorTimer))
  {
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "predictionTimeInterval");
    allInputPointFilters = self->_allInputPointFilters;
    if (allInputPointFilters)
      allInputPointFilters[53].super.isa = v57;

  }
  else
  {
    v59 = self->_allInputPointFilters;
    if (v59)
      v59[53].super.isa = 0;
  }
}

- (void)_hoverGesture:(id)a3
{
  id v4;
  id WeakRetained;
  Class isa;
  void *v7;
  uint64_t v8;
  double previousRollValue;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  int v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  double v28;
  id v29;
  double v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v39;
  _QWORD v40[5];
  __int128 v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  _QWORD v48[5];
  __int128 v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58[2];
  id location;

  v4 = a3;
  BYTE1(self->_delegate) = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_checkDidLiftAfterGestureEnd, 0);
  if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
  {
    if (objc_msgSend(v4, "state") == 1)
    {
      if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
        objc_msgSend(WeakRetained, "hoverControllerGestureBegan:", self);

      }
      -[PKHoverController _updateInputPointFilters](self, "_updateInputPointFilters");
      if (*(double *)&self[1].super.isa > 0.0)
      {
        objc_initWeak(&location, self);
        isa = self[1].super.isa;
        v7 = (void *)MEMORY[0x1E0C99E88];
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __35__PKHoverController__hoverGesture___block_invoke;
        v56[3] = &unk_1E777ABB8;
        objc_copyWeak(v58, &location);
        v57 = v4;
        v58[1] = isa;
        objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v56, *(double *)&isa);
        v8 = objc_claimAutoreleasedReturnValue();
        previousRollValue = self->_previousRollValue;
        *(_QWORD *)&self->_previousRollValue = v8;

        objc_destroyWeak(v58);
        objc_destroyWeak(&location);
      }
    }
    v10 = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
    objc_msgSend(v4, "_preciseLocationInView:", v10);
    v12 = v11;
    v14 = v13;

    if (((uint64_t)self->_view & 8) != 0)
    {
      objc_msgSend(v4, "zOffset");
      v18 = v17;
      +[PKHoverSettings maxHoverHeight](PKHoverSettings, "maxHoverHeight");
      v15 = v18 * v19;
      if (((uint64_t)self->_view & 4) == 0)
        goto LABEL_10;
    }
    else
    {
      v15 = 5.0;
      if (((uint64_t)self->_view & 4) == 0)
      {
LABEL_10:
        v16 = CACurrentMediaTime();
LABEL_13:
        v20 = v16;
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "supportTouchPad");
        if (v15 == 0.0)
          v23 = v22;
        else
          v23 = 0;

        v24 = v15;
        if (v23 == 1)
        {
          +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "toolPreviewMaxZDistance");
          v24 = v26 * 0.5;

        }
        v27 = 0;
        if (+[PKHoverSettings isHoverActive](PKHoverSettings, "isHoverActive")
          && ((uint64_t)self->_view & 2) != 0)
        {
          objc_msgSend(v4, "altitudeAngle");
          if ((*(_QWORD *)&v28 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            if (v15 > 0.0 && v28 < 1.5 || v15 > 2.0 && fabs(v28 + -1.57079633) >= 0.00999999978)
              BYTE2(self->_delegate) = 1;
            v30 = 1.57079633 - v28;
            if (v30 >= 0.0)
            {
              v27 = *(_QWORD *)&v30;
              if (v30 > 1.57079633)
                v27 = 0x3FF921FB54442D18;
            }
          }
        }
        v31 = 0;
        v32 = 0.0;
        if (+[PKHoverSettings isHoverActive](PKHoverSettings, "isHoverActive"))
        {
          v32 = 3.92699082;
          if (((uint64_t)self->_view & 1) != 0)
          {
            objc_msgSend(v4, "view");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "azimuthAngleInView:", v33);
            v35 = v34;

            if ((*(_QWORD *)&v35 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
            {
              v36 = v35 + -3.14159265;
              v37 = fmod(v36, 6.28318531);
              if (v36 <= 6.28318531 && v36 >= 0.0)
                v37 = v36;
              if (v37 < 0.0)
                v37 = v37 + 6.28318531;
              if (v37 == 0.0)
                v32 = 0.0;
              else
                v32 = v37;
            }
          }
        }
        if (((uint64_t)self->_view & 0x10) != 0)
        {
          objc_msgSend(v4, "_rollAngle");
          v31 = v39;
        }
        if (v24 < 100.0)
        {
          v48[0] = v12;
          v48[1] = v14;
          v48[2] = 0x3FF0000000000000;
          *(double *)&v48[3] = v32;
          v48[4] = v27;
          v49 = unk_1BE4FF048;
          v50 = v24;
          v51 = v20;
          v52 = unk_1BE4FF068;
          v53 = unk_1BE4FF078;
          v54 = v31;
          v55 = unk_1BE4FF090;
          -[PKHoverController _trackIntentionalHover:](self, "_trackIntentionalHover:", v48);
          LOBYTE(self->_timestampForLatestGestureUpdate) = 1;
          *(CFTimeInterval *)&self->_displayLink = CACurrentMediaTime();
          -[PKHoverController _setupPredictorForNewPoint:](self, "_setupPredictorForNewPoint:", 1);
          v40[0] = v12;
          v40[1] = v14;
          v40[2] = 0x3FF0000000000000;
          *(double *)&v40[3] = v32;
          v40[4] = v27;
          v41 = unk_1BE4FF048;
          v42 = v24;
          v43 = v20;
          v44 = unk_1BE4FF068;
          v45 = unk_1BE4FF078;
          v46 = v31;
          v47 = unk_1BE4FF090;
          -[PKHoverController _handleHoverInputPoint:](self, "_handleHoverInputPoint:", v40);
        }
        goto LABEL_51;
      }
    }
    objc_msgSend(v4, "_hoverTouchTimestamp");
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
    {
      v29 = objc_loadWeakRetained((id *)&self->_currentLabel);
      objc_msgSend(v29, "hoverControllerGestureEnded:", self);

    }
    -[PKHoverController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_checkDidLiftAfterGestureEnd, 0, 0.0666666667);
  }
  -[PKHoverController reset]((uint64_t)self);
LABEL_51:

}

void __35__PKHoverController__hoverGesture___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained
    && (objc_msgSend(*(id *)(a1 + 32), "state") == 2 || objc_msgSend(*(id *)(a1 + 32), "state") == 1)
    && CACurrentMediaTime() - *((double *)WeakRetained + 9) > *(double *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
      objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    if (*((_QWORD *)WeakRetained + 5) == *((_QWORD *)WeakRetained + 4))
      v3 = WeakRetained + 96;
    else
      v3 = (_OWORD *)*((_QWORD *)WeakRetained + 4);
    v4 = v3[2];
    v5 = v3[3];
    v6 = v3[1];
    v10[0] = *v3;
    v10[1] = v6;
    v7 = v3[7];
    v9 = v3[4];
    v8 = v3[5];
    v10[6] = v3[6];
    v10[7] = v7;
    v10[4] = v9;
    v10[5] = v8;
    v10[2] = v4;
    v10[3] = v5;
    objc_msgSend(WeakRetained, "_handleHoverInputPoint:", v10);
  }

}

- (void)reset
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[PKHoverController resetHoverHold](a1);
    if (*(_BYTE *)(a1 + 56) && (*(_WORD *)(a1 + 8) & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 432));
      objc_msgSend(WeakRetained, "hoverControllerDidEnd:", a1);

    }
    *(_BYTE *)(a1 + 384) = 0;
    *(_QWORD *)(a1 + 392) = 0;
    objc_msgSend((id)a1, "pauseDisplayLink");
    *(_QWORD *)(a1 + 256) = 0;
    *(_BYTE *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 88) = 0;
    std::vector<PKInputPoint>::resize(a1 + 32, 0);
    objc_msgSend(*(id *)(a1 + 272), "invalidate");
    v3 = *(void **)(a1 + 272);
    *(_QWORD *)(a1 + 272) = 0;

    objc_msgSend((id)a1, "_endIntentionalHoverTracking");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = *(id *)(a1 + 352);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "resetFilter", (_QWORD)v8);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)checkDidLiftAfterGestureEnd
{
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateFlags & 8) != 0 && !LOBYTE(self->_waitingForHoverHoldTimestamp))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    objc_msgSend(WeakRetained, "hoverControllerDidLift:", self);

  }
}

- (void)didReceiveNormalTouch:(uint64_t)a1
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_checkDidLiftAfterGestureEnd, 0);
    if (!v16)
    {
LABEL_27:
      -[PKHoverController reset](a1);
      goto LABEL_28;
    }
    if (objc_msgSend(v16, "type") == 2)
    {
      if (objc_msgSend(v16, "type") == 2)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(v16, "azimuthAngleInView:", WeakRetained);
        v5 = v4;

        if ((*(_QWORD *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v7 = v5 + -3.14159265;
          v6 = fmod(v7, 6.28318531);
          if (v7 <= 6.28318531 && v7 >= 0.0)
            v6 = v7;
          if (v6 < 0.0)
            v6 = v6 + 6.28318531;
          if (v6 == 0.0)
            v6 = 0.0;
          v9 = *(_QWORD *)(a1 + 312);
          if (v9)
            *(double *)(v9 + 160) = v6;
          v10 = *(_QWORD *)(a1 + 320);
          if (v10)
            *(double *)(v10 + 168) = v6;
        }
        objc_msgSend(v16, "altitudeAngle", v6);
        if ((*(_QWORD *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v12 = 1.57079633 - v11;
          v13 = 0;
          if (v12 >= 0.0)
          {
            v13 = *(_QWORD *)&v12;
            if (v12 > 1.57079633)
              v13 = 0x3FF921FB54442D18;
          }
          v14 = *(_QWORD *)(a1 + 312);
          if (v14)
            *(_QWORD *)(v14 + 168) = v13;
          v15 = *(_QWORD *)(a1 + 320);
          if (v15)
            *(_QWORD *)(v15 + 176) = v13;
        }
      }
      goto LABEL_27;
    }
  }
LABEL_28:

}

- (void)resetHoverHold
{
  id WeakRetained;

  if (a1)
  {
    *(_BYTE *)(a1 + 58) = 0;
    if (*(_BYTE *)(a1 + 57))
    {
      if ((*(_WORD *)(a1 + 8) & 0x20) == 0
        || (WeakRetained = objc_loadWeakRetained((id *)(a1 + 432)),
            objc_msgSend(WeakRetained, "hoverControllerHoldGestureEnded:", a1),
            WeakRetained,
            *(_BYTE *)(a1 + 57)))
      {
        *(CFTimeInterval *)(a1 + 80) = CACurrentMediaTime();
        *(_BYTE *)(a1 + 57) = 0;
      }
    }
  }
}

- (void)startDisplayLink
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  if (!LOBYTE(self->_updateCycleItem))
    goto LABEL_4;
  if (!*(_QWORD *)&self->_shouldShowHoverDebugLayer)
  {
    _UIUpdateRequestActivate();
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C809B0];
    v4 = 3221225472;
    v5 = __37__PKHoverController_startDisplayLink__block_invoke;
    v6 = &unk_1E7778210;
    objc_copyWeak(&v7, &location);
    *(_QWORD *)&self->_shouldShowHoverDebugLayer = _UIUpdateSequenceInsertItem();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    if (!LOBYTE(self->_updateCycleItem))
LABEL_4:
      objc_msgSend(*(id *)&self->_useUpdateCycle, "setPaused:", 0, v3, v4, v5, v6);
  }
}

void __37__PKHoverController_startDisplayLink__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vsync");

}

- (void)pauseDisplayLink
{
  if (*(_QWORD *)&self->_shouldShowHoverDebugLayer)
  {
    _UIUpdateRequestDeactivate();
    _UIUpdateSequenceRemoveItem();
    *(_QWORD *)&self->_shouldShowHoverDebugLayer = 0;
  }
  if (!LOBYTE(self->_updateCycleItem))
    objc_msgSend(*(id *)&self->_useUpdateCycle, "setPaused:", 1);
}

- (void)updateShapeLayer:(double *)a3 inputPoint:
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  if (!a1)
    goto LABEL_9;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "debugCursorType");

  switch(v6)
  {
    case 0:
      v9 = 8.0;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *a3 - v9 * 0.5, a3[1] - v9 * 0.5, v9, v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setPath:", objc_msgSend(v10, "CGPath"));

      -[PKHoverController hoverDebugLayerColor](a1);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

      objc_msgSend(v12, "setLineWidth:", 1.0);
      break;
    case 1:
      v9 = a3[7] + a3[7];
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", *a3 + -0.5, a3[1] + -8.0, 1.0, 16.0);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setPath:", objc_msgSend(v7, "CGPath"));

      -[PKHoverController hoverDebugLayerColor](a1);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

      objc_msgSend(v12, "setLineWidth:", 1.0);
      break;
  }
LABEL_9:

}

- (void)_triggerHoldGestureIfNecessary
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  uint64_t v4;
  double v6;
  double v7;
  BOOL v8;
  CFTimeInterval v9;
  uint64_t v10;
  double v11;
  double v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  double v15;
  double v16;
  double v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  double v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  id WeakRetained;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[8];
  _QWORD v45[5];
  __int128 v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  end = self->_inputPoints.__end_;
  value = self->_inputPoints.__end_cap_.__value_;
  v4 = value - end;
  if (value == end || (*(_WORD *)&self->_delegateFlags & 0x10) == 0)
    return;
  if (!BYTE1(self->_waitingForHoverHoldTimestamp))
    goto LABEL_11;
  v6 = sqrt((self->_latestHoldZPosition - *((double *)end + 1)) * (self->_latestHoldZPosition - *((double *)end + 1))+ (self->_latestHoldLocation.y - *(double *)end) * (self->_latestHoldLocation.y - *(double *)end));
  v7 = *(double *)&self->_hoverLabelView - *((double *)end + 7);
  if (v7 < 0.0)
    v7 = -v7;
  v8 = v6 < 8.0 && v7 < 2.0;
  if (!v8)
  {
    -[PKHoverController resetHoverHold]((uint64_t)self);
LABEL_11:
    v9 = CACurrentMediaTime();
    if (self->_latestInputPointSentTimestamp + 1.0 <= v9)
    {
      v10 = v4 >> 7;
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v14 = self->_inputPoints.__end_;
      v13 = self->_inputPoints.__end_cap_.__value_;
      if (v14 == v13)
      {
        v22 = v11 / (double)(unint64_t)v10;
        v23 = v12 / (double)(unint64_t)v10;
        v21 = 0;
        v26 = 0.0 / (double)(unint64_t)v10;
        v25 = v26;
        v24 = 0.0;
      }
      else
      {
        v15 = 0.0;
        v16 = 0.0;
        v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v18 = self->_inputPoints.__end_;
        v19 = *MEMORY[0x1E0C9D538];
        do
        {
          v20 = v18;
          v19 = v19 + *(double *)v18;
          v17 = v17 + *((double *)v18 + 1);
          v16 = v16 + *((double *)v18 + 7);
          v15 = v15 + *((double *)v18 + 8);
          v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 128);
        }
        while (v18 != v13);
        v21 = *((_QWORD *)v20 + 4);
        v22 = v19 / (double)(unint64_t)v10;
        v23 = v17 / (double)(unint64_t)v10;
        v24 = 0.0;
        v25 = v16 / (double)(unint64_t)v10;
        do
        {
          v11 = v11 + (*(double *)v14 - v22) * (*(double *)v14 - v22);
          v12 = v12 + (*((double *)v14 + 1) - v23) * (*((double *)v14 + 1) - v23);
          v24 = v24 + (*((double *)v14 + 7) - v25) * (*((double *)v14 + 7) - v25);
          v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v14 + 128);
        }
        while (v14 != v13);
        v26 = v15 / (double)(unint64_t)v10;
      }
      v27 = sqrt(v12 + v11);
      v28 = sqrt(v24);
      v8 = v27 < 4.0;
      v29 = 1.0;
      if (v8 && v28 < 1.0)
      {
        if (!BYTE1(self->_waitingForHoverHoldTimestamp) && !BYTE2(self->_waitingForHoverHoldTimestamp))
        {
          v29 = *((double *)v13 - 8);
          self->_latestInputPointTimestamp = v29;
          BYTE2(self->_waitingForHoverHoldTimestamp) = 1;
        }
        v31 = BYTE3(self->_delegate);
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings", v29, v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v31)
          objc_msgSend(v32, "hoverAndHoldActionTimeInterval");
        else
          objc_msgSend(v32, "hoverAndHoldTriggerTimeInterval");
        v35 = v34;

        if (!BYTE1(self->_waitingForHoverHoldTimestamp)
          && BYTE2(self->_waitingForHoverHoldTimestamp)
          && v9 - self->_latestInputPointTimestamp > v35)
        {
          *(_WORD *)((char *)&self->_waitingForHoverHoldTimestamp + 1) = 1;
          self->_latestInputPointSentTimestamp = v9;
          self->_latestHoldLocation.y = v22;
          self->_latestHoldZPosition = v23;
          *(double *)&self->_hoverLabelView = v25;
          WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
          *(double *)v45 = v22;
          *(double *)&v45[1] = v23;
          v45[2] = 0;
          v45[3] = v21;
          v45[4] = v21;
          v46 = unk_1BE4FF048;
          v47 = v25;
          v48 = v26;
          v49 = unk_1BE4FF068;
          v50 = unk_1BE4FF078;
          v51 = unk_1BE4FF088;
          v52 = 0;
          v37 = self->_inputPoints.__end_;
          v38 = *(_OWORD *)v37;
          v39 = *((_OWORD *)v37 + 1);
          v40 = *((_OWORD *)v37 + 3);
          v44[2] = *((_OWORD *)v37 + 2);
          v44[3] = v40;
          v44[0] = v38;
          v44[1] = v39;
          v41 = *((_OWORD *)v37 + 4);
          v42 = *((_OWORD *)v37 + 5);
          v43 = *((_OWORD *)v37 + 7);
          v44[6] = *((_OWORD *)v37 + 6);
          v44[7] = v43;
          v44[4] = v41;
          v44[5] = v42;
          objc_msgSend(WeakRetained, "hoverController:holdGestureMeanInputPoint:latestInputPoint:", self, v45, v44);

        }
      }
      else
      {
        BYTE2(self->_waitingForHoverHoldTimestamp) = 0;
      }
    }
  }
}

- (void)_endIntentionalHoverTracking
{
  self->_intentionalHoverMinZValue = 0.0;
  self->_intentionalHoverMaxZValue = 0.0;
  *(_QWORD *)&self->_didReceiveNewPointToPredict = 0;
}

- (void)_trackIntentionalHover:(id *)a3
{
  double var6;
  double intentionalHoverMaxZValue;
  double v6;
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateFlags & 0x40) != 0)
  {
    if (self->_intentionalHoverMinZValue == 0.0)
    {
      self->_intentionalHoverMinZValue = a3->var7;
      self->_intentionalHoverMaxZValue = a3->var6;
      *(double *)&self->_didReceiveNewPointToPredict = a3->var6;
    }
    else
    {
      var6 = a3->var6;
      intentionalHoverMaxZValue = self->_intentionalHoverMaxZValue;
      if (intentionalHoverMaxZValue >= var6)
        intentionalHoverMaxZValue = a3->var6;
      if (*(double *)&self->_didReceiveNewPointToPredict >= var6)
        var6 = *(double *)&self->_didReceiveNewPointToPredict;
      if (var6 - intentionalHoverMaxZValue <= 0.5)
      {
        self->_intentionalHoverMaxZValue = intentionalHoverMaxZValue;
        *(double *)&self->_didReceiveNewPointToPredict = var6;
      }
      else
      {
        v6 = CACurrentMediaTime() - self->_intentionalHoverMinZValue;
        if (v6 > 0.5)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
          objc_msgSend(WeakRetained, "hoverController:intentionalHoverWithDuration:", self, v6);

        }
        -[PKHoverController _endIntentionalHoverTracking](self, "_endIntentionalHoverTracking");
      }
    }
  }
}

- (void)_setupPredictorForNewPoint:(BOOL)a3
{
  NSArray *allInputPointFilters;
  BOOL v4;
  int *v5;

  allInputPointFilters = self->_allInputPointFilters;
  if (allInputPointFilters)
  {
    v4 = BYTE5(self->_delegate) && a3;
    LOBYTE(allInputPointFilters[52].super.isa) = v4;
    if (allInputPointFilters[2].super.isa)
    {
      if (LOBYTE(allInputPointFilters[52].super.isa))
        v5 = &OBJC_IVAR___PKInputPointPredictionFilter__halfPredictionTimeIntervalPoint;
      else
        v5 = &OBJC_IVAR___PKInputPointPredictionFilter__fullPredictionTimeIntervalPoint;
      memmove(&allInputPointFilters[3], (char *)allInputPointFilters + *v5, 0x80uLL);
    }
  }
}

- (void)_handleHoverInputPoint:(id *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double x;
  double y;
  id WeakRetained;
  char v12;
  id v13;
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double var6;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  _BOOL4 v31;
  int v32;
  double v33;
  unint64_t v34;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v37;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  $9076B28992D74D3AA2059476C2B9E2A9 *v49;
  uint64_t v50;
  $78FB54F4A6B442EA15B736438C71FAD1 *v51;
  $9076B28992D74D3AA2059476C2B9E2A9 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  $9076B28992D74D3AA2059476C2B9E2A9 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  $9076B28992D74D3AA2059476C2B9E2A9 *v64;
  uint64_t v65;
  $9076B28992D74D3AA2059476C2B9E2A9 v66;
  $9076B28992D74D3AA2059476C2B9E2A9 v67;
  $9076B28992D74D3AA2059476C2B9E2A9 v68;
  $9076B28992D74D3AA2059476C2B9E2A9 v69;
  $9076B28992D74D3AA2059476C2B9E2A9 v70;
  $9076B28992D74D3AA2059476C2B9E2A9 v71;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _OWORD v83[8];
  _OWORD v84[8];
  _OWORD v85[8];
  _OWORD v86[8];
  __int128 v87;
  __int128 v88;
  BOOL *p_activeInputPoint;

  if (self && BYTE4(self->_delegate))
  {
    v5 = *(_OWORD *)&a3->var9;
    v86[4] = *(_OWORD *)&a3->var7;
    v86[5] = v5;
    v6 = *(_OWORD *)&a3->var13;
    v86[6] = *(_OWORD *)&a3->var11;
    v86[7] = v6;
    v7 = *(_OWORD *)&a3->var1;
    v86[0] = a3->var0;
    v86[1] = v7;
    v8 = *(_OWORD *)&a3->var5;
    v86[2] = *(_OWORD *)&a3->var3;
    v86[3] = v8;
    -[PKHoverController logInputPoint:](self, "logInputPoint:", v86);
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0)
  {
    x = a3->var0.var0.x;
    y = a3->var0.var0.y;
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    v12 = objc_msgSend(WeakRetained, "hoverController:shouldBeActiveAt:", self, x, y);

    if ((v12 & 1) == 0)
    {
      if (!LOBYTE(self->_waitingForHoverHoldTimestamp))
        return;
      std::vector<PKInputPoint>::resize((uint64_t)&self->_inputPoints.__end_, 0);
      LOBYTE(self->_waitingForHoverHoldTimestamp) = 0;
      if ((*(_WORD *)&self->_delegateFlags & 4) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_currentLabel);
        objc_msgSend(v13, "hoverControllerDidEnd:", self);

      }
    }
  }
  var0 = a3->var0;
  v15 = *(_OWORD *)&a3->var1;
  v16 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_cachedLatestInputPoint.velocity = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_cachedLatestInputPoint.zPosition = v16;
  *($9076B28992D74D3AA2059476C2B9E2A9 *)&self->_cachedLatestInputPoint.var0.location.y = var0;
  *(_OWORD *)&self->_cachedLatestInputPoint.azimuth = v15;
  v17 = *(_OWORD *)&a3->var7;
  v18 = *(_OWORD *)&a3->var9;
  v19 = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_cachedLatestInputPoint.rollAngle = *(_OWORD *)&a3->var11;
  *(_OWORD *)&self->_cachedLatestInputPoint.estimatedActiveInputPropertiesExpectingUpdates = v19;
  *(_OWORD *)&self->_cachedLatestInputPoint.predicted = v17;
  *(_OWORD *)&self->_cachedLatestInputPoint.length = v18;
  var6 = a3->var6;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "maxZDistance");
  v23 = v22;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "deactivateExtraDistance");
  v26 = *(_OWORD *)&a3->var9;
  v85[4] = *(_OWORD *)&a3->var7;
  v85[5] = v26;
  v27 = *(_OWORD *)&a3->var13;
  v85[6] = *(_OWORD *)&a3->var11;
  v85[7] = v27;
  v28 = *(_OWORD *)&a3->var1;
  v85[0] = a3->var0;
  v85[1] = v28;
  v29 = *(_OWORD *)&a3->var5;
  v85[2] = *(_OWORD *)&a3->var3;
  v85[3] = v29;
  v30 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)self, v85, v23 + v25);

  if (var6 <= v30)
  {
    v31 = 0;
    v32 = 0;
    if (var6 != 0.0)
      goto LABEL_14;
  }
  else
  {
    v31 = self->_inputPoints.__end_cap_.__value_ != self->_inputPoints.__end_;
    var6 = 0.0;
  }
  if (!LOBYTE(self->_waitingForHoverHoldTimestamp))
    return;
  v32 = 1;
LABEL_14:
  a3->var6 = var6;
  v33 = CACurrentMediaTime();
  v34 = *(_QWORD *)&self->_activeInputPoint;
  self->_latestHoldTimestamp = v33;
  end = self->_inputPoints.__end_;
  value = self->_inputPoints.__end_cap_.__value_;
  if ((unint64_t)value < v34)
  {
    if (end == value)
    {
      v58 = a3->var0;
      v59 = *(_OWORD *)&a3->var1;
      v60 = *(_OWORD *)&a3->var5;
      *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
      *((_OWORD *)end + 3) = v60;
      *($9076B28992D74D3AA2059476C2B9E2A9 *)end = v58;
      *((_OWORD *)end + 1) = v59;
      v61 = *(_OWORD *)&a3->var7;
      v62 = *(_OWORD *)&a3->var9;
      v63 = *(_OWORD *)&a3->var13;
      *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
      *((_OWORD *)end + 7) = v63;
      *((_OWORD *)end + 4) = v61;
      *((_OWORD *)end + 5) = v62;
      self->_inputPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
    }
    else
    {
      v37 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
      v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)value - 128);
      v39 = self->_inputPoints.__end_cap_.__value_;
      while (v38 < value)
      {
        v40 = *(_OWORD *)v38;
        v41 = *((_OWORD *)v38 + 1);
        v42 = *((_OWORD *)v38 + 3);
        *((_OWORD *)v39 + 2) = *((_OWORD *)v38 + 2);
        *((_OWORD *)v39 + 3) = v42;
        *(_OWORD *)v39 = v40;
        *((_OWORD *)v39 + 1) = v41;
        v43 = *((_OWORD *)v38 + 4);
        v44 = *((_OWORD *)v38 + 5);
        v45 = *((_OWORD *)v38 + 7);
        *((_OWORD *)v39 + 6) = *((_OWORD *)v38 + 6);
        *((_OWORD *)v39 + 7) = v45;
        *((_OWORD *)v39 + 4) = v43;
        *((_OWORD *)v39 + 5) = v44;
        v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 + 128);
        v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 + 128);
      }
      self->_inputPoints.__end_cap_.__value_ = v39;
      if (value != v37)
        memmove((char *)value - 128 * ((value - v37) >> 7), end, value - v37);
      v51 = a3;
      if (end <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)a3)
        v51 = &a3[(unint64_t)(self->_inputPoints.__end_cap_.__value_ > ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)a3)];
      v52 = v51->var0;
      v53 = *(_OWORD *)&v51->var1;
      v54 = *(_OWORD *)&v51->var5;
      *((_OWORD *)end + 2) = *(_OWORD *)&v51->var3;
      *((_OWORD *)end + 3) = v54;
      *($9076B28992D74D3AA2059476C2B9E2A9 *)end = v52;
      *((_OWORD *)end + 1) = v53;
      v55 = *(_OWORD *)&v51->var7;
      v56 = *(_OWORD *)&v51->var9;
      v57 = *(_OWORD *)&v51->var13;
      *((_OWORD *)end + 6) = *(_OWORD *)&v51->var11;
      *((_OWORD *)end + 7) = v57;
      *((_OWORD *)end + 4) = v55;
      *((_OWORD *)end + 5) = v56;
    }
    goto LABEL_42;
  }
  v46 = ((value - end) >> 7) + 1;
  if (v46 >> 57)
    std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
  v47 = v34 - (_QWORD)end;
  if (v47 >> 6 > v46)
    v46 = v47 >> 6;
  if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFF80)
    v48 = 0x1FFFFFFFFFFFFFFLL;
  else
    v48 = v46;
  p_activeInputPoint = &self->_activeInputPoint;
  if (!v48)
  {
    v49 = 0;
    v87 = 0u;
    v88 = 0u;
LABEL_35:
    v64 = ($9076B28992D74D3AA2059476C2B9E2A9 *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_activeInputPoint, 1uLL);
    *(_QWORD *)&v87 = v64;
    *((_QWORD *)&v87 + 1) = v64;
    *((_QWORD *)&v88 + 1) = &v64[8 * v65];
    if (v49)
      operator delete(v49);
    v49 = v64;
    goto LABEL_38;
  }
  v49 = ($9076B28992D74D3AA2059476C2B9E2A9 *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_activeInputPoint, v48);
  *(_QWORD *)&v87 = v49;
  *((_QWORD *)&v87 + 1) = v49;
  *(_QWORD *)&v88 = v49;
  *((_QWORD *)&v88 + 1) = &v49[8 * v50];
  if (!v50)
    goto LABEL_35;
LABEL_38:
  v66 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var3;
  v67 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var5;
  v68 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var1;
  *v49 = a3->var0;
  v49[1] = v68;
  v49[2] = v66;
  v49[3] = v67;
  v69 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var7;
  v70 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var9;
  v71 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var13;
  v49[6] = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var11;
  v49[7] = v71;
  v49[4] = v69;
  v49[5] = v70;
  *(_QWORD *)&v88 = v49 + 8;
  std::vector<PKInputPoint>::__swap_out_circular_buffer((void **)&self->_inputPoints.__end_, (uint64_t)&v87, (char *)end);
  if ((_QWORD)v88 != *((_QWORD *)&v87 + 1))
    *(_QWORD *)&v88 = v88 + ((*((_QWORD *)&v87 + 1) - v88 + 127) & 0xFFFFFFFFFFFFFF80);
  if ((_QWORD)v87)
    operator delete((void *)v87);
LABEL_42:
  v72 = self->_inputPoints.__end_cap_.__value_;
  if ((unint64_t)(v72 - self->_inputPoints.__end_) >= 0x501)
  {
    self->_inputPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v72 - 128);
    -[PKHoverController _triggerHoldGestureIfNecessary](self, "_triggerHoldGestureIfNecessary");
  }
  v73 = *(_OWORD *)&a3->var9;
  v84[4] = *(_OWORD *)&a3->var7;
  v84[5] = v73;
  v74 = *(_OWORD *)&a3->var13;
  v84[6] = *(_OWORD *)&a3->var11;
  v84[7] = v74;
  v75 = *(_OWORD *)&a3->var1;
  v84[0] = a3->var0;
  v84[1] = v75;
  v76 = *(_OWORD *)&a3->var5;
  v84[2] = *(_OWORD *)&a3->var3;
  v84[3] = v76;
  -[PKHoverController updateCurrentInputPointWithInputPoint:](self, "updateCurrentInputPointWithInputPoint:", v84);
  if (LOBYTE(self->_waitingForHoverHoldTimestamp))
  {
    if (v32)
    {
      if (v31 && (*(_WORD *)&self->_delegateFlags & 8) != 0)
      {
        v77 = objc_loadWeakRetained((id *)&self->_currentLabel);
        objc_msgSend(v77, "hoverControllerDidLift:", self);
LABEL_55:

      }
    }
    else
    {
      -[PKHoverController currentInputPoint](self, "currentInputPoint");
      -[PKHoverController _sendDidUpdate:](self, "_sendDidUpdate:", &v82);
    }
  }
  else if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_inputPoints.__end_cap_.__value_ - self->_inputPoints.__end_) >= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x181)
  {
    if (BYTE5(self->_delegate) && isPencilGesture((UIHoverGestureRecognizer *)self->_eventGeneratorTimer))
      -[PKHoverController startDisplayLink](self, "startDisplayLink");
    LOBYTE(self->_waitingForHoverHoldTimestamp) = 1;
    self->_cachedLatestInputPoint.var0.point.x = 0.0;
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      v77 = objc_loadWeakRetained((id *)&self->_currentLabel);
      v78 = *(_OWORD *)&a3->var9;
      v83[4] = *(_OWORD *)&a3->var7;
      v83[5] = v78;
      v79 = *(_OWORD *)&a3->var13;
      v83[6] = *(_OWORD *)&a3->var11;
      v83[7] = v79;
      v80 = *(_OWORD *)&a3->var1;
      v83[0] = a3->var0;
      v83[1] = v80;
      v81 = *(_OWORD *)&a3->var5;
      v83[2] = *(_OWORD *)&a3->var3;
      v83[3] = v81;
      objc_msgSend(v77, "hoverController:didBegin:", self, v83);
      goto LABEL_55;
    }
  }
}

- (double)adjustedZLimitFromLimit:(double)a3 inputPoint:
{
  void *v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id WeakRetained;
  double v15;
  double v16;
  _OWORD v18[8];

  if (!a1)
    return 0.0;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenEdgeSizeInMillimeters");
  v8 = v7;
  if (-[PKHoverController pointsPerMillimeter]::onceToken != -1)
    dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_74_0);
  v9 = v8 * *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter * 0.5;

  if (v9 != 0.0)
  {
    v10 = a2[5];
    v18[4] = a2[4];
    v18[5] = v10;
    v11 = a2[7];
    v18[6] = a2[6];
    v18[7] = v11;
    v12 = a2[1];
    v18[0] = *a2;
    v18[1] = v12;
    v13 = a2[3];
    v18[2] = a2[2];
    v18[3] = v13;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v15 = -[PKHoverController distanceFromEdgeOfScreen:view:](a1, (double *)v18, WeakRetained);

    v16 = v15 / v9;
    if (v15 / v9 > 1.0)
      v16 = 1.0;
    return v16 * a3;
  }
  return a3;
}

- (void)_sendDidUpdate:(id *)a3
{
  uint64_t v4;

  -[PKHoverController currentInputPoint](self, "currentInputPoint", a3);
  -[PKHoverController _sendDidUpdateNow:](self, "_sendDidUpdateNow:", &v4);
}

- (void)_sendDidUpdateNow:(id *)a3
{
  id WeakRetained;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  if ((*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    v6 = *(_OWORD *)&a3->var9;
    v10[4] = *(_OWORD *)&a3->var7;
    v10[5] = v6;
    v7 = *(_OWORD *)&a3->var13;
    v10[6] = *(_OWORD *)&a3->var11;
    v10[7] = v7;
    v8 = *(_OWORD *)&a3->var1;
    v10[0] = a3->var0;
    v10[1] = v8;
    v9 = *(_OWORD *)&a3->var5;
    v10[2] = *(_OWORD *)&a3->var3;
    v10[3] = v9;
    objc_msgSend(WeakRetained, "hoverController:didUpdate:", self, v10);

  }
  self->_cachedLatestInputPoint.var0.point.x = a3->var7;
}

- (void)showLabel:(double)a3 atLocation:(double)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a2;
  if (a1)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pk_hoverAttributedStringFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[PKHoverController showAttributedLabel:atLocation:]((uint64_t)a1, v8, a3, a4);
    else
      objc_msgSend(a1, "hideLabel");

    v7 = v9;
  }

}

- (void)showAttributedLabel:(double)a3 atLocation:(double)a4
{
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "hideLabel");
    objc_msgSend(MEMORY[0x1E0DC3F10], "pk_hoverLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(WeakRetained, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKFloatingLabelView floatingLabelViewWithAttributedString:font:location:traitCollection:](a3, a4, (uint64_t)PKFloatingLabelView, v14, v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 248);
    *(_QWORD *)(a1 + 248) = v11;

    v13 = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(v13, "addSubview:", *(_QWORD *)(a1 + 248));

    objc_storeStrong((id *)(a1 + 440), a2);
  }

}

- (void)hideLabel
{
  double maximumTimeIntervalBetweenEvents;
  void *currentInputPointCounter;

  maximumTimeIntervalBetweenEvents = self->_maximumTimeIntervalBetweenEvents;
  self->_maximumTimeIntervalBetweenEvents = 0.0;

  objc_msgSend((id)self->_currentInputPointCounter, "removeFromSuperview");
  currentInputPointCounter = (void *)self->_currentInputPointCounter;
  self->_currentInputPointCounter = 0;

}

- (double)distanceFromEdgeOfScreen:(void *)a3 view:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinX;
  double MaxX;
  double MinY;
  CGFloat MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *a2;
    v8 = a2[1];
    objc_msgSend(v5, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertPoint:toView:", v9, v7, v8);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v6, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v34.origin.x = v16;
    v34.origin.y = v18;
    v34.size.width = v20;
    v34.size.height = v22;
    MinX = CGRectGetMinX(v34);
    v35.origin.x = v16;
    v35.origin.y = v18;
    v35.size.width = v20;
    v35.size.height = v22;
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = v16;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    MinY = CGRectGetMinY(v36);
    v37.origin.x = v16;
    v37.origin.y = v18;
    v37.size.width = v20;
    v37.size.height = v22;
    MaxY = CGRectGetMaxY(v37);
    v27 = fmax(v11 - MinX, 0.0);
    v28 = fmax(MaxX - v11, 0.0);
    v29 = fmax(v33 - MinY, 0.0);
    v30 = fmax(MaxY - v33, 0.0);
    if (v27 >= v28)
      v27 = v28;
    if (v27 >= v29)
      v27 = v29;
    if (v27 >= v30)
      v31 = v30;
    else
      v31 = v27;
  }
  else
  {
    v31 = 0.0;
  }

  return v31;
}

void __40__PKHoverController_pointsPerMillimeter__block_invoke()
{
  void *v0;
  float v1;
  float v2;
  void *v3;
  double v4;
  id v5;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v5 = v0;
    objc_msgSend(v0, "floatValue");
    v2 = v1;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nativeScale");
    *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter = v2 / 25.4 / v4;

    v0 = v5;
  }

}

- (double)currentMovementSpeed
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v3;
  double result;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double *v8;
  double v9;
  double v10;

  end = self->_inputPoints.__end_;
  v3 = self->_inputPoints.__end_cap_.__value_ - end;
  result = 0.0;
  if ((unint64_t)v3 >= 0x500)
  {
    v5 = (v3 >> 7) - 1;
    if (v3 >= 129)
    {
      if (v5 <= 1)
        v6 = 1;
      else
        v6 = (v3 >> 7) - 1;
      v7 = *((double *)end + 8);
      v8 = (double *)((char *)end + 128);
      do
      {
        v9 = v7;
        v7 = v8[8];
        v10 = v9 - v7;
        if (v10 > 0.0)
          result = result
                 + sqrt((*(v8 - 15) - v8[1]) * (*(v8 - 15) - v8[1]) + (*(v8 - 16) - *v8) * (*(v8 - 16) - *v8)) / v10;
        v8 += 16;
        --v6;
      }
      while (v6);
    }
    return result / (double)v5;
  }
  return result;
}

- (BOOL)isInEdgeOfScreen:(_BOOL8)result
{
  uint64_t v3;
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id WeakRetained;
  double v10;
  _OWORD v11[8];

  if (result)
  {
    v3 = result;
    if (-[PKHoverController pointsPerMillimeter]::onceToken != -1)
      dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_74_0);
    v4 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
    v5 = a2[5];
    v11[4] = a2[4];
    v11[5] = v5;
    v6 = a2[7];
    v11[6] = a2[6];
    v11[7] = v6;
    v7 = a2[1];
    v11[0] = *a2;
    v11[1] = v7;
    v8 = a2[3];
    v11[2] = a2[2];
    v11[3] = v8;
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    v10 = -[PKHoverController distanceFromEdgeOfScreen:view:](v3, (double *)v11, WeakRetained);

    return v10 < v4 * 5.0;
  }
  return result;
}

- (BOOL)isInExteriorOfScreen:(_BOOL8)result
{
  uint64_t v3;
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id WeakRetained;
  double v10;
  _OWORD v11[8];

  if (result)
  {
    v3 = result;
    if (-[PKHoverController pointsPerMillimeter]::onceToken != -1)
      dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_74_0);
    v4 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
    v5 = a2[5];
    v11[4] = a2[4];
    v11[5] = v5;
    v6 = a2[7];
    v11[6] = a2[6];
    v11[7] = v6;
    v7 = a2[1];
    v11[0] = *a2;
    v11[1] = v7;
    v8 = a2[3];
    v11[2] = a2[2];
    v11[3] = v8;
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    v10 = -[PKHoverController distanceFromEdgeOfScreen:view:](v3, (double *)v11, WeakRetained);

    return v10 < v4 * 20.0;
  }
  return result;
}

- (void)alphaFactorFromMovementSpeed:(uint64_t)a1
{
  void *v1;

  if (a1)
  {
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "toolShadowMovementSpeedHideThreshold");

  }
}

- (void)logInputPoint:(id *)a3
{
  id WeakRetained;
  double x;
  double y;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double var6;
  double var7;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
  x = a3->var0.var0.x;
  y = a3->var0.var0.y;
  v7 = WeakRetained;
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  v13 = os_log_create("com.apple.pencilkit", "Pencil Hover");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a3->var3 * 57.2957795;
    v15 = a3->var2 * 57.2957795;
    v16 = a3->var12 * 57.2957795;
    var6 = a3->var6;
    var7 = a3->var7;
    v19 = 134219520;
    v20 = v10;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = var6;
    v25 = 2048;
    v26 = v14;
    v27 = 2048;
    v28 = v15;
    v29 = 2048;
    v30 = v16;
    v31 = 2048;
    v32 = var7;
    _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Hover location in window: %.1f, %.1f, elevation: %.1f, altitude: %.1f, azimuth: %.1f, roll: %.1f, timestamp: %.4f", (uint8_t *)&v19, 0x48u);
  }

}

- (double)inputPointFilter:(id)a3 distanceToEdge:(id *)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id WeakRetained;
  double v10;
  _OWORD v12[8];

  v5 = *(_OWORD *)&a4->var9;
  v12[4] = *(_OWORD *)&a4->var7;
  v12[5] = v5;
  v6 = *(_OWORD *)&a4->var13;
  v12[6] = *(_OWORD *)&a4->var11;
  v12[7] = v6;
  v7 = *(_OWORD *)&a4->var1;
  v12[0] = a4->var0;
  v12[1] = v7;
  v8 = *(_OWORD *)&a4->var5;
  v12[2] = *(_OWORD *)&a4->var3;
  v12[3] = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
  v10 = -[PKHoverController distanceFromEdgeOfScreen:view:]((uint64_t)self, (double *)v12, WeakRetained);

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "type") == 2)
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)self, v5);

  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;

  objc_storeStrong((id *)&self->_maximumTimeIntervalBetweenEvents, 0);
  objc_destroyWeak((id *)&self->_currentLabel);
  objc_storeStrong((id *)&self->_useUpdateCycle, 0);
  objc_storeStrong((id *)&self->_intentionalHoverStartTimestamp, 0);
  objc_storeStrong((id *)&self->_allInputPointFilters, 0);
  objc_storeStrong((id *)&self->_predictionFilter, 0);
  objc_storeStrong((id *)&self->_reduceFramerateFilter, 0);
  objc_storeStrong((id *)&self->_extraLatencyFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthEdgeFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthZLimitFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthBucketingFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthNoiseFilter, 0);
  objc_storeStrong((id *)&self->_previousRollValue, 0);
  objc_storeStrong((id *)&self->_eventGeneratorTimer, 0);
  objc_storeStrong((id *)&self->_currentInputPointCounter, 0);
  end = self->_inputPoints.__end_;
  if (end)
  {
    self->_inputPoints.__end_cap_.__value_ = end;
    operator delete(end);
  }
  objc_destroyWeak((id *)&self->_inputPoints.__begin_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
