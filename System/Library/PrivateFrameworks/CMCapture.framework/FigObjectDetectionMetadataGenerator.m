@implementation FigObjectDetectionMetadataGenerator

+ (void)initialize
{
  objc_opt_class();
}

- (FigObjectDetectionMetadataGenerator)init
{
  FigObjectDetectionMetadataGenerator *v2;
  FigObjectDetectionMetadataGenerator *v3;
  NSObject *v4;
  NSObject *global_queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigObjectDetectionMetadataGenerator;
  v2 = -[FigObjectDetectionMetadataGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v3->_detectObjectQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("FigObjectDetectionMetadataGenerator.DetectObject", v4, global_queue);
    v3->_prepared = 0;
    v3->_objectDetectionHostTime = 0;
    *(_QWORD *)&v3->_objectDetectionInterval = 0x3F99999A00000019;
    v3->_previousDetectionsThreshold = 500;
    v3->_objectDetectionIsRunning = 0;
    v3->_objectMetadataDictionary = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_prepared)
  {
    -[VNSession releaseCachedResources](self->_vnSession, "releaseCachedResources");

    self->_vnSession = 0;
    self->_objectTrackingMatcher = 0;
  }

  self->_detectObjectQueue = 0;
  self->_objectMetadataDictionary = 0;

  self->_figFaceObservations = 0;
  self->_figHumanBodyObservations = 0;
  v3.receiver = self;
  v3.super_class = (Class)FigObjectDetectionMetadataGenerator;
  -[FigObjectDetectionMetadataGenerator dealloc](&v3, sel_dealloc);
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (void)setMaxHumanFaces:(unsigned int)a3
{
  self->_maxHumanFaces = a3;
}

- (unsigned)maxHumanFaces
{
  return self->_maxHumanFaces;
}

- (void)setHumanFaceEyeDetectionEnabled:(BOOL)a3
{
  self->_humanFaceEyeDetectionEnabled = a3;
}

- (BOOL)humanFaceEyeDetectionEnabled
{
  return self->_humanFaceEyeDetectionEnabled;
}

- (void)setHumanFaceSmileDetectionEnabled:(BOOL)a3
{
  self->_humanFaceSmileDetectionEnabled = a3;
}

- (BOOL)humanFaceSmileDetectionEnabled
{
  return self->_humanFaceSmileDetectionEnabled;
}

- (void)setHumanFaceBlinkDetectionEnabled:(BOOL)a3
{
  self->_humanFaceBlinkDetectionEnabled = a3;
}

- (BOOL)humanFaceBlinkDetectionEnabled
{
  return self->_humanFaceEyeDetectionEnabled;
}

- (void)setMaxHumanBodies:(unsigned int)a3
{
  self->_maxHumanBodies = a3;
}

- (void)setMaxHumanHeads:(unsigned int)a3
{
  self->_maxHumanHeads = a3;
}

- (unsigned)maxHumanHeads
{
  return self->_maxHumanHeads;
}

- (unsigned)maxHumanBodies
{
  return self->_maxHumanBodies;
}

- (void)setMaxHumanFullBodies:(unsigned int)a3
{
  self->_maxHumanFullBodies = a3;
}

- (unsigned)maxHumanFullBodies
{
  return self->_maxHumanFullBodies;
}

- (void)setMaxDogBodies:(unsigned int)a3
{
  self->_maxDogBodies = a3;
}

- (unsigned)maxDogBodies
{
  return self->_maxDogBodies;
}

- (void)setMaxDogHeads:(unsigned int)a3
{
  self->_maxDogHeads = a3;
}

- (unsigned)maxDogHeads
{
  return self->_maxDogHeads;
}

- (void)setMaxCatBodies:(unsigned int)a3
{
  self->_maxCatBodies = a3;
}

- (unsigned)maxCatBodies
{
  return self->_maxCatBodies;
}

- (void)setMaxCatHeads:(unsigned int)a3
{
  self->_maxCatHeads = a3;
}

- (unsigned)maxCatHeads
{
  return self->_maxCatHeads;
}

- (void)setMaxSalientObjects:(unsigned int)a3
{
  self->_maxSalientObjects = a3;
}

- (unsigned)maxSalientObjects
{
  return self->_maxSalientObjects;
}

- (void)setMaxSportsBalls:(unsigned int)a3
{
  self->_maxSportsBalls = a3;
}

- (unsigned)maxSportsBalls
{
  return self->_maxSportsBalls;
}

- (void)prepareForVideoFormat:(opaqueCMFormatDescription *)a3
{
  id v4;
  NSObject *detectObjectQueue;
  _QWORD block[5];

  if (!self->_prepared)
  {
    v4 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", self);
    detectObjectQueue = self->_detectObjectQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FigObjectDetectionMetadataGenerator_prepareForVideoFormat___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = v4;
    dispatch_sync(detectObjectQueue, block);
    self->_prepared = 1;
  }
}

_QWORD *__61__FigObjectDetectionMetadataGenerator_prepareForVideoFormat___block_invoke(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v2;

  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
  {
    v2 = result;
    if (!result[21])
    {
      result = objc_alloc_init((Class)getVNSessionClass());
      v2[21] = result;
    }
    if (!v2[26])
    {
      result = (_QWORD *)objc_msgSend(objc_alloc((Class)getFTBipartiteMatcherClass()), "initWithInitialSize:", 10);
      v2[26] = result;
    }
    if (!v2[22])
    {
      result = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2[22] = result;
    }
    if (!v2[23])
    {
      result = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2[23] = result;
    }
    v2[24] = 0;
    v2[25] = 0;
  }
  return result;
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  id v9;
  CMTime v10;
  CMTime v11;
  CVImageBufferRef ImageBuffer;

  if (self->_prepared)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = self->_maxHumanFaces | self->_maxHumanBodies;
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      memset(&v11, 0, sizeof(v11));
      CMSampleBufferGetPresentationTimeStamp(&v11, a3);
      v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (!v8)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        CMSetAttachment(a3, v7, v8, 1u);
      }
      v10 = v11;
      v9 = -[FigObjectDetectionMetadataGenerator getDetectedObjectsForPixelBuffer:pts:](self, "getDetectedObjectsForPixelBuffer:pts:", &ImageBuffer, &v10);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D069A0]);
    }
  }
}

