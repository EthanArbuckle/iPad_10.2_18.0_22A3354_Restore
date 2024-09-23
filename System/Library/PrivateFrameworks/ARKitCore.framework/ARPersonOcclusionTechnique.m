@implementation ARPersonOcclusionTechnique

- (ARPersonOcclusionTechnique)init
{
  ARPersonOcclusionTechnique *v2;
  ARPersonOcclusionTechnique *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ARPersonOcclusionTechnique;
  v2 = -[ARTechnique init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v14 = 0x3FB999999999999ALL;
    v15 = 0x3FB999999999999ALL;
    v12 = 0x3FC999999999999ALL;
    v13 = 0x3FC0000000000000;
    v10 = 0x4000000000000000;
    v11 = 0x3FE0000000000000;
    v9 = 0x3FD3333333333333;
    v8 = 0x3FA999999999999ALL;
    std::allocate_shared[abi:ne180100]<arkit::RobustExpFilter<float>,std::allocator<arkit::RobustExpFilter<float>>,double,double,double,double,double,double,double,double,void>((double *)&v15, (double *)&v14, (double *)&v13, (double *)&v12, (double *)&v11, (uint64_t)&v10, (double *)&v9, &v16, (double *)&v8);
    std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&v2->_varExpFilter, &v16);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v3->_lastDeviceOrientation = 0;
    v3->_minFilterIntermediateBufferSize = 0;
    v3->_minFilterIntermediatePooledBuffer = 0;
    v3->_doExpFiltering = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.appleDepth.useExpFilter"));
    v3->_useBoundingBoxes = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.appleDepth.averageDepthBoundingBox"));
  }
  return v3;
}

