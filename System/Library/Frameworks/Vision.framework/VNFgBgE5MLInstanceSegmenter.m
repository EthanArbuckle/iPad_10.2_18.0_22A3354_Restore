@implementation VNFgBgE5MLInstanceSegmenter

- (id)_initWithConfiguration:(id)a3 e5mlProcess:(id)a4
{
  id v7;
  id v8;
  VNFgBgE5MLInstanceSegmenter *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNFgBgE5MLInstanceSegmenter;
  v9 = -[VNFgBgE5MLInstanceSegmenter init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)composeInstanceFeatures:(id)a3 miyoshiConfidence:(id)a4 cocoConfidence:(id)a5 predictionIoU:(id)a6 stabilityScore:(id)a7 decodeMatch:(id)a8 isRotated:(BOOL)a9 minimumMaskPixelCount:(unint64_t)a10
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  float v27;
  void *v28;
  int v29;
  float v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  float v44;
  float v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  VNFgBgE5MLInstanceFeature *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  VNFgBgE5MLInstanceFeature *v80;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _BOOL4 v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  char v96;
  void *context;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unsigned int v103;
  unsigned int v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v93 = a4;
  v94 = a5;
  v16 = a6;
  v85 = a7;
  v86 = a8;
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "thresholds");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v87, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");

  objc_msgSend(v87, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "intValue");

  v84 = objc_retainAutorelease(v16);
  v92 = objc_msgSend(v84, "dataPointer");
  v83 = objc_retainAutorelease(v85);
  v91 = objc_msgSend(v83, "dataPointer");
  v82 = objc_retainAutorelease(v86);
  v24 = objc_msgSend(v82, "dataPointer");
  v25 = 0;
  v96 = 0;
  v26 = -1;
  v27 = -3.4028e38;
  while (1)
  {
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "queryNumber");

    if (v25 >= v29)
      break;
    v30 = *(float *)(v24 + 4 * v25);
    if (v30 != 0.0)
    {
      v96 = 1;
      if (v30 > v27)
      {
        v26 = v25;
        v27 = *(float *)(v24 + 4 * v25);
      }
    }
    ++v25;
  }
  v31 = 0;
  v32 = (double)v23;
  v89 = v26;
  v33 = (double)v20;
  while (1)
  {
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v31 < (int)objc_msgSend(v34, "queryNumber");

    if (!v35)
      break;
    context = (void *)MEMORY[0x1A1B0B060]();
    v105 = 0;
    v104 = 0;
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "modelOutputInstanceInvalidMiyoshiCategory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "intValue");

    v103 = 0;
    v104 = v39;
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "modelOutputInstanceInvalidCocoCategory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "intValue");

    v103 = v43;
    -[VNFgBgE5MLInstanceSegmenter computeConfidenceInput:confidence:withQueryID:category:invalidCategory:](self, "computeConfidenceInput:confidence:withQueryID:category:invalidCategory:", v93, (char *)&v105 + 4, v31, &v104, v104);
    -[VNFgBgE5MLInstanceSegmenter computeConfidenceInput:confidence:withQueryID:category:invalidCategory:](self, "computeConfidenceInput:confidence:withQueryID:category:invalidCategory:", v94, &v105, v31, &v103, v103);
    v44 = *(float *)(v92 + 4 * v31);
    v45 = *(float *)(v91 + 4 * v31);
    v46 = (int)v104;
    if (_categoryMiyoshiNameForCategoryIndex(int)::onceToken != -1)
      dispatch_once(&_categoryMiyoshiNameForCategoryIndex(int)::onceToken, &__block_literal_global_2076);
    if (objc_msgSend((id)_categoryMiyoshiNameForCategoryIndex(int)::categoryNames, "count") <= v46)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend((id)_categoryMiyoshiNameForCategoryIndex(int)::categoryNames, "objectAtIndex:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v48 = (int)v103;
    if (_categoryCocoNameForCategoryIndex(int)::onceToken != -1)
      dispatch_once(&_categoryCocoNameForCategoryIndex(int)::onceToken, &__block_literal_global_60);
    if (objc_msgSend((id)_categoryCocoNameForCategoryIndex(int)::categoryNames, "count") <= v48)
    {
      v49 = 0;
    }
    else
    {
      objc_msgSend((id)_categoryCocoNameForCategoryIndex(int)::categoryNames, "objectAtIndex:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "modelOutputInstanceInvalidMiyoshiCategory");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v104);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v51, "containsObject:", v52) & 1) != 0)
    {

      if ((v96 & (v31 == v89)) == 0)
        goto LABEL_43;
LABEL_29:
      objc_msgSend(v90, "stabilityScoreThreshold");
      if (v45 <= v60)
        goto LABEL_43;
      goto LABEL_32;
    }
    -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "modelOutputInstanceInvalidCocoCategory");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v95, "containsObject:", v54) & 1) != 0
      || (objc_msgSend(v90, "IoUThreshold"), v44 <= v55)
      || (v56 = *((float *)&v105 + 1), objc_msgSend(v90, "cocoConfidenceThreshold"), v56 <= v57))
    {
      v88 = 0;
    }
    else
    {
      v58 = *(float *)&v105;
      objc_msgSend(v90, "cocoConfidenceThreshold");
      v88 = v58 > v59;
    }

    if ((v96 & 1) != 0)
    {
      if (v31 != v89)
        goto LABEL_43;
      goto LABEL_29;
    }
    if (!v88)
      goto LABEL_43;
