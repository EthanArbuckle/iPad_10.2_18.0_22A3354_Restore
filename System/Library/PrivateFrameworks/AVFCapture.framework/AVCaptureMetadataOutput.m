@implementation AVCaptureMetadataOutput

- (CGRect)rectOfInterest
{
  AVCaptureMetadataOutputInternal *internal;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  internal = self->_internal;
  x = internal->rectOfInterest.origin.x;
  y = internal->rectOfInterest.origin.y;
  width = internal->rectOfInterest.size.width;
  height = internal->rectOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isFaceTrackingUsingFaceRecognition
{
  return self->_internal->faceTrackingUsesFaceRecognition;
}

- (BOOL)isFaceTrackingPlusEnabled
{
  return self->_internal->faceTrackingPlusEnabled;
}

- (BOOL)isAttentionDetectionEnabled
{
  return self->_internal->attentionDetectionEnabled;
}

- (float)faceTrackingNetworkFailureThresholdMultiplier
{
  return self->_internal->faceTrackingNetworkFailureThresholdMultiplier;
}

- (int64_t)faceTrackingMaxFaces
{
  return self->_internal->faceTrackingMaxFaces;
}

- (id)_metadataIdentifiers
{
  return -[AVCaptureMetadataOutput metadataIdentifiersForMetadataObjectTypes:](self, "metadataIdentifiersForMetadataObjectTypes:", self->_internal->metadataObjectTypes);
}

- (NSArray)metadataObjectTypes
{
  NSArray *metadataObjectTypes;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMetadataOutputCapturesFacesByDefault"))
    && !self->_internal->metadataObjectTypes
    && objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "isFaceDetectionSupported"))
  {
    v5[0] = CFSTR("face");
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  }
  else
  {
    metadataObjectTypes = self->_internal->metadataObjectTypes;
    if (metadataObjectTypes)
      return (NSArray *)(id)-[NSArray copy](metadataObjectTypes, "copy");
    else
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v7;
  void *v8;
  BOOL result;

  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", AVMediaTypeForMetadataObjects()))
  {
    v7 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v7 = 2;
LABEL_5:
    v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (void)setMetadataObjectTypes:(NSArray *)metadataObjectTypes
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSArray *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (metadataObjectTypes)
  {
    v5 = -[AVCaptureMetadataOutput availableMetadataObjectTypes](self, "availableMetadataObjectTypes");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](metadataObjectTypes, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(metadataObjectTypes);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!-[NSArray containsObject:](v5, "containsObject:", v10))
          {
            v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, v10);
            if (AVCaptureShouldThrowForAPIViolations())
              objc_exception_throw(v12);
            NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
            return;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](metadataObjectTypes, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  v11 = self->_internal->metadataObjectTypes;
  if (v11 != metadataObjectTypes && !-[NSArray isEqualToArray:](v11, "isEqualToArray:", metadataObjectTypes))
  {

    self->_internal->metadataObjectTypes = (NSArray *)-[NSArray copy](metadataObjectTypes, "copy");
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  AVCaptureMetadataOutputInternal *internal;
  AVCaptureConnection *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;

  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects());
  v7 = (id)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](v6, "inputPorts"), "firstObject"), "input");
  objc_sync_exit(internal);
  if (-[AVCaptureConnection isLive](v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = 0;
    v9 = -[AVCaptureConnection sourcesFromFrontFacingCamera](v6, "sourcesFromFrontFacingCamera");
    -[AVCaptureConnection sourcesFromExternalCamera](v6, "sourcesFromExternalCamera");
    if (v9)
      v10 = FigCaptureCameraRequires180DegreesRotation() ^ 1;
    else
      v10 = 0;
    v11 = -[AVCaptureMetadataOutput _detectedObjectsCollectionForSampleBuffer:input:facesArrayOut:need180DegreeMetadataTransform:](self, "_detectedObjectsCollectionForSampleBuffer:input:facesArrayOut:need180DegreeMetadataTransform:", a3, v7, &v22, v10);
    if (v11)
      objc_msgSend(v8, "addObject:", v11);
    if (!v22)
    {
      v12 = -[AVCaptureMetadataOutput _legacyFaceCollectionForSampleBuffer:input:](self, "_legacyFaceCollectionForSampleBuffer:input:", a3, v7);
      if (v12)
        objc_msgSend(v8, "addObject:", v12);
    }
    v13 = -[AVCaptureMetadataOutput _trackedFacesCollectionForSampleBuffer:input:](self, "_trackedFacesCollectionForSampleBuffer:input:", a3, v7);
    if (v13)
      objc_msgSend(v8, "addObject:", v13);
    v14 = -[AVCaptureMetadataOutput _offlineVISMotionCollectionForSampleBuffer:input:](self, "_offlineVISMotionCollectionForSampleBuffer:input:", a3, v7);
    if (v14)
      objc_msgSend(v8, "addObject:", v14);
    v15 = -[AVCaptureMetadataOutput _eyeReliefResultCollectionForSampleBuffer:input:](self, "_eyeReliefResultCollectionForSampleBuffer:input:", a3, v7);
    if (v15)
      objc_msgSend(v8, "addObject:", v15);
    v16 = -[AVCaptureMetadataOutput _barcodeCollectionForSampleBuffer:input:](self, "_barcodeCollectionForSampleBuffer:input:", a3, v7);
    if (v16)
      objc_msgSend(v8, "addObject:", v16);
    v17 = -[AVCaptureMetadataOutput _lumaHistogramDataCollectionForSampleBuffer:input:](self, "_lumaHistogramDataCollectionForSampleBuffer:input:", a3, v7);
    if (v17)
      objc_msgSend(v8, "addObject:", v17);
    v18 = -[AVCaptureMetadataOutput _appClipCodesCollectionForSampleBuffer:input:](self, "_appClipCodesCollectionForSampleBuffer:input:", a3, v7);
    if (v18)
      objc_msgSend(v8, "addObject:", v18);
    v19 = -[AVCaptureMetadataOutput _textRegionsCollectionForSampleBuffer:input:](self, "_textRegionsCollectionForSampleBuffer:input:", a3, v7);
    if (v19)
      objc_msgSend(v8, "addObject:", v19);
    if (objc_msgSend(v8, "count"))
    {
      v20 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_internal->delegateCallbackHelper, "activeDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v20, "captureOutput:didOutputMetadataObjectCollections:fromConnection:", self, v8, v6);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v21 = avcmdo_allMetadataObjectsInCollections(v8);
        objc_msgSend(v20, "captureOutput:didOutputMetadataObjects:forMetadataObjectTypes:fromConnection:", self, v21, avcmdo_allMetadataObjectTypesInCollections(v8), v6);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v20, "captureOutput:didOutputMetadataObjects:fromConnection:", self, avcmdo_allMetadataObjectsInCollections(v8), v6);
      }
    }
  }

}

