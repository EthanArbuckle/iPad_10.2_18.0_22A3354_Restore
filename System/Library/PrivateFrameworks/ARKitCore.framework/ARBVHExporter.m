@implementation ARBVHExporter

- (ARBVHExporter)initWithFilePath:(id)a3 type:(int64_t)a4 scale:
{
  __int128 v4;
  id v8;
  ARBVHExporter *v9;
  ARBVHExporter *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *tmpFilePath;
  __int128 v16;
  objc_super v17;

  v16 = v4;
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARBVHExporter;
  v9 = -[ARBVHExporter init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    *(_OWORD *)&v9->_scale[4] = v16;
    v9->_exportType = a4;
    objc_storeStrong((id *)&v9->_filePath, a3);
    NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@_tmp.bvh"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    tmpFilePath = v10->_tmpFilePath;
    v10->_tmpFilePath = (NSString *)v13;

    v10->_running = 0;
  }

  return v10;
}

- (void)start
{
  NSOutputStream *v3;
  NSOutputStream *framesStreamToFile;

  self->_numberFrames = 0;
  v3 = (NSOutputStream *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", self->_tmpFilePath, 0);
  framesStreamToFile = self->_framesStreamToFile;
  self->_framesStreamToFile = v3;

  -[NSOutputStream open](self->_framesStreamToFile, "open");
  self->_running = 1;
}

- (void)stop
{
  void *v3;
  int64_t exportType;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSString *tmpFilePath;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  ARBVHExporter *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSOutputStream close](self->_framesStreamToFile, "close");
  self->_running = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", self->_filePath, 0);
  objc_msgSend(v3, "open");
  exportType = self->_exportType;
  if (exportType)
  {
    if (exportType == 1)
    {
      objc_msgSend((id)objc_opt_class(), "liftedSkeletonHeaderByApplyingScale:", *(double *)&self->_scale[4]);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString dataUsingEncoding:](v17, "dataUsingEncoding:", 4);
    }
    else if (exportType == 2)
    {
      objc_msgSend((id)objc_opt_class(), "headerByApplyingScale:", *(double *)&self->_scale[4]);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString dataUsingEncoding:](v17, "dataUsingEncoding:", 4);
    }
    else
    {
      v17 = CFSTR("ERROR");
      objc_msgSend(CFSTR("ERROR"), "dataUsingEncoding:", 4);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "stickFigureHeaderByApplyingScale:", *(double *)&self->_scale[4]);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString dataUsingEncoding:](v17, "dataUsingEncoding:", 4);
  }
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "appendString:", CFSTR("MOTION\n"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Frames:  %d\n"), self->_numberFrames);
  objc_msgSend(v6, "appendFormat:", CFSTR("Frame Time:    %f\n"), 0x3F91111111111111);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithFileAtPath:", self->_tmpFilePath);
  objc_msgSend(v8, "open");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 1024);
  while (objc_msgSend(v8, "hasBytesAvailable"))
  {
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v3, "write:maxLength:", objc_msgSend(objc_retainAutorelease(v10), "bytes"), objc_msgSend(v8, "read:maxLength:", objc_msgSend(v10, "mutableBytes"), objc_msgSend(v10, "length")));
  }
  objc_msgSend(v8, "close");
  objc_msgSend(v3, "close");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  tmpFilePath = self->_tmpFilePath;
  v18 = 0;
  objc_msgSend(v11, "removeItemAtPath:error:", tmpFilePath, &v18);
  v13 = v18;

  if (v13)
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_62);
    v14 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not delete temporary file: %@", buf, 0x20u);

    }
  }

}

- (void)appendBodyAnchor:(id)a3
{
  int64_t exportType;
  float v5;
  float v6;
  float v7;
  float32x4_t v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  double v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t j;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t m;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  float32x2_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  unint64_t ii;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  unint64_t i;
  uint64_t v65;
  void *v66;
  NSOutputStream *framesStreamToFile;
  id v68;
  __int128 v69;
  float v70;
  float v71;
  float v72;
  __int128 v73;
  id v74;
  void *v75;
  void *__p[2];
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD v87[2];
  __int128 v88;
  _QWORD v89[16];
  __int128 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  if (!self->_running)
    goto LABEL_47;
  v75 = (void *)objc_opt_new();
  exportType = self->_exportType;
  if ((unint64_t)(exportType - 1) < 2)
  {
    objc_msgSend(v74, "transform");
    v71 = v5;
    v6 = *(float *)&self->_scale[4];
    objc_msgSend(v74, "transform");
    v70 = v7;
    v69 = *(_OWORD *)&self->_scale[4];
    objc_msgSend(v74, "transform");
    objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), (float)(v6 * v71), vmuls_lane_f32(v70, *(float32x2_t *)&v69, 1), vmuls_lane_f32(*(float *)&self->_scale[12], v8, 2));
    objc_msgSend(v74, "transform");
    v12 = AREulerAnglesFromMatrix(v9, v10, v11);
    v13 = *(float *)&v12 * 0.318309886 * 180.0;
    v14 = *((float *)&v12 + 1) * 0.318309886 * 180.0;
    *(float *)&v12 = v15 * 0.318309886 * 180.0;
    objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), v13, v14, *(float *)&v12);