- (void)processPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4
{
  unsigned int maxHumanFaces;
  unsigned int maxHumanBodies;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  if (a3 && self->_prepared && (a4->var2 & 1) != 0)
  {
    maxHumanFaces = self->_maxHumanFaces;
    maxHumanBodies = self->_maxHumanBodies;
    if (maxHumanFaces | maxHumanBodies)
    {
      v6 = *a4;
      -[FigObjectDetectionMetadataGenerator _detectObjectsWithPixelBufferInOut:time:faceDetectionEnabled:humanBodyDetectionEnabled:]((uint64_t)self, a3, (__int128 *)&v6.var0, maxHumanFaces != 0, maxHumanBodies != 0);
    }
  }
}

- (void)_detectObjectsWithPixelBufferInOut:(__int128 *)a3 time:(char)a4 faceDetectionEnabled:(char)a5 humanBodyDetectionEnabled:
{
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  BOOL v18;
  id v19;
  NSObject *v20;
  _QWORD v21[6];
  __int128 v22;
  uint64_t v23;
  char v24;
  char v25;

  if (a1)
  {
    v10 = mach_absolute_time();
    if (!*(_BYTE *)(a1 + 124))
    {
      v14 = *(_QWORD *)(a1 + 104);
      v15 = FODMGTimeInMilliseconds(v10 - v14, v11, v12, v13);
      LODWORD(v16) = *(_DWORD *)(a1 + 112);
      v18 = v15 <= (double)v16 && v14 != 0;
      if (a2)
      {
        if (!v18)
        {
          CFRetain(a2);
          *(_BYTE *)(a1 + 124) = 1;
          v19 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a1);
          v20 = *(NSObject **)(a1 + 88);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __126__FigObjectDetectionMetadataGenerator__detectObjectsWithPixelBufferInOut_time_faceDetectionEnabled_humanBodyDetectionEnabled___block_invoke;
          v21[3] = &unk_1E4925728;
          v24 = a4;
          v25 = a5;
          v21[4] = v19;
          v21[5] = a2;
          v22 = *a3;
          v23 = *((_QWORD *)a3 + 2);
          dispatch_async(v20, v21);
          *(_QWORD *)(a1 + 104) = mach_absolute_time();
        }
      }
    }
  }
}