- (id)_trackedFacesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CMTime v10;
  CMTime v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04160], 0);
  if (result)
  {
    v7 = result;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, a3);
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("trackedFaces"));
    v10 = v11;
    v12[0] = +[AVMetadataTrackedFacesObject trackedFacesWithTime:faceTrackingDictionary:input:](AVMetadataTrackedFacesObject, "trackedFacesWithTime:faceTrackingDictionary:input:", &v10, v7, a4);
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = v11;
    return +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v10, v8, v8, v9);
  }
  return result;
}

- (id)_textRegionsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVMetadataTextRegionObject *v14;
  AVMetadataTextRegionObject *v15;
  uint64_t v16;
  AVMetadataObjectCollection *v17;
  AVCaptureMetadataOutput *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v19 = self;
  v29 = *MEMORY[0x1E0C80C00];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04158], 0))
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = *MEMORY[0x1E0CA2E18];
  v7 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v28 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04150], 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = +[AVMetadataTextRegionObject textRegionObjectWithDictionary:input:](AVMetadataTextRegionObject, "textRegionObjectWithDictionary:input:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13), a4, v19);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(v6, "addObject:", v14);
          if ((v7 & 1) == 0)
          {
            -[AVMetadataObject time](v15, "time");
            v7 = HIDWORD(v20);
            v28 = DWORD2(v20);
            v27 = v20;
            v8 = v21;
            avcmdo_addCMTimeToHistoryForDetector(v19->_internal->previousTwoCMTimesByDetectorType, &v20, (uint64_t)CFSTR("AVMetadataDetectorTextRegions"));
          }
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  if ((v7 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(v19->_internal->previousTwoCMTimesByDetectorType, (uint64_t)CFSTR("AVMetadataDetectorTextRegions"), (uint64_t)&v20);
    v27 = v20;
    v7 = HIDWORD(v20);
    v28 = DWORD2(v20);
    v8 = v21;
  }
  v16 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("textRegion"), v19);
  *(_QWORD *)&v20 = v27;
  *((_QWORD *)&v20 + 1) = __PAIR64__(v7, v28);
  v21 = v8;
  v17 = +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v20, v16, v16, v6);

  return v17;
}

- (id)_offlineVISMotionCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CMTime v10;
  CMTime v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04140], 0);
  if (result)
  {
    v7 = result;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, a3);
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("offlineVideoStabilizationMotion"));
    v10 = v11;
    v12[0] = +[AVMetadataOfflineVideoStabilizationMotionObject offlineVideoStabilizationMotionObjectWithTime:motionDictionary:input:](AVMetadataOfflineVideoStabilizationMotionObject, "offlineVideoStabilizationMotionObjectWithTime:motionDictionary:input:", &v10, v7, a4);
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = v11;
    return +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v10, v8, v8, v9);
  }
  return result;
}

- (id)_lumaHistogramDataCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id result;
  id v7;
  AVMetadataVideoPreviewHistogramObject *v8;
  uint64_t v9;
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04168], 0);
  if (result)
  {
    v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    v11 = v12;
    v8 = +[AVMetadataVideoPreviewHistogramObject videoPreviewHistogramObjectWithLumaHistogramData:input:time:](AVMetadataVideoPreviewHistogramObject, "videoPreviewHistogramObjectWithLumaHistogramData:input:time:", v7, a4, &v11);
    v9 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("videoPreviewHistogram"));
    v13[0] = v8;
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v11, v9, v9, v10);
  }
  return result;
}

- (id)_legacyFaceCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  int64_t v17;
  NSMutableDictionary *previousTwoCMTimesByDetectorType;
  AVMetadataObjectCollection *v19;
  uint64_t v20;
  AVCaptureMetadataOutput *v22;
  CMTime v23;
  CMTime v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04130], 0))
  {
    v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04128], 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v22 = self;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      v13 = *MEMORY[0x1E0D050C0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v13);
          if (!v11)
            v11 = (void *)v16;
          objc_msgSend(v8, "addObject:", +[AVMetadataFaceObject faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:](AVMetadataFaceObject, "faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:", v15, a4, v16));
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
      memset(&v24, 0, sizeof(v24));
      self = v22;
      if (v11)
      {
        objc_msgSend(v11, "longLongValue");
        v17 = FigHostTimeToNanoseconds();
        CMTimeMake(&v24, v17, 1000000000);
        previousTwoCMTimesByDetectorType = v22->_internal->previousTwoCMTimesByDetectorType;
        v23 = v24;
        avcmdo_addCMTimeToHistoryForDetector(previousTwoCMTimesByDetectorType, (__int128 *)&v23.value, (uint64_t)CFSTR("AVMetadataDetectorLegacyFaces"));
LABEL_16:
        v20 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("face"));
        v23 = v24;
        v19 = +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v23, v20, v20, v8);

        return v19;
      }
    }
    else
    {
      memset(&v24, 0, sizeof(v24));
    }
    avcmdo_nextTimeForDetector(self->_internal->previousTwoCMTimesByDetectorType, (uint64_t)CFSTR("AVMetadataDetectorLegacyFaces"), (uint64_t)&v24);
    goto LABEL_16;
  }
  return 0;
}

- (id)_eyeReliefResultCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id result;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04120], 0);
  if (result)
  {
    v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("EyeReliefStatus"));
    v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05138]), "intValue");
    v11 = v12;
    v13[0] = +[AVMetadataEyeReliefStatusObject eyeReliefStatusObjectWithEyeReliefStatus:input:time:optionalInfoDict:](AVMetadataEyeReliefStatusObject, "eyeReliefStatusObjectWithEyeReliefStatus:input:time:optionalInfoDict:", v9, a4, &v11, v7);
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v11, v8, v8, v10);
  }
  return result;
}

