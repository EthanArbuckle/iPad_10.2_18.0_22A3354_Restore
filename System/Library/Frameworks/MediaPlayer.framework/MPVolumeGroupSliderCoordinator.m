@implementation MPVolumeGroupSliderCoordinator

- (MPVolumeGroupSliderCoordinator)initWithMasterVolumeSlider:(id)a3 individualVolumeSliders:(id)a4
{
  id v7;
  id v8;
  MPVolumeGroupSliderCoordinator *v9;
  MPVolumeGroupSliderCoordinator *v10;
  uint64_t v11;
  NSMutableSet *individualVolumeSliders;
  uint64_t v13;
  NSMapTable *optimisticValues;
  uint64_t v15;
  NSMapTable *optimisticScales;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MPVolumeGroupSliderCoordinator;
  v9 = -[MPVolumeGroupSliderCoordinator init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_masterVolumeSlider, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v8);
    individualVolumeSliders = v10->_individualVolumeSliders;
    v10->_individualVolumeSliders = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    optimisticValues = v10->_optimisticValues;
    v10->_optimisticValues = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    optimisticScales = v10->_optimisticScales;
    v10->_optimisticScales = (NSMapTable *)v15;

    v10->_inFlightDisableOptimisticStateRequests = 0;
    v10->_shouldOverrideTracking = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[MPVolumeGroupSliderCoordinator addIndividualVolumeSlider:](v10, "addIndividualVolumeSlider:", v22, (_QWORD)v24);
          -[MPVolumeGroupSliderCoordinator _addControlEventsForVolumeSlider:](v10, "_addControlEventsForVolumeSlider:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }

    -[MPVolumeGroupSliderCoordinator _addControlEventsForVolumeSlider:](v10, "_addControlEventsForVolumeSlider:", v10->_masterVolumeSlider);
    -[MPVolumeGroupSliderCoordinator _updateOptimisticValueCache](v10, "_updateOptimisticValueCache");
  }

  return v10;
}

- (NSArray)individualVolumeSliders
{
  return (NSArray *)-[NSMutableSet allObjects](self->_individualVolumeSliders, "allObjects");
}

- (void)addIndividualVolumeSlider:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *allSliders;
  id v8;

  v8 = a3;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("WHAOptimisticStateVolumeDisabled"), CFSTR("com.apple.Music"), 0))
  {
    -[MPVolumeGroupSliderCoordinator _findExistingVolumeSlider:](self, "_findExistingVolumeSlider:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPVolumeGroupSliderCoordinator removeIndividualVolumeSlider:](self, "removeIndividualVolumeSlider:", v4);

    -[NSMapTable removeObjectForKey:](self->_optimisticValues, "removeObjectForKey:", v8);
    -[NSMapTable removeObjectForKey:](self->_optimisticScales, "removeObjectForKey:", v8);
    -[NSMutableSet addObject:](self->_individualVolumeSliders, "addObject:", v8);
    objc_msgSend(v8, "value");
    objc_msgSend(v8, "setOptimisticValue:");
    -[NSMutableSet setByAddingObject:](self->_individualVolumeSliders, "setByAddingObject:", self->_masterVolumeSlider);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allSliders = self->_allSliders;
    self->_allSliders = v6;

    -[MPVolumeGroupSliderCoordinator _addControlEventsForVolumeSlider:](self, "_addControlEventsForVolumeSlider:", v8);
    -[MPVolumeGroupSliderCoordinator _updateOptimisticValueCache](self, "_updateOptimisticValueCache");
    -[MPVolumeGroupSliderCoordinator _resetMasterVolumeSlider](self, "_resetMasterVolumeSlider");
  }

}

