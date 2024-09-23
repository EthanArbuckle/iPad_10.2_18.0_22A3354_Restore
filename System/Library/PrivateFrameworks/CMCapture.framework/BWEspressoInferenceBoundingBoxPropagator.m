@implementation BWEspressoInferenceBoundingBoxPropagator

- (BWEspressoInferenceBoundingBoxPropagator)initWithBoxRequirement:(id)a3 scoreRequirement:(id)a4 angularOffsetRequirement:(id)a5 fontSizeRequirement:(id)a6 configuration:(id)a7 toInferenceResultKey:(id)a8
{
  char *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BWEspressoInferenceBoundingBoxPropagator;
  v14 = -[BWEspressoInferenceBoundingBoxPropagator init](&v25, sel_init);
  if (v14)
  {
    *((_QWORD *)v14 + 1) = a3;
    *((_QWORD *)v14 + 2) = a4;
    *((_QWORD *)v14 + 3) = a5;
    *((_QWORD *)v14 + 4) = a6;
    *((_QWORD *)v14 + 5) = a8;
    v14[48] = objc_msgSend(a7, "interiorSuppression");
    objc_msgSend(a7, "interiorSuppressionPadding");
    *((_DWORD *)v14 + 13) = v15;
    objc_msgSend(a7, "maxMatchCost");
    *((_DWORD *)v14 + 14) = v16;
    objc_msgSend(a7, "angularOffsetExponentialSmoothing");
    *((_DWORD *)v14 + 15) = v17;
    if (*((_QWORD *)v14 + 4))
    {
      objc_msgSend(a7, "fontSizeStartReportingThreshold");
      *((_DWORD *)v14 + 16) = v18;
      objc_msgSend(a7, "fontSizeStopReportingThreshold");
      *((_DWORD *)v14 + 17) = v19;
    }
    *((_QWORD *)v14 + 10) = objc_msgSend(objc_alloc((Class)getFTBipartiteMatcherClass()), "initWithInitialSize:", 10);
    v14[96] = objc_msgSend(a7, "inferenceInputUsesPortraitOrientation");
    objc_msgSend(a7, "trackingThreshold");
    *((_DWORD *)v14 + 25) = v20;
    if (a7)
    {
      objc_msgSend(a7, "confidenceFilterSettings");
    }
    else
    {
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)(v14 + 104) = v22;
    *(_OWORD *)(v14 + 120) = v23;
    *((_QWORD *)v14 + 17) = v24;
    *((_QWORD *)v14 + 9) = (id)objc_msgSend(a7, "logger", v22, v23, v24);
  }
  return (BWEspressoInferenceBoundingBoxPropagator *)v14;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_lastRegions);
  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceBoundingBoxPropagator;
  -[BWEspressoInferenceBoundingBoxPropagator dealloc](&v3, sel_dealloc);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  BWInferenceDataRequirement *fontSizeRequirement;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  float trackingThreshold;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  BWEspressoInferenceBoundingBoxPropagator *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  float v42;
  float v43;
  __float2 v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  CGFloat v57;
  float v58;
  double v59;
  float v60;
  double v61;
  double v62;
  double v63;
  BWEspressoInferenceBoundingBoxPropagator *v64;
  _QWORD *v65;
  _BYTE *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  _BYTE *v71;
  char *v72;
  _BYTE *v73;
  int v74;
  uint64_t v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float interiorPadding;
  float v83;
  _BYTE *v84;
  uint64_t *v85;
  unint64_t i;
  uint64_t v87;
  float v88;
  _QWORD *v89;
  CFDictionaryRef v90;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  const __CFDictionary *v94;
  double v95;
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  unint64_t v100;
  float v101;
  opaqueCMSampleBuffer *v102;
  uint64_t v103;
  uint64_t v104;
  CGFloat x;
  CGFloat y;
  CGFloat v107;
  double v108;
  double v109;
  float v110;
  long double v111;
  long double v112;
  double v113;
  long double v114;
  long double v115;
  long double v116;
  double v117;
  long double v118;
  double v119;
  double v120;
  double v121;
  long double v122;
  long double v123;
  long double v124;
  CGFloat v125;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v127;
  double v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  int64_t v132;
  id v133;
  int64_t maxRegionID;
  id *v135;
  CGFloat v136;
  CGFloat v137;
  opaqueCMSampleBuffer *v138;
  _QWORD *v139;
  CMSampleBufferRef v140;
  BWEspressoInferenceBoundingBoxPropagator *v141;
  id v142;
  double v143;
  uint64_t v144;
  double v145;
  double v146;
  _QWORD *v147;
  uint64_t v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  CGAffineTransform v152;
  CGAffineTransform v153;
  CGAffineTransform v154;
  CGAffineTransform v155;
  CMTime v156;
  CGAffineTransform v157;
  CGAffineTransform v158;
  CGAffineTransform v159;
  _QWORD v160[6];
  _QWORD v161[8];
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;

  v161[6] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return;
  v140 = a6;
  v11 = (_QWORD *)objc_msgSend(a4, "tensorForRequirement:", self->_boxRequirement);
  v14 = (uint64_t *)objc_msgSend(a4, "tensorForRequirement:", self->_scoreRequirement);
  if (self->_angularOffsetRequirement)
    v15 = (_QWORD *)objc_msgSend(a4, "tensorForRequirement:");
  else
    v15 = 0;
  fontSizeRequirement = self->_fontSizeRequirement;
  if (fontSizeRequirement)
    v17 = objc_msgSend(a4, "tensorForRequirement:");
  else
    v17 = 0;
  v135 = &v133;
  v18 = (uint64_t *)MEMORY[0x1E0C80A78](v17, v12, fontSizeRequirement, v13);
  *(_QWORD *)&v151 = (char *)&v133 - v20;
  v21 = *v14;
  v22 = v14[17] * (v14[12] - 1);
  v133 = a3;
  if (v15)
  {
    v23 = *(double *)v15;
    v24 = v15[17];
    v25 = *v15 + 4 * v24;
    v144 = *v15 + 8 * v24;
    v145 = *(double *)&v25;
    v146 = v23;
    *(_QWORD *)&v143 = *(_QWORD *)&v23 + 12 * v24;
  }
  else
  {
    v143 = 0.0;
    *(double *)&v144 = 0.0;
    v145 = 0.0;
    v146 = 0.0;
  }
  v141 = self;
  v26 = v21 + 4 * v22;
  if (v18)
    v27 = *v18;
  else
    v27 = 0;
  v28 = 0;
  if (v19)
  {
    v29 = 0;
    trackingThreshold = v141->_trackingThreshold;
    v31 = v151;
    do
    {
      if (*(float *)(v26 + 4 * v29) > trackingThreshold)
        *(_QWORD *)(v31 + 8 * v28++) = v29;
      ++v29;
    }
    while (v19 != v29);
  }
  v147 = v15;
  v32 = *v11;
  v33 = v11;
  v34 = v11[17];
  v35 = v141;
  maxRegionID = v141->_maxRegionID;
  v142 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v28, v133);
  v36 = (char *)malloc_type_calloc(v28, 0x88uLL, 0x101004022C1039FuLL);
  if (!v28)
  {
    -[BWEspressoInferenceBoundingBoxPropagator matchCurRegions:curCount:]((uint64_t)v35, (uint64_t)v36, 0);
    v64 = v35;
    v65 = v33;
    goto LABEL_57;
  }
  v138 = a5;
  v139 = v33;
  v37 = 0;
  v38 = 0;
  *(_QWORD *)&v149 = v32 + 12 * v34;
  *(_QWORD *)&v150 = v32 + 4 * v34;
  v39 = v32;
  v148 = v32 + 8 * v34;
  do
  {
    v40 = *(_QWORD *)(v151 + 8 * v38);
    v41 = &v36[v37];
    *(_DWORD *)&v36[v37 + 44] = *(_DWORD *)(v26 + 4 * v40);
    if (v147)
    {
      v42 = atan2f(*(float *)(*(_QWORD *)&v143 + 4 * v40), *(float *)(v144 + 4 * v40)) * 0.25;
      v43 = *(float *)(*(_QWORD *)&v146 + 4 * v40);
      v44 = __sincosf_stret(v42 * -2.0);
      v45 = expf((float)((float)(v43 * v44.__cosval) - (float)(*(float *)(*(_QWORD *)&v145 + 4 * v40) * v44.__sinval))* 0.5);
      v46 = (float)(v42 * 180.0) / 3.14159265;
      *((float *)v41 + 12) = v46;
      v47 = *(float *)(v148 + 4 * v40);
      v48 = *(float *)(v39 + 4 * v40);
      v49 = v47 + v48;
      v50 = *(float *)(v149 + 4 * v40);
      v51 = *(float *)(v150 + 4 * v40);
      v52 = (float)(v47 + v48) * 0.5;
      v53 = v50 + v51;
      v54 = (float)(v50 + v51) * 0.5;
      v55 = (float)(v47 - v48) * v45;
      v56 = (float)(v50 - v51) / v45;
      *((double *)v41 + 7) = (float)(v54 - (float)(v56 * 0.5));
      *((double *)v41 + 8) = (float)(v52 - (float)(v55 * 0.5));
      *((double *)v41 + 9) = v56;
      *((double *)v41 + 10) = v55;
      memset(&v159, 0, sizeof(v159));
      CGAffineTransformMakeTranslation(&v159, v54, v52);
      v57 = (float)(*((float *)v41 + 12) / -180.0) * 3.14159265;
      v157 = v159;
      CGAffineTransformRotate(&v158, &v157, v57);
      v159 = v158;
      v157 = v158;
      CGAffineTransformTranslate(&v158, &v157, (float)-(float)(v53 * 0.5), (float)-(float)(v49 * 0.5));
      v159 = v158;
      *(CGRect *)(v41 + 8) = CGRectApplyAffineTransform(*(CGRect *)(v41 + 56), &v158);
      if (!v27)
        goto LABEL_24;
LABEL_23:
      *(_DWORD *)&v36[v37 + 88] = *(_DWORD *)(v27 + 4 * v40);
      goto LABEL_24;
    }
    v58 = *(float *)(v150 + 4 * v40);
    v59 = v58;
    v60 = *(float *)(v39 + 4 * v40);
    v61 = v60;
    v62 = (float)(*(float *)(v149 + 4 * v40) - v58);
    v63 = (float)(*(float *)(v148 + 4 * v40) - v60);
    *((double *)v41 + 1) = v59;
    *((double *)v41 + 2) = v61;
    *((double *)v41 + 3) = v62;
    *((double *)v41 + 4) = v63;
    if (v27)
      goto LABEL_23;
LABEL_24:
    ++v38;
    v37 += 136;
  }
  while (v28 != v38);
  v64 = v141;
  -[BWEspressoInferenceBoundingBoxPropagator matchCurRegions:curCount:]((uint64_t)v141, (uint64_t)v36, v28);
  a5 = v138;
  v65 = v139;
  if (v64->_suppressInterior)
  {
    v66 = v36 + 40;
    v67 = v28;
    do
    {
      *v66 = 0;
      v66 += 136;
      --v67;
    }
    while (v67);
    v68 = 0;
    v69 = v28 - 1;
    v70 = (uint64_t *)(v151 + 8);
    v71 = v36 + 176;
    do
    {
      v72 = &v36[136 * v68];
      v74 = v72[40];
      v73 = v72 + 40;
      if (!v74 && v36[136 * v68 + 97])
      {
        v75 = *(_QWORD *)(v151 + 8 * v68);
        v76 = *(float *)(v149 + 4 * v75);
        v77 = *(float *)(v150 + 4 * v75);
        v78 = *(float *)(v148 + 4 * v75);
        v79 = *(float *)(v39 + 4 * v75);
        v80 = vabds_f32(v78, v79);
        v81 = vabds_f32(v76, v77) * 0.1;
        interiorPadding = v64->_interiorPadding;
        if (v81 < interiorPadding)
          v81 = v64->_interiorPadding;
        v83 = v80 * 0.1;
        if (v83 < interiorPadding)
          v83 = v64->_interiorPadding;
        if (v68 + 1 < v28)
        {
          v84 = v71;
          v85 = v70;
          for (i = v69; i; --i)
          {
            if (!*v84 && v84[57])
            {
              v87 = *v85;
              v88 = *(float *)(v150 + 4 * *v85);
              if (v88 <= (float)(v77 + v81)
                && *(float *)(v39 + 4 * v87) <= (float)(v79 + v83)
                && (float)(v81 + *(float *)(v149 + 4 * v87)) >= v76
                && (float)(v83 + *(float *)(v148 + 4 * v87)) >= v78)
              {
                *v73 = 1;
                break;
              }
              if ((float)(v81 + v88) >= v77
                && (float)(v83 + *(float *)(v39 + 4 * v87)) >= v79
                && *(float *)(v149 + 4 * v87) <= (float)(v76 + v81)
                && *(float *)(v148 + 4 * v87) <= (float)(v78 + v83))
              {
                *v84 = 1;
              }
            }
            ++v85;
            v84 += 136;
          }
        }
      }
      ++v68;
      --v69;
      ++v70;
      v71 += 136;
    }
    while (v68 != v28);
  }