- (id)_detectedObjectsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4 facesArrayOut:(id *)a5 need180DegreeMetadataTransform:(BOOL)a6
{
  _BOOL4 v6;
  CFTypeRef v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  int32_t v18;
  CMTimeFlags b_high;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t jj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t kk;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t mm;
  uint64_t v58;
  uint64_t v59;
  uint64_t nn;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i1;
  void *v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i2;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  AVMetadataObjectCollection *v77;
  uint64_t v79;
  _BOOL4 v80;
  AVCaptureMetadataOutput *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CGFloat c;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  CMTimeFlags v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  CGAffineTransform time1;
  CGAffineTransform t2;
  CGAffineTransform v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  CMTime time2;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  CGFloat a;
  CMTimeScale b_low;
  uint64_t v173;

  v6 = a6;
  v173 = *MEMORY[0x1E0C80C00];
  v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04110], 0);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  v81 = self;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v98 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  a = *MEMORY[0x1E0CA2E18];
  v100 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  b_low = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  c = *(double *)(MEMORY[0x1E0CA2E18] + 16);
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v99 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v154, v170, 16);
  v80 = v6;
  if (!v99)
    goto LABEL_107;
  v97 = *(_QWORD *)v155;
  v96 = *MEMORY[0x1E0D050C0];
  v95 = *MEMORY[0x1E0D04FB0];
  v94 = *MEMORY[0x1E0D04F88];
  v89 = *MEMORY[0x1E0D04F80];
  v88 = *MEMORY[0x1E0D04F90];
  v87 = *MEMORY[0x1E0D04F60];
  v86 = *MEMORY[0x1E0D04F70];
  v85 = *MEMORY[0x1E0D04FA8];
  v84 = *MEMORY[0x1E0D04FA0];
  v83 = *MEMORY[0x1E0D04F68];
  v82 = *MEMORY[0x1E0D04F78];
  v79 = *MEMORY[0x1E0D04F98];
  v93 = v11;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v155 != v97)
        objc_enumerationMutation(v11);
      v14 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * v13);
      v15 = (void *)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v96);
      v16 = (void *)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v95);
      if (v15)
      {
        memset(&v108, 0, 24);
        objc_msgSend(v15, "longLongValue");
        v17 = FigHostTimeToNanoseconds();
        CMTimeMake((CMTime *)&v108, v17, 1000000000);
        if ((v100 & 1) == 0)
          goto LABEL_10;
        *(_OWORD *)&time1.a = *(_OWORD *)&v108.a;
        time1.c = v108.c;
        *(CGFloat *)&time2.value = a;
        time2.timescale = b_low;
        time2.flags = v100;
        *(CGFloat *)&time2.epoch = c;
        v18 = CMTimeCompare((CMTime *)&time1, &time2);
        b_high = v100;
        if (v18 < 0)
        {
LABEL_10:
          a = v108.a;
          b_high = HIDWORD(v108.b);
          b_low = LODWORD(v108.b);
          c = v108.c;
        }
        v100 = b_high;
      }
      v101 = v13;
      if (objc_msgSend(v14, "isEqualToString:", v94))
      {
        v152 = 0u;
        v151 = 0u;
        v150 = 0u;
        v149 = 0u;
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v149, v169, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v150;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v150 != v22)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataFaceObject faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:](AVMetadataFaceObject, "faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i), a4, v15));
            }
            v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v149, v169, 16);
          }
          while (v21);
        }
        objc_msgSend(v98, "addObject:", CFSTR("face"));
        v11 = v93;
        if (a5)
          *a5 = v12;
        goto LABEL_95;
      }
      if (objc_msgSend(v14, "isEqualToString:", v89))
      {
        v148 = 0u;
        v147 = 0u;
        v146 = 0u;
        v145 = 0u;
        v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v146;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v146 != v26)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanBodyObject humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanBodyObject, "humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j), a4, v15));
            }
            v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
          }
          while (v25);
        }
        v28 = v98;
        v29 = CFSTR("humanBody");
LABEL_94:
        objc_msgSend(v28, "addObject:", v29);
        v11 = v93;
        goto LABEL_95;
      }
      if (objc_msgSend(v14, "isEqualToString:", v88))
      {
        v144 = 0u;
        v143 = 0u;
        v142 = 0u;
        v141 = 0u;
        v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v142;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v142 != v32)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanFullBodyObject humanFullBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanFullBodyObject, "humanFullBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * k), a4, v15));
            }
            v31 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
          }
          while (v31);
        }
        v28 = v98;
        v29 = CFSTR("humanFullBody");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v87))
      {
        v140 = 0u;
        v139 = 0u;
        v137 = 0u;
        v138 = 0u;
        v34 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v138;
          do
          {
            for (m = 0; m != v35; ++m)
            {
              if (*(_QWORD *)v138 != v36)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataCatBodyObject catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataCatBodyObject, "catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * m), a4, v15));
            }
            v35 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
          }
          while (v35);
        }
        v28 = v98;
        v29 = CFSTR("catBody");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v86))
      {
        v135 = 0u;
        v136 = 0u;
        v133 = 0u;
        v134 = 0u;
        v38 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v133, v165, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v134;
          do
          {
            for (n = 0; n != v39; ++n)
            {
              if (*(_QWORD *)v134 != v40)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataDogBodyObject dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataDogBodyObject, "dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * n), a4, v15));
            }
            v39 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v133, v165, 16);
          }
          while (v39);
        }
        v28 = v98;
        v29 = CFSTR("dogBody");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v85))
      {
        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v42 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v129, v164, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v130;
          do
          {
            for (ii = 0; ii != v43; ++ii)
            {
              if (*(_QWORD *)v130 != v44)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataSalientObject salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataSalientObject, "salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * ii), a4, v15));
            }
            v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v129, v164, 16);
          }
          while (v43);
        }
        v28 = v98;
        v29 = CFSTR("salientObject");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v84))
      {
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v46 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v125, v163, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v126;
          do
          {
            for (jj = 0; jj != v47; ++jj)
            {
              if (*(_QWORD *)v126 != v48)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanHeadObject humanHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanHeadObject, "humanHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * jj), a4, v15));
            }
            v47 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v125, v163, 16);
          }
          while (v47);
        }
        v28 = v98;
        v29 = CFSTR("humanHead");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v83))
      {
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v121, v162, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v122;
          do
          {
            for (kk = 0; kk != v51; ++kk)
            {
              if (*(_QWORD *)v122 != v52)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataCatHeadObject catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataCatHeadObject, "catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * kk), a4, v15));
            }
            v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v121, v162, 16);
          }
          while (v51);
        }
        v28 = v98;
        v29 = CFSTR("catHead");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v82))
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v54 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v117, v161, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v118;
          do
          {
            for (mm = 0; mm != v55; ++mm)
            {
              if (*(_QWORD *)v118 != v56)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataDogHeadObject dogHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataDogHeadObject, "dogHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * mm), a4, v15));
            }
            v55 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v117, v161, 16);
          }
          while (v55);
        }
        v28 = v98;
        v29 = CFSTR("dogHead");
        goto LABEL_94;
      }
      if (objc_msgSend(v14, "isEqualToString:", v79))
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v58 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v113, v160, 16);
        if (v58)
        {
          v59 = v58;
          v90 = *(_QWORD *)v114;
          do
          {
            for (nn = 0; nn != v59; ++nn)
            {
              if (*(_QWORD *)v114 != v90)
                objc_enumerationMutation(v16);
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanHandObject humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanHandObject, "humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * nn), a4, v15));
            }
            v59 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v113, v160, 16);
          }
          while (v59);
        }
        objc_msgSend(v98, "addObject:", CFSTR("humanHand"));
      }