LABEL_32:
    if (a10)
      -[VNFgBgE5MLInstanceSegmenter computeConnectedComponentSegmentation:minimumMaskPixelCount:withQueryID:](self, "computeConnectedComponentSegmentation:minimumMaskPixelCount:withQueryID:", v87, a10, v31);
    else
      -[VNFgBgE5MLInstanceSegmenter computeSegmentation:withQueryID:](self, "computeSegmentation:withQueryID:", v87, v31);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v62 = v61;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v100 != v64)
            objc_enumerationMutation(v62);
          v66 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
          -[VNFgBgE5MLInstanceSegmenter getDetection:mapSize:isRotated:](self, "getDetection:mapSize:isRotated:", v66, a9, v32, v33);
          v68 = v67;
          v70 = v69;
          v72 = v71;
          v74 = v73;
          v75 = [VNFgBgE5MLInstanceFeature alloc];
          LODWORD(v76) = HIDWORD(v105);
          LODWORD(v77) = v105;
          *(float *)&v78 = v44;
          *(float *)&v79 = v45;
          v80 = -[VNFgBgE5MLInstanceFeature initWithQueryID:miyoshiConfidence:cocoConfidence:IoU:stabilityScore:miyoshiCategory:cocoCategory:miyoshiCategoryName:cocoCategoryName:bbox:mapSize:segmentation:](v75, "initWithQueryID:miyoshiConfidence:cocoConfidence:IoU:stabilityScore:miyoshiCategory:cocoCategory:miyoshiCategoryName:cocoCategoryName:bbox:mapSize:segmentation:", v31, v104, v103, v47, v49, v66, v76, v77, v78, v79, v68, v70, v72, v74, *(_QWORD *)&v32, *(_QWORD *)&v33);
          objc_msgSend(v98, "addObject:", v80);

        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
      }
      while (v63);
    }

LABEL_43:
    objc_autoreleasePoolPop(context);
    ++v31;
  }

  return v98;
}

