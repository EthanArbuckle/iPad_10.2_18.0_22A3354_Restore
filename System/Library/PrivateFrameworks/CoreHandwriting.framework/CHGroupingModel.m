@implementation CHGroupingModel

+ (void)setup
{
  if (qword_1EF568DA0 != -1)
    dispatch_once(&qword_1EF568DA0, &unk_1E77F1910);
}

+ (CHGroupingModel)modelWithModelName:(id)a3 contentType:(int64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CHGroupingModel *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  int64_t v25;

  v5 = a3;
  objc_msgSend_setup(CHGroupingModel, v6, v7, v8, v9, v10);
  v11 = qword_1EF568280;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_1BE7BCE54;
  v23 = &unk_1E77F24A0;
  v12 = v5;
  v24 = v12;
  v25 = a4;
  dispatch_sync(v11, &v20);
  objc_msgSend_incrementUsageCount((void *)qword_1EF568288, v13, v14, v15, v16, v17, v20, v21, v22, v23);
  v18 = (CHGroupingModel *)(id)qword_1EF568288;

  return v18;
}

- (CHGroupingModel)initWithModelName:(id)a3 model:(void *)a4 contentType:(int64_t)a5
{
  uint64_t v5;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *supportedConfigurationsNumStrokes;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_setup(CHGroupingModel, a2, (uint64_t)a3, (uint64_t)a4, a5, v5);
  self->_contentType = a5;
  self->_modelUseCount = 0;
  self->_inferenceCount = 0;
  self->_model = a4;
  *(_OWORD *)&self->_maxNumStrokes = xmmword_1BE8DF3C0;
  *(_OWORD *)&self->_numOverlapStrokes = xmmword_1BE8DF3D0;
  *(_QWORD *)&self->_interpolationDistance = 0x448000003F800000;
  *(_OWORD *)&self->_numSignalFeaturesPerPoint = xmmword_1BE8DF3E0;
  self->_tileOverlapHeight = 100;
  v20[0] = &unk_1E7829240;
  v20[1] = &unk_1E7829258;
  v20[2] = &unk_1E7829270;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, 250, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v20, 4, v15, v16);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedConfigurationsNumStrokes = self->_supportedConfigurationsNumStrokes;
  self->_supportedConfigurationsNumStrokes = v17;

  return self;
}

- (void)incrementUsageCount
{
  ++self->_modelUseCount;
}

- (void)decrementUsageCount
{
  --self->_modelUseCount;
}

- (int64_t)usageCount
{
  return self->_modelUseCount;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **model;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  if (qword_1EF568288)
  {
    objc_msgSend_decrementUsageCount((void *)qword_1EF568288, a2, v2, v3, v4, v5);
    if (!objc_msgSend_usageCount((void *)qword_1EF568288, v7, v8, v9, v10, v11))
    {
      model = (void **)self->_model;
      if (model)
      {
        CoreHandwriting::EspressoModelWrapper::~EspressoModelWrapper(model);
        MEMORY[0x1C3B812EC]();
      }
      self->_model = 0;
      v13 = (void *)qword_1EF568288;
      qword_1EF568288 = 0;

      objc_msgSend_logModelUnloaded_(CHPowerLogging, v14, 1, v15, v16, v17);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CHGroupingModel;
  -[CHGroupingModel dealloc](&v18, sel_dealloc);
}

- (id)extractBBoxFeaturesForDrawing:(id)a3 padTo:(int64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
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
  uint64_t v47;
  unint64_t i;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  float v70;
  float v71;
  double MinY;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  float v78;
  float v79;
  double MaxX;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  float v86;
  float v87;
  double MaxY;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  float v95;
  _QWORD v97[5];
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v97[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  v97[0] = &unk_1E7829288;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v12;
  v97[2] = &unk_1E7829288;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend_numBBoxFeaturesPerStroke(self, v14, v15, v16, v17, v18);
  objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v97, 4, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_initWithShape_dataType_error_(v7, v29, (uint64_t)v28, 65568, 0, v30);

  objc_msgSend_fillWithNumber_(v31, v32, (uint64_t)&unk_1E7829760, v33, v34, v35);
  v36 = objc_retainAutorelease(v31);
  v47 = objc_msgSend_dataPointer(v36, v37, v38, v39, v40, v41);
  for (i = 0; i < objc_msgSend_strokeCount(v6, v42, v43, v44, v45, v46); ++i)
  {
    v54 = objc_msgSend_numBBoxFeaturesPerStroke(self, v49, v50, v51, v52, v53);
    objc_msgSend_boundsForStrokeIndex_(v6, v55, i, v56, v57, v58);
    x = v98.origin.x;
    y = v98.origin.y;
    width = v98.size.width;
    height = v98.size.height;
    MinX = CGRectGetMinX(v98);
    objc_msgSend_coordinateNormalizationFactor(self, v64, v65, v66, v67, v68);
    v69 = v54 * i;
    v71 = MinX / v70;
    *(float *)(v47 + 4 * v69) = v71;
    v99.origin.x = x;
    v99.origin.y = y;
    v99.size.width = width;
    v99.size.height = height;
    MinY = CGRectGetMinY(v99);
    objc_msgSend_coordinateNormalizationFactor(self, v73, v74, v75, v76, v77);
    v79 = MinY / v78;
    *(float *)(v47 + 4 * v69 + 4) = v79;
    v100.origin.x = x;
    v100.origin.y = y;
    v100.size.width = width;
    v100.size.height = height;
    MaxX = CGRectGetMaxX(v100);
    objc_msgSend_coordinateNormalizationFactor(self, v81, v82, v83, v84, v85);
    v87 = MaxX / v86;
    *(float *)(v47 + 4 * v69 + 8) = v87;
    v101.origin.x = x;
    v101.origin.y = y;
    v101.size.width = width;
    v101.size.height = height;
    MaxY = CGRectGetMaxY(v101);
    objc_msgSend_coordinateNormalizationFactor(self, v89, v90, v91, v92, v93);
    v95 = MaxY / v94;
    *(float *)(v47 + 4 * v69 + 12) = v95;
  }

  return v36;
}

- (id)extractSignalFeaturesFromDrawing:(id)a3 padTo:(int64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t i;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t j;
  double v66;
  double v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  float v88;
  float v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float v95;
  float v96;
  _QWORD v98[5];

  v98[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  v98[0] = &unk_1E7829288;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v12;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend_maxNumPointsPerStroke(self, v14, v15, v16, v17, v18);
  objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v24;
  v25 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend_numSignalFeaturesPerPoint(self, v26, v27, v28, v29, v30);
  objc_msgSend_numberWithUnsignedInteger_(v25, v32, v31, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v36;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v98, 4, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend_initWithShape_dataType_error_(v7, v41, (uint64_t)v40, 65568, 0, v42);

  objc_msgSend_fillWithNumber_(v43, v44, (uint64_t)&unk_1E7829760, v45, v46, v47);
  v48 = objc_retainAutorelease(v43);
  v59 = objc_msgSend_dataPointer(v48, v49, v50, v51, v52, v53);
  for (i = 0; i < objc_msgSend_strokeCount(v6, v54, v55, v56, v57, v58); ++i)
  {
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v6, v61, i, v62, v63, v64); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(v6, v54, i, j, v57, v58);
      v67 = v66;
      v69 = v68;
      v75 = objc_msgSend_maxNumPointsPerStroke(self, v70, v71, v72, v73, v74);
      v81 = objc_msgSend_numSignalFeaturesPerPoint(self, v76, v77, v78, v79, v80);
      objc_msgSend_coordinateNormalizationFactor(self, v82, v83, v84, v85, v86);
      v87 = v81 * (j + i * v75);
      v89 = v67 / v88;
      *(float *)(v59 + 4 * v87) = v89;
      objc_msgSend_coordinateNormalizationFactor(self, v90, v91, v92, v93, v94);
      v96 = v69 / v95;
      *(float *)(v59 + 4 * v87 + 4) = v96;
    }
  }

  return v48;
}

- (id)extractSignalMaskFromDrawing:(id)a3 padTo:(int64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
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
  uint64_t v47;
  unint64_t i;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t j;
  _QWORD v55[5];

  v55[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  v55[0] = &unk_1E7829288;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v12;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend_maxNumPointsPerStroke(self, v14, v15, v16, v17, v18);
  objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v24;
  v55[3] = &unk_1E7829288;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v55, 4, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_initWithShape_dataType_error_(v7, v29, (uint64_t)v28, 65568, 0, v30);

  objc_msgSend_fillWithNumber_(v31, v32, (uint64_t)&unk_1E7829760, v33, v34, v35);
  v36 = objc_retainAutorelease(v31);
  v47 = objc_msgSend_dataPointer(v36, v37, v38, v39, v40, v41);
  for (i = 0; i < objc_msgSend_strokeCount(v6, v42, v43, v44, v45, v46); ++i)
  {
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v6, v49, i, v50, v51, v52); ++j)
      *(_DWORD *)(v47 + 4 * (j + i * objc_msgSend_maxNumPointsPerStroke(self, v42, v43, v44, v45, v46))) = 1065353216;
  }

  return v36;
}

- (id)strokesSortedByMidY:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1E77F5130, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)normalizedDrawing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  double v32;
  float v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CoreHandwriting *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  const CoreHandwriting::Ink *v62;
  char *v63;
  char *v64;
  void *v65;
  char *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v77;
  char *v78;
  void *__p;
  _QWORD v80[2];
  int v81;
  int v82;
  _BYTE buf[22];
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_pointCount(v4, v5, v6, v7, v8, v9))
  {
    objc_msgSend_bounds(v4, v10, v11, v12, v13, v14);
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend_bounds(v4, v10, v11, v12, v13, v14);
  v20 = v19;
  objc_msgSend_coordinateNormalizationFactor(self, v21, v22, v23, v24, v25);
  v32 = 1.0;
  if (v20 > v31)
  {
    objc_msgSend_coordinateNormalizationFactor(self, v26, v27, v28, v29, v30);
    v34 = v33;
    objc_msgSend_bounds(v4, v35, v36, v37, v38, v39);
    v41 = v40;
    v42 = v34;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v32 = v42 / v41;
    v43 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_bounds(v4, v44, v45, v46, v47, v48);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v32;
      _os_log_impl(&dword_1BE607000, v43, OS_LOG_TYPE_DEBUG, "Input too wide (%f): adjust with scale factor %f", buf, 0x16u);
    }

  }
  objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v4, v26, v27, v28, v29, v30, -v16, -v18, v32);
  v50 = (CoreHandwriting *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interpolationDistance(self, v51, v52, v53, v54, v55);
  v80[0] = &off_1E77F0958;
  *(double *)&v80[1] = v61;
  v81 = 1;
  v82 = objc_msgSend_maxNumPointsPerStroke(self, v56, v57, v58, v59, v60);
  CoreHandwriting::drawingToInk(v50, MEMORY[0x1E0C9D538], (uint64_t *)&v77);
  sub_1BE6FA6B0((uint64_t)v80, (uint64_t)&v77, 0, (uint64_t)buf);
  if (__p)
    operator delete(__p);
  v63 = (char *)v77;
  if (v77)
  {
    v64 = v78;
    v65 = v77;
    if (v78 != v77)
    {
      v66 = v78;
      do
      {
        v68 = (void *)*((_QWORD *)v66 - 3);
        v66 -= 24;
        v67 = v68;
        if (v68)
        {
          *((_QWORD *)v64 - 2) = v67;
          operator delete(v67);
        }
        v64 = v66;
      }
      while (v66 != v63);
      v65 = v77;
    }
    v78 = v63;
    operator delete(v65);
  }
  CoreHandwriting::inkToDrawing((uint64_t **)buf, v62);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
    operator delete(v84);
  v70 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v71 = *(_QWORD *)&buf[8];
    v72 = *(void **)buf;
    if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
    {
      v73 = *(_QWORD *)&buf[8];
      do
      {
        v75 = *(void **)(v73 - 24);
        v73 -= 24;
        v74 = v75;
        if (v75)
        {
          *(_QWORD *)(v71 - 16) = v74;
          operator delete(v74);
        }
        v71 = v73;
      }
      while (v73 != v70);
      v72 = *(void **)buf;
    }
    *(_QWORD *)&buf[8] = v70;
    operator delete(v72);
  }

  return v69;
}

