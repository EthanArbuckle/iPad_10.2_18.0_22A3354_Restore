@implementation VNRectangleTracker

- (VNRectangleTracker)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNRectangleTracker *v7;
  uint64_t v8;
  NSMutableDictionary *cornerTrackersImpl;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  VNObjectTrackerRevision1 *v14;
  uint64_t v15;
  OS_dispatch_queue *rectangleTrackingProcessingQueue;
  VNRectangleTracker *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNRectangleTracker;
  v7 = -[VNTracker initWithOptions:error:](&v25, sel_initWithOptions_error_, v6, a4);
  if (v7)
  {
    +[VNRectangleTracker trackedCorners](VNRectangleTracker, "trackedCorners");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
    cornerTrackersImpl = v7->_cornerTrackersImpl;
    v7->_cornerTrackersImpl = (NSMutableDictionary *)v8;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v19;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v14 = -[VNObjectTrackerRevision1 initWithOptions:error:]([VNObjectTrackerRevision1 alloc], "initWithOptions:error:", v6, a4);
          if (!v14)
          {

            goto LABEL_13;
          }
          -[NSMutableDictionary setObject:forKey:](v7->_cornerTrackersImpl, "setObject:forKey:", v14, v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_ProcessingQueue"));
    v15 = objc_claimAutoreleasedReturnValue();
    rectangleTrackingProcessingQueue = v7->_rectangleTrackingProcessingQueue;
    v7->_rectangleTrackingProcessingQueue = (OS_dispatch_queue *)v15;

    if (v7->_rectangleTrackingProcessingQueue)
    {
      v17 = v7;
    }
    else if (a4)
    {
      +[VNError errorForMissingOptionNamed:](VNError, "errorForMissingOptionNamed:", CFSTR("VNTrackingOption_ProcessingQueue"));
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_13:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_group_t v22;
  void *v23;
  NSMutableDictionary *cornerTrackersImpl;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  NSObject *v33;
  VNRectangleTracker *v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[VNRectangleTracker _parseInputObservations:imageBuffer:error:](self, "_parseInputObservations:imageBuffer:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  if (objc_msgSend(v10, "count") != 1)
  {
    if (a5)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("No objects to track passed to the tracker"));
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_7:
    v30 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__6799;
  v43 = __Block_byref_object_dispose__6800;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = (void *)v40[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("VNRectangleTracking_BottomLeftTracker"));

  v16 = (void *)v40[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("VNRectangleTracking_BottomRightTracker"));

  v18 = (void *)v40[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("VNRectangleTracking_TopLeftTracker"));

  v20 = (void *)v40[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("VNRectangleTracking_TopRightTracker"));

  v22 = dispatch_group_create();
  -[VNTracker originatingRequestSpecifier](self, "originatingRequestSpecifier", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  cornerTrackersImpl = self->_cornerTrackersImpl;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke;
  v32[3] = &unk_1E4544460;
  v25 = v22;
  v33 = v25;
  v34 = self;
  v38 = &v39;
  v26 = v13;
  v35 = v26;
  v27 = v23;
  v36 = v27;
  v37 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cornerTrackersImpl, "enumerateKeysAndObjectsUsingBlock:", v32);
  dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  -[VNRectangleTracker _convertCornerObservationsToRectangleObservation:error:](self, "_convertCornerObservationsToRectangleObservation:error:", v40[5], a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "boundingBox");
    -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");
    -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", 0);
    v45[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  _Block_object_dispose(&v39, 8);
LABEL_10:

  return v30;
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *cornerTrackersImpl;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_group_t v19;
  NSMutableDictionary *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  NSObject *v33;
  VNRectangleTracker *v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  cornerTrackersImpl = self->_cornerTrackersImpl;
  if (cornerTrackersImpl
    && (v8 = -[NSMutableDictionary count](cornerTrackersImpl, "count"),
        +[VNRectangleTracker trackedCorners](VNRectangleTracker, "trackedCorners"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 == v10))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__6799;
    v41 = __Block_byref_object_dispose__6800;
    v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = (void *)v38[5];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("VNRectangleTracking_BottomLeftTracker"));

    v13 = (void *)v38[5];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("VNRectangleTracking_BottomRightTracker"));

    v15 = (void *)v38[5];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("VNRectangleTracking_TopLeftTracker"));

    v17 = (void *)v38[5];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("VNRectangleTracking_TopRightTracker"));

    v19 = dispatch_group_create();
    v20 = self->_cornerTrackersImpl;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __41__VNRectangleTracker_trackInFrame_error___block_invoke;
    v32 = &unk_1E45444B0;
    v21 = v19;
    v33 = v21;
    v34 = self;
    v36 = &v37;
    v22 = v6;
    v35 = v22;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v20, "enumerateKeysAndObjectsUsingBlock:", &v29);
    dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    -[VNRectangleTracker _convertCornerObservationsToRectangleObservation:error:](self, "_convertCornerObservationsToRectangleObservation:error:", v38[5], a4, v29, v30, v31, v32);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
    {
      v43[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNTracker _postProcessTrackingResults:trackerResults:error:](self, "_postProcessTrackingResults:trackerResults:error:", v22, v25, a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -[VNTracker trackedFrameNumber](self, "trackedFrameNumber") + 1);
        v27 = v26;
      }

    }
    else
    {
      v26 = 0;
    }

    _Block_object_dispose(&v37, 8);
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is not initialized"));
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)reset:(id *)a3
{
  NSMutableDictionary *cornerTrackersImpl;
  uint64_t v6;
  BOOL v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (self->super.mTrackerImpl.__ptr_)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__6799;
    v15 = __Block_byref_object_dispose__6800;
    v16 = 0;
    cornerTrackersImpl = self->_cornerTrackersImpl;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__VNRectangleTracker_reset___block_invoke;
    v10[3] = &unk_1E45444D8;
    v10[4] = &v17;
    v10[5] = &v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cornerTrackersImpl, "enumerateKeysAndObjectsUsingBlock:", v10);
    v6 = v18[3];
    v7 = v6 == 0;
    if (v6)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting tracker failed with error: %llu"), v18[3]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v8, v12[5]);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -1);
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is not initialized"));
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)isTracking
{
  NSMutableDictionary *cornerTrackersImpl;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  cornerTrackersImpl = self->_cornerTrackersImpl;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__VNRectangleTracker_isTracking__block_invoke;
  v5[3] = &unk_1E4544500;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cornerTrackersImpl, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "width");
    objc_msgSend(v8, "height");
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "bottomLeft");
    +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("VNRectangleTracking_BottomLeftTracker"));

    objc_msgSend(v9, "bottomRight");
    +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("VNRectangleTracking_BottomRightTracker"));

    objc_msgSend(v9, "topLeft");
    +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("VNRectangleTracking_TopLeftTracker"));

    objc_msgSend(v9, "topRight");
    +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("VNRectangleTracking_TopRightTracker"));

    objc_msgSend(v9, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("VNRectangleObservation object is expected to initialize Rectangle Tracker"));
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_convertCornerObservationsToRectangleObservation:(id)a3 error:(id *)a4
{
  void *v6;
  VNRectangleObservation *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  VNRectangleObservation *v13;
  double v14;
  void *v15;
  _QWORD v17[13];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  __n128 (*v29)(__n128 *, __n128 *);
  uint64_t (*v30)();
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  __n128 (*v37)(__n128 *, __n128 *);
  uint64_t (*v38)();
  const char *v39;
  int64x2_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  __n128 (*v44)(__n128 *, __n128 *);
  uint64_t (*v45)();
  const char *v46;
  __int128 v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  __n128 (*v51)(__n128 *, __n128 *);
  uint64_t (*v52)();
  const char *v53;
  __int128 v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  __n128 (*v58)(__n128 *, __n128 *);
  uint64_t (*v59)();
  const char *v60;
  __int128 v61;
  uint64_t v62;
  double *v63;
  uint64_t v64;
  __n128 (*v65)(__n128 *, __n128 *);
  uint64_t (*v66)();
  const char *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;

  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__6799;
  v73 = __Block_byref_object_dispose__6800;
  v74 = 0;
  v62 = 0;
  v63 = (double *)&v62;
  v64 = 0x4012000000;
  v65 = __Block_byref_object_copy__63;
  v66 = __Block_byref_object_dispose__64;
  v67 = "";
  v68 = *MEMORY[0x1E0C9D538];
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x4012000000;
  v58 = __Block_byref_object_copy__63;
  v59 = __Block_byref_object_dispose__64;
  v60 = "";
  v61 = *MEMORY[0x1E0C9D538];
  v48 = 0;
  v49 = (double *)&v48;
  v50 = 0x4012000000;
  v51 = __Block_byref_object_copy__63;
  v52 = __Block_byref_object_dispose__64;
  v53 = "";
  v54 = *MEMORY[0x1E0C9D538];
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x4012000000;
  v44 = __Block_byref_object_copy__63;
  v45 = __Block_byref_object_dispose__64;
  v46 = "";
  v47 = *MEMORY[0x1E0C9D538];
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x4012000000;
  v37 = __Block_byref_object_copy__63;
  v38 = __Block_byref_object_dispose__64;
  v39 = "";
  v40 = vdupq_n_s64(0x47EFFFFFE0000000uLL);
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x4012000000;
  v29 = __Block_byref_object_copy__63;
  v30 = __Block_byref_object_dispose__64;
  v32 = 0;
  v33 = 0;
  v31 = "";
  v22 = 0;
  v23 = (float *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__VNRectangleTracker__convertCornerObservationsToRectangleObservation_error___block_invoke;
  v17[3] = &unk_1E4544528;
  v17[4] = &v69;
  v17[5] = &v22;
  v17[6] = &v18;
  v17[7] = &v34;
  v17[8] = &v26;
  v17[9] = &v62;
  v17[10] = &v48;
  v17[11] = &v55;
  v17[12] = &v41;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v17);
  v6 = (void *)v70[5];
  if (v6)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v8 = v35[6];
    v9 = v35[7];
    v10 = v27[6];
    v11 = v27[7];
    -[VNTracker originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [VNRectangleObservation alloc];
    v7 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:boundingBox:](v13, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:boundingBox:", v12, v49[6], v49[7], v42[6], v42[7], v56[6], v56[7], v63[6], v63[7], *(_QWORD *)&v8, *(_QWORD *)&v9, v10 - v8, v11 - v9);
    *(float *)&v14 = v23[6] / (float)(unint64_t)v19[3];
    -[VNObservation setConfidence:](v7, "setConfidence:", v14);
    -[VNTracker key](self, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNObservation setUUID:](v7, "setUUID:", v15);

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v69, 8);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectangleTrackingProcessingQueue, 0);
  objc_storeStrong((id *)&self->_cornerTrackersImpl, 0);
}