- (CGRect)getDetection:(id)a3 mapSize:(CGSize)a4 isRotated:(BOOL)a5
{
  double height;
  double width;
  id v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  __int128 *v14;
  id v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = (int)height;
  v13 = (int)width;
  v14 = (__int128 *)MEMORY[0x1E0C9D538];
  while (objc_msgSend(v8, "count") > v9)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!strcmp((const char *)objc_msgSend(v15, "objCType"), "{CGPoint=dd}"))
    {
      v36 = *v14;
      objc_msgSend(v15, "getValue:size:", &v36, 16);
      if (*((double *)&v36 + 1) < (double)v12)
        v12 = (int)*((double *)&v36 + 1);
      if (*((double *)&v36 + 1) > (double)v11)
        v11 = (int)*((double *)&v36 + 1);
      if (*(double *)&v36 < (double)v13)
        v13 = (int)*(double *)&v36;
      if (*(double *)&v36 > (double)v10)
        v10 = (int)*(double *)&v36;
    }

    ++v9;
  }
  v16 = (double)(v13 + v10) * 0.5 / width;
  v17 = (double)(v12 + v11) * 0.5 / height;
  v18 = (double)(v11 - v12 + 1) / height;
  v19 = (double)(v10 - v13 + 1) / width;
  v20 = v18;
  v21 = (float)(1.0 - v17) + v20 * -0.5;
  v22 = v19;
  v23 = v16 + v22 * -0.5;
  v24 = v17 + v20 * -0.5;
  if (a5)
    v25 = v21;
  else
    v25 = v16 + v22 * -0.5;
  if (a5)
  {
    v24 = v23;
    v26 = v20;
  }
  else
  {
    v26 = v22;
  }
  if (a5)
    v27 = v22;
  else
    v27 = v20;
  v28 = v24;
  v29 = v28;
  v30 = v25;
  v31 = v30;

  v32 = v31;
  v33 = v29;
  v34 = v26;
  v35 = v27;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)computeConfidenceInput:(id)a3 confidence:(float *)a4 withQueryID:(int)a5 category:(int *)a6 invalidCategory:(int)a7
{
  id v11;
  uint64_t v12;
  int i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  float v20;
  id v21;

  v11 = a3;
  *a4 = 0.0;
  *a6 = a7;
  v21 = objc_retainAutorelease(v11);
  v12 = objc_msgSend(v21, "dataPointer");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v21, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");

    if (i >= v16)
      break;
    objc_msgSend(v21, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = i + objc_msgSend(v18, "intValue") * a5;

    v20 = *(float *)(v12 + 4 * v19);
    if (v20 > *a4)
    {
      *a4 = v20;
      *a6 = i;
    }
  }

}

- (id)computeSegmentation:(id)a3 withQueryID:(int)a4
{
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  void *v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27[2];

  v24 = a3;
  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thresholds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maskThreshold");
  v9 = v8;

  objc_msgSend(v24, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v24, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_retainAutorelease(v24);
  v25 = objc_msgSend(v22, "dataPointer");
  if (v12 >= 1)
  {
    v17 = 0;
    v26 = v12;
    v18 = v12 * v15 * a4;
    do
    {
      if (v15 >= 1)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(float *)(v25 + 4 * v18 + 4 * i) > v9)
          {
            v27[0] = (double)(int)i;
            v27[1] = (double)(int)v17;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v27, "{CGPoint=dd}");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v20);

          }
        }
      }
      ++v17;
      v18 += v15;
    }
    while (v17 != v26);
  }
  objc_msgSend(v23, "addObject:", v16);

  return v23;
}

