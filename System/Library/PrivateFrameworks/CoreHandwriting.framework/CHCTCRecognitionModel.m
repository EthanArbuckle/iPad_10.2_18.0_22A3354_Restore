@implementation CHCTCRecognitionModel

- (CHCTCRecognitionModel)initWithModelName:(id)a3 decodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a4
{
  id v6;
  char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHCTCRecognitionModel *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *directionalFeaturesInputName;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *characterProbabilityOutputName;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  size_t v67;
  void *v68;
  void **v69;
  uint64_t v70;
  uint64_t v71;
  CHCodeMap *codeMap;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v99;
  id v100;
  void *__dst[2];
  unint64_t v102;
  objc_super v103;

  v6 = a3;
  v103.receiver = self;
  v103.super_class = (Class)CHCTCRecognitionModel;
  v7 = -[CHRecurrentNeuralNetworkCoreML initWithModelName:](&v103, sel_initWithModelName_, v6);
  v13 = (CHCTCRecognitionModel *)v7;
  if (!v7)
    goto LABEL_25;
  v14 = *(_QWORD *)&a4->maxNumberOfCandidates;
  *(_OWORD *)(v7 + 216) = *(_OWORD *)&a4->strategy;
  *((_QWORD *)v7 + 29) = v14;
  *((_QWORD *)v7 + 11) = 4;
  *((_QWORD *)v7 + 12) = 0;
  *((_QWORD *)v7 + 13) = 1;
  *((_QWORD *)v7 + 14) = 2;
  *((_QWORD *)v7 + 15) = 3;
  v7[80] = 1;
  v7[81] = 0;
  v7[82] = 0;
  *((_QWORD *)v7 + 25) = 0;
  v7[83] = 0;
  objc_msgSend_inputNames(v7, v8, v9, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  directionalFeaturesInputName = v13->_directionalFeaturesInputName;
  v13->_directionalFeaturesInputName = (NSString *)v20;

  objc_msgSend_outputNames(v13, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v27, v28, 0, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  characterProbabilityOutputName = v13->_characterProbabilityOutputName;
  v13->_characterProbabilityOutputName = (NSString *)v32;

  objc_msgSend_resourcePath(v13, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v39, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelName(v13, v46, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v51, v52, (uint64_t)CFSTR(".codemap"), v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v45, v57, (uint64_t)v56, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = objc_retainAutorelease(v61);
  v66 = (const char *)objc_msgSend_cStringUsingEncoding_(v100, v62, 4, v63, v64, v65);
  v67 = strlen(v66);
  if (v67 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v68 = (void *)v67;
  if (v67 >= 0x17)
  {
    v70 = (v67 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v67 | 7) != 0x17)
      v70 = v67 | 7;
    v71 = v70 + 1;
    v69 = (void **)operator new(v70 + 1);
    __dst[1] = v68;
    v102 = v71 | 0x8000000000000000;
    __dst[0] = v69;
  }
  else
  {
    HIBYTE(v102) = v67;
    v69 = __dst;
    if (!v67)
      goto LABEL_10;
  }
  memmove(v69, v66, (size_t)v68);
LABEL_10:
  *((_BYTE *)v68 + (_QWORD)v69) = 0;
  codeMap = (CHCodeMap *)sub_1BE7E7FD4((uint64_t *)__dst);
  v13->_codeMap = codeMap;
  if (SHIBYTE(v102) < 0)
  {
    operator delete(__dst[0]);
    codeMap = v13->_codeMap;
  }
  objc_msgSend_orderedSetWithCapacity_(MEMORY[0x1E0C99E10], v73, codeMap->var3, v74, v75, v76, 81);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13->_codeMap->var3)
  {
    v78 = 0;
    while (1)
    {
      v79 = (void *)MEMORY[0x1C3B818B0]();
      v85 = objc_msgSend_codeMap(v13, v80, v81, v82, v83, v84);
      v86 = *(_DWORD *)CHCodeMap::operator[](v85, v78);
      if (v86 == 32)
      {
        v92 = &OBJC_IVAR___CHCTCRecognitionModel__spaceIndex;
        goto LABEL_20;
      }
      if (v86 == 57426)
        break;
      if (v86 == 57427)
      {
        v92 = &OBJC_IVAR___CHCTCRecognitionModel__pseudospaceIndex;
LABEL_20:
        *(Class *)((char *)&v13->super.super.super.isa + *v92) = (Class)v78;
      }
      unicodeToNSString(v86, v87, v88, v89, v90, v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v77, v94, (uint64_t)v93, v95, v96, v97);

      objc_autoreleasePoolPop(v79);
      if (++v78 >= v13->_codeMap->var3)
        goto LABEL_22;
    }
    v92 = &OBJC_IVAR___CHCTCRecognitionModel__blankIndex;
    goto LABEL_20;
  }
LABEL_22:
  objc_storeStrong((id *)&v13->__stringCodeMap, v77);
  if (*((_BYTE *)&v13->super.super.super.isa + v99))
  {
    sub_1BE735C58((char *)v13);
    sub_1BE735FCC((char *)v13);
  }

LABEL_25:
  return v13;
}

- (void)setInterpointDistance:(double)a3
{
  self->_interpointDistance = a3;
  if (self->_shouldUseCPPFeatureExtraction)
    sub_1BE735C58((char *)self);
}

- (void)setShouldUseArabicVisualOrderFeatureExtraction:(BOOL)a3
{
  if (self->_shouldUseArabicVisualOrderFeatureExtraction != a3)
  {
    self->_shouldUseArabicVisualOrderFeatureExtraction = a3;
    sub_1BE735C58((char *)self);
    sub_1BE735FCC((char *)self);
  }
}

- (void)setShouldUseStrokeDirectionFeature:(BOOL)a3
{
  if (self->_shouldUseStrokeDirectionFeature != a3)
  {
    self->_shouldUseStrokeDirectionFeature = a3;
    sub_1BE735C58((char *)self);
    sub_1BE735FCC((char *)self);
  }
}

- (void)setShouldUseCPPFeatureExtraction:(BOOL)a3
{
  _BOOL4 shouldUseCPPFeatureExtraction;
  PreprocessingManager *value;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  FeatureExtractionProcessor *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  shouldUseCPPFeatureExtraction = self->_shouldUseCPPFeatureExtraction;
  self->_shouldUseCPPFeatureExtraction = a3;
  if (shouldUseCPPFeatureExtraction || !a3)
  {
    if (!a3)
    {
      value = self->_preprocessor.__ptr_.__value_;
      self->_preprocessor.__ptr_.__value_ = 0;
      if (value)
      {
        v7 = *(_QWORD **)value;
        if (*(_QWORD *)value)
        {
          v8 = (_QWORD *)*((_QWORD *)value + 1);
          v9 = *(_QWORD **)value;
          if (v8 != v7)
          {
            do
            {
              v11 = *--v8;
              v10 = v11;
              *v8 = 0;
              if (v11)
                (*(void (**)(uint64_t, SEL))(*(_QWORD *)v10 + 8))(v10, a2);
            }
            while (v8 != v7);
            v9 = *(_QWORD **)value;
          }
          *((_QWORD *)value + 1) = v7;
          operator delete(v9);
        }
        MEMORY[0x1C3B812EC](value, 0x20C40960023A9);
      }
      v12 = self->_featureExtractor.__ptr_.__value_;
      self->_featureExtractor.__ptr_.__value_ = 0;
      if (v12)
      {
        v13 = *(_QWORD **)v12;
        if (*(_QWORD *)v12)
        {
          v14 = (_QWORD *)*((_QWORD *)v12 + 1);
          v15 = *(_QWORD **)v12;
          if (v14 != v13)
          {
            do
            {
              v17 = *--v14;
              v16 = v17;
              *v14 = 0;
              if (v17)
                (*(void (**)(uint64_t, SEL))(*(_QWORD *)v16 + 8))(v16, a2);
            }
            while (v14 != v13);
            v15 = *(_QWORD **)v12;
          }
          *((_QWORD *)v12 + 1) = v13;
          operator delete(v15);
        }
        JUMPOUT(0x1C3B812ECLL);
      }
    }
  }
  else
  {
    sub_1BE735C58((char *)self);
    sub_1BE735FCC((char *)self);
  }
}

- (void)dealloc
{
  CHCodeMap *codeMap;
  objc_super v4;

  codeMap = self->_codeMap;
  if (codeMap)
  {
    if (codeMap->var0)
      munmap(codeMap->var0, codeMap->var1);
    MEMORY[0x1C3B812EC](codeMap, 0x1010C40A749B91FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHCTCRecognitionModel;
  -[CHRecurrentNeuralNetworkCoreML dealloc](&v4, sel_dealloc);
}

- (id)featureProviderForDrawing:(id)a3 initialVectorAnchorPoint:(CGPoint)a4 normalizeFeatures:(BOOL)a5 padFeatures:(BOOL)a6 outStrokeEndings:(void *)a7 outInputSequenceLength:(int64_t *)a8 outOutputSequenceLength:(int64_t *)a9
{
  double y;
  double x;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  _BYTE *v111;
  _QWORD *v112;
  int64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  _OWORD *v118;
  char *v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  void *v123;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  id v132;
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  void *v136;
  uint64_t v137;

  y = a4.y;
  x = a4.x;
  v137 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v130 = v16;
  objc_msgSend_directionalFeaturesInputName(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0;
  sub_1BE736A20(self, v16, v22, a5, a6, &v132, x, y);
  v126 = (id)objc_claimAutoreleasedReturnValue();
  v125 = v132;

  v23 = v126;
  if (!v126)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_modelName(self, v25, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedDescription(v125, v31, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v134 = v30;
      v135 = 2112;
      v136 = v36;
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model when extracting features: %@", buf, 0x16u);

    }
    v23 = 0;
  }
  v127 = objc_retainAutorelease(v23);
  v129 = objc_msgSend_dataPointer(v127, v37, v38, v39, v40, v41);
  objc_msgSend_featureCounts(self, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_directionalFeaturesInputName(self, v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v47, v54, (uint64_t)v53, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend_integerValue(v58, v59, v60, v61, v62, v63);

  objc_msgSend_shape(v127, v64, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v69, v70, 1, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  *a8 = objc_msgSend_integerValue(v74, v75, v76, v77, v78, v79);

  v90 = vcvtpd_s64_f64((double)*a8 / (double)objc_msgSend_sequenceCompression(self, v80, v81, v82, v83, v84));
  *a9 = v90;
  v91 = *(char **)a7;
  *((_QWORD *)a7 + 1) = *(_QWORD *)a7;
  if (v90 > (uint64_t)(*((_QWORD *)a7 + 2) - (_QWORD)v91) >> 3)
  {
    if (v90 >> 61)
      sub_1BE61F930();
    v92 = (char *)operator new(8 * v90);
    *(_QWORD *)a7 = v92;
    *((_QWORD *)a7 + 1) = v92;
    *((_QWORD *)a7 + 2) = &v92[8 * v90];
    if (v91)
      operator delete(v91);
  }
  if (*a8 >= 1)
  {
    v93 = 0;
    v94 = 0;
    while (1)
    {
      if (v93
        && *(float *)(v129 + 4 * (objc_msgSend_gapFeatureIndex(self, v85, v86, v87, v88, v89) + v93 * v128)) == 1.0)
      {
        ++v94;
      }
      v97 = objc_msgSend_sequenceCompression(self, v85, v86, v87, v88, v89, v125);
      if (v93 % v97 != objc_msgSend_sequenceCompression(self, v98, v99, v100, v101, v102) - 1)
      {
        v96 = *a8;
        if (v93 != *a8 - 1)
          goto LABEL_15;
      }
      v104 = (char *)*((_QWORD *)a7 + 1);
      v103 = *((_QWORD *)a7 + 2);
      if ((unint64_t)v104 >= v103)
        break;
      *(_QWORD *)v104 = v94;
      v95 = (uint64_t)(v104 + 8);
LABEL_14:
      v94 = 0;
      *((_QWORD *)a7 + 1) = v95;
      v16 = v130;
      v96 = *a8;
LABEL_15:
      if (++v93 >= v96)
        goto LABEL_41;
    }
    v105 = *(char **)a7;
    v106 = (uint64_t)&v104[-*(_QWORD *)a7];
    v107 = v106 >> 3;
    v108 = (v106 >> 3) + 1;
    if (v108 >> 61)
      sub_1BE61F930();
    v109 = v103 - (_QWORD)v105;
    if (v109 >> 2 > v108)
      v108 = v109 >> 2;
    if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF8)
      v110 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v110 = v108;
    if (v110)
    {
      if (v110 >> 61)
        sub_1BE61F100();
      v111 = operator new(8 * v110);
      v112 = &v111[8 * v107];
      *v112 = v94;
      v95 = (uint64_t)(v112 + 1);
      v113 = v104 - v105;
      if (v104 == v105)
        goto LABEL_39;
    }
    else
    {
      v111 = 0;
      v112 = (_QWORD *)(8 * v107);
      *(_QWORD *)(8 * v107) = v94;
      v95 = 8 * v107 + 8;
      v113 = v104 - v105;
      if (v104 == v105)
      {
LABEL_39:
        *(_QWORD *)a7 = v112;
        *((_QWORD *)a7 + 1) = v95;
        *((_QWORD *)a7 + 2) = &v111[8 * v110];
        if (v105)
          operator delete(v105);
        goto LABEL_14;
      }
    }
    v114 = v113 - 8;
    if (v114 < 0x58)
      goto LABEL_47;
    if ((unint64_t)(v104 - v111 - v106) < 0x20)
      goto LABEL_47;
    v115 = (v114 >> 3) + 1;
    v116 = 8 * (v115 & 0x3FFFFFFFFFFFFFFCLL);
    v117 = &v104[-v116];
    v112 = (_QWORD *)((char *)v112 - v116);
    v118 = &v111[8 * v107 - 16];
    v119 = v104 - 16;
    v120 = v115 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v121 = *(_OWORD *)v119;
      *(v118 - 1) = *((_OWORD *)v119 - 1);
      *v118 = v121;
      v118 -= 2;
      v119 -= 32;
      v120 -= 4;
    }
    while (v120);
    v104 = v117;
    if (v115 != (v115 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_47:
      do
      {
        v122 = *((_QWORD *)v104 - 1);
        v104 -= 8;
        *--v112 = v122;
      }
      while (v104 != v105);
    }
    goto LABEL_39;
  }
LABEL_41:
  ++*(_QWORD *)(*((_QWORD *)a7 + 1) - 8);
  sub_1BE7372D4(self, v127);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  return v123;
}

- (id)recognizeDrawing:(id)a3 minimumDrawingSize:(CGSize)a4 initialVectorAnchorPoint:(CGPoint)a5 activeCharacterSet:(id)a6 outStrokeIndexMapping:(void *)a7 outStrokeEndings:(void *)a8 outFallbackSymbol:(id *)a9 outFallbackSymbolScore:(double *)a10
{
  double y;
  double x;
  double height;
  double width;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  NSObject *v28;
  PreprocessingManager *value;
  char *v30;
  char *v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t strokeOrdering;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  _BYTE *v57;
  _BYTE *v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  _BYTE *v69;
  unint64_t *v70;
  int64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  _OWORD *v76;
  char *v77;
  uint64_t v78;
  __int128 v79;
  unint64_t v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  NSObject *v88;
  NSObject *v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t *v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  int64x2_t v96;
  const double *v97;
  int64x2_t v98;
  const double *v99;
  const double *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  int v109;
  uint64_t v110;
  char *v111;
  char *v112;
  objc_class *isa;
  NSObject v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  objc_class *v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  char *v130;
  char *v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  __int128 v138;
  int64_t v139;
  unint64_t v140;
  _QWORD *v141;
  void *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  CoreHandwriting::FeatureArray *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  char *v166;
  char *v167;
  void *v168;
  char *v169;
  void *v170;
  void *v171;
  _BOOL4 v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  _BYTE *v176;
  _QWORD *v177;
  char *v178;
  char *v179;
  NSObject *v180;
  double v181;
  double v182;
  double v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  _BYTE *v196;
  _BYTE *v197;
  char *v198;
  uint64_t v199;
  char *v200;
  char *v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  char *v205;
  char *v206;
  __int128 *v207;
  uint64_t v208;
  __int128 v209;
  uint64_t v210;
  unint64_t i;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t v226;
  uint64_t v227;
  unint64_t v228;
  _BYTE *v229;
  uint64_t *v230;
  int64_t v231;
  unint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t *v235;
  _OWORD *v236;
  uint64_t *v237;
  uint64_t v238;
  __int128 v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  unint64_t j;
  uint64_t v253;
  unint64_t v254;
  unint64_t *v255;
  unint64_t *v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  uint64_t v260;
  unint64_t v261;
  _BYTE *v262;
  unint64_t *v263;
  int64_t v264;
  unint64_t v265;
  uint64_t v266;
  uint64_t v267;
  unint64_t *v268;
  _OWORD *v269;
  unint64_t *v270;
  uint64_t v271;
  __int128 v272;
  unint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  uint64_t v277;
  NSObject *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  id v290;
  _QWORD *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  id v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  id v337;
  uint64_t k;
  void *v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  _BOOL4 v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  id v375;
  id v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  double *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  id v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  _BOOL4 v435;
  id v436;
  id v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  double *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  NSObject *v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  void *v513;
  const char *v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  _BOOL4 v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  id v525;
  id v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  void *v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  void *v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  void *v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  void *v569;
  const char *v570;
  id v571;
  NSObject *v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  void *v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  _BOOL4 v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  void *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  _BOOL4 v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  id v603;
  id v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  const char *v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  const char *v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  void *v629;
  const char *v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  const char *v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  void *v645;
  const char *v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  void *v650;
  const char *v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  id v656;
  void *v657;
  void *v658;
  const char *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  _BOOL4 v664;
  id v665;
  id v666;
  const char *v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  const char *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  void *v691;
  const char *v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  const char *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  void *v707;
  const char *v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  void *v712;
  const char *v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  const char *v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  void *v723;
  const char *v724;
  uint64_t v725;
  uint64_t v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  NSObject *v730;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  void *v736;
  void *v737;
  const char *v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  void *v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  void *v748;
  NSObject *v749;
  const char *v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  void *v755;
  id v756;
  const char *v757;
  NSOrderedSet *stringCodeMap;
  int64_t blankIndex;
  uint64_t v760;
  NSObject *v761;
  NSOrderedSet *v762;
  int64_t v763;
  CHActivationMatrix *v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  const char *v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  uint64_t v773;
  void *v774;
  const char *v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  uint64_t v779;
  void *v780;
  const char *v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;
  char isEqualToString;
  const char *v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  uint64_t v790;
  double v791;
  double v792;
  const char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  void *v798;
  const char *v799;
  uint64_t v800;
  int v801;
  const char *v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  double v809;
  double v810;
  const char *v811;
  uint64_t v812;
  uint64_t v813;
  uint64_t v814;
  uint64_t v815;
  void *v816;
  const char *v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
  void *v822;
  const char *v823;
  uint64_t v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  void *v828;
  const char *v829;
  uint64_t v830;
  uint64_t v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  const char *v835;
  uint64_t v836;
  uint64_t v837;
  uint64_t v838;
  void *v839;
  void *v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  uint64_t v845;
  void *v846;
  const char *v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  const char *v853;
  uint64_t v854;
  uint64_t v855;
  uint64_t v856;
  void *v857;
  const char *v858;
  uint64_t v859;
  void *v860;
  const char *v861;
  uint64_t v862;
  uint64_t v863;
  id v864;
  unint64_t v866;
  char *v867;
  uint64_t v868;
  uint64_t v869;
  _OWORD *v870;
  char *v871;
  uint64_t v872;
  __int128 v873;
  uint64_t v874;
  char *v875;
  char *v876;
  void *v877;
  id v880;
  id v881;
  void *v882;
  CoreHandwriting *v883;
  id v884;
  void *v886;
  void *v887;
  double *v888;
  double *v889;
  unint64_t v890;
  void *v891;
  os_log_t loga;
  NSObject *obj;
  id obja;
  uint64_t v896;
  void *v897;
  void *v898;
  id v899;
  uint64_t v900;
  uint64_t v901;
  void *v902;
  void *v903;
  os_log_t v904;
  os_log_t v905;
  os_log_t v906;
  os_log_t v907;
  os_log_t v908;
  __int128 v909;
  uint64_t v910;
  __int128 v911;
  uint64_t v912;
  id v913;
  id v914;
  id v915;
  id v916;
  id v917;
  _QWORD v918[4];
  id v919;
  __int128 v920;
  __int128 v921;
  __int128 v922;
  __int128 v923;
  _QWORD v924[4];
  id v925;
  id v926;
  _QWORD v927[5];
  id v928;
  id v929;
  id v930;
  void *v931;
  char *v932;
  void *__p;
  void *v934;
  void *v935;
  void *v936;
  void *v937;
  char *v938;
  uint64_t v939;
  unint64_t v940;
  CHDrawing v941;
  uint8_t buf[24];
  void *v943;
  uint64_t v944;
  float64x2x3_t v945;
  float64x2x3_t v946;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v944 = *MEMORY[0x1E0C80C00];
  v941.super.isa = *(Class *)&a5.x;
  *(CGFloat *)v941._anon_8 = a5.y;
  v883 = (CoreHandwriting *)a3;
  v881 = a6;
  v16 = objc_alloc(MEMORY[0x1E0C9E9B0]);
  v882 = (void *)objc_msgSend_initWithUsesCPUOnly_(v16, v17, 1, v18, v19, v20);
  v940 = 0;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v21, v22, v23, v24, v25);
  v27 = v26;
  if (!self->_shouldUseCPPFeatureExtraction)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v36 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v36, OS_LOG_TYPE_DEBUG, "Running legacy preprocessing and feature extraction", buf, 2u);
    }

    strokeOrdering = self->_strokeOrdering;
    if (strokeOrdering)
    {
      v929 = 0;
      objc_msgSend_sortedDrawingUsingStrokeMidPointHorizontalOverlapAware_shouldSortRTL_(v883, v37, (uint64_t)&v929, strokeOrdering == 2, v38, v39);
      v41 = objc_claimAutoreleasedReturnValue();
      v899 = v929;

      v42 = v41;
    }
    else
    {
      v899 = 0;
      v42 = (uint64_t)v883;
    }
    v883 = (CoreHandwriting *)v42;
    *(double *)&v931 = 1.0;
    memset(buf, 0, sizeof(buf));
    objc_msgSend_normalizedDrawing_targetHeight_minimumDrawingSize_interpolationDistance_outScaleFactor_outputPointMap_(self, v37, v42, (uint64_t)&v931, (uint64_t)buf, v39, 1.0, width, height, self->_interpointDistance);
    v180 = objc_claimAutoreleasedReturnValue();
    v181 = y * *(double *)&v931;
    v182 = fmin(fmax(x * *(double *)&v931, -1.5), 1.5);
    v183 = fmin(fmax(v181, -1.5), 1.5);
    *(double *)&v941.super.isa = v182;
    *(double *)v941._anon_8 = v183;
    *((_QWORD *)a7 + 1) = *(_QWORD *)a7;
    v905 = v180;
    v189 = objc_msgSend_strokeCount(v180, v184, v185, v186, v187, v188);
    v195 = v189;
    v196 = *(_BYTE **)a7;
    if (v189 <= (uint64_t)(*((_QWORD *)a7 + 2) - *(_QWORD *)a7) >> 3)
      goto LABEL_158;
    if (v189 >> 61)
      sub_1BE61F930();
    v197 = (_BYTE *)*((_QWORD *)a7 + 1);
    v198 = (char *)operator new(8 * v189);
    v199 = v197 - v196;
    v200 = &v198[(v197 - v196) & 0xFFFFFFFFFFFFFFF8];
    v201 = v200;
    if (v197 != v196)
    {
      if ((unint64_t)(v199 - 8) < 0x58)
      {
        v201 = &v198[(v197 - v196) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_155:
          v210 = *((_QWORD *)v197 - 1);
          v197 -= 8;
          *((_QWORD *)v201 - 1) = v210;
          v201 -= 8;
        }
        while (v197 != v196);
        goto LABEL_156;
      }
      v201 = &v198[(v197 - v196) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(&v197[-(v199 & 0xFFFFFFFFFFFFFFF8)] - v198) < 0x20)
        goto LABEL_155;
      v202 = v199 >> 3;
      v203 = ((unint64_t)(v199 - 8) >> 3) + 1;
      v204 = 8 * (v203 & 0x3FFFFFFFFFFFFFFCLL);
      v205 = &v197[-v204];
      v201 = &v200[-v204];
      v206 = &v198[8 * v202 - 16];
      v207 = (__int128 *)(v197 - 16);
      v208 = v203 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v209 = *v207;
        *((_OWORD *)v206 - 1) = *(v207 - 1);
        *(_OWORD *)v206 = v209;
        v206 -= 32;
        v207 -= 2;
        v208 -= 4;
      }
      while (v208);
      v197 = v205;
      if (v203 != (v203 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_155;
    }
LABEL_156:
    *(_QWORD *)a7 = v201;
    *((_QWORD *)a7 + 1) = v200;
    *((_QWORD *)a7 + 2) = &v198[8 * v195];
    if (v196)
      operator delete(v196);
LABEL_158:
    if (v899)
    {
      for (i = 0; ; ++i)
      {
        if (i >= objc_msgSend_strokeCount(v180, v190, v191, v192, v193, v194))
        {
          v182 = *(double *)&v941.super.isa;
          v183 = *(double *)v941._anon_8;
LABEL_184:
          *(_QWORD *)&v941._anon_8[8] = 0;
          v241 = objc_msgSend_normalizeFeatures(self, v190, v191, v192, v193, v194);
          objc_msgSend_featureProviderForDrawing_initialVectorAnchorPoint_normalizeFeatures_padFeatures_outStrokeEndings_outInputSequenceLength_outOutputSequenceLength_(self, v242, (uint64_t)v180, v241, 1, (uint64_t)a8, &v941._anon_8[8], &v940, v182, v183);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = v248 != 0;
          if (v248)
          {
            objc_msgSend_model(self, v243, v244, v245, v246, v247);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            v928 = 0;
            objc_msgSend_predictionFromFeatures_options_error_(v249, v250, (uint64_t)v248, (uint64_t)v882, (uint64_t)&v928, v251);
            v891 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v928;

          }
          else
          {
            v891 = 0;
            v159 = 0;
          }

          v274 = *(_QWORD *)buf;
          if (*(_QWORD *)buf)
          {
            v275 = *(_QWORD *)&buf[8];
            v276 = *(void **)buf;
            if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
            {
              do
              {
                v277 = v275 - 24;
                sub_1BE62033C(v275 - 24, *(_QWORD **)(v275 - 16));
                v275 = v277;
              }
              while (v277 != v274);
              v276 = *(void **)buf;
            }
            *(_QWORD *)&buf[8] = v274;
            operator delete(v276);
          }

          goto LABEL_217;
        }
        objc_msgSend_objectAtIndexedSubscript_(v899, v190, i, v192, v193, v194);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = objc_msgSend_integerValue(v212, v213, v214, v215, v216, v217);
        v219 = v218;
        v221 = (uint64_t *)*((_QWORD *)a7 + 1);
        v220 = *((_QWORD *)a7 + 2);
        if ((unint64_t)v221 < v220)
        {
          *v221 = v218;
          v222 = (uint64_t)(v221 + 1);
          goto LABEL_182;
        }
        v223 = *(uint64_t **)a7;
        v224 = (uint64_t)v221 - *(_QWORD *)a7;
        v225 = v224 >> 3;
        v226 = (v224 >> 3) + 1;
        if (v226 >> 61)
          sub_1BE61F930();
        v227 = v220 - (_QWORD)v223;
        if (v227 >> 2 > v226)
          v226 = v227 >> 2;
        v228 = (unint64_t)v227 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v226;
        if (v228)
          break;
        v229 = 0;
        v230 = (uint64_t *)(8 * v225);
        *(_QWORD *)(8 * v225) = v219;
        v222 = 8 * v225 + 8;
        v231 = (char *)v221 - (char *)v223;
        if (v221 != v223)
          goto LABEL_174;
LABEL_180:
        *(_QWORD *)a7 = v230;
        *((_QWORD *)a7 + 1) = v222;
        *((_QWORD *)a7 + 2) = &v229[8 * v228];
        if (v223)
          operator delete(v223);
LABEL_182:
        v180 = v905;
        *((_QWORD *)a7 + 1) = v222;

      }
      if (v228 >> 61)
        sub_1BE61F100();
      v229 = operator new(8 * v228);
      v230 = (uint64_t *)&v229[8 * v225];
      *v230 = v219;
      v222 = (uint64_t)(v230 + 1);
      v231 = (char *)v221 - (char *)v223;
      if (v221 == v223)
        goto LABEL_180;
LABEL_174:
      v232 = v231 - 8;
      if (v232 < 0x58)
        goto LABEL_331;
      if ((unint64_t)((char *)v221 - v229 - v224) < 0x20)
        goto LABEL_331;
      v233 = (v232 >> 3) + 1;
      v234 = 8 * (v233 & 0x3FFFFFFFFFFFFFFCLL);
      v235 = &v221[v234 / 0xFFFFFFFFFFFFFFF8];
      v230 = (uint64_t *)((char *)v230 - v234);
      v236 = &v229[8 * v225 - 16];
      v237 = v221 - 2;
      v238 = v233 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v239 = *(_OWORD *)v237;
        *(v236 - 1) = *((_OWORD *)v237 - 1);
        *v236 = v239;
        v236 -= 2;
        v237 -= 4;
        v238 -= 4;
      }
      while (v238);
      v221 = v235;
      if (v233 != (v233 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_331:
        do
        {
          v240 = *--v221;
          *--v230 = v240;
        }
        while (v221 != v223);
      }
      goto LABEL_180;
    }
    for (j = 0; ; ++j)
    {
      if (j >= objc_msgSend_strokeCount(v180, v190, v191, v192, v193, v194))
        goto LABEL_184;
      v255 = (unint64_t *)*((_QWORD *)a7 + 1);
      v254 = *((_QWORD *)a7 + 2);
      if ((unint64_t)v255 < v254)
      {
        *v255 = j;
        v253 = (uint64_t)(v255 + 1);
        goto LABEL_188;
      }
      v256 = *(unint64_t **)a7;
      v257 = (uint64_t)v255 - *(_QWORD *)a7;
      v258 = v257 >> 3;
      v259 = (v257 >> 3) + 1;
      if (v259 >> 61)
        sub_1BE61F930();
      v260 = v254 - (_QWORD)v256;
      if (v260 >> 2 > v259)
        v259 = v260 >> 2;
      v261 = (unint64_t)v260 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v259;
      if (v261)
        break;
      v262 = 0;
      v263 = (unint64_t *)(8 * v258);
      *(_QWORD *)(8 * v258) = j;
      v253 = 8 * v258 + 8;
      v264 = (char *)v255 - (char *)v256;
      if (v255 != v256)
        goto LABEL_202;
LABEL_208:
      *(_QWORD *)a7 = v263;
      *((_QWORD *)a7 + 1) = v253;
      *((_QWORD *)a7 + 2) = &v262[8 * v261];
      if (v256)
        operator delete(v256);
LABEL_188:
      *((_QWORD *)a7 + 1) = v253;
      v180 = v905;
    }
    if (v261 >> 61)
      sub_1BE61F100();
    v262 = operator new(8 * v261);
    v263 = (unint64_t *)&v262[8 * v258];
    *v263 = j;
    v253 = (uint64_t)(v263 + 1);
    v264 = (char *)v255 - (char *)v256;
    if (v255 == v256)
      goto LABEL_208;
LABEL_202:
    v265 = v264 - 8;
    if (v265 < 0x58)
      goto LABEL_332;
    if ((unint64_t)((char *)v255 - v262 - v257) < 0x20)
      goto LABEL_332;
    v266 = (v265 >> 3) + 1;
    v267 = 8 * (v266 & 0x3FFFFFFFFFFFFFFCLL);
    v268 = &v255[v267 / 0xFFFFFFFFFFFFFFF8];
    v263 = (unint64_t *)((char *)v263 - v267);
    v269 = &v262[8 * v258 - 16];
    v270 = v255 - 2;
    v271 = v266 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v272 = *(_OWORD *)v270;
      *(v269 - 1) = *((_OWORD *)v270 - 1);
      *v269 = v272;
      v269 -= 2;
      v270 -= 4;
      v271 -= 4;
    }
    while (v271);
    v255 = v268;
    if (v266 != (v266 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_332:
      do
      {
        v273 = *--v255;
        *--v263 = v273;
      }
      while (v255 != v256);
    }
    goto LABEL_208;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v28 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_DEBUG, "Running C++ preprocessor and feature extraction", buf, 2u);
  }

  v938 = 0;
  v937 = 0;
  v939 = 0;
  value = self->_preprocessor.__ptr_.__value_;
  CoreHandwriting::drawingToInk(v883, &v941, (uint64_t *)&v931);
  CoreHandwriting::PreprocessingManager::process((CoreHandwriting::PreprocessingManager *)value, (const CoreHandwriting::Ink *)&v931, (CoreHandwriting::InkMapping *)&v937, (uint64_t)buf);
  if (__p)
    operator delete(__p);
  v30 = (char *)v931;
  if (*(double *)&v931 != 0.0)
  {
    v31 = v932;
    v32 = v931;
    if (v932 != v931)
    {
      v33 = v932;
      do
      {
        v35 = (void *)*((_QWORD *)v33 - 3);
        v33 -= 24;
        v34 = v35;
        if (v35)
        {
          *((_QWORD *)v31 - 2) = v34;
          operator delete(v34);
        }
        v31 = v33;
      }
      while (v33 != v30);
      v32 = v931;
    }
    v932 = v30;
    operator delete(v32);
  }
  CoreHandwriting::FeatureExtractionProcessor::process((CoreHandwriting::FeatureExtractionProcessor *)self->_featureExtractor.__ptr_.__value_, (const CoreHandwriting::Ink *)buf, (char **)&v931);
  v48 = *(uint64_t **)a7;
  *((_QWORD *)a7 + 1) = *(_QWORD *)a7;
  v50 = *(_QWORD *)buf;
  v49 = *(_QWORD *)&buf[8];
  v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
  if (v51 > (uint64_t)(*((_QWORD *)a7 + 2) - (_QWORD)v48) >> 3)
  {
    if (v51 >> 61)
      sub_1BE61F930();
    v52 = (char *)operator new(0x5555555555555558 * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3));
    *(_QWORD *)a7 = v52;
    *((_QWORD *)a7 + 1) = v52;
    *((_QWORD *)a7 + 2) = &v52[0x5555555555555558 * ((v49 - v50) >> 3)];
    if (v48)
    {
      operator delete(v48);
      v50 = *(_QWORD *)buf;
      v49 = *(_QWORD *)&buf[8];
    }
  }
  if (v49 != v50)
  {
    v53 = 0;
    while (1)
    {
      v55 = v53;
      if (0xAAAAAAAAAAAAAAABLL * ((v938 - (_BYTE *)v937) >> 3) > v53)
      {
        v56 = (char *)v937 + 24 * v53;
        memset(&v941._anon_8[8], 0, 24);
        v58 = *(_BYTE **)v56;
        v57 = (_BYTE *)*((_QWORD *)v56 + 1);
        v55 = v53;
        v59 = v57 - v58;
        if (v57 != v58)
        {
          if ((v59 & 0x8000000000000000) != 0)
            sub_1BE6FB4B8();
          v60 = operator new(v57 - v58);
          memcpy(v60, v58, v59 & 0xFFFFFFFFFFFFFFF0);
          v55 = v53;
          if (v59 >= 0x10)
            v55 = *v60;
          operator delete(v60);
        }
      }
      v62 = (char *)*((_QWORD *)a7 + 1);
      v61 = *((_QWORD *)a7 + 2);
      if ((unint64_t)v62 >= v61)
        break;
      *(_QWORD *)v62 = v55;
      v54 = (uint64_t)(v62 + 8);
LABEL_29:
      *((_QWORD *)a7 + 1) = v54;
      if (++v53 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3))
        goto LABEL_56;
    }
    v63 = *(char **)a7;
    v64 = (uint64_t)&v62[-*(_QWORD *)a7];
    v65 = v64 >> 3;
    v66 = (v64 >> 3) + 1;
    if (v66 >> 61)
      sub_1BE61F930();
    v67 = v61 - (_QWORD)v63;
    if (v67 >> 2 > v66)
      v66 = v67 >> 2;
    if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8)
      v68 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v68 = v66;
    if (v68)
    {
      if (v68 >> 61)
        sub_1BE61F100();
      v69 = operator new(8 * v68);
      v70 = (unint64_t *)&v69[8 * v65];
      *v70 = v55;
      v54 = (uint64_t)(v70 + 1);
      v71 = v62 - v63;
      if (v62 == v63)
        goto LABEL_54;
    }
    else
    {
      v69 = 0;
      v70 = (unint64_t *)(8 * v65);
      *(_QWORD *)(8 * v65) = v55;
      v54 = 8 * v65 + 8;
      v71 = v62 - v63;
      if (v62 == v63)
      {
LABEL_54:
        *(_QWORD *)a7 = v70;
        *((_QWORD *)a7 + 1) = v54;
        *((_QWORD *)a7 + 2) = &v69[8 * v68];
        if (v63)
          operator delete(v63);
        goto LABEL_29;
      }
    }
    v72 = v71 - 8;
    if (v72 < 0x58)
      goto LABEL_333;
    if ((unint64_t)(v62 - &v69[v64]) < 0x20)
      goto LABEL_333;
    v73 = (v72 >> 3) + 1;
    v74 = 8 * (v73 & 0x3FFFFFFFFFFFFFFCLL);
    v75 = &v62[-v74];
    v70 = (unint64_t *)((char *)v70 - v74);
    v76 = &v69[8 * v65 - 16];
    v77 = v62 - 16;
    v78 = v73 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v79 = *(_OWORD *)v77;
      *(v76 - 1) = *((_OWORD *)v77 - 1);
      *v76 = v79;
      v76 -= 2;
      v77 -= 32;
      v78 -= 4;
    }
    while (v78);
    v62 = v75;
    if (v73 != (v73 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_333:
      do
      {
        v80 = *((_QWORD *)v62 - 1);
        v62 -= 8;
        *--v70 = v80;
      }
      while (v62 != v63);
    }
    goto LABEL_54;
  }
LABEL_56:
  v81 = objc_msgSend_sequenceCompression(self, v43, v44, v45, v46, v47);
  v87 = v81;
  v89 = *(NSObject **)buf;
  v88 = *(NSObject **)&buf[8];
  if (*(_QWORD *)buf == *(_QWORD *)&buf[8])
  {
    v91 = 0;
  }
  else
  {
    v90 = *(_QWORD *)&buf[8] - *(_QWORD *)buf - 24;
    if (v90 >= 0x60)
    {
      v93 = v90 / 0x18 + 1;
      v94 = v93 & 3;
      if ((v93 & 3) == 0)
        v94 = 4;
      v95 = v93 - v94;
      v92 = (uint64_t *)(*(_QWORD *)buf + 24 * v95);
      v96 = 0uLL;
      v97 = *(const double **)buf;
      v98 = 0uLL;
      do
      {
        v99 = v97 + 12;
        v945 = vld3q_f64(v97);
        v100 = v97 + 6;
        v96 = vsraq_n_s64(v96, vsubq_s64((int64x2_t)v945.val[1], (int64x2_t)v945.val[0]), 5uLL);
        v946 = vld3q_f64(v100);
        v98 = vsraq_n_s64(v98, vsubq_s64((int64x2_t)v946.val[1], (int64x2_t)v946.val[0]), 5uLL);
        v97 = v99;
        v95 -= 4;
      }
      while (v95);
      v91 = vaddvq_s64(vaddq_s64(v98, v96));
    }
    else
    {
      v91 = 0;
      v92 = *(uint64_t **)buf;
    }
    do
    {
      v101 = *v92;
      v102 = v92[1];
      v92 += 3;
      v91 += (v102 - v101) >> 5;
    }
    while (v92 != *(uint64_t **)&buf[8]);
  }
  v103 = vcvtpd_u64_f64((double)v91 / (double)v81);
  memset(&v941._anon_8[8], 0, 24);
  if (v103)
  {
    if (v103 >> 61)
      sub_1BE61F930();
    v104 = (char *)operator new(8 * v103);
    v105 = &v104[8 * v103];
    *(_QWORD *)&v941._anon_8[8] = v104;
    *(_QWORD *)&v941._anon_8[16] = v104;
    *(_QWORD *)&v941._anon_8[24] = v105;
    if (v89 != v88)
      goto LABEL_69;
LABEL_107:
    v107 = 0;
    v111 = v104;
    v112 = v104;
    v139 = 0;
    v140 = 0;
    if (!v103)
      goto LABEL_108;
LABEL_104:
    if (v112 < v105)
    {
      *(_QWORD *)v112 = v107;
      v104 = v112 + 8;
      goto LABEL_313;
    }
    v173 = v140 + 1;
    if ((v140 + 1) >> 61)
      sub_1BE61F930();
    if ((v105 - v111) >> 2 > v173)
      v173 = (v105 - v111) >> 2;
    if ((unint64_t)(v105 - v111) >= 0x7FFFFFFFFFFFFFF8)
      v174 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v174 = v173;
    if (v174)
    {
      if (v174 >> 61)
        sub_1BE61F100();
      v175 = v107;
      v176 = operator new(8 * v174);
      v177 = &v176[8 * v140];
      v178 = &v176[8 * v174];
      *v177 = v175;
      v104 = (char *)(v177 + 1);
      v179 = (char *)(v112 - v111);
      if (v112 == v111)
        goto LABEL_311;
    }
    else
    {
      v176 = 0;
      v177 = (_QWORD *)(8 * v140);
      v178 = 0;
      *(_QWORD *)(8 * v140) = v107;
      v104 = (char *)(8 * v140 + 8);
      v179 = (char *)(v112 - v111);
      if (v112 == v111)
        goto LABEL_311;
    }
    v866 = (unint64_t)(v179 - 8);
    if (v866 >= 0x58)
    {
      if ((unint64_t)(v112 - &v176[v139]) >= 0x20)
      {
        v868 = (v866 >> 3) + 1;
        v869 = 8 * (v868 & 0x3FFFFFFFFFFFFFFCLL);
        v867 = &v112[-v869];
        v177 = (_QWORD *)((char *)v177 - v869);
        v870 = &v176[8 * v140 - 16];
        v871 = v112 - 16;
        v872 = v868 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v873 = *(_OWORD *)v871;
          *(v870 - 1) = *((_OWORD *)v871 - 1);
          *v870 = v873;
          v870 -= 2;
          v871 -= 32;
          v872 -= 4;
        }
        while (v872);
        if (v868 == (v868 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_311:
          *(_QWORD *)&v941._anon_8[8] = v177;
          *(_QWORD *)&v941._anon_8[24] = v178;
          if (v111)
          {
            v875 = v111;
            v876 = v104;
            operator delete(v875);
            v104 = v876;
          }
LABEL_313:
          v141 = a8;
          *(_QWORD *)&v941._anon_8[16] = v104;
          v142 = *(void **)a8;
          if (*(_QWORD *)a8)
            goto LABEL_109;
          goto LABEL_110;
        }
      }
      else
      {
        v867 = v112;
      }
    }
    else
    {
      v867 = v112;
    }
    do
    {
      v874 = *((_QWORD *)v867 - 1);
      v867 -= 8;
      *--v177 = v874;
    }
    while (v867 != v111);
    goto LABEL_311;
  }
  v105 = 0;
  v104 = 0;
  if (*(_QWORD *)buf == *(_QWORD *)&buf[8])
    goto LABEL_107;
LABEL_69:
  v890 = v103;
  v106 = 0;
  v107 = 0;
  v108 = v87;
  v109 = v87 - 1;
  v110 = v87 - 1;
  v111 = v104;
  v112 = v104;
  v900 = v109;
  obj = v88;
  do
  {
    v114.isa = v89->isa;
    isa = v89[1].isa;
    if (isa != v89->isa)
    {
      v115 = 0;
      v904 = v89;
      while (1)
      {
        if (v106 % v108 != v110)
          goto LABEL_75;
        if (v112 >= v105)
          break;
        *(_QWORD *)v112 = v107;
        v104 = v112 + 8;
LABEL_74:
        v107 = 0;
        isa = v89[1].isa;
        v112 = v104;
LABEL_75:
        ++v115;
        ++v106;
        if (v115 >= (isa - v114.isa) >> 5)
          goto LABEL_70;
      }
      v116 = (v112 - v111) >> 3;
      v117 = v116 + 1;
      if ((unint64_t)(v116 + 1) >> 61)
      {
        *(_QWORD *)&v941._anon_8[24] = v105;
        *(_QWORD *)&v941._anon_8[8] = v111;
        *(_QWORD *)&v941._anon_8[16] = v104;
        sub_1BE61F930();
      }
      if ((v105 - v111) >> 2 > v117)
        v117 = (v105 - v111) >> 2;
      if ((unint64_t)(v105 - v111) >= 0x7FFFFFFFFFFFFFF8)
        v118 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v118 = v117;
      if (v118)
      {
        if (v118 >> 61)
        {
          *(_QWORD *)&v941._anon_8[24] = v105;
          *(_QWORD *)&v941._anon_8[8] = v111;
          *(_QWORD *)&v941._anon_8[16] = v104;
          sub_1BE61F100();
        }
        v119 = v108;
        v120 = v107;
        v121 = v114.isa;
        v122 = v118;
        v123 = (char *)operator new(8 * v118);
        v114.isa = v121;
        v124 = v120;
        v108 = v119;
        v118 = v122;
        v125 = &v123[8 * v116];
        *(_QWORD *)v125 = v124;
        v104 = v125 + 8;
        v126 = (char *)(v112 - v111);
        if (v112 != v111)
        {
LABEL_87:
          v127 = (unint64_t)(v126 - 8);
          if (v127 < 0x168
            || (v132 = (v112 - 8 - v111) & 0xFFFFFFFFFFFFFFF8, &v123[v112 - v111 - 8 - v132] > &v123[v112 - v111 - 8])
            || &v112[-v132 - 8] > v112 - 8
            || (unint64_t)(v111 - v123) < 0x20)
          {
            v128 = v112;
            v89 = v904;
          }
          else
          {
            v133 = (v127 >> 3) + 1;
            v134 = 8 * (v133 & 0x3FFFFFFFFFFFFFFCLL);
            v128 = &v112[-v134];
            v125 -= v134;
            v135 = &v123[8 * v116 - 16];
            v136 = v112 - 16;
            v137 = v133 & 0x3FFFFFFFFFFFFFFCLL;
            v89 = v904;
            do
            {
              v138 = *(_OWORD *)v136;
              *((_OWORD *)v135 - 1) = *((_OWORD *)v136 - 1);
              *(_OWORD *)v135 = v138;
              v135 -= 32;
              v136 -= 32;
              v137 -= 4;
            }
            while (v137);
            if (v133 == (v133 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_90:
              v105 = &v123[8 * v118];
              if (!v111)
              {
LABEL_92:
                v111 = v125;
                v110 = v900;
                goto LABEL_74;
              }
LABEL_91:
              v130 = v111;
              v131 = v104;
              operator delete(v130);
              v104 = v131;
              v114.isa = v89->isa;
              goto LABEL_92;
            }
          }
          do
          {
            v129 = *((_QWORD *)v128 - 1);
            v128 -= 8;
            *((_QWORD *)v125 - 1) = v129;
            v125 -= 8;
          }
          while (v128 != v111);
          goto LABEL_90;
        }
      }
      else
      {
        v123 = 0;
        v125 = (char *)(8 * v116);
        *(_QWORD *)(8 * v116) = v107;
        v104 = (char *)(8 * v116 + 8);
        v126 = (char *)(v112 - v111);
        if (v112 != v111)
          goto LABEL_87;
      }
      v89 = v904;
      v105 = &v123[8 * v118];
      if (!v111)
        goto LABEL_92;
      goto LABEL_91;
    }
LABEL_70:
    ++v107;
    v89 += 3;
  }
  while (v89 != obj);
  *(_QWORD *)&v941._anon_8[24] = v105;
  *(_QWORD *)&v941._anon_8[8] = v111;
  *(_QWORD *)&v941._anon_8[16] = v104;
  v139 = v112 - v111;
  v140 = (v112 - v111) >> 3;
  if (v140 < v890)
    goto LABEL_104;
LABEL_108:
  ++*((_QWORD *)v112 - 1);
  v141 = a8;
  v142 = *(void **)a8;
  if (*(_QWORD *)a8)
  {
LABEL_109:
    v141[1] = v142;
    operator delete(v142);
    *v141 = 0;
    v141[1] = 0;
    v141[2] = 0;
    v104 = *(char **)&v941._anon_8[16];
  }
LABEL_110:
  v143 = *(_QWORD *)&v941._anon_8[24];
  *v141 = *(_QWORD *)&v941._anon_8[8];
  v141[1] = v104;
  v141[2] = v143;
  v940 = vcvtps_s32_f32((float)*(unint64_t *)v931 / (float)objc_msgSend_sequenceCompression(self, v82, v83, v84, v85, v86));
  objc_msgSend_model(self, v144, v145, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  CoreHandwriting::getMLMultiArrayView((CoreHandwriting *)&v931, v150, v151, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE7372D4(self, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v930 = 0;
  objc_msgSend_predictionFromFeatures_options_error_(v149, v157, (uint64_t)v156, (uint64_t)v882, (uint64_t)&v930, v158);
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v930;

  if (v935)
  {
    v936 = v935;
    operator delete(v935);
  }
  if (__p)
  {
    v934 = __p;
    operator delete(__p);
  }
  if (*(double *)&v931 != 0.0)
  {
    v932 = (char *)v931;
    operator delete(v931);
  }
  if (v943)
    operator delete(v943);
  v160 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v161 = *(_QWORD *)&buf[8];
    v162 = *(void **)buf;
    if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
    {
      v163 = *(_QWORD *)&buf[8];
      do
      {
        v165 = *(void **)(v163 - 24);
        v163 -= 24;
        v164 = v165;
        if (v165)
        {
          *(_QWORD *)(v161 - 16) = v164;
          operator delete(v164);
        }
        v161 = v163;
      }
      while (v163 != v160);
      v162 = *(void **)buf;
    }
    *(_QWORD *)&buf[8] = v160;
    operator delete(v162);
  }
  v166 = (char *)v937;
  if (v937)
  {
    v167 = v938;
    v168 = v937;
    if (v938 != v937)
    {
      v169 = v938;
      do
      {
        v171 = (void *)*((_QWORD *)v169 - 3);
        v169 -= 24;
        v170 = v171;
        if (v171)
        {
          *((_QWORD *)v167 - 2) = v170;
          operator delete(v170);
        }
        v167 = v169;
      }
      while (v169 != v166);
      v168 = v937;
    }
    v938 = v166;
    operator delete(v168);
  }
  v172 = 1;
LABEL_217:
  if (!v891)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v278 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_modelName(self, v279, v280, v281, v282, v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedDescription(v159, v285, v286, v287, v288, v289);
      v290 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v284;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v290;
      _os_log_impl(&dword_1BE607000, v278, OS_LOG_TYPE_ERROR, "An error occurred in the %@ model: %@", buf, 0x16u);

    }
    v172 = 0;
  }
  v927[0] = MEMORY[0x1E0C809B0];
  v927[1] = 3221225472;
  v927[2] = sub_1BE739E58;
  v927[3] = &unk_1E77F1F38;
  v927[4] = self;
  v291 = v927;
  if (qword_1EF568D78 != -1)
    dispatch_once(&qword_1EF568D78, v291);

  objc_msgSend_model(self, v292, v293, v294, v295, v296);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v926 = v159;
  v300 = (id)objc_msgSend_predictionFromFeatures_options_error_(v297, v298, qword_1EF568D80, (uint64_t)v882, (uint64_t)&v926, v299);
  v880 = v926;

  if (v172)
  {
    objc_msgSend_outputNames(self, v301, v302, v303, v304, v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v306, v307, v308, v309, v310, v311);
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureValueForName_(v891, v313, (uint64_t)v312, v314, v315, v316);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multiArrayValue(v317, v318, v319, v320, v321, v322);
    v323 = (void *)objc_claimAutoreleasedReturnValue();

    v924[0] = MEMORY[0x1E0C809B0];
    v924[1] = 3221225472;
    v924[2] = nullsub_30;
    v924[3] = &unk_1E77F45A8;
    v884 = v323;
    v925 = v884;
    v877 = (void *)MEMORY[0x1C3B81A84](v924);
    v922 = 0u;
    v923 = 0u;
    v920 = 0u;
    v921 = 0u;
    objc_msgSend_outputNames(self, v324, v325, v326, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    obja = v329;
    v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v329, v330, (uint64_t)&v920, (uint64_t)&v941._drawing.strokes.__end_, 16, v331);
    v337 = 0;
    if (v332)
    {
      v896 = *(_QWORD *)v921;
      do
      {
        v901 = v332;
        for (k = 0; k != v901; ++k)
        {
          if (*(_QWORD *)v921 != v896)
            objc_enumerationMutation(obja);
          v339 = *(void **)(*((_QWORD *)&v920 + 1) + 8 * k);
          if (objc_msgSend_isEqualToString_(v339, v333, (uint64_t)CFSTR("output_topk_indices"), v334, v335, v336))
          {
            objc_msgSend_featureValueForName_(v891, v333, (uint64_t)v339, v334, v335, v336);
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_multiArrayValue(v340, v341, v342, v343, v344, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();

            v918[0] = MEMORY[0x1E0C809B0];
            v918[1] = 3221225472;
            v918[2] = nullsub_31;
            v918[3] = &unk_1E77F45A8;
            v337 = v346;
            v919 = v337;
            v906 = (os_log_t)MEMORY[0x1C3B81A84](v918);
            objc_msgSend_shape(v337, v347, v348, v349, v350, v351);
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v346) = (unint64_t)objc_msgSend_count(v352, v353, v354, v355, v356, v357) > 2;

            if ((_DWORD)v346)
            {
              objc_msgSend_shape(v337, v358, v359, v360, v361, v362);
              v363 = (void *)objc_claimAutoreleasedReturnValue();
              v369 = objc_msgSend_count(v363, v364, v365, v366, v367, v368) == 3;

              if (v369)
              {
                v375 = objc_alloc(MEMORY[0x1E0C9E970]);
                v376 = objc_retainAutorelease(v337);
                v382 = objc_msgSend_dataPointer(v376, v377, v378, v379, v380, v381);
                objc_msgSend_shape(v376, v383, v384, v385, v386, v387);
                loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(loga, v388, 1, v389, v390, v391);
                v888 = (double *)objc_claimAutoreleasedReturnValue();
                v941._drawing.endTimes.__end_cap_.__value_ = v888;
                objc_msgSend_shape(v376, v392, v393, v394, v395, v396);
                v886 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v886, v397, 2, v398, v399, v400);
                v401 = (void *)objc_claimAutoreleasedReturnValue();
                v941._drawing.strokes.__begin_ = v401;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v402, (uint64_t)&v941._drawing.endTimes.__end_cap_, 2, v403, v404);
                v405 = (void *)objc_claimAutoreleasedReturnValue();
                v411 = objc_msgSend_dataType(v376, v406, v407, v408, v409, v410);
                objc_msgSend_shape(v376, v412, v413, v414, v415, v416);
                v417 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v417, v418, 2, v419, v420, v421);
                v422 = (double *)objc_claimAutoreleasedReturnValue();
                v941._drawing.endTimes.__begin_ = v422;
                v941._drawing.endTimes.__end_ = (double *)&unk_1E7828868;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v423, (uint64_t)&v941._drawing.endTimes, 2, v424, v425);
                v426 = (void *)objc_claimAutoreleasedReturnValue();
                v917 = 0;
                v337 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v375, v427, v382, (uint64_t)v405, v411, (uint64_t)v426, v906, &v917);
                v428 = v917;

              }
              else
              {
                objc_msgSend_shape(v337, v370, v371, v372, v373, v374);
                v429 = (void *)objc_claimAutoreleasedReturnValue();
                v435 = objc_msgSend_count(v429, v430, v431, v432, v433, v434) == 5;

                if (v435)
                {
                  v436 = objc_alloc(MEMORY[0x1E0C9E970]);
                  v437 = objc_retainAutorelease(v337);
                  v443 = objc_msgSend_dataPointer(v437, v438, v439, v440, v441, v442);
                  objc_msgSend_shape(v437, v444, v445, v446, v447, v448);
                  loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(loga, v449, 3, v450, v451, v452);
                  v889 = (double *)objc_claimAutoreleasedReturnValue();
                  v941._drawing.startTimes.__end_ = v889;
                  objc_msgSend_shape(v437, v453, v454, v455, v456, v457);
                  v887 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(v887, v458, 4, v459, v460, v461);
                  v462 = (double *)objc_claimAutoreleasedReturnValue();
                  v941._drawing.startTimes.__end_cap_.__value_ = v462;
                  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v463, (uint64_t)&v941._drawing.startTimes.__end_, 2, v464, v465);
                  v466 = (void *)objc_claimAutoreleasedReturnValue();
                  v472 = objc_msgSend_dataType(v437, v467, v468, v469, v470, v471);
                  objc_msgSend_shape(v437, v473, v474, v475, v476, v477);
                  v478 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(v478, v479, 4, v480, v481, v482);
                  v483 = (void *)objc_claimAutoreleasedReturnValue();
                  v941._drawing.strokeBoundsValidity.__cap_alloc_.__value_ = (unint64_t)v483;
                  v941._drawing.startTimes.__begin_ = (double *)&unk_1E7828868;
                  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v484, (uint64_t)&v941._drawing.strokeBoundsValidity.__cap_alloc_, 2, v485, v486);
                  v487 = (void *)objc_claimAutoreleasedReturnValue();
                  v916 = 0;
                  v337 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v436, v488, v443, (uint64_t)v466, v472, (uint64_t)v487, v906, &v916);
                  v428 = v916;

                }
                else
                {
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  loga = (os_log_t)(id)qword_1EF568E20;
                  if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend_shape(v337, v489, v490, v491, v492, v493);
                    v494 = (void *)objc_claimAutoreleasedReturnValue();
                    v500 = objc_msgSend_count(v494, v495, v496, v497, v498, v499);
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v500;
                    _os_log_impl(&dword_1BE607000, loga, OS_LOG_TYPE_ERROR, "Unexpect rank of the CoreML output array: %lu", buf, 0xCu);

                  }
                  v428 = 0;
                }
              }

              if (!v337)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v501 = (id)qword_1EF568E20;
                if (os_log_type_enabled(v501, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend_localizedDescription(v428, v502, v503, v504, v505, v506);
                  v507 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v507;
                  _os_log_impl(&dword_1BE607000, v501, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);

                }
              }

            }
          }
        }
        v329 = obja;
        v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v333, (uint64_t)&v920, (uint64_t)&v941._drawing.strokes.__end_, 16, v336);
      }
      while (v332);
    }

    objc_msgSend_shape(v884, v508, v509, v510, v511, v512);
    v513 = (void *)objc_claimAutoreleasedReturnValue();
    v519 = objc_msgSend_count(v513, v514, v515, v516, v517, v518) == 1;

    if (v519)
    {
      v525 = objc_alloc(MEMORY[0x1E0C9E970]);
      v526 = objc_retainAutorelease(v884);
      v532 = objc_msgSend_dataPointer(v526, v527, v528, v529, v530, v531);
      v941._drawing.strokeBoundsValidity.__begin_ = (unint64_t *)&unk_1E7828868;
      objc_msgSend_shape(v526, v533, v534, v535, v536, v537);
      v907 = (os_log_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v907, v538, v539, v540, v541, v542);
      v543 = (void *)objc_claimAutoreleasedReturnValue();
      v941._drawing.strokeBoundsValidity.__size_ = (unint64_t)v543;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v544, (uint64_t)&v941._drawing.strokeBoundsValidity, 2, v545, v546);
      v547 = (void *)objc_claimAutoreleasedReturnValue();
      v553 = objc_msgSend_dataType(v526, v548, v549, v550, v551, v552);
      objc_msgSend_shape(v526, v554, v555, v556, v557, v558);
      v559 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v559, v560, v561, v562, v563, v564);
      v565 = (void *)objc_claimAutoreleasedReturnValue();
      v941._drawing.strokeBounds.__end_ = v565;
      v941._drawing.strokeBounds.__end_cap_.__value_ = &unk_1E7828868;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v566, (uint64_t)&v941._drawing.strokeBounds.__end_, 2, v567, v568);
      v569 = (void *)objc_claimAutoreleasedReturnValue();
      v915 = 0;
      v884 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v525, v570, v532, (uint64_t)v547, v553, (uint64_t)v569, v877, &v915);
      v571 = v915;

      if (!v884)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v572 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v572, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_localizedDescription(v571, v573, v574, v575, v576, v577);
          v578 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v578;
          _os_log_impl(&dword_1BE607000, v572, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);

        }
      }

    }
    objc_msgSend_shape(v884, v520, v521, v522, v523, v524);
    v579 = (void *)objc_claimAutoreleasedReturnValue();
    v585 = (unint64_t)objc_msgSend_count(v579, v580, v581, v582, v583, v584) > 2;

    if (v585)
    {
      objc_msgSend_shape(v884, v586, v587, v588, v589, v590);
      v591 = (void *)objc_claimAutoreleasedReturnValue();
      v597 = objc_msgSend_count(v591, v592, v593, v594, v595, v596) == 3;

      if (v597)
      {
        v603 = objc_alloc(MEMORY[0x1E0C9E970]);
        v604 = objc_retainAutorelease(v884);
        v610 = objc_msgSend_dataPointer(v604, v605, v606, v607, v608, v609);
        objc_msgSend_shape(v604, v611, v612, v613, v614, v615);
        v908 = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v908, v616, 1, v617, v618, v619);
        v902 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v941._anon_8[112] = v902;
        objc_msgSend_shape(v604, v620, v621, v622, v623, v624);
        v897 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v897, v625, 2, v626, v627, v628);
        v629 = (void *)objc_claimAutoreleasedReturnValue();
        v941._drawing.strokeBounds.__begin_ = v629;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v630, (uint64_t)&v941._anon_8[112], 2, v631, v632);
        v633 = (void *)objc_claimAutoreleasedReturnValue();
        v639 = objc_msgSend_dataType(v604, v634, v635, v636, v637, v638);
        objc_msgSend_shape(v604, v640, v641, v642, v643, v644);
        v645 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v645, v646, 2, v647, v648, v649);
        v650 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v941._anon_8[96] = v650;
        *(_QWORD *)&v941._anon_8[104] = &unk_1E7828868;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v651, (uint64_t)&v941._anon_8[96], 2, v652, v653);
        v654 = (void *)objc_claimAutoreleasedReturnValue();
        v914 = 0;
        v884 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v603, v655, v610, (uint64_t)v633, v639, (uint64_t)v654, v877, &v914);
        v656 = v914;

      }
      else
      {
        objc_msgSend_shape(v884, v598, v599, v600, v601, v602);
        v658 = (void *)objc_claimAutoreleasedReturnValue();
        v664 = objc_msgSend_count(v658, v659, v660, v661, v662, v663) == 5;

        if (v664)
        {
          v665 = objc_alloc(MEMORY[0x1E0C9E970]);
          v666 = objc_retainAutorelease(v884);
          v672 = objc_msgSend_dataPointer(v666, v667, v668, v669, v670, v671);
          objc_msgSend_shape(v666, v673, v674, v675, v676, v677);
          v908 = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v908, v678, 3, v679, v680, v681);
          *(_QWORD *)&v941._anon_8[80] = objc_claimAutoreleasedReturnValue();
          v898 = *(void **)&v941._anon_8[80];
          objc_msgSend_shape(v666, v682, v683, v684, v685, v686);
          v903 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v903, v687, 4, v688, v689, v690);
          v691 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v941._anon_8[88] = v691;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v692, (uint64_t)&v941._anon_8[80], 2, v693, v694);
          v695 = (void *)objc_claimAutoreleasedReturnValue();
          v701 = objc_msgSend_dataType(v666, v696, v697, v698, v699, v700);
          objc_msgSend_shape(v666, v702, v703, v704, v705, v706);
          v707 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v707, v708, 4, v709, v710, v711);
          v712 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v941._anon_8[64] = v712;
          *(_QWORD *)&v941._anon_8[72] = &unk_1E7828868;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v713, (uint64_t)&v941._anon_8[64], 2, v714, v715);
          v716 = (void *)objc_claimAutoreleasedReturnValue();
          v913 = 0;
          v884 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v665, v717, v672, (uint64_t)v695, v701, (uint64_t)v716, v877, &v913);
          v656 = v913;

        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v908 = (os_log_t)(id)qword_1EF568E20;
          if (os_log_type_enabled(v908, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_shape(v884, v718, v719, v720, v721, v722);
            v723 = (void *)objc_claimAutoreleasedReturnValue();
            v729 = objc_msgSend_count(v723, v724, v725, v726, v727, v728);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v729;
            _os_log_impl(&dword_1BE607000, v908, OS_LOG_TYPE_ERROR, "Unexpect rank of the CoreML output array: %lu", buf, 0xCu);

          }
          v656 = 0;
        }
      }

      if (!v884)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v730 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v730, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_localizedDescription(v656, v731, v732, v733, v734, v735);
          v736 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v736;
          _os_log_impl(&dword_1BE607000, v730, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);

        }
      }

    }
    objc_msgSend_shape(v884, v586, v587, v588, v589, v590);
    v737 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v737, v738, 0, v739, v740, v741);
    v742 = (void *)objc_claimAutoreleasedReturnValue();
    v748 = (void *)objc_msgSend_integerValue(v742, v743, v744, v745, v746, v747);

    if ((void *)v940 != v748)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v749 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v749, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_modelName(self, v750, v751, v752, v753, v754);
        v755 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v755;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v940;
        *(_WORD *)&buf[22] = 2048;
        v943 = v748;
        _os_log_impl(&dword_1BE607000, v749, OS_LOG_TYPE_ERROR, "Error in model %@. Expected output length: %lu, actual output length: %lu", buf, 0x20u);

      }
    }
    if (v884)
    {
      v756 = objc_alloc(MEMORY[0x1E0D09AB0]);
      if (v337)
      {
        stringCodeMap = self->__stringCodeMap;
        blankIndex = self->_blankIndex;
        v909 = *(_OWORD *)&self->_decodingPruningPolicy.strategy;
        v910 = *(_QWORD *)&self->_decodingPruningPolicy.maxNumberOfCandidates;
        v760 = objc_msgSend_initWithMultiArray_indexArray_domainType_characterObservations_blankIndex_pruningPolicy_(v756, v757, (uint64_t)v884, (uint64_t)v337, 1, (uint64_t)stringCodeMap, blankIndex, &v909);
      }
      else
      {
        v762 = self->__stringCodeMap;
        v763 = self->_blankIndex;
        v911 = *(_OWORD *)&self->_decodingPruningPolicy.strategy;
        v912 = *(_QWORD *)&self->_decodingPruningPolicy.maxNumberOfCandidates;
        v760 = objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(v756, v757, (uint64_t)v884, 1, (uint64_t)v762, v763, &v911);
      }
      v761 = v760;
      v764 = [CHActivationMatrix alloc];
      v657 = (void *)objc_msgSend_initWithActivations_(v764, v765, (uint64_t)v761, v766, v767, v768);
      objc_msgSend_modelName(self, v769, v770, v771, v772, v773);
      v774 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_modelNameLatin(CHRecognizerConfiguration, v775, v776, v777, v778, v779);
      v780 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v774, v781, (uint64_t)v780, v782, v783, v784);

      if ((isEqualToString & 1) == 0)
      {
        objc_msgSend_skipLatinActivationThreshold(CHRecognizerConfiguration, v786, v787, v788, v789, v790);
        v792 = v791;
        objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v793, v794, v795, v796, v797);
        v798 = (void *)objc_claimAutoreleasedReturnValue();
        v801 = objc_msgSend_reachesActivationThreshold_inCharacterSet_resultArray_indexArray_(self, v799, (uint64_t)v798, (uint64_t)v884, (uint64_t)v337, v800, v792);
        objc_msgSend_setUnlikelyHasLatinContents_(v657, v802, v801 ^ 1u, v803, v804, v805);

      }
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v761 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v761, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v761, OS_LOG_TYPE_FAULT, "Unable to initialize resultArray and create activation matrix.", buf, 2u);
      }
      v657 = 0;
    }

    if (v881)
      objc_msgSend_updateActivationsWithActiveCharacterSet_resultArray_indexArray_(self, v806, (uint64_t)v881, (uint64_t)v884, (uint64_t)v337, v807);
    if (a9)
    {
      objc_msgSend_highestSymbolActivationWithResultArray_indexArray_symbol_(self, v806, (uint64_t)v884, (uint64_t)v337, (uint64_t)a9, v807);
      if (a10)
        *(_QWORD *)a10 = v808;
    }

  }
  else
  {
    v657 = 0;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v301, v302, v303, v304, v305);
  v810 = v809;
  objc_msgSend_model(self, v811, v812, v813, v814, v815);
  v816 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelKey(v816, v817, v818, v819, v820, v821);
  v822 = (void *)objc_claimAutoreleasedReturnValue();
  v827 = objc_msgSend_powerLogModelNameForModelKey_(CHSingletonMLModel, v823, (uint64_t)v822, v824, v825, v826);

  *(_QWORD *)&v941._anon_8[32] = CFSTR("inputStrokeCount");
  v828 = (void *)MEMORY[0x1E0CB37E8];
  v834 = objc_msgSend_strokeCount(v883, v829, v830, v831, v832, v833);
  objc_msgSend_numberWithUnsignedInteger_(v828, v835, v834, v836, v837, v838);
  v839 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v941._anon_8[48] = v839;
  *(_QWORD *)&v941._anon_8[40] = CFSTR("outputActivationCount");
  v840 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_activations(v657, v841, v842, v843, v844, v845);
  v846 = (void *)objc_claimAutoreleasedReturnValue();
  v852 = objc_msgSend_timestepCount(v846, v847, v848, v849, v850, v851);
  objc_msgSend_numberWithInteger_(v840, v853, v852, v854, v855, v856);
  v857 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v941._anon_8[56] = v857;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v858, (uint64_t)&v941._anon_8[48], (uint64_t)&v941._anon_8[32], 2, v859);
  v860 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_logModelInference_startTimestamp_endTimestamp_data_(CHPowerLogging, v861, v827, (uint64_t)v860, v862, v863, v27, v810);
  v864 = v657;

  return v864;
}