LABEL_95:
      v13 = v101 + 1;
    }
    while (v101 + 1 != v99);
    v61 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v154, v170, 16);
    v99 = v61;
  }
  while (v61);
LABEL_107:
  v62 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D04118], 0);
  if (v62)
  {
    v63 = v62;
    if (objc_msgSend(v62, "intValue"))
    {
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v64 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v109, v159, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v110;
        do
        {
          for (i1 = 0; i1 != v65; ++i1)
          {
            if (*(_QWORD *)v110 != v66)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i1), "setDetectionSource:", (int)objc_msgSend(v63, "intValue"));
          }
          v65 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v109, v159, 16);
        }
        while (v65);
      }
    }
  }
  if (v80)
  {
    v68 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    memset(&v108, 0, sizeof(v108));
    t2.b = 0.0;
    t2.c = 0.0;
    t2.a = -1.0;
    *(_OWORD *)&t2.d = xmmword_19EEEA900;
    t2.ty = 1.0;
    v69 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&time1.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&time1.c = v69;
    *(_OWORD *)&time1.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformConcat(&v108, &time1, &t2);
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v70 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v158, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v103;
      do
      {
        for (i2 = 0; i2 != v71; ++i2)
        {
          if (*(_QWORD *)v103 != v72)
            objc_enumerationMutation(v12);
          v74 = objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i2), "originalMetadataObject");
          time1 = v108;
          objc_msgSend(v68, "addObject:", +[AVMetadataObject derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:](AVMetadataObject, "derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:", v74, &time1, 0, 180.0));
        }
        v71 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v158, 16);
      }
      while (v71);
    }

    v12 = v68;
  }
  v75 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("face"), CFSTR("humanBody"), CFSTR("humanFullBody"), CFSTR("catBody"), CFSTR("dogBody"), CFSTR("salientObject"), CFSTR("humanHead"), CFSTR("catHead"), CFSTR("dogHead"), CFSTR("humanHand"), 0);
  v76 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v81->_internal->metadataObjectTypes);
  objc_msgSend(v76, "intersectSet:", v75);
  v108.a = a;
  *(_QWORD *)&v108.b = __PAIR64__(v100, b_low);
  v108.c = c;
  v77 = +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v108, v98, v76, v12);

  return v77;
}

- (id)_barcodeCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  AVMetadataMachineReadableCodeObject *v15;
  AVMetadataMachineReadableCodeObject *v16;
  AVCaptureMetadataOutputInternal *internal;
  NSMutableDictionary *previousTwoCMTimesByDetectorType;
  uint64_t v19;
  void *v20;
  AVMetadataObjectCollection *v21;
  id v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D040F0], 0))
    return 0;
  v32 = *MEMORY[0x1E0CA2E18];
  v6 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v33 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D040E8], 0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = +[AVMetadataMachineReadableCodeObject machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:input:](AVMetadataMachineReadableCodeObject, "machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:input:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), a4);
        v16 = v15;
        if ((v6 & 1) == 0)
        {
          if (v15)
          {
            -[AVMetadataObject time](v15, "time");
            v6 = HIDWORD(v25);
            v7 = v26;
          }
          else
          {
            v7 = 0;
            v6 = 0;
            v25 = 0uLL;
            v26 = 0;
          }
          v32 = v25;
          internal = self->_internal;
          v33 = DWORD2(v25);
          previousTwoCMTimesByDetectorType = internal->previousTwoCMTimesByDetectorType;
          HIDWORD(v25) = v6;
          v26 = v7;
          avcmdo_addCMTimeToHistoryForDetector(previousTwoCMTimesByDetectorType, &v25, (uint64_t)CFSTR("AVMetadataDetectorBarcodes"));
        }
        objc_msgSend(v24, "addObject:", v16);
        objc_msgSend(v8, "addObject:", -[AVMetadataObject type](v16, "type"));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }
  if ((v6 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(self->_internal->previousTwoCMTimesByDetectorType, (uint64_t)CFSTR("AVMetadataDetectorBarcodes"), (uint64_t)&v25);
    v32 = v25;
    v6 = HIDWORD(v25);
    v33 = DWORD2(v25);
    v7 = v26;
  }
  v19 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("org.gs1.UPC-E"), CFSTR("org.iso.Code39"), CFSTR("org.iso.Code39Mod43"), CFSTR("org.gs1.EAN-13"), CFSTR("org.gs1.EAN-8"), CFSTR("com.intermec.Code93"), CFSTR("org.iso.Code128"), CFSTR("org.iso.PDF417"), CFSTR("org.iso.QRCode"), CFSTR("org.iso.Aztec"), CFSTR("org.ansi.Interleaved2of5"), CFSTR("org.gs1.ITF14"), CFSTR("org.iso.DataMatrix"), CFSTR("Codabar"), CFSTR("org.gs1.GS1DataBar"), CFSTR("org.gs1.GS1DataBarExpanded"), CFSTR("org.gs1.GS1DataBarLimited"),
          CFSTR("org.iso.MicroQR"),
          CFSTR("org.iso.MicroPDF417"),
          0);
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_internal->metadataObjectTypes);
  objc_msgSend(v20, "intersectSet:", v19);
  *(_QWORD *)&v25 = v32;
  *((_QWORD *)&v25 + 1) = __PAIR64__(v6, v33);
  v26 = v7;
  v21 = +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v25, v8, v20, v24);

  return v21;
}