LABEL_6:
    exportType = self->_exportType;
    goto LABEL_7;
  }
  if (!exportType)
  {
    objc_msgSend(v74, "referenceBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "skeleton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = COERCE_FLOAT(*(_QWORD *)(objc_msgSend(v17, "jointLandmarks") + 128));
    v18 = *(float *)&self->_scale[4];
    objc_msgSend(v74, "referenceBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "skeleton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), (float)(v18 * v72), (float)(*(float *)(objc_msgSend(v20, "jointLandmarks") + 132) * *(float *)&self->_scale[8]), 0);

    objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), 0, 0, 0);
    goto LABEL_6;
  }
LABEL_7:
  if (exportType)
  {
    if (exportType == 1)
    {
      objc_msgSend(v74, "skeleton");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "coreRESkeleton");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "liftedSkeletonData");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 0;
      for (i = 1; objc_msgSend(v62, "jointCount") > i; ++i)
      {
        v65 = objc_msgSend(v62, "jointsLocalSpace");
        objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), (float)(*(float *)(v65 + v63 + 16) * *(float *)&self->_scale[4]), (float)(*(float *)(v65 + v63 + 20) * *(float *)&self->_scale[8]), (float)(*(float *)(v65 + v63 + 24) * *(float *)&self->_scale[12]));
        v63 += 16;
      }
      objc_msgSend(v75, "appendString:", CFSTR("\n"));

    }
    else if (exportType == 2)
    {
      v21 = 0;
      for (j = 1; ; ++j)
      {
        objc_msgSend(v74, "skeleton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "jointCount");

        if (v24 <= j)
          break;
        objc_msgSend(v74, "skeleton");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "jointLocalTransforms");
        *(double *)&v27 = AREulerAnglesFromMatrix(*(__n128 *)(v26 + v21 + 64), *(__n128 *)(v26 + v21 + 80), *(__n128 *)(v26 + v21 + 96));
        v73 = v27;

        v28 = *(float *)&v73 * 0.318309886 * 180.0;
        v29 = *((float *)&v73 + 1) * 0.318309886 * 180.0;
        v30 = *((float *)&v73 + 2) * 0.318309886 * 180.0;
        objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), v28, v29, v30);
        v21 += 64;
      }
      objc_msgSend(v75, "appendString:", CFSTR("\n"));
    }
  }
  else
  {
    objc_msgSend(v74, "skeleton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "coreRESkeleton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "liftedSkeletonData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "skeletonDetectionResult2D");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v34;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(__p, objc_msgSend(v35, "jointCount"));
    v36 = (const void *)objc_msgSend(v35, "joints");
    v37 = objc_msgSend(v35, "joints");
    v38 = objc_msgSend(v35, "jointCount");
    v90 = 0uLL;
    v91 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v90, v36, v37 + 8 * v38, (v37 + 8 * v38 - (uint64_t)v36) >> 3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = v90;
    v77 = v91;
    v88 = 0u;
    v86 = 0u;
    memset(v87, 0, sizeof(v87));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend(&unk_1E66CED78, "objectAtIndexedSubscript:", 16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, &v90, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v84 != v41)
            objc_enumerationMutation(v39);
          v89[0] = objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "intValue");
          std::deque<std::pair<int,int>>::push_back(v87, v89);
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, &v90, 16);
      }
      while (v40);
    }

    for (m = *((_QWORD *)&v88 + 1); *((_QWORD *)&v88 + 1); m = *((_QWORD *)&v88 + 1))
    {
      v44 = (int *)(*(_QWORD *)(*((_QWORD *)&v87[0] + 1) + (((unint64_t)v88 >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (v88 & 0x1FF));
      v46 = *v44;
      v45 = v44[1];
      *(_QWORD *)&v88 = v88 + 1;
      *((_QWORD *)&v88 + 1) = m - 1;
      if ((unint64_t)v88 >= 0x400)
      {
        operator delete(**((void ***)&v87[0] + 1));
        *((_QWORD *)&v87[0] + 1) += 8;
        *(_QWORD *)&v88 = v88 - 512;
      }
      v47 = *(float32x2_t *)(objc_msgSend(v35, "joints") + 8 * v46);
      v48 = objc_msgSend(v35, "joints");
      *((float32x2_t *)__p[0] + v46) = vsub_f32(v47, *(float32x2_t *)(v48 + 8 * v45));
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(&unk_1E66CED78, "objectAtIndexedSubscript:", v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v80;
        v52 = v46 << 32;
        do
        {
          for (n = 0; n != v50; ++n)
          {
            if (*(_QWORD *)v80 != v51)
              objc_enumerationMutation(v49);
            v78 = v52 | objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "intValue");
            std::deque<std::pair<int,int>>::push_back(v87, &v78);
          }
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        }
        while (v50);
      }

    }
    std::deque<std::pair<int,int>>::~deque[abi:ne180100](v87);

    for (ii = 1; objc_msgSend(v35, "jointCount") > ii; ++ii)
    {
      v55 = -[ARBVHExporter appendBodyAnchor:]::indexSequence[ii];
      +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "parentIndices");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndexedSubscript:", v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "intValue");

      if (v59 >= 0)
        objc_msgSend(v75, "appendFormat:", CFSTR("%f %f %f "), vmuls_n_f32(COERCE_FLOAT(*((_QWORD *)__p[0] + v55)), COERCE_FLOAT(*(_OWORD *)&self->_scale[4])), vmuls_lane_f32(COERCE_FLOAT(HIDWORD(*((_QWORD *)__p[0] + v55))), *(float32x2_t *)&self->_scale[4], 1), 0);
    }
    objc_msgSend(v75, "appendString:", CFSTR("\n"));
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

  }
  objc_msgSend(v75, "dataUsingEncoding:", 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  framesStreamToFile = self->_framesStreamToFile;
  v68 = objc_retainAutorelease(v66);
  -[NSOutputStream write:maxLength:](framesStreamToFile, "write:maxLength:", objc_msgSend(v68, "bytes"), objc_msgSend(v68, "length"));
  ++self->_numberFrames;

LABEL_47:
}

