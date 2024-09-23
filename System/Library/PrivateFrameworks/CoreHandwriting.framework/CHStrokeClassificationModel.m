@implementation CHStrokeClassificationModel

+ (CHStrokeClassificationModel)modelWithModelName:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  CHStrokeClassificationModel *v7;
  _QWORD block[4];
  id v10;

  v3 = a3;
  objc_opt_self();
  if (qword_1EF568D98 != -1)
    dispatch_once(&qword_1EF568D98, &unk_1E77F1830);
  v4 = qword_1EF568D88;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE768130;
  block[3] = &unk_1E77F1F38;
  v10 = v3;
  v5 = v3;
  dispatch_sync(v4, block);
  v6 = (void *)qword_1EF568D90;
  if (qword_1EF568D90)
    ++*(_QWORD *)(qword_1EF568D90 + 32);
  v7 = v6;

  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void **model;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = (void *)qword_1EF568D90;
  if (qword_1EF568D90)
  {
    v4 = *(_QWORD *)(qword_1EF568D90 + 32) - 1;
    *(_QWORD *)(qword_1EF568D90 + 32) = v4;
    if (!v4)
    {
      model = (void **)self->_model;
      if (model)
      {
        CoreHandwriting::EspressoModelWrapper::~EspressoModelWrapper(model);
        MEMORY[0x1C3B812EC]();
        v3 = (void *)qword_1EF568D90;
      }
      self->_model = 0;
      self->_codeMap.__ptr_.__value_ = 0;
      qword_1EF568D90 = 0;

      objc_msgSend_logModelUnloaded_(CHPowerLogging, v6, 0, v7, v8, v9);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CHStrokeClassificationModel;
  -[CHStrokeClassificationModel dealloc](&v10, sel_dealloc);
}

- (id)_extractFeaturesFromDrawing:(id)a3 numStrokes:(unint64_t)a4 numPoints:(unint64_t)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t i;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  unint64_t v99;
  float v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  float v113;
  uint64_t v114;
  double v115;
  float v116;
  id v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v133;
  id v134;
  uint8_t buf[4];
  void *v136;
  __int16 v137;
  void *v138;
  _QWORD v139[6];

  v139[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend_pointCount(v10, v11, v12, v13, v14, v15))
  {
    objc_msgSend_bounds(v10, v16, v17, v18, v19, v20);
    v22 = v21;
    v24 = v23;
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D538];
    v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v25 = objc_alloc(MEMORY[0x1E0C9E970]);
  v139[0] = &unk_1E78290D8;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v26, a4, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v30;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v31, a5, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v35;
  v36 = (void *)MEMORY[0x1E0CB37E8];
  v42 = objc_msgSend_numInputFeatures(self, v37, v38, v39, v40, v41);
  objc_msgSend_numberWithInteger_(v36, v43, v42, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v139[3] = v47;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v139, 4, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0;
  v54 = (void *)objc_msgSend_initWithShape_dataType_error_(v25, v52, (uint64_t)v51, 65568, (uint64_t)&v134, v53);
  v133 = v134;

  if (v54)
  {
    objc_msgSend_fillWithNumber_(v54, v55, (uint64_t)&unk_1E7829750, v56, v57, v58);
    v59 = objc_retainAutorelease(v54);
    v70 = objc_msgSend_dataPointer(v59, v60, v61, v62, v63, v64);
    v71 = 0;
    for (i = 0; i < objc_msgSend_strokeCount(v10, v65, v66, v67, v68, v69, v133); ++i)
    {
      v77 = 0;
      v78 = v24;
      v79 = v22;
      while (v77 < objc_msgSend_pointCountForStrokeIndex_(v10, v73, i, v74, v75, v76))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(v10, v65, i, v77, v68, v69);
        v81 = v80;
        v83 = v82;
        v89 = objc_msgSend_numInputFeatures(self, v84, v85, v86, v87, v88);
        v95 = objc_msgSend_distanceFeatureIndex(self, v90, v91, v92, v93, v94);
        v96 = v81 - v79;
        v97 = v83 - v78;
        v98 = sqrt(v97 * v97 + v96 * v96);
        v99 = v89 * (v71 + v77);
        v100 = v98;
        *(float *)(v70 + 4 * (v95 + v99)) = v100;
        v106 = objc_msgSend_sinAngleFeatureIndex(self, v101, v102, v103, v104, v105);
        v112 = v97 / v98;
        if (v98 == 0.0)
          v112 = 0.0;
        v113 = v112;
        *(float *)(v70 + 4 * (v106 + v99)) = v113;
        v114 = objc_msgSend_cosAngleFeatureIndex(self, v107, v108, v109, v110, v111);
        v115 = v96 / v98;
        if (v98 == 0.0)
          v115 = 0.0;
        v116 = v115;
        *(float *)(v70 + 4 * (v114 + v99)) = v116;
        ++v77;
        v78 = v83;
        v79 = v81;
      }
      v71 += a5;
    }
    v117 = v59;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v118 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_modelName(self, v119, v120, v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedDescription(v133, v125, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v136 = v124;
      v137 = 2112;
      v138 = v130;
      _os_log_impl(&dword_1BE607000, v118, OS_LOG_TYPE_ERROR, "An error occurred when trying to allocate feature array for the %@ model: %@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(v133);
    v117 = objc_alloc_init(MEMORY[0x1E0C9E970]);
  }
  v131 = v117;

  return v131;
}

- (id)_subTilesForStrokeCount:(int64_t)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
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
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_maxNumberOfInputStrokes(self, v6, v7, v8, v9, v10) >= a3)
  {
    objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v11, 0, a3, v14, v15);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v52, (uint64_t)v51, v53, v54, v55);
LABEL_9:

    return v5;
  }
  if (a3 >= 1)
  {
    v16 = 0;
    while (1)
    {
      v17 = objc_msgSend_contextMaxStrokes(self, v11, v12, v13, v14, v15);
      v23 = objc_msgSend_maxNumberOfInputStrokes(self, v18, v19, v20, v21, v22);
      v28 = fmax((double)(v16 - v17), 0.0);
      v29 = (unint64_t)v28;
      v30 = a3 - (unint64_t)v28;
      if (v30 <= v23)
        break;
      v31 = objc_msgSend_recognitionMaxStrokes(self, v24, v25, v30, v26, v27);
      v37 = objc_msgSend_contextMaxStrokes(self, v32, v33, v34, v35, v36);
      objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v38, v29, (unint64_t)(fmin((double)a3, (double)(v31 + v16 + v37)) - (double)(unint64_t)v29), v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v5, v42, (uint64_t)v41, v43, v44, v45);

      v16 += objc_msgSend_recognitionMaxStrokes(self, v46, v47, v48, v49, v50);
      if (v16 >= a3)
        return v5;
    }
    objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v24, (unint64_t)v28, v30, v26, v27);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v56, (uint64_t)v51, v57, v58, v59);
    goto LABEL_9;
  }
  return v5;
}