- (id)_appClipCodesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVMetadataMachineReadableCodeObject *v14;
  AVMetadataMachineReadableCodeObject *v15;
  uint64_t v16;
  AVMetadataObjectCollection *v17;
  AVCaptureMetadataOutput *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v19 = self;
  v29 = *MEMORY[0x1E0C80C00];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D03F20], 0))
    return 0;
  v27 = *MEMORY[0x1E0CA2E18];
  v6 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v28 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D03F18], 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = +[AVMetadataMachineReadableCodeObject machineReadableCodeObjectWithAppClipCodeDictionary:input:](AVMetadataMachineReadableCodeObject, "machineReadableCodeObjectWithAppClipCodeDictionary:input:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13), a4, v19);
        if (v14)
        {
          v15 = v14;
          if ((v6 & 1) == 0)
          {
            -[AVMetadataObject time](v14, "time");
            v6 = HIDWORD(v20);
            v28 = DWORD2(v20);
            v27 = v20;
            v7 = v21;
            avcmdo_addCMTimeToHistoryForDetector(v19->_internal->previousTwoCMTimesByDetectorType, &v20, (uint64_t)CFSTR("AVMetadataDetectorAppClipCodes"));
          }
          objc_msgSend(v8, "addObject:", v15);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  if ((v6 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(v19->_internal->previousTwoCMTimesByDetectorType, (uint64_t)CFSTR("AVMetadataDetectorAppClipCodes"), (uint64_t)&v20);
    v27 = v20;
    v6 = HIDWORD(v20);
    v28 = DWORD2(v20);
    v7 = v21;
  }
  v16 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.AppClipCode"), v19);
  *(_QWORD *)&v20 = v27;
  *((_QWORD *)&v20 + 1) = __PAIR64__(v6, v28);
  v21 = v7;
  v17 = +[AVMetadataObjectCollection collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:](AVMetadataObjectCollection, "collectionWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v20, v16, v16, v8);

  return v17;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mdo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mdo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMetadataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)setFaceTrackingMetadataObjectTypesAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    if (self->_internal->faceTrackingMetadataObjectTypesAvailable != v3)
    {
      -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
      self->_internal->faceTrackingMetadataObjectTypesAvailable = v3;
      if (!v3)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
        objc_msgSend(v5, "removeObject:", CFSTR("trackedFaces"));
        v6 = objc_msgSend(v5, "count");
        if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
          -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
      }
      -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (void)setAppClipCodeMetadataObjectTypeAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (a3 && !-[AVCaptureMetadataOutput isAppClipCodeMetadataSupported](self, "isAppClipCodeMetadataSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (self->_internal->appClipCodeObjectTypeAvailable != v3)
  {
    -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    self->_internal->appClipCodeObjectTypeAvailable = v3;
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
      objc_msgSend(v5, "removeObject:", CFSTR("com.apple.AppClipCode"));
      v6 = objc_msgSend(v5, "count");
      if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
    }
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
  }
}

- (BOOL)isHeadMetadataSupported
{
  AVCaptureConnection *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects());
  v3 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D053C8]) & 1) != 0)
    return 1;
  v4 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  if ((objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D053B0]) & 1) != 0)
    return 1;
  v6 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  return objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D053B8]);
}

- (void)setTextRegionMetadataObjectTypeAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (a3 && !-[AVCaptureMetadataOutput isTextRegionMetadataSupported](self, "isTextRegionMetadataSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (self->_internal->textRegionObjectTypeAvailable != v3)
  {
    -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    self->_internal->textRegionObjectTypeAvailable = v3;
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
      objc_msgSend(v5, "removeObject:", CFSTR("textRegion"));
      v6 = objc_msgSend(v5, "count");
      if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
    }
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
  }
}

- (BOOL)isTextRegionMetadataSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0D053D8]);
}

- (void)setVideoPreviewHistogramMetadataObjectTypesAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (a3
    && !-[AVCaptureMetadataOutput isVideoPreviewHistogramMetadataSupported](self, "isVideoPreviewHistogramMetadataSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable != v3)
  {
    -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable = v3;
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
      objc_msgSend(v5, "removeObject:", CFSTR("videoPreviewHistogram"));
      v6 = objc_msgSend(v5, "count");
      if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
    }
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
  }
}

- (BOOL)isVideoPreviewHistogramMetadataSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0D053F0]);
}

- (BOOL)isAppClipCodeMetadataSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0D053D0]);
}

- (BOOL)isFaceTrackingSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0CA4CC8]);
}

- (NSArray)availableMetadataObjectTypes
{
  return (NSArray *)-[AVCaptureMetadataOutput metadataObjectTypesForMetadataIdentifiers:](self, "metadataObjectTypesForMetadataIdentifiers:", objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"));
}

void __46__AVCaptureMetadataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  _QWORD *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1A1AF16C4]();
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v7)
  {
    v8 = v7;
    if (a2 == -16665)
    {
      objc_msgSend(*(id *)(v7[2] + 8), "releaseRemoteQueueReceiver");
    }
    else if (!a2)
    {
      objc_msgSend(v7, "_handleRemoteQueueOperation:", a3);
    }

  }
  objc_autoreleasePoolPop(v6);
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureMetadataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (AVCaptureMetadataOutput)init
{
  AVCaptureMetadataOutput *v2;
  AVCaptureMetadataOutputInternal *v3;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMetadataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v10, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureMetadataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v3->rectOfInterest.origin.x = 0.0;
      v3->rectOfInterest.origin.y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      v3->rectOfInterest.size = _Q0;
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureMetadataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureMetadataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  AVWeakReference *v5;
  void *MessageReceiver;

  v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)objc_msgSend(MessageReceiver, "copy"));

}