- (int64_t)_tileIndexForYPosition:(double)a3 tileHeight:(int64_t)a4
{
  uint64_t v4;

  v4 = vcvtmd_s64_f64(a3 / (double)a4);
  return v4 & ~(v4 >> 63);
}

- (int64_t)_closestConfigurationForInputStrokes:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  int64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  int64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_maxNumStrokes(self, a2, a3, v3, v4, v5) < (unint64_t)a3)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v50 = a3;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_FAULT, "Invalid number of input strokes %li", buf, 0xCu);
    }

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend_supportedConfigurationsNumStrokes(self, v8, v9, v10, v11, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v44, (uint64_t)v48, 16, v16);
  if (v22)
  {
    v23 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v14);
        v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend_integerValue(v25, v17, v18, v19, v20, v21) >= a3)
        {
          v42 = objc_msgSend_integerValue(v25, v17, v18, v19, v20, v21);
          goto LABEL_17;
        }
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v44, (uint64_t)v48, 16, v21);
      if (v22)
        continue;
      break;
    }
  }

  objc_msgSend_supportedConfigurationsNumStrokes(self, v26, v27, v28, v29, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v14, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_integerValue(v36, v37, v38, v39, v40, v41);

LABEL_17:
  return v42;
}

- (void)createTilesForInputStrokes:(id)a3 subtileStartIndexes:(id *)a4 strokesForSubtile:(id *)a5
{
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t i;
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
  double MidY;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
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
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
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
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t k;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
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
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  id v252;
  id v253;
  id *v254;
  void *v256;
  id obj;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  void *v261;
  uint64_t j;
  id v263;
  id v264;
  void *v265;
  uint64_t v266;
  id v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  _BYTE v272[128];
  uint64_t v273;
  CGRect v274;
  CGRect v275;

  v254 = a5;
  v273 = *MEMORY[0x1E0C80C00];
  v263 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v6, v7, v8, v9, v10);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v13, v14, v15);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v263, v16, v17, v18, v19, v20, v254); ++i)
  {
    objc_msgSend_objectAtIndex_(v263, v22, i, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v27, v28, v29, v30, v31, v32);
    MidY = CGRectGetMidY(v274);
    v39 = objc_msgSend_tileOverlapHeight(self, v34, v35, v36, v37, v38);
    v45 = objc_msgSend_recognitionTileHeight(self, v40, v41, v42, v43, v44);
    v50 = objc_msgSend__tileIndexForYPosition_tileHeight_(self, v46, v45, v47, v48, v49, MidY - (double)(unint64_t)v39);
    objc_msgSend_bounds(v27, v51, v52, v53, v54, v55);
    v56 = CGRectGetMidY(v275);
    v62 = objc_msgSend_tileOverlapHeight(self, v57, v58, v59, v60, v61);
    v68 = objc_msgSend_recognitionTileHeight(self, v63, v64, v65, v66, v67);
    v73 = objc_msgSend__tileIndexForYPosition_tileHeight_(self, v69, v68, v70, v71, v72, v56 + (double)(unint64_t)v62);
    if (v50 <= v73)
    {
      v78 = v73 + 1;
      do
      {
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v74, v50, v75, v76, v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v261, v80, (uint64_t)v79, v81, v82, v83);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v89)
        {
          objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v84, v85, v86, v87, v88);
          v90 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v261, v91, v90, (uint64_t)v79, v92, v93);
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v94, i, v95, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v260, v99, (uint64_t)v98, (uint64_t)v79, v100, v101);

          v89 = (void *)v90;
        }
        objc_msgSend_addObject_(v89, v84, (uint64_t)v27, v86, v87, v88);

        ++v50;
      }
      while (v78 != v50);
    }

  }
  objc_msgSend_allKeys(v261, v22, v23, v24, v25, v26);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v102, v103, (uint64_t)sel_compare_, v104, v105, v106);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v107, v108, v109, v110, v111);
  v267 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v112, v113, v114, v115, v116);
  v264 = (id)objc_claimAutoreleasedReturnValue();
  v270 = 0u;
  v271 = 0u;
  v268 = 0u;
  v269 = 0u;
  obj = v256;
  v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v268, (uint64_t)v272, 16, v118);
  if (v259)
  {
    v266 = 0;
    v258 = *(_QWORD *)v269;
    do
    {
      for (j = 0; j != v259; ++j)
      {
        if (*(_QWORD *)v269 != v258)
          objc_enumerationMutation(obj);
        v123 = *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * j);
        objc_msgSend_objectForKeyedSubscript_(v260, v119, v123, v120, v121, v122);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v261, v124, v123, v125, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend_count(v128, v129, v130, v131, v132, v133);

        if (v134 >= (unint64_t)objc_msgSend_maxNumStrokes(self, v135, v136, v137, v138, v139))
        {
          v163 = objc_msgSend_maxNumStrokes(self, v140, v141, v142, v143, v144);
          v174 = vcvtps_s32_f32((float)v134/ (float)(unint64_t)(v163 - objc_msgSend_numOverlapStrokes(self, v164, v165, v166, v167, v168)));
          if (v174 < 1)
          {
            v174 = 0;
          }
          else
          {
            for (k = 0; k != v174; ++k)
            {
              v176 = objc_msgSend_maxNumStrokes(self, v169, v170, v171, v172, v173);
              v182 = objc_msgSend_numOverlapStrokes(self, v177, v178, v179, v180, v181);
              v183 = (void *)MEMORY[0x1E0CB37E8];
              v189 = objc_msgSend_integerValue(v265, v184, v185, v186, v187, v188);
              v190 = (v176 - v182) * k;
              objc_msgSend_numberWithInteger_(v183, v191, v189 + v190, v192, v193, v194);
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              v196 = v266 + k;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v197, v266 + k, v198, v199, v200);
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v267, v202, (uint64_t)v195, (uint64_t)v201, v203, v204);

              v215 = v134 - v190;
              if (objc_msgSend_maxNumStrokes(self, v205, v206, v207, v208, v209) < (unint64_t)(v134 - v190))
                v215 = objc_msgSend_maxNumStrokes(self, v210, v211, v212, v213, v214);
              v216 = (void *)MEMORY[0x1E0C99E10];
              v217 = (void *)MEMORY[0x1E0CB36B8];
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v210, v196, v212, v213, v214);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v267, v219, (uint64_t)v218, v220, v221, v222);
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              v229 = objc_msgSend_integerValue(v223, v224, v225, v226, v227, v228);
              objc_msgSend_indexSetWithIndexesInRange_(v217, v230, v229, v215, v231, v232);
              v233 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectsAtIndexes_(v263, v234, (uint64_t)v233, v235, v236, v237);
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_orderedSetWithArray_(v216, v239, (uint64_t)v238, v240, v241, v242);
              v243 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v244, v196, v245, v246, v247);
              v248 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v264, v249, (uint64_t)v243, (uint64_t)v248, v250, v251);

            }
          }
          v162 = v174 + v266;
        }
        else
        {
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v140, v266, v142, v143, v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v267, v146, (uint64_t)v265, (uint64_t)v145, v147, v148);

          objc_msgSend_objectForKeyedSubscript_(v261, v149, v123, v150, v151, v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v154, v266, v155, v156, v157);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v264, v159, (uint64_t)v153, (uint64_t)v158, v160, v161);

          v162 = v266 + 1;
        }
        v266 = v162;

      }
      v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v119, (uint64_t)&v268, (uint64_t)v272, 16, v122);
    }
    while (v259);
  }

  v252 = objc_retainAutorelease(v267);
  *a4 = v252;
  v253 = objc_retainAutorelease(v264);
  *v254 = v253;

}