- (BOOL)_isContentStroke:(int64_t)a3 withinSubtile:(int64_t)a4 withRange:(_NSRange)a5 ofTotal:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  BOOL v21;
  BOOL v22;
  uint8_t v24[16];

  length = a5.length;
  location = a5.location;
  v11 = a6 - 1;
  if (a6 <= 1)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_FAULT, "More than one subtiles are required.", v24, 2u);
    }

  }
  v13 = location + length - objc_msgSend_contextMaxStrokes(self, a2, a3, a4, a5.location, a5.length);
  v19 = objc_msgSend_contextMaxStrokes(self, v14, v15, v16, v17, v18) + location;
  v21 = v13 > a3 && v19 <= a3;
  v22 = v19 <= a3;
  if (v11 != a4)
    v22 = v21;
  if (a4)
    return v22;
  else
    return v13 > a3;
}

- (BOOL)classifyStrokes:(id)a3 outTextStrokeProbabilities:(void *)a4 cancellationBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char *v19;
  void *v20;
  char *v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  void *__p;
  char *v33;
  uint64_t v34;

  v8 = a3;
  v9 = a5;
  __p = 0;
  v33 = 0;
  v34 = 0;
  v17 = objc_msgSend_classifyStrokes_outStrokeClassProbabilities_cancellationBlock_(self, v10, (uint64_t)v8, (uint64_t)&__p, (uint64_t)v9, v11);
  v18 = v17 ^ 1;
  v19 = (char *)__p;
  if (!self)
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    v20 = *(void **)a4;
    *((_QWORD *)a4 + 1) = *(_QWORD *)a4;
    v21 = v33;
    v22 = 0xAAAAAAAAAAAAAAABLL * ((v33 - v19) >> 3);
    if (v22 > (uint64_t)(*((_QWORD *)a4 + 2) - (_QWORD)v20) >> 2)
    {
      if (v22 >> 62)
        sub_1BE61F930();
      v23 = (char *)operator new(0xAAAAAAAAAAAAAAACLL * ((v33 - v19) >> 3));
      *(_QWORD *)a4 = v23;
      *((_QWORD *)a4 + 1) = v23;
      *((_QWORD *)a4 + 2) = &v23[4 * v22];
      if (v20)
      {
        operator delete(v20);
        v19 = (char *)__p;
        v21 = v33;
      }
    }
    if (v21 != v19)
    {
      v24 = 0;
      v25 = 0;
      do
      {
        *(float *)(*(_QWORD *)a4 + 4 * v25++) = 1.0
                                              - *(float *)(*(_QWORD *)&v19[v24]
                                                         + 4
                                                         * objc_msgSend_nontextClassIndex(self, v12, v13, v14, v15, v16));
        v19 = (char *)__p;
        v24 += 24;
      }
      while (v25 < 0xAAAAAAAAAAAAAAABLL * ((v33 - (_BYTE *)__p) >> 3));
    }
  }
  if (v19)
  {
    v26 = v33;
    v27 = v19;
    if (v33 != v19)
    {
      v28 = v33;
      do
      {
        v30 = (void *)*((_QWORD *)v28 - 3);
        v28 -= 24;
        v29 = v30;
        if (v30)
        {
          *((_QWORD *)v26 - 2) = v29;
          operator delete(v29);
        }
        v26 = v28;
      }
      while (v28 != v19);
      v27 = __p;
    }
    v33 = v19;
    operator delete(v27);
  }

  return v17;
}

