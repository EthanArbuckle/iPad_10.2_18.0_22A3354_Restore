@implementation VNTracker

- (VNTracker)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNTracker *v7;
  uint64_t v8;
  VNRequestSpecifier *originatingRequestSpecifier;
  CGSize v10;
  void *v11;
  uint64_t v12;
  NSUUID *key;
  uint64_t v14;
  NSString *level;
  VNTracker *v16;
  uint64_t v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNTracker;
  v7 = -[VNTracker init](&v19, sel_init);
  if (!v7)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  originatingRequestSpecifier = v7->_originatingRequestSpecifier;
  v7->_originatingRequestSpecifier = (VNRequestSpecifier *)v8;

  if (!v7->_originatingRequestSpecifier)
    goto LABEL_9;
  v7->_trackedFrameNumber = -1;
  v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v7->_lastTrackedBBox.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v7->_lastTrackedBBox.size = v10;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  key = v7->_key;
  v7->_key = (NSUUID *)v12;

  if (!v7->_key)
    goto LABEL_9;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNTrackingOption_TrackingLevel"), v6, a4);
  v14 = objc_claimAutoreleasedReturnValue();
  level = v7->_level;
  v7->_level = (NSString *)v14;

  if (!v7->_level)
    goto LABEL_9;
  v18 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v18, CFSTR("VNTrackingOption_CVPixelBufferFormat"), v6, a4))goto LABEL_9;
  v7->_trackedFrameCVPixelBufferFormat = v18;
  v16 = v7;
LABEL_10:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VNTracker *v4;
  char v5;

  v4 = (VNTracker *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSUUID isEqual:](self->_key, "isEqual:", v4->_key);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNTracker;
  return -[NSUUID hash](self->_key, "hash") ^ __ROR8__(-[VNTracker hash](&v3, sel_hash), 51);
}

- (void)_createTrackerWithLevel:(id)a3 options:(ObjectTrackerOptions *)a4 error:(id *)a5
{
  int64_t v7;
  _OWORD *v8;
  const vision::mod::ObjectTrackerOptions *v9;
  void (**v10)(vision::mod::ObjectTrackerRPN *__hidden);
  void *v11;
  const vision::mod::ObjectTrackerOptions *v12;
  vision::mod::ObjectDetectorAbstract *v13;
  vision::mod::ObjectDetectorAbstract *v14;
  const vision::mod::ObjectTrackerOptions *v15;

  v7 = +[VNTracker VNTrackerOptionToTrackerType:](VNTracker, "VNTrackerOptionToTrackerType:", a3);
  if (v7 == -1)
  {
    if (a5)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown Tracker type: %ld"), -1);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  switch((_DWORD)v7)
  {
    case 3:
      if (!v13)
        __cxa_bad_cast();
      v14 = v13;
      v8 = (_OWORD *)operator new();
      vision::mod::ObjectTrackerAbstract::ObjectTrackerAbstract((vision::mod::ObjectTrackerAbstract *)v8, v14, v15);
      v10 = &off_1E453A338;
      break;
    case 2:
      v8 = (_OWORD *)operator new();
      vision::mod::ObjectTrackerAbstract::ObjectTrackerAbstract((vision::mod::ObjectTrackerAbstract *)v8, (vision::mod::ObjectDetectorAbstract *)a4, v12);
      v10 = &off_1E453A750;
      *(_QWORD *)v8 = &off_1E453A750;
      v8[2] = 0u;
      v8[3] = 0u;
      v8[4] = 0u;
      v8[5] = 0u;
      *(_OWORD *)((char *)v8 + 90) = 0u;
      goto LABEL_12;
    case 1:
      v8 = (_OWORD *)operator new();
      vision::mod::ObjectTrackerAbstract::ObjectTrackerAbstract((vision::mod::ObjectTrackerAbstract *)v8, (vision::mod::ObjectDetectorAbstract *)a4, v9);
      v10 = &off_1E453A2E8;
      break;
    default:
      goto LABEL_14;
  }
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 4) = 0;
LABEL_12:
  if (((unsigned __int8 (*)(vision::mod::ObjectTrackerCorrelation *))v10[6])((vision::mod::ObjectTrackerCorrelation *)v8) != 128)
  {
    (*(void (**)(_OWORD *))(*(_QWORD *)v8 + 8))(v8);
LABEL_14:
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create a Tracker object"));
      v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    return 0;
  }
  return v8;
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  __CVBuffer *v16;
  __CVBuffer *v17;
  void *v18;
  char v19;
  void *v20;
  _QWORD aBlock[6];
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  void **v26;

  v8 = a4;
  -[VNTracker _parseInputObservations:imageBuffer:error:](self, "_parseInputObservations:imageBuffer:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_9;
  if (!self->mTrackerImpl.__ptr_)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is not initialized"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_18;
  }
  if (-[VNTracker isTracking](self, "isTracking"))
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is busy with previous tracking requests. It needs to be reset to restart tracking sequence"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = 0;
      *a5 = v10;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v12 = objc_msgSend(v9, "count");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  std::vector<vision::mod::DetectedObject>::vector(&v24, v12);
  v14 = objc_msgSend(v8, "width");
  v15 = (double)(unint64_t)objc_msgSend(v8, "height");
  if (-[VNTracker _visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:](self, "_visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:", v9, &v24, v13, a5, (double)v14, v15)&& (v16 = (__CVBuffer *)objc_msgSend(v8, "bufferWithWidth:height:format:options:error:", (unint64_t)(double)v14, (unint64_t)v15, -[VNTracker trackedFrameCVPixelBufferFormat](self, "trackedFrameCVPixelBufferFormat"), 0, a5), (v17 = v16) != 0))
  {
    CVPixelBufferLockBaseAddress(v16, 1uLL);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = __45__VNTracker_setTrackedObjects_inFrame_error___block_invoke;
    aBlock[3] = &unk_1E453C1D8;
    aBlock[4] = self;
    aBlock[5] = v17;
    memset(v23, 0, sizeof(v23));
    std::vector<vision::mod::DetectedObject>::__init_with_size[abi:ne180100]<vision::mod::DetectedObject*,vision::mod::DetectedObject*>(v23, v24, v25, 0xCCCCCCCCCCCCCCCDLL * ((v25 - v24) >> 4));
    v18 = _Block_copy(aBlock);
    v19 = VNExecuteBlock(v18, (uint64_t)a5);
    CVPixelBufferUnlockBaseAddress(v17, 1uLL);
    CVPixelBufferRelease(v17);
    if ((v19 & 1) != 0)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "boundingBox");
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

      -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", 0);
      v11 = v13;
    }
    else
    {
      v11 = 0;
    }

    v26 = (void **)v23;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v26);
  }
  else
  {
    v11 = 0;
  }
  v26 = (void **)&v24;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v26);