- (id)getCurrentDetectedObjectsAndPTS:(id *)a3
{
  void *v5;
  __int128 v6;

  if (self->_prepared && (self->_maxHumanFaces || self->_maxHumanBodies))
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_objectMetadataDictionary, 1);
    if (a3)
    {
      v6 = *(_OWORD *)&self->_objectMetadataDictionaryPTS.value;
      a3->var3 = self->_objectMetadataDictionaryPTS.epoch;
      *(_OWORD *)&a3->var0 = v6;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getDetectedObjectsForPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4
{
  __CVBuffer *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  if (a3)
  {
    v5 = *a3;
    v7 = *a4;
    -[FigObjectDetectionMetadataGenerator processPixelBuffer:pts:](self, "processPixelBuffer:pts:", v5, &v7);
  }
  return -[FigObjectDetectionMetadataGenerator getCurrentDetectedObjectsAndPTS:](self, "getCurrentDetectedObjectsAndPTS:", 0, a4);
}

- (void)unprepare
{
  id v3;
  NSObject *detectObjectQueue;
  _QWORD block[5];

  if (self->_prepared)
  {
    v3 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", self);
    detectObjectQueue = self->_detectObjectQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__FigObjectDetectionMetadataGenerator_unprepare__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = v3;
    dispatch_sync(detectObjectQueue, block);
    self->_prepared = 0;
  }
}

void __48__FigObjectDetectionMetadataGenerator_unprepare__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  v1 = (os_unfair_lock_s *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v1)
  {
    v2 = v1;
    v3 = v1 + 21;
    os_unfair_lock_lock(v1 + 21);

    *(_QWORD *)&v2[32]._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v2[44]._os_unfair_lock_opaque = 0;

    *(_QWORD *)&v2[46]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v3);
    *(_QWORD *)&v2[26]._os_unfair_lock_opaque = 0;
    objc_msgSend(*(id *)&v2[42]._os_unfair_lock_opaque, "releaseCachedResources");

    *(_QWORD *)&v2[42]._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v2[52]._os_unfair_lock_opaque = 0;
  }
}

- (void)_processFaceObservations:(CMTime *)a3 time:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  float v28;
  uint64_t i;
  void *v30;
  float v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  void *v42;
  CFDictionaryRef DictionaryRepresentation;
  float v44;
  double v45;
  int v46;
  int v47;
  float v48;
  double v49;
  int v50;
  signed int v51;
  float v52;
  double v53;
  int v54;
  int v55;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CMTime time;
  CMTime v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((a3->flags & 0x1D) == 1)
  {
    memset(&v76, 0, sizeof(v76));
    time = *a3;
    CMTimeConvertScale(&v76, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v5 = FigNanosecondsToHostTime();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D06F20]);
  v65 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v7)
  {
    v8 = v7;
    v57 = v4;
    v9 = *(_QWORD *)v72;
    v64 = *MEMORY[0x1E0D06A48];
    v63 = *MEMORY[0x1E0D06D58];
    v62 = *MEMORY[0x1E0D06958];
    v61 = *MEMORY[0x1E0D06890];
    v60 = *MEMORY[0x1E0D06888];
    v59 = *MEMORY[0x1E0D06880];
    do
    {
      v10 = 0;
      v58 = v8;
      do
      {
        if (*(_QWORD *)v72 != v9)
          objc_enumerationMutation(a2);
        v11 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v10);
        if ((objc_msgSend((id)objc_msgSend(v11, "faceTrackingRequest"), "isLastFrame") & 1) == 0)
        {
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v65, "addObject:", v12);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "faceID")), v64);
          v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "faceTrackingRequest"), "results");
          if (v13)
          {
            v14 = v13;
            v15 = v9;
            objc_msgSend((id)objc_msgSend(v13, "firstObject"), "boundingBox");
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v24 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
            if (v24)
            {
              v25 = v24;
              v26 = 0;
              v27 = *(_QWORD *)v68;
              v28 = 0.0;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v68 != v27)
                    objc_enumerationMutation(v14);
                  v30 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                  objc_msgSend(v30, "confidence");
                  if (v31 > v28)
                  {
                    objc_msgSend(v30, "confidence");
                    v28 = v32;
                    objc_msgSend(v30, "boundingBox");
                    v17 = v33;
                    v19 = v34;
                    v21 = v35;
                    v23 = v36;
                    v26 = v30;
                  }
                }
                v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
              }
              while (v25);
            }
            else
            {
              v26 = 0;
              v28 = 0.0;
            }
            v42 = (void *)objc_msgSend(v11, "faceTrackingRequest");
            if (v28 <= 0.3)
              objc_msgSend(v42, "setLastFrame:", 1);
            else
              objc_msgSend(v42, "setInputObservation:", v26);
            v9 = v15;
            v8 = v58;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "boundingBox");
            v17 = v37;
            v19 = v38;
            v21 = v39;
            v23 = v40;
            objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "confidence");
            v28 = v41;
          }
          v80.origin.y = 1.0 - (v23 + v19);
          v80.origin.x = v17;
          v80.size.width = v21;
          v80.size.height = v23;
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v80);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", CFAutorelease(DictionaryRepresentation), v63);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(float)(v28 * 1000.0)), v62);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "yaw"), "floatValue");
          v45 = (float)(v44 * 180.0) / 3.14159265;
          v46 = (int)v45;
          v47 = -(int)v45;
          if ((int)v45 > -360)
          {
            if (v46 > 0)
              v47 = 360 - v46;
          }
          else
          {
            v47 %= 0x168u;
          }
          *(float *)&v45 = (float)v47;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45), v61);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "roll"), "floatValue");
          v49 = (float)(v48 * 180.0) / 3.14159265 + -180.0;
          v50 = (int)v49;
          if ((int)v49 < 360)
            v51 = v50 + (v50 < 0 ? 0x168 : 0);
          else
            v51 = v50 % 0x168u;
          *(float *)&v49 = (float)v51;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49), v60);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "faceObservation"), "pitch"), "floatValue");
          v53 = (float)(v52 * 180.0) / 3.14159265;
          v54 = (int)v53;
          v55 = -(int)v53;
          if ((int)v53 > -360)
          {
            if (v54 > 0)
              v55 = 360 - v54;
          }
          else
          {
            v55 %= 0x168u;
          }
          *(float *)&v53 = (float)v55;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53), v59);
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v8);
    return v57;
  }
  return v4;
}

