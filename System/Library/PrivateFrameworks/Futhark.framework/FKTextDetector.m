@implementation FKTextDetector

- (BOOL)disableMultithreading
{
  if (disableMultithreading_onceToken != -1)
    dispatch_once(&disableMultithreading_onceToken, &__block_literal_global);
  return disableMultithreading_disableMultithreading;
}

void *__39__FKTextDetector_disableMultithreading__block_invoke()
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("com.apple.Futhark.disable_multithreading"));
  if (result)
    result = (void *)objc_msgSend(result, "BOOLValue");
  disableMultithreading_disableMultithreading = (char)result;
  return result;
}

- (void)setMultiThreadingQueue:(id)a3
{
  OS_dispatch_queue *v5;

  if (-[FKTextDetector disableMultithreading](self, "disableMultithreading"))
    v5 = 0;
  else
    v5 = (OS_dispatch_queue *)a3;
  self->_multiThreadingQueue = v5;
}

- (NSString)recognitionLanguage
{
  NSArray *recognitionLanguages;

  recognitionLanguages = self->_recognitionLanguages;
  if (recognitionLanguages && -[NSArray count](recognitionLanguages, "count"))
    return (NSString *)-[NSArray objectAtIndexedSubscript:](self->_recognitionLanguages, "objectAtIndexedSubscript:", 0);
  else
    return 0;
}

- (void)setRecognitionLanguage:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4[0] = a3;
    -[FKTextDetector setRecognitionLanguages:](self, "setRecognitionLanguages:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
  }
  else
  {

    self->_recognitionLanguages = 0;
  }
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];

  self->_recognitionLanguages = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "length"))
            -[NSArray addObject:](v5, "addObject:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    if (-[NSArray count](v5, "count"))
      self->_recognitionLanguages = v5;
    else

  }
}

- (FKTextDetector)initWithDimensions:(CGSize)a3
{
  double height;
  double width;
  FKTextDetector *v5;
  FKTextDetector *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)FKTextDetector;
  v5 = -[FKTextDetector init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FKTextDetector resetOptions](v5, "resetOptions");
    v7 = 0;
    if ((int)width >= (int)height)
      v8 = (int)height;
    else
      v8 = (int)width;
    do
    {
      v9 = v7 + 1;
      if ((v7 + 1) > 7)
        break;
      v10 = v8 >> v7++;
    }
    while (v10 > 64);
    if (createOrResetSessions((uint64_t)v6->_sessions, (int)width, (int)height, v9))
    {

      return 0;
    }
  }
  return v6;
}

- (void)resetOptions
{
  NSObject *v3;

  -[FKTextDetector setThresholdingAlgorithm:](self, "setThresholdingAlgorithm:", 4);
  -[FKTextDetector setContrastLimit:](self, "setContrastLimit:", 48);
  -[FKTextDetector setBinarizerLimit:](self, "setBinarizerLimit:", 128);
  -[FKTextDetector setMinimumCharacterHeight:](self, "setMinimumCharacterHeight:", 10);
  -[FKTextDetector setDetectDiacritics:](self, "setDetectDiacritics:", 1);
  -[FKTextDetector setEnableBinarizerFiltering:](self, "setEnableBinarizerFiltering:", 0);
  -[FKTextDetector setReturnSubFeatures:](self, "setReturnSubFeatures:", 0);
  -[FKTextDetector setMergeSettings:](self, "setMergeSettings:", 0x800000000);
  -[FKTextDetector setMinimizeFalseDetections:](self, "setMinimizeFalseDetections:", 1);
  -[FKTextDetector setRecognitionLanguages:](self, "setRecognitionLanguages:", 0);
  if (-[FKTextDetector disableMultithreading](self, "disableMultithreading"))
  {
    -[FKTextDetector setMultiThreadingQueue:](self, "setMultiThreadingQueue:", 0);
  }
  else
  {
    v3 = dispatch_queue_create("com.apple.futhark.recognitionQueue", MEMORY[0x1E0C80D50]);
    -[FKTextDetector setMultiThreadingQueue:](self, "setMultiThreadingQueue:", v3);
    dispatch_release(v3);
  }
}