void __77__VNRectangleTracker__convertCornerObservationsToRectangleObservation_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v7 = a2;
  v8 = a3;
  v32 = v7;
  v9 = v8;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "confidence");
    if (v16 < 0.65)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "confidence");
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Tracking of %@ failed: confidence = %f; threshold = %f"),
        v32,
        v18,
        0x3FE4CCCCC0000000);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1[4] + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      *a4 = 1;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v15, "confidence");
    *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = v23 + *(float *)(*(_QWORD *)(a1[5] + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_msgSend(v15, "boundingBox");
    v26 = v25 + v24 * 0.5;
    v29 = v28 + v27 * 0.5;
    *(double *)(*(_QWORD *)(a1[7] + 8) + 48) = fmin(*(double *)(*(_QWORD *)(a1[7] + 8) + 48), v26);
    *(double *)(*(_QWORD *)(a1[7] + 8) + 56) = fmin(*(double *)(*(_QWORD *)(a1[7] + 8) + 56), v29);
    *(double *)(*(_QWORD *)(a1[8] + 8) + 48) = fmax(*(double *)(*(_QWORD *)(a1[8] + 8) + 48), v26);
    *(double *)(*(_QWORD *)(a1[8] + 8) + 56) = fmax(*(double *)(*(_QWORD *)(a1[8] + 8) + 56), v29);
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("VNRectangleTracking_BottomLeftTracker")))
    {
      v30 = a1[9];
    }
    else if (objc_msgSend(v32, "isEqualToString:", CFSTR("VNRectangleTracking_TopLeftTracker")))
    {
      v30 = a1[10];
    }
    else if (objc_msgSend(v32, "isEqualToString:", CFSTR("VNRectangleTracking_BottomRightTracker")))
    {
      v30 = a1[11];
    }
    else
    {
      if (!objc_msgSend(v32, "isEqualToString:", CFSTR("VNRectangleTracking_TopRightTracker")))
        goto LABEL_14;
      v30 = a1[12];
    }
    v31 = *(_QWORD *)(v30 + 8);
    *(double *)(v31 + 48) = v26;
    *(double *)(v31 + 56) = v29;
    goto LABEL_14;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[4] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  *a4 = 1;