- (void)removeIndividualVolumeSlider:(id)a3
{
  int AppBooleanValue;
  void *v5;
  NSArray *v6;
  NSArray *allSliders;
  id v8;

  v8 = a3;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WHAOptimisticStateVolumeDisabled"), CFSTR("com.apple.Music"), 0);
  if (v8 && !AppBooleanValue)
  {
    -[NSMapTable removeObjectForKey:](self->_optimisticValues, "removeObjectForKey:", v8);
    -[NSMapTable removeObjectForKey:](self->_optimisticScales, "removeObjectForKey:", v8);
    -[NSMutableSet removeObject:](self->_individualVolumeSliders, "removeObject:", v8);
    -[NSMutableSet setByAddingObject:](self->_individualVolumeSliders, "setByAddingObject:", self->_masterVolumeSlider);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allSliders = self->_allSliders;
    self->_allSliders = v6;

    -[MPVolumeGroupSliderCoordinator _removeControlEventsForVolumeSlider:](self, "_removeControlEventsForVolumeSlider:", v8);
    -[MPVolumeGroupSliderCoordinator _updateOptimisticValueCache](self, "_updateOptimisticValueCache");
    -[MPVolumeGroupSliderCoordinator _resetMasterVolumeSlider](self, "_resetMasterVolumeSlider");
  }

}

- (void)removeAllIndividualVolumeSliders
{
  -[NSMutableSet removeAllObjects](self->_individualVolumeSliders, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_optimisticScales, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_optimisticValues, "removeAllObjects");
}

- (void)volumeSliderValueChanged:(id)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  float v12;
  MPVolumeSlider *trackingSlider;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int v17;
  MPVolumeSlider *v18;
  MPVolumeSlider *masterVolumeSlider;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  NSMutableSet *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  float v36;
  float v37;
  float v38;
  double v39;
  void *v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  int v48;
  int v49;
  double v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isTracking") & 1) == 0 && !self->_shouldOverrideTracking)
    goto LABEL_48;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[NSMapTable objectEnumerator](self->_optimisticScales, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v65 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "floatValue");
        if (fabs(v12 + -0.999999881) >= 0.0999998808)
        {
          self->_synced = 0;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  trackingSlider = self->_trackingSlider;
  if (!trackingSlider)
  {
    if (self->_shouldOverrideTracking)
    {
      trackingSlider = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_trackingSlider, a3);
      v14 = os_log_create("com.apple.amp.mediaplayer", "Volume");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[NSMutableSet count](self->_individualVolumeSliders, "count");
        *(_DWORD *)buf = 134217984;
        v72 = v15;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Begin optimistic state with %lu individual sliders", buf, 0xCu);
      }

      -[MPVolumeGroupSliderCoordinator _updateOptimisticValueCache](self, "_updateOptimisticValueCache");
      trackingSlider = self->_trackingSlider;
    }
  }
  v16 = -[NSMutableSet containsObject:](self->_individualVolumeSliders, "containsObject:", trackingSlider);
  v17 = v16;
  v18 = self->_trackingSlider;
  masterVolumeSlider = self->_masterVolumeSlider;
  if (v18 != masterVolumeSlider && (v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPVolumeGroupSliderCoordinator.m"), 134, CFSTR("We don't have a master or individual slider."));

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v20 = self->_allSliders;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v61 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "setOptimisticState:", *(MPVolumeSlider **)(*((_QWORD *)&v60 + 1) + 8 * j) != self->_trackingSlider);
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v22);
  }

  if (v18 == masterVolumeSlider)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "value");
    objc_msgSend(v29, "numberWithFloat:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_optimisticValues, "setObject:forKey:", v26, v6);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v28 = self->_individualVolumeSliders;
    v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v57 != v32)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
          -[NSMapTable objectForKey:](self->_optimisticScales, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          v37 = v36;

          objc_msgSend(v6, "value");
          *(float *)&v39 = v37 * v38;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_optimisticValues, "setObject:forKey:", v40, v34);

        }
        v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v31);
    }
    goto LABEL_39;
  }
  if (v17)
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "value");
    objc_msgSend(v25, "numberWithFloat:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_optimisticValues, "setObject:forKey:", v26, v6);
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[MPVolumeGroupSliderCoordinator _maxOptimisticValue](self, "_maxOptimisticValue");
    objc_msgSend(v27, "numberWithFloat:");
    v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_optimisticValues, "setObject:forKey:", v28, self->_masterVolumeSlider);
    -[MPVolumeGroupSliderCoordinator _resetOptimisticScales](self, "_resetOptimisticScales");