- (void)setMetadataObjectsDelegate:(id)objectsDelegate queue:(dispatch_queue_t)objectsCallbackQueue
{
  dispatch_queue_t v4;
  void *v7;
  uint64_t v8;

  v4 = objectsCallbackQueue;
  if (((objectsCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v4 = 0;
  -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("metadataObjectsDelegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", objectsDelegate, v4, &v8))
  {
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadataObjectsDelegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadataObjectsDelegate"));
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMetadataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (id)metadataObjectsDelegate
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (dispatch_queue_t)metadataObjectsCallbackQueue
{
  return (dispatch_queue_t)-[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- (id)metadataObjectTypesForMetadataIdentifiers:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  AVCaptureMetadataOutputInternal *internal;
  uint64_t v14;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionaryOnceToken != -1)
    dispatch_once(&metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionaryOnceToken, &__block_literal_global_20);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
        internal = self->_internal;
        if (internal->faceTrackingMetadataObjectTypesAvailable && v11 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        else
        {
          v14 = v11;
        }
        if (internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->videoPreviewHistogramMetadataObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->appClipCodeObjectTypeAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->textRegionObjectTypeAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->headObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->humanHandObjectTypeAvailable && v14 == 0)
          v14 = objc_msgSend((id)metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionary, "objectForKeyedSubscript:", v10);
        if (v14)
          objc_msgSend(v5, "addObject:");
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  return v5;
}

id __69__AVCaptureMetadataOutput_metadataObjectTypesForMetadataIdentifiers___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[26];
  _QWORD v26[27];

  v26[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CF2BD0];
  v25[0] = *MEMORY[0x1E0CF2BC8];
  v25[1] = v0;
  v26[0] = CFSTR("face");
  v26[1] = CFSTR("humanBody");
  v1 = *MEMORY[0x1E0CF2BB8];
  v25[2] = CFSTR("mdta/com.apple.quicktime.detected-human-full-body");
  v25[3] = v1;
  v26[2] = CFSTR("humanFullBody");
  v26[3] = CFSTR("catBody");
  v2 = *MEMORY[0x1E0CF2BD8];
  v25[4] = *MEMORY[0x1E0CF2BC0];
  v25[5] = v2;
  v26[4] = CFSTR("dogBody");
  v26[5] = CFSTR("salientObject");
  v25[6] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.UPCE");
  v25[7] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code39");
  v26[6] = CFSTR("org.gs1.UPC-E");
  v26[7] = CFSTR("org.iso.Code39");
  v25[8] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code39Checksum");
  v25[9] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.EAN13");
  v26[8] = CFSTR("org.iso.Code39Mod43");
  v26[9] = CFSTR("org.gs1.EAN-13");
  v25[10] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.EAN8");
  v25[11] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code93");
  v26[10] = CFSTR("org.gs1.EAN-8");
  v26[11] = CFSTR("com.intermec.Code93");
  v25[12] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code128");
  v25[13] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.QR");
  v26[12] = CFSTR("org.iso.Code128");
  v26[13] = CFSTR("org.iso.QRCode");
  v25[14] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.PDF417");
  v25[15] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Aztec");
  v26[14] = CFSTR("org.iso.PDF417");
  v26[15] = CFSTR("org.iso.Aztec");
  v25[16] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.DataMatrix");
  v25[17] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.I2of5");
  v26[16] = CFSTR("org.iso.DataMatrix");
  v26[17] = CFSTR("org.ansi.Interleaved2of5");
  v25[18] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.ITF14");
  v25[19] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Codabar");
  v26[18] = CFSTR("org.gs1.ITF14");
  v26[19] = CFSTR("Codabar");
  v25[20] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBar");
  v25[21] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarExpanded");
  v26[20] = CFSTR("org.gs1.GS1DataBar");
  v26[21] = CFSTR("org.gs1.GS1DataBarExpanded");
  v25[22] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarLimited");
  v25[23] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.MicroQR");
  v26[22] = CFSTR("org.gs1.GS1DataBarLimited");
  v26[23] = CFSTR("org.iso.MicroQR");
  v25[24] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.MicroPDF417");
  v25[25] = CFSTR("mdta/com.apple.quicktime.eye-relief-status");
  v26[24] = CFSTR("org.iso.MicroPDF417");
  v26[25] = CFSTR("EyeReliefStatus");
  metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 26);
  v3 = (id)metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionary;
  v23 = *MEMORY[0x1E0CA4CC8];
  v24 = CFSTR("trackedFaces");
  metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v4 = (id)metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionary;
  v21 = *MEMORY[0x1E0CA4CB8];
  v22 = CFSTR("offlineVideoStabilizationMotion");
  metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v5 = (id)metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionary;
  v19 = CFSTR("mdta/com.apple.quicktime.video-preview-histogram");
  v20 = CFSTR("videoPreviewHistogram");
  metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v6 = (id)metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionary;
  v17 = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.AppClipCode");
  v18 = CFSTR("com.apple.AppClipCode");
  metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v7 = (id)metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionary;
  v15 = CFSTR("mdta/com.apple.quicktime.detected-text-region");
  v16 = CFSTR("textRegion");
  metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (id)metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionary;
  v13[0] = CFSTR("mdta/com.apple.quicktime.detected-human-head");
  v13[1] = CFSTR("mdta/com.apple.quicktime.detected-cat-head");
  v14[0] = CFSTR("humanHead");
  v14[1] = CFSTR("catHead");
  v13[2] = CFSTR("mdta/com.apple.quicktime.detected-dog-head");
  v14[2] = CFSTR("dogHead");
  metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (id)metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionary;
  v11 = CFSTR("mdta/com.apple.quicktime.detected-human-hand");
  v12 = CFSTR("humanHand");
  metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  return (id)metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionary;
}

- (id)metadataIdentifiersForMetadataObjectTypes:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  AVCaptureMetadataOutputInternal *internal;
  uint64_t v14;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionaryOnceToken != -1)
    dispatch_once(&metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionaryOnceToken, &__block_literal_global_106);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
        internal = self->_internal;
        if (internal->faceTrackingMetadataObjectTypesAvailable && v11 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        else
        {
          v14 = v11;
        }
        if (internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->videoPreviewHistogramMetadataObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->appClipCodeObjectTypeAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->textRegionObjectTypeAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->headObjectTypesAvailable && v14 == 0)
        {
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
          internal = self->_internal;
        }
        if (internal->humanHandObjectTypeAvailable && v14 == 0)
          v14 = objc_msgSend((id)metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionary, "objectForKeyedSubscript:", v10);
        if (v14)
          objc_msgSend(v5, "addObject:");
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  return v5;
}

id __69__AVCaptureMetadataOutput_metadataIdentifiersForMetadataObjectTypes___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[26];
  _QWORD v28[27];

  v28[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CF2BC8];
  v27[0] = CFSTR("face");
  v27[1] = CFSTR("humanBody");
  v1 = *MEMORY[0x1E0CF2BD0];
  v28[0] = v0;
  v28[1] = v1;
  v27[2] = CFSTR("humanFullBody");
  v27[3] = CFSTR("catBody");
  v2 = *MEMORY[0x1E0CF2BB8];
  v28[2] = CFSTR("mdta/com.apple.quicktime.detected-human-full-body");
  v28[3] = v2;
  v3 = *MEMORY[0x1E0CF2BC0];
  v27[4] = CFSTR("dogBody");
  v27[5] = CFSTR("salientObject");
  v4 = *MEMORY[0x1E0CF2BD8];
  v28[4] = v3;
  v28[5] = v4;
  v27[6] = CFSTR("org.gs1.UPC-E");
  v27[7] = CFSTR("org.iso.Code39");
  v28[6] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.UPCE");
  v28[7] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code39");
  v27[8] = CFSTR("org.iso.Code39Mod43");
  v27[9] = CFSTR("org.gs1.EAN-13");
  v28[8] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code39Checksum");
  v28[9] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.EAN13");
  v27[10] = CFSTR("org.gs1.EAN-8");
  v27[11] = CFSTR("com.intermec.Code93");
  v28[10] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.EAN8");
  v28[11] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code93");
  v27[12] = CFSTR("org.iso.Code128");
  v27[13] = CFSTR("org.iso.QRCode");
  v28[12] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Code128");
  v28[13] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.QR");
  v27[14] = CFSTR("org.iso.PDF417");
  v27[15] = CFSTR("org.iso.Aztec");
  v28[14] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.PDF417");
  v28[15] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Aztec");
  v27[16] = CFSTR("org.iso.DataMatrix");
  v27[17] = CFSTR("org.ansi.Interleaved2of5");
  v28[16] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.DataMatrix");
  v28[17] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.I2of5");
  v27[18] = CFSTR("org.gs1.ITF14");
  v27[19] = CFSTR("Codabar");
  v28[18] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.ITF14");
  v28[19] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.Codabar");
  v27[20] = CFSTR("org.gs1.GS1DataBar");
  v27[21] = CFSTR("org.gs1.GS1DataBarExpanded");
  v28[20] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBar");
  v28[21] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarExpanded");
  v27[22] = CFSTR("org.gs1.GS1DataBarLimited");
  v27[23] = CFSTR("org.iso.MicroQR");
  v28[22] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarLimited");
  v28[23] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.MicroQR");
  v27[24] = CFSTR("org.iso.MicroPDF417");
  v27[25] = CFSTR("EyeReliefStatus");
  v28[24] = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.MicroPDF417");
  v28[25] = CFSTR("mdta/com.apple.quicktime.eye-relief-status");
  metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 26);
  v5 = (id)metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionary;
  v25 = CFSTR("trackedFaces");
  v26 = *MEMORY[0x1E0CA4CC8];
  metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v6 = (id)metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionary;
  v23 = CFSTR("offlineVideoStabilizationMotion");
  v24 = *MEMORY[0x1E0CA4CB8];
  metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v7 = (id)metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionary;
  v21 = CFSTR("videoPreviewHistogram");
  v22 = CFSTR("mdta/com.apple.quicktime.video-preview-histogram");
  metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v8 = (id)metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionary;
  v19 = CFSTR("com.apple.AppClipCode");
  v20 = CFSTR("mdta/com.apple.quicktime.detected-machine-readable-code.AppClipCode");
  metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v9 = (id)metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionary;
  v17 = CFSTR("textRegion");
  v18 = CFSTR("mdta/com.apple.quicktime.detected-text-region");
  metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (id)metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionary;
  v15[0] = CFSTR("humanHead");
  v15[1] = CFSTR("catHead");
  v16[0] = CFSTR("mdta/com.apple.quicktime.detected-human-head");
  v16[1] = CFSTR("mdta/com.apple.quicktime.detected-cat-head");
  v15[2] = CFSTR("dogHead");
  v16[2] = CFSTR("mdta/com.apple.quicktime.detected-dog-head");
  metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v11 = (id)metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionary;
  v13 = CFSTR("humanHand");
  v14 = CFSTR("mdta/com.apple.quicktime.detected-human-hand");
  metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  return (id)metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionary;
}