LABEL_57:
  v89 = v65;
  CMSampleBufferGetPresentationTimeStamp(&v156, v140);
  v90 = CMTimeCopyAsDictionary(&v156, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  ImageBuffer = CMSampleBufferGetImageBuffer(a5);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  v94 = (const __CFDictionary *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
  if (v94)
  {
    memset(&v159, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v94, (CGRect *)&v159);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v159.a, v159.b, v159.c, v159.d);
    Width = vcvtad_u64_f64(v95);
    Height = vcvtad_u64_f64(v96);
  }
  v97 = *MEMORY[0x1E0C9BAA8];
  v98 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v159.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v159.c = v98;
  v99 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v159.tx = v99;
  if (v64->_inferenceInputUsesPortraitOrientation)
  {
    v150 = v98;
    v151 = v97;
    v149 = v99;
    CGAffineTransformMakeTranslation(&v155, -0.5, -0.5);
    *(_OWORD *)&v158.a = v151;
    *(_OWORD *)&v158.c = v150;
    *(_OWORD *)&v158.tx = v149;
    CGAffineTransformConcat(&v159, &v158, &v155);
    CGAffineTransformMakeRotation(&v154, 1.57079633);
    v157 = v159;
    CGAffineTransformConcat(&v158, &v157, &v154);
    v159 = v158;
    CGAffineTransformMakeTranslation(&v153, 0.5, 0.5);
    v157 = v159;
    CGAffineTransformConcat(&v158, &v157, &v153);
    v159 = v158;
    v100 = Height;
    if (!v28)
      goto LABEL_77;
  }
  else
  {
    v100 = Width;
    Width = Height;
    if (!v28)
      goto LABEL_77;
  }
  v101 = (float)((float)(unint64_t)v89[10] / (float)(unint64_t)v89[11])
       / (float)((float)v100 / (float)Width);
  v137 = v101;
  v136 = (float)(1.0 / v101);
  v141 = (BWEspressoInferenceBoundingBoxPropagator *)*MEMORY[0x1E0D08258];
  v102 = (opaqueCMSampleBuffer *)*MEMORY[0x1E0D08240];
  v139 = (_QWORD *)*MEMORY[0x1E0D08248];
  v140 = v102;
  v138 = (opaqueCMSampleBuffer *)*MEMORY[0x1E0D08250];
  v103 = *MEMORY[0x1E0D08230];
  v104 = *MEMORY[0x1E0D08238];
  LODWORD(v148) = 1016003125;
  do
  {
    if (v36[97] && !v36[40])
    {
      x = *((double *)v36 + 1);
      y = *((double *)v36 + 2);
      v107 = *((double *)v36 + 4);
      *(_QWORD *)&v151 = *((_QWORD *)v36 + 3);
      if (v147)
      {
        *(_QWORD *)&v149 = *((_QWORD *)v36 + 7);
        v108 = *((double *)v36 + 9);
        *(_QWORD *)&v150 = *((_QWORD *)v36 + 8);
        v143 = v108;
        v109 = *((double *)v36 + 10);
        v146 = x;
        v110 = *((float *)v36 + 13);
        memset(&v158, 0, sizeof(v158));
        CGAffineTransformMakeScale(&v158, 1.0, v137);
        v152 = v158;
        CGAffineTransformRotate(&v157, &v152, (float)(v110 * *(float *)&v148));
        v158 = v157;
        v152 = v157;
        CGAffineTransformScale(&v157, &v152, 1.0, v136);
        v158 = v157;
        *(double *)&v144 = v107;
        v145 = y;
        v111 = v157.tx + v157.c * 0.0 + v157.a * (v108 * 0.5);
        v112 = v157.ty + v157.d * 0.0 + v157.b * (v108 * 0.5);
        v113 = v109;
        v114 = v157.tx + v109 * 0.5 * v157.c + v157.a * 0.0;
        v115 = v157.ty + v109 * 0.5 * v157.d + v157.b * 0.0;
        v116 = hypot(v111, v112);
        v117 = v116 + v116;
        v118 = hypot(v114, v115);
        v119 = v118 + v118;
        *(double *)&v149 = *(double *)&v149 - (v117 - v143) * 0.5;
        v120 = *(double *)&v150 - (v118 + v118 - v113) * 0.5;
        v121 = atan(v112 / v111);
        v122 = -v114;
        v107 = *(double *)&v144;
        v123 = v122 / v115;
        x = v146;
        v124 = atan(v123) * (v119 * v119) + v121 * (v117 * v117);
        y = v145;
        *(float *)&v124 = v124 / (v117 * v117 + v119 * v119);
        *(float *)&v150 = *(float *)&v124 / *(float *)&v148;
      }
      else
      {
        LODWORD(v150) = *((_DWORD *)v36 + 13);
        *(CGFloat *)&v149 = x;
        v120 = y;
        v117 = *(double *)&v151;
        v119 = v107;
      }
      if (v64->_inferenceInputUsesPortraitOrientation)
      {
        v158 = v159;
        v162.origin.x = x;
        v162.origin.y = y;
        *(_QWORD *)&v162.size.width = v151;
        v162.size.height = v107;
        v163 = CGRectApplyAffineTransform(v162, &v158);
        x = v163.origin.x;
        y = v163.origin.y;
        *(CGFloat *)&v151 = v163.size.width;
        v107 = v163.size.height;
        v158 = v159;
        *(_QWORD *)&v163.origin.x = v149;
        v163.origin.y = v120;
        v163.size.width = v117;
        v163.size.height = v119;
        v164 = CGRectApplyAffineTransform(v163, &v158);
        v125 = v164.origin.x;
        v120 = v164.origin.y;
        v117 = v164.size.width;
        v119 = v164.size.height;
      }
      else
      {
        v125 = *(double *)&v149;
      }
      v165.origin.x = x;
      v165.origin.y = y;
      *(_QWORD *)&v165.size.width = v151;
      v165.size.height = v107;
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v165);
      v166.origin.x = v125;
      v166.origin.y = v120;
      v166.size.width = v117;
      v166.size.height = v119;
      v127 = CGRectCreateDictionaryRepresentation(v166);
      v160[0] = v141;
      v160[1] = v140;
      v161[0] = v90;
      v161[1] = DictionaryRepresentation;
      v160[2] = v139;
      LODWORD(v128) = *((_DWORD *)v36 + 26);
      v161[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v128);
      v160[3] = v138;
      v161[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)v36);
      v160[4] = v103;
      LODWORD(v129) = v150;
      v130 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v129);
      v160[5] = v104;
      v161[4] = v130;
      v161[5] = v127;
      v131 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 6);
      objc_msgSend(v142, "addObject:", v131);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
      if (v127)
        CFRelease(v127);
    }
    v36 += 136;
    --v28;
  }
  while (v28);