LABEL_18:
  return v11;
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VNDetectedObjectObservation *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  void *v37;
  id v39;
  _QWORD aBlock[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  __n128 (*v44)(__n128 *, __n128 *);
  void (*v45)(uint64_t);
  const char *v46;
  _QWORD v47[3];
  void **v48;
  CGRect v49;
  CGRect v50;

  v6 = a3;
  if (!self->mTrackerImpl.__ptr_ || !-[VNTracker isTracking](self, "isTracking"))
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is not initialized"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v36 = 0;
      *a4 = v37;
      goto LABEL_22;
    }
LABEL_17:
    v36 = 0;
    goto LABEL_22;
  }
  v7 = (double)(unint64_t)objc_msgSend(v6, "width");
  v8 = (double)(unint64_t)objc_msgSend(v6, "height");
  v9 = (__CVBuffer *)objc_msgSend(v6, "bufferWithWidth:height:format:options:error:", (unint64_t)v7, (unint64_t)v8, -[VNTracker trackedFrameCVPixelBufferFormat](self, "trackedFrameCVPixelBufferFormat"), 0, a4);
  v10 = v9;
  if (!v9)
  {
    if (a4)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("No frame to track objects was passed to the tracker"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x4812000000;
  v44 = __Block_byref_object_copy__31326;
  v45 = __Block_byref_object_dispose__31327;
  v46 = "";
  memset(v47, 0, sizeof(v47));
  CVPixelBufferLockBaseAddress(v9, 1uLL);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__VNTracker_trackInFrame_error___block_invoke;
  aBlock[3] = &unk_1E4548998;
  aBlock[5] = &v41;
  aBlock[6] = v10;
  aBlock[4] = self;
  v11 = _Block_copy(aBlock);
  v12 = VNExecuteBlock(v11, (uint64_t)a4);
  CVPixelBufferUnlockBaseAddress(v10, 1uLL);
  CVPixelBufferRelease(v10);
  if ((v12 & 1) != 0)
  {
    v39 = v6;
    -[VNTracker originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = (void *)objc_msgSend(v14, "initWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((v42[7] - v42[6]) >> 4));
    v17 = v42[6];
    v16 = v42[7];
    if (v17 != v16)
    {
      v18 = 0;
      do
      {
        v19 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNDetectedObjectObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v13, *(float *)(v17 + 24) / v7, *(float *)(v17 + 28) / v8, *(float *)(v17 + 36) / v7, *(float *)(v17 + 32) / v8);
        -[VNTracker key](self, "key");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNObservation setUUID:](v19, "setUUID:", v20);

        LODWORD(v21) = *(_DWORD *)(v17 + 60);
        -[VNObservation setConfidence:](v19, "setConfidence:", v21);
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v19, v18++);

        v17 += 80;
      }
      while (v17 != v16);
    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v39;
    objc_msgSend(v22, "boundingBox");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    -[VNTracker _postProcessTrackingResults:trackerResults:error:](self, "_postProcessTrackingResults:trackerResults:error:", v39, v15, a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_19;
    -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -[VNTracker trackedFrameNumber](self, "trackedFrameNumber") + 1);
    -[VNTracker lastTrackedBBox](self, "lastTrackedBBox");
    v50.origin.x = v32;
    v50.origin.y = v33;
    v50.size.width = v34;
    v50.size.height = v35;
    v49.origin.x = v24;
    v49.origin.y = v26;
    v49.size.width = v28;
    v49.size.height = v30;
    if (CGRectEqualToRect(v49, v50)
      || -[VNTracker _updateTrackerWithModifiedBBoxForImageBuffer:error:](self, "_updateTrackerWithModifiedBBoxForImageBuffer:error:", v39, a4))
    {
      v36 = v31;
    }
    else
    {
LABEL_19:
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  _Block_object_dispose(&v41, 8);
  v48 = (void **)v47;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v48);
LABEL_22:

  return v36;
}

- (BOOL)reset:(id *)a3
{
  ObjectTrackerAbstract *ptr;
  uint64_t v6;
  BOOL result;
  id v8;
  void *v9;

  ptr = self->mTrackerImpl.__ptr_;
  if (ptr)
  {
    v6 = (*(uint64_t (**)(ObjectTrackerAbstract *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2);
    if (v6 == 128)
    {
      -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -1);
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      return 1;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting tracker failed with error: %llu"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Tracker is not initialized"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v8;
    return result;
  }
  return 0;
}

- (BOOL)isTracking
{
  return -[VNTracker trackedFrameNumber](self, "trackedFrameNumber") >= 0;
}

- (BOOL)isResettable
{
  return 1;
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_postProcessTrackingResults:(id)a3 trackerResults:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingBox");
    -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

    v12 = v10;
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("no tracker results"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_visionBBoxToTrackerBBox:(id)a3 trackedObjects:(void *)a4 imageSize:(CGSize)a5 results:(id)a6 error:(id *)a7
{
  double height;
  double width;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGSize v20;
  const __CFDictionary *v21;
  BOOL v22;
  id v23;
  void *v24;
  double MinX;
  CGFloat v26;
  double v27;
  double v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v38;
  id obj;
  id v42;
  void *v43;
  void *v44;
  id v45;
  CGRect rect;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  std::string __str;
  __int128 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  char v56;
  int v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  height = a5.height;
  width = a5.width;
  v60 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v42 = a6;
  -[VNTracker originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_msgSend((id)objc_opt_class(), "trackerObservationClass");
  -[VNTracker key](self, "key");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v45, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v48;
    v15 = 40;
    v16 = MEMORY[0x1E0C9D648];
    v38 = 40;
    while (2)
    {
      v17 = 0;
      v18 = v15 + 80 * v13;
      do
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v17);
        v20 = *(CGSize *)(v16 + 16);
        rect.origin = *(CGPoint *)v16;
        rect.size = v20;
        objc_msgSend(v45, "objectForKeyedSubscript:", v19, v38);
        v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v22 = CGRectMakeWithDictionaryRepresentation(v21, &rect);

        if (!v22)
        {
          if (a7)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to initialize object IDs to rectangles dictionary"));
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          v36 = 0;
          goto LABEL_17;
        }
        v23 = [v11 alloc];
        v24 = (void *)objc_msgSend(v23, "initWithOriginatingRequestSpecifier:boundingBox:", v43, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        objc_msgSend(v24, "setUUID:", v44);
        objc_msgSend(v42, "setObject:atIndexedSubscript:", v24, v13 + v17);
        rect.origin.x = width * rect.origin.x;
        rect.origin.y = height * rect.origin.y;
        rect.size.width = width * rect.size.width;
        rect.size.height = height * rect.size.height;
        MinX = CGRectGetMinX(rect);
        v26 = height - CGRectGetMaxY(rect);
        rect.origin.x = MinX;
        rect.origin.y = v26;
        v28 = rect.size.width;
        v27 = rect.size.height;
        std::string::basic_string[abi:ne180100]<0>(&__str, "unknown");
        *(float *)&v29 = v28;
        *(float *)&v30 = v27;
        *(float *)&v31 = MinX;
        *(float *)&v32 = v26;
        *(_QWORD *)&v52 = __PAIR64__(v32, v31);
        *((_QWORD *)&v52 + 1) = __PAIR64__(v29, v30);
        v55 = 0;
        v56 = 0;
        v57 = 0;
        v53 = 0;
        v54 = 0;
        v33 = *(_QWORD *)a4;
        v34 = *(_QWORD *)a4 + v18;
        if ((std::string *)(v34 - 40) != &__str)
        {
          *(_OWORD *)(v34 + 24) = v58;
          std::string::operator=((std::string *)(v34 - 40), &__str);
          v35 = v33 + v18;
          *(_OWORD *)(v35 - 16) = v52;
          *(_WORD *)(v35 + 8) = v54;
          *(_QWORD *)v35 = v53;
          *(_BYTE *)(v35 + 16) = v56;
          *(_DWORD *)(v35 + 12) = v55;
          *(_DWORD *)(v35 + 20) = v57;
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);

        ++v17;
        v18 += 80;
      }
      while (v12 != v17);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      v13 += v17;
      v15 = v38;
      if (v12)
        continue;
      break;
    }
  }
  v36 = 1;
LABEL_17:

  return v36;
}

- (BOOL)_updateTrackerWithModifiedBBoxForImageBuffer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CFDictionaryRef DictionaryRepresentation;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  double v13;
  __CVBuffer *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  void **v21;
  void *v22;
  _QWORD v23[2];
  CGRect v24;

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VNTracker key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  -[VNTracker lastTrackedBBox](self, "lastTrackedBBox");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v24);
  v23[0] = DictionaryRepresentation;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  std::vector<vision::mod::DetectedObject>::vector(v20, v10);
  v12 = objc_msgSend(v6, "width");
  v13 = (double)(unint64_t)objc_msgSend(v6, "height");
  if (-[VNTracker _visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:](self, "_visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:", v9, v20, v11, a4, (double)v12, v13))
  {
    v14 = (__CVBuffer *)objc_msgSend(v6, "bufferWithWidth:height:format:options:error:", (unint64_t)(double)v12, (unint64_t)v13, 875704422, 0, a4);
    if (!v14)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No frame to track objects was passed to the tracker"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }
    v15 = (*(uint64_t (**)(ObjectTrackerAbstract *, __CVBuffer *, _QWORD *))(*(_QWORD *)self->mTrackerImpl.__ptr_
                                                                                     + 40))(self->mTrackerImpl.__ptr_, v14, v20);
    CVPixelBufferRelease(v14);
    v16 = v15 == 128;
    if (a4 && v15 != 128)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracking objects failed with error: %llu"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v16 = 0;
    }
  }
  else
  {
    if (!a4)
      goto LABEL_10;
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Conversion to Tracker coordinate system failed"));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void **)v20;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v21);

  return v16;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (unsigned)trackedFrameCVPixelBufferFormat
{
  return self->_trackedFrameCVPixelBufferFormat;
}

- (void)setTrackedFrameCVPixelBufferFormat:(unsigned int)a3
{
  self->_trackedFrameCVPixelBufferFormat = a3;
}

- (NSString)level
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)trackedFrameNumber
{
  return self->_trackedFrameNumber;
}

- (void)setTrackedFrameNumber:(int64_t)a3
{
  self->_trackedFrameNumber = a3;
}

- (CGRect)lastTrackedBBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_lastTrackedBBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setLastTrackedBBox:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_lastTrackedBBox, &v3, 32, 1, 0);
}

- (NSUUID)key
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  cntrl = self->mTrackerImpl.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

BOOL __32__VNTracker_trackInFrame_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(a1[4] + 8) + 32))(*(_QWORD *)(a1[4] + 8), a1[6], *(_QWORD *)(a1[5] + 8) + 48);
  v4 = v3;
  if (a2 && v3 != 128)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracking objects failed with error: %llu"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v5);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4 == 128;
}

BOOL __45__VNTracker_setTrackedObjects_inFrame_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)(*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 24))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), a1 + 48);
  v4 = v3;
  if (a2 && v3 != 128)
  {
    VNErrorForCVMLStatus(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Setting objects to track failed"), v5);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4 == 128;
}

+ (int64_t)VNTrackerOptionToTrackerType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (+[VNTracker VNTrackerOptionToTrackerType:]::onceToken != -1)
    dispatch_once(&+[VNTracker VNTrackerOptionToTrackerType:]::onceToken, &__block_literal_global_31350);
  objc_msgSend((id)+[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = -1;

  return v6;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

void __42__VNTracker_VNTrackerOptionToTrackerType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNTrackingOption_TrackingLevelAccurate");
  v2[1] = CFSTR("VNTrackingOption_TrackingLevelFast");
  v3[0] = &unk_1E459D120;
  v3[1] = &unk_1E459D138;
  v2[2] = CFSTR("VNTrackingOption_TrackingLevelRPN");
  v3[2] = &unk_1E459D150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType;
  +[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType = v0;

}

@end