- (void)_processHumanObservations:(CMTime *)a3 time:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  float v27;
  uint64_t j;
  void *v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  void *v41;
  CFDictionaryRef DictionaryRepresentation;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CMTime time;
  CMTime v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((a3->flags & 0x1D) == 1)
  {
    memset(&v60, 0, sizeof(v60));
    time = *a3;
    CMTimeConvertScale(&v60, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v5 = FigNanosecondsToHostTime();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D06F20]);
  v49 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v7)
  {
    v8 = v7;
    v44 = v4;
    v9 = *(_QWORD *)v56;
    v48 = *MEMORY[0x1E0D06460];
    v46 = *MEMORY[0x1E0D06958];
    v47 = *MEMORY[0x1E0D06D58];
    v45 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(a2);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v11, "humanTrackingRequest"), "isLastFrame") & 1) == 0)
        {
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v49, "addObject:", v12);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "humanBodyID")), v48);
          v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "humanTrackingRequest"), "results");
          if (v13)
          {
            v14 = v13;
            objc_msgSend((id)objc_msgSend(v13, "firstObject"), "boundingBox");
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v23 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            if (v23)
            {
              v24 = v23;
              v25 = 0;
              v26 = *(_QWORD *)v52;
              v27 = 0.0;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v52 != v26)
                    objc_enumerationMutation(v14);
                  v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                  objc_msgSend(v29, "confidence");
                  if (v30 > v27)
                  {
                    objc_msgSend(v29, "confidence");
                    v27 = v31;
                    objc_msgSend(v29, "boundingBox");
                    v16 = v32;
                    v18 = v33;
                    v20 = v34;
                    v22 = v35;
                    v25 = v29;
                  }
                }
                v24 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
              }
              while (v24);
            }
            else
            {
              v25 = 0;
              v27 = 0.0;
            }
            v41 = (void *)objc_msgSend(v11, "humanTrackingRequest");
            if (v27 <= 0.3)
              objc_msgSend(v41, "setLastFrame:", 1);
            else
              objc_msgSend(v41, "setInputObservation:", v25);
            v9 = v45;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v11, "humanObservation"), "boundingBox");
            v16 = v36;
            v18 = v37;
            v20 = v38;
            v22 = v39;
            objc_msgSend((id)objc_msgSend(v11, "humanObservation"), "confidence");
            v27 = v40;
          }
          v64.origin.y = 1.0 - (v22 + v18);
          v64.origin.x = v16;
          v64.size.width = v20;
          v64.size.height = v22;
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v64);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", CFAutorelease(DictionaryRepresentation), v47);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(float)(v27 * 1000.0)), v46);
        }
      }
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v8);
    return v44;
  }
  return v4;
}