- (BOOL)classifyStrokes:(id)a3 outStrokeClassProbabilities:(void *)a4 cancellationBlock:(id)a5
{
  id v8;
  unsigned int (**v9)(void);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (**v30)(void);
  void *v31;
  NSObject *v32;
  char v33;
  uint8_t *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  size_t v89;
  char *v90;
  char *v91;
  __int128 v92;
  _QWORD *v93;
  _QWORD *v94;
  void *v95;
  void *v96;
  _QWORD *v97;
  _QWORD *v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t isContentStroke_withinSubtile_withRange_ofTotal;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint8_t *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  uint64_t j;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  char *v202;
  char *v203;
  char *v204;
  char *v205;
  char *v206;
  __int128 v207;
  char *v208;
  char *v209;
  void *v210;
  void *v211;
  NSObject *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  NSObject *v226;
  uint64_t v227;
  unint64_t k;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  unsigned int v259;
  uint64_t v260;
  unint64_t v261;
  _QWORD *v262;
  NSObject *v263;
  unint64_t v264;
  NSObject *v265;
  unint64_t v266;
  NSObject *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  char *v274;
  char *v275;
  void *v276;
  char *v277;
  void *v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  NSObject *v282;
  __int128 v284;
  void *v285;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id obj;
  uint64_t v291;
  unsigned int (**v292)(void);
  uint64_t *v293;
  void *v294;
  CHStrokeClassificationModel *v295;
  id v296;
  uint64_t v297;
  uint64_t v298;
  id v299;
  id v300;
  _QWORD v301[5];
  id v302;
  __int128 *p_buf;
  uint8_t *v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  _QWORD block[5];
  id v314;
  uint8_t *v315;
  void *v316;
  uint8_t v317[4];
  unint64_t v318;
  __int16 v319;
  unint64_t v320;
  __int128 buf;
  uint64_t v322;
  char v323;
  uint8_t v324[8];
  uint8_t *v325;
  uint64_t v326;
  __n128 (*v327)(__n128 *, __n128 *);
  void (*v328)(uint64_t);
  void *v329;
  void *__p;
  char *v331;
  char *v332;
  _BYTE v333[128];
  _QWORD v334[2];
  _BYTE v335[128];
  uint64_t v336;

  v336 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(void))a5;
  v286 = v8;
  v292 = v9;
  v15 = objc_msgSend_count(v8, v10, v11, v12, v13, v14);
  objc_msgSend__subTilesForStrokeCount_(self, v16, v15, v17, v18, v19);
  v295 = self;
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v285, v20, v21, v22, v23, v24) == 1)
  {
    v30 = v9;
    objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(CHStrokeUtilities, v25, (uint64_t)v286, 0, 1, (uint64_t)v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v324 = 0;
    v325 = v324;
    v326 = 0x2020000000;
    LOBYTE(v327) = 0;
    v32 = qword_1EF568D88;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE76ADAC;
    block[3] = &unk_1E77F4BB8;
    block[4] = self;
    v315 = v324;
    v300 = v31;
    v314 = v300;
    v316 = a4;
    dispatch_sync(v32, block);
    v33 = ((uint64_t (*)(unsigned int (**)(void)))v30[2])(v30);
    v34 = v325;
    if ((v33 & 1) == 0 && !v325[24])
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v35 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_modelName(self, v36, v37, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model during prediction", (uint8_t *)&buf, 0xCu);

      }
      v34 = v325;
    }
    v42 = v34[24] != 0;

    _Block_object_dispose(v324, 8);
    goto LABEL_127;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
  v300 = (id)objc_claimAutoreleasedReturnValue();
  v293 = (uint64_t *)a4;
  v311 = 0u;
  v312 = 0u;
  v309 = 0u;
  v310 = 0u;
  v43 = v8;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v309, (uint64_t)v335, 16, v45);
  if (v50)
  {
    v51 = 0;
    v52 = *(_QWORD *)v310;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v310 != v52)
          objc_enumerationMutation(v43);
        v334[0] = *(_QWORD *)(*((_QWORD *)&v309 + 1) + 8 * i);
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v46, v51 + i, v47, v48, v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v334[1] = v54;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)v334, 2, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v300, v59, (uint64_t)v58, v60, v61, v62);

      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v309, (uint64_t)v335, 16, v49);
      v51 += i;
    }
    while (v50);
  }

  objc_msgSend_sortedArrayUsingComparator_(v300, v63, (uint64_t)&unk_1E77F4BD8, v64, v65, v66);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (_QWORD *)*v293;
  v72 = (_QWORD *)v293[1];
  if (v72 != (_QWORD *)*v293)
  {
    v74 = (_QWORD *)v293[1];
    do
    {
      v76 = (void *)*(v74 - 3);
      v74 -= 3;
      v75 = v76;
      if (v76)
      {
        *(v72 - 2) = v75;
        operator delete(v75);
      }
      v72 = v74;
    }
    while (v74 != v73);
  }
  v293[1] = (uint64_t)v73;
  v77 = objc_msgSend_count(v43, v67, v68, v69, v70, v71);
  v79 = (_QWORD *)*v293;
  v78 = (_QWORD *)v293[1];
  v80 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v78 - *v293) >> 3);
  v81 = v77 - v80;
  if (v77 <= v80)
  {
    if (v77 < v80)
    {
      v97 = &v79[3 * v77];
      if (v78 != v97)
      {
        v98 = (_QWORD *)v293[1];
        do
        {
          v100 = (void *)*(v98 - 3);
          v98 -= 3;
          v99 = v100;
          if (v100)
          {
            *(v78 - 2) = v99;
            operator delete(v99);
          }
          v78 = v98;
        }
        while (v98 != v97);
      }
      v293[1] = (uint64_t)v97;
    }
  }
  else
  {
    v82 = v293[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (uint64_t)v78) >> 3) >= v81)
    {
      bzero((void *)v293[1], 24 * ((24 * v81 - 24) / 0x18) + 24);
      v293[1] = (uint64_t)&v78[3 * ((24 * v81 - 24) / 0x18) + 3];
    }
    else
    {
      if (v77 > 0xAAAAAAAAAAAAAAALL)
        sub_1BE61F930();
      v83 = 0xAAAAAAAAAAAAAAABLL * ((v82 - (uint64_t)v79) >> 3);
      v84 = 2 * v83;
      if (2 * v83 <= v77)
        v84 = v77;
      if (v83 >= 0x555555555555555)
        v85 = 0xAAAAAAAAAAAAAAALL;
      else
        v85 = v84;
      if (v85 > 0xAAAAAAAAAAAAAAALL)
        sub_1BE61F100();
      v86 = (char *)operator new(24 * v85);
      v87 = &v86[24 * v80];
      v88 = &v86[24 * v85];
      v89 = 24 * ((24 * v81 - 24) / 0x18) + 24;
      bzero(v87, v89);
      v90 = &v87[v89];
      if (v78 == v79)
      {
        *v293 = (uint64_t)v87;
        v293[1] = (uint64_t)v90;
        v293[2] = (uint64_t)v88;
      }
      else
      {
        do
        {
          v91 = v87;
          *((_QWORD *)v87 - 2) = 0;
          *((_QWORD *)v87 - 1) = 0;
          v92 = *(_OWORD *)(v78 - 3);
          v78 -= 3;
          *(_OWORD *)(v87 - 24) = v92;
          v87 -= 24;
          *((_QWORD *)v91 - 1) = v78[2];
          *v78 = 0;
          v78[1] = 0;
          v78[2] = 0;
        }
        while (v78 != v79);
        v78 = (_QWORD *)*v293;
        v93 = (_QWORD *)v293[1];
        *v293 = (uint64_t)v87;
        v293[1] = (uint64_t)v90;
        v293[2] = (uint64_t)v88;
        if (v93 != v78)
        {
          v94 = v93;
          do
          {
            v96 = (void *)*(v94 - 3);
            v94 -= 3;
            v95 = v96;
            if (v96)
            {
              *(v93 - 2) = v95;
              operator delete(v95);
            }
            v93 = v94;
          }
          while (v94 != v78);
        }
      }
      if (v78)
        operator delete(v78);
    }
  }
  v307 = 0u;
  v308 = 0u;
  v305 = 0u;
  v306 = 0u;
  obj = v285;
  v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v305, (uint64_t)v333, 16, v102);
  if (!v103)
  {
LABEL_120:
    v42 = 1;
    goto LABEL_126;
  }
  v297 = 0;
  v288 = *(_QWORD *)v306;
  *(_QWORD *)&v104 = 138412290;
  v284 = v104;