- (void)dealloc
{
  char *minFilterIntermediatePooledBuffer;
  objc_super v4;

  CVPixelBufferPoolRelease(self->_depthPixelBufferPool);
  minFilterIntermediatePooledBuffer = self->_minFilterIntermediatePooledBuffer;
  if (minFilterIntermediatePooledBuffer)
    free(minFilterIntermediatePooledBuffer);
  v4.receiver = self;
  v4.super_class = (Class)ARPersonOcclusionTechnique;
  -[ARPersonOcclusionTechnique dealloc](&v4, sel_dealloc);
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CVBuffer *v29;
  __CVBuffer *v30;
  size_t v31;
  size_t v32;
  double v33;
  double v34;
  void *v35;
  __CVBuffer *v36;
  __CVBuffer *v37;
  size_t Width;
  size_t Height;
  double v40;
  double v41;
  __CVBuffer *v42;
  __CVBuffer *v43;
  void *BaseAddress;
  size_t BytesPerRow;
  ARFilteredMLDepthData *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  _QWORD *ptr;
  uint64_t v53;
  int v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  ARMLDepthData *v63;
  double v64;
  ARMLDepthData *v65;
  NSObject *v66;
  objc_class *v67;
  void *v68;
  ARFilteredMLDepthData *v69;
  ARFilteredMLDepthData *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  CVPixelBufferRef v75;
  CVPixelBufferRef texture;
  ARFilteredMLDepthData *v77;
  ARFilteredMLDepthData *v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  ARPersonOcclusionTechnique *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "segmentationBuffer") && objc_msgSend(v10, "depthBuffer") && v74 && !v13)
  {
    objc_msgSend(v8, "timestamp");
    v15 = v14;
    objc_msgSend(v10, "timestamp");
    if (v15 != v16)
    {
      objc_msgSend(v10, "timestamp");
      v18 = v17;
      objc_msgSend(v74, "timestamp");
      if (v18 != v19)
      {
        objc_msgSend(v8, "timestamp");
        objc_msgSend(v10, "timestamp");
        objc_msgSend(v74, "timestamp");
        kdebug_trace();
        _ARLogTechnique();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timestamp");
          v24 = v23;
          objc_msgSend(v10, "timestamp");
          v26 = v25;
          objc_msgSend(v74, "timestamp");
          *(_DWORD *)buf = 138544386;
          v80 = v22;
          v81 = 2048;
          v82 = self;
          v83 = 2048;
          v84 = v24;
          v85 = 2048;
          v86 = v26;
          v87 = 2048;
          v88 = v27;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Mismatched timestamps. (Segmentation data: %f, Depth data: %f, Detection data: %f) ", buf, 0x34u);

        }
        -[ARTechnique delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

        goto LABEL_55;
      }
    }
    objc_msgSend(v8, "timestamp");
    kdebug_trace();
    texture = 0;
    v36 = (__CVBuffer *)objc_msgSend(v8, "segmentationBuffer");
    v37 = v36;
    if (v36)
    {
      Width = CVPixelBufferGetWidth(v36);
      Height = CVPixelBufferGetHeight(v37);
      v40 = (double)Width;
      v41 = (double)Height;
    }
    else
    {
      v40 = *MEMORY[0x1E0C9D820];
      v41 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    texture = ARCreateCVPixelBufferFromPool(&self->_depthPixelBufferPool, 1717855600, self, CFSTR("Result Depth Map"), v40, v41);
    if (texture)
    {
      objc_msgSend(v6, "imageData");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "deviceOrientation") != self->_lastDeviceOrientation)
      {
        _ARLogTechnique();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v51;
          v81 = 2048;
          v82 = self;
          _os_log_impl(&dword_1B3A68000, v49, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Resetting exponential filter due to device rotation.", buf, 0x16u);

        }
        ptr = self->_varExpFilter.__ptr_;
        ptr[1] = *ptr;
        ptr[4] = ptr[3];
      }
      self->_lastDeviceOrientation = objc_msgSend(v73, "deviceOrientation");
      v53 = objc_msgSend(v10, "singleFrameDepthBuffer");
      if (objc_msgSend(v10, "source") == 2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v74, "timestamp");
          kdebug_trace();
          v75 = 0;
          v54 = -[ARPersonOcclusionTechnique _minFilterDepthMap:kernelSize:pResultBuffer:](self, "_minFilterDepthMap:kernelSize:pResultBuffer:", v53, 3, &v75);
          objc_msgSend(v74, "timestamp");
          kdebug_trace();
          if (v54)
          {
            _ARLogTechnique();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = (objc_class *)objc_opt_class();
              NSStringFromClass(v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v57;
              v81 = 2048;
              v82 = self;
              _os_log_impl(&dword_1B3A68000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating result depth buffer", buf, 0x16u);

            }
            -[ARTechnique delegate](self, "delegate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

            objc_msgSend(v8, "timestamp");
            kdebug_trace();
            CVPixelBufferRelease(texture);
LABEL_54:

            goto LABEL_55;
          }
          v63 = [ARMLDepthData alloc];
          objc_msgSend(v10, "timestamp");
          v65 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v63, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", v75, objc_msgSend(v10, "singleFrameConfidenceBuffer"), 2, v64);

          CVPixelBufferRelease(v75);
          v10 = v65;
        }
      }
      if (-[ARPersonOcclusionTechnique postProcessSegmentation:depthData:depthDataSource:detectionData:pResultingDepthBuffer:](self, "postProcessSegmentation:depthData:depthDataSource:detectionData:pResultingDepthBuffer:", objc_msgSend(v8, "segmentationBuffer"), v10, objc_msgSend(v10, "source"), v74, &texture))
      {
        _ARLogTechnique();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v68;
          v81 = 2048;
          v82 = self;
          _os_log_impl(&dword_1B3A68000, v66, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Processing segmentation and depth buffer failed", buf, 0x16u);

        }
        -[ARTechnique delegate](self, "delegate");
        v69 = (ARFilteredMLDepthData *)objc_claimAutoreleasedReturnValue();
        -[ARFilteredMLDepthData technique:didOutputResultData:timestamp:context:](v69, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);
      }
      else
      {
        v70 = [ARFilteredMLDepthData alloc];
        v69 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:](v70, "initWithTimestamp:depthBuffer:source:", texture, objc_msgSend(v10, "source"), a3);
        -[ARTechnique delegate](self, "delegate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          v78 = v69;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v72 = (void *)MEMORY[0x1E0C9AA60];
        }
        objc_msgSend(v71, "technique:didOutputResultData:timestamp:context:", self, v72, v6, a3);
        if (v69)

      }
      CVPixelBufferRelease(texture);
      objc_msgSend(v8, "timestamp");
      kdebug_trace();
      goto LABEL_54;
    }
    _ARLogTechnique();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v61;
      v81 = 2048;
      v82 = self;
      _os_log_impl(&dword_1B3A68000, v59, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating result depth buffer", buf, 0x16u);

    }
    -[ARTechnique delegate](self, "delegate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

    objc_msgSend(v8, "timestamp");
    kdebug_trace();
  }
  else if (objc_msgSend(v8, "segmentationBuffer") && v13)
  {
    v29 = (__CVBuffer *)objc_msgSend(v8, "segmentationBuffer");
    v30 = v29;
    if (v29)
    {
      v31 = CVPixelBufferGetWidth(v29);
      v32 = CVPixelBufferGetHeight(v30);
      v33 = (double)v31;
      v34 = (double)v32;
    }
    else
    {
      v33 = *MEMORY[0x1E0C9D820];
      v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v42 = ARCreateCVPixelBufferFromPool(&self->_depthPixelBufferPool, 1717855600, self, CFSTR("Result Depth Map"), v33, v34);
    v43 = v42;
    if (v42)
    {
      CVPixelBufferLockBaseAddress(v42, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v43);
      BytesPerRow = CVPixelBufferGetBytesPerRow(v43);
      bzero(BaseAddress, (unint64_t)(v34 * (double)BytesPerRow));
      CVPixelBufferUnlockBaseAddress(v43, 0);
      v46 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:]([ARFilteredMLDepthData alloc], "initWithTimestamp:depthBuffer:source:", v43, objc_msgSend(v13, "source"), a3);
      CVPixelBufferRelease(v43);
    }
    else
    {
      v46 = 0;
    }
    -[ARTechnique delegate](self, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v77 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v47, "technique:didOutputResultData:timestamp:context:", self, v48, v6, a3);
    if (v46)

  }
  else
  {
    kdebug_trace();
    -[ARTechnique delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

    kdebug_trace();
  }
LABEL_55:

}