+ (id)headerByApplyingScale:(id)a1
{
  __n128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 v14;

  v14 = v2;
  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jointNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "neutralBodySkeleton3D");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_63);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "appendString:", CFSTR("HIERARCHY\n"));
  objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("ROOT %@\n{\n"), v11);

  objc_msgSend(v10, "appendFormat:", CFSTR("\tOFFSET %f %f %f\n"), (float)(*(float *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 48) * v14.n128_f32[0]), vmuls_lane_f32(COERCE_FLOAT(HIDWORD(*(_QWORD *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 48))), (float32x2_t)v14.n128_u64[0], 1), vmuls_lane_f32(*(float *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 56), (float32x4_t)v14, 2));
  objc_msgSend(v10, "appendString:", CFSTR("\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"));
  visitChildren(1, v9, v6, v4, objc_msgSend(v8, "jointLocalTransforms"), 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v12);

  objc_msgSend(v10, "appendString:", CFSTR("}\n"));
  return v10;
}

unint64_t __39__ARBVHExporter_headerByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "integerValue") >> 63;
}

+ (id)liftedSkeletonHeaderByApplyingScale:(id)a1
{
  __n128 v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  __n128 v16;
  _BYTE v17[32];
  _OWORD v18[83];
  uint64_t v19;

  v16 = v2;
  v19 = *MEMORY[0x1E0C80C00];
  +[AR3DSkeletonDetectionResult jointNames](AR3DSkeletonDetectionResult, "jointNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AR3DSkeletonDetectionResult parentIndices](AR3DSkeletonDetectionResult, "parentIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_31);
  v6 = 0;
  v18[66] = 0u;
  v18[67] = xmmword_1B3C07ED0;
  v18[68] = xmmword_1B3C07EE0;
  v18[69] = xmmword_1B3C07EF0;
  v18[70] = xmmword_1B3C07F00;
  v18[71] = xmmword_1B3C07F10;
  v18[72] = xmmword_1B3C07F20;
  v18[73] = xmmword_1B3C07F30;
  v18[74] = xmmword_1B3C07F40;
  v18[75] = xmmword_1B3C07F50;
  v18[76] = xmmword_1B3C07F60;
  v18[77] = xmmword_1B3C07F70;
  v18[78] = xmmword_1B3C07F80;
  v18[79] = xmmword_1B3C07F90;
  v18[80] = xmmword_1B3C07FA0;
  v18[81] = xmmword_1B3C07FB0;
  v18[82] = xmmword_1B3C07FC0;
  v7 = v18;
  do
  {
    ARMatrix4x4FromRotationAndTranslation();
    *(v7 - 2) = v8;
    *(v7 - 1) = v9;
    *v7 = v10;
    v7[1] = v11;
    v7 += 4;
    v6 += 16;
  }
  while (v6 != 272);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "appendString:", CFSTR("HIERARCHY\n"));
  objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendFormat:", CFSTR("ROOT %@\n{\n"), v13);

  objc_msgSend(v12, "appendFormat:", CFSTR("\tOFFSET %f %f %f\n"), (float)(*(float *)&v18[4 * (uint64_t)v5 + 1] * v16.n128_f32[0]), vmuls_lane_f32(*((float *)&v18[4 * (uint64_t)v5 + 1] + 1), (float32x2_t)v16.n128_u64[0], 1), vmuls_lane_f32(*((float *)&v18[4 * (uint64_t)v5 + 1] + 2), (float32x4_t)v16, 2));
  objc_msgSend(v12, "appendString:", CFSTR("\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"));
  visitChildren(1, v5, v3, v4, (uint64_t)v17, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v14);

  objc_msgSend(v12, "appendString:", CFSTR("}\n"));
  return v12;
}