- (id)groupStrokes:(id)a3 previousAdjacencies:(const void *)a4 updatedAdjacencies:(void *)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  char *v108;
  char **v109;
  char **v110;
  unint64_t v111;
  char *v112;
  char *v113;
  BOOL v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  _BYTE *v118;
  int v119;
  uint64_t v120;
  int v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  _QWORD *v127;
  char *v128;
  _QWORD *v129;
  _QWORD *v130;
  char *v131;
  unint64_t v132;
  unint64_t v133;
  _QWORD *v134;
  _QWORD *v135;
  void **v136;
  void **v137;
  _QWORD *v138;
  __int128 *v139;
  void **v140;
  void **v141;
  uint64_t **v142;
  unint64_t v143;
  unint64_t v144;
  char *v145;
  char *v146;
  _QWORD *v147;
  _QWORD *v148;
  unint64_t i;
  uint64_t v150;
  unint64_t v151;
  void *v152;
  char *v153;
  _QWORD *v154;
  _QWORD *v155;
  NSObject *v156;
  uint64_t v157;
  void ***v158;
  void **v159;
  void ***v160;
  void **v161;
  void **v162;
  char *v163;
  unint64_t v164;
  unint64_t v165;
  char *v166;
  char *v167;
  void **v168;
  void **v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD *v172;
  char *v173;
  _QWORD *v174;
  char *v175;
  unint64_t v176;
  unint64_t v177;
  _QWORD *v178;
  _QWORD *v179;
  void **v180;
  void **v181;
  unint64_t v182;
  unint64_t v183;
  char *v184;
  char *v185;
  _QWORD *v186;
  _QWORD *v187;
  void **v188;
  char *v189;
  char *v190;
  char *v191;
  unint64_t v192;
  unint64_t v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  char *v198;
  void **v199;
  uint64_t v200;
  void **v201;
  void **v202;
  void *v203;
  void **v204;
  unsigned __int8 *v205;
  _BYTE *v206;
  int v207;
  unsigned __int8 *v208;
  int v209;
  uint64_t *v210;
  uint64_t v211;
  _QWORD *v212;
  void **v213;
  uint64_t j;
  uint64_t *v215;
  _QWORD *v216;
  uint64_t v217;
  unint64_t v218;
  int8x8_t v219;
  uint8x8_t v220;
  unint64_t v221;
  _QWORD *v222;
  _QWORD *v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t v226;
  int v227;
  float v228;
  float v229;
  _QWORD *v230;
  _QWORD *v231;
  void *v232;
  _QWORD *v233;
  _QWORD *v234;
  void *v235;
  void *v236;
  _QWORD *v237;
  _QWORD *v238;
  char *v239;
  _QWORD *v240;
  char *v241;
  unint64_t v242;
  unint64_t v243;
  _QWORD *v244;
  _QWORD *v245;
  void **v246;
  void **v247;
  unint64_t v248;
  unint64_t v249;
  char *v250;
  char *v251;
  _QWORD *v252;
  _QWORD *v253;
  _QWORD *v254;
  uint64_t v255;
  uint64_t *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  int64_t v263;
  void *v264;
  unint64_t v265;
  unint64_t v266;
  _QWORD *v267;
  _QWORD *v268;
  unint64_t v269;
  unint64_t v270;
  int v271;
  uint64_t v272;
  char *v273;
  char *v274;
  unint64_t v275;
  unint64_t v276;
  uint64_t v277;
  uint64_t *v278;
  uint64_t v279;
  uint64_t v280;
  char *v281;
  char *v282;
  uint64_t v283;
  int64_t v284;
  char *v285;
  unint64_t v286;
  uint64_t v287;
  BOOL v288;
  unint64_t v289;
  uint64_t v290;
  int64_t v291;
  char *v292;
  _BYTE *v293;
  char *v294;
  char *v295;
  unint64_t v296;
  char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  size_t v302;
  int64_t v303;
  uint64_t v304;
  char *v305;
  char *v306;
  size_t v307;
  uint64_t v308;
  char *v309;
  char *v310;
  unint64_t v311;
  unint64_t v312;
  unint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t *v316;
  __int128 *v317;
  _OWORD *v318;
  uint64_t v319;
  __int128 v320;
  uint64_t v321;
  char *v322;
  unint64_t v323;
  uint64_t v324;
  _OWORD *v325;
  char *v326;
  uint64_t v327;
  __int128 v328;
  uint64_t v329;
  int64_t v330;
  _BYTE *v331;
  uint64_t v332;
  uint64_t v333;
  _OWORD *v334;
  char *v335;
  uint64_t v336;
  __int128 v337;
  uint64_t v338;
  char *v339;
  void *v340;
  void *v341;
  unint64_t v342;
  void *v343;
  _QWORD *v344;
  unint64_t v345;
  _QWORD *v346;
  int v347;
  _OWORD *v348;
  uint64_t *v349;
  _QWORD *v350;
  _QWORD *v351;
  int v352;
  _QWORD *v353;
  _DWORD *v354;
  _DWORD *v355;
  int v356;
  uint64_t **v357;
  uint64_t **v358;
  int v359;
  uint64_t *v360;
  _QWORD *v361;
  unint64_t v362;
  char *v363;
  char *v364;
  uint64_t v365;
  unint64_t v366;
  uint64_t v367;
  unint64_t v368;
  _BYTE *v369;
  _DWORD *v370;
  uint64_t v371;
  int64_t v372;
  unint64_t v373;
  uint64_t v374;
  uint64_t v375;
  char *v376;
  _OWORD *v377;
  char *v378;
  uint64_t v379;
  __int128 v380;
  int v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  _OWORD *v386;
  char *v387;
  char *v388;
  void *v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  double v418;
  double v419;
  double v420;
  double v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  double x;
  double y;
  double width;
  double height;
  int *v436;
  int *k;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  CGFloat v460;
  CGFloat v461;
  CGFloat v462;
  CGFloat v463;
  CHStrokeGroup *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  objc_class *v471;
  void *v472;
  const char *v473;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  _QWORD *v479;
  _OWORD *v480;
  _QWORD *v481;
  _QWORD *v482;
  void *v483;
  void *v484;
  void **v486;
  id obj;
  uint64_t v489;
  id v490;
  uint64_t v491;
  const void *v492;
  uint64_t v494;
  void *v495;
  id v496;
  _QWORD *v497;
  _QWORD *v498;
  uint64_t v499;
  char *v500;
  char *v501;
  void ***v502;
  unint64_t v503;
  char *v504;
  int v505;
  id v506;
  uint64_t v507;
  void *v508;
  void *v509;
  void **v510;
  int v511;
  unint64_t v512;
  _QWORD block[4];
  id v514;
  CHGroupingModel *v515;
  __int128 *v516;
  uint64_t v517;
  void *v518[2];
  void *v519[2];
  int v520;
  __int128 v521;
  __int128 __p;
  void (*v523)(uint64_t);
  void *v524;
  void *v525;
  _QWORD *v526;
  uint64_t v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  id v532;
  id v533;
  void *v534;
  char *v535;
  unint64_t v536;
  char *v537;
  char *v538;
  char *v539;
  _BYTE v540[128];
  uint64_t v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;

  v541 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend_count(v6, v7, v8, v9, v10, v11))
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v12, v13, v14, v15, v16);
    v506 = (id)objc_claimAutoreleasedReturnValue();
    v340 = v6;
    goto LABEL_485;
  }
  objc_msgSend_strokesSortedByMidY_(self, v12, (uint64_t)v6, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v534 = 0;
  v535 = 0;
  v536 = 0;
  v495 = v17;
  while (v23 < objc_msgSend_count(v17, v18, v19, v20, v21, v22))
  {
    v521 = 0u;
    __p = 0u;
    LODWORD(v523) = 1065353216;
    v24 = v535;
    if ((unint64_t)v535 >= v536)
    {
      v25 = sub_1BE7C14E0(&v534, (uint64_t *)&v521);
      v26 = (_QWORD *)__p;
      v535 = v25;
      if ((_QWORD)__p)
      {
        do
        {
          v27 = (_QWORD *)*v26;
          operator delete(v26);
          v26 = v27;
        }
        while (v27);
      }
    }
    else
    {
      *(_QWORD *)v535 = 0;
      *((_QWORD *)v24 + 1) = 0;
      *((_QWORD *)v24 + 2) = 0;
      *((_QWORD *)v24 + 3) = 0;
      *((_DWORD *)v24 + 8) = 1065353216;
      v535 = v24 + 40;
    }
    if ((_QWORD)v521)
      operator delete((void *)v521);
    ++v23;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v18, v19, v20, v21, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v532 = v34;
  v533 = v28;
  objc_msgSend_createTilesForInputStrokes_subtileStartIndexes_strokesForSubtile_(self, v35, (uint64_t)v17, (uint64_t)&v533, (uint64_t)&v532, v36);
  v490 = v533;

  v496 = v532;
  objc_msgSend_allKeys(v496, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v42, v43, (uint64_t)sel_compare_, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v530 = 0u;
  v531 = 0u;
  v528 = 0u;
  v529 = 0u;
  obj = v47;
  v491 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v528, (uint64_t)v540, 16, v49);
  if (v491)
  {
    v489 = *(_QWORD *)v529;
    v497 = (char *)a4 + 8;
    v502 = (void ***)((char *)a5 + 8);
    v486 = &v518[1];
    do
    {
      v499 = 0;
      do
      {
        if (*(_QWORD *)v529 != v489)
          objc_enumerationMutation(obj);
        v54 = *(_QWORD *)(*((_QWORD *)&v528 + 1) + 8 * v499);
        objc_msgSend_objectForKeyedSubscript_(v490, v50, v54, v51, v52, v53, v486);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend_integerValue(v55, v56, v57, v58, v59, v60);

        objc_msgSend_objectForKeyedSubscript_(v496, v62, v54, v63, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v507 = objc_msgSend_count(v66, v67, v68, v69, v70, v71);

        objc_msgSend_objectForKeyedSubscript_(v496, v72, v54, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(v76, v77, v78, v79, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v88 = 0;
        v538 = 0;
        v539 = 0;
        v537 = (char *)&v538;
        while (v88 < objc_msgSend_count(v82, v83, v84, v85, v86, v87))
        {
          objc_msgSend_objectAtIndexedSubscript_(v82, v89, v88, v91, v92, v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIdentifier(v94, v95, v96, v97, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend_hash(v100, v101, v102, v103, v104, v105);
          v107 = v106;
          v108 = v538;
          v109 = &v538;
          v110 = &v538;
          if (v538)
          {
            while (1)
            {
              while (1)
              {
                v110 = (char **)v108;
                v111 = *((_QWORD *)v108 + 4);
                if (v106 >= v111)
                  break;
                v108 = *v110;
                v109 = v110;
                if (!*v110)
                  goto LABEL_25;
              }
              if (v111 >= v106)
                break;
              v108 = v110[1];
              if (!v108)
              {
                v109 = v110 + 1;
                goto LABEL_25;
              }
            }
          }
          else
          {
LABEL_25:
            v112 = (char *)operator new(0x28uLL);
            *((_QWORD *)v112 + 4) = v107;
            *(_QWORD *)v112 = 0;
            *((_QWORD *)v112 + 1) = 0;
            *((_QWORD *)v112 + 2) = v110;
            *v109 = v112;
            if (*(_QWORD *)v537)
            {
              v537 = *(char **)v537;
              v112 = *v109;
            }
            v113 = v538;
            v114 = v112 == v538;
            v112[24] = v112 == v538;
            if (!v114)
            {
              do
              {
                v115 = *((_QWORD *)v112 + 2);
                if (*(_BYTE *)(v115 + 24))
                  break;
                v116 = *(char **)(v115 + 16);
                v117 = *(_QWORD *)v116;
                if (*(_QWORD *)v116 == v115)
                {
                  v120 = *((_QWORD *)v116 + 1);
                  if (!v120 || (v121 = *(unsigned __int8 *)(v120 + 24), v118 = (_BYTE *)(v120 + 24), v121))
                  {
                    if (*(char **)v115 == v112)
                    {
                      *(_BYTE *)(v115 + 24) = 1;
                      v116[24] = 0;
                      v124 = *(_QWORD *)(v115 + 8);
                      *(_QWORD *)v116 = v124;
                      if (v124)
                        goto LABEL_42;
                    }
                    else
                    {
                      v122 = *(uint64_t **)(v115 + 8);
                      v123 = *v122;
                      *(_QWORD *)(v115 + 8) = *v122;
                      if (v123)
                      {
                        *(_QWORD *)(v123 + 16) = v115;
                        v116 = *(char **)(v115 + 16);
                      }
                      v122[2] = (uint64_t)v116;
                      *(_QWORD *)(*(_QWORD *)(v115 + 16) + 8 * (**(_QWORD **)(v115 + 16) != v115)) = v122;
                      *v122 = v115;
                      *(_QWORD *)(v115 + 16) = v122;
                      v116 = (char *)v122[2];
                      v115 = *(_QWORD *)v116;
                      *((_BYTE *)v122 + 24) = 1;
                      v116[24] = 0;
                      v124 = *(_QWORD *)(v115 + 8);
                      *(_QWORD *)v116 = v124;
                      if (v124)
LABEL_42:
                        *(_QWORD *)(v124 + 16) = v116;
                    }
                    *(_QWORD *)(v115 + 16) = *((_QWORD *)v116 + 2);
                    *(_QWORD *)(*((_QWORD *)v116 + 2) + 8 * (**((_QWORD **)v116 + 2) != (_QWORD)v116)) = v115;
                    *(_QWORD *)(v115 + 8) = v116;
LABEL_48:
                    *((_QWORD *)v116 + 2) = v115;
                    break;
                  }
                }
                else if (!v117 || (v119 = *(unsigned __int8 *)(v117 + 24), v118 = (_BYTE *)(v117 + 24), v119))
                {
                  if (*(char **)v115 == v112)
                  {
                    v126 = *((_QWORD *)v112 + 1);
                    *(_QWORD *)v115 = v126;
                    if (v126)
                    {
                      *(_QWORD *)(v126 + 16) = v115;
                      v116 = *(char **)(v115 + 16);
                    }
                    *((_QWORD *)v112 + 2) = v116;
                    *(_QWORD *)(*(_QWORD *)(v115 + 16) + 8 * (**(_QWORD **)(v115 + 16) != v115)) = v112;
                    *((_QWORD *)v112 + 1) = v115;
                    *(_QWORD *)(v115 + 16) = v112;
                    v116 = (char *)*((_QWORD *)v112 + 2);
                    v112[24] = 1;
                    v116[24] = 0;
                    v115 = *((_QWORD *)v116 + 1);
                    v125 = *(char **)v115;
                    *((_QWORD *)v116 + 1) = *(_QWORD *)v115;
                    if (v125)
LABEL_46:
                      *((_QWORD *)v125 + 2) = v116;
                  }
                  else
                  {
                    *(_BYTE *)(v115 + 24) = 1;
                    v116[24] = 0;
                    v115 = *((_QWORD *)v116 + 1);
                    v125 = *(char **)v115;
                    *((_QWORD *)v116 + 1) = *(_QWORD *)v115;
                    if (v125)
                      goto LABEL_46;
                  }
                  *(_QWORD *)(v115 + 16) = *((_QWORD *)v116 + 2);
                  *(_QWORD *)(*((_QWORD *)v116 + 2) + 8 * (**((_QWORD **)v116 + 2) != (_QWORD)v116)) = v115;
                  *(_QWORD *)v115 = v116;
                  goto LABEL_48;
                }
                *(_BYTE *)(v115 + 24) = 1;
                v112 = v116;
                v116[24] = v116 == v113;
                *v118 = 1;
              }
              while (v116 != v113);
            }
            ++v539;
          }

          ++v88;
        }
        *(_QWORD *)&v521 = 0;
        *((_QWORD *)&v521 + 1) = &v521;
        *(_QWORD *)&__p = 0x4812000000;
        *((_QWORD *)&__p + 1) = sub_1BE7C0AB0;
        v523 = sub_1BE7C0AD4;
        v524 = &unk_1BE94989A;
        v526 = 0;
        v527 = 0;
        v525 = 0;
        v127 = (_QWORD *)*v497;
        if (*v497)
        {
          v128 = v537;
          if (v537 == (char *)&v538)
          {
            do
            {
              v129 = v127;
              v127 = (_QWORD *)*v127;
            }
            while (v127);
          }
          else
          {
            v129 = v497;
            do
            {
LABEL_63:
              v130 = (_QWORD *)v127[4];
              v131 = v537;
              do
              {
                if (v130 != v127 + 5)
                {
                  v132 = v130[4];
                  v133 = *((_QWORD *)v131 + 4);
                  if (v132 >= v133)
                    goto LABEL_67;
                }
                v127 = (_QWORD *)v127[1];
                if (!v127)
                  goto LABEL_80;
                goto LABEL_63;
LABEL_67:
                if (v133 < v132)
                  break;
                v134 = (_QWORD *)v130[1];
                v135 = v130;
                if (v134)
                {
                  do
                  {
                    v130 = v134;
                    v134 = (_QWORD *)*v134;
                  }
                  while (v134);
                }
                else
                {
                  do
                  {
                    v130 = (_QWORD *)v135[2];
                    v114 = *v130 == (_QWORD)v135;
                    v135 = v130;
                  }
                  while (!v114);
                }
                v136 = (void **)*((_QWORD *)v131 + 1);
                if (v136)
                {
                  do
                  {
                    v137 = v136;
                    v136 = (void **)*v136;
                  }
                  while (v136);
                }
                else
                {
                  do
                  {
                    v137 = (void **)*((_QWORD *)v131 + 2);
                    v114 = *v137 == v131;
                    v131 = (char *)v137;
                  }
                  while (!v114);
                }
                v131 = (char *)v137;
              }
              while (v137 != (void **)&v538);
              v129 = v127;
              v127 = (_QWORD *)*v127;
            }
            while (v127);
          }
LABEL_80:
          if (v129 != v497)
          {
            v138 = (_QWORD *)v129[4];
            if (v138 == v129 + 5)
            {
LABEL_82:
              if (&v525 == v129 + 7)
              {
                v139 = &v521;
                v140 = (void **)((char *)a5 + 8);
                v141 = *v502;
                v142 = (uint64_t **)((char *)a5 + 8);
                if (!*v502)
                  goto LABEL_316;
              }
              else
              {
                sub_1BE6C8C20(&v525, v129[7], v129[8], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v129[8] - v129[7]) >> 3));
                v139 = (__int128 *)*((_QWORD *)&v521 + 1);
                v140 = (void **)((char *)a5 + 8);
                v141 = *v502;
                v142 = (uint64_t **)((char *)a5 + 8);
                if (!*v502)
                  goto LABEL_316;
              }
              if (v537 == (char *)&v538)
              {
                v189 = (char *)v141[4];
                v190 = (char *)(v141 + 5);
                if (v189 == (char *)(v141 + 5))
                {
                  v198 = (char *)v141;
                }
                else
                {
                  v142 = (uint64_t **)((char *)a5 + 8);
                  while (2)
                  {
                    v191 = v537;
                    while (v191 != (char *)&v538)
                    {
                      v192 = *((_QWORD *)v191 + 4);
                      v193 = *((_QWORD *)v189 + 4);
                      if (v192 < v193)
                        break;
                      if (v193 < v192)
                      {
                        v140 = v141;
                        goto LABEL_315;
                      }
                      v194 = (char *)*((_QWORD *)v191 + 1);
                      v195 = v191;
                      if (v194)
                      {
                        do
                        {
                          v191 = v194;
                          v194 = *(char **)v194;
                        }
                        while (v194);
                      }
                      else
                      {
                        do
                        {
                          v191 = (char *)*((_QWORD *)v195 + 2);
                          v114 = *(_QWORD *)v191 == (_QWORD)v195;
                          v195 = v191;
                        }
                        while (!v114);
                      }
                      v196 = (char *)*((_QWORD *)v189 + 1);
                      if (v196)
                      {
                        do
                        {
                          v197 = v196;
                          v196 = *(char **)v196;
                        }
                        while (v196);
                      }
                      else
                      {
                        do
                        {
                          v197 = (char *)*((_QWORD *)v189 + 2);
                          v114 = *(_QWORD *)v197 == (_QWORD)v189;
                          v189 = v197;
                        }
                        while (!v114);
                      }
                      v189 = v197;
                      if (v197 == v190)
                      {
                        v140 = v141;
                        v198 = (char *)v141;
                        if (v141)
                          goto LABEL_319;
                        goto LABEL_316;
                      }
                    }
                    v198 = (char *)*v141;
                    if (!*v141)
                    {
                      v142 = (uint64_t **)v141;
                      v140 = v141;
                      goto LABEL_316;
                    }
                    v189 = (char *)*((_QWORD *)v198 + 4);
                    v190 = v198 + 40;
                    v142 = (uint64_t **)v141;
                    v141 = (void **)*v141;
                    if (v189 != v198 + 40)
                      continue;
                    break;
                  }
                }
              }
              else
              {
                v142 = (uint64_t **)((char *)a5 + 8);
LABEL_271:
                while (1)
                {
                  v140 = v141;
                  v237 = v141[4];
                  v238 = v141 + 5;
                  v239 = v537;
                  v240 = v237;
                  if (v237 == v238)
                    break;
                  while (v239 != (char *)&v538)
                  {
                    v248 = *((_QWORD *)v239 + 4);
                    v249 = v240[4];
                    if (v248 < v249)
                      break;
                    if (v249 >= v248)
                    {
                      v250 = (char *)*((_QWORD *)v239 + 1);
                      v251 = v239;
                      if (v250)
                      {
                        do
                        {
                          v239 = v250;
                          v250 = *(char **)v250;
                        }
                        while (v250);
                      }
                      else
                      {
                        do
                        {
                          v239 = (char *)*((_QWORD *)v251 + 2);
                          v114 = *(_QWORD *)v239 == (_QWORD)v251;
                          v251 = v239;
                        }
                        while (!v114);
                      }
                      v252 = (_QWORD *)v240[1];
                      if (v252)
                      {
                        do
                        {
                          v253 = v252;
                          v252 = (_QWORD *)*v252;
                        }
                        while (v252);
                      }
                      else
                      {
                        do
                        {
                          v253 = (_QWORD *)v240[2];
                          v114 = *v253 == (_QWORD)v240;
                          v240 = v253;
                        }
                        while (!v114);
                      }
                      v240 = v253;
                      if (v253 != v238)
                        continue;
                    }
                    goto LABEL_272;
                  }
                  v141 = (void **)*v140;
                  v142 = (uint64_t **)v140;
                  if (!*v140)
                    goto LABEL_316;
                }
LABEL_272:
                v241 = v537;
                do
                {
                  if (v237 != v238)
                  {
                    v242 = v237[4];
                    v243 = *((_QWORD *)v241 + 4);
                    if (v242 >= v243)
                      goto LABEL_276;
                  }
                  v142 = (uint64_t **)(v140 + 1);
                  v141 = (void **)v140[1];
                  if (v141)
                    goto LABEL_271;
                  goto LABEL_316;
LABEL_276:
                  if (v243 < v242)
                    break;
                  v244 = (_QWORD *)v237[1];
                  v245 = v237;
                  if (v244)
                  {
                    do
                    {
                      v237 = v244;
                      v244 = (_QWORD *)*v244;
                    }
                    while (v244);
                  }
                  else
                  {
                    do
                    {
                      v237 = (_QWORD *)v245[2];
                      v114 = *v237 == (_QWORD)v245;
                      v245 = v237;
                    }
                    while (!v114);
                  }
                  v246 = (void **)*((_QWORD *)v241 + 1);
                  if (v246)
                  {
                    do
                    {
                      v247 = v246;
                      v246 = (void **)*v246;
                    }
                    while (v246);
                  }
                  else
                  {
                    do
                    {
                      v247 = (void **)*((_QWORD *)v241 + 2);
                      v114 = *v247 == v241;
                      v241 = (char *)v247;
                    }
                    while (!v114);
                  }
                  v241 = (char *)v247;
                }
                while (v247 != (void **)&v538);
LABEL_315:
                v198 = (char *)v140;
                if (v140)
                  goto LABEL_319;
LABEL_316:
                v198 = (char *)operator new(0x50uLL);
                v518[1] = (char *)a5 + 8;
                *((_QWORD *)v198 + 5) = 0;
                LOBYTE(v519[0]) = 0;
                *((_QWORD *)v198 + 4) = v198 + 40;
                *((_QWORD *)v198 + 6) = 0;
                sub_1BE66AAE8((_QWORD *)v198 + 4, v537, &v538);
                *((_QWORD *)v198 + 7) = 0;
                *((_QWORD *)v198 + 8) = 0;
                *((_QWORD *)v198 + 9) = 0;
                *(_QWORD *)v198 = 0;
                *((_QWORD *)v198 + 1) = 0;
                *((_QWORD *)v198 + 2) = v140;
                *v142 = (uint64_t *)v198;
                v255 = **(_QWORD **)a5;
                v256 = (uint64_t *)v198;
                if (v255)
                {
                  *(_QWORD *)a5 = v255;
                  v256 = *v142;
                }
                sub_1BE61F5C0(*((uint64_t **)a5 + 1), v256);
                ++*((_QWORD *)a5 + 2);
              }
LABEL_319:
              if (v198 + 56 != (char *)(v139 + 3))
                sub_1BE6C8C20((void **)v198 + 7, *((_QWORD *)v139 + 6), *((_QWORD *)v139 + 7), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)v139 + 7) - *((_QWORD *)v139 + 6)) >> 3));
              goto LABEL_113;
            }
            while (v128 != (char *)&v538)
            {
              v143 = *((_QWORD *)v128 + 4);
              v144 = v138[4];
              if (v143 < v144)
                break;
              if (v144 >= v143)
              {
                v145 = (char *)*((_QWORD *)v128 + 1);
                v146 = v128;
                if (v145)
                {
                  do
                  {
                    v128 = v145;
                    v145 = *(char **)v145;
                  }
                  while (v145);
                }
                else
                {
                  do
                  {
                    v128 = (char *)*((_QWORD *)v146 + 2);
                    v114 = *(_QWORD *)v128 == (_QWORD)v146;
                    v146 = v128;
                  }
                  while (!v114);
                }
                v147 = (_QWORD *)v138[1];
                if (v147)
                {
                  do
                  {
                    v148 = v147;
                    v147 = (_QWORD *)*v147;
                  }
                  while (v147);
                }
                else
                {
                  do
                  {
                    v148 = (_QWORD *)v138[2];
                    v114 = *v148 == (_QWORD)v138;
                    v138 = v148;
                  }
                  while (!v114);
                }
                v138 = v148;
                if (v148 != v129 + 5)
                  continue;
              }
              goto LABEL_82;
            }
          }
        }
        for (i = 0; i < objc_msgSend_count(v82, v89, v90, v91, v92, v93); ++i)
        {
          v150 = *((_QWORD *)&v521 + 1);
          *(_OWORD *)v518 = 0u;
          *(_OWORD *)v519 = 0u;
          v520 = 1065353216;
          v151 = *(_QWORD *)(*((_QWORD *)&v521 + 1) + 56);
          if (v151 >= *(_QWORD *)(*((_QWORD *)&v521 + 1) + 64))
          {
            v153 = sub_1BE7C14E0((void **)(*((_QWORD *)&v521 + 1) + 48), (uint64_t *)v518);
          }
          else
          {
            *(_QWORD *)v151 = 0;
            *(void **)(v151 + 8) = v518[1];
            v518[1] = 0;
            *(void **)(v151 + 16) = v519[0];
            v152 = v519[1];
            *(void **)(v151 + 24) = v519[1];
            *(_DWORD *)(v151 + 32) = v520;
            if (v152)
            {
              v519[0] = 0;
              v519[1] = 0;
            }
            v153 = (char *)(v151 + 40);
          }
          *(_QWORD *)(v150 + 56) = v153;
          v154 = v519[0];
          if (v519[0])
          {
            do
            {
              v155 = (_QWORD *)*v154;
              operator delete(v154);
              v154 = v155;
            }
            while (v155);
          }
          if (v518[0])
            operator delete(v518[0]);
        }
        v156 = qword_1EF568280;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BE7C0B70;
        block[3] = &unk_1E77F38F8;
        v514 = v82;
        v515 = self;
        v516 = &v521;
        v517 = v507;
        dispatch_sync(v156, block);

LABEL_113:
        v157 = *((_QWORD *)&v521 + 1);
        v158 = (void ***)((char *)a5 + 8);
        v159 = *v502;
        v160 = (void ***)((char *)a5 + 8);
        if (*v502)
        {
          if (v537 == (char *)&v538)
          {
            v161 = (void **)v159[4];
            v162 = v159 + 5;
            if (v161 == v159 + 5)
            {
              v188 = v159 + 7;
              if (v159 + 7 != (void **)(*((_QWORD *)&v521 + 1) + 48))
                goto LABEL_228;
              goto LABEL_229;
            }
            v160 = (void ***)((char *)a5 + 8);
            while (2)
            {
              v163 = v537;
              while (v163 != (char *)&v538)
              {
                v164 = *((_QWORD *)v163 + 4);
                v165 = (unint64_t)v161[4];
                if (v164 < v165)
                  break;
                if (v165 < v164)
                {
                  v158 = (void ***)v159;
                  goto LABEL_199;
                }
                v166 = (char *)*((_QWORD *)v163 + 1);
                v167 = v163;
                if (v166)
                {
                  do
                  {
                    v163 = v166;
                    v166 = *(char **)v166;
                  }
                  while (v166);
                }
                else
                {
                  do
                  {
                    v163 = (char *)*((_QWORD *)v167 + 2);
                    v114 = *(_QWORD *)v163 == (_QWORD)v167;
                    v167 = v163;
                  }
                  while (!v114);
                }
                v168 = (void **)v161[1];
                if (v168)
                {
                  do
                  {
                    v169 = v168;
                    v168 = (void **)*v168;
                  }
                  while (v168);
                }
                else
                {
                  do
                  {
                    v169 = (void **)v161[2];
                    v114 = *v169 == v161;
                    v161 = v169;
                  }
                  while (!v114);
                }
                v161 = v169;
                if (v169 == v162)
                {
                  v158 = (void ***)v159;
                  v170 = v159;
                  if (v159)
                    goto LABEL_200;
                  goto LABEL_203;
                }
              }
              v170 = *v159;
              if (!*v159)
              {
                v160 = (void ***)v159;
                v158 = (void ***)v159;
                goto LABEL_203;
              }
              v161 = (void **)v170[4];
              v162 = (void **)(v170 + 5);
              v160 = (void ***)v159;
              v159 = (void **)*v159;
              if (v161 != v170 + 5)
                continue;
              break;
            }
          }
          else
          {
            v160 = (void ***)((char *)a5 + 8);
LABEL_137:
            while (1)
            {
              v158 = (void ***)v159;
              v171 = v159[4];
              v172 = v159 + 5;
              v173 = v537;
              v174 = v171;
              if (v171 == v172)
                break;
              while (v173 != (char *)&v538)
              {
                v182 = *((_QWORD *)v173 + 4);
                v183 = v174[4];
                if (v182 < v183)
                  break;
                if (v183 >= v182)
                {
                  v184 = (char *)*((_QWORD *)v173 + 1);
                  v185 = v173;
                  if (v184)
                  {
                    do
                    {
                      v173 = v184;
                      v184 = *(char **)v184;
                    }
                    while (v184);
                  }
                  else
                  {
                    do
                    {
                      v173 = (char *)*((_QWORD *)v185 + 2);
                      v114 = *(_QWORD *)v173 == (_QWORD)v185;
                      v185 = v173;
                    }
                    while (!v114);
                  }
                  v186 = (_QWORD *)v174[1];
                  if (v186)
                  {
                    do
                    {
                      v187 = v186;
                      v186 = (_QWORD *)*v186;
                    }
                    while (v186);
                  }
                  else
                  {
                    do
                    {
                      v187 = (_QWORD *)v174[2];
                      v114 = *v187 == (_QWORD)v174;
                      v174 = v187;
                    }
                    while (!v114);
                  }
                  v174 = v187;
                  if (v187 != v172)
                    continue;
                }
                goto LABEL_138;
              }
              v159 = *v158;
              v160 = v158;
              if (!*v158)
                goto LABEL_203;
            }
LABEL_138:
            v175 = v537;
            do
            {
              if (v171 != v172)
              {
                v176 = v171[4];
                v177 = *((_QWORD *)v175 + 4);
                if (v176 >= v177)
                  goto LABEL_142;
              }
              v160 = v158 + 1;
              v159 = v158[1];
              if (v159)
                goto LABEL_137;
              goto LABEL_203;
LABEL_142:
              if (v177 < v176)
                break;
              v178 = (_QWORD *)v171[1];
              v179 = v171;
              if (v178)
              {
                do
                {
                  v171 = v178;
                  v178 = (_QWORD *)*v178;
                }
                while (v178);
              }
              else
              {
                do
                {
                  v171 = (_QWORD *)v179[2];
                  v114 = *v171 == (_QWORD)v179;
                  v179 = v171;
                }
                while (!v114);
              }
              v180 = (void **)*((_QWORD *)v175 + 1);
              if (v180)
              {
                do
                {
                  v181 = v180;
                  v180 = (void **)*v180;
                }
                while (v180);
              }
              else
              {
                do
                {
                  v181 = (void **)*((_QWORD *)v175 + 2);
                  v114 = *v181 == v175;
                  v175 = (char *)v181;
                }
                while (!v114);
              }
              v175 = (char *)v181;
            }
            while (v181 != (void **)&v538);
LABEL_199:
            v170 = v158;
            if (!v158)
              goto LABEL_203;
          }
LABEL_200:
          v188 = (void **)(v170 + 7);
          if (v170 + 7 != (_QWORD *)(*((_QWORD *)&v521 + 1) + 48))
            goto LABEL_228;
        }
        else
        {
LABEL_203:
          v199 = (void **)operator new(0x50uLL);
          v518[1] = (char *)a5 + 8;
          v199[5] = 0;
          LOBYTE(v519[0]) = 0;
          v199[4] = v199 + 5;
          v199[6] = 0;
          sub_1BE66AAE8(v199 + 4, v537, &v538);
          v199[7] = 0;
          v199[8] = 0;
          v199[9] = 0;
          *v199 = 0;
          v199[1] = 0;
          v199[2] = v158;
          *v160 = v199;
          v200 = **(_QWORD **)a5;
          v201 = v199;
          if (v200)
          {
            *(_QWORD *)a5 = v200;
            v201 = *v160;
          }
          v202 = *v502;
          v114 = v201 == *v502;
          *((_BYTE *)v201 + 24) = v114;
          if (!v114)
          {
            do
            {
              v203 = v201[2];
              if (*((_BYTE *)v203 + 24))
                break;
              v204 = (void **)*((_QWORD *)v203 + 2);
              v205 = (unsigned __int8 *)*v204;
              if (*v204 == v203)
              {
                v208 = (unsigned __int8 *)v204[1];
                if (!v208 || (v209 = v208[24], v206 = v208 + 24, v209))
                {
                  if (*(void ***)v203 == v201)
                  {
                    *((_BYTE *)v203 + 24) = 1;
                    *((_BYTE *)v204 + 24) = 0;
                    v212 = (_QWORD *)*((_QWORD *)v203 + 1);
                    *v204 = v212;
                    if (v212)
                      goto LABEL_220;
                  }
                  else
                  {
                    v210 = (uint64_t *)*((_QWORD *)v203 + 1);
                    v211 = *v210;
                    *((_QWORD *)v203 + 1) = *v210;
                    if (v211)
                    {
                      *(_QWORD *)(v211 + 16) = v203;
                      v204 = (void **)*((_QWORD *)v203 + 2);
                    }
                    v210[2] = (uint64_t)v204;
                    *(_QWORD *)(*((_QWORD *)v203 + 2) + 8 * (**((_QWORD **)v203 + 2) != (_QWORD)v203)) = v210;
                    *v210 = (uint64_t)v203;
                    *((_QWORD *)v203 + 2) = v210;
                    v204 = (void **)v210[2];
                    v203 = *v204;
                    *((_BYTE *)v210 + 24) = 1;
                    *((_BYTE *)v204 + 24) = 0;
                    v212 = (_QWORD *)*((_QWORD *)v203 + 1);
                    *v204 = v212;
                    if (v212)
LABEL_220:
                      v212[2] = v204;
                  }
                  *((_QWORD *)v203 + 2) = v204[2];
                  *((_QWORD *)v204[2] + (*(_QWORD *)v204[2] != (_QWORD)v204)) = v203;
                  *((_QWORD *)v203 + 1) = v204;
LABEL_226:
                  v204[2] = v203;
                  break;
                }
              }
              else if (!v205 || (v207 = v205[24], v206 = v205 + 24, v207))
              {
                if (*(void ***)v203 == v201)
                {
                  v254 = v201[1];
                  *(_QWORD *)v203 = v254;
                  if (v254)
                  {
                    v254[2] = v203;
                    v204 = (void **)*((_QWORD *)v203 + 2);
                  }
                  v201[2] = v204;
                  *(_QWORD *)(*((_QWORD *)v203 + 2) + 8 * (**((_QWORD **)v203 + 2) != (_QWORD)v203)) = v201;
                  v201[1] = v203;
                  *((_QWORD *)v203 + 2) = v201;
                  v204 = (void **)v201[2];
                  *((_BYTE *)v201 + 24) = 1;
                  *((_BYTE *)v204 + 24) = 0;
                  v203 = v204[1];
                  v213 = *(void ***)v203;
                  v204[1] = *(void **)v203;
                  if (v213)
LABEL_224:
                    v213[2] = v204;
                }
                else
                {
                  *((_BYTE *)v203 + 24) = 1;
                  *((_BYTE *)v204 + 24) = 0;
                  v203 = v204[1];
                  v213 = *(void ***)v203;
                  v204[1] = *(void **)v203;
                  if (v213)
                    goto LABEL_224;
                }
                *((_QWORD *)v203 + 2) = v204[2];
                *((_QWORD *)v204[2] + (*(_QWORD *)v204[2] != (_QWORD)v204)) = v203;
                *(_QWORD *)v203 = v204;
                goto LABEL_226;
              }
              *((_BYTE *)v203 + 24) = 1;
              v201 = v204;
              *((_BYTE *)v204 + 24) = v204 == v202;
              *v206 = 1;
            }
            while (v204 != v202);
          }
          ++*((_QWORD *)a5 + 2);
          v188 = v199 + 7;
          if (v199 + 7 != (void **)(v157 + 48))
LABEL_228:
            sub_1BE6C8C20(v188, *(_QWORD *)(v157 + 48), *(_QWORD *)(v157 + 56), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v157 + 56) - *(_QWORD *)(v157 + 48)) >> 3));
        }
LABEL_229:
        if (v507 >= 1)
        {
          for (j = 0; j != v507; ++j)
          {
            v215 = *(uint64_t **)(*(_QWORD *)(*((_QWORD *)&v521 + 1) + 48) + 40 * j + 16);
            if (!v215)
              continue;
            v216 = (char *)v534 + 40 * j + 40 * v61;
            do
            {
              while (1)
              {
                v217 = v215[2];
                v218 = v217 + v61;
                v219 = (int8x8_t)v216[1];
                if (v219)
                {
                  v220 = (uint8x8_t)vcnt_s8(v219);
                  v220.i16[0] = vaddlv_u8(v220);
                  if (v220.u32[0] > 1uLL)
                  {
                    v221 = v217 + v61;
                    if (v218 >= *(_QWORD *)&v219)
                      v221 = v218 % *(_QWORD *)&v219;
                  }
                  else
                  {
                    v221 = (*(_QWORD *)&v219 - 1) & v218;
                  }
                  v222 = *(_QWORD **)(*v216 + 8 * v221);
                  if (v222)
                  {
                    v223 = (_QWORD *)*v222;
                    if (v223)
                      break;
                  }
                }
LABEL_254:
                v227 = *((_DWORD *)v215 + 6);
                v518[0] = (void *)v218;
                *((_DWORD *)sub_1BE7C16F0((uint64_t)v216, v218, v518) + 6) = v227;
                v215 = (uint64_t *)*v215;
                if (!v215)
                  goto LABEL_231;
              }
              if (v220.u32[0] < 2uLL)
              {
                v224 = *(_QWORD *)&v219 - 1;
                while (1)
                {
                  v225 = v223[1];
                  if (v225 == v218)
                  {
                    if (v223[2] == v218)
                      goto LABEL_256;
                  }
                  else if ((v225 & v224) != v221)
                  {
                    goto LABEL_254;
                  }
                  v223 = (_QWORD *)*v223;
                  if (!v223)
                    goto LABEL_254;
                }
              }
              while (1)
              {
                v226 = v223[1];
                if (v226 == v218)
                  break;
                if (v226 >= *(_QWORD *)&v219)
                  v226 %= *(_QWORD *)&v219;
                if (v226 != v221)
                  goto LABEL_254;
LABEL_249:
                v223 = (_QWORD *)*v223;
                if (!v223)
                  goto LABEL_254;
              }
              if (v223[2] != v218)
                goto LABEL_249;
LABEL_256:
              v228 = *((float *)v215 + 6);
              v518[0] = (void *)v218;
              v229 = *((float *)sub_1BE7C16F0((uint64_t)v216, v218, v518) + 6);
              v510 = (void **)(v215[2] + v61);
              *((float *)sub_1BE7C16F0((uint64_t)v216, (unint64_t)v510, &v510) + 6) = (float)(v228 + v229) * 0.5;
              v215 = (uint64_t *)*v215;
            }
            while (v215);
LABEL_231:
            ;
          }
        }
        _Block_object_dispose(&v521, 8);
        v230 = v525;
        if (v525)
        {
          v231 = v526;
          v232 = v525;
          if (v526 != v525)
          {
            do
            {
              v233 = (_QWORD *)*(v231 - 3);
              if (v233)
              {
                do
                {
                  v234 = (_QWORD *)*v233;
                  operator delete(v233);
                  v233 = v234;
                }
                while (v234);
              }
              v236 = (void *)*(v231 - 5);
              v231 -= 5;
              v235 = v236;
              *v231 = 0;
              if (v236)
                operator delete(v235);
            }
            while (v231 != v230);
            v232 = v525;
          }
          v526 = v230;
          operator delete(v232);
        }
        sub_1BE62033C((uint64_t)&v537, v538);

        ++v499;
      }
      while (v499 != v491);
      v257 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v528, (uint64_t)v540, 16, v53);
      v491 = v257;
    }
    while (v257);
  }

  v510 = &v534;
  v511 = 1061158912;
  v512 = 1;
  v518[0] = 0;
  v518[1] = 0;
  v519[0] = 0;
  v263 = v535 - (_BYTE *)v534;
  if (v535 == v534)
  {
    v341 = 0;
    v264 = v17;
    goto LABEL_409;
  }
  v264 = v17;
  if (v263 < 0)
    sub_1BE61F930();
  v265 = v263 / 40;
  v266 = (unint64_t)(v263 / 40 - 1) >> 6;
  v267 = operator new(8 * (v266 + 1));
  v268 = v267;
  v518[1] = (void *)v265;
  v519[0] = (void *)(v266 + 1);
  v518[0] = v267;
  if (v265 >= 0x41)
    v269 = (v265 - 1) >> 6;
  else
    v269 = 0;
  v267[v269] = 0;
  if (v265 >= 0x40)
    bzero(v267, 8 * (v265 >> 6));
  if ((v265 & 0x3F) != 0)
    v268[v265 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v265 & 0x3F));
  v498 = v268;
  v508 = operator new(4 * v265);
  bzero(v508, 4 * v265);
  v270 = 0;
  v271 = 0;
  if (v265 <= 1)
    v272 = 1;
  else
    v272 = v265;
  v494 = v272;
  do
  {
    if ((v268[v270 >> 6] & (1 << v270)) == 0)
    {
      sub_1BE7C12A8(&v537, (uint64_t)&v510, v270);
      v273 = v537;
      v274 = v538;
      if (v512 > (v538 - v537) >> 3)
      {
        *((_DWORD *)v508 + v270) = -1;
        if (!v273)
          goto LABEL_341;
LABEL_340:
        v538 = v273;
        operator delete(v273);
        goto LABEL_341;
      }
      *((_DWORD *)v508 + v270) = v271;
      v268[v270 >> 6] |= 1 << v270;
      if (v274 != v273)
      {
        v275 = 0;
        v505 = v271;
        while (1)
        {
          v276 = *(_QWORD *)&v273[8 * v275];
          v277 = v268[v276 >> 6];
          if (((1 << v276) & v277) == 0)
            break;
LABEL_401:
          if (!*((_DWORD *)v508 + v276))
            *((_DWORD *)v508 + v276) = v271;
          ++v275;
          v273 = v537;
          if (v275 >= (v538 - v537) >> 3)
            goto LABEL_404;
        }
        v268[v276 >> 6] = (1 << v276) | v277;
        sub_1BE7C12A8((char **)&v521, (uint64_t)&v510, v276);
        v278 = (uint64_t *)v521;
        v279 = *((_QWORD *)&v521 + 1) - v521;
        v280 = (uint64_t)(*((_QWORD *)&v521 + 1) - v521) >> 3;
        if (v280 < v512)
          goto LABEL_399;
        if (v279 < 1)
          goto LABEL_398;
        v282 = v537;
        v281 = v538;
        v283 = v538 - v537;
        v284 = (v538 - v537) >> 3;
        v285 = &v537[(v538 - v537) & 0xFFFFFFFFFFFFFFF8];
        if (v280 > (v539 - v538) >> 3)
        {
          v286 = v284 + v280;
          if ((unint64_t)(v284 + v280) >> 61)
            sub_1BE61F930();
          v287 = v539 - v537;
          if ((v539 - v537) >> 2 > v286)
            v286 = v287 >> 2;
          v288 = (unint64_t)v287 >= 0x7FFFFFFFFFFFFFF8;
          v289 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v288)
            v289 = v286;
          v503 = v289;
          if (v289)
          {
            v500 = v538;
            if (v289 >> 61)
              sub_1BE61F100();
            v290 = v538 - v537;
            v291 = (v538 - v537) >> 3;
            v292 = &v537[(v538 - v537) & 0xFFFFFFFFFFFFFFF8];
            v293 = operator new(8 * v289);
            v285 = v292;
            v284 = v291;
            v268 = v498;
            v281 = v500;
            v283 = v290;
            v294 = &v293[8 * v284];
            v295 = &v294[8 * v280];
            v296 = v279 - 8;
            if ((unint64_t)(v279 - 8) < 0x38)
            {
LABEL_359:
              v297 = v294;
              goto LABEL_376;
            }
          }
          else
          {
            v293 = 0;
            v294 = (char *)(8 * v284);
            v295 = (char *)(8 * v284 + 8 * v280);
            v296 = v279 - 8;
            if ((unint64_t)(v279 - 8) < 0x38)
              goto LABEL_359;
          }
          v297 = v294;
          if ((unint64_t)(&v293[v283 & 0xFFFFFFFFFFFFFFF8] - (_BYTE *)v278) < 0x20)
            goto LABEL_493;
          v314 = (v296 >> 3) + 1;
          v315 = v314 & 0x3FFFFFFFFFFFFFFCLL;
          v297 = &v294[v315 * 8];
          v316 = &v278[v315];
          v317 = (__int128 *)(v278 + 2);
          v318 = &v293[8 * v284 + 16];
          v319 = v314 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v320 = *v317;
            *(v318 - 1) = *(v317 - 1);
            *v318 = v320;
            v317 += 2;
            v318 += 2;
            v319 -= 4;
          }
          while (v319);
          v278 = v316;
          if (v314 != (v314 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_493:
            do
            {
LABEL_376:
              v321 = *v278++;
              *(_QWORD *)v297 = v321;
              v297 += 8;
            }
            while (v297 != v295);
          }
          if (v282 != v281)
          {
            if ((unint64_t)(v283 - 8) < 0x68)
            {
              v322 = v285;
              goto LABEL_384;
            }
            v322 = v285;
            if ((unint64_t)(&v282[v283 & 0xFFFFFFFFFFFFFFF8] - &v293[v283 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
              goto LABEL_494;
            v323 = ((unint64_t)(v283 - 8) >> 3) + 1;
            v324 = 8 * (v323 & 0x3FFFFFFFFFFFFFFCLL);
            v322 = &v285[-v324];
            v294 -= v324;
            v325 = &v293[8 * v284 - 16];
            v326 = &v282[8 * v284 - 16];
            v327 = v323 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v328 = *(_OWORD *)v326;
              *(v325 - 1) = *((_OWORD *)v326 - 1);
              *v325 = v328;
              v325 -= 2;
              v326 -= 32;
              v327 -= 4;
            }
            while (v327);
            if (v323 != (v323 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_494:
              do
              {
LABEL_384:
                v329 = *((_QWORD *)v322 - 1);
                v322 -= 8;
                *((_QWORD *)v294 - 1) = v329;
                v294 -= 8;
              }
              while (v322 != v282);
            }
          }
          v330 = v281 - v285;
          if (v281 != v285)
          {
            v331 = v293;
            memmove(v295, v285, v281 - v285);
            v293 = v331;
          }
          v537 = v294;
          v538 = &v295[v330];
          v539 = &v293[8 * v503];
          if (v282)
            operator delete(v282);
LABEL_398:
          v278 = (uint64_t *)v521;
          v264 = v495;
          v271 = v505;
LABEL_399:
          if (v278)
          {
            *((_QWORD *)&v521 + 1) = v278;
            operator delete(v278);
          }
          goto LABEL_401;
        }
        v298 = v538 - v285;
        v299 = (v538 - v285) >> 3;
        if (v299 >= v280)
        {
          v300 = v521 + 8 * v280;
          v305 = v538;
        }
        else
        {
          v300 = v521 + 8 * v299;
          v301 = *((_QWORD *)&v521 + 1) - v300;
          if (*((_QWORD *)&v521 + 1) != v300)
          {
            v501 = v538;
            v504 = &v537[(v538 - v537) & 0xFFFFFFFFFFFFFFF8];
            v302 = *((_QWORD *)&v521 + 1) - v300;
            v303 = (v538 - v537) >> 3;
            v492 = (const void *)(v521 + 8 * v299);
            v304 = v538 - v537;
            memmove(v538, v492, v302);
            v283 = v304;
            v300 = (uint64_t)v492;
            v284 = v303;
            v268 = v498;
            v281 = v501;
            v285 = v504;
          }
          v305 = &v281[v301];
          v538 = &v281[v301];
          if (v298 < 1)
            goto LABEL_398;
        }
        v306 = &v285[8 * v280];
        v307 = v305 - v306;
        v308 = (v305 - v306) >> 3;
        v309 = &v305[-8 * v280];
        v310 = v305;
        if (v309 < v281)
        {
          v311 = (v283 & 0xFFFFFFFFFFFFFFF8) + v307;
          v312 = (unint64_t)&v282[v311 + 8];
          if ((unint64_t)v281 > v312)
            v312 = (unint64_t)v281;
          v313 = v312 + ~(unint64_t)v282 - v311;
          if (v313 < 0x58)
          {
            v310 = v305;
            goto LABEL_393;
          }
          v310 = v305;
          if ((unint64_t)(v306 - &v282[v283 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
            goto LABEL_495;
          v332 = (v313 >> 3) + 1;
          v333 = 8 * (v332 & 0x3FFFFFFFFFFFFFFCLL);
          v309 += v333;
          v310 = &v305[v333];
          v334 = v305 + 16;
          v335 = &v282[8 * v308 + 16 + 8 * v284];
          v336 = v332 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v337 = *(_OWORD *)v335;
            *(v334 - 1) = *((_OWORD *)v335 - 1);
            *v334 = v337;
            v334 += 2;
            v335 += 32;
            v336 -= 4;
          }
          while (v336);
          if (v332 != (v332 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_495:
            do
            {
LABEL_393:
              v338 = *(_QWORD *)v309;
              v309 += 8;
              *(_QWORD *)v310 = v338;
              v310 += 8;
            }
            while (v309 < v281);
          }
        }
        v538 = v310;
        if (v305 != v306)
        {
          v339 = v285;
          memmove(&v305[-8 * v308], v285, v307);
          v285 = v339;
        }
        if ((uint64_t *)v300 != v278)
          memmove(v285, v278, v300 - (_QWORD)v278);
        goto LABEL_398;
      }
      v273 = v274;
LABEL_404:
      ++v271;
      v272 = v494;
      if (v273)
        goto LABEL_340;
    }
LABEL_341:
    ++v270;
  }
  while (v270 != v272);
  operator delete(v268);
  v341 = v508;
LABEL_409:
  v342 = 0;
  *((_QWORD *)&v521 + 1) = 0;
  *(_QWORD *)&__p = 0;
  *(_QWORD *)&v521 = (char *)&v521 + 8;
  v509 = v341;
  while (2)
  {
    v345 = objc_msgSend_count(v264, v258, v259, v260, v261, v262);
LABEL_414:
    if (v345 > v342)
    {
      v346 = (_QWORD *)*((_QWORD *)&v521 + 1);
      if (!*((_QWORD *)&v521 + 1))
        goto LABEL_426;
      v347 = *((_DWORD *)v341 + v342);
      v348 = (__int128 *)((char *)&v521 + 8);
      v349 = (uint64_t *)*((_QWORD *)&v521 + 1);
      do
      {
        v350 = v349;
        v351 = v348;
        v352 = *((_DWORD *)v349 + 8);
        if (v352 >= v347)
          v348 = v349;
        else
          ++v349;
        v349 = (uint64_t *)*v349;
      }
      while (v349);
      if (v348 == (__int128 *)((char *)&v521 + 8)
        || (v352 >= v347 ? (v353 = v350) : (v353 = v351), v347 < *((_DWORD *)v353 + 8)))
      {
LABEL_426:
        v354 = operator new(4uLL);
        *v354 = v342;
        v355 = v354 + 1;
        v356 = *((_DWORD *)v341 + v342);
        v357 = (uint64_t **)&v521 + 1;
        v358 = (uint64_t **)&v521 + 1;
        if (v346)
        {
          while (1)
          {
            while (1)
            {
              v358 = (uint64_t **)v346;
              v359 = *((_DWORD *)v346 + 8);
              if (v356 >= v359)
                break;
              v346 = (_QWORD *)*v346;
              v357 = v358;
              if (!*v358)
                goto LABEL_433;
            }
            if (v359 >= v356)
              break;
            v346 = (_QWORD *)v346[1];
            if (!v346)
            {
              v357 = v358 + 1;
              goto LABEL_433;
            }
          }
          v344 = v346 + 5;
          v343 = (void *)v346[5];
          if (!v343)
            goto LABEL_412;
        }
        else
        {
LABEL_433:
          v346 = operator new(0x40uLL);
          *((_DWORD *)v346 + 8) = v356;
          v346[6] = 0;
          v346[7] = 0;
          v346[5] = 0;
          *v346 = 0;
          v346[1] = 0;
          v346[2] = v358;
          *v357 = v346;
          v360 = v346;
          if (*(_QWORD *)v521)
          {
            *(_QWORD *)&v521 = *(_QWORD *)v521;
            v360 = *v357;
          }
          sub_1BE61F5C0(*((uint64_t **)&v521 + 1), v360);
          *(_QWORD *)&__p = __p + 1;
          v344 = v346 + 5;
          v343 = (void *)v346[5];
          if (!v343)
            goto LABEL_412;
        }
        v346[6] = v343;
        operator delete(v343);
        *v344 = 0;
        v344[1] = 0;
        v344[2] = 0;
LABEL_412:
        v346[5] = v354;
        v346[6] = v355;
        v346[7] = v355;
        v341 = v509;
        ++v342;
        continue;
      }
      if (v352 >= v347)
        v361 = v350;
      else
        v361 = v351;
      v363 = (char *)v361[6];
      v362 = v361[7];
      if ((unint64_t)v363 < v362)
      {
        *(_DWORD *)v363 = v342;
        v361[6] = v363 + 4;
        ++v342;
        continue;
      }
      v364 = (char *)v361[5];
      v365 = (v363 - v364) >> 2;
      v366 = v365 + 1;
      if ((unint64_t)(v365 + 1) >> 62)
        sub_1BE61F930();
      v367 = v362 - (_QWORD)v364;
      if (v367 >> 1 > v366)
        v366 = v367 >> 1;
      if ((unint64_t)v367 >= 0x7FFFFFFFFFFFFFFCLL)
        v368 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v368 = v366;
      if (v368)
      {
        if (v368 >> 62)
          sub_1BE61F100();
        v369 = operator new(4 * v368);
        v370 = &v369[4 * v365];
        *v370 = v342;
        v371 = (uint64_t)(v370 + 1);
        v372 = v363 - v364;
        if (v363 != v364)
        {
LABEL_451:
          v373 = v372 - 4;
          if (v373 < 0x2C)
          {
            v341 = v509;
            goto LABEL_459;
          }
          v341 = v509;
          if ((unint64_t)(v364 - v369) < 0x20)
            goto LABEL_496;
          v374 = (v373 >> 2) + 1;
          v375 = 4 * (v374 & 0x7FFFFFFFFFFFFFF8);
          v376 = &v363[-v375];
          v370 = (_DWORD *)((char *)v370 - v375);
          v377 = &v369[4 * v365 - 16];
          v378 = v363 - 16;
          v379 = v374 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v380 = *(_OWORD *)v378;
            *(v377 - 1) = *((_OWORD *)v378 - 1);
            *v377 = v380;
            v377 -= 2;
            v378 -= 32;
            v379 -= 8;
          }
          while (v379);
          v363 = v376;
          if (v374 != (v374 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_496:
            do
            {
LABEL_459:
              v381 = *((_DWORD *)v363 - 1);
              v363 -= 4;
              *--v370 = v381;
            }
            while (v363 != v364);
          }
LABEL_460:
          v361[5] = v370;
          v361[6] = v371;
          v361[7] = &v369[4 * v368];
          if (v364)
            operator delete(v364);
          v264 = v495;
          v361[6] = v371;
          ++v342;
          v345 = objc_msgSend_count(v495, v258, v259, v260, v261, v262);
          goto LABEL_414;
        }
      }
      else
      {
        v369 = 0;
        v370 = (_DWORD *)(4 * v365);
        *(_DWORD *)(4 * v365) = v342;
        v371 = 4 * v365 + 4;
        v372 = v363 - v364;
        if (v363 != v364)
          goto LABEL_451;
      }
      v341 = v509;
      goto LABEL_460;
    }
    break;
  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v258, v259, v260, v261, v262);
  v506 = (id)objc_claimAutoreleasedReturnValue();
  v386 = (_OWORD *)v521;
  if ((__int128 *)v521 != (__int128 *)((char *)&v521 + 8))
  {
    do
    {
      objc_msgSend_objectAtIndex_(v264, v382, **((int **)v386 + 5), v383, v384, v385);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v390, v391, v392, v393, v394, v395);
      v396 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectAtIndex_(v495, v397, *(int *)(*((_QWORD *)v386 + 6) - 4), v398, v399, v400);
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v401, v402, v403, v404, v405, v406);
      v407 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectAtIndex_(v495, v408, **((int **)v386 + 5), v409, v410, v411);
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v412, v413, v414, v415, v416, v417);
      v419 = v418;
      v421 = v420;

      objc_msgSend_set(MEMORY[0x1E0C99E20], v422, v423, v424, v425, v426);
      v431 = (void *)objc_claimAutoreleasedReturnValue();
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v436 = (int *)*((_QWORD *)v386 + 5);
      for (k = (int *)*((_QWORD *)v386 + 6); v436 != k; ++v436)
      {
        v438 = *v436;
        objc_msgSend_objectAtIndex_(v495, v427, v438, v428, v429, v430);
        v439 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodedStrokeIdentifier(v439, v440, v441, v442, v443, v444);
        v445 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v431, v446, (uint64_t)v445, v447, v448, v449);

        objc_msgSend_objectAtIndex_(v495, v450, v438, v451, v452, v453);
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bounds(v454, v455, v456, v457, v458, v459);
        v544.origin.x = v460;
        v544.origin.y = v461;
        v544.size.width = v462;
        v544.size.height = v463;
        v542.origin.x = x;
        v542.origin.y = y;
        v542.size.width = width;
        v542.size.height = height;
        v543 = CGRectUnion(v542, v544);
        x = v543.origin.x;
        y = v543.origin.y;
        width = v543.size.width;
        height = v543.size.height;

      }
      v464 = [CHStrokeGroup alloc];
      v470 = objc_msgSend_contentType(self, v465, v466, v467, v468, v469);
      v471 = (objc_class *)objc_opt_class();
      NSStringFromClass(v471);
      v472 = (void *)objc_claimAutoreleasedReturnValue();
      StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v464, v473, (uint64_t)v431, (uint64_t)v396, (uint64_t)v407, v470, v472, x, y, width, height, 1.0, v419, v421);

      objc_msgSend_addObject_(v506, v475, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v476, v477, v478);
      v479 = (_QWORD *)*((_QWORD *)v386 + 1);
      if (v479)
      {
        do
        {
          v480 = v479;
          v479 = (_QWORD *)*v479;
        }
        while (v479);
      }
      else
      {
        do
        {
          v480 = (_OWORD *)*((_QWORD *)v386 + 2);
          v114 = *(_QWORD *)v480 == (_QWORD)v386;
          v386 = v480;
        }
        while (!v114);
      }
      v386 = v480;
      v264 = v495;
    }
    while (v480 != (__int128 *)((char *)&v521 + 8));
  }
  sub_1BE67AC7C((uint64_t)&v521, *((_QWORD **)&v521 + 1));
  if (v509)
    operator delete(v509);

  v387 = (char *)v534;
  v340 = v495;
  if (v534)
  {
    v388 = v535;
    v389 = v534;
    if (v535 != v534)
    {
      do
      {
        v481 = (_QWORD *)*((_QWORD *)v388 - 3);
        if (v481)
        {
          do
          {
            v482 = (_QWORD *)*v481;
            operator delete(v481);
            v481 = v482;
          }
          while (v482);
        }
        v484 = (void *)*((_QWORD *)v388 - 5);
        v388 -= 40;
        v483 = v484;
        *(_QWORD *)v388 = 0;
        if (v484)
          operator delete(v483);
      }
      while (v388 != v387);
      v389 = v534;
    }
    v535 = v387;
    operator delete(v389);
  }
LABEL_485:

  return v506;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (unint64_t)maxNumStrokes
{
  return self->_maxNumStrokes;
}

- (unint64_t)maxNumPointsPerStroke
{
  return self->_maxNumPointsPerStroke;
}

- (unint64_t)numOverlapStrokes
{
  return self->_numOverlapStrokes;
}

- (unint64_t)numBBoxFeaturesPerStroke
{
  return self->_numBBoxFeaturesPerStroke;
}

- (unint64_t)numSignalFeaturesPerPoint
{
  return self->_numSignalFeaturesPerPoint;
}

- (unint64_t)recognitionTileHeight
{
  return self->_recognitionTileHeight;
}

- (unint64_t)tileOverlapHeight
{
  return self->_tileOverlapHeight;
}

- (NSArray)supportedConfigurationsNumStrokes
{
  return self->_supportedConfigurationsNumStrokes;
}

- (float)interpolationDistance
{
  return self->_interpolationDistance;
}

- (float)coordinateNormalizationFactor
{
  return self->_coordinateNormalizationFactor;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedConfigurationsNumStrokes, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