- (void)dealloc
{
  uint64_t i;
  void **v4;
  objc_super v5;

  for (i = 8; i != 72; i += 8)
  {
    v4 = *(void ***)((char *)&self->super.isa + i);
    if (v4)
    {
      FKSessionDestroy(v4);
      *(Class *)((char *)&self->super.isa + i) = 0;
    }
  }
  -[FKTextDetector setMultiThreadingQueue:](self, "setMultiThreadingQueue:", 0);
  FKSessionDestroyRecognizer(&self->_recognizer->var0);
  -[FKTextDetector setRecognitionLanguages:](self, "setRecognitionLanguages:", 0);
  v5.receiver = self;
  v5.super_class = (Class)FKTextDetector;
  -[FKTextDetector dealloc](&v5, sel_dealloc);
}

- (void)setMergeSettings:(id)a3
{
  unsigned int var1;
  unsigned int v4;

  var1 = a3.var1;
  v4 = a3.var0 & ~(a3.var0 >> 31);
  if (v4 >= 7)
    v4 = 7;
  self->_mergeSettings.minScale = v4;
  if ((int)v4 > a3.var1)
    var1 = v4;
  if (var1 >= 8)
    var1 = 8;
  self->_mergeSettings.maxScale = var1;
}

- (void)translatePropertiesToOptionsWithNumSessions:(int)a3
{
  int v5;
  uint64_t v6;
  FKSession **sessions;
  char v8;
  uint64_t v9;
  int v10;
  char v11;
  NSArray *v13;
  NSArray *v14;
  unint64_t v15;
  uint64_t v16;

  if (-[FKTextDetector recognitionLanguage](self, "recognitionLanguage"))
    v5 = !-[NSString isEqualToString:](-[FKTextDetector recognitionLanguage](self, "recognitionLanguage"), "isEqualToString:", &stru_1E97DB038);
  else
    LOBYTE(v5) = 0;
  if (a3 >= 1)
  {
    v6 = 0;
    sessions = self->_sessions;
    v8 = v5 ^ 1;
    v9 = a3;
    do
    {
      v10 = -[FKTextDetector minimumCharacterHeight](self, "minimumCharacterHeight");
      if (v6)
        v11 = v8;
      else
        v11 = 1;
      if ((v11 & 1) == 0 && v10 < 16 && sessions[(v6 - 1)]->var12.data != 0)
        v10 = 16;
      sessions[v6]->var0 = v10;
      sessions[v6]->var3 = -[FKTextDetector minimizeFalseDetections](self, "minimizeFalseDetections");
      sessions[v6]->var4 = -[FKTextDetector minimizeFalseDetections](self, "minimizeFalseDetections");
      sessions[v6]->var5 = -[FKTextDetector minimizeFalseDetections](self, "minimizeFalseDetections");
      sessions[v6]->var34 = -[FKTextDetector colorSplits](self, "colorSplits");
      v13 = -[FKTextDetector recognitionLanguages](self, "recognitionLanguages");
      if (v13)
      {
        v14 = v13;
        if (-[NSArray count](v13, "count"))
        {
          v15 = 0;
          do
          {
            v16 = (uint64_t)sessions[v6];
            if (v15)
              FKRecognizeAddLanguage(v16, (_BYTE *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v15), "UTF8String"));
            else
              FKRecognizeSetLanguage(v16, (char *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0), "UTF8String"));
            ++v15;
          }
          while (-[NSArray count](v14, "count") > v15);
        }
      }
      ++v6;
    }
    while (v6 != v9);
  }
}