LABEL_39:

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v41 = self->_allSliders;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v53;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v53 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * m);
        -[NSMapTable objectForKey:](self->_optimisticValues, "objectForKey:", v46, (_QWORD)v52);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "floatValue");
        v49 = v48;

        LODWORD(v50) = v49;
        objc_msgSend(v46, "setOptimisticValue:", v50);
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v43);
  }

LABEL_48:
}

- (void)volumeSliderDidEndTracking:(id)a3
{
  MPVolumeSlider *v4;
  MPVolumeSlider *v5;
  MPVolumeSlider *trackingSlider;
  float v7;
  MPVolumeSlider *v8;
  MPCubicSpringTimingParameters *v9;
  void *v10;
  MPCubicSpringAnimator *v11;
  NSMapTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  MPVolumeSlider *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  dispatch_time_t v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  MPVolumeSlider *v34;
  NSObject *v35;
  float v36;
  double v37;
  float v38;
  double v39;
  void *v40;
  MPVolumeSlider *v41;
  NSObject *v42;
  MPVolumeSlider *v43;
  MPVolumeSlider *v44;
  MPCubicSpringTimingParameters *v45;
  _QWORD block[5];
  _QWORD v47[5];
  _QWORD v48[6];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = (MPVolumeSlider *)a3;
  v5 = v4;
  trackingSlider = self->_trackingSlider;
  if (trackingSlider == v4)
  {
    if (self->_masterVolumeSlider == v4 && (-[MPVolumeSlider value](v4, "value"), v7 <= 0.00000011921))
    {
      v44 = v5;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v29 = self->_allSliders;
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v54 != v32)
              objc_enumerationMutation(v29);
            v34 = *(MPVolumeSlider **)(*((_QWORD *)&v53 + 1) + 8 * i);
            -[MPVolumeSlider setOptimisticState:](v34, "setOptimisticState:", 0);
            if (v34 != self->_masterVolumeSlider)
            {
              v35 = os_log_create("com.apple.amp.mediaplayer", "Volume");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                -[MPVolumeSlider value](v34, "value");
                v37 = v36;
                -[MPVolumeSlider optimisticValue](v34, "optimisticValue");
                v39 = v38;
                -[MPVolumeSlider volumeControlLabel](v34, "volumeControlLabel");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v59 = v37;
                v60 = 2048;
                v61 = v39;
                v62 = 2114;
                v63 = v40;
                _os_log_impl(&dword_193B9B000, v35, OS_LOG_TYPE_DEFAULT, "MPVolumeGroupSliderCoordinator changing %f to %f for %{public}@", buf, 0x20u);

              }
              -[MPVolumeSlider optimisticValue](v34, "optimisticValue");
              -[MPVolumeSlider setValue:](v34, "setValue:");
            }
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        }
        while (v31);
      }

      v41 = self->_trackingSlider;
      self->_trackingSlider = 0;

      v42 = os_log_create("com.apple.amp.mediaplayer", "Volume");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v42, OS_LOG_TYPE_DEFAULT, "End optimistic state.", buf, 2u);
      }

      v5 = v44;
    }
    else
    {
      self->_shouldOverrideTracking = 1;
      -[MPVolumeGroupSliderCoordinator volumeSliderValueChanged:](self, "volumeSliderValueChanged:", v5);
      self->_shouldOverrideTracking = 0;
      v8 = self->_trackingSlider;
      self->_trackingSlider = 0;

      v9 = -[MPCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([MPCubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 28.0, 0.0, 0.0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
      -[MPCubicSpringTimingParameters setSpringCubicTimingParameters:](v9, "setSpringCubicTimingParameters:", v10);

      v11 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([MPCubicSpringAnimator alloc], "initWithDuration:timingParameters:", v9, 0.3);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v12 = self->_optimisticScales;
      v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      v14 = MEMORY[0x1E0C809B0];
      if (v13)
      {
        v15 = v13;
        v43 = v5;
        v45 = v9;
        v16 = 0;
        v17 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v50 != v17)
              objc_enumerationMutation(v12);
            v19 = *(MPVolumeSlider **)(*((_QWORD *)&v49 + 1) + 8 * j);
            -[NSMapTable objectForKey:](self->_optimisticScales, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "floatValue");
            v22 = v21;

            -[NSMapTable objectForKey:](self->_optimisticScales, "objectForKey:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "floatValue");
            v25 = v24;

            if (v19 != self->_masterVolumeSlider)
            {
              v26 = v22 + -1.0;
              if ((float)(v22 + -1.0) < 0.0)
                v26 = -(float)(v22 + -1.0);
              if (v26 <= 0.0999998808 && v25 != 1.0)
              {
                -[MPVolumeSlider setOptimisticState:](v19, "setOptimisticState:", 0);
                v48[0] = v14;
                v48[1] = 3221225472;
                v48[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke;
                v48[3] = &unk_1E31635F8;
                v48[4] = v19;
                v48[5] = self;
                -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", v48);
                v47[0] = v14;
                v47[1] = 3221225472;
                v47[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_2;
                v47[3] = &unk_1E3159898;
                v47[4] = v19;
                -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", v47);
                v16 = 1;
                self->_synced = 1;
              }
            }
          }
          v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v15);

        v5 = v43;
        v9 = v45;
        if ((v16 & 1) != 0)
          -[UIViewPropertyAnimator startAnimation](v11, "startAnimation");
      }
      else
      {

      }
      ++self->_inFlightDisableOptimisticStateRequests;
      v28 = dispatch_time(0, 2000000000);
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_3;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_after(v28, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    self->_trackingSlider = 0;

  }
}

- (float)_maxOptimisticValue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  void *v9;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_optimisticValues, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        if (*(MPVolumeSlider **)(*((_QWORD *)&v13 + 1) + 8 * i) != self->_masterVolumeSlider)
        {
          -[NSMapTable objectForKey:](self->_optimisticValues, "objectForKey:");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "floatValue");
          v11 = v10;

          if (v11 > v7)
            v7 = v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)_resetOptimisticScales
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  MPVolumeSlider *v11;
  void *v12;
  float v13;
  double v14;
  MPVolumeSlider *masterVolumeSlider;
  float v16;
  float v17;
  float v18;
  void *v19;
  NSMutableSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MPVolumeGroupSliderCoordinator _maxOptimisticValue](self, "_maxOptimisticValue");
  objc_msgSend(v3, "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = self->_individualVolumeSliders;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v4);
        v11 = *(MPVolumeSlider **)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_optimisticValues, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = v13;
        if (v14 >= 0.0000101192093)
        {
          objc_msgSend(v12, "floatValue");
          v18 = v17;
          objc_msgSend(v25, "floatValue");
          v16 = v18 / *(float *)&v14;
        }
        else
        {
          masterVolumeSlider = self->_masterVolumeSlider;
          if (v11 == masterVolumeSlider)
            v16 = 1.0;
          else
            v16 = 0.0;
          if (v11 != masterVolumeSlider)
            ++v8;
        }
        *(float *)&v14 = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_optimisticScales, "setObject:forKey:", v19, v11);
        if (v16 <= 0.00000011921)
          ++v7;

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  -[NSMapTable setObject:forKey:](self->_optimisticScales, "setObject:forKey:", &unk_1E31E65F0, self->_masterVolumeSlider);
  if (v7 == -[NSMutableSet count](self->_individualVolumeSliders, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = self->_individualVolumeSliders;
    v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          -[NSMapTable setObject:forKey:](self->_optimisticScales, "setObject:forKey:", &unk_1E31E65F0, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        }
        v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v22);
    }

  }
  else if (v8 == -[NSMutableSet count](self->_individualVolumeSliders, "count")
         && self->_trackingSlider != self->_masterVolumeSlider)
  {
    -[NSMapTable setObject:forKey:](self->_optimisticScales, "setObject:forKey:", &unk_1E31E65F0);
  }

}