- (int)postProcessSegmentation:(__CVBuffer *)a3 depthData:(id)a4 depthDataSource:(int64_t)a5 detectionData:(id)a6 pResultingDepthBuffer:(__CVBuffer *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  int v27;
  objc_class *v28;
  void *v29;
  objc_class *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  size_t v38;
  float *v39;
  __int128 v40;
  char *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int64x2_t v45;
  _DWORD *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  unsigned __int8 *v51;
  _DWORD *v52;
  char *v53;
  uint64_t v54;
  _OWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  void *v62;
  _OWORD *v63;
  __int128 v64;
  __int128 v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  float *v71;
  float *v72;
  unsigned __int8 *v73;
  float v74;
  uint64_t v75;
  float v76;
  unsigned __int8 *v77;
  float *v78;
  float *v79;
  uint64_t i;
  float v82;
  float v83;
  float v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  float *v91;
  unsigned __int8 *v92;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64x2_t *v97;
  uint64x2_t *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64x2_t *v104;
  char *v105;
  void *v106;
  unint64_t v107;
  uint64x2_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  float v112;
  float v113;
  int v114;
  uint64x2_t v115;
  uint64_t v116;
  uint64x2_t *v117;
  int64x2_t v118;
  float v119;
  unint64_t v120;
  unint64_t v121;
  float v122;
  float v123;
  float *i32;
  float v125;
  unint64_t v126;
  float v127;
  unint64_t v128;
  float *v129;
  float v130;
  unint64_t v131;
  __int128 v132;
  unint64_t v133;
  uint64_t v134;
  char *v135;
  float v136;
  float v137;
  uint64x2_t *v138;
  uint64x2_t v139;
  float v140;
  uint64x2_t *v141;
  int64x2_t v142;
  uint64x2_t *v143;
  float v144;
  float v145;
  uint64_t v146;
  uint64_t v147;
  float v148;
  float v149;
  uint64x2_t *v150;
  uint64x2_t *v151;
  unint64_t v152;
  float v153;
  unint64_t v154;
  float v155;
  float *v156;
  float v157;
  uint64x2_t *v158;
  unint64_t v159;
  char *v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  float *v164;
  unsigned __int8 *v165;
  int v166;
  unint64_t v167;
  __int128 v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  float *v176;
  unsigned __int8 *v177;
  float *v178;
  int v179;
  _BYTE *v180;
  uint64_t v181;
  __CVBuffer *v182;
  CVPixelBufferLockFlags unlockFlags;
  _OWORD *v184;
  CVPixelBufferRef v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  __CVBuffer *v192;
  uint64_t v193;
  CVPixelBufferRef pixelBuffer;
  void *v195;
  void *v196[4];
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *__p;
  _OWORD *v201;
  uint64_t v202;
  void *v203[4];
  int64x2_t v204[2];
  _BYTE v205[32];
  _QWORD buf[8];

  buf[5] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = v13;
  pixelBuffer = a3;
  if (!a3)
  {
    _ARLogTechnique();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543618;
      *(_QWORD *)((char *)buf + 4) = v21;
      WORD2(buf[1]) = 2048;
      *(_QWORD *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing segmentation buffer", (uint8_t *)buf, 0x16u);

    }
    goto LABEL_20;
  }
  v195 = v12;
  if (!v12)
  {
    _ARLogTechnique();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543618;
      *(_QWORD *)((char *)buf + 4) = v23;
      WORD2(buf[1]) = 2048;
      *(_QWORD *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing depth data", (uint8_t *)buf, 0x16u);

    }
    goto LABEL_20;
  }
  if (!v13)
  {
    _ARLogTechnique();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543618;
      *(_QWORD *)((char *)buf + 4) = v29;
      WORD2(buf[1]) = 2048;
      *(_QWORD *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing detection data", (uint8_t *)buf, 0x16u);

    }
    goto LABEL_20;
  }
  if (!a7 || !*a7)
  {
    _ARLogTechnique();
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = v12;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543618;
      *(_QWORD *)((char *)buf + 4) = v26;
      WORD2(buf[1]) = 2048;
      *(_QWORD *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing resulting depth buffer", (uint8_t *)buf, 0x16u);

    }
    v27 = -6662;
    goto LABEL_21;
  }
  v192 = (__CVBuffer *)objc_msgSend(v12, "singleFrameDepthBuffer");
  if (!v192)
  {
    _ARLogTechnique();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543618;
      *(_QWORD *)((char *)buf + 4) = v32;
      WORD2(buf[1]) = 2048;
      *(_QWORD *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing depth buffer", (uint8_t *)buf, 0x16u);

    }
LABEL_20:

    v27 = -6661;
    goto LABEL_21;
  }
  if (self->_useBoundingBoxes)
  {
    objc_msgSend(v14, "detectedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = objc_msgSend(v15, "count") != 0;

  }
  else
  {
    v16 = v14;
    v17 = 0;
  }
  v33 = a5 != 2 && self->_doExpFiltering;
  v19 = v195;
  v185 = *a7;
  CVPixelBufferLockBaseAddress(*a7, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unlockFlags = !v33;
  CVPixelBufferLockBaseAddress(v192, unlockFlags);
  memset(buf, 0, 32);
  ARWrapCVPixelBufferVImage(v192, (void **)buf);
  memset(v204, 0, sizeof(v204));
  ARWrapCVPixelBufferVImage(a3, (void **)v204);
  memset(v203, 0, sizeof(v203));
  ARWrapCVPixelBufferVImage(v185, v203);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&buf[1], *(int64x2_t *)&v203[1]), (int32x4_t)vceqq_s64(*(int64x2_t *)&buf[1], *(int64x2_t *)((char *)v204 + 8)))), 0xFuLL))) & 1) == 0)
  {
    _ARLogTechnique();
    v34 = objc_claimAutoreleasedReturnValue();
    v14 = v16;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v205 = 138543618;
      *(_QWORD *)&v205[4] = v36;
      *(_WORD *)&v205[12] = 2048;
      *(_QWORD *)&v205[14] = self;
      _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Dimensions of depth buffer, segmentation buffer and resulting depth buffer are not equal", v205, 0x16u);

    }
    v27 = -6681;
    goto LABEL_21;
  }
  v37 = (void *)buf[1];
  if (v33)
  {
    objc_msgSend(v16, "timestamp");
    kdebug_trace();
    v38 = 4 * buf[2] * buf[1];
    v39 = arkit::RobustExpFilter<float>::filter((uint64_t)self->_varExpFilter.__ptr_, (float *)buf[0], v38);
    memcpy((void *)buf[0], v39, v38);
    objc_msgSend(v16, "timestamp");
    kdebug_trace();
    v37 = v203[1];
  }
  bzero(v203[0], (_QWORD)v37 * (uint64_t)v203[3]);
  if (v17)
  {
    __p = 0;
    v201 = 0;
    v202 = 0;
    v197 = 0;
    v198 = 0;
    v199 = 0;
    *(_QWORD *)&v40 = -1;
    *((_QWORD *)&v40 + 1) = -1;
    *(_OWORD *)v205 = v40;
    *(_OWORD *)&v205[16] = 0uLL;
    v14 = v16;
    arkit::computeBoundingBoxes((uint64_t)v204, v16, (char **)&__p, &v197, (uint64x2_t *)v205);
    arkit::fillInstanceDepthBufferOutsideAllDetections(buf, (unsigned __int8 **)v204, v203, (uint64_t *)v205);
    v182 = (__CVBuffer *)objc_msgSend(v195, "singleFrameConfidenceBuffer");
    if (v182)
    {
      CVPixelBufferLockBaseAddress(v182, 1uLL);
      ARWrapCVPixelBufferVImage(v182, v196);
      v41 = (char *)v196[0];
      v42 = v196[3];
    }
    else
    {
      v42 = 0;
      v41 = 0;
    }
    v56 = v201;
    v180 = __p;
    v184 = v201;
    if (__p == v201)
      goto LABEL_82;
    v57 = v204[0].i64[0];
    v58 = v204[1].i64[1];
    v59 = buf[0];
    v60 = buf[3];
    v61 = (char *)v203[0];
    v62 = v203[3];
    v63 = __p;
    do
    {
      v65 = *v63;
      v64 = v63[1];
      v66 = *((_QWORD *)v63 + 1);
      v67 = *((_QWORD *)v63 + 3);
      if (v66 >= v67)
        goto LABEL_81;
      v68 = 0;
      v69 = 0;
      v70 = v64 - v65;
      v71 = (float *)&v41[4 * v65 + (unint64_t)v42 * v66];
      v72 = (float *)(v59 + v60 * v66 + 4 * v65);
      v73 = (unsigned __int8 *)(v57 + v65 + v58 * v66);
      v74 = 0.0;
      v75 = *((_QWORD *)v63 + 1);
      v76 = 0.0;
      do
      {
        if ((unint64_t)v64 > *(_QWORD *)v63)
        {
          v77 = v73;
          v78 = v72;
          v79 = v71;
          for (i = v70; i; --i)
          {
            if (*v77++)
            {
              v82 = *v78;
              if (v41)
              {
                v76 = v76 + v82;
                ++v68;
                if (*v79 <= 0.4)
                  goto LABEL_60;
              }
              else
              {
                v76 = v76 + v82;
                ++v68;
              }
              v74 = v74 + v82;
              ++v69;
            }
LABEL_60:
            ++v79;
            ++v78;
          }
        }
        ++v75;
        v71 = (float *)((char *)v42 + (_QWORD)v71);
        v72 = (float *)((char *)v72 + v60);
        v73 += v58;
      }
      while (v75 != v67);
      if (v68)
      {
        v83 = (float)v68;
        v19 = v195;
        v56 = v184;
        if ((float)((float)v68 * 0.75) >= (float)v69 || (v76 = v74, v83 = (float)v69, v69))
          v84 = v76 / v83;
        else
          v84 = 3.4028e38;
      }
      else
      {
        v84 = 0.0;
        v19 = v195;
        v56 = v184;
      }
      v85 = buf[3];
      v86 = &v61[(_QWORD)v62 * v66];
      v87 = v57 + v58 * v66;
      v88 = buf[0] + v66 * buf[3];
      do
      {
        if (v68)
        {
          v89 = *(_QWORD *)v63;
          v90 = v64 - *(_QWORD *)v63;
          if ((unint64_t)v64 > *(_QWORD *)v63)
          {
            v91 = (float *)&v86[4 * v89];
            v92 = (unsigned __int8 *)(v87 + v89);
            do
            {
              if (*v92++)
                *v91 = v84;
              ++v91;
              --v90;
            }
            while (v90);
          }
        }
        else
        {
          v94 = *(_QWORD *)v63;
          if (*(_QWORD *)v63 < (unint64_t)v64)
          {
            do
            {
              if (*(_BYTE *)(v87 + v94))
                *(_DWORD *)&v86[4 * v94] = *(_DWORD *)(v88 + 4 * v94);
              ++v94;
            }
            while ((_QWORD)v64 != v94);
          }
        }
        ++v66;
        v64 = v63[1];
        v86 = (char *)v62 + (_QWORD)v86;
        v87 += v58;
        v88 += v85;
      }
      while (v66 < *((_QWORD *)v63 + 3));
LABEL_81:
      v63 += 2;
    }
    while (v63 != v56);
LABEL_82:
    v181 = v197;
    v193 = v198;
    if (v197 == v198)
      goto LABEL_174;
    v95 = v203[3];
    v96 = v197;
    v190 = v204[0].i64[0];
    v191 = v14;
    v188 = (char *)v203[0];
    v189 = v204[1].i64[1];
    v186 = buf[3];
    v187 = buf[0];
LABEL_84:
    v98 = *(uint64x2_t **)v96;
    v97 = *(uint64x2_t **)(v96 + 8);
    if (*(uint64x2_t **)v96 == v97)
      goto LABEL_124;
    v99 = 0;
    v100 = v204[0].i64[0];
    v101 = v204[1].i64[1];
    v102 = buf[0];
    v103 = buf[3];
    v104 = *(uint64x2_t **)v96;
    v105 = (char *)v203[0];
    v106 = v203[3];
LABEL_86:
    v107 = v104->u64[1];
    v108 = v104[1];
    if (v107 >= v104[1].i64[1])
      goto LABEL_107;
LABEL_87:
    v109 = v104->i64[0];
    v110 = v108.i64[0];
    if (v104->i64[0] >= (unint64_t)v108.i64[0])
      goto LABEL_106;
    v111 = &v105[(_QWORD)v106 * v107];
    while (!*(_BYTE *)(v100 + v101 * v107 + v109))
    {
LABEL_104:
      if (++v109 == v110)
      {
        v108 = v104[1];
LABEL_106:
        if (++v107 >= v108.i64[1])
        {
LABEL_107:
          v120 = v104[2].u64[1];
          if (v120)
          {
            v121 = v104[3].u64[1];
            v122 = (float)v121;
            v123 = (float)v120;
            if ((float)((float)v120 * 0.75) >= (float)v121)
            {
              i32 = (float *)v104[2].i32;
LABEL_112:
              v125 = *i32 / v123;
            }
            else
            {
              if (v121)
              {
                i32 = (float *)v104[3].i32;
                v123 = v122;
                goto LABEL_112;
              }
              v125 = 3.4028e38;
            }
            *(float *)v104[4].i32 = v125;
          }
          v126 = v104[6].u64[0];
          v127 = (float)v126;
          v128 = v104[5].u64[0];
          if ((float)((float)v128 * 0.75) >= (float)v126)
          {
            if (!v128)
              goto LABEL_120;
            v129 = (float *)&v104[4].i32[2];
            v127 = (float)v128;
LABEL_119:
            v130 = *v129 / v127;
          }
          else
          {
            if (v126)
            {
              v129 = (float *)&v104[5].i32[2];
              goto LABEL_119;
            }
LABEL_120:
            v130 = 3.4028e38;
          }
          *(float *)&v104[6].i32[2] = v130;
          v104 += 7;
          ++v99;
          if (v104 == v97)
          {
LABEL_124:
            v131 = *(_QWORD *)(v96 + 40);
            v132 = *(_OWORD *)(v96 + 48);
            if (v131 >= *(_QWORD *)(v96 + 56))
              goto LABEL_153;
            while (2)
            {
              v133 = *(_QWORD *)(v96 + 32);
              v134 = v132;
              if (v133 >= (unint64_t)v132)
                goto LABEL_152;
              v135 = &v188[(_QWORD)v95 * v131];
              while (2)
              {
                if (*(_BYTE *)(v190 + v189 * v131 + v133) && *(float *)&v135[4 * v133] == -3.4028e38)
                {
                  if (v41)
                    v136 = *(float *)&v41[4 * v133 + v131 * (_QWORD)v42];
                  else
                    v136 = 1.0;
                  v137 = *(float *)(v187 + v186 * v131 + 4 * v133);
                  v138 = v98;
                  if (v98 != v97)
                  {
                    v139.i64[0] = v133;
                    v139.i64[1] = v131;
                    v140 = 3.4028e38;
                    v138 = v98;
                    v141 = v98;
                    do
                    {
                      v142 = (int64x2_t)vandq_s8((int8x16_t)vcgtq_u64(v141[1], v139), (int8x16_t)vcgeq_u64(v139, *v141));
                      if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v142, 1), (int8x16_t)v142).u64[0] & 0x8000000000000000) != 0)
                      {
                        v143 = v141 + 2;
                        if (!v141[2].i64[1])
                          v143 = (uint64x2_t *)((char *)v141 + 72);
                        v144 = vabds_f32(v137, *(float *)v143[2].i32);
                        if (v144 <= v140)
                        {
                          v138 = v141;
                          v140 = v144;
                        }
                      }
                      v141 += 7;
                    }
                    while (v141 != v97);
                  }
                  v145 = v137 + *(float *)v138[2].i32;
                  *(float *)v138[2].i32 = v145;
                  v146 = v138[2].i64[1] + 1;
                  v138[2].i64[1] = v146;
                  if (v136 <= 0.4)
                  {
                    v147 = v138[3].i64[1];
                  }
                  else
                  {
                    *(float *)v138[3].i32 = v137 + *(float *)v138[3].i32;
                    v147 = v138[3].i64[1] + 1;
                    v138[3].i64[1] = v147;
                  }
                  v148 = (float)(unint64_t)v146;
                  if ((float)((float)(unint64_t)v146 * 0.75) >= (float)(unint64_t)v147)
                  {
                    if (!v146)
                      goto LABEL_148;
LABEL_147:
                    v149 = v145 / v148;
                  }
                  else
                  {
                    if (v147)
                    {
                      v145 = *(float *)v138[3].i32;
                      v148 = (float)(unint64_t)v147;
                      goto LABEL_147;
                    }
LABEL_148:
                    v149 = 3.4028e38;
                  }
                  *(float *)v138[4].i32 = v149;
                  *(float *)&v135[4 * v133] = -1.0 - (float)(0x6DB6DB6DB6DB6DB7 * (v138 - v98));
                }
                if (++v133 != v134)
                  continue;
                break;
              }
              v132 = *(_OWORD *)(v96 + 48);
LABEL_152:
              if (++v131 < *((_QWORD *)&v132 + 1))
                continue;
              break;
            }
LABEL_153:
            v19 = v195;
            v14 = v191;
            if (v98 == v97)
              goto LABEL_163;
            v150 = v98 + 2;
            v151 = v98;
            while (2)
            {
              v152 = v150[1].u64[1];
              v153 = (float)v152;
              v154 = v150->u64[1];
              v155 = (float)v154;
              if ((float)((float)v154 * 0.75) >= (float)v152)
              {
                v156 = (float *)v150;
                if (!v154)
                  goto LABEL_160;
LABEL_159:
                v157 = *v156 / v155;
              }
              else
              {
                if (v152)
                {
                  v156 = (float *)v151[3].i32;
                  v155 = v153;
                  goto LABEL_159;
                }
LABEL_160:
                v157 = 3.4028e38;
              }
              *(float *)v150[2].i32 = v157;
              v151 += 7;
              v158 = v150 + 5;
              v150 += 7;
              if (v158 != v97)
                continue;
              break;
            }
            v132 = *(_OWORD *)(v96 + 48);
LABEL_163:
            v159 = *(_QWORD *)(v96 + 40);
            if (v159 < *((_QWORD *)&v132 + 1))
            {
              v160 = &v188[(_QWORD)v95 * v159];
              v161 = v190 + v189 * v159;
              do
              {
                v162 = *(_QWORD *)(v96 + 32);
                v163 = v132 - v162;
                if ((unint64_t)v132 > v162)
                {
                  v164 = (float *)&v160[4 * v162];
                  v165 = (unsigned __int8 *)(v161 + v162);
                  do
                  {
                    v166 = *v165++;
                    if (v166 && *v164 != 0.0)
                      *v164 = *(float *)v98[7 * (unint64_t)fabs(*v164 + 1.0) + 4].i32;
                    ++v164;
                    --v163;
                  }
                  while (v163);
                  v132 = *(_OWORD *)(v96 + 48);
                }
                ++v159;
                v160 = (char *)v95 + (_QWORD)v160;
                v161 += v189;
              }
              while (v159 < *((_QWORD *)&v132 + 1));
            }
            v96 += 64;
            if (v96 == v193)
            {
LABEL_174:
              if (v193 != v181 || (unint64_t)((char *)v184 - v180) > 0x20)
              {
                v167 = *(_QWORD *)&v205[8];
                v168 = *(_OWORD *)&v205[16];
                if (*(_QWORD *)&v205[8] < *(_QWORD *)&v205[24])
                {
                  v169 = v204[1].i64[1];
                  v170 = buf[3];
                  v171 = (char *)v203[3];
                  v172 = buf[0] + *(_QWORD *)&v205[8] * buf[3];
                  v173 = (char *)v203[0] + *(_QWORD *)&v205[8] * (uint64_t)v203[3];
                  v174 = v204[0].i64[0] + *(_QWORD *)&v205[8] * v204[1].i64[1];
                  do
                  {
                    v175 = v168 - *(_QWORD *)v205;
                    if ((unint64_t)v168 > *(_QWORD *)v205)
                    {
                      v176 = (float *)(v172 + 4 * *(_QWORD *)v205);
                      v177 = (unsigned __int8 *)(v174 + *(_QWORD *)v205);
                      v178 = (float *)&v173[4 * *(_QWORD *)v205];
                      do
                      {
                        v179 = *v177++;
                        if (v179 && *v178 == 0.0)
                          *v178 = *v176;
                        ++v176;
                        ++v178;
                        --v175;
                      }
                      while (v175);
                      v168 = *(_OWORD *)&v205[16];
                    }
                    ++v167;
                    v172 += v170;
                    v173 = &v171[(_QWORD)v173];
                    v174 += v169;
                  }
                  while (v167 < *((_QWORD *)&v168 + 1));
                }
              }
              if (v182)
                CVPixelBufferUnlockBaseAddress(v182, 1uLL);
              CVPixelBufferUnlockBaseAddress(v192, unlockFlags);
              CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
              CVPixelBufferUnlockBaseAddress(v185, 0);
              *(_QWORD *)v205 = &v197;
              std::vector<arkit::BoundingBoxGroup>::__destroy_vector::operator()[abi:ne180100]((void ***)v205);
              if (__p)
              {
                v201 = __p;
                operator delete(__p);
              }
              v27 = 0;
              goto LABEL_21;
            }
            goto LABEL_84;
          }
          goto LABEL_86;
        }
        goto LABEL_87;
      }
    }
    v112 = *(float *)(v102 + v103 * v107 + 4 * v109);
    if (v41)
    {
      v113 = *(float *)&v41[4 * v109 + v107 * (_QWORD)v42];
      *(float *)&v104[4].i32[2] = v112 + *(float *)&v104[4].i32[2];
      ++v104[5].i64[0];
      if (v113 <= 0.4)
      {
        v114 = 0;
        goto LABEL_95;
      }
    }
    else
    {
      *(float *)&v104[4].i32[2] = v112 + *(float *)&v104[4].i32[2];
      ++v104[5].i64[0];
    }
    *(float *)&v104[5].i32[2] = v112 + *(float *)&v104[5].i32[2];
    ++v104[6].i64[0];
    v114 = 1;