- (id)createFeaturesForSessionScale:(int)a3 roi:(CGRect)a4 originalSize:(CGSize)a5 startID:(int64_t *)a6
{
  int64_t v6;
  FKSession *v7;
  CGPoint origin;
  int var31;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  int j;
  concomp *var22;
  int v18;
  CGSize size;
  CGPoint v21;
  uint64_t v22;
  int64_t v23;

  v6 = *a6;
  v22 = 0;
  v23 = v6;
  v7 = self->_sessions[a3];
  origin = self->_roi.origin;
  size = self->_size;
  v21 = origin;
  LODWORD(v22) = a3;
  if (!v7)
    return (id)MEMORY[0x1E0C9AA60];
  var31 = v7->var31;
  if (var31 != -1)
  {
    v12 = (void *)MEMORY[0x1E0C99DE8];
    goto LABEL_4;
  }
  if (!-[FKTextDetector createFeaturesForAllConcomps](self, "createFeaturesForAllConcomps", size, v21, v22))
    return (id)MEMORY[0x1E0C9AA60];
  var31 = v7->var31;
  v12 = (void *)MEMORY[0x1E0C99DE8];
  if (var31 != -1)
  {
LABEL_4:
    v13 = 0;
    do
    {
      var31 = *((_DWORD *)v7->var29 + 26 * var31);
      ++v13;
    }
    while (var31 != -1);
  }
  v14 = (void *)objc_msgSend(v12, "arrayWithCapacity:", size, v21, v22);
  for (i = v7->var31; (_DWORD)i != -1; i = *((unsigned int *)v7->var29 + 26 * (int)i))
    objc_msgSend(v14, "addObject:", +[FKTextFeature featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:", i, v7, &size, -[FKTextDetector returnSubFeatures](self, "returnSubFeatures"), -[FKTextDetector detectDiacritics](self, "detectDiacritics"), &v23));
  if (-[FKTextDetector createFeaturesForAllConcomps](self, "createFeaturesForAllConcomps"))
  {
    for (j = v7->var25; j != -1; j = *((_DWORD *)var22 + 25 * v18 + 1))
    {
      var22 = v7->var22;
      v18 = j;
      if ((*((_BYTE *)var22 + 100 * j + 94) & 1) == 0)
        objc_msgSend(v14, "addObject:", +[FKTextFeature featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:", j, v7, &size, 1, 0, &v23));
    }
  }
  *a6 = v23;
  return v14;
}

- (void)mergeFeature:(id)a3 withArray:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  unint64_t v11;
  int v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int NumSharedConcomps;
  uint64_t v36;
  uint64_t v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v4 = *(_QWORD *)(*((_QWORD *)a3 + 2) + 312);
  v5 = *((int *)a3 + 2);
  v6 = v4 + 104 * (int)v5;
  v8 = *(_DWORD *)(v6 + 60);
  v7 = (int *)(v6 + 60);
  if (v8 > 79)
    return;
  if (!objc_msgSend(a4, "count"))
    goto LABEL_35;
  v11 = 0;
  v12 = 0;
  v69 = v5;
  v70 = v4;
  v13 = (unsigned __int8 *)(v4 + 104 * (int)v5 + 92);
  v14 = -1;
  do
  {
    v15 = objc_msgSend(a4, "objectAtIndexedSubscript:", v11, v69, v70);
    v16 = *(_QWORD *)(*(_QWORD *)(v15 + 16) + 312);
    v17 = *(_DWORD *)(v15 + 8);
    v18 = objc_msgSend((id)v15, "type");
    if ((id)v15 != a3
      && !v18
      && *(_QWORD *)(v15 + 16) != *((_QWORD *)a3 + 2)
      && *v13 == *(unsigned __int8 *)(v16 + 104 * v17 + 92))
    {
      objc_msgSend(a3, "boundingBox");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend((id)v15, "boundingBox");
      v73.origin.x = v27;
      v73.origin.y = v28;
      v73.size.width = v29;
      v73.size.height = v30;
      v71.origin.x = v20;
      v71.origin.y = v22;
      v71.size.width = v24;
      v71.size.height = v26;
      if (CGRectIntersectsRect(v71, v73))
      {
        NumSharedConcomps = getNumSharedConcomps((uint64_t)a3, v15, v31, v32, v33, v34);
        if (NumSharedConcomps > v12)
        {
          v14 = v11;
          v12 = NumSharedConcomps;
        }
      }
    }
    ++v11;
  }
  while (objc_msgSend(a4, "count") > v11);
  if (v14 == -1)
  {
LABEL_35:
    objc_msgSend(a4, "addObject:", a3);
    return;
  }
  v36 = objc_msgSend(a4, "objectAtIndexedSubscript:", v14);
  v37 = *(_QWORD *)(*(_QWORD *)(v36 + 16) + 312);
  v38 = *(_DWORD *)(v36 + 8);
  objc_msgSend(a3, "boundingBox");
  v40 = v39;
  objc_msgSend((id)v36, "boundingBox");
  v42 = v40 - v41;
  objc_msgSend((id)v36, "boundingBox");
  v44 = v42 / v43;
  v45 = v42 / v43 <= 0.1 || *(_DWORD *)(v70 + 104 * (int)v69 + 44) - *(_DWORD *)(v37 + 104 * v38 + 44) <= 1;
  if (!v45 || v44 > -0.1 && *(int *)(v70 + 104 * (int)v69 + 52) >= 24 && *v7 >= 16)
  {
    v46 = objc_msgSend(a4, "count", v44);
    if (v46 >= 1)
    {
      v47 = v46 + 1;
      do
      {
        v48 = objc_msgSend(a4, "objectAtIndexedSubscript:", (v47 - 2));
        v49 = *(_QWORD *)(*(_QWORD *)(v48 + 16) + 312);
        v50 = *(_DWORD *)(v48 + 8);
        v51 = objc_msgSend((id)v48, "type");
        if ((id)v48 != a3
          && v51 == 0
          && *(_QWORD *)(v48 + 16) != *((_QWORD *)a3 + 2)
          && *v13 == *(unsigned __int8 *)(v49 + 104 * v50 + 92))
        {
          objc_msgSend(a3, "boundingBox");
          v54 = v53;
          v56 = v55;
          v58 = v57;
          v60 = v59;
          objc_msgSend((id)v48, "boundingBox");
          v74.origin.x = v61;
          v74.origin.y = v62;
          v74.size.width = v63;
          v74.size.height = v64;
          v72.origin.x = v54;
          v72.origin.y = v56;
          v72.size.width = v58;
          v72.size.height = v60;
          if (CGRectIntersectsRect(v72, v74) && (int)getNumSharedConcomps(v48, (uint64_t)a3, v65, v66, v67, v68) >= 1)
            objc_msgSend(a4, "removeObjectAtIndex:", (v47 - 2));
        }
        --v47;
      }
      while (v47 > 1);
    }
    goto LABEL_35;
  }
}

- (id)createFeaturesForROI:(CGRect)a3 originalSize:(CGSize)a4 lastID:(int64_t *)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  void *v13;
  uint64_t v14;
  $2825F4736939C4A6D3AD43837233062D v15;
  int64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
  LODWORD(v14) = -[FKTextDetector mergeSettings](self, "mergeSettings");
  v15 = -[FKTextDetector mergeSettings](self, "mergeSettings");
  v16 = 0;
  if ((int)v14 < v15.var1)
  {
    v14 = (int)v14;
    do
    {
      if (!self->_sessions[v14])
        break;
      v17 = -[FKTextDetector createFeaturesForSessionScale:roi:originalSize:startID:](self, "createFeaturesForSessionScale:roi:originalSize:startID:", v14, &v28, x, y, v9, v8, width, height);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (!objc_msgSend(v22, "type"))
              -[FKTextDetector mergeFeature:withArray:](self, "mergeFeature:withArray:", v22, v13);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v19);
      }
      ++v14;
    }
    while (v14 < -[FKTextDetector mergeSettings](self, "mergeSettings") >> 32);
    v16 = v28;
  }
  *a5 = v16;
  return v13;
}

