@implementation VCPHandGestureVideoRequest

- (VCPHandGestureVideoRequest)initWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  VCPHandGestureVideoRequest *v9;
  NSObject *v10;
  void *v11;
  VCPHandPoseImageRequest *v12;
  VCPHandPoseImageRequest *poseImageRequest;
  VCPHandGestureClassifier *v14;
  double v15;
  uint64_t v16;
  VCPHandGestureClassifier *handGestureClassifier;
  int64_t v18;
  OS_dispatch_queue *queue;
  dispatch_queue_t v20;
  OS_dispatch_queue *v21;
  NSObject *v22;
  VCPHandGestureVideoRequest *v23;
  VCPHandGestureVideoRequest *v24;
  objc_super v26;
  uint8_t buf[16];

  v4 = a3;
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPHandGestureVideoRequest_initWithOptions", ", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)VCPHandGestureVideoRequest;
  v9 = -[VCPRequest initWithOptions:](&v26, sel_initWithOptions_, v4);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handPoseLite"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("handPoseLite"));
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1E6B72B00, CFSTR("revision"));
    v12 = -[VCPHandPoseImageRequest initWithOptions:]([VCPHandPoseImageRequest alloc], "initWithOptions:", v10);
    poseImageRequest = v9->_poseImageRequest;
    v9->_poseImageRequest = v12;

    v14 = [VCPHandGestureClassifier alloc];
    *(float *)&v15 = v9->super._minHandSize;
    v16 = -[VCPHandGestureClassifier initWithMinHandSize:options:](v14, "initWithMinHandSize:options:", v4, v15);
    handGestureClassifier = v9->_handGestureClassifier;
    v9->_handGestureClassifier = (VCPHandGestureClassifier *)v16;

    v18 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)&v9->_previousTime.value = *MEMORY[0x1E0CA2E28];
    v9->_previousTime.epoch = v18;
    v9->_minTimeInterval = 0.19;
    if (!v9->_poseImageRequest
      || !v9->_handGestureClassifier
      || (queue = v9->_queue, v9->_queue = 0, queue, v9->super._useAsync)
      && (v20 = dispatch_queue_create("VCPHandGestureVideoRequestSerialQueue", 0),
          v21 = v9->_queue,
          v9->_queue = (OS_dispatch_queue *)v20,
          v21,
          !v9->_queue))
    {
      v23 = 0;
      goto LABEL_17;
    }

  }
  VCPSignPostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v10 = v22;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v6, "VCPHandGestureVideoRequest_initWithOptions", ", buf, 2u);
  }
  v23 = v9;
LABEL_17:

  v24 = v23;
  return v24;
}