LABEL_15:

}

void __32__VNRectangleTracker_isTracking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v4, "isTracking");

}

void __28__VNRectangleTracker_reset___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  id obj;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "reset:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;

}

void __41__VNRectangleTracker_trackInFrame_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VNRectangleTracker_trackInFrame_error___block_invoke_2;
  block[3] = &unk_1E4544488;
  v12 = *(_OWORD *)(a1 + 48);
  v14 = v5;
  v15 = v6;
  v9 = (id)v12;
  v16 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_group_async(v7, v8, block);

}

void __41__VNRectangleTracker_trackInFrame_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = objc_retainAutorelease(v2);
  v5 = objc_msgSend(v4, "UTF8String");
  VNValidatedLog(1, (uint64_t)CFSTR("trackInFrame started for %s"), v6, v7, v8, v9, v10, v11, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("wrong type of a corner tracker object created"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    v31[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v26, v4);
LABEL_9:

    goto LABEL_10;
  }
  v12 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  objc_msgSend(v3, "trackInFrame:error:", v12, &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v28;
  v15 = v14;
  if (!v13)
  {
    if (!v14)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("tracking of one or more of the rectangle corners failed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    v30[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v27, v4);

    v13 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v18, v4);

    v19 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    VNValidatedLog(1, (uint64_t)CFSTR("trackInFrame finished for %s"), v20, v21, v22, v23, v24, v25, v19);
  }
LABEL_10:

}

void __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 104);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke_2;
  v11[3] = &unk_1E4544438;
  v12 = v5;
  v13 = v6;
  v17 = *(_QWORD *)(a1 + 72);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v9 = v6;
  v10 = v5;
  dispatch_group_async(v7, v8, v11);

}