- (vImage_Buffer)generateMaskFromInstanceFeatures:(SEL)a3 toCategory:(id)a4 drawBox:(int)a5 maskImageType:(BOOL)a6
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  __int128 *v21;
  uint64_t i;
  void *v23;
  unint64_t j;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  double v38;
  int v39;
  double v40;
  int v41;
  double v42;
  int v43;
  double v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  _BYTE *v50;
  vImage_Buffer *result;
  id v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  id obj;
  _BYTE *data;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v56 = a6;
  v72 = *MEMORY[0x1E0C80C00];
  v52 = a4;
  if (a7)
    *a7 = 1;
  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration", v52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputSize");
  v12 = v11;
  v14 = v13;

  v15 = (unint64_t)v12;
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  ImageProcessing_reallocVImageBuffer((uint64_t)retstr, (unint64_t)v12, (unint64_t)v14, 1);
  data = retstr->data;
  if ((unint64_t)v14)
  {
    v16 = (char *)retstr->data;
    v17 = (unint64_t)v14;
    do
    {
      if (v15)
        bzero(v16, (unint64_t)v12);
      v16 += v15;
      --v17;
    }
    while (v17);
  }
  v54 = (unint64_t)v14;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v53;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v18)
  {
    v19 = (double)v15;
    v20 = *(_QWORD *)v67;
    v21 = (__int128 *)MEMORY[0x1E0C9D538];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v67 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v23, "miyoshiCategory") == a5)
        {
          for (j = 0; ; ++j)
          {
            objc_msgSend(v23, "segmentation");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count") > j;

            if (!v26)
              break;
            objc_msgSend(v23, "segmentation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", j);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_retainAutorelease(v28);
            if (!strcmp((const char *)objc_msgSend(v29, "objCType"), "{CGPoint=dd}"))
            {
              v65 = *v21;
              objc_msgSend(v29, "getValue:size:", &v65, 16);
              if (*(double *)&v65 < v19 && *((double *)&v65 + 1) < (double)v54)
                data[(unint64_t)(*(double *)&v65 + *((double *)&v65 + 1) * v19)] = -1;
            }

          }
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v18);
  }

  if (v56)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v30 = obj;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v31)
    {
      v32 = (double)v15;
      v33 = (double)(v15 - 1);
      v34 = (double)v54;
      v57 = *(_QWORD *)v62;
      v35 = (double)(v54 - 1);
      do
      {
        v36 = 0;
        v55 = v31;
        do
        {
          if (*(_QWORD *)v62 != v57)
            objc_enumerationMutation(v30);
          v37 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v36);
          if (objc_msgSend(v37, "miyoshiCategory") == a5)
          {
            objc_msgSend(v37, "bbox");
            v39 = (int)fmax(fmin(v38 * v32, v33), 0.0);
            v41 = (int)fmax(fmin(v40 * v34, v35), 0.0);
            v43 = (int)fmax(fmin((v38 + v42) * v32, v33), 0.0);
            v45 = (int)fmax(fmin((v40 + v44) * v34, v35), 0.0);
            if (v39 < v43)
            {
              memset(&data[v41 * v15 + v39], 255, (~v39 + v43) + 1);
              v31 = v55;
              memset(&data[v45 * v15 + v39], 255, (~v39 + v43) + 1);
            }
            if (v41 < v45)
            {
              v46 = v45 - (uint64_t)v41;
              v47 = v15 * v41;
              v48 = &data[v47 + v39];
              v49 = v46;
              do
              {
                *v48 = -1;
                v48 += v15;
                --v49;
              }
              while (v49);
              v50 = &data[v47 + v43];
              do
              {
                *v50 = -1;
                v50 += v15;
                --v46;
              }
              while (v46);
            }
          }
          ++v36;
        }
        while (v36 != v31);
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v31);
    }

  }
  return result;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3
{
  unsigned __int8 *data;
  apple::vision::fgbg::ConnectedComponentResult *v7;
  apple::vision::fgbg *v8;
  vImagePixelCount width;
  vImagePixelCount height;
  uint64_t i;
  unsigned __int8 *v12;
  float *v13;
  vImagePixelCount j;
  float v16;
  ConnectedComponentResult *result;
  void *__p[3];

  apple::vision::fgbg::ConnectedComponentResult::ConnectedComponentResult((apple::vision::fgbg::ConnectedComponentResult *)retstr, a4->width, a4->height);
  data = (unsigned __int8 *)a4->data;
  std::vector<float>::vector(__p, a4->width * a4->height);
  v8 = (apple::vision::fgbg *)__p[0];
  height = a4->height;
  width = a4->width;
  if (height)
  {
    for (i = 0; i != height; ++i)
    {
      v12 = data;
      v13 = (float *)v8;
      for (j = width; j; --j)
      {
        if (*v12++)
          v16 = 1.0;
        else
          v16 = 0.0;
        *v13++ = v16;
      }
      v8 = (apple::vision::fgbg *)((char *)v8 + 4 * width);
      data += width;
    }
    v8 = (apple::vision::fgbg *)__p[0];
  }
  apple::vision::fgbg::connectComponentLabel(v8, (float *)width, height, (float64x2_t **)retstr, v7);
  result = (ConnectedComponentResult *)__p[0];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return result;
}