- (unsigned)isValidPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  signed int PixelFormatType;
  int v12;
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  size_t v17;
  size_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 result;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType <= 875704949)
    {
      if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
        goto LABEL_14;
      v12 = 875704934;
    }
    else
    {
      if (PixelFormatType <= 875836533)
      {
        if (PixelFormatType != 875704950)
        {
          v12 = 875836518;
          goto LABEL_13;
        }
LABEL_14:
        v17 = CVPixelBufferGetWidth(a3);
        v18 = CVPixelBufferGetHeight(a3);
        a4.origin.x = y + height;
        a4.origin.y = (double)v18;
        v19 = x + width <= (double)v17 && a4.origin.x <= a4.origin.y;
        if (v19 && x >= 0.0 && y >= 0.0 && width > 0.0 && height > 0.0)
          return 1;
        if (a5)
        {
          v13 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0CB2D50];
          v27 = CFSTR("Region of interest is outside of input pixel buffer");
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = &v27;
          v16 = &v26;
          goto LABEL_20;
        }
        return 0;
      }
      if (PixelFormatType == 875836534)
        goto LABEL_14;
      v12 = 1278226488;
    }
LABEL_13:
    if (PixelFormatType != v12)
    {
      if (a5)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2D50];
        v29 = CFSTR("Unsupported pixel format");
        v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v21 = v25;
        v22 = 2;
        goto LABEL_21;
      }
      return 0;
    }
    goto LABEL_14;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("pixelBuffer may not be NULL");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v31;
    v16 = &v30;
