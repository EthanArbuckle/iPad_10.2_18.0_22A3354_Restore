@implementation ARImageDistortionCorrectionTechnique

- (ARImageDistortionCorrectionTechnique)initWithImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  ARImageDistortionCorrectionTechnique *v5;
  ARImageDistortionCorrectionTechnique *v6;
  double *p_width;
  _BOOL4 v8;
  _BOOL4 engaged;
  float *begin;
  float *v11;
  __int128 v13;
  void *__p[2];
  float *v15;
  __int128 v16;
  float *v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)ARImageDistortionCorrectionTechnique;
  v5 = -[ARTechnique init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    p_width = &v5->_imageSize.width;
    v5->_imageSize.width = width;
    v5->_imageSize.height = height;
    v8 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.distortionCorrection.computeCoefficientsForEveryFrame"));
    v6->_computeUndistortionCoefficientsForEveryFrame = v8;
    if (v8)
    {
      *(_QWORD *)&v13 = (unint64_t)*p_width;
      *((_QWORD *)&v13 + 1) = (unint64_t)v6->_imageSize.height;
      std::vector<float>::vector(__p, *((_QWORD *)&v13 + 1) * v13);
      std::vector<float>::vector(&v16, *((_QWORD *)&v13 + 1) * v13);
      engaged = v6->_undistorter.__engaged_;
      *(_OWORD *)&v6->_undistorter.var0.__null_state_ = v13;
      if (engaged)
      {
        begin = v6->_undistorter.var0.__val_.m_mappingU.__begin_;
        if (begin)
        {
          v6->_undistorter.var0.__val_.m_mappingU.__end_ = begin;
          operator delete(begin);
          v6->_undistorter.var0.__val_.m_mappingU.__begin_ = 0;
          v6->_undistorter.var0.__val_.m_mappingU.__end_ = 0;
          v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = 0;
        }
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingU.__begin_ = *(_OWORD *)__p;
        v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = v15;
        __p[0] = 0;
        __p[1] = 0;
        v15 = 0;
        v11 = v6->_undistorter.var0.__val_.m_mappingV.__begin_;
        if (v11)
        {
          v6->_undistorter.var0.__val_.m_mappingV.__end_ = v11;
          operator delete(v11);
          v6->_undistorter.var0.__val_.m_mappingV.__begin_ = 0;
          v6->_undistorter.var0.__val_.m_mappingV.__end_ = 0;
          v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = 0;
          v11 = (float *)__p[0];
        }
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingV.__begin_ = v16;
        v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = v17;
        v16 = 0uLL;
        v17 = 0;
        if (v11)
        {
          __p[1] = v11;
          operator delete(v11);
        }
      }
      else
      {
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingU.__begin_ = *(_OWORD *)__p;
        v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = v15;
        __p[1] = 0;
        v15 = 0;
        __p[0] = 0;
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingV.__begin_ = v16;
        v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = v17;
        v6->_undistorter.__engaged_ = 1;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_undistortedImageBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARImageDistortionCorrectionTechnique;
  -[ARImageDistortionCorrectionTechnique dealloc](&v3, sel_dealloc);
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  CGSize *p_imageSize;
  CGSize *p_height;
  double width;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  id v35;
  void *v36;
  OSType PixelFormatType;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  optional<(anonymous namespace)::Undistorter> *p_undistorter;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  _BOOL4 v50;
  NSObject *v51;
  double v52;
  double v53;
  double v54;
  float v55;
  float v56;
  uint64_t v57;
  float32x4_t v58;
  unint64_t v59;
  uint64_t v60;
  float v61;
  unint64_t v62;
  float v63;
  uint64_t v69;
  unint64_t v70;
  float32x4_t v71;
  uint64_t v72;
  uint64_t v73;
  float32x4_t v74;
  long double v75;
  float64x2_t v76;
  double v77;
  double v78;
  long double v79;
  long double v80;
  long double v81;
  long double v82;
  long double v83;
  long double v84;
  long double v85;
  float v87;
  uint64_t v89;
  uint64_t v90;
  unint64_t m_unrotatedImageWidth;
  double v92;
  double v93;
  unint64_t m_unrotatedImageHeight;
  double v95;
  double v96;
  id v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float32x2_t v107;
  float v108;
  unint64_t v109;
  float v110;
  float32x2_t v111;
  uint64_t v112;
  uint64_t v113;
  float32x2_t v114;
  float32x2_t v115;
  uint64_t v116;
  float v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  float v126;
  float32x2_t v127;
  float32x2_t v128;
  float v129;
  float v130;
  float v131;
  float32x2_t v132;
  uint64_t v133;
  __CVBuffer *v134;
  uint64_t v135;
  NSObject *v136;
  NSObject *v137;
  BOOL v138;
  id v139;
  void *v141;
  float32x4_t v142;
  uint64_t v143;
  uint64_t v144;
  __CVBuffer *pixelBuffer;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float32x4_t v153;
  id v154;
  float64x2_t v155;
  float v156;
  float v157;
  void *v158;
  uint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  objc_super v164;
  uint64_t v165;
  _OWORD v166[2];
  uint8_t buf[16];
  __int128 v168;
  uint8_t v169[128];
  uint8_t v170[4];
  uint64_t v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v164.receiver = self;
  v164.super_class = (Class)ARImageDistortionCorrectionTechnique;
  v154 = a3;
  v4 = -[ARTechnique processData:](&v164, sel_processData_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_111;
  objc_msgSend(v154, "latestResizedUltraWideImageData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_3;
  objc_msgSend(v154, "originalImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C89F98]);

  if ((v12 & 1) != 0)
  {
    v5 = v154;
    if (v5)
    {
LABEL_3:
      v146 = v5;
      objc_msgSend(v5, "downScalingResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") == 0;

      if (v7)
      {
        v13 = v146;
        goto LABEL_12;
      }
      v8 = objc_msgSend(v146, "rotationOfResultTensor");
      v9 = v8;
      if (v8 > 89)
      {
        if (v8 == 90)
        {
          v9 = -90;
        }
        else if (v8 == 180)
        {
          goto LABEL_15;
        }
      }
      else
      {
        if (v8 != -90)
        {
          if (v8)
            goto LABEL_18;
LABEL_15:
          p_imageSize = &self->_imageSize;
          p_height = (CGSize *)&self->_imageSize.height;
          goto LABEL_19;
        }
        v9 = 90;
      }
LABEL_18:
      p_height = &self->_imageSize;
      p_imageSize = (CGSize *)&self->_imageSize.height;
LABEL_19:
      width = p_height->width;
      v18 = p_imageSize->width;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      objc_msgSend(v146, "downScalingResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v160, v169, 16);
      if (v20)
      {
        v21 = 0;
        v22 = *(_QWORD *)v161;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v161 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
            objc_msgSend(v24, "imageResolution");
            if (v26 == v18 && v25 == width)
            {
              v28 = v24;

              v21 = v28;
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v160, v169, 16);
        }
        while (v20);

        if (v21)
        {
          v29 = (_QWORD *)MEMORY[0x1E0C89F98];
          if (!self->_computeUndistortionCoefficientsForEveryFrame && !self->_undistortionMappingsForRotations)
          {
            objc_msgSend(v146, "originalImageData");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "timestamp");
            objc_msgSend(v158, "cameraType");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "isEqualToString:", *v29);
            objc_msgSend(v158, "calibrationData");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "isEqual:", 0);
            kdebug_trace();

            objc_msgSend(v158, "calibrationData");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32 == 0;

            if (v33)
            {
              -[ARImageDistortionCorrectionTechnique buildUVMapFromHardcodedCalibrationParameters](self, "buildUVMapFromHardcodedCalibrationParameters");
            }
            else
            {
              objc_msgSend(v158, "calibrationData");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARImageDistortionCorrectionTechnique buildUVMapWithCameraCalibrationData:](self, "buildUVMapWithCameraCalibrationData:", v34);

            }
            kdebug_trace();

          }
          PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v21, "pixelBuffer"));
          pixelBuffer = ARCreateCVPixelBufferFromPool(&self->_undistortedImageBufferPool, PixelFormatType, self, CFSTR("undistorted image"), v18, width);
          objc_msgSend(v146, "timestamp");
          objc_msgSend(v146, "originalImageData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "cameraType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "isEqualToString:", *v29);
          objc_msgSend(v21, "imageResolution");
          objc_msgSend(v21, "imageResolution");
          kdebug_trace();

          if (!self->_computeUndistortionCoefficientsForEveryFrame)
          {
            -[ARImageDistortionCorrectionTechnique undistortImage:toTargetImage:imageRotationAngle:](self, "undistortImage:toTargetImage:imageRotationAngle:", objc_msgSend(v21, "pixelBuffer"), pixelBuffer, v9);
LABEL_110:
            objc_msgSend(v21, "setUndistortedPixelBuffer:", pixelBuffer);
            objc_msgSend(v146, "timestamp");
            CVPixelBufferGetWidth(pixelBuffer);
            CVPixelBufferGetHeight(pixelBuffer);
            kdebug_trace();
            CVPixelBufferRelease(pixelBuffer);

LABEL_111:
            v36 = v154;
            v139 = v154;
            goto LABEL_112;
          }
          objc_msgSend(v146, "originalImageData");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "calibrationData");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          kdebug_trace();
          p_undistorter = &self->_undistorter;
          if (v41)
          {
            objc_msgSend(v41, "lensDistortionCenter");
            v44 = v43;
            v46 = v45;
            v48 = *MEMORY[0x1E0C9D538];
            v47 = *(double *)(MEMORY[0x1E0C9D538] + 8);
            _ARLogTechnique();
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
            if (v44 == v48 && v46 == v47)
            {
              if (v50)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B3A68000, v49, OS_LOG_TYPE_DEBUG, "lensDistortionCenter is set to CGPointZero, skipping creating UV map for distortion correction", buf, 2u);
              }

LABEL_109:
              CVPixelBufferRelease(pixelBuffer);
              pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v21, "pixelBuffer"));
              goto LABEL_110;
            }
            if (v50)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B3A68000, v49, OS_LOG_TYPE_DEBUG, "Building distortion correction UV map from calibration data", buf, 2u);
            }

            m_unrotatedImageWidth = p_undistorter->var0.__val_.m_unrotatedImageWidth;
            objc_msgSend(v41, "intrinsicMatrixReferenceDimensions");
            v93 = v92;
            m_unrotatedImageHeight = p_undistorter->var0.__val_.m_unrotatedImageHeight;
            objc_msgSend(v41, "intrinsicMatrixReferenceDimensions");
            v96 = v95;
            kdebug_trace();
            objc_msgSend(v41, "lensDistortionLookupTable");
            v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v98 = objc_msgSend(v97, "bytes");
            v99 = objc_msgSend(v97, "length");
            v100 = p_undistorter->var0.__val_.m_unrotatedImageWidth;
            if (p_undistorter->var0.__val_.m_unrotatedImageWidth)
            {
              v101 = 0;
              v102 = v93;
              v103 = (float)m_unrotatedImageWidth / v102;
              v104 = v96;
              v105 = v44;
              v107.f32[0] = v103 * v105;
              v106 = v46;
              v107.f32[1] = (float)((float)m_unrotatedImageHeight / v104) * v106;
              v108 = (float)v100;
              v109 = p_undistorter->var0.__val_.m_unrotatedImageHeight;
              v110 = (float)v109;
              v111.f32[0] = (float)v100;
              v111.f32[1] = (float)v109;
              v112 = (v99 >> 2) - 1;
              v113 = 4 * v109;
              v114 = vmaxnm_f32(v107, vsub_f32(v111, v107));
              v115 = vmul_f32(v114, v114);
              while (!v109)
              {
                v121 = v101 + 1;
LABEL_97:
                v101 = v121;
                if (v121 == v100)
                  goto LABEL_98;
              }
              v116 = 0;
              v117 = (float)v101;
              v118 = ~v101;
              v119 = v100 + ~v101;
              v120 = v119 * v109;
              v121 = v101 + 1;
              v122 = (v101 + 1) * v109;
              v123 = v113 * (v101 + 1) - 4;
              v124 = v109 * v100 - 1 - v101;
              v125 = v113 * v119;
              v126 = sqrtf(vaddv_f32(v115));
              while (1)
              {
                v127.f32[0] = v117;
                v127.f32[1] = (float)v116;
                v128 = vsub_f32(v127, v107);
                v129 = sqrtf(vaddv_f32(vmul_f32(v128, v128)));
                if (v129 >= v126)
                {
                  v131 = *(float *)(v98 + 4 * v112);
                }
                else
                {
                  v130 = (float)(v129 * (float)(unint64_t)v112) / v126;
                  v131 = (float)((float)(v130 - (float)(int)v130) * *(float *)(v98 + 4 * (int)v130 + 4))
                       + (float)((float)(1.0 - (float)(v130 - (float)(int)v130)) * *(float *)(v98 + 4 * (int)v130));
                }
                v132 = vadd_f32(v107, vmla_n_f32(v128, v128, v131));
                if (v9 > 89)
                {
                  if (v9 == 90)
                  {
                    v133 = v122 + ~v116;
                    *(float *)((char *)p_undistorter->var0.__val_.m_mappingU.__begin_ + v123) = v110 - v132.f32[1];
                    goto LABEL_93;
                  }
                  if (v9 == 180)
                  {
                    v133 = v118 + (v109 - v116) * v100;
                    p_undistorter->var0.__val_.m_mappingU.__begin_[v124] = v108 - v132.f32[0];
                    v132.f32[0] = v110 - v132.f32[1];
                    goto LABEL_93;
                  }
                }
                else
                {
                  if (v9 == -90)
                  {
                    v133 = v116 + v120;
                    *(_DWORD *)((char *)&p_undistorter->var0.__val_.m_mappingU.__begin_[v116] + v125) = v132.i32[1];
                    v132.f32[0] = v108 - v132.f32[0];
                    goto LABEL_93;
                  }
                  if (!v9)
                  {
                    LODWORD(p_undistorter->var0.__val_.m_mappingU.__begin_[v101]) = v132.i32[0];
                    v132.i32[0] = v132.i32[1];
                    v133 = v101;
LABEL_93:
                    LODWORD(p_undistorter->var0.__val_.m_mappingV.__begin_[v133]) = v132.i32[0];
                  }
                }
                ++v116;
                v101 += v100;
                v123 -= 4;
                v124 -= v100;
                if (v109 == v116)
                  goto LABEL_97;
              }
            }