LABEL_95:
    if (*(float *)&v111[4 * v109] != -3.4028e38)
    {
      if (&v104[7] == v97)
      {
LABEL_100:
        *(float *)v104[2].i32 = v112 + *(float *)v104[2].i32;
        ++v104[2].i64[1];
        v119 = -1.0 - (float)v99;
        if (v114)
        {
          *(float *)v104[3].i32 = v112 + *(float *)v104[3].i32;
          ++v104[3].i64[1];
          v119 = -1.0 - (float)v99;
        }
      }
      else
      {
        v115.i64[0] = v109;
        v115.i64[1] = v107;
        v116 = 7;
        while (1)
        {
          v117 = &v104[v116];
          v118 = (int64x2_t)vandq_s8((int8x16_t)vcgtq_u64(v104[v116 + 1], v115), (int8x16_t)vcgeq_u64(v115, v104[v116]));
          if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v118, 1), (int8x16_t)v118).u64[0] & 0x8000000000000000) != 0)
            break;
          v116 += 7;
          if (&v117[7] == v97)
            goto LABEL_100;
        }
        v119 = -3.4028e38;
      }
      *(float *)&v111[4 * v109] = v119;
    }
    goto LABEL_104;
  }
  v43 = v204[0].i64[1];
  if (v204[0].i64[1])
  {
    v44 = 0;
    v45 = v204[1];
    v46 = (_DWORD *)buf[0];
    v47 = buf[3];
    v48 = (char *)v203[0];
    v49 = (char *)v203[3];
    v50 = v204[0].i64[0];
    do
    {
      if (v45.i64[0])
      {
        v51 = (unsigned __int8 *)v50;
        v52 = v46;
        v53 = v48;
        v54 = v45.i64[0];
        do
        {
          if (*v51++)
            *(_DWORD *)v53 = *v52;
          v53 += 4;
          ++v52;
          --v54;
        }
        while (v54);
      }
      ++v44;
      v48 = &v49[(_QWORD)v48];
      v46 = (_DWORD *)((char *)v46 + v47);
      v50 += v45.i64[1];
    }
    while (v44 != v43);
  }
  CVPixelBufferUnlockBaseAddress(v192, unlockFlags);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v185, 0);
  v27 = 0;
  v14 = v16;