- (void)enumerateActivationsInResultArray:(id)a3 indexArray:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, uint64_t, uint64_t, uint64_t, __int16 *, char *);
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  void *v70;
  __int16 v71;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, __int16 *, char *))a5;
  v10 = objc_retainAutorelease(v7);
  v16 = objc_msgSend_dataPointer(v10, v11, v12, v13, v14, v15);
  objc_msgSend_shape(v10, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v22, v23, 0, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_integerValue(v27, v28, v29, v30, v31, v32);

  objc_msgSend_shape(v10, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v10;
  objc_msgSend_objectAtIndexedSubscript_(v39, v40, 1, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_integerValue(v44, v45, v46, v47, v48, v49);

  HIBYTE(v71) = 0;
  if (v33 >= 1 && v50 >= 1)
  {
    if (v8)
    {
      v51 = 0;
      v52 = 0;
      v53 = 4 * v50;
      do
      {
        v55 = 0;
        v56 = v16;
        while (1)
        {
          v57 = objc_retainAutorelease(v8);
          v63 = (uint64_t)*(float *)(objc_msgSend_dataPointer(v57, v58, v59, v60, v61, v62) + v51 + 4 * v55);
          LOBYTE(v71) = 0;
          v9[2](v9, v52, v55, v56, v63, &v71, (char *)&v71 + 1);
          v64 = HIBYTE(v71) == 0;
          if (v71)
            break;
          ++v55;
          v56 += 4;
          if (v50 == v55)
          {
            v64 = 1;
            break;
          }
        }
        ++v52;
        v16 += v53;
        v51 += v53;
      }
      while (v64 && v52 < v33);
    }
    else
    {
      v65 = 0;
      do
      {
        v67 = 0;
        v68 = v16;
        while (1)
        {
          LOBYTE(v71) = 0;
          v9[2](v9, v65, v67, v68, (uint64_t)(float)v67, &v71, (char *)&v71 + 1);
          v69 = HIBYTE(v71) == 0;
          if (v71)
            break;
          ++v67;
          v68 += 4;
          if (v50 == v67)
          {
            v69 = 1;
            break;
          }
        }
        ++v65;
        v16 += 4 * v50;
      }
      while (v69 && v65 < v33);
    }
  }

}

- (BOOL)reachesActivationThreshold:(double)a3 inCharacterSet:(id)a4 resultArray:(id)a5 indexArray:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  double v19;
  _QWORD v20[4];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;

  v10 = a4;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x2020000000;
  v24 = 0xC05F800000000000;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE73A458;
  v15[3] = &unk_1E77F45D0;
  v15[4] = self;
  v16 = v10;
  v19 = a3;
  v17 = v20;
  v18 = &v21;
  v11 = v10;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v12, (uint64_t)a5, (uint64_t)a6, (uint64_t)v15, v13);
  LOBYTE(a6) = v22[3] >= a3;

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a6;
}