LABEL_98:

LABEL_99:
            kdebug_trace();

            v134 = (__CVBuffer *)objc_msgSend(v21, "pixelBuffer");
            CVPixelBufferLockBaseAddress(v134, 1uLL);
            *(_OWORD *)buf = 0u;
            v168 = 0u;
            ARWrapCVPixelBufferVImage(v134, (void **)buf);
            CVPixelBufferLockBaseAddress(pixelBuffer, 0);
            memset(v166, 0, sizeof(v166));
            ARWrapCVPixelBufferVImage(pixelBuffer, (void **)v166);
            kdebug_trace();
            v165 = 0;
            v135 = vImageMapping_CreateFromMap_Image8U();
            kdebug_trace();
            if (v135)
            {
              kdebug_trace();
              v165 = vImageRemap_Image8U();
              if (v165)
              {
                _ARLogTechnique();
                v136 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v170 = 134217984;
                  v171 = v165;
                  _os_log_impl(&dword_1B3A68000, v136, OS_LOG_TYPE_ERROR, "Image undistortion failed with error code : %ld", v170, 0xCu);
                }

              }
              kdebug_trace();
              vImageMapping_Release();
            }
            else
            {
              _ARLogTechnique();
              v137 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v170 = 134217984;
                v171 = v165;
                _os_log_impl(&dword_1B3A68000, v137, OS_LOG_TYPE_ERROR, "Image mapping creation failed with error code : %ld", v170, 0xCu);
              }

            }
            CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
            CVPixelBufferUnlockBaseAddress(v134, 1uLL);
            v138 = v165 == 0;

            if (v138)
              goto LABEL_110;
            goto LABEL_109;
          }
          _ARLogTechnique();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B3A68000, v51, OS_LOG_TYPE_DEBUG, "Building distortion correction UV map from hardcoded parameters", buf, 2u);
          }

          v52 = ARFixedIntrinsicsForBackUltraWideCamera640x480();
          v55 = ARAdjustIntrinsicsForViewportSize(*(float *)&v52, v53, v54, 640.0, 480.0, (double)p_undistorter->var0.__val_.m_unrotatedImageWidth, (double)p_undistorter->var0.__val_.m_unrotatedImageHeight);
          v156 = v56;
          v157 = v55;
          v159 = v57;
          *(double *)v58.i64 = ARRadialDistortionForUltraWideCamera();
          v59 = p_undistorter->var0.__val_.m_unrotatedImageWidth;
          if (!p_undistorter->var0.__val_.m_unrotatedImageWidth)
            goto LABEL_99;
          v141 = v40;
          v60 = 0;
          v61 = (float)v59;
          v62 = p_undistorter->var0.__val_.m_unrotatedImageHeight;
          v63 = (float)v62;
          _S11 = v156;
          v151 = vcvtq_f64_f32(*(float32x2_t *)v58.f32);
          v152 = vcvt_hight_f64_f32(v58);
          v143 = 4 * v62;
          __asm { FMOV            V0.4S, #1.0 }
          v142 = _Q0;
          while (!v62)
          {
            v90 = v60 + 1;
LABEL_73:
            v60 = v90;
            if (v90 == v59)
            {
              v41 = 0;
              v40 = v141;
              goto LABEL_99;
            }
          }
          v69 = 0;
          v150 = ~v60;
          v70 = v59 + ~v60;
          v148 = (v60 + 1) * v62;
          v149 = v70 * v62;
          v71 = v142;
          v71.f32[0] = (float)((float)v60 - *(float *)&v159) / v157;
          v144 = v60 + 1;
          v72 = v143 * (v60 + 1) - 4;
          v73 = v62 * v59 - 1 - v60;
          v147 = v143 * v70;
          v153 = v71;
          while (1)
          {
            v74 = v71;
            v74.f32[1] = (float)((float)v69 - *((float *)&v159 + 1)) / _S11;
            *(_QWORD *)&v75 = *(_OWORD *)&vcvt_hight_f64_f32(v74);
            v76 = vcvtq_f64_f32(*(float32x2_t *)v74.f32);
            v77 = vmlad_n_f64(vmuld_lane_f64(v76.f64[1], v76, 1), v76.f64[0], v76.f64[0]);
            if (v77 >= 0.00000001)
            {
              v79 = sqrt(v77);
              v155 = v76;
              v80 = atan2(v79, v75);
              v81 = v80 * (v80 * v80);
              v82 = v80 * v80 * v81;
              v83 = v80 * v80 * v82;
              v84 = v80 * v80 * v83;
              v85 = v80 + v151.f64[0] * v81 + v151.f64[1] * v82;
              v71 = v153;
              v76 = v155;
              *(float *)&v85 = v85 + v152.f64[0] * v83 + v152.f64[1] * v84;
              v78 = *(float *)&v85 / v79;
            }
            else
            {
              if (v75 == 0.0)
                __assert_rtn("radialDistortedPoint", "ARImageDistortionCorrectionTechnique.mm", 233, "success");
              v78 = 1.0 / v75;
            }
            *(_QWORD *)&v76.f64[1] = vextq_s8((int8x16_t)v76, (int8x16_t)v76, 8uLL).u64[0];
            _D2 = vcvt_f32_f64(vmulq_n_f64(v76, v78));
            v87 = vmlas_n_f32(*(float *)&v159, v157, _D2.f32[0]);
            __asm { FMLA            S0, S11, V2.S[1] }
            if (v9 > 89)
            {
              if (v9 == 90)
              {
                v89 = v148 + ~v69;
                *(float *)((char *)p_undistorter->var0.__val_.m_mappingU.__begin_ + v72) = v63 - _S0;
                _S0 = v87;
                goto LABEL_69;
              }
              if (v9 == 180)
              {
                v89 = v150 + (v62 - v69) * v59;
                p_undistorter->var0.__val_.m_mappingU.__begin_[v73] = v61 - v87;
                _S0 = v63 - _S0;
                goto LABEL_69;
              }
            }
            else
            {
              if (v9 == -90)
              {
                v89 = v69 + v149;
                *(float *)((char *)&p_undistorter->var0.__val_.m_mappingU.__begin_[v69] + v147) = _S0;
                _S0 = v61 - v87;
                goto LABEL_69;
              }
              if (!v9)
              {
                p_undistorter->var0.__val_.m_mappingU.__begin_[v60] = v87;
                v89 = v60;
LABEL_69:
                p_undistorter->var0.__val_.m_mappingV.__begin_[v89] = _S0;
              }
            }
            ++v69;
            v60 += v59;
            v72 -= 4;
            v73 -= v59;
            if (v62 == v69)
            {
              v90 = v144;
              goto LABEL_73;
            }
          }
        }
      }
      else
      {

      }
      v35 = v154;

      goto LABEL_39;
    }
  }
  v13 = 0;