- (void)setRectOfInterest:(CGRect)rectOfInterest
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureMetadataOutputInternal *internal;

  height = rectOfInterest.size.height;
  width = rectOfInterest.size.width;
  y = rectOfInterest.origin.y;
  x = rectOfInterest.origin.x;
  if (!CGRectEqualToRect(self->_internal->rectOfInterest, rectOfInterest))
  {
    internal = self->_internal;
    internal->rectOfInterest.origin.x = x;
    internal->rectOfInterest.origin.y = y;
    internal->rectOfInterest.size.width = width;
    internal->rectOfInterest.size.height = height;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = AVMediaTypeForMetadataObjects();
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)isFaceTrackingMetadataObjectTypesAvailable
{
  return self->_internal->faceTrackingMetadataObjectTypesAvailable;
}

- (void)setFaceTrackingMaxFaces:(int64_t)a3
{
  AVCaptureMetadataOutputInternal *internal;
  void *v6;

  if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    internal = self->_internal;
    if (internal->faceTrackingMaxFaces != a3)
    {
      internal->faceTrackingMaxFaces = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureMetadataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    internal = self->_internal;
    if (internal->faceTrackingUsesFaceRecognition != v3)
    {
      internal->faceTrackingUsesFaceRecognition = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureMetadataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    internal = self->_internal;
    if (internal->faceTrackingPlusEnabled != v3)
    {
      internal->faceTrackingPlusEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3
{
  AVCaptureMetadataOutputInternal *internal;
  void *v6;

  if (-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    internal = self->_internal;
    if (internal->faceTrackingNetworkFailureThresholdMultiplier != a3)
    {
      internal->faceTrackingNetworkFailureThresholdMultiplier = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AVCaptureMetadataOutputInternal *internal;

  if (!-[AVCaptureMetadataOutput isFaceTrackingSupported](self, "isFaceTrackingSupported"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    goto LABEL_8;
  }
  v5 = a3 >= 0.0;
  if (a3 > 1.0)
    v5 = 0;
  if (a3 != -1.0 && !v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
LABEL_8:
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    return;
  }
  internal = self->_internal;
  if (internal->faceTrackingFailureFieldOfViewModifier != a3)
  {
    internal->faceTrackingFailureFieldOfViewModifier = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (float)faceTrackingFailureFieldOfViewModifier
{
  return self->_internal->faceTrackingFailureFieldOfViewModifier;
}

- (BOOL)isAttentionDetectionSupported
{
  return objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "isAttentionDetectionSupported");
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureMetadataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3 && !-[AVCaptureMetadataOutput isAttentionDetectionSupported](self, "isAttentionDetectionSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->attentionDetectionEnabled != v3)
    {
      internal->attentionDetectionEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isOfflineVideoStabilizationMotionMetadataSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0CA4CB8]);
}

- (BOOL)isOfflineVideoStabilizationMotionMetadataObjectTypesAvailable
{
  return self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable;
}

- (void)setOfflineVideoStabilizationMotionMetadataObjectTypesAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[AVCaptureMetadataOutput isOfflineVideoStabilizationMotionMetadataSupported](self, "isOfflineVideoStabilizationMotionMetadataSupported"))
  {
    if (self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable != v3)
    {
      -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
      self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable = v3;
      if (!v3)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
        objc_msgSend(v5, "removeObject:", CFSTR("offlineVideoStabilizationMotion"));
        v6 = objc_msgSend(v5, "count");
        if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
          -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
      }
      -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (BOOL)isVideoPreviewHistogramMetadataObjectTypesAvailable
{
  return self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable;
}

- (BOOL)isAppClipCodeMetadataObjectTypeAvailable
{
  return self->_internal->appClipCodeObjectTypeAvailable;
}

- (BOOL)isTextRegionMetadataObjectTypeAvailable
{
  return self->_internal->textRegionObjectTypeAvailable;
}

- (BOOL)isHeadMetadataObjectTypesAvailable
{
  return self->_internal->headObjectTypesAvailable;
}

- (void)setHeadMetadataObjectTypesAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v3 = a3;
  v8[3] = *MEMORY[0x1E0C80C00];
  if (a3 && !-[AVCaptureMetadataOutput isHeadMetadataSupported](self, "isHeadMetadataSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (self->_internal->headObjectTypesAvailable != v3)
  {
    -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    self->_internal->headObjectTypesAvailable = v3;
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
      v8[0] = CFSTR("humanHead");
      v8[1] = CFSTR("catHead");
      v8[2] = CFSTR("dogHead");
      objc_msgSend(v5, "removeObjectsInArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3));
      v6 = objc_msgSend(v5, "count");
      if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
    }
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
  }
}

- (BOOL)isHumanHandMetadataSupported
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers"), "containsObject:", *MEMORY[0x1E0D053C0]);
}

- (BOOL)isHumanHandMetadataObjectTypeAvailable
{
  return self->_internal->humanHandObjectTypeAvailable;
}

- (void)setHumanHandMetadataObjectTypeAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (a3 && !-[AVCaptureMetadataOutput isHumanHandMetadataSupported](self, "isHumanHandMetadataSupported"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (self->_internal->humanHandObjectTypeAvailable != v3)
  {
    -[AVCaptureMetadataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
    self->_internal->humanHandObjectTypeAvailable = v3;
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjectTypes);
      objc_msgSend(v5, "removeObject:", CFSTR("humanHand"));
      v6 = objc_msgSend(v5, "count");
      if (v6 != -[NSArray count](self->_internal->metadataObjectTypes, "count"))
        -[AVCaptureMetadataOutput setMetadataObjectTypes:](self, "setMetadataObjectTypes:", v5);
    }
    -[AVCaptureMetadataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableMetadataObjectTypes"));
  }
}

+ (id)_metadataConstantValueToName:(id)a3
{
  id result;

  if (_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionaryOnceToken != -1)
    dispatch_once(&_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionaryOnceToken, &__block_literal_global_127);
  result = (id)objc_msgSend((id)_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionary, "objectForKeyedSubscript:", a3);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not mapped! Please file a radar against %s"), a3, AVCaptureGetFrameworkRadarComponentName());
  return result;
}

id __56__AVCaptureMetadataOutput__metadataConstantValueToName___block_invoke()
{
  _QWORD v1[29];
  _QWORD v2[30];

  v2[29] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("face");
  v1[1] = CFSTR("humanHead");
  v2[0] = CFSTR("AVMetadataObjectTypeFace");
  v2[1] = CFSTR("AVMetadataObjectTypeHumanHead");
  v1[2] = CFSTR("humanBody");
  v1[3] = CFSTR("humanFullBody");
  v2[2] = CFSTR("AVMetadataObjectTypeHumanBody");
  v2[3] = CFSTR("AVMetadataObjectTypeHumanFullBody");
  v1[4] = CFSTR("humanHand");
  v1[5] = CFSTR("dogHead");
  v2[4] = CFSTR("AVMetadataObjectTypeHumanHand");
  v2[5] = CFSTR("AVMetadataObjectTypeDogHead");
  v1[6] = CFSTR("dogBody");
  v1[7] = CFSTR("catHead");
  v2[6] = CFSTR("AVMetadataObjectTypeDogBody");
  v2[7] = CFSTR("AVMetadataObjectTypeCatHead");
  v1[8] = CFSTR("catBody");
  v1[9] = CFSTR("salientObject");
  v2[8] = CFSTR("AVMetadataObjectTypeCatBody");
  v2[9] = CFSTR("AVMetadataObjectTypeSalientObject");
  v1[10] = CFSTR("saliencyHeatMap");
  v1[11] = CFSTR("trackedFaces");
  v2[10] = CFSTR("AVMetadataObjectTypeSaliencyHeatMap");
  v2[11] = CFSTR("AVMetadataObjectTypeTrackedFaces");
  v1[12] = CFSTR("org.gs1.UPC-E");
  v1[13] = CFSTR("org.iso.Code39");
  v2[12] = CFSTR("AVMetadataObjectTypeUPCECode");
  v2[13] = CFSTR("AVMetadataObjectTypeCode39Code");
  v1[14] = CFSTR("org.iso.Code39Mod43");
  v1[15] = CFSTR("org.gs1.EAN-13");
  v2[14] = CFSTR("AVMetadataObjectTypeCode39Mod43Code");
  v2[15] = CFSTR("AVMetadataObjectTypeEAN13Code");
  v1[16] = CFSTR("org.gs1.EAN-8");
  v1[17] = CFSTR("com.intermec.Code93");
  v2[16] = CFSTR("AVMetadataObjectTypeEAN8Code");
  v2[17] = CFSTR("AVMetadataObjectTypeCode93Code");
  v1[18] = CFSTR("org.iso.Code128");
  v1[19] = CFSTR("org.iso.QRCode");
  v2[18] = CFSTR("AVMetadataObjectTypeCode128Code");
  v2[19] = CFSTR("AVMetadataObjectTypeQRCode");
  v1[20] = CFSTR("org.iso.PDF417");
  v1[21] = CFSTR("org.iso.Aztec");
  v2[20] = CFSTR("AVMetadataObjectTypePDF417Code");
  v2[21] = CFSTR("AVMetadataObjectTypeAztecCode");
  v1[22] = CFSTR("org.iso.DataMatrix");
  v1[23] = CFSTR("org.ansi.Interleaved2of5");
  v2[22] = CFSTR("AVMetadataObjectTypeDataMatrixCode");
  v2[23] = CFSTR("AVMetadataObjectTypeInterleaved2of5Code");
  v1[24] = CFSTR("org.gs1.ITF14");
  v1[25] = CFSTR("offlineVideoStabilizationMotion");
  v2[24] = CFSTR("AVMetadataObjectTypeITF14Code");
  v2[25] = CFSTR("AVMetadataObjectTypeOfflineVideoStabilizationMotion");
  v1[26] = CFSTR("videoPreviewHistogram");
  v1[27] = CFSTR("com.apple.AppClipCode");
  v2[26] = CFSTR("AVMetadataObjectTypeVideoPreviewHistogram");
  v2[27] = CFSTR("AVMetadataObjectTypeAppClipCode");
  v1[28] = CFSTR("textRegion");
  v2[28] = CFSTR("AVMetadataObjectTypeTextRegion");
  _metadataConstantValueToName__sMetadataConstantToMetadataNameDictionary = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 29);
  return (id)_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionary;
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mdo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mdo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureMetadataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AVCaptureMetadataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __45__AVCaptureMetadataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  int v8;

  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v5)
  {
    v6 = v5;
    v7 = *a2;
    v8 = *((_DWORD *)a2 + 4);
    objc_msgSend(v5, "_handleLocalQueueMessage:", &v7);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureMetadataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (id)delegateOverride
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_internal->delegateCallbackHelper, "delegateOverride");
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverrideCallbackQueue](self->_internal->delegateCallbackHelper, "delegateOverrideCallbackQueue");
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;

  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v7 = 0;
  else
    v7 = a4;
  v9 = 0;
  if (!-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, v7, &v9))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

@end