LABEL_51:
  v291 = 0;
  v287 = v103;
  while (1)
  {
    if (*(_QWORD *)v306 != v288)
      objc_enumerationMutation(obj);
    v105 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * v291);
    if (v292[2]())
      break;
    objc_msgSend_rangeValue(v105, v106, v107, v108, v109, v110);
    v298 = v111;
    v296 = obj;
    v299 = v289;
    if (v295)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v112, v113, v114, v115, v116);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v296, v117, v297, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend_rangeValue(v121, v122, v123, v124, v125, v126);
      v129 = v128;

      if (v127 < v127 + v129)
      {
        v135 = v129;
        v136 = v127;
        do
        {
          v137 = objc_msgSend_count(v296, v130, v131, v132, v133, v134, v284);
          isContentStroke_withinSubtile_withRange_ofTotal = objc_msgSend__isContentStroke_withinSubtile_withRange_ofTotal_(v295, v138, v136, v297, v127, v129, v137);
          objc_msgSend_objectAtIndexedSubscript_(v299, v140, v136, v141, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146, v147, v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v324 = v149;
          objc_msgSend_objectAtIndexedSubscript_(v299, v150, v136, v151, v152, v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v154, v155, 1, v156, v157, v158);
          v159 = (uint8_t *)objc_claimAutoreleasedReturnValue();
          v325 = v159;
          objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v160, isContentStroke_withinSubtile_withRange_ofTotal, v161, v162, v163);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v326 = (uint64_t)v164;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v165, (uint64_t)v324, 3, v166, v167);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v294, v169, (uint64_t)v168, v170, v171, v172);

          ++v136;
          --v135;
        }
        while (v135);
      }
      objc_msgSend_sortedArrayUsingComparator_(v294, v130, (uint64_t)&unk_1E77F4B90, v132, v133, v134, v284);
      v173 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v173 = 0;
    }

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v174, v298, v175, v176, v177);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (v298)
    {
      for (j = 0; j != v298; ++j)
      {
        objc_msgSend_objectAtIndexedSubscript_(v173, v178, j, v179, v180, v181, v284);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v184, v185, 0, v186, v187, v188);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v182, v190, (uint64_t)v189, v191, v192, v193);

      }
    }
    objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(CHStrokeUtilities, v178, (uint64_t)v182, 0, 1, (uint64_t)v292, v284);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v324 = 0;
    v325 = v324;
    v326 = 0x4812000000;
    v327 = sub_1BE76C930;
    v328 = sub_1BE76C954;
    v329 = &unk_1BE94989A;
    v331 = 0;
    v332 = 0;
    __p = 0;
    v200 = objc_msgSend_count(v173, v195, v196, v197, v198, v199);
    v201 = v200;
    v202 = (char *)__p;
    if (0xAAAAAAAAAAAAAAABLL * ((v332 - (_BYTE *)__p) >> 3) < v200)
    {
      if (v200 > 0xAAAAAAAAAAAAAAALL)
        sub_1BE61F930();
      v203 = v331;
      v204 = (char *)operator new(24 * v200);
      v205 = &v204[24 * ((v203 - v202) / 24)];
      v206 = v205;
      if (v203 == v202)
      {
        __p = &v204[24 * ((v203 - v202) / 24)];
        v331 = (char *)__p;
        v332 = &v204[24 * v201];
      }
      else
      {
        do
        {
          v207 = *(_OWORD *)(v203 - 24);
          v203 -= 24;
          *(_OWORD *)(v206 - 24) = v207;
          v206 -= 24;
          *((_QWORD *)v206 + 2) = *((_QWORD *)v203 + 2);
          *(_QWORD *)v203 = 0;
          *((_QWORD *)v203 + 1) = 0;
          *((_QWORD *)v203 + 2) = 0;
        }
        while (v203 != v202);
        v202 = (char *)__p;
        v208 = v331;
        __p = v206;
        v331 = v205;
        v332 = &v204[24 * v201];
        if (v208 != v202)
        {
          v209 = v208;
          do
          {
            v211 = (void *)*((_QWORD *)v209 - 3);
            v209 -= 24;
            v210 = v211;
            if (v211)
            {
              *((_QWORD *)v208 - 2) = v210;
              operator delete(v210);
            }
            v208 = v209;
          }
          while (v209 != v202);
        }
      }
      if (v202)
        operator delete(v202);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v322 = 0x2020000000;
    v323 = 0;
    v212 = qword_1EF568D88;
    v301[0] = MEMORY[0x1E0C809B0];
    v301[1] = 3221225472;
    v301[2] = sub_1BE76C9D0;
    v301[3] = &unk_1E77F4C00;
    v301[4] = v295;
    p_buf = &buf;
    v213 = v194;
    v302 = v213;
    v304 = v324;
    dispatch_sync(v212, v301);
    v215 = *((_QWORD *)v325 + 6);
    v214 = *((_QWORD *)v325 + 7);
    if (0xAAAAAAAAAAAAAAABLL * ((v214 - v215) >> 3) != objc_msgSend_count(v173, v216, v217, v218, v219, v220))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v226 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v226, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v317 = 0;
        _os_log_impl(&dword_1BE607000, v226, OS_LOG_TYPE_FAULT, "Different number of predicted probabilities than subtileStrokes.", v317, 2u);
      }

    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v227 = 0;
      for (k = 0; k < objc_msgSend_count(v173, v221, v222, v223, v224, v225); ++k)
      {
        objc_msgSend_objectAtIndexedSubscript_(v173, v229, k, v230, v231, v232);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v233, v234, 2, v235, v236, v237);
        v238 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_BOOLValue(v238, v239, v240, v241, v242, v243))
        {
          objc_msgSend_objectAtIndexedSubscript_(v173, v244, k, v245, v246, v247);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v248, v249, 1, v250, v251, v252);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          v259 = objc_msgSend_unsignedIntValue(v253, v254, v255, v256, v257, v258);

          if (0xAAAAAAAAAAAAAAABLL * ((v293[1] - *v293) >> 3) <= v259)
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v263 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v263, OS_LOG_TYPE_FAULT))
            {
              v264 = 0xAAAAAAAAAAAAAAABLL * ((v293[1] - *v293) >> 3);
              *(_DWORD *)v317 = 134218240;
              v318 = v259;
              v319 = 2048;
              v320 = v264;
              _os_log_impl(&dword_1BE607000, v263, OS_LOG_TYPE_FAULT, "Trying to assign outputStrokeClassProbabilities[%lu] for  outputStrokeClassProbabilities.size() == %lu", v317, 0x16u);
            }

            v261 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v325 + 7) - *((_QWORD *)v325 + 6)) >> 3);
          }
          else
          {
            v260 = *((_QWORD *)v325 + 6);
            v261 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v325 + 7) - v260) >> 3);
            if (k < v261)
            {
              v262 = (_QWORD *)(*v293 + 24 * v259);
              if ((_QWORD *)(v260 + v227) != v262)
                sub_1BE66E294(v262, *(char **)(v260 + v227), *(char **)(v260 + v227 + 8), (uint64_t)(*(_QWORD *)(v260 + v227 + 8) - *(_QWORD *)(v260 + v227)) >> 2);
              goto LABEL_100;
            }
          }
          if (k >= v261)
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v265 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v265, OS_LOG_TYPE_FAULT))
            {
              v266 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v325 + 7) - *((_QWORD *)v325 + 6)) >> 3);
              *(_DWORD *)v317 = 134218240;
              v318 = k;
              v319 = 2048;
              v320 = v266;
              _os_log_impl(&dword_1BE607000, v265, OS_LOG_TYPE_FAULT, "Trying to access predictedProbability[%lu] for predictedProbabilities.size() == %lu", v317, 0x16u);
            }

          }
        }