- (vImage_Buffer)generateMaskForLabel:(SEL)a3 fromConnectedComponents:(unint64_t)a4 error:(const void *)a5
{
  vImagePixelCount v9;
  vImagePixelCount v10;
  vImage_Buffer *result;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v9 = *((_QWORD *)a5 + 13);
  v10 = *((_QWORD *)a5 + 14);
  retstr->data = 0;
  retstr->height = v10;
  retstr->width = v9;
  retstr->rowBytes = v9;
  result = (vImage_Buffer *)malloc_type_calloc(v10 * v9, 1uLL, 0x100004077774924uLL);
  retstr->data = result;
  v12 = (uint64_t *)(*((_QWORD *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
  v13 = *v12;
  if (v12[1] != *v12)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      *((_BYTE *)&result->data
      + (int)(*(double *)(v13 + v14) + *(double *)(v13 + v14 + 8) * (double)*((unint64_t *)a5 + 13))) = -1;
      ++v15;
      v13 = *(_QWORD *)(*((_QWORD *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
      v14 += 16;
    }
    while (v15 < (*(_QWORD *)(*((_QWORD *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)) + 8) - v13) >> 4);
  }
  return result;
}

- (vImage_Buffer)generateMaskForInstanceFeatures:(SEL)a3 maskImageType:(id)a4
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  _BYTE *data;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  __int128 *v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  vImage_Buffer *result;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a4;
  if (a5)
    *a5 = 1;
  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputSize");
  v10 = v9;
  v12 = v11;

  v13 = (unint64_t)v10;
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  ImageProcessing_reallocVImageBuffer((uint64_t)retstr, (unint64_t)v10, (unint64_t)v12, 1);
  data = retstr->data;
  if ((unint64_t)v12)
  {
    v15 = (char *)retstr->data;
    v16 = (unint64_t)v12;
    do
    {
      if (v13)
        bzero(v15, (unint64_t)v10);
      v15 += v13;
      --v16;
    }
    while (v16);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v30;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v17)
  {
    v18 = (double)v13;
    v19 = (double)(unint64_t)v12;
    v32 = *(_QWORD *)v35;
    v20 = (__int128 *)MEMORY[0x1E0C9D538];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v22 = 0;
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        while (1)
        {
          objc_msgSend(v23, "segmentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count") > v22;

          if (!v25)
            break;
          objc_msgSend(v23, "segmentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_retainAutorelease(v27);
          if (!strcmp((const char *)objc_msgSend(v28, "objCType"), "{CGPoint=dd}"))
          {
            v33 = *v20;
            objc_msgSend(v28, "getValue:size:", &v33, 16);
            if (*(double *)&v33 < v18 && *((double *)&v33 + 1) < v19)
              data[(unint64_t)(*(double *)&v33 + *((double *)&v33 + 1) * v18)] = -1;
          }

          ++v22;
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v17);
  }

  return result;
}

- (id)computeConnectedComponentSegmentation:(id)a3 minimumMaskPixelCount:(unint64_t)a4 withQueryID:(int)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  _BYTE *v28;
  void *v29;
  void *v30;
  void *__p;
  void *v32;
  uint64_t v33;

  v5 = *(_QWORD *)&a5;
  v24 = a3;
  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thresholds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maskThreshold");
  v11 = v10;

  -[VNFgBgE5MLInstanceSegmenter configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thresholds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultValidMinimumMaskPixelCount");

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  LODWORD(v15) = v11;
  -[VNFgBgE5MLInstanceSegmenter generateInstanceConnectedComponentsFromMLMultiArray:maskThreshold:queryID:](self, "generateInstanceConnectedComponentsFromMLMultiArray:maskThreshold:queryID:", v24, v5, v15);
  v16 = 0;
  v23 = &v33;
  while (v16 < (v28 - (_BYTE *)v27) >> 3)
  {
    if (*((_QWORD *)v27 + v16) > a4)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*((_QWORD *)v27 + v16))
      {
        v18 = 0;
        v19 = 0;
        do
        {
          v25 = *(_OWORD *)(*(_QWORD *)(v33 + 24 * v16) + v18);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v25, "{CGPoint=dd}", v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);

          ++v19;
          v18 += 16;
        }
        while (*((_QWORD *)v27 + v16) > v19);
      }
      objc_msgSend(v14, "addObject:", v17, v23);

    }
    ++v16;
  }
  *(_QWORD *)&v25 = v23;
  std::vector<std::vector<CGPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  v21 = v26;
  v26 = 0;
  if (v21)
    MEMORY[0x1A1B0A880](v21, 0x1000C8000313F17);

  return v14;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMLMultiArray:(SEL)a3 maskThreshold:(id)a4 queryID:(float)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  apple::vision::fgbg::ConnectedComponentResult *v18;
  apple::vision::fgbg *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  float *v24;
  float *v25;
  uint64_t v26;
  float v27;
  float v28;
  ConnectedComponentResult *result;
  void *__p[3];

  v9 = a4;
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v9, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  apple::vision::fgbg::ConnectedComponentResult::ConnectedComponentResult((apple::vision::fgbg::ConnectedComponentResult *)retstr, v15, v12);
  v16 = objc_retainAutorelease(v9);
  v17 = objc_msgSend(v16, "dataPointer");
  std::vector<float>::vector(__p, v15 * v12);
  v19 = (apple::vision::fgbg *)__p[0];
  if (v12)
  {
    v20 = 0;
    if ((unint64_t)v15 <= 1)
      v21 = 1;
    else
      v21 = v15;
    v22 = 4 * v15;
    v23 = (float *)(v17 + 4 * v12 * a6 * v15);
    do
    {
      v24 = v23;
      v25 = (float *)v19;
      v26 = v21;
      if (v15)
      {
        do
        {
          v27 = *v24++;
          if (v27 <= a5)
            v28 = 0.0;
          else
            v28 = 1.0;
          *v25++ = v28;
          --v26;
        }
        while (v26);
      }
      ++v20;
      v19 = (apple::vision::fgbg *)((char *)v19 + v22);
      v23 = (float *)((char *)v23 + v22);
    }
    while (v20 != v12);
    v19 = (apple::vision::fgbg *)__p[0];
  }
  apple::vision::fgbg::connectComponentLabel(v19, (float *)v15, v12, (float64x2_t **)retstr, v18);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return result;
}

- (VNFgBgE5MLInstanceSegmenterConfiguration)configuration
{
  return self->_configuration;
}

- (VNFgBgE5MLProcess)process
{
  return self->_process;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)instanceSegmenterWithConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  VNFgBgE5MLProcess *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "revision");
  if (v6 == 1)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = -[VNFgBgE5MLProcess initWithConfiguration:]([VNFgBgE5MLProcess alloc], "initWithConfiguration:", v5);
    v9 = (void *)objc_msgSend([v7 alloc], "_initWithConfiguration:e5mlProcess:", v5, v8);
  }
  else
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v8 = (VNFgBgE5MLProcess *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Revision %lu is not supported"), v6);
    +[VNFgBgInstanceSegmenterError errorWithCode:description:](VNFgBgInstanceSegmenterError, "errorWithCode:description:", -4, v8);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v9;
}

+ (id)instanceSegmenterWithRevision:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[VNFgBgE5MLInstanceSegmenterConfiguration configurationForRevision:error:](VNFgBgE5MLInstanceSegmenterConfiguration, "configurationForRevision:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "instanceSegmenterWithConfiguration:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