- (void)_updateOptimisticValueCache
{
  MPVolumeSlider *trackingSlider;
  float v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  trackingSlider = self->_trackingSlider;
  if (trackingSlider == self->_masterVolumeSlider
    && (-[MPVolumeSlider optimisticValue](trackingSlider, "optimisticValue"), v4 <= 0.00000011921))
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "Do not update optimistic value cache since master volume was set to 0.", buf, 2u);
    }

  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_allSliders;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "value", (_QWORD)v14);
          objc_msgSend(v11, "numberWithFloat:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_optimisticValues, "setObject:forKey:", v12, v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

    -[MPVolumeGroupSliderCoordinator _resetOptimisticScales](self, "_resetOptimisticScales");
  }
}

- (void)_resetMasterVolumeSlider
{
  void *v3;

  -[MPVolumeSlider setOptimisticState:](self->_masterVolumeSlider, "setOptimisticState:", 1);
  -[MPVolumeSlider volumeController](self->_masterVolumeSlider, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeValue");
  -[MPVolumeSlider setOptimisticValue:](self->_masterVolumeSlider, "setOptimisticValue:");

  -[MPVolumeSlider setOptimisticState:](self->_masterVolumeSlider, "setOptimisticState:", 0);
}

- (void)syncSliders:(BOOL)a3
{
  MPCubicSpringTimingParameters *v4;
  void *v5;
  MPCubicSpringAnimator *v6;
  MPVolumeGroupSliderCoordinator *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableSet *obj;
  _QWORD v15[5];
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_synced)
  {
    v4 = -[MPCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([MPCubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 36.0, 0.0, 0.0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    -[MPCubicSpringTimingParameters setSpringCubicTimingParameters:](v4, "setSpringCubicTimingParameters:", v5);

    v6 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([MPCubicSpringAnimator alloc], "initWithDuration:timingParameters:", v4, 1.0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self;
    obj = self->_individualVolumeSliders;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "setOptimisticState:", 0);
          v16[0] = v11;
          v16[1] = 3221225472;
          v16[2] = __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke;
          v16[3] = &unk_1E31635F8;
          v16[4] = v13;
          v16[5] = v7;
          -[UIViewPropertyAnimator addAnimations:](v6, "addAnimations:", v16);
          v15[0] = v11;
          v15[1] = 3221225472;
          v15[2] = __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke_2;
          v15[3] = &unk_1E3159898;
          v15[4] = v13;
          -[UIViewPropertyAnimator addCompletion:](v6, "addCompletion:", v15);
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    -[UIViewPropertyAnimator startAnimation](v6, "startAnimation");
    v7->_synced = 1;
    -[MPVolumeGroupSliderCoordinator _updateOptimisticValueCache](v7, "_updateOptimisticValueCache");

  }
}

- (id)_findExistingVolumeSlider:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v24;
  uint64_t v25;
  id v26;
  NSMutableSet *obj;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_individualVolumeSliders;
  v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v6 = *(_QWORD *)v36;
    v25 = *(_QWORD *)v36;
    v26 = v5;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(obj);
      v8 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v7);
      if (v8 != v5)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v7), "volumeController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "volumeController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v10;
        objc_msgSend(v10, "outputDeviceRoute");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v12;
        objc_msgSend(v12, "outputDeviceRoute");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "routeUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v14, "outputDevices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v17)
        {
          v18 = v17;
          v24 = v3;
          v19 = *(_QWORD *)v32;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v32 != v19)
                objc_enumerationMutation(v16);
              v21 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
              if (objc_msgSend(v21, "isEqualToString:", v15))
              {
                v3 = v8;

                v22 = 0;
                v5 = v26;
                goto LABEL_17;
              }

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v18)
              continue;
            break;
          }
          v22 = 1;
          v5 = v26;
          v3 = v24;