- (void)_compareHumanBodyDetections:(void *)a3 currentHumanDetections:(uint64_t)a4 time:
{
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MidY;
  double MidX;
  CGFloat v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  FigHumanBodyObservation *v42;
  uint64_t v43;
  FigHumanBodyObservation *v44;
  uint64_t v45;
  FigHumanBodyObservation *v46;
  uint64_t v47;
  FigHumanBodyObservation *v48;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  double height;
  CGFloat width;
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v52 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_msgSend(a2, "count");
  v9 = objc_msgSend(a3, "count");
  if (v9)
  {
    v10 = v9;
    v50 = (uint64_t)&v50;
    v51 = v7;
    v11 = (char *)&v50 - ((4 * v9 * v8 + 19) & 0xFFFFFFFFFFFFFFF0);
    v12 = 0;
    v13 = 0;
    do
    {
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", i, v50), "humanObservation"), "boundingBox");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "boundingBox");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v56.origin.x = v16;
          v56.origin.y = v18;
          v56.size.width = v20;
          v56.size.height = v22;
          v64.origin.x = v24;
          v64.origin.y = v26;
          v64.size.width = v28;
          v64.size.height = v30;
          v57 = CGRectIntersection(v56, v64);
          v58 = CGRectStandardize(v57);
          height = v58.size.height;
          width = v58.size.width;
          v58.origin.x = v16;
          v58.origin.y = v18;
          v58.size.width = v20;
          v58.size.height = v22;
          v65.origin.x = v24;
          v65.origin.y = v26;
          v65.size.width = v28;
          v65.size.height = v30;
          v59 = CGRectUnion(v58, v65);
          v60 = CGRectStandardize(v59);
          *(float *)&v60.origin.x = 1.0 - width * height / (v60.size.width * v60.size.height);
          LODWORD(width) = LODWORD(v60.origin.x);
          v60.origin.x = v24;
          v60.origin.y = v26;
          v60.size.width = v28;
          v60.size.height = v30;
          height = CGRectGetMidX(v60);
          v61.origin.x = v24;
          v61.origin.y = v26;
          v61.size.width = v28;
          v61.size.height = v30;
          MidY = CGRectGetMidY(v61);
          v62.origin.x = v16;
          v62.origin.y = v18;
          v62.size.width = v20;
          v62.size.height = v22;
          MidX = CGRectGetMidX(v62);
          v63.origin.x = v16;
          v63.origin.y = v18;
          v63.size.width = v20;
          v63.size.height = v22;
          v33 = CGRectGetMidY(v63);
          v34 = MidX - height;
          v35 = v33 - MidY;
          *(float *)&v11[4 * v13 + 4 * i] = hypotf(v34, v35) + *(float *)&width;
        }
        v13 += i;
      }
      ++v12;
    }
    while (v12 != v10);
    v36 = *(void **)(a1 + 208);
    width = *(double *)&v11;
    v37 = (void *)objc_msgSend(v36, "computeMatchingForCostMatrix:withRowCount:columnCount:", v11, v10, v8);
    objc_msgSend(v37, "count");
    v38 = 0;
    v39 = 0;
    v7 = v51;
    do
    {
      v40 = objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", v39, v50), "integerValue");
      if (v40 == -1 || v40 < v8)
      {
        if (v40 == -1 || *(float *)(*(_QWORD *)&width + 4 * (v40 + v38)) > *(float *)(a1 + 116))
        {
          v42 = [FigHumanBodyObservation alloc];
          v43 = objc_msgSend(a3, "objectAtIndexedSubscript:", v39);
          v44 = -[FigHumanBodyObservation initWithHumanObservation:humanBodyID:time:](v42, "initWithHumanObservation:humanBodyID:time:", v43, (*(_QWORD *)(a1 + 200))++, v52);
        }
        else
        {
          v45 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v40), "humanBodyID");
          v46 = [FigHumanBodyObservation alloc];
          v47 = objc_msgSend(a3, "objectAtIndexedSubscript:", v39);
          v48 = v46;
          v7 = v51;
          v44 = -[FigHumanBodyObservation initWithHumanObservation:humanBodyID:time:](v48, "initWithHumanObservation:humanBodyID:time:", v47, v45, v52);
        }
        objc_msgSend(v7, "addObject:", v44);

      }
      ++v39;
      v38 += v8;
    }
    while (v10 != v39);
  }
  return v7;
}