LABEL_12:
  v14 = v154;

LABEL_39:
  v36 = v154;
LABEL_112:

  return v154;
}

- (void)buildUVMapWithDistortedPixelProviderBlock:(id)a3
{
  double (**v4)(_QWORD, double, double);
  CGSize *p_imageSize;
  double height;
  double width;
  ARUndistortionMapping *v8;
  ARUndistortionMapping *v9;
  ARUndistortionMapping *v10;
  ARUndistortionMapping *v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  float v24;
  unsigned int v25;
  double v26;
  float v27;
  unsigned int v28;
  unsigned int v29;
  NSDictionary *v30;
  NSDictionary *undistortionMappingsForRotations;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v4 = (double (**)(_QWORD, double, double))a3;
  p_imageSize = &self->_imageSize;
  width = self->_imageSize.width;
  height = self->_imageSize.height;
  v8 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", width, height);
  v9 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", height, width);
  v10 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", self->_imageSize.width, self->_imageSize.height);
  v11 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", height, width);
  v12 = self->_imageSize.width;
  if (v12 > 0.0)
  {
    v13 = 0;
    v14 = width + -1.0;
    v15 = self->_imageSize.height;
    v16 = 0.0;
    do
    {
      if (v15 > 0.0)
      {
        v17 = 0.0;
        v18 = 1;
        do
        {
          v19 = (void *)MEMORY[0x1B5E2DDB0]();
          v20 = v4[2](v4, v16, v17);
          v21 = p_imageSize->width;
          v22 = self->_imageSize.height;
          v23 = (v16 + v17 * p_imageSize->width);
          v24 = v20;
          v8->_mappingU.__begin_[v23] = v24;
          v25 = (height + v16 * height + -1.0 - v17);
          v27 = v26;
          v8->_mappingV.__begin_[v23] = v27;
          *(float *)&v26 = v22 - v26;
          v9->_mappingU.__begin_[v25] = *(float *)&v26;
          v9->_mappingV.__begin_[v25] = v24;
          v28 = (v21 + (v22 + -1.0 - v17) * v21 + -1.0 - v16);
          *(float *)&v20 = v21 - v20;
          v10->_mappingU.__begin_[v28] = *(float *)&v20;
          v10->_mappingV.__begin_[v28] = *(float *)&v26;
          v29 = (v17 + (v14 - v16) * height);
          v11->_mappingU.__begin_[v29] = v27;
          v11->_mappingV.__begin_[v29] = *(float *)&v20;
          objc_autoreleasePoolPop(v19);
          v17 = (double)v18;
          v15 = self->_imageSize.height;
          ++v18;
        }
        while (v15 > v17);
        v12 = p_imageSize->width;
      }
      v16 = (double)++v13;
    }
    while (v12 > (double)v13);
  }
  v32[0] = &unk_1E66CD558;
  v32[1] = &unk_1E66CD570;
  v33[0] = v8;
  v33[1] = v9;
  v32[2] = &unk_1E66CD588;
  v32[3] = &unk_1E66CD5A0;
  v33[2] = v10;
  v33[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  undistortionMappingsForRotations = self->_undistortionMappingsForRotations;
  self->_undistortionMappingsForRotations = v30;

}

- (void)buildUVMapWithCameraCalibrationData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_class *v14;
  void *v15;
  double width;
  double v17;
  double v18;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_class *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  double v30;
  double v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  ARImageDistortionCorrectionTechnique *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lensDistortionCenter");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  _ARLogTechnique();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v6 == v9 && v8 == v10)
  {
    if (v12)
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: lensDistortionCenter is set to CGPointZero, skipping creating UV map for distortion correction", buf, 0x16u);

    }
  }
  else
  {
    if (v12)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v15;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Building distortion correction UV map from calibration data", buf, 0x16u);

    }
    width = self->_imageSize.width;
    objc_msgSend(v4, "intrinsicMatrixReferenceDimensions");
    v18 = v17;
    height = self->_imageSize.height;
    objc_msgSend(v4, "intrinsicMatrixReferenceDimensions");
    v21 = v20;
    objc_msgSend(v4, "lensDistortionCenter");
    v23 = v22;
    objc_msgSend(v4, "lensDistortionCenter");
    v25 = height / v21 * v24;
    kdebug_trace();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__ARImageDistortionCorrectionTechnique_buildUVMapWithCameraCalibrationData___block_invoke;
    v28[3] = &unk_1E6674490;
    v28[4] = self;
    v29 = v4;
    v30 = width / v18 * v23;
    v31 = v25;
    -[ARImageDistortionCorrectionTechnique buildUVMapWithDistortedPixelProviderBlock:](self, "buildUVMapWithDistortedPixelProviderBlock:", v28);

  }
}