LABEL_100:

        v227 += 24;
      }
    }
    if ((((uint64_t (*)(void))v292[2])() & 1) == 0 && !*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v267 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_modelName(v295, v268, v269, v270, v271, v272);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v317 = v284;
        v318 = (unint64_t)v273;
        _os_log_impl(&dword_1BE607000, v267, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model during prediction", v317, 0xCu);

      }
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v324, 8);
    v274 = (char *)__p;
    if (__p)
    {
      v275 = v331;
      v276 = __p;
      if (v331 != __p)
      {
        v277 = v331;
        do
        {
          v279 = (void *)*((_QWORD *)v277 - 3);
          v277 -= 24;
          v278 = v279;
          if (v279)
          {
            *((_QWORD *)v275 - 2) = v278;
            operator delete(v278);
          }
          v275 = v277;
        }
        while (v277 != v274);
        v276 = __p;
      }
      v331 = v274;
      operator delete(v276);
    }

    ++v297;
    if (++v291 == v287)
    {
      v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v296, v280, (uint64_t)&v305, (uint64_t)v333, 16, v281);
      if (!v103)
        goto LABEL_120;
      goto LABEL_51;
    }
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v282 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v282, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v324 = 0;
    _os_log_impl(&dword_1BE607000, v282, OS_LOG_TYPE_DEBUG, "Cancelling stroke classification of chunks", v324, 2u);
  }

  v42 = 0;