unint64_t __53__ARBVHExporter_liftedSkeletonHeaderByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "integerValue") >> 63;
}

+ (id)stickFigureHeaderByApplyingScale:(id)a1
{
  __n128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  __n128 v18;
  _BYTE v19[32];
  _OWORD v20[83];
  uint64_t v21;

  v18 = v2;
  v21 = *MEMORY[0x1E0C80C00];
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jointNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_32_0);
  v8 = 0;
  v20[66] = xmmword_1B3C07FD0;
  v20[67] = xmmword_1B3C07FE0;
  v20[68] = xmmword_1B3C07FF0;
  v20[69] = xmmword_1B3C08000;
  v20[70] = xmmword_1B3C08010;
  v20[71] = xmmword_1B3C08020;
  v20[72] = xmmword_1B3C08030;
  v20[73] = xmmword_1B3C08040;
  v20[74] = xmmword_1B3C08050;
  v20[75] = xmmword_1B3C08060;
  v20[76] = xmmword_1B3C08070;
  v20[77] = xmmword_1B3C08080;
  v20[78] = xmmword_1B3C08090;
  v20[79] = xmmword_1B3C080A0;
  v20[80] = xmmword_1B3C080B0;
  v20[81] = xmmword_1B3C080C0;
  v20[82] = xmmword_1B3C080D0;
  v9 = v20;
  do
  {
    ARMatrix4x4FromRotationAndTranslation();
    *(v9 - 2) = v10;
    *(v9 - 1) = v11;
    *v9 = v12;
    v9[1] = v13;
    v9 += 4;
    v8 += 16;
  }
  while (v8 != 272);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "appendString:", CFSTR("HIERARCHY\n"));
  objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR("ROOT %@\n{\n"), v15);

  objc_msgSend(v14, "appendFormat:", CFSTR("\tOFFSET %f %f %f\n"), (float)(*(float *)&v20[4 * (uint64_t)v7 + 1] * v18.n128_f32[0]), vmuls_lane_f32(*((float *)&v20[4 * (uint64_t)v7 + 1] + 1), (float32x2_t)v18.n128_u64[0], 1), vmuls_lane_f32(*((float *)&v20[4 * (uint64_t)v7 + 1] + 2), (float32x4_t)v18, 2));
  objc_msgSend(v14, "appendString:", CFSTR("\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"));
  visitChildren(1, v7, v4, v6, (uint64_t)v19, 1, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v16);

  objc_msgSend(v14, "appendString:", CFSTR("}\n"));
  return v14;
}

unint64_t __50__ARBVHExporter_stickFigureHeaderByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "integerValue") >> 63;
}

- (BOOL)running
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framesStreamToFile, 0);
  objc_storeStrong((id *)&self->_tmpFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