double __76__ARImageDistortionCorrectionTechnique_buildUVMapWithCameraCalibrationData___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lensDistortionLookupTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v7, a2, a3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 160));
  v9 = v8;

  return v9;
}

- (void)buildUVMapFromHardcodedCalibrationParameters
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  ARImageDistortionCorrectionTechnique *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v5;
    v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Building distortion correction UV map from hardcoded parameters", buf, 0x16u);

  }
  v6 = ARFixedIntrinsicsForBackUltraWideCamera640x480();
  *(float *)&v9 = ARAdjustIntrinsicsForViewportSize(*(float *)&v6, v7, v8, 640.0, 480.0, self->_imageSize.width, self->_imageSize.height);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  *(double *)&v12 = ARRadialDistortionForUltraWideCamera();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__ARImageDistortionCorrectionTechnique_buildUVMapFromHardcodedCalibrationParameters__block_invoke;
  v16[3] = &__block_descriptor_96_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
  v17 = DWORD2(v13);
  v16[4] = v13;
  v18 = 0;
  v20 = DWORD2(v14);
  v19 = v14;
  v21 = 0;
  v23 = DWORD2(v15);
  v22 = v15;
  v24 = 0;
  v25 = v12;
  -[ARImageDistortionCorrectionTechnique buildUVMapWithDistortedPixelProviderBlock:](self, "buildUVMapWithDistortedPixelProviderBlock:", v16);
}