LABEL_77:
  if (v90)
    CFRelease(v90);
  if (v64->_inferenceResultKey)
    objc_msgSend(v133, "setObject:forKeyedSubscript:", v142);
  v132 = v64->_maxRegionID;
  if (v132 != maxRegionID)
    -[FigCaptureLogSmartCameraGating logTracksCreated:](v64->_logger, "logTracksCreated:", (v132 - maxRegionID));
}

- (void)matchCurRegions:(uint64_t)a3 curCount:
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  CGFloat *v11;
  uint64_t v12;
  double width;
  double height;
  float v15;
  double MidX;
  double MidY;
  double v18;
  CGFloat v19;
  float v20;
  float v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  float v30;
  int v31;
  int v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  float v40;
  float v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v45 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v44 = (uint64_t)&v44;
    v6 = (char *)&v44 - ((4 * *(_QWORD *)(a1 + 152) * a3 + 19) & 0xFFFFFFFFFFFFFFF0);
    if (a3)
    {
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)(a1 + 152);
      do
      {
        if (v9)
        {
          v10 = 0;
          v11 = (CGFloat *)(a2 + 136 * v7 + 8);
          v12 = 32;
          do
          {
            v51.origin.x = *v11;
            v51.origin.y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v51.size.width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v51.size.height = *(CGFloat *)(a2 + 136 * v7 + 32);
            v46 = CGRectIntersection(*(CGRect *)(*(_QWORD *)(a1 + 144) + v12 - 24), v51);
            v47 = CGRectStandardize(v46);
            width = v47.size.width;
            height = v47.size.height;
            v52.origin.x = *v11;
            v52.origin.y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v52.size.width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v52.size.height = *(CGFloat *)(a2 + 136 * v7 + 32);
            v48 = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1 + 144) + v12 - 24), v52);
            v49 = CGRectStandardize(v48);
            v15 = 1.0 - width * height / (v49.size.width * v49.size.height);
            v49.origin.x = *v11;
            v49.origin.y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v49.size.width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v49.size.height = *(CGFloat *)(a2 + 136 * v7 + 32);
            MidX = CGRectGetMidX(v49);
            v50.origin.x = *v11;
            v50.origin.y = *(CGFloat *)(a2 + 136 * v7 + 16);
            v50.size.width = *(CGFloat *)(a2 + 136 * v7 + 24);
            v50.size.height = *(CGFloat *)(a2 + 136 * v7 + 32);
            MidY = CGRectGetMidY(v50);
            v18 = CGRectGetMidX(*(CGRect *)(*(_QWORD *)(a1 + 144) + v12 - 24));
            v19 = CGRectGetMidY(*(CGRect *)(*(_QWORD *)(a1 + 144) + v12 - 24));
            v20 = v18 - MidX;
            v21 = v19 - MidY;
            *(float *)&v6[4 * v8 + 4 * v10++] = hypotf(v20, v21) + v15;
            v9 = *(_QWORD *)(a1 + 152);
            v12 += 136;
          }
          while (v10 < v9);
          v8 += v10;
        }
        ++v7;
      }
      while (v7 != a3);
      v22 = (void *)objc_msgSend(*(id *)(a1 + 80), "computeMatchingForCostMatrix:withRowCount:columnCount:", v6, a3, *(_QWORD *)(a1 + 152), v44, v45);
      objc_msgSend(v22, "count");
      v23 = 0;
      v24 = a2 + 88;
      do
      {
        v25 = objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", v23), "integerValue");
        if ((v25 & 0x8000000000000000) != 0
          || (v26 = *(_QWORD *)(a1 + 152), v25 >= v26)
          || *(float *)&v6[4 * v25 + 4 * v26 * v23] > *(float *)(a1 + 56))
        {
          v27 = *(_QWORD *)(a1 + 88) + 1;
          *(_QWORD *)(a1 + 88) = v27;
          *(_QWORD *)(v24 - 88) = v27;
          v28 = *(_QWORD *)(a1 + 136);
          v29 = *(_OWORD *)(a1 + 120);
          *(_OWORD *)(v24 + 8) = *(_OWORD *)(a1 + 104);
          *(_QWORD *)(v24 + 40) = v28;
          *(_OWORD *)(v24 + 24) = v29;
          v30 = *(float *)(v24 - 40);
          *(_DWORD *)(v24 + 16) = *(_DWORD *)(v24 - 44);
        }
        else
        {
          v37 = *(_QWORD *)(a1 + 144) + 136 * v25;
          *(_QWORD *)(v24 - 88) = *(_QWORD *)v37;
          v38 = *(_OWORD *)(v37 + 96);
          v39 = *(_OWORD *)(v37 + 112);
          *(_QWORD *)(v24 + 40) = *(_QWORD *)(v37 + 128);
          *(_OWORD *)(v24 + 24) = v39;
          *(_OWORD *)(v24 + 8) = v38;
          v40 = *(float *)(v24 - 40);
          v41 = *(float *)(*(_QWORD *)(a1 + 144) + 136 * v25 + 52);
          v42 = v41 + 90.0;
          v43 = vabds_f32(v40, v41);
          if (vabds_f32(v40, v41 + 90.0) >= v43)
          {
            v42 = *(float *)(*(_QWORD *)(a1 + 144) + 136 * v25 + 52);
            if (vabds_f32(v40, v41 + -90.0) < v43)
              v42 = v41 + -90.0;
          }
          v30 = (float)(v42 * (float)(1.0 - *(float *)(a1 + 60))) + (float)(v40 * *(float *)(a1 + 60));
        }
        v31 = *(unsigned __int8 *)(v24 + 8);
        *(float *)(v24 - 36) = v30;
        v32 = *(unsigned __int8 *)(v24 + 9);
        if (v31)
        {
          v33 = *(float *)v24;
          BWSmartCameraSceneUpdateWithConfidence(v24 + 8, *(float *)(v24 - 44));
          if (!v32 && v33 < *(float *)(a1 + 64) || v32 && v33 < *(float *)(a1 + 68))
          {
            *(_BYTE *)(v24 + 9) = 0;
            *(_WORD *)(v24 + 32) = 0;
          }
        }
        else
        {
          v34 = *(float *)(v24 - 44);
          *(float *)(v24 + 16) = v34;
          if (v34 <= *(float *)(v24 + 20))
          {
            v36 = 0;
          }
          else
          {
            v35 = *(float *)(a1 + 64);
            v36 = *(float *)v24 >= v35;
            if (v32 && *(float *)v24 < v35)
              v36 = *(float *)v24 >= *(float *)(a1 + 68);
          }
          *(_BYTE *)(v24 + 9) = v36;
        }
        ++v23;
        v24 += 136;
      }
      while (a3 != v23);
    }
    free(*(void **)(a1 + 144));
    *(_QWORD *)(a1 + 144) = a2;
    *(_QWORD *)(a1 + 152) = a3;
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end