LABEL_126:

LABEL_127:
  return v42;
}

- (id)predictedScriptsForDrawing:(id)a3 maxNumberOfLocales:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE76CD34;
  v19 = sub_1BE76CD44;
  v20 = 0;
  ++self->_inferenceCount;
  v7 = qword_1EF568D88;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BE76CD4C;
  v11[3] = &unk_1E77F38F8;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)localesFromModelPrediction:()vector<std:(std:(int64_t)a4 :(int64_t)a5 allocator<std:(id)a6 :vector<float>>> *)a3 :vector<float> maxNumberOfLocales:numberOfOutputClass:scriptCodeMap:
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  _BOOL4 v25;
  _BOOL4 v26;
  float v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  char *i;
  void *v109;
  vector<std::vector<float>, std::allocator<std::vector<float>>> *v111;
  id v113;
  void *v114;
  char *v115;
  unint64_t v116;

  v111 = a3;
  v7 = a6;
  v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v114 = v7;
  if (!(a5 << 32))
  {
    v13 = 0;
    v14 = (char *)v111->var1 - (char *)v111->var0;
    if (v14 < 1)
      goto LABEL_30;
    goto LABEL_6;
  }
  if (a5 << 32 < 0)
    sub_1BE61F930();
  v13 = operator new((4 * a5) & 0x3FFFFFFFFLL);
  bzero(v13, (4 * a5) & 0x3FFFFFFFFLL);
  v14 = (char *)v111->var1 - (char *)v111->var0;
  if (v14 >= 1)
  {
LABEL_6:
    v15 = 0;
    v16 = v14 / 0x18uLL;
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    do
    {
      if (a5 < 1)
      {
        v21 = 0.0;
        v23 = -1;
        v20 = -1;
      }
      else
      {
        v18 = 0;
        v20 = -1;
        v21 = 0.0;
        LODWORD(v12) = 0;
        v22 = -1;
        do
        {
          v19 = *((_QWORD *)v111->var0 + 3 * v15);
          v27 = *(float *)(v19 + 4 * v18);
          if (v27 > *(float *)&v12)
          {
            v23 = v18;
            v24 = *(float *)(v19 + 4 * v18);
          }
          else
          {
            v23 = v22;
            v24 = *(float *)&v12;
            v22 = v20;
            *(float *)&v12 = v21;
          }
          v25 = v27 > *(float *)&v12;
          v26 = v27 < v24;
          if (v26 && v25)
            v20 = v18;
          else
            v20 = v22;
          if (v26 && v25)
            v21 = *(float *)(v19 + 4 * v18);
          else
            v21 = *(float *)&v12;
          ++v18;
          *(float *)&v12 = v24;
          v22 = v23;
        }
        while (a5 != v18);
      }
      objc_msgSend_objectAtIndexedSubscript_(v7, v8, v23, v9, v10, v11, v12, v111);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_containsObject_(&unk_1E7827DE8, v29, (uint64_t)v28, v30, v31, v32);

      if ((v33 & 1) == 0)
        *((_DWORD *)v13 + v23) += 2;
      objc_msgSend_objectAtIndexedSubscript_(v7, v34, v20, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_containsObject_(&unk_1E7827DE8, v39, (uint64_t)v38, v40, v41, v42);
      if (v21 < 0.25)
        v44 = 1;
      else
        v44 = v43;

      if ((v44 & 1) == 0)
        ++*((_DWORD *)v13 + v20);
      ++v15;
      v7 = v114;
    }
    while (v15 != v17);
  }
LABEL_30:
  v45 = objc_msgSend_indexOfObject_(v7, v8, (uint64_t)&unk_1E7828FA0, v9, v10, v11, v111);
  v50 = objc_msgSend_indexOfObject_(v7, v46, (uint64_t)&unk_1E7828FB8, v47, v48, v49);
  v55 = *((_DWORD *)v13 + v45);
  if (v55)
  {
    v56 = *((_DWORD *)v13 + v50);
    if (v56)
      *((_DWORD *)v13 + v50) = v56 + v55;
  }
  v115 = 0;
  v116 = 0;
  if (a5 >= 1)
  {
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
    objc_msgSend_objectAtIndexedSubscript_(v114, v51, 0, v52, v53, v54);
    while (1)
    {
      v62 = objc_claimAutoreleasedReturnValue();
      v67 = v62;
      v68 = *((_DWORD *)v13 + v60);
      if (v59 < v58)
      {
        *(_QWORD *)v59 = v62;
        *((_DWORD *)v59 + 2) = v68;
        v61 = (unint64_t)(v59 + 16);
        v116 = (unint64_t)(v59 + 16);
        ++v60;
        v59 += 16;
        if (v60 == a5)
          goto LABEL_57;
        goto LABEL_36;
      }
      v69 = (v59 - v57) >> 4;
      v70 = v69 + 1;
      if ((unint64_t)(v69 + 1) >> 60)
        sub_1BE61F930();
      if ((v58 - v57) >> 3 > v70)
        v70 = (v58 - v57) >> 3;
      if ((unint64_t)(v58 - v57) >= 0x7FFFFFFFFFFFFFF0)
        v71 = 0xFFFFFFFFFFFFFFFLL;
      else
        v71 = v70;
      if (v71 >> 60)
        sub_1BE61F100();
      v72 = (char *)operator new(16 * v71);
      v73 = &v72[16 * v69];
      v58 = &v72[16 * v71];
      *(_QWORD *)v73 = v67;
      *((_DWORD *)v73 + 2) = v68;
      v61 = (unint64_t)(v73 + 16);
      if (v59 == v57)
      {
        v115 = v73;
        if (v57)
          goto LABEL_51;
      }
      else
      {
        v74 = v59;
        do
        {
          v75 = *((_QWORD *)v74 - 2);
          v74 -= 16;
          *(_QWORD *)v74 = 0;
          *((_QWORD *)v73 - 2) = v75;
          v73 -= 16;
          *((_DWORD *)v73 + 2) = *((_DWORD *)v74 + 2);
        }
        while (v74 != v57);
        v115 = v73;
        do
        {
          v76 = (void *)*((_QWORD *)v59 - 2);
          v59 -= 16;

        }
        while (v59 != v57);
        if (v57)
LABEL_51:
          operator delete(v57);
      }
      v57 = v73;
      v116 = v61;
      ++v60;
      v59 = (char *)v61;
      if (v60 == a5)
        goto LABEL_57;
LABEL_36:
      objc_msgSend_objectAtIndexedSubscript_(v114, v63, v60, v64, v65, v66);
    }
  }
  v61 = 0;
  v57 = 0;
LABEL_57:
  v77 = 126 - 2 * __clz((uint64_t)(v61 - (_QWORD)v57) >> 4);
  if ((char *)v61 == v57)
    v78 = 0;
  else
    v78 = v77;
  sub_1BE76D914((uint64_t)v57, v61, v78, 1);
  v83 = 0;
  v84 = 0;
  v90 = *((_DWORD *)v13 + objc_msgSend_indexOfObject_(v114, v79, (uint64_t)&unk_1E7828FE8, v80, v81, v82));
  while (objc_msgSend_count(v113, v85, v86, v87, v88, v89) < (unint64_t)a4)
  {
    if ((a5 & ~(a5 >> 63)) == v84)
      break;
    v96 = &v57[v83];
    if (!*(_DWORD *)&v57[v83 + 8])
      break;
    if (objc_msgSend_isEqualToNumber_(*(void **)&v57[v83], v91, (uint64_t)&unk_1E7828FE8, v93, v94, v95)
      && v84 + 1 < a5)
    {
      v101 = &v57[v83];
      if (*(_DWORD *)&v57[v83 + 24] > v90 / 2)
      {
        v102 = *(_QWORD *)v101;
        *(_QWORD *)v101 = *((_QWORD *)v101 + 2);
        *((_QWORD *)v101 + 2) = v102;
        LODWORD(v102) = *((_DWORD *)v96 + 2);
        *((_DWORD *)v96 + 2) = *((_DWORD *)v101 + 6);
        *((_DWORD *)v101 + 6) = v102;
        v57 = v115;
      }
    }
    objc_msgSend_addObject_(v113, v97, *(_QWORD *)&v57[v83], v98, v99, v100);
    ++v84;
    v83 += 16;
  }
  if (!objc_msgSend_count(v113, v91, v92, v93, v94, v95))
    objc_msgSend_addObject_(v113, v103, (uint64_t)&unk_1E7828FE8, v104, v105, v106);
  v107 = v113;
  if (v57)
  {
    for (i = (char *)v116; i != v57; i -= 16)
    {
      v109 = (void *)*((_QWORD *)i - 2);

    }
    operator delete(v57);
  }
  if (v13)
    operator delete(v13);

  return v107;
}