double __84__ARImageDistortionCorrectionTechnique_buildUVMapFromHardcodedCalibrationParameters__block_invoke(uint64_t a1, double a2, double a3)
{
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float32x4_t v9;
  long double v10;
  long double v11;
  float64x2_t v22;
  float64x2_t v23;
  __int128 v24;

  _Q3 = *(_OWORD *)(a1 + 64);
  v4 = *(float *)(a1 + 32);
  v5 = (float)((float)((float)a2 - *(float *)&_Q3) / v4);
  v6 = (float)((float)((float)a3 - COERCE_FLOAT(HIDWORD(*(_QWORD *)(a1 + 64)))) / *(float *)(a1 + 52));
  v7 = v6 * v6 + v5 * v5;
  v8 = 1.0;
  if (v7 >= 0.00000001)
  {
    v9 = *(float32x4_t *)(a1 + 80);
    v22 = vcvtq_f64_f32(*(float32x2_t *)v9.f32);
    v23 = vcvt_hight_f64_f32(v9);
    v10 = sqrt(v7);
    v24 = *(_OWORD *)(a1 + 64);
    v11 = atan2(v10, 1.0);
    *(double *)&_Q3 = v11 * v11 * (v11 * (v11 * v11));
    _D1 = v11 * v11 * (v11 * v11 * *(double *)&_Q3);
    _V5.D[1] = v22.f64[1];
    __asm { FMLA            D0, D3, V5.D[1] }
    _V2.D[1] = v23.f64[1];
    LODWORD(_Q3) = v24;
    __asm { FMLA            D0, D1, V2.D[1] }
    *(float *)&_D0 = _D0;
    v8 = *(float *)&_D0 / v10;
  }
  return *(float *)&_Q3 + v4 * (v8 * v5);
}