LABEL_21:

  return v27;
}

- (int)_minFilterDepthMap:(__CVBuffer *)a3 kernelSize:(unint64_t)a4 pResultBuffer:(__CVBuffer *)a5
{
  __CVPixelBufferPool **p_depthPixelBufferPool;
  double Width;
  double Height;
  CVPixelBufferRef v12;
  __CVBuffer *v13;
  vImage_Error v14;
  char *minFilterIntermediatePooledBuffer;
  int result;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  unint64_t minFilterIntermediateBufferSize;
  char *v21;
  vImage_Error v22;
  vImage_Buffer v23;
  vImage_Buffer src;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARPersonOcclusionTechnique *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  vImage_Error v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_depthPixelBufferPool = &self->_depthPixelBufferPool;
  if (a3)
  {
    Width = (double)CVPixelBufferGetWidth(a3);
    Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v12 = ARCreateCVPixelBufferFromPool(p_depthPixelBufferPool, 1717855600, self, CFSTR("Result Depth Map"), Width, Height);
  if (!v12)
    return -6662;
  v13 = v12;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v13, 0);
  memset(&src, 0, sizeof(src));
  ARWrapCVPixelBufferVImage(a3, &src.data);
  memset(&v23, 0, sizeof(v23));
  ARWrapCVPixelBufferVImage(v13, &v23.data);
  kdebug_trace();
  v14 = vImageMin_PlanarF(&src, &v23, 0, 0, 0, a4, a4, 0x80u);
  if (v14 == self->_minFilterIntermediateBufferSize)
  {
    minFilterIntermediatePooledBuffer = self->_minFilterIntermediatePooledBuffer;
  }
  else
  {
    _ARLogTechnique();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      minFilterIntermediateBufferSize = self->_minFilterIntermediateBufferSize;
      *(_DWORD *)buf = 138544130;
      v26 = v19;
      v27 = 2048;
      v28 = self;
      v29 = 2048;
      v30 = minFilterIntermediateBufferSize;
      v31 = 2048;
      v32 = v14;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changing minFilter buffer from size (%ti) to size (%ti)", buf, 0x2Au);

    }
    v21 = self->_minFilterIntermediatePooledBuffer;
    if (v21)
      free(v21);
    self->_minFilterIntermediateBufferSize = v14;
    minFilterIntermediatePooledBuffer = (char *)malloc_type_malloc(v14, 0x3B85704BuLL);
    self->_minFilterIntermediatePooledBuffer = minFilterIntermediatePooledBuffer;
  }
  v22 = vImageMin_PlanarF(&src, &v23, minFilterIntermediatePooledBuffer, 0, 0, a4, a4, 0x10u);
  kdebug_trace();
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v13, 0);
  if (v22)
  {
    CVPixelBufferRelease(v13);
    return -6660;
  }
  else
  {
    result = 0;
    *a5 = v13;
  }
  return result;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v11.receiver = self;
  v11.super_class = (Class)ARPersonOcclusionTechnique;
  -[ARTechnique _fullDescription](&v11, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferPoolGetPixelBufferAttributes(self->_depthPixelBufferPool);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tDepthPixelBufferPool attr: %@\n"), v9);

  return v5;
}

- (void).cxx_destruct
{
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_varExpFilter);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