LABEL_20:
    v20 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v21 = v13;
    v22 = 1;
LABEL_21:
    v23 = (void *)objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("FKTextDetector"), v22, v20);
    result = 0;
    *a5 = v23;
    return result;
  }
  return 0;
}

- (void)runRecognizerOnFeatures:(id)a3 roi:(CGRect)a4 size:(CGSize)a5 lastID:(int64_t *)a6
{
  recognizer *Recognizer;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  float v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[FKTextDetector recognitionLanguage](self, "recognitionLanguage", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height))
  {
    if (self->_recognizer
      || (Recognizer = (recognizer *)FKSessionCreateRecognizer(), (self->_recognizer = Recognizer) != 0))
    {
      if (objc_msgSend(a3, "count"))
      {
        v9 = 0;
        v28 = a3;
        do
        {
          v10 = (_QWORD *)objc_msgSend(a3, "objectAtIndexedSubscript:", v9);
          v11 = v10[2];
          *(_QWORD *)(v11 + 344) = self->_recognizer;
          v12 = *((int *)v10 + 2);
          v13 = *(_QWORD *)(v11 + 312);
          if (FKRecognizeSequence(v11, v13 + 104 * (int)v12, v14))
          {
            v33[0] = self->_size;
            v34 = 0;
            v33[1] = self->_roi.origin;
            LODWORD(v34) = *((_DWORD *)v10 + 6);
            v10 = +[FKTextFeature featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromSequenceIndex:session:scaling:createConcompFeatures:createDiacriticFeatures:featureID:", v12, v11, v33, -[FKTextDetector returnSubFeatures](self, "returnSubFeatures"), -[FKTextDetector detectDiacritics](self, "detectDiacritics"), a6);
            objc_msgSend(v28, "setObject:atIndexedSubscript:", v10, v9);
          }
          objc_msgSend(v10, "setText:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(v13 + 104 * (int)v12 + 80)));
          FKSeqMatchGetConfidence((char *)v11, v13 + 104 * (int)v12);
          objc_msgSend(v10, "setConfidence:");
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = (void *)objc_msgSend(v10, "subFeatures");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                v21 = *(_QWORD *)(*(_QWORD *)(v20 + 16) + 280) + 100 * *(int *)(v20 + 8);
                objc_msgSend((id)v20, "setText:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21 + 40));
                *(float *)&v22 = FKCCMatchGetConfidence(v21);
                objc_msgSend((id)v20, "setConfidence:", v22);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
            }
            while (v17);
          }
          ++v9;
          a3 = v28;
        }
        while (objc_msgSend(v28, "count") > v9);
      }
      v23 = objc_msgSend(a3, "count");
      if (v23 - 1 >= 0)
      {
        v24 = v23;
        do
        {
          v25 = (_QWORD *)objc_msgSend(a3, "objectAtIndexedSubscript:", --v24);
          if (*(_DWORD *)(v25[2] + 20))
          {
            objc_msgSend(v25, "confidence");
            if (v26 <= 0.5)
              objc_msgSend(a3, "removeObjectAtIndex:", v24);
          }
        }
        while (v24 > 0);
      }
    }
  }
}

- (void)resetTimers
{
  *(_OWORD *)self->_timeRecognizer = 0u;
  *(_OWORD *)&self->_timeRecognizer[4] = 0u;
  *(_OWORD *)self->_timeSequences = 0u;
  *(_OWORD *)&self->_timeSequences[4] = 0u;
  *(_OWORD *)self->_timeConcomps = 0u;
  *(_OWORD *)&self->_timeConcomps[4] = 0u;
  *(_OWORD *)self->_timeBinarizer = 0u;
  *(_OWORD *)&self->_timeBinarizer[4] = 0u;
  *(_OWORD *)self->_timeDownscale = 0u;
  *(_OWORD *)&self->_timeDownscale[4] = 0u;
}

- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 withRegionOfInterest:(CGRect)a4 error:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  FKTextDetector *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v20;
  double v21;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t v24;
  FKSession *v25;
  uint64_t v26;
  FKSession *v27;
  vImagePixelCount var7;
  vImagePixelCount var8;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  FKSession *v36;
  FKSession *v37;
  __int128 v38;
  __int128 v39;
  vImage_Error v40;
  unint64_t v41;
  FKTextDetector *v42;
  size_t v43;
  vImagePixelCount v44;
  char *v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  int i;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  FKSession **v60;
  uint64_t v61;
  uint64_t v62;
  CVPixelBufferRef pixelBuffer;
  id *v64;
  unsigned int *timeDownscale;
  FKSession **sessions;
  char v67;
  uint64_t v68;
  _QWORD block[6];
  int v70;
  vImage_Buffer dest;
  vImage_Buffer src;
  int v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  _QWORD v87[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = self;
  v87[1] = *MEMORY[0x1E0C80C00];
  if (!-[FKTextDetector isValidPixelBuffer:regionOfInterest:error:](self, "isValidPixelBuffer:regionOfInterest:error:"))
    return 0;
  v12 = 0;
  if ((int)width >= (int)height)
    v13 = (int)height;
  else
    v13 = (int)width;
  do
  {
    v14 = v12 + 1;
    if ((v12 + 1) > 7)
      break;
    v15 = v13 >> v12++;
  }
  while (v15 > 64);
  v16 = createOrResetSessions((uint64_t)v11->_sessions, (int)width, (int)height, v14);
  if (v16)
  {
    if (a5)
    {
      v86 = *MEMORY[0x1E0CB2D50];
      v87[0] = CFSTR("Could not create sessions");
      v17 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FKTextDetector"), v16, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1));
LABEL_13:
      v18 = 0;
      *a5 = v17;
      return v18;
    }
    return 0;
  }
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      v84 = *MEMORY[0x1E0CB2D50];
      v85 = CFSTR("Could not lock pixelBuffer for reading");
      v17 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FKTextDetector"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
      goto LABEL_13;
    }
    return 0;
  }
  -[FKTextDetector translatePropertiesToOptionsWithNumSessions:](v11, "translatePropertiesToOptionsWithNumSessions:", v14);
  v20 = (double)CVPixelBufferGetWidth(a3);
  v21 = (double)CVPixelBufferGetHeight(a3);
  v11->_size.width = v20;
  v11->_size.height = v21;
  v11->_roi.origin.x = x;
  v11->_roi.origin.y = y;
  v11->_roi.size.width = width;
  v11->_roi.size.height = height;
  -[FKTextDetector resetTimers](v11, "resetTimers");
  pixelBuffer = a3;
  v64 = a5;
  if (CVPixelBufferIsPlanar(a3))
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  }
  else
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddress(a3);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
  }
  v24 = v14 - 1;
  v25 = v11->_sessions[0];
  v25->var11.width = (unint64_t)width;
  v25->var11.rowBytes = (int)BytesPerRowOfPlane;
  v25->var11.data = &BaseAddressOfPlane[BytesPerRowOfPlane * (int)y + (int)x];
  v25->var11.height = (unint64_t)height;
  if (v14 >= 2)
  {
    v26 = 0;
    do
    {
      v27 = v11->_sessions[v26 + 1];
      var7 = v27->var7;
      var8 = v27->var8;
      v27->var11.height = var8;
      v27->var11.width = var7;
      v27->var11.rowBytes = var7;
      v27->var11.data = malloc_type_malloc((int)var8 * (uint64_t)(int)var7, 0x7E431DB9uLL);
      ++v26;
    }
    while (v24 != v26);
  }
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v11->_timeDownscale[0] = 0;
  timeDownscale = v11->_timeDownscale;
  v30 = -[FKTextDetector thresholdingAlgorithm](v11, "thresholdingAlgorithm");
  sessions = v11->_sessions;
  v31 = 0;
  v62 = v30;
  if (-[FKTextDetector multiThreadingQueue](v11, "multiThreadingQueue"))
    v32 = v30 == 4;
  else
    v32 = 1;
  v33 = v32;
  v67 = v33;
  v73 = 0;
  v34 = 0x1EFEA7000uLL;
  do
  {
    while (1)
    {
      if (v31)
      {
        v35 = mach_absolute_time();
        v36 = sessions[(v31 - 1)];
        v37 = sessions[v31];
        v38 = *(_OWORD *)&v36->var11.width;
        *(_OWORD *)&src.data = *(_OWORD *)&v36->var11.data;
        *(_OWORD *)&src.width = v38;
        v39 = *(_OWORD *)&v37->var11.width;
        *(_OWORD *)&dest.data = *(_OWORD *)&v37->var11.data;
        *(_OWORD *)&dest.width = v39;
        v40 = vImageScale_Planar8(&src, &dest, 0, 0);
        v41 = v34;
        v42 = v11;
        if (!v40)
        {
          v43 = dest.rowBytes - dest.width;
          if (dest.rowBytes > dest.width)
          {
            if (dest.height)
            {
              v44 = 0;
              v45 = (char *)dest.data + dest.width;
              do
              {
                memset(v45, *(v45 - 1), v43);
                v45 += dest.rowBytes;
                ++v44;
              }
              while (dest.height > v44);
            }
          }
        }
        v46 = mach_absolute_time();
        v11 = v42;
        v34 = v41;
        v47 = *(_DWORD *)(v41 + 2972);
        if (!v47)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          v47 = *(_DWORD *)(v41 + 2972);
        }
        timeDownscale[v31] = (v46 - v35) * getTimeInMicro_sTimebaseInfo / (1000 * v47);
        if (v40)
        {
          if (!v64)
            goto LABEL_65;
          v82 = *MEMORY[0x1E0CB2D50];
          v83 = CFSTR("Downscaling failed");
          v52 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FKTextDetector"), 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1));
          goto LABEL_49;
        }
      }
      if ((v67 & 1) != 0)
        break;
      v48 = -[FKTextDetector multiThreadingQueue](v11, "multiThreadingQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__FKTextDetector_detectFeaturesInBuffer_withRegionOfInterest_error___block_invoke;
      block[3] = &unk_1E97DADB0;
      v70 = v31;
      block[4] = v11;
      block[5] = &v74;
      dispatch_async(v48, block);
      if (++v31 == v14)
      {
        dispatch_barrier_sync((dispatch_queue_t)-[FKTextDetector multiThreadingQueue](v11, "multiThreadingQueue"), &__block_literal_global_95);
        goto LABEL_43;
      }
    }
    ++v31;
  }
  while (v31 != v14);
  if (v62 == 4)
    v53 = &v73;
  else
    v53 = 0;
  for (i = v14; ; runDetectionOnSession((uint64_t)v11, i, v73, v53))
  {
    v55 = __OFSUB__(i--, 1);
    if (i < 0 != v55)
      break;
  }