- (NSArray)modelConfigurationsNumStrokes
{
  return self->_modelConfigurationsNumStrokes;
}

- (NSArray)modelConfigurationsNumPoints
{
  return self->_modelConfigurationsNumPoints;
}

- (NSString)modelSmallestConfig
{
  return self->_modelSmallestConfig;
}

- (int64_t)numInputFeatures
{
  return self->_numInputFeatures;
}

- (int64_t)distanceFeatureIndex
{
  return self->_distanceFeatureIndex;
}

- (int64_t)sinAngleFeatureIndex
{
  return self->_sinAngleFeatureIndex;
}

- (int64_t)cosAngleFeatureIndex
{
  return self->_cosAngleFeatureIndex;
}

- (int64_t)modelDecoderSize
{
  return self->_modelDecoderSize;
}

- (int64_t)maxInputWidth
{
  return self->_maxInputWidth;
}

- (int64_t)minPointsPerStroke
{
  return self->_minPointsPerStroke;
}

- (int64_t)maxPointsPerStroke
{
  return self->_maxPointsPerStroke;
}

- (int64_t)recognitionMaxStrokes
{
  return self->_recognitionMaxStrokes;
}

- (int64_t)contextMaxStrokes
{
  return self->_contextMaxStrokes;
}

- (int64_t)maxStrokeHeight
{
  return self->_maxStrokeHeight;
}