- (void)undistortImage:(__CVBuffer *)a3 toTargetImage:(__CVBuffer *)a4 imageRotationAngle:(int64_t)a5
{
  NSDictionary *undistortionMappingsForRotations;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  _OWORD v16[2];
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  ARImageDistortionCorrectionTechnique *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  CVPixelBufferLockBaseAddress(a3, 0);
  v18 = 0u;
  v19 = 0u;
  ARWrapCVPixelBufferVImage(a3, (void **)&v18);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(v17, 0, sizeof(v17));
  ARWrapCVPixelBufferVImage(a4, (void **)v17);
  undistortionMappingsForRotations = self->_undistortionMappingsForRotations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](undistortionMappingsForRotations, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v18;
  v16[1] = v19;
  objc_msgSend(v11, "createVImageMappingIfNeededForImage:", v16);
  kdebug_trace();
  v12 = vImageRemap_Image8U();
  if (v12)
  {
    _ARLogTechnique();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = v12;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Image undistortion failed with error code : %ld", buf, 0x20u);

    }
  }
  kdebug_trace();
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);

}

- (CGPoint)lensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6
{
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat height;
  CGFloat width;
  double x;
  double y;
  CGPoint result;

  height = a6.height;
  width = a6.width;
  x = a5.x;
  y = a5.y;
  v6 = a3.y;
  v7 = a3.x;
  v8 = objc_retainAutorelease(a4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11.f64[0] = width;
  v11.f64[1] = height;
  v12.f64[0] = x;
  v12.f64[1] = y;
  v13 = vsubq_f64(v11, v12);
  *(float32x2_t *)&v12.f64[0] = vcvt_f32_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v12), (int8x16_t)v13, (int8x16_t)v12));
  v14 = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v12.f64[0], *(float32x2_t *)&v12.f64[0])));
  v15 = v7 - x;
  v16 = v6 - y;
  v17 = sqrtf(vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v16), LODWORD(v15)), (float32x2_t)__PAIR64__(LODWORD(v16), LODWORD(v15)))));
  v18 = (v10 >> 2) - 1;
  if (v17 >= v14)
  {
    v20 = *(float *)(v9 + 4 * v18);
  }
  else
  {
    v19 = (float)(v17 * (float)(unint64_t)v18) / v14;
    v20 = (float)((float)(v19 - (float)(int)v19) * *(float *)(v9 + 4 * (int)v19 + 4))
        + (float)((float)(1.0 - (float)(v19 - (float)(int)v19)) * *(float *)(v9 + 4 * (int)v19));
  }
  v21 = x + (float)(v15 + (float)(v20 * v15));
  v22 = y + (float)(v16 + (float)(v20 * v16));

  v23 = v21;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (void).cxx_destruct
{
  optional<(anonymous namespace)::Undistorter> *p_undistorter;
  float *begin;
  float *v5;

  p_undistorter = &self->_undistorter;
  if (self->_undistorter.__engaged_)
  {
    begin = self->_undistorter.var0.__val_.m_mappingV.__begin_;
    if (begin)
    {
      p_undistorter->var0.__val_.m_mappingV.__end_ = begin;
      operator delete(begin);
    }
    v5 = p_undistorter->var0.__val_.m_mappingU.__begin_;
    if (v5)
    {
      p_undistorter->var0.__val_.m_mappingU.__end_ = v5;
      operator delete(v5);
    }
  }
  objc_storeStrong((id *)&self->_undistortionMappingsForRotations, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 144) = 0;
  return self;
}

@end