void __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGSize v9;
  const __CFDictionary *v10;
  BOOL v11;
  VNDetectedObjectObservation *v12;
  VNDetectedObjectObservation *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CGRect rect;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  VNValidatedLog(1, (uint64_t)CFSTR("setTrackedObjects finished for %s"), v3, v4, v5, v6, v7, v8, v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    rect.size = v9;
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = CGRectMakeWithDictionaryRepresentation(v10, &rect);

    if (v11)
    {
      v12 = [VNDetectedObjectObservation alloc];
      v13 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](v12, "initWithOriginatingRequestSpecifier:boundingBox:", *(_QWORD *)(a1 + 56), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 64);
      v32 = 0;
      objc_msgSend(v14, "setTrackedObjects:inFrame:error:", v13, v15, &v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v32;
      if (v16 && objc_msgSend(v16, "count") == 1)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 32));

        v21 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
        VNValidatedLog(1, (uint64_t)CFSTR("setTrackedObjects finished for %s"), v22, v23, v24, v25, v26, v27, v21);
      }
      else
      {
        if (!v17)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Setting input rectangles to one of the rectangle corners failed"));
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v30;
        v35[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v31, *(_QWORD *)(a1 + 32));

      }
    }
    else
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("initialization of internal object"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (VNDetectedObjectObservation *)objc_claimAutoreleasedReturnValue();
      v36[0] = v13;
      v36[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("wrong type of a corner tracker allocated"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    v37[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(a1 + 32));

  }
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)trackedCorners
{
  if (+[VNRectangleTracker trackedCorners]::onceToken != -1)
    dispatch_once(&+[VNRectangleTracker trackedCorners]::onceToken, &__block_literal_global_6855);
  return (id)+[VNRectangleTracker trackedCorners]::trackedCorners;
}

+ (id)_trackingRectAroundPoint:(CGPoint)a3 trackingRectSize:(CGSize)a4
{
  unsigned __int8 v4;
  CGFloat v5;
  CGFloat v6;
  int v8;
  CGFloat width;
  CGFloat x;
  CGFloat height;
  CGFloat y;
  CGRect v18;

  if ((v4 & 1) == 0)
  {
    height = a4.height;
    width = a4.width;
    y = a3.y;
    x = a3.x;
    a4.width = width;
    a3.x = x;
    a3.y = y;
    a4.height = height;
    if (v8)
    {
      *(_QWORD *)+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame = 0;
      *(_QWORD *)&+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame[8] = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame[16] = _Q0;
      a4.width = width;
      a3.x = x;
      a3.y = y;
      a4.height = height;
    }
  }
  v5 = a3.x - a4.width * 0.5;
  v6 = a3.y - a4.height * 0.5;
  v18 = CGRectIntersection(*(CGRect *)&a4.width, *(CGRect *)+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame);
  return CGRectCreateDictionaryRepresentation(v18);
}

void __36__VNRectangleTracker_trackedCorners__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNRectangleTracking_BottomLeftTracker");
  v2[1] = CFSTR("VNRectangleTracking_BottomRightTracker");
  v2[2] = CFSTR("VNRectangleTracking_TopLeftTracker");
  v2[3] = CFSTR("VNRectangleTracking_TopRightTracker");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNRectangleTracker trackedCorners]::trackedCorners;
  +[VNRectangleTracker trackedCorners]::trackedCorners = v0;

}

@end