- (void)_compareFaceDetections:(void *)a3 currentFaceDetections:(uint64_t)a4 time:
{
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MidY;
  double MidX;
  CGFloat v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  FigFaceObservation *v42;
  uint64_t v43;
  FigFaceObservation *v44;
  uint64_t v45;
  FigFaceObservation *v46;
  uint64_t v47;
  FigFaceObservation *v48;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  double height;
  CGFloat width;
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v52 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_msgSend(a2, "count");
  v9 = objc_msgSend(a3, "count");
  if (v9)
  {
    v10 = v9;
    v50 = (uint64_t)&v50;
    v51 = v7;
    v11 = (char *)&v50 - ((4 * v9 * v8 + 19) & 0xFFFFFFFFFFFFFFF0);
    v12 = 0;
    v13 = 0;
    do
    {
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", i, v50), "faceObservation"), "boundingBox");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "boundingBox");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v56.origin.x = v16;
          v56.origin.y = v18;
          v56.size.width = v20;
          v56.size.height = v22;
          v64.origin.x = v24;
          v64.origin.y = v26;
          v64.size.width = v28;
          v64.size.height = v30;
          v57 = CGRectIntersection(v56, v64);
          v58 = CGRectStandardize(v57);
          height = v58.size.height;
          width = v58.size.width;
          v58.origin.x = v16;
          v58.origin.y = v18;
          v58.size.width = v20;
          v58.size.height = v22;
          v65.origin.x = v24;
          v65.origin.y = v26;
          v65.size.width = v28;
          v65.size.height = v30;
          v59 = CGRectUnion(v58, v65);
          v60 = CGRectStandardize(v59);
          *(float *)&v60.origin.x = 1.0 - width * height / (v60.size.width * v60.size.height);
          LODWORD(width) = LODWORD(v60.origin.x);
          v60.origin.x = v24;
          v60.origin.y = v26;
          v60.size.width = v28;
          v60.size.height = v30;
          height = CGRectGetMidX(v60);
          v61.origin.x = v24;
          v61.origin.y = v26;
          v61.size.width = v28;
          v61.size.height = v30;
          MidY = CGRectGetMidY(v61);
          v62.origin.x = v16;
          v62.origin.y = v18;
          v62.size.width = v20;
          v62.size.height = v22;
          MidX = CGRectGetMidX(v62);
          v63.origin.x = v16;
          v63.origin.y = v18;
          v63.size.width = v20;
          v63.size.height = v22;
          v33 = CGRectGetMidY(v63);
          v34 = MidX - height;
          v35 = v33 - MidY;
          *(float *)&v11[4 * v13 + 4 * i] = hypotf(v34, v35) + *(float *)&width;
        }
        v13 += i;
      }
      ++v12;
    }
    while (v12 != v10);
    v36 = *(void **)(a1 + 208);
    width = *(double *)&v11;
    v37 = (void *)objc_msgSend(v36, "computeMatchingForCostMatrix:withRowCount:columnCount:", v11, v10, v8);
    objc_msgSend(v37, "count");
    v38 = 0;
    v39 = 0;
    v7 = v51;
    do
    {
      v40 = objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", v39, v50), "integerValue");
      if (v40 == -1 || v40 < v8)
      {
        if (v40 == -1 || *(float *)(*(_QWORD *)&width + 4 * (v40 + v38)) > *(float *)(a1 + 116))
        {
          v42 = [FigFaceObservation alloc];
          v43 = objc_msgSend(a3, "objectAtIndexedSubscript:", v39);
          v44 = -[FigFaceObservation initWithFaceObservation:faceID:time:](v42, "initWithFaceObservation:faceID:time:", v43, (*(_QWORD *)(a1 + 192))++, v52);
        }
        else
        {
          v45 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v40), "faceID");
          v46 = [FigFaceObservation alloc];
          v47 = objc_msgSend(a3, "objectAtIndexedSubscript:", v39);
          v48 = v46;
          v7 = v51;
          v44 = -[FigFaceObservation initWithFaceObservation:faceID:time:](v48, "initWithFaceObservation:faceID:time:", v47, v45, v52);
        }
        objc_msgSend(v7, "addObject:", v44);

      }
      ++v39;
      v38 += v8;
    }
    while (v10 != v39);
  }
  return v7;
}