LABEL_43:
  v49 = v75[3];
  if (!v49)
  {
    v68 = 0;
    v18 = -[FKTextDetector createFeaturesForROI:originalSize:lastID:](v11, "createFeaturesForROI:originalSize:lastID:", &v68, x, y, width, height, v20, v21);
    if (objc_msgSend(v18, "count"))
    {
LABEL_57:
      v56 = mach_absolute_time();
      -[FKTextDetector runRecognizerOnFeatures:roi:size:lastID:](v11, "runRecognizerOnFeatures:roi:size:lastID:", v18, &v68, x, y, width, height, v20, v21);
      v57 = mach_absolute_time();
      v58 = *(_DWORD *)(v34 + 2972);
      if (!v58)
      {
        mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
        v58 = *(_DWORD *)(v34 + 2972);
      }
      v11->_timeRecognizer[0] = (v57 - v56) * getTimeInMicro_sTimebaseInfo / (1000 * v58);
      sortSequencesInSensibleOrder(v18);
      goto LABEL_66;
    }
    v59 = *((_QWORD *)&v11->super.isa + v14);
    if (*(_QWORD *)(v59 + 200))
    {
      if (FKSequenceOneBox(v59))
        v18 = -[FKTextDetector createFeaturesForROI:originalSize:lastID:](v11, "createFeaturesForROI:originalSize:lastID:", &v68, x, y, width, height, v20, v21);
      goto LABEL_57;
    }
    if (!v64)
      goto LABEL_65;
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v78 = *MEMORY[0x1E0CB2D50];
    v79 = CFSTR("Detection failed due to unsupported input dimensions");
    v51 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v49 = 2;
LABEL_46:
    v52 = objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("FKTextDetector"), v49, v51, v62, pixelBuffer);