- (double)highestSymbolActivationWithResultArray:(id)a3 indexArray:(id)a4 symbol:(id *)a5
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  _QWORD v19[4];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  unint64_t v23;

  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0xC05F800000000000;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE73A64C;
  v14[3] = &unk_1E77F45F8;
  v14[4] = self;
  v14[5] = v19;
  v14[6] = &v20;
  v14[7] = &v15;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)v14, v5);
  if (a5)
  {
    unicodeToNSString(*((_DWORD *)v16 + 6), v7, v8, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v21[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)updateActivationsWithActiveCharacterSet:(id)a3 resultArray:(id)a4 indexArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[6];
  void *__p;
  void *v43;
  uint64_t v44;
  _QWORD v45[4];
  _QWORD v46[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  objc_msgSend_shape(v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v16, v17, 1, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_integerValue(v21, v22, v23, v24, v25, v26);

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x4812000000;
  v41[3] = sub_1BE73A9AC;
  v41[4] = sub_1BE73A9D0;
  v41[5] = &unk_1BE94989A;
  __p = 0;
  v43 = 0;
  v44 = 0;
  v28 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1BE73A9E8;
  v35[3] = &unk_1E77F4620;
  v38 = v45;
  v37 = v46;
  v35[4] = self;
  v29 = v8;
  v39 = v41;
  v40 = v27;
  v36 = v29;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v30, (uint64_t)v9, (uint64_t)v10, (uint64_t)v35, v31);
  v34[0] = v28;
  v34[1] = 3221225472;
  v34[2] = sub_1BE73AC84;
  v34[3] = &unk_1E77F4648;
  v34[4] = self;
  v34[5] = v41;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v32, (uint64_t)v9, (uint64_t)v10, (uint64_t)v34, v33);

  _Block_object_dispose(v41, 8);
  if (__p)
  {
    v43 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v46, 8);

}

- (id)_extractFeaturesFromDrawing:(id)a3 inputName:(id)a4 interpointDistance:(double)a5 error:(id *)a6
{
  sub_1BE736A20(self, a3, a4, 1, 1, a6, 0.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)sequenceCompression
{
  return self->_sequenceCompression;
}

- (int64_t)distanceFeatureIndex
{
  return self->_distanceFeatureIndex;
}

- (int64_t)sinAlphaFeatureIndex
{
  return self->_sinAlphaFeatureIndex;
}

- (int64_t)cosAlphaFeatureIndex
{
  return self->_cosAlphaFeatureIndex;
}

- (int64_t)gapFeatureIndex
{
  return self->_gapFeatureIndex;
}

- (NSString)directionalFeaturesInputName
{
  return self->_directionalFeaturesInputName;
}

- (NSString)characterProbabilityOutputName
{
  return self->_characterProbabilityOutputName;
}

- (CHCodeMap)codeMap
{
  return self->_codeMap;
}

- (int64_t)blankIndex
{
  return self->_blankIndex;
}

- (int64_t)spaceIndex
{
  return self->_spaceIndex;
}

- (int64_t)pseudospaceIndex
{
  return self->_pseudospaceIndex;
}

- (BOOL)normalizeFeatures
{
  return self->_normalizeFeatures;
}

- (void)setNormalizeFeatures:(BOOL)a3
{
  self->_normalizeFeatures = a3;
}

- (double)distMean
{
  return self->_distMean;
}

- (void)setDistMean:(double)a3
{
  self->_distMean = a3;
}

- (double)distStd
{
  return self->_distStd;
}

- (void)setDistStd:(double)a3
{
  self->_distStd = a3;
}

- (double)interpointDistance
{
  return self->_interpointDistance;
}

- (unint64_t)strokeOrdering
{
  return self->_strokeOrdering;
}

- (void)setStrokeOrdering:(unint64_t)a3
{
  self->_strokeOrdering = a3;
}

- (BOOL)shouldUseCPPFeatureExtraction
{
  return self->_shouldUseCPPFeatureExtraction;
}

- (BOOL)shouldUseArabicVisualOrderFeatureExtraction
{
  return self->_shouldUseArabicVisualOrderFeatureExtraction;
}

- (BOOL)shouldUseStrokeDirectionFeature
{
  return self->_shouldUseStrokeDirectionFeature;
}

- (CVNLPTextDecodingPruningPolicy)decodingPruningPolicy
{
  *retstr = self[9];
  return self;
}

- (void)setDecodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->maxNumberOfCandidates;
  *(_OWORD *)&self->_decodingPruningPolicy.strategy = *(_OWORD *)&a3->strategy;
  *(_QWORD *)&self->_decodingPruningPolicy.maxNumberOfCandidates = v3;
}

- (void).cxx_destruct
{
  FeatureExtractionProcessor *value;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  PreprocessingManager *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  objc_storeStrong((id *)&self->__stringCodeMap, 0);
  objc_storeStrong((id *)&self->_characterProbabilityOutputName, 0);
  objc_storeStrong((id *)&self->_directionalFeaturesInputName, 0);
  value = self->_featureExtractor.__ptr_.__value_;
  self->_featureExtractor.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(_QWORD **)value;
    if (*(_QWORD *)value)
    {
      v5 = (_QWORD *)*((_QWORD *)value + 1);
      v6 = *(_QWORD **)value;
      if (v5 != v4)
      {
        do
        {
          v8 = *--v5;
          v7 = v8;
          *v5 = 0;
          if (v8)
            (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
        }
        while (v5 != v4);
        v6 = *(_QWORD **)value;
      }
      *((_QWORD *)value + 1) = v4;
      operator delete(v6);
    }
    MEMORY[0x1C3B812EC](value, 0x20C40960023A9);
  }
  v9 = self->_preprocessor.__ptr_.__value_;
  self->_preprocessor.__ptr_.__value_ = 0;
  if (v9)
  {
    v10 = *(_QWORD **)v9;
    if (*(_QWORD *)v9)
    {
      v11 = (_QWORD *)*((_QWORD *)v9 + 1);
      v12 = *(_QWORD **)v9;
      if (v11 != v10)
      {
        do
        {
          v14 = *--v11;
          v13 = v14;
          *v11 = 0;
          if (v14)
            (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
        }
        while (v11 != v10);
        v12 = *(_QWORD **)v9;
      }
      *((_QWORD *)v9 + 1) = v10;
      operator delete(v12);
    }
    JUMPOUT(0x1C3B812ECLL);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