void __126__FigObjectDetectionMetadataGenerator__detectObjectsWithPixelBufferInOut_time_faceDetectionEnabled_humanBodyDetectionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  CMTime v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v2)
  {
    v3 = v2;
    v53 = 0;
    v4 = mach_absolute_time();
    v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v6 = *(void **)(v3 + 176);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "lastUpdatedTime");
          v16 = FODMGTimeInMilliseconds(v4 - v12, v13, v14, v15);
          LODWORD(v17) = *(_DWORD *)(v3 + 120);
          if (v16 > (double)v17)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(v3 + 176), "removeObjectsInArray:", v5);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = *(void **)(v3 + 184);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "lastUpdatedTime");
          v29 = FODMGTimeInMilliseconds(v4 - v25, v26, v27, v28);
          LODWORD(v30) = *(_DWORD *)(v3 + 120);
          if (v29 > (double)v30)
            objc_msgSend(v18, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v21);
    }
    objc_msgSend(*(id *)(v3 + 184), "removeObjectsInArray:", v18);
    if (*(_BYTE *)(a1 + 72))
    {
      v31 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
      objc_msgSend(v31, "setRevision:error:", 3737841670, 0);
      objc_msgSend(v43, "addObject:", v31);
    }
    else
    {
      v31 = 0;
    }
    if (*(_BYTE *)(a1 + 73))
    {
      v32 = objc_alloc_init((Class)getVNDetectHumanRectanglesRequestClass());
      objc_msgSend(v43, "addObject:", v32);
    }
    else
    {
      v32 = 0;
    }
    objc_msgSend((id)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass()), "initWithCVPixelBuffer:orientation:options:session:", *(_QWORD *)(a1 + 40), 1, MEMORY[0x1E0C9AA70], *(_QWORD *)(v3 + 168)), "performRequests:error:", v43, &v53);
    if (*(_BYTE *)(a1 + 72) || *(_BYTE *)(a1 + 73))
    {
      v33 = (void *)objc_msgSend(v31, "results");
      v34 = (void *)objc_msgSend(v32, "results");
      if (*(_BYTE *)(a1 + 72) && objc_msgSend(v33, "count"))
      {
        v35 = -[FigObjectDetectionMetadataGenerator _compareFaceDetections:currentFaceDetections:time:](v3, *(void **)(v3 + 176), v33, v4);

        v36 = v35;
        *(_QWORD *)(v3 + 176) = v36;
        v44 = *(CMTime *)(a1 + 48);
        v37 = -[FigObjectDetectionMetadataGenerator _processFaceObservations:time:](v3, v36, &v44);
        v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D064A0]);
      }
      else
      {
        v38 = 0;
      }
      if (*(_BYTE *)(a1 + 73) && objc_msgSend(v34, "count"))
      {
        v39 = -[FigObjectDetectionMetadataGenerator _compareHumanBodyDetections:currentHumanDetections:time:](v3, *(void **)(v3 + 184), v34, v4);

        v40 = v39;
        *(_QWORD *)(v3 + 184) = v40;
        v44 = *(CMTime *)(a1 + 48);
        v41 = -[FigObjectDetectionMetadataGenerator _processHumanObservations:time:](v3, v40, &v44);
        if (!v38)
          v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D06498]);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 84));

      *(_QWORD *)(v3 + 128) = v38;
      v42 = *(_QWORD *)(a1 + 64);
      *(_OWORD *)(v3 + 136) = *(_OWORD *)(a1 + 48);
      *(_QWORD *)(v3 + 152) = v42;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 84));
    }
    mach_absolute_time();
    CFRelease(*(CFTypeRef *)(a1 + 40));
    *(_BYTE *)(v3 + 124) = 0;
  }
}

@end