LABEL_49:
    v18 = 0;
    *v64 = (id)v52;
    goto LABEL_66;
  }
  if (v64)
  {
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v80 = *MEMORY[0x1E0CB2D50];
    v81 = CFSTR("Detection failed with");
    v51 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    goto LABEL_46;
  }
LABEL_65:
  v18 = 0;
LABEL_66:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (v14 >= 2)
  {
    v60 = &v11->_sessions[1];
    do
    {
      free((*v60)->var11.data);
      v61 = (uint64_t)*v60++;
      *(_QWORD *)(v61 + 168) = 0;
      --v24;
    }
    while (v24);
  }
  _Block_object_dispose(&v74, 8);
  return v18;
}

uint64_t __68__FKTextDetector_detectFeaturesInBuffer_withRegionOfInterest_error___block_invoke(uint64_t a1)
{
  return runDetectionOnSession(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), 0, 0);
}

- (id)detectFeaturesInBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  double Width;

  Width = (double)CVPixelBufferGetWidth(a3);
  return -[FKTextDetector detectFeaturesInBuffer:withRegionOfInterest:error:](self, "detectFeaturesInBuffer:withRegionOfInterest:error:", a3, a4, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(a3));
}

- (unint64_t)getMemoryUsageOfLastOperation
{
  uint64_t v3;
  unint64_t result;
  FKSession **sessions;
  unint64_t *p_total;
  unint64_t v7;

  v3 = 0;
  result = 0;
  sessions = self->_sessions;
  p_total = &self->_memoryUsage[0].total;
  do
  {
    if (!sessions[v3])
      break;
    v7 = *p_total;
    p_total += 6;
    result += v7;
    ++v3;
  }
  while (v3 != 8);
  return result;
}

- (BOOL)detectDiacritics
{
  return self->_detectDiacritics;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  self->_detectDiacritics = a3;
}

- (int)minimumCharacterHeight
{
  return self->_minimumCharacterHeight;
}

- (void)setMinimumCharacterHeight:(int)a3
{
  self->_minimumCharacterHeight = a3;
}

- (int64_t)thresholdingAlgorithm
{
  return self->_thresholdingAlgorithm;
}

- (void)setThresholdingAlgorithm:(int64_t)a3
{
  self->_thresholdingAlgorithm = a3;
}

- (int)binarizerLimit
{
  return self->_binarizerLimit;
}

- (void)setBinarizerLimit:(int)a3
{
  self->_binarizerLimit = a3;
}

- (BOOL)returnSubFeatures
{
  return self->_returnSubFeatures;
}

- (void)setReturnSubFeatures:(BOOL)a3
{
  self->_returnSubFeatures = a3;
}

- (BOOL)minimizeFalseDetections
{
  return self->_minimizeFalseDetections;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  self->_minimizeFalseDetections = a3;
}

- (OS_dispatch_queue)multiThreadingQueue
{
  return self->_multiThreadingQueue;
}

- (BOOL)createFeaturesForAllConcomps
{
  return self->_createFeaturesForAllConcomps;
}

- (void)setCreateFeaturesForAllConcomps:(BOOL)a3
{
  self->_createFeaturesForAllConcomps = a3;
}

- (BOOL)enableBinarizerFiltering
{
  return self->_enableBinarizerFiltering;
}

- (void)setEnableBinarizerFiltering:(BOOL)a3
{
  self->_enableBinarizerFiltering = a3;
}

- (BOOL)colorSplits
{
  return self->_colorSplits;
}

- (void)setColorSplits:(BOOL)a3
{
  self->_colorSplits = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)mergeSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_mergeSettings;
}

- (int)contrastLimit
{
  return self->_contrastLimit;
}

- (void)setContrastLimit:(int)a3
{
  self->_contrastLimit = a3;
}

@end