LABEL_17:
          v6 = v25;
        }
        else
        {
          v22 = 1;
        }

        if (!v22)
          break;
      }
      if (++v7 == v28)
      {
        v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v28)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    v3 = 0;
  }

  return v3;
}

- (void)_addControlEventsForVolumeSlider:(id)a3
{
  -[MPVolumeGroupSliderCoordinator _setControlEventsForVolumeSlider:add:](self, "_setControlEventsForVolumeSlider:add:", a3, 1);
}

- (void)_addControlEventsForVolumeSliders:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MPVolumeGroupSliderCoordinator _setControlEventsForVolumeSlider:add:](self, "_setControlEventsForVolumeSlider:add:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_removeControlEventsForVolumeSlider:(id)a3
{
  -[MPVolumeGroupSliderCoordinator _setControlEventsForVolumeSlider:add:](self, "_setControlEventsForVolumeSlider:add:", a3, 0);
}

- (void)_removeControlEventsForVolumeSliders:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MPVolumeGroupSliderCoordinator _setControlEventsForVolumeSlider:add:](self, "_setControlEventsForVolumeSlider:add:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setControlEventsForVolumeSlider:(id)a3 add:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_volumeSliderValueChanged_, 4096);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_volumeSliderDidEndTracking_, 448);
  }
  else
  {
    objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, sel_volumeSliderValueChanged_, 4096);
    objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, sel_volumeSliderDidEndTracking_, 448);
  }

}