- (id)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 error:(id *)a6
{
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  int maxNumOfPersons;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  signed int v27;
  signed int v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t k;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float v43;
  double v44;
  void *v45;
  void *v46;
  $95D729B680665BEAEFA1D6FCA8238556 *p_previousTime;
  void *v48;
  BOOL v49;
  uint64_t RotationInDegrees;
  int v51;
  __int128 v52;
  NSObject *v53;
  uint64_t m;
  signed int v55;
  int v56;
  void *v57;
  void *v58;
  VCPHandGestureClassifier *handGestureClassifier;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  unint64_t v73;
  os_signpost_id_t spid;
  signed int v75;
  void *v76;
  NSDictionary *v77;
  void *v78;
  signed int v79;
  void *v80;
  id v82;
  void *v83;
  uint64_t v84;
  id obj;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CMTime time;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  CMTime rhs;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  void *v108;
  _BYTE v109[128];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v77 = (NSDictionary *)a5;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v73 = v9 - 1;
  spid = v9;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPHandGestureVideoRequest_processBuffer", ", (uint8_t *)&buf, 2u);
  }

  -[NSDictionary objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("faceRects"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("faceYaws"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v80, "count"))
  {
    objc_msgSend(v80, "firstObject");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSRectFromString(v12);

  }
  -[VCPHandPoseImageRequest processImage:withOptions:error:](self->_poseImageRequest, "processImage:withOptions:error:", a3, v77, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  maxNumOfPersons = self->super._maxNumOfPersons;
  if (maxNumOfPersons >= 3)
    maxNumOfPersons = 3;
  if (maxNumOfPersons <= 1)
    maxNumOfPersons = 1;
  v75 = maxNumOfPersons;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v13);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v101 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "groupID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (v21)
        {
          v24 = (void *)MEMORY[0x1E0C99DE8];
          v108 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "arrayWithArray:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "groupID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v23, v25);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "groupID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v18);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v15);
  }

  objc_msgSend(v86, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  v28 = v75;
  if (v75 >= v27)
    v28 = v27;
  v79 = v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v86, "allKeys");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
  if (v29)
  {
    v84 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v97 != v84)
          objc_enumerationMutation(v82);
        v31 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * j);
        objc_msgSend(v86, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count"))
        {
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v93;
            v36 = 0.0;
            do
            {
              for (k = 0; k != v34; ++k)
              {
                if (*(_QWORD *)v93 != v35)
                  objc_enumerationMutation(v33);
                v38 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * k);
                objc_msgSend(v38, "bounds");
                v40 = v39;
                objc_msgSend(v38, "bounds");
                v42 = v41;

                v43 = v40 * v42;
                v36 = v36 + v43;
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
            }
            while (v34);
          }
          else
          {
            v36 = 0.0;
          }

          *(float *)&v44 = v36 / (float)(unint64_t)objc_msgSend(v33, "count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v45, v31);

        }
      }
      v29 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    }
    while (v29);
  }

  objc_msgSend(v83, "keysSortedByValueUsingComparator:", &__block_literal_global_28);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.var0) = 138412802;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v46;
    LOWORD(buf.var2) = 1024;
    *(unsigned int *)((char *)&buf.var2 + 2) = v75;
    WORD1(buf.var3) = 1024;
    HIDWORD(buf.var3) = v79;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest - sorted groupIDs based on hand size = %@, max number of persons = %d, number of valid persons = %d", (uint8_t *)&buf, 0x18u);
  }
  p_previousTime = &self->_previousTime;
  if ((self->_previousTime.flags & 1) != 0)
  {
    buf = *a4;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_previousTime->value;
    rhs.epoch = self->_previousTime.epoch;
    CMTimeSubtract(&time, (CMTime *)&buf, &rhs);
    if (CMTimeGetSeconds(&time) > self->_minTimeInterval)
    {
      -[NSDictionary objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("rotationInDegrees"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48 == 0;

      if (!v49)
      {
        RotationInDegrees = getRotationInDegrees(v77);
        if (-[VCPHandGestureClassifier rotationInDegrees](self->_handGestureClassifier, "rotationInDegrees") != (_DWORD)RotationInDegrees)
        {
          -[VCPHandGestureClassifier reset](self->_handGestureClassifier, "reset");
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v51 = -[VCPHandGestureClassifier rotationInDegrees](self->_handGestureClassifier, "rotationInDegrees");
            LODWORD(buf.var0) = 67109376;
            HIDWORD(buf.var0) = v51;
            LOWORD(buf.var1) = 1024;
            *(int *)((char *)&buf.var1 + 2) = RotationInDegrees;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "gesture rotation updated from %d to %d", (uint8_t *)&buf, 0xEu);
          }
        }
        -[VCPHandGestureClassifier setRotationInDegrees:](self->_handGestureClassifier, "setRotationInDegrees:", RotationInDegrees);
      }
      v52 = *(_OWORD *)&a4->var0;
      self->_previousTime.epoch = a4->var3;
      *(_OWORD *)&p_previousTime->value = v52;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v53 = objc_claimAutoreleasedReturnValue();
      for (m = 0; ; ++m)
      {
        v55 = objc_msgSend(v46, "count");
        v56 = v79 >= v55 ? v55 : v79;
        if (m >= v56)
          break;
        objc_msgSend(v46, "objectAtIndexedSubscript:", m);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v58, "count"))
        {
          handGestureClassifier = self->_handGestureClassifier;
          objc_msgSend(v46, "objectAtIndexedSubscript:", m);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(handGestureClassifier) = -[VCPHandGestureClassifier processPerson:withObservations:andFaceRects:faceYaws:](handGestureClassifier, "processPerson:withObservations:andFaceRects:faceYaws:", objc_msgSend(v60, "intValue"), v58, v80, v76);

          if ((_DWORD)handGestureClassifier)
          {

LABEL_77:
            v69 = 0;
            goto LABEL_74;
          }
          objc_msgSend(v78, "addObjectsFromArray:", v58);
          objc_msgSend(v46, "objectAtIndexedSubscript:", m);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v53, "addObject:", v61);

        }
      }
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      -[VCPHandGestureClassifier existingGroupIDs](self->_handGestureClassifier, "existingGroupIDs");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v88;
        v65 = MEMORY[0x1E0C9AA60];
        while (2)
        {
          for (n = 0; n != v63; ++n)
          {
            if (*(_QWORD *)v88 != v64)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * n);
            if ((-[NSObject containsObject:](v53, "containsObject:", v67) & 1) == 0
              && -[VCPHandGestureClassifier processPerson:withObservations:andFaceRects:faceYaws:](self->_handGestureClassifier, "processPerson:withObservations:andFaceRects:faceYaws:", objc_msgSend(v67, "intValue"), v65, v65, v65))
            {

              goto LABEL_77;
            }
          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
          if (v63)
            continue;
          break;
        }
      }

    }
  }
  VCPSignPostLog();
  v68 = objc_claimAutoreleasedReturnValue();
  v53 = v68;
  if (v73 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v53, OS_SIGNPOST_INTERVAL_END, spid, "VCPHandGestureVideoRequest_processBuffer", ", (uint8_t *)&buf, 2u);
  }
  v69 = v78;
LABEL_74:

  v70 = v69;
  return v70;
}

uint64_t __72__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  return -[VCPHandPoseImageRequest updateWithOptions:error:](self->_poseImageRequest, "updateWithOptions:error:", a3, a4);
}

- (void)updateWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  void *v9;
  uint8_t v10[8];
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__VCPHandGestureVideoRequest_updateWithOptions_completion___block_invoke;
    block[3] = &unk_1E6B17158;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPHandGestureVideoRequest : queue not available for async updateWithOptions", v10, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

void __59__VCPHandGestureVideoRequest_updateWithOptions_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 64);
  v8 = 0;
  v4 = objc_msgSend(v3, "updateWithOptions:error:", v2, &v8);
  v5 = v8;
  v6 = a1[6];
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (void)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t *v17;
  __int128 v18;
  int64_t var3;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  CFTypeRef v23;

  v10 = a5;
  v11 = a6;
  if (self->_queue)
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 0;
    v23 = CFRetain(a3);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_completion___block_invoke;
    block[3] = &unk_1E6B17180;
    block[4] = self;
    v17 = buf;
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v15 = v10;
    v16 = v11;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPHandGestureVideoRequest : queue not available for async processBuffer", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v13);

  }
}

void __77__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const void *v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v9 = *(_OWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 80);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v3, "processBuffer:timestamp:withOptions:error:", v2, &v9, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v7)
    CFRelease(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handGestureClassifier, 0);
  objc_storeStrong((id *)&self->_poseImageRequest, 0);
}

@end