- (int64_t)maxNumberOfInputStrokes
{
  return self->_maxNumberOfInputStrokes;
}

- (double)interpointDistance
{
  return self->_interpointDistance;
}

- (int64_t)numOutputClasses
{
  return self->_numOutputClasses;
}

- (int64_t)nontextClassIndex
{
  return self->_nontextClassIndex;
}

- (int64_t)weakLabelIndex
{
  return self->_weakLabelIndex;
}

- (NSIndexSet)textLTRClassIndexes
{
  return self->_textLTRClassIndexes;
}

- (NSIndexSet)textRTLClassIndexes
{
  return self->_textRTLClassIndexes;
}

- (NSArray)scriptCodeMap
{
  return self->_scriptCodeMap;
}

- (NSDictionary)codeScriptDictionary
{
  return self->_codeScriptDictionary;
}

- (NSDictionary)scriptCodeDictionary
{
  return self->_scriptCodeDictionary;
}

- (void).cxx_destruct
{
  CHCodeMap *value;

  objc_storeStrong((id *)&self->_scriptCodeDictionary, 0);
  objc_storeStrong((id *)&self->_codeScriptDictionary, 0);
  objc_storeStrong((id *)&self->_scriptCodeMap, 0);
  objc_storeStrong((id *)&self->_textRTLClassIndexes, 0);
  objc_storeStrong((id *)&self->_textLTRClassIndexes, 0);
  objc_storeStrong((id *)&self->_modelSmallestConfig, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumPoints, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumStrokes, 0);
  value = self->_codeMap.__ptr_.__value_;
  self->_codeMap.__ptr_.__value_ = 0;
  if (value)
  {
    if (value->var0)
      munmap(value->var0, value->var1);
    MEMORY[0x1C3B812EC](value, 0x1010C40A749B91FLL);
  }
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