- (MPVolumeSlider)masterVolumeSlider
{
  return self->_masterVolumeSlider;
}

- (BOOL)synced
{
  return self->_synced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterVolumeSlider, 0);
  objc_storeStrong((id *)&self->_optimisticScales, 0);
  objc_storeStrong((id *)&self->_optimisticValues, 0);
  objc_storeStrong((id *)&self->_trackingSlider, 0);
  objc_storeStrong((id *)&self->_individualVolumeSliders, 0);
  objc_storeStrong((id *)&self->_allSliders, 0);
}

uint64_t __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "optimisticValue");
  return objc_msgSend(v1, "setValue:animated:", 1);
}

uint64_t __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "value");
  return objc_msgSend(*(id *)(a1 + 32), "setOptimisticValue:");
}

uint64_t __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "value");
  return objc_msgSend(v1, "setValue:animated:", 1);
}

uint64_t __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "value");
  return objc_msgSend(*(id *)(a1 + 32), "setOptimisticValue:");
}

void __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  float v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 48) && !*(_QWORD *)(v1 + 24))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Committing optimistic values", buf, 2u);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v21;
      *(_QWORD *)&v6 = 134218498;
      v19 = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "setOptimisticState:", 0, v19, (_QWORD)v20);
          v11 = *(_QWORD **)(a1 + 32);
          if (v10 != (void *)v11[7])
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Volume");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "value");
              v14 = v13;
              objc_msgSend(v10, "optimisticValue");
              v16 = v15;
              objc_msgSend(v10, "volumeControlLabel");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v25 = v14;
              v26 = 2048;
              v27 = v16;
              v28 = 2114;
              v29 = v17;
              _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "MPVolumeGroupSliderCoordinator changing %f to %f for %{public}@", buf, 0x20u);

            }
            objc_msgSend(v10, "optimisticValue");
            objc_msgSend(v10, "setValue:");
            v11 = *(_QWORD **)(a1 + 32);
          }
          objc_msgSend(v11, "_resetMasterVolumeSlider");
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v7);
    }

    v18 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEFAULT, "End optimistic state.", buf, 2u);
    }

  }
}

@end
