@implementation CIBurstImageSetInternal

+ (id)defaultVersionString
{
  __CFString *v2;
  void *v3;
  void *v4;

  v2 = kCIBurstImageSet_VersionString_2[0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "persistentDomainForName:", CFSTR("com.apple.camera"));
  v4 = (void *)objc_msgSend(v3, "objectForKey:", kCIBurstUseVersion);
  if (v4 && (int)objc_msgSend(v4, "intValue") > 1)
    return kCIBurstImageSet_VersionString_2[0];
  return v2;
}

- (id)burstDocumentDirectory
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(CFSTR("/var/mobile/Library/Caches/com.apple.camera"), "stringByAppendingPathComponent:", CFSTR("burstSets")), "stringByAppendingPathComponent:", -[CIBurstImageSetInternal burstId](self, "burstId"));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v6);
  return v4;
}

- (CIBurstImageSetInternal)initWithOptions:(id)a3
{
  CIBurstImageSetInternal *v4;
  void *v5;
  NSString *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  const __CFURL *v19;
  const __CFURL *v20;
  CGImageSource *v21;
  CGImage *ImageAtIndex;
  CFDictionaryRef v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSString *v29;
  FILE *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  FILE *v34;
  size_t v36;
  objc_super v37;
  char __ptr[64];
  char out[40];
  unsigned __int8 uu[8];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)CIBurstImageSetInternal;
  v4 = -[CIBurstImageSetInternal init](&v37, sel_init);
  if (v4)
  {
    v4->dq = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->clusterArray = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v4->temporalOrder = 0;
    v4->burstLogFileHandle = 0;
    -[CIBurstImageSetInternal setVersionString:](v4, "setVersionString:", +[CIBurstImageSetInternal defaultVersionString](CIBurstImageSetInternal, "defaultVersionString"));
    if (a3)
    {
      v5 = (void *)objc_msgSend(a3, "objectForKey:", kCIBurstImageSetInit_Version[0]);
      if (v5)
      {
        if (objc_msgSend(v5, "isEqualToString:", kCIBurstImageSetVersion_Latest[0]))
          -[CIBurstImageSetInternal setVersionString:](v4, "setVersionString:", kCIBurstImageSet_VersionString_2[0]);
      }
    }
    v6 = -[CIBurstImageSetInternal versionString](v4, "versionString");
    if (-[NSString isEqualToString:](v6, "isEqualToString:", kCIBurstImageSet_VersionString_2[0]))
      v7 = 2;
    else
      v7 = 1;
    -[CIBurstImageSetInternal setVersion:](v4, "setVersion:", v7);
    v4->faceAnalysisContext = -[CIBurstImageFaceAnalysisContext initWithVersion:]([CIBurstImageFaceAnalysisContext alloc], "initWithVersion:", -[CIBurstImageSetInternal versionString](v4, "versionString"));
    v4->faceIDCounts = (NSCountedSet *)(id)objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", 0);
    v4->allImageIdentifiers = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v4->actionClassifier = -[CIBurstActionClassifier initWithVersion:]([CIBurstActionClassifier alloc], "initWithVersion:", -[CIBurstImageSetInternal version](v4, "version"));
    v8 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v4->bestImageIdentifiersArray = 0;
    v4->statsByImageIdentifier = v8;
    v4->clusterByImageIdentifier = 0;
    v4->burstLogFileName = 0;
    v4->burstLogFileHandle = 0;
    v4->maxNumPendingFrames = 4;
    v4->enableAnalysis = 1;
    v4->dummyAnalysisCount = 0;
    *(_WORD *)&v4->enableFaceCore = 1;
    v4->burstCoverSelection = 0;
    v4->curClusterIndexToProcess = 0;
    *(_WORD *)&v4->isAction = 0;
    *(_QWORD *)uu = 0;
    v41 = 0;
    memset(out, 0, 37);
    MEMORY[0x194026700](uu);
    uuid_unparse(uu, out);
    -[CIBurstImageSetInternal setBurstId:](v4, "setBurstId:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", out, 1));
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "persistentDomainForName:", CFSTR("com.apple.camera"));
    v10 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstMaxNumPendingFrames);
    if (v10)
      v4->maxNumPendingFrames = objc_msgSend(v10, "intValue");
    v11 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstDisableAnalysis);
    if (v11)
      v4->enableAnalysis = objc_msgSend(v11, "intValue") == 0;
    v12 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstForceFaceDetection);
    if (v12)
      -[CIBurstImageFaceAnalysisContext setForceFaceDetectionEnable:](v4->faceAnalysisContext, "setForceFaceDetectionEnable:", objc_msgSend(v12, "intValue") != 0);
    v13 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstDisableFaceCore);
    if (v13)
      v4->enableFaceCore = objc_msgSend(v13, "intValue") == 0;
    v14 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstDummyAnalysis);
    if (v14)
      v4->dummyAnalysisCount = objc_msgSend(v14, "intValue");
    v15 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstUseFixedImage);
    v16 = objc_msgSend(v9, "objectForKey:", kCIBurstFixedImageFilename);
    v4->overrideImage = 0;
    v4->overrideProps = 0;
    if (objc_msgSend(v15, "intValue"))
    {
      if (v16)
      {
        v17 = (const char *)objc_msgSend((id)objc_msgSend(CFSTR("/var/mobile/Library/Caches/com.apple.camera"), "stringByAppendingPathComponent:", v16), "UTF8String");
        v18 = strlen(v17);
        v19 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v17, v18, 0);
        if (v19)
        {
          v20 = v19;
          v21 = CGImageSourceCreateWithURL(v19, 0);
          CFRelease(v20);
          if (v21)
          {
            ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0, 0);
            v23 = CGImageSourceCopyPropertiesAtIndex(v21, 0, 0);
            CFRelease(v21);
            if (ImageAtIndex)
            {
              v4->overrideImage = -[CIBurstYUVImage initWithCGImage:maxDimension:]([CIBurstYUVImage alloc], "initWithCGImage:maxDimension:", ImageAtIndex, 852);
              if (v23)
                v4->overrideProps = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v23);
              CGImageRelease(ImageAtIndex);
            }
            if (v23)
              CFRelease(v23);
          }
        }
      }
    }
    v24 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstDumpYUV);
    if (v24 || (v24 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstDumpYUV2)) != 0)
      v4->enableDumpYUV = objc_msgSend(v24, "intValue") != 0;
    v25 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstLoggingDefaultsWrite);
    if (v25 && objc_msgSend(v25, "intValue")
      || (v26 = (void *)objc_msgSend(v9, "objectForKey:", kCIBurstLoggingDefaultsWrite2)) != 0
      && objc_msgSend(v26, "intValue"))
    {
      v36 = 64;
      v27 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v27, "setDateFormat:", CFSTR("dd-MM-yyyy'_'HH-mm-ss'_burstLog.txt'"));
      v28 = objc_msgSend(v27, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));

      v29 = (NSString *)(id)objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](v4, "burstDocumentDirectory"), "stringByAppendingPathComponent:", v28);
      v4->burstLogFileName = v29;
      v30 = fopen(-[NSString UTF8String](v29, "UTF8String"), "w");
      v4->burstLogFileHandle = v30;
      BurstLoggingSetFileHandle((uint64_t)v30);
      sysctlbyname("kern.osversion", __ptr, &v36, 0, 0);
      BurstLoggingMessage("BURST ANALYSIS VERSION = %s (%s)\n", -[NSString UTF8String](-[CIBurstImageSetInternal versionString](v4, "versionString"), "UTF8String"), __ptr);
    }
    v4->sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(v4->maxNumPendingFrames);
    if (v4->enableDumpYUV)
    {
      v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->dq_yuvdump = (OS_dispatch_queue *)dispatch_queue_create("com.apple.staccato_dump", v31);
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v33 = (void *)objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](v4, "burstDocumentDirectory"), "stringByAppendingPathComponent:", CFSTR("counter.bin"));
      if ((objc_msgSend(v32, "fileExistsAtPath:", v33) & 1) == 0)
      {
        *(_DWORD *)__ptr = 0;
        v34 = fopen((const char *)objc_msgSend(v33, "UTF8String"), "w");
        fwrite(__ptr, 4uLL, 1uLL, v34);
        fclose(v34);
      }
    }
    else
    {
      v4->dq_yuvdump = 0;
    }
    perfInit();
  }
  return v4;
}

- (void)dealloc
{
  unint64_t curClusterIndexToProcess;
  NSMutableArray *i;
  uint64_t v5;
  NSObject *dq;
  NSObject *dq_yuvdump;
  NSObject *sem;
  NSMutableArray *clusterArray;
  CIBurstImageFaceAnalysisContext *faceAnalysisContext;
  NSCountedSet *faceIDCounts;
  NSMutableArray *allImageIdentifiers;
  CIBurstActionClassifier *actionClassifier;
  NSMutableDictionary *statsByImageIdentifier;
  NSMutableDictionary *clusterByImageIdentifier;
  CIBurstYUVImage *overrideImage;
  NSDictionary *overrideProps;
  NSString *burstLogFileName;
  NSString *burstCoverSelection;
  FILE *burstLogFileHandle;
  NSString *burstId;
  NSMutableArray *bestImageIdentifiersArray;
  objc_super v23;

  curClusterIndexToProcess = self->curClusterIndexToProcess;
  for (i = self->clusterArray; -[NSMutableArray count](i, "count") > curClusterIndexToProcess; i = self->clusterArray)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", self->curClusterIndexToProcess), "releaseImage");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->sem);
    v5 = self->curClusterIndexToProcess;
    curClusterIndexToProcess = v5 + 1;
    self->curClusterIndexToProcess = v5 + 1;
  }
  dq = self->dq;
  if (dq)
  {
    dispatch_release(dq);
    self->dq = 0;
  }
  dq_yuvdump = self->dq_yuvdump;
  if (dq_yuvdump)
  {
    dispatch_release(dq_yuvdump);
    self->dq_yuvdump = 0;
  }
  sem = self->sem;
  if (sem)
  {
    dispatch_release(sem);
    self->sem = 0;
  }
  clusterArray = self->clusterArray;
  if (clusterArray)
  {

    self->clusterArray = 0;
  }
  faceAnalysisContext = self->faceAnalysisContext;
  if (faceAnalysisContext)
  {

    self->faceAnalysisContext = 0;
  }
  faceIDCounts = self->faceIDCounts;
  if (faceIDCounts)
  {

    self->faceIDCounts = 0;
  }
  allImageIdentifiers = self->allImageIdentifiers;
  if (allImageIdentifiers)
  {

    self->allImageIdentifiers = 0;
  }
  actionClassifier = self->actionClassifier;
  if (actionClassifier)
  {

    self->actionClassifier = 0;
  }
  statsByImageIdentifier = self->statsByImageIdentifier;
  if (statsByImageIdentifier)
  {

    self->statsByImageIdentifier = 0;
  }
  clusterByImageIdentifier = self->clusterByImageIdentifier;
  if (clusterByImageIdentifier)
  {

    self->clusterByImageIdentifier = 0;
  }
  overrideImage = self->overrideImage;
  if (overrideImage)
  {

    self->overrideImage = 0;
  }
  overrideProps = self->overrideProps;
  if (overrideProps)
  {

    self->overrideProps = 0;
  }
  burstLogFileName = self->burstLogFileName;
  if (burstLogFileName)
  {

    self->burstLogFileName = 0;
  }
  burstCoverSelection = self->burstCoverSelection;
  if (burstCoverSelection)
  {

    self->burstCoverSelection = 0;
  }
  burstLogFileHandle = self->burstLogFileHandle;
  if (burstLogFileHandle)
  {
    fclose(burstLogFileHandle);
    self->burstLogFileHandle = 0;
  }
  burstId = self->burstId;
  if (burstId)
  {

    self->burstId = 0;
  }
  bestImageIdentifiersArray = self->bestImageIdentifiersArray;
  if (bestImageIdentifiersArray)
  {

    self->bestImageIdentifiersArray = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)CIBurstImageSetInternal;
  -[CIBurstImageSetInternal dealloc](&v23, sel_dealloc);
}

- (float)computeActionSelectionThreshold
{
  NSMutableArray *clusterArray;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  BurstLoggingMessage("Computing action selection threshold", a2);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  clusterArray = self->clusterArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clusterArray, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(clusterArray);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v13 = (void *)objc_msgSend(v12, "burstImages");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if ((objc_msgSend(v18, "isGarbage") & 1) == 0)
              {
                objc_msgSend(v18, "registrationErrorIntegral");
                if (v19 > 0.0)
                {
                  v10 = v10 + v19;
                  v9 = v9 + (float)(v19 * v19);
                  v8 = v8 + 1.0;
                  if (v19 > v7)
                    v7 = v19;
                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v15);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clusterArray, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
    if (v8 != 0.0)
    {
      v20 = v10 / v8;
      v21 = sqrtf((float)(v9 / v8) - (float)(v20 * v20));
      v22 = (float)(v10 / v8) + (float)(v21 * 1.33);
      BurstLoggingMessage("Mean non-zero actions = %f, std dev = %f\n", v20, v21);
      goto LABEL_23;
    }
  }
  else
  {
    v7 = 0.0;
  }
  v22 = 0.0;
LABEL_23:
  v23 = 18000.0;
  if (v22 >= 18000.0)
    v23 = v22;
  if (v23 > 36000.0)
    v23 = 36000.0;
  if (v23 <= v7)
    v24 = v23;
  else
    v24 = v7 * 0.99;
  BurstLoggingMessage("ACTION SELECTION THRESHOLD = %f\n", v24);
  return v24;
}

- (void)processClusters:(BOOL)a3
{
  CIBurstImageSetInternal *v3;
  unint64_t curClusterIndexToProcess;
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  CGFloat v50;
  uint64_t v51;
  void *v52;
  CGFloat v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  CGFloat v58;
  uint64_t v59;
  void *v60;
  CGFloat v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  double v91;
  uint64_t v92;
  void *v93;
  double v94;
  double v95;
  uint64_t v96;
  void *v97;
  double v98;
  double v99;
  uint64_t v100;
  void *v101;
  double v102;
  double v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  double MidX;
  double v118;
  uint64_t v119;
  void *v120;
  double MidY;
  double v122;
  uint64_t v123;
  void *v124;
  double v125;
  double v126;
  uint64_t v127;
  void *v128;
  double v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  id v134;
  FILE *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __CFString *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  __CFString *v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *dq_yuvdump;
  void *v148;
  CFDictionaryRef DictionaryRepresentation;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  __CFString *v161;
  uint64_t v162;
  __CFString *v163;
  __CFString *v164;
  void *v165;
  _BOOL4 v166;
  CIBurstImageSetInternal *v167;
  void *v168;
  _QWORD block[6];
  unsigned int __ptr;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;

  v166 = a3;
  v3 = self;
  v186 = *MEMORY[0x1E0C80C00];
  curClusterIndexToProcess = self->curClusterIndexToProcess;
  if (-[NSMutableArray count](self->clusterArray, "count") <= curClusterIndexToProcess)
  {
LABEL_52:
    if (v166)
    {
      v159 = v3->curClusterIndexToProcess;
      if (-[NSMutableArray count](v3->clusterArray, "count") != v159)
        BurstLoggingMessage("Error!  Done adding, but there are still frames left!\n");
    }
  }
  else
  {
    v167 = v3;
    while (1)
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](v3->clusterArray, "objectAtIndex:", v3->curClusterIndexToProcess);
      v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "burstImages"), "objectAtIndex:", 0);
      v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "imageId"), "UTF8String");
      objc_msgSend(v6, "timestamp");
      BurstLoggingMessage("Examining image, id=%s, timestamp = %.6f, done=%d\n", v7, v8, v166);
      if (!v166)
      {
        objc_msgSend(v6, "timestamp");
        v10 = v9;
        -[CIBurstImageFaceAnalysisContext latestFaceTimestamp](v3->faceAnalysisContext, "latestFaceTimestamp");
        if (v10 > v11
          && -[NSMutableArray count](v3->clusterArray, "count") - v3->curClusterIndexToProcess < (unint64_t)(v3->maxNumPendingFrames - 1))
        {
          break;
        }
      }
      v12 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v12, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedAnalysis[0]);
      v13 = (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
      v14 = (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
      -[CIBurstImageFaceAnalysisContext addFacesToImageStat:imageSize:](v3->faceAnalysisContext, "addFacesToImageStat:imageSize:", v6, v13, v14);
      v15 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedFaceDetection[0]);
      v16 = (void *)objc_msgSend(v5, "imageProps");
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "timestamp");
      v18 = objc_msgSend(v17, "numberWithDouble:");
      objc_msgSend(v16, "setObject:forKey:", v18, kCIBurstImageProperty_ImageTimestamp[0]);
      v168 = v6;
      if (objc_msgSend(v6, "faceStatArray"))
      {
        v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"));
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v20 = (void *)objc_msgSend(v6, "faceStatArray");
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v179, v185, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v180;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v180 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
              v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
              v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v25, "faceId"));
              objc_msgSend(v26, "setObject:forKey:", v27, kCIBurstImageFaceProperty_ID[0]);
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "normalizedFaceRect");
              *(float *)&v29 = v29;
              v30 = objc_msgSend(v28, "numberWithFloat:", v29);
              objc_msgSend(v26, "setObject:forKey:", v30, kCIBurstImageFaceProperty_X[0]);
              v31 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "normalizedFaceRect");
              *(float *)&v33 = v32;
              v34 = objc_msgSend(v31, "numberWithFloat:", v33);
              objc_msgSend(v26, "setObject:forKey:", v34, kCIBurstImageFaceProperty_Y[0]);
              v35 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "normalizedFaceRect");
              *(float *)&v37 = v36;
              v38 = objc_msgSend(v35, "numberWithFloat:", v37);
              objc_msgSend(v26, "setObject:forKey:", v38, kCIBurstImageFaceProperty_W[0]);
              v39 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "normalizedFaceRect");
              *(float *)&v41 = v40;
              v42 = objc_msgSend(v39, "numberWithFloat:", v41);
              objc_msgSend(v26, "setObject:forKey:", v42, kCIBurstImageFaceProperty_H[0]);
              v43 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "timestamp");
              v44 = objc_msgSend(v43, "numberWithDouble:");
              objc_msgSend(v26, "setObject:forKey:", v44, kCIBurstImageFaceProperty_Timestamp[0]);
              if (objc_msgSend(v25, "hasRollAngle"))
              {
                v45 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "rollAngle");
                v46 = objc_msgSend(v45, "numberWithFloat:");
                objc_msgSend(v26, "setObject:forKey:", v46, kCIBurstImageFaceProperty_RollAngle[0]);
              }
              if (objc_msgSend(v25, "hasYawAngle"))
              {
                v47 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "yawAngle");
                v48 = objc_msgSend(v47, "numberWithFloat:");
                objc_msgSend(v26, "setObject:forKey:", v48, kCIBurstImageFaceProperty_YawAngle[0]);
              }
              if (objc_msgSend(v25, "hasLeftEye"))
              {
                v49 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "leftEyeRect");
                v50 = CGRectGetMidX(v187) / v13;
                *(float *)&v50 = v50;
                v51 = objc_msgSend(v49, "numberWithFloat:", v50);
                objc_msgSend(v26, "setObject:forKey:", v51, kCIBurstImageFaceProperty_LeftEyePosX[0]);
                v52 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "leftEyeRect");
                v53 = CGRectGetMidY(v188) / v14;
                *(float *)&v53 = v53;
                v54 = objc_msgSend(v52, "numberWithFloat:", v53);
                objc_msgSend(v26, "setObject:forKey:", v54, kCIBurstImageFaceProperty_LeftEyePosY[0]);
                v55 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "leftEyeBlinkScore");
                v56 = objc_msgSend(v55, "numberWithFloat:");
                objc_msgSend(v26, "setObject:forKey:", v56, kCIBurstImageFaceProperty_LeftEyeBlinkScore[0]);
              }
              if (objc_msgSend(v25, "hasRightEye"))
              {
                v57 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "rightEyeRect");
                v58 = CGRectGetMidX(v189) / v13;
                *(float *)&v58 = v58;
                v59 = objc_msgSend(v57, "numberWithFloat:", v58);
                objc_msgSend(v26, "setObject:forKey:", v59, kCIBurstImageFaceProperty_RightEyePosX[0]);
                v60 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "rightEyeRect");
                v61 = CGRectGetMidY(v190) / v14;
                *(float *)&v61 = v61;
                v62 = objc_msgSend(v60, "numberWithFloat:", v61);
                objc_msgSend(v26, "setObject:forKey:", v62, kCIBurstImageFaceProperty_RightEyePosY[0]);
                v63 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v25, "rightEyeBlinkScore");
                v64 = objc_msgSend(v63, "numberWithFloat:");
                objc_msgSend(v26, "setObject:forKey:", v64, kCIBurstImageFaceProperty_RightEyeBlinkScore[0]);
              }
              v65 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "smileScore");
              v66 = objc_msgSend(v65, "numberWithFloat:");
              objc_msgSend(v26, "setObject:forKey:", v66, kCIBurstImageFaceProperty_SmileScore[0]);
              objc_msgSend(v19, "addObject:", v26);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v179, v185, 16);
          }
          while (v22);
        }
        v67 = (void *)objc_msgSend(v5, "imageProps");
        objc_msgSend(v67, "setObject:forKey:", v19, kCIBurstImageProperty_ISPFacesArray[0]);
        v3 = v167;
        v6 = v168;
      }
      if (v3->enableFaceCore)
      {
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:](v3->faceAnalysisContext, "findFacesInImage:imageStat:", objc_msgSend(v5, "image"), v6);
      }
      else
      {
        -[CIBurstImageFaceAnalysisContext setTimeFaceDetectionDone:](v3->faceAnalysisContext, "setTimeFaceDetectionDone:", timeElapsedSinceInit());
        -[CIBurstImageFaceAnalysisContext setTimeBlinkDetectionDone:](v3->faceAnalysisContext, "setTimeBlinkDetectionDone:", timeElapsedSinceInit());
      }
      v68 = (void *)objc_msgSend(v5, "imageProps");
      v69 = (void *)MEMORY[0x1E0CB37E8];
      -[CIBurstImageFaceAnalysisContext timeFaceDetectionDone](v3->faceAnalysisContext, "timeFaceDetectionDone");
      v70 = objc_msgSend(v69, "numberWithDouble:");
      objc_msgSend(v68, "setObject:forKey:", v70, kCIBurstImageProperty_TimeDoneFaceDetection[0]);
      v71 = (void *)objc_msgSend(v5, "imageProps");
      v72 = (void *)MEMORY[0x1E0CB37E8];
      -[CIBurstImageFaceAnalysisContext timeBlinkDetectionDone](v3->faceAnalysisContext, "timeBlinkDetectionDone");
      v73 = objc_msgSend(v72, "numberWithDouble:");
      objc_msgSend(v71, "setObject:forKey:", v73, kCIBurstImageProperty_TimeDoneFaceBlinkDetection[0]);
      -[CIBurstImageFaceAnalysisContext calculateFaceFocusInImage:imageStat:](v3->faceAnalysisContext, "calculateFaceFocusInImage:imageStat:", objc_msgSend(v5, "image"), v6);
      v74 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v74, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneFaceFocusScore[0]);
      -[CIBurstImageFaceAnalysisContext adjustFaceIdsForImageStat:](v3->faceAnalysisContext, "adjustFaceIdsForImageStat:", v6);
      -[CIBurstImageFaceAnalysisContext dumpFaceInfoArray](v3->faceAnalysisContext, "dumpFaceInfoArray");
      v177 = 0u;
      v178 = 0u;
      v176 = 0u;
      v175 = 0u;
      v75 = (void *)objc_msgSend(v6, "faceStatArray");
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v175, v184, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v176;
        do
        {
          for (j = 0; j != v77; ++j)
          {
            if (*(_QWORD *)v176 != v78)
              objc_enumerationMutation(v75);
            -[NSCountedSet addObject:](v3->faceIDCounts, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v175 + 1) + 8 * j), "faceId")));
          }
          v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v175, v184, 16);
        }
        while (v77);
      }
      objc_msgSend(v6, "computeImageData:faceIDCounts:", objc_msgSend(v5, "image"), v3->faceIDCounts);
      v80 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v80, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneAnalysis[0]);
      if (v3->enableFaceCore && objc_msgSend(v6, "faceStatArray"))
      {
        v81 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"));
        v171 = 0u;
        v172 = 0u;
        v173 = 0u;
        v174 = 0u;
        v82 = (void *)objc_msgSend(v6, "faceStatArray");
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v171, v183, 16);
        if (v83)
        {
          v84 = v83;
          v85 = *(_QWORD *)v172;
          do
          {
            for (k = 0; k != v84; ++k)
            {
              if (*(_QWORD *)v172 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * k);
              v88 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
              v89 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "faceId"));
              objc_msgSend(v88, "setObject:forKey:", v89, kCIBurstImageFaceProperty_ID[0]);
              v90 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "normalizedFaceRect");
              *(float *)&v91 = v91;
              v92 = objc_msgSend(v90, "numberWithFloat:", v91);
              objc_msgSend(v88, "setObject:forKey:", v92, kCIBurstImageFaceProperty_X[0]);
              v93 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "normalizedFaceRect");
              *(float *)&v95 = v94;
              v96 = objc_msgSend(v93, "numberWithFloat:", v95);
              objc_msgSend(v88, "setObject:forKey:", v96, kCIBurstImageFaceProperty_Y[0]);
              v97 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "normalizedFaceRect");
              *(float *)&v99 = v98;
              v100 = objc_msgSend(v97, "numberWithFloat:", v99);
              objc_msgSend(v88, "setObject:forKey:", v100, kCIBurstImageFaceProperty_W[0]);
              v101 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "normalizedFaceRect");
              *(float *)&v103 = v102;
              v104 = objc_msgSend(v101, "numberWithFloat:", v103);
              objc_msgSend(v88, "setObject:forKey:", v104, kCIBurstImageFaceProperty_H[0]);
              v105 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "focusScore");
              v106 = objc_msgSend(v105, "numberWithFloat:");
              objc_msgSend(v88, "setObject:forKey:", v106, kCIBurstImageFaceProperty_FocusScore[0]);
              v107 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v87, "leftEyeOpen"));
              objc_msgSend(v88, "setObject:forKey:", v107, kCIBurstImageFaceProperty_LeftEyeOpen[0]);
              v108 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v87, "rightEyeOpen"));
              objc_msgSend(v88, "setObject:forKey:", v108, kCIBurstImageFaceProperty_RightEyeOpen[0]);
              v109 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v87, "smiling"));
              objc_msgSend(v88, "setObject:forKey:", v109, kCIBurstImageFaceProperty_Smiling[0]);
              v110 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "leftEyeBlinkScore");
              v111 = objc_msgSend(v110, "numberWithFloat:");
              objc_msgSend(v88, "setObject:forKey:", v111, kCIBurstImageFaceProperty_LeftEyeBlinkScore[0]);
              v112 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "rightEyeBlinkScore");
              v113 = objc_msgSend(v112, "numberWithFloat:");
              objc_msgSend(v88, "setObject:forKey:", v113, kCIBurstImageFaceProperty_RightEyeBlinkScore[0]);
              v114 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "smileScore");
              v115 = objc_msgSend(v114, "numberWithFloat:");
              objc_msgSend(v88, "setObject:forKey:", v115, kCIBurstImageFaceProperty_SmileScore[0]);
              v116 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "leftEyeRect");
              MidX = CGRectGetMidX(v191);
              v118 = MidX / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
              *(float *)&v118 = v118;
              v119 = objc_msgSend(v116, "numberWithFloat:", v118);
              objc_msgSend(v88, "setObject:forKey:", v119, kCIBurstImageFaceProperty_LeftEyePosX[0]);
              v120 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "leftEyeRect");
              MidY = CGRectGetMidY(v192);
              v122 = MidY / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
              *(float *)&v122 = v122;
              v123 = objc_msgSend(v120, "numberWithFloat:", v122);
              objc_msgSend(v88, "setObject:forKey:", v123, kCIBurstImageFaceProperty_LeftEyePosY[0]);
              v124 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "rightEyeRect");
              v125 = CGRectGetMidX(v193);
              v126 = v125 / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "width");
              *(float *)&v126 = v126;
              v127 = objc_msgSend(v124, "numberWithFloat:", v126);
              objc_msgSend(v88, "setObject:forKey:", v127, kCIBurstImageFaceProperty_RightEyePosX[0]);
              v128 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v87, "rightEyeRect");
              v129 = CGRectGetMidY(v194);
              v130 = v129 / (double)(int)objc_msgSend((id)objc_msgSend(v5, "image"), "height");
              *(float *)&v130 = v130;
              v131 = objc_msgSend(v128, "numberWithFloat:", v130);
              objc_msgSend(v88, "setObject:forKey:", v131, kCIBurstImageFaceProperty_RightEyePosY[0]);
              v132 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v87, "smallFace"));
              objc_msgSend(v88, "setObject:forKey:", v132, kCIBurstImageFaceProperty_SmallFace[0]);
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "FCRLeftEyeFeaturesOffset")), CFSTR("LeftEyeFeaturesOffset"));
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "FCRRightEyeFeaturesOffset")), CFSTR("RightEyeFeaturesOffset"));
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "FCRSmileFeaturesOffset")), CFSTR("SmileFeaturesOffset"));
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "FCRBlinkFeaturesSize")), CFSTR("BlinkFeaturesSize"));
              objc_msgSend(v88, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v87, "FCRSmileFeaturesSize")), CFSTR("SmileFeaturesSize"));
              objc_msgSend(v81, "addObject:", v88);
            }
            v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v171, v183, 16);
          }
          while (v84);
        }
        v133 = (void *)objc_msgSend(v5, "imageProps");
        objc_msgSend(v133, "setObject:forKey:", v81, kCIBurstImageProperty_FacesArray[0]);
        v3 = v167;
        v6 = v168;
      }
      if (v3->enableDumpYUV && v3->dq_yuvdump)
      {
        v134 = -[CIBurstImageSetInternal burstDocumentDirectory](v3, "burstDocumentDirectory");
        v135 = fopen((const char *)objc_msgSend((id)objc_msgSend(v134, "stringByAppendingPathComponent:", CFSTR("counter.bin")), "UTF8String"), "r+");
        __ptr = 0;
        fread(&__ptr, 4uLL, 1uLL, v135);
        ++__ptr;
        fseek(v135, 0, 0);
        fwrite(&__ptr, 4uLL, 1uLL, v135);
        fclose(v135);
        v136 = objc_msgSend(v134, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("burstimage_%06d.yuv"), __ptr));
        v137 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend((id)objc_msgSend(v5, "image"), "Ybuffer"), (int)(objc_msgSend((id)objc_msgSend(v5, "image"), "height")* objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow")));
        v138 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend((id)objc_msgSend(v5, "image"), "Cbuffer"), (int)(((int)objc_msgSend((id)objc_msgSend(v5, "image"), "height") >> 1)* objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow")));
        if (v137)
        {
          v139 = v138;
          if (v138)
          {
            v165 = (void *)MEMORY[0x1E0C99E08];
            v164 = kCIBurstImageYUVDataProperty_YData[0];
            v163 = kCIBurstImageYUVDataProperty_UVData[0];
            v162 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "width"));
            v140 = kCIBurstImageYUVDataProperty_Width[0];
            v141 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "height"));
            v142 = v136;
            v143 = v6;
            v144 = kCIBurstImageYUVDataProperty_Height[0];
            v145 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "bytesPerRow"));
            v161 = v144;
            v6 = v143;
            v136 = v142;
            v160 = v141;
            v3 = v167;
            v146 = objc_msgSend(v165, "dictionaryWithObjectsAndKeys:", v137, v164, v139, v163, v162, v140, v160, v161, v145, kCIBurstImageYUVDataProperty_BytesPerRow[0], 0);
            dq_yuvdump = v167->dq_yuvdump;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __43__CIBurstImageSetInternal_processClusters___block_invoke;
            block[3] = &unk_1E2EC2EE0;
            block[4] = v146;
            block[5] = v142;
            dispatch_async(dq_yuvdump, block);
          }
        }
        v148 = (void *)objc_msgSend(v5, "imageProps");
        objc_msgSend(v148, "setObject:forKey:", v136, kCIBurstImageProperty_ImageYUVData[0]);
      }
      objc_msgSend(v6, "facesRoiRect");
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v195);
      objc_msgSend((id)objc_msgSend(v5, "imageProps"), "setObject:forKey:", DictionaryRepresentation, CFSTR("Image_FaceRectROI"));
      CFRelease(DictionaryRepresentation);
      v150 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v150, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "width")), CFSTR("Image_Width"));
      v151 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v151, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "image"), "height")), CFSTR("Image_Height"));
      v152 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v152, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "AEAverage")), CFSTR("Image_AEAverage"));
      v153 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v153, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "AETarget")), CFSTR("Image_AETarget"));
      v154 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v154, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "AEStable")), CFSTR("Image_AEStable"));
      v155 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v155, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "AFStable")), CFSTR("Image_AFStable"));
      v156 = (void *)objc_msgSend(v5, "imageProps");
      objc_msgSend(v156, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "orientation")), CFSTR("Image_Orientation"));
      objc_msgSend((id)objc_msgSend(v5, "imageProps"), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v6, "aeMatrix"), 512), CFSTR("Image_AEMatrix"));
      objc_msgSend(v5, "releaseImage");
      dispatch_semaphore_signal((dispatch_semaphore_t)v3->sem);
      ++v3->curClusterIndexToProcess;
      if (objc_msgSend(v5, "completionBlock"))
      {
        v157 = objc_msgSend(v5, "completionBlock");
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 16))(v157, objc_msgSend(v6, "imageId"), 1);
      }
      v158 = v3->curClusterIndexToProcess;
      if (-[NSMutableArray count](v3->clusterArray, "count") <= v158)
        goto LABEL_52;
    }
    objc_msgSend(v6, "timestamp");
    -[CIBurstImageFaceAnalysisContext latestFaceTimestamp](v3->faceAnalysisContext, "latestFaceTimestamp");
    BurstLoggingMessage("Not processing frames, imageStat.timestamp = %.6f, latestFaceTimestamp = %.6f\n");
  }
}

uint64_t __43__CIBurstImageSetInternal_processClusters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
}

- (void)addYUVImage:(id)a3 properties:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7
{
  NSObject *dq;
  _QWORD v14[10];

  if (self->enableAnalysis)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->sem, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(a6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeQueued[0]);
    -[CIBurstImageSetInternal version](self, "version");
    dq = self->dq;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__CIBurstImageSetInternal_addYUVImage_properties_identifier_imageProps_completionBlock___block_invoke;
    v14[3] = &unk_1E2EC2F08;
    v14[4] = self;
    v14[5] = a6;
    v14[6] = a3;
    v14[7] = a5;
    v14[8] = a4;
    v14[9] = a7;
    dispatch_async(dq, v14);
  }
}

uint64_t __88__CIBurstImageSetInternal_addYUVImage_properties_identifier_imageProps_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  CIBurstThumbnailCluster *v13;
  CIBurstThumbnailCluster *v14;
  void *v15;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 52))
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeStartedAnalysis[0]);
    v2 = *(_QWORD *)(a1 + 32);
    if (*(int *)(v2 + 52) >= 1)
    {
      v3 = 0;
      do
      {
        if ((int)objc_msgSend(*(id *)(a1 + 48), "height") >= 2)
        {
          v4 = 0;
          do
          {
            if ((int)objc_msgSend(*(id *)(a1 + 48), "width") >= 2)
            {
              v5 = 0;
              do
              {
                objc_msgSend(*(id *)(a1 + 48), "Ybuffer");
                objc_msgSend(*(id *)(a1 + 48), "bytesPerRow");
                ++v5;
                v6 = objc_msgSend(*(id *)(a1 + 48), "width");
                if (v6 >= 0)
                  v7 = v6;
                else
                  v7 = v6 + 1;
              }
              while (v5 < v7 >> 1);
            }
            ++v4;
            v8 = objc_msgSend(*(id *)(a1 + 48), "height");
            if (v8 >= 0)
              v9 = v8;
            else
              v9 = v8 + 1;
          }
          while (v4 < v9 >> 1);
        }
        ++v3;
        v2 = *(_QWORD *)(a1 + 32);
      }
      while (v3 < *(_DWORD *)(v2 + 52));
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 24));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeDoneAnalysis[0]);
    result = *(_QWORD *)(a1 + 72);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 56), 1);
  }
  else
  {
    BurstLoggingMessage("Adding image: %s\n", (const char *)objc_msgSend(*(id *)(a1 + 56), "UTF8String"));
    v11 = *(void **)(a1 + 40);
    v12 = objc_msgSend(*(id *)(a1 + 32), "versionString");
    objc_msgSend(v11, "setObject:forKey:", v12, kCIBurstImageProperty_AlgorithmVersion[0]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "extractFacesFromMetadata:", *(_QWORD *)(a1 + 64));
    v13 = -[CIBurstThumbnailCluster initWithImageData:dict:identifier:imageProps:completionBlock:]([CIBurstThumbnailCluster alloc], "initWithImageData:dict:identifier:imageProps:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    if (v13)
    {
      v14 = v13;
      v15 = (void *)-[NSMutableArray objectAtIndex:](-[CIBurstThumbnailCluster burstImages](v13, "burstImages"), "objectAtIndex:", 0);
      objc_msgSend(v15, "setVersion:", objc_msgSend(*(id *)(a1 + 32), "version"));
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v15, "setTemporalOrder:");
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", kCIBurstImageProperty_TimeReceived[0]), "doubleValue");
      objc_msgSend(v15, "setTimeReceived:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v14);

    }
    return objc_msgSend(*(id *)(a1 + 32), "processClusters:", 0);
  }
  return result;
}

- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6
{
  void *v11;
  uint64_t v12;
  CIBurstYUVImage *overrideImage;
  NSDictionary *overrideProps;
  CIBurstYUVImage *v15;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a5);
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeReceived[0]);
  overrideImage = self->overrideImage;
  if (overrideImage && self->overrideProps)
  {
    v15 = overrideImage;
    overrideProps = self->overrideProps;
  }
  else
  {
    v15 = -[CIBurstYUVImage initWithIOSurface:maxDimension:]([CIBurstYUVImage alloc], "initWithIOSurface:maxDimension:", a3, 852);
    overrideProps = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a4);
  }
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeElapsedSinceInit()), kCIBurstImageProperty_TimeConverted[0]);
  -[NSMutableArray addObject:](self->allImageIdentifiers, "addObject:", v12);
  -[NSMutableDictionary setObject:forKey:](self->statsByImageIdentifier, "setObject:forKey:", v11, v12);
  -[CIBurstImageSetInternal addYUVImage:properties:identifier:imageProps:completionBlock:](self, "addYUVImage:properties:identifier:imageProps:completionBlock:", v15, overrideProps, v12, v11, a6);

}

- (int)computeEmotion:(id)a3
{
  float v4;
  int v5;
  int v6;
  int v7;

  if (-[CIBurstImageSetInternal version](self, "version") >= 2)
    objc_msgSend(a3, "setSmiling:", 1);
  objc_msgSend(a3, "normalizedFocusScore");
  if (v4 <= 0.825)
    return -1;
  v5 = objc_msgSend(a3, "smiling");
  v6 = objc_msgSend(a3, "leftEyeOpen");
  if (v5)
  {
    if (v6 && (objc_msgSend(a3, "rightEyeOpen") & 1) != 0)
    {
      return 10;
    }
    else
    {
      v7 = 8;
      if ((objc_msgSend(a3, "leftEyeOpen") & 1) == 0)
      {
        if (objc_msgSend(a3, "rightEyeOpen"))
          return 8;
        else
          return 2;
      }
    }
  }
  else if (v6 && (objc_msgSend(a3, "rightEyeOpen") & 1) != 0)
  {
    return 6;
  }
  else
  {
    v7 = 3;
    if ((objc_msgSend(a3, "leftEyeOpen") & 1) == 0)
    {
      if (objc_msgSend(a3, "rightEyeOpen"))
        return 3;
      else
        return 1;
    }
  }
  return v7;
}

- (void)performEmotionalRejectionOnCluster:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t m;
  float v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v33 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(a3);
        v8 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v8, "faceStatArray"), "count"))
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v9 = (void *)objc_msgSend(v8, "faceStatArray");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v13 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v45 != v13)
                  objc_enumerationMutation(v9);
                v12 += -[CIBurstImageSetInternal computeEmotion:](self, "computeEmotion:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            }
            while (v11);
          }
          else
          {
            v12 = 0;
          }
          BurstLoggingMessage("Image %d:%s has emotional score %d\n", objc_msgSend(v8, "temporalOrder"), (const char *)objc_msgSend((id)objc_msgSend(v8, "imageId"), "UTF8String"), v12);
          if (v12 > v6)
            v6 = v12;
        }
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v15)
  {
    v16 = v15;
    v34 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(a3);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
        if (objc_msgSend((id)objc_msgSend(v18, "faceStatArray"), "count")
          && (v38 = 0u,
              v39 = 0u,
              v36 = 0u,
              v37 = 0u,
              v19 = (void *)objc_msgSend(v18, "faceStatArray"),
              (v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v52, 16)) != 0))
        {
          v21 = v20;
          v22 = 0;
          v23 = *(_QWORD *)v37;
          do
          {
            for (m = 0; m != v21; ++m)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v19);
              v22 += -[CIBurstImageSetInternal computeEmotion:](self, "computeEmotion:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          }
          while (v21);
        }
        else
        {
          v22 = 0;
        }
        if (v22 != v6)
        {
          objc_msgSend(v18, "setEmotionallyRejected:", 1);
          BurstLoggingMessage("Image %d:%s has been emotionally rejected.\n", objc_msgSend(v18, "temporalOrder"), (const char *)objc_msgSend((id)objc_msgSend(v18, "imageId"), "UTF8String"));
          objc_msgSend(v18, "avgHorzDiffY");
          v26 = v25 + v25;
          objc_msgSend(v18, "blurExtent");
          *(float *)&v28 = v26 / (float)(v27 + 1.0);
          objc_msgSend(v18, "setImageScore:", v28);
          objc_msgSend(v18, "avgHorzDiffY");
          v30 = v29 + v29;
          objc_msgSend(v18, "blurExtent");
          *(float *)&v32 = v30 / (float)(v31 + 1.0);
          objc_msgSend(v18, "setActionScore:", v32);
        }
      }
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v16);
  }
}

- (float)computeCameraTravelDistance
{
  float v3;
  unint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  _BOOL4 v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  char v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  char v34;
  double v35;

  v3 = 0.0;
  if ((unint64_t)-[NSMutableArray count](self->clusterArray, "count") >= 7)
  {
    if (-[NSMutableArray count](self->clusterArray, "count"))
    {
      for (i = 0; -[NSMutableArray count](self->clusterArray, "count") > i; ++i)
      {
        v5 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", i), "burstImages"), "objectAtIndex:", 0);
        if (i)
          v6 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", (i - 1)), "burstImages"), "objectAtIndex:", 0);
        else
          v6 = 0;
        if (-[NSMutableArray count](self->clusterArray, "count") - 1 <= i)
        {
          v9 = 0;
          v8 = 0;
        }
        else
        {
          v7 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", i + 1), "burstImages"), "objectAtIndex:", 0);
          v8 = (void *)v7;
          v9 = v7 != 0;
          if (!i && v7)
          {
            v10 = 0.0;
            v11 = 0.0;
            if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v5, "tx");
              v11 = v12;
            }
            if ((objc_msgSend(v8, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v8, "tx");
              v10 = v13;
            }
            v14 = 0.0;
            v15 = 0.0;
            if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v5, "ty");
              v15 = v16;
            }
            if ((objc_msgSend(v8, "isGarbage") & 1) != 0)
              goto LABEL_48;
            v17 = v8;
            goto LABEL_47;
          }
        }
        if (i != -[NSMutableArray count](self->clusterArray, "count") - 1 || v6 == 0)
        {
          if (v6)
            v19 = v9;
          else
            v19 = 0;
          v20 = 0.0;
          v21 = 0.0;
          if (v19)
          {
            v22 = 0.0;
            if ((objc_msgSend(v6, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v6, "tx");
              v22 = v23;
            }
            if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v5, "tx");
              v21 = v24;
            }
            v25 = objc_msgSend(v8, "isGarbage");
            LODWORD(v26) = 0;
            if ((v25 & 1) == 0)
              objc_msgSend(v8, "tx", v26);
            if (v22 <= v21)
            {
              v20 = v22;
              if (v22 <= *(float *)&v26)
              {
                if (v21 <= *(float *)&v26)
                  v20 = v21;
                else
                  v20 = *(float *)&v26;
              }
            }
            else
            {
              v20 = v21;
              if (v21 <= *(float *)&v26)
              {
                if (v22 <= *(float *)&v26)
                  v20 = v22;
                else
                  v20 = *(float *)&v26;
              }
            }
            v31 = 0.0;
            v21 = 0.0;
            if ((objc_msgSend(v6, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v6, "ty");
              v21 = v32;
            }
            if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
            {
              objc_msgSend(v5, "ty");
              v31 = v33;
            }
            v34 = objc_msgSend(v8, "isGarbage");
            LODWORD(v35) = 0;
            if ((v34 & 1) == 0)
              objc_msgSend(v8, "ty", v35);
            if (v21 <= v31)
            {
              if (v21 <= *(float *)&v35)
              {
                if (v31 <= *(float *)&v35)
                  v21 = v31;
                else
                  v21 = *(float *)&v35;
              }
            }
            else if (v31 <= *(float *)&v35)
            {
              if (v21 > *(float *)&v35)
                v21 = *(float *)&v35;
            }
            else
            {
              v21 = v31;
            }
          }
          goto LABEL_49;
        }
        v10 = 0.0;
        v11 = 0.0;
        if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
        {
          objc_msgSend(v5, "tx");
          v11 = v27;
        }
        if ((objc_msgSend(v6, "isGarbage") & 1) == 0)
        {
          objc_msgSend(v6, "tx");
          v10 = v28;
        }
        v14 = 0.0;
        v15 = 0.0;
        if ((objc_msgSend(v5, "isGarbage") & 1) == 0)
        {
          objc_msgSend(v5, "ty");
          v15 = v29;
        }
        if ((objc_msgSend(v6, "isGarbage") & 1) == 0)
        {
          v17 = v6;
LABEL_47:
          objc_msgSend(v17, "ty");
          v14 = v30;
        }
LABEL_48:
        v20 = (float)(v11 + v10) * 0.5;
        v21 = (float)(v15 + v14) * 0.5;
LABEL_49:
        v3 = v3 + sqrtf((float)(v21 * v21) + (float)(v20 * v20));
      }
    }
    if (-[NSMutableArray count](self->clusterArray, "count"))
      return v3 / (float)(unint64_t)-[NSMutableArray count](self->clusterArray, "count");
  }
  return v3;
}

- (float)computeBeginningVsEndAEMatrixDiffVsAverageAdjacent
{
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  float v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  float v21;
  void *v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;

  v3 = -[NSMutableArray count](self->clusterArray, "count");
  LODWORD(v4) = 0;
  if (v3 >= 7)
  {
    v5 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", 0, v4);
    if (v5)
      v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "burstImages"), "objectAtIndex:", 0);
    else
      v6 = 0;
    v7 = 0.0;
    if ((unint64_t)-[NSMutableArray count](self->clusterArray, "count") >= 2)
    {
      v8 = 1;
      do
      {
        v9 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v8);
        if (v9)
        {
          v10 = objc_msgSend((id)objc_msgSend(v9, "burstImages"), "objectAtIndex:", 0);
          v11 = (void *)v10;
          if (v6 && v10)
          {
            objc_msgSend(v6, "computeAEMatrixDifference:", v10);
            v7 = v7 + v12;
          }
        }
        else
        {
          v11 = 0;
        }
        ++v8;
        v6 = v11;
      }
      while (-[NSMutableArray count](self->clusterArray, "count") > v8);
    }
    v13 = -[NSMutableArray count](self->clusterArray, "count");
    v14 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", 0);
    if (v14)
      v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "burstImages"), "objectAtIndex:", 0);
    else
      v15 = 0;
    v16 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", 1);
    if (v16)
      v17 = (void *)objc_msgSend((id)objc_msgSend(v16, "burstImages"), "objectAtIndex:", 0);
    else
      v17 = 0;
    v18 = v13 - 1;
    v19 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", -[NSMutableArray count](self->clusterArray, "count") - 2);
    if (v19)
      v20 = objc_msgSend((id)objc_msgSend(v19, "burstImages"), "objectAtIndex:", 0);
    else
      v20 = 0;
    v21 = (float)v18;
    v22 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", -[NSMutableArray count](self->clusterArray, "count") - 1);
    if (v22)
      v23 = objc_msgSend((id)objc_msgSend(v22, "burstImages"), "objectAtIndex:", 0);
    else
      v23 = 0;
    LODWORD(v4) = 0;
    v24 = v7 / v21;
    if (v15 && v17 && v20 && v23)
    {
      v25 = 0.0;
      if (-[CIBurstImageSetInternal version](self, "version", v4) >= 2)
      {
        objc_msgSend(v15, "computeAEMatrixDifference:", v20);
        v27 = v26 + 0.0;
        objc_msgSend(v15, "computeAEMatrixDifference:", v23);
        v29 = v27 + v28;
        objc_msgSend(v17, "computeAEMatrixDifference:", v20);
        v25 = v29 + v30;
      }
      objc_msgSend(v17, "computeAEMatrixDifference:", v23);
      *(float *)&v4 = (float)(v25 + *(float *)&v4) * 0.25;
    }
    if (*(float *)&v4 == 0.0)
      *(float *)&v4 = 0.0;
    else
      *(float *)&v4 = v24 / *(float *)&v4;
  }
  return *(float *)&v4;
}

- (void)computeAllImageScores
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  void *v8;
  float v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CIBurstActionClassifier *actionClassifier;
  float v14;
  float v15;
  float v16;
  double v17;
  CIBurstActionClassifier *v18;
  float v19;
  double v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  NSUInteger v26;
  int v27;
  unint64_t v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  float v38;
  unint64_t v39;
  float v40;
  double v41;
  float v42;
  void *v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  double v53;
  float v54;
  double v55;
  float v56;
  uint64_t v57;
  _BOOL4 v58;
  float v59;
  float v60;
  float v61;
  float v62;
  _BOOL4 v63;
  float v64;
  _BOOL4 v65;
  float v66;
  _BOOL4 v67;
  float v68;
  double v69;
  float v70;
  BOOL v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  unint64_t v77;
  float v78;
  void *v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  CIBurstActionClassifier *v92;
  float v93;
  float v94;
  float v95;
  double v96;
  CIBurstActionClassifier *v97;
  float v98;
  float v99;
  float v100;
  double v101;
  float v102;
  float v103;
  float v104;
  CIBurstActionClassifier *v105;
  float v106;
  float v107;
  float v108;
  double v109;
  CIBurstActionClassifier *v110;
  float v111;
  double v112;
  CIBurstActionClassifier *v113;
  double v114;
  CIBurstActionClassifier *v115;
  int v116;
  int v117;
  unint64_t v118;
  void *v119;
  double v120;
  unint64_t v121;
  void *v122;
  NSMutableArray *obj;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[128];
  __int128 v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v133 = 0uLL;
  v130 = 0;
  v131 = 0;
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v3 = 0;
    v4 = 0;
    LOBYTE(v5) = 0;
    do
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v3), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend(v6, "canRegister"))
      {
        if (v133 != 0
          || (objc_msgSend(v6, "allocateMeanStdPingPongBuffers::::", &v133, (char *)&v133 + 8, &v131, &v130),
              (_QWORD)v133)
          && *((_QWORD *)&v133 + 1))
        {
          if (v4)
          {
            v5 = !v5;
            objc_msgSend(v6, "assignMeanStdBuffers:", *((_QWORD *)&v133 + v5));
            objc_msgSend(v4, "performRegistration:deltaCol:deltaRow:", v6, v131, v130);
          }
          else
          {
            objc_msgSend(v6, "assignMeanStdBuffers:");
            LOBYTE(v5) = 0;
          }
          if (v3 == -[NSMutableArray count](self->clusterArray, "count") - 1)
          {
            objc_msgSend(v4, "maxSkewness");
            objc_msgSend(v6, "setMaxSkewness:");
            objc_msgSend(v4, "tx");
            objc_msgSend(v6, "setTx:");
            objc_msgSend(v4, "ty");
            objc_msgSend(v6, "setTy:");
          }
        }
        else
        {
          v6 = v4;
        }
      }
      else
      {
        BurstLoggingMessage("Skipping projection computation because data isn't present\n");
        v6 = 0;
      }
      ++v3;
      v4 = v6;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v3);
    if ((_QWORD)v133)
      free((void *)v133);
  }
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v7 = 0;
    v8 = 0;
    v9 = 0.0;
    do
    {
      v10 = v8;
      v8 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v7), "burstImages"), "objectAtIndex:", 0);
      v11 = -[NSMutableArray count](self->clusterArray, "count");
      v12 = 0;
      if (v11 - 1 > v7)
        v12 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v7 + 1, 0), "burstImages"), "objectAtIndex:", 0);
      objc_msgSend(v8, "computeSmoothedGridROI:nextStat:", v10, v12);
      if ((objc_msgSend(v8, "doLimitedSharpnessAndBlur") & 1) == 0
        && objc_msgSend(v8, "hasRegistrationData"))
      {
        actionClassifier = self->actionClassifier;
        objc_msgSend(v8, "maxSkewness");
        v15 = v14;
        -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](actionClassifier, "testAverageRegistrationErrorSkewness");
        *(float *)&v17 = v15 + v16;
        -[CIBurstActionClassifier setTestAverageRegistrationErrorSkewness:](actionClassifier, "setTestAverageRegistrationErrorSkewness:", v17);
        v9 = v9 + 1.0;
      }
      ++v7;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v7);
    if (v9 != 0.0)
    {
      v18 = self->actionClassifier;
      -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](v18, "testAverageRegistrationErrorSkewness");
      *(float *)&v20 = v19 / v9;
      -[CIBurstActionClassifier setTestAverageRegistrationErrorSkewness:](v18, "setTestAverageRegistrationErrorSkewness:", v20);
    }
  }
  if ((unint64_t)-[NSMutableArray count](self->clusterArray, "count") >= 7)
  {
    BurstLoggingMessage("LOOKING FOR FALSE-POSITIVE FACES...\n");
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    obj = self->clusterArray;
    v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, v132, 16);
    if (v125)
    {
      v124 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v125; ++i)
        {
          if (*(_QWORD *)v127 != v124)
            objc_enumerationMutation(obj);
          v22 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i), "burstImages"), "objectAtIndex:", 0);
          BurstLoggingMessage("Analyzing %s...\n", (const char *)objc_msgSend((id)objc_msgSend(v22, "imageId"), "UTF8String"));
          if (objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "count"))
          {
            v23 = 0;
            v24 = 0;
            do
            {
              v25 = (void *)objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "objectAtIndex:", v23);
              v26 = -[NSCountedSet countForObject:](self->faceIDCounts, "countForObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v25, "faceId")));
              v27 = objc_msgSend(v25, "faceId");
              if (v26 > 1)
              {
                BurstLoggingMessage("Keeping face with ID = %d\n", v27);
                ++v24;
              }
              else
              {
                BurstLoggingMessage("REMOVING false-positive face with ID = %d\n", v27);
                objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "removeObject:", v25);
              }
              v23 = v24;
            }
            while (objc_msgSend((id)objc_msgSend(v22, "faceStatArray"), "count") > (unint64_t)v24);
          }
        }
        v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, v132, 16);
      }
      while (v125);
    }
  }
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v28 = 0;
    v29 = 0.0;
    v30 = 0.0;
    do
    {
      v31 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v28), "burstImages"), "objectAtIndex:", 0);
      BurstLoggingMessage("Collapsing %s\n", (const char *)objc_msgSend((id)objc_msgSend(v31, "imageId"), "UTF8String"));
      objc_msgSend(v31, "collapseSharpnessGrid");
      objc_msgSend(v31, "blurExtent");
      v30 = v30 + v32;
      objc_msgSend(v31, "blurExtent");
      v34 = v33;
      objc_msgSend(v31, "blurExtent");
      v29 = v29 + (float)(v34 * v35);
      ++v28;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v28);
  }
  else
  {
    v30 = 0.0;
    v29 = 0.0;
  }
  v36 = v30 / (float)(unint64_t)-[NSMutableArray count](self->clusterArray, "count");
  v37 = -[NSMutableArray count](self->clusterArray, "count");
  if (v36 <= 0.5)
    v38 = v36;
  else
    v38 = 0.5;
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v39 = 0;
    v40 = sqrtf((float)(v29 / (float)v37) - (float)(v36 * v36));
    v41 = v40;
    v42 = v38 + v40;
    do
    {
      v43 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v39), "burstImages"), "objectAtIndex:", 0);
      objc_msgSend(v43, "setIsGarbage:", 0);
      BurstLoggingMessage("*_*_* GARBAGE DETECTOR FOR %s *_*_*\n", (const char *)objc_msgSend((id)objc_msgSend(v43, "imageId"), "UTF8String"));
      objc_msgSend(v43, "tx");
      v45 = v44;
      objc_msgSend(v43, "tx");
      v47 = v46;
      objc_msgSend(v43, "ty");
      v49 = v48;
      objc_msgSend(v43, "ty");
      v51 = sqrtf((float)(v49 * v50) + (float)(v45 * v47));
      objc_msgSend(v43, "maxSkewness");
      v53 = v52;
      -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](self->actionClassifier, "testAverageRegistrationErrorSkewness");
      v55 = v54;
      objc_msgSend(v43, "blurExtent");
      BurstLoggingMessage("\tTravel = %f, maxSkewness = %f, avgSkewness = %f, blur = %f, avgBlur = %f, stdBlur = %f\n", v51, v53, v55, v56, v38, v41);
      v57 = objc_msgSend((id)objc_msgSend(v43, "faceStatArray"), "count");
      objc_msgSend(v43, "blurExtent");
      v58 = 0;
      if (v59 < v38)
      {
        objc_msgSend(v43, "blurExtent");
        v58 = v60 < 0.2;
      }
      objc_msgSend(v43, "blurExtent");
      if (v61 <= v42 || (objc_msgSend(v43, "blurExtent"), v62 <= 0.2))
      {
        objc_msgSend(v43, "blurExtent");
        v63 = v64 > 0.7;
      }
      else
      {
        v63 = 1;
      }
      if (v51 <= 150.0)
      {
        if (v51 <= 50.0)
        {
          v65 = 0;
        }
        else
        {
          objc_msgSend(v43, "maxSkewness");
          v65 = v66 < 0.85;
        }
      }
      else
      {
        v65 = 1;
      }
      if (v51 <= 50.0)
      {
        objc_msgSend(v43, "maxSkewness");
        v69 = v68;
        -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](self->actionClassifier, "testAverageRegistrationErrorSkewness");
        v67 = v70 * 0.55 > v69;
      }
      else
      {
        v67 = 1;
      }
      BurstLoggingMessage("\t\thasFaces = %d\n", v57 != 0);
      BurstLoggingMessage("\t\tnotBlurry = %d\n", v58);
      BurstLoggingMessage("\t\tveryBlurry = %d\n", v63);
      BurstLoggingMessage("\t\tpotentiallyBlurry = %d\n", !v58 && !v63);
      BurstLoggingMessage("\t\tpoorRegistration = %d\n", v65);
      BurstLoggingMessage("\t\tsuspectRegistration = %d\n", v67);
      if (!v58)
      {
        v71 = v63 && (v65 || v67);
        if (v57)
          v71 = 0;
        if (v71 || v65 && (v63 || !v58 && !v63))
        {
          BurstLoggingMessage("\t******Image %s classified as garbage.\n", (const char *)objc_msgSend((id)objc_msgSend(v43, "imageId"), "UTF8String"));
          objc_msgSend(v43, "flagAsGarbage");
        }
      }
      ++v39;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v39);
  }
  if ((unint64_t)(-[NSMutableArray count](self->clusterArray, "count") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v72 = 1;
    do
    {
      v73 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72 - 1), "burstImages"), "objectAtIndex:", 0);
      v74 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72++), "burstImages"), "objectAtIndex:", 0);
      v75 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v72), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend(v73, "isGarbage")
        && objc_msgSend(v75, "isGarbage")
        && (objc_msgSend(v74, "isGarbage") & 1) == 0)
      {
        BurstLoggingMessage("**** Image %s classified as garbage by association.\n", (const char *)objc_msgSend((id)objc_msgSend(v74, "imageId"), "UTF8String"));
        objc_msgSend(v74, "flagAsGarbage");
      }
    }
    while (-[NSMutableArray count](self->clusterArray, "count") - 1 > v72);
  }
  if (!-[NSMutableArray count](self->clusterArray, "count"))
    goto LABEL_97;
  v77 = 0;
  v78 = 0.0;
  do
  {
    v79 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v77), "burstImages"), "objectAtIndex:", 0);
    if ((objc_msgSend(v79, "isGarbage") & 1) == 0)
    {
      -[CIBurstActionClassifier testMinRegionOfInterestSize](self->actionClassifier, "testMinRegionOfInterestSize");
      v81 = v80;
      objc_msgSend(v79, "roiSize");
      if (v81 > v82)
      {
        objc_msgSend(v79, "roiSize");
        -[CIBurstActionClassifier setTestMinRegionOfInterestSize:](self->actionClassifier, "setTestMinRegionOfInterestSize:");
      }
      if (objc_msgSend(v79, "hasRegistrationData"))
      {
        objc_msgSend(v79, "maxSkewness");
        v84 = v83;
        -[CIBurstActionClassifier testMaxRegistrationErrorSkewness](self->actionClassifier, "testMaxRegistrationErrorSkewness");
        if (v84 > v85)
        {
          objc_msgSend(v79, "maxSkewness");
          -[CIBurstActionClassifier setTestMaxRegistrationErrorSkewness:](self->actionClassifier, "setTestMaxRegistrationErrorSkewness:");
        }
        objc_msgSend(v79, "registrationErrorX");
        v87 = v86;
        -[CIBurstActionClassifier testMaxPeakRegistrationError](self->actionClassifier, "testMaxPeakRegistrationError");
        if (v87 > v88)
        {
          objc_msgSend(v79, "registrationErrorX");
          -[CIBurstActionClassifier setTestMaxPeakRegistrationError:](self->actionClassifier, "setTestMaxPeakRegistrationError:");
        }
        objc_msgSend(v79, "registrationErrorY");
        v90 = v89;
        -[CIBurstActionClassifier testMaxPeakRegistrationError](self->actionClassifier, "testMaxPeakRegistrationError");
        if (v90 > v91)
        {
          objc_msgSend(v79, "registrationErrorY");
          -[CIBurstActionClassifier setTestMaxPeakRegistrationError:](self->actionClassifier, "setTestMaxPeakRegistrationError:");
        }
        v92 = self->actionClassifier;
        objc_msgSend(v79, "registrationErrorX");
        v94 = v93;
        -[CIBurstActionClassifier testMeanPeakRegistrationError](v92, "testMeanPeakRegistrationError");
        *(float *)&v96 = v94 + v95;
        -[CIBurstActionClassifier setTestMeanPeakRegistrationError:](v92, "setTestMeanPeakRegistrationError:", v96);
        v97 = self->actionClassifier;
        objc_msgSend(v79, "registrationErrorY");
        v99 = v98;
        -[CIBurstActionClassifier testMeanPeakRegistrationError](v97, "testMeanPeakRegistrationError");
        *(float *)&v101 = v99 + v100;
        -[CIBurstActionClassifier setTestMeanPeakRegistrationError:](v97, "setTestMeanPeakRegistrationError:", v101);
        objc_msgSend(v79, "registrationErrorIntegral");
        v103 = v102;
        -[CIBurstActionClassifier testMaxRegistrationErrorIntegral](self->actionClassifier, "testMaxRegistrationErrorIntegral");
        if (v103 > v104)
        {
          objc_msgSend(v79, "registrationErrorIntegral");
          -[CIBurstActionClassifier setTestMaxRegistrationErrorIntegral:](self->actionClassifier, "setTestMaxRegistrationErrorIntegral:");
        }
        v105 = self->actionClassifier;
        objc_msgSend(v79, "maxSkewness");
        v107 = v106;
        -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](v105, "testAverageRegistrationErrorSkewness");
        *(float *)&v109 = v108 + (float)(v107 * 2.0);
        -[CIBurstActionClassifier setTestAverageRegistrationErrorSkewness:](v105, "setTestAverageRegistrationErrorSkewness:", v109);
        v78 = v78 + 2.0;
      }
    }
    ++v77;
  }
  while (-[NSMutableArray count](self->clusterArray, "count") > v77);
  if (v78 > 0.0)
  {
    v110 = self->actionClassifier;
    -[CIBurstActionClassifier testAverageRegistrationErrorSkewness](v110, "testAverageRegistrationErrorSkewness");
    *(float *)&v112 = v111 / v78;
    -[CIBurstActionClassifier setTestAverageRegistrationErrorSkewness:](v110, "setTestAverageRegistrationErrorSkewness:", v112);
    v113 = self->actionClassifier;
    -[CIBurstActionClassifier testMeanPeakRegistrationError](v113, "testMeanPeakRegistrationError");
    *(float *)&v114 = *(float *)&v114 / v78;
    v115 = v113;
  }
  else
  {
LABEL_97:
    LODWORD(v76) = 0;
    -[CIBurstActionClassifier setTestAverageRegistrationErrorSkewness:](self->actionClassifier, "setTestAverageRegistrationErrorSkewness:", v76);
    v115 = self->actionClassifier;
    LODWORD(v114) = 0;
  }
  -[CIBurstActionClassifier setTestMeanPeakRegistrationError:](v115, "setTestMeanPeakRegistrationError:", v114);
  -[CIBurstImageSetInternal computeCameraTravelDistance](self, "computeCameraTravelDistance");
  -[CIBurstActionClassifier setTestAverageCameraTravelDistance:](self->actionClassifier, "setTestAverageCameraTravelDistance:");
  -[CIBurstImageSetInternal computeBeginningVsEndAEMatrixDiffVsAverageAdjacent](self, "computeBeginningVsEndAEMatrixDiffVsAverageAdjacent");
  -[CIBurstActionClassifier setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:](self->actionClassifier, "setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:");
  -[CIBurstImageSetInternal computeActionSelectionThreshold](self, "computeActionSelectionThreshold");
  v117 = v116;
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v118 = 0;
    do
    {
      v119 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v118), "burstImages"), "objectAtIndex:", 0);
      if (v119)
      {
        LODWORD(v120) = v117;
        objc_msgSend(v119, "computeScore:", v120);
      }
      ++v118;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v118);
  }
  if (-[NSMutableArray count](self->clusterArray, "count"))
  {
    v121 = 0;
    do
    {
      v122 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v121), "burstImages"), "objectAtIndex:", 0);
      if (v122)
        objc_msgSend(v122, "writeGridROI:", -[NSMutableDictionary objectForKey:](self->statsByImageIdentifier, "objectForKey:", objc_msgSend(v122, "imageId")));
      ++v121;
    }
    while (-[NSMutableArray count](self->clusterArray, "count") > v121);
  }
}

- (id)findBestImage:(id)a3 useActionScores:(BOOL)a4
{
  float v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  uint64_t j;
  void *v17;
  float v18;
  float v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v41 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "count"))
    return 0;
  v5 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "temporalOrder");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (v5 > (float)(int)objc_msgSend(v10, "temporalOrder"))
          v5 = (float)(int)objc_msgSend(v10, "temporalOrder");
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v7);
  }
  v11 = objc_msgSend(a3, "count");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v42)
    return 0;
  v12 = 0;
  v13 = (float)((float)v11 * 0.5) + 0.5;
  v40 = *(_QWORD *)v46;
  v14 = v13 - (float)(v13 * 0.5);
  v39 = v13 + (float)(v13 * 0.5);
  v15 = 0.0;
  do
  {
    for (j = 0; j != v42; ++j)
    {
      if (*(_QWORD *)v46 != v40)
        objc_enumerationMutation(a3);
      v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
      v44 = v12;
      if (v41)
        objc_msgSend(v17, "actionScore");
      else
        objc_msgSend(v17, "imageScore");
      v19 = v18;
      objc_msgSend(v17, "setImageScore:");
      v20 = -[NSMutableDictionary objectForKey:](self->statsByImageIdentifier, "objectForKey:", objc_msgSend(v17, "imageId"));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "imageScore");
        v23 = objc_msgSend(v22, "numberWithFloat:");
        objc_msgSend(v21, "setObject:forKey:", v23, kCIBurstImageProperty_ImageScore[0]);
        if (-[CIBurstImageSetInternal version](self, "version") >= 2)
        {
          v24 = (void *)objc_msgSend(v21, "objectForKey:", CFSTR("Image_FacesArray"));
          if (objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "count"))
          {
            v25 = 0;
            do
            {
              v26 = (void *)objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "objectAtIndex:", v25);
              v27 = (void *)objc_msgSend(v24, "objectAtIndex:", v25);
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v26, "normalizedFocusScore");
              v29 = objc_msgSend(v28, "numberWithFloat:");
              objc_msgSend(v27, "setObject:forKey:", v29, kCIBurstImageFaceProperty_FocusScore[0]);
              v30 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v26, "smileScore");
              v31 = objc_msgSend(v30, "numberWithFloat:");
              objc_msgSend(v27, "setObject:forKey:", v31, kCIBurstImageFaceProperty_SmileScore[0]);
              ++v25;
            }
            while (objc_msgSend((id)objc_msgSend(v17, "faceStatArray"), "count") > v25);
          }
        }
      }
      objc_msgSend(v17, "registrationErrorIntegral");
      v33 = v32;
      v34 = (float)((float)(int)objc_msgSend(v17, "temporalOrder") - v5) + 1.0;
      if (v34 >= v14)
      {
        v35 = 0.0;
        v12 = v44;
        if (v34 > v39)
          v35 = (float)(v34 - v39) / (float)((float)(unint64_t)objc_msgSend(a3, "count") - v39);
      }
      else
      {
        v35 = (float)(v14 - v34) / (float)(v14 + -1.0);
        v12 = v44;
      }
      v36 = exp((float)-(float)(v35 * v35)) * 0.100000001 + 1.0;
      v37 = v19 * v36;
      BurstLoggingMessage("Score for %s:%d is %f \t\twith action score %f and center bias %f (isGarbage=%d)\n", (const char *)objc_msgSend((id)objc_msgSend(v17, "imageId"), "UTF8String"), objc_msgSend(v17, "temporalOrder"), v37, v33, v36, objc_msgSend(v17, "isGarbage"));
      if (!v12
        || objc_msgSend(v12, "isGarbage") && !objc_msgSend(v17, "isGarbage")
        || v37 > v15 && ((objc_msgSend(v12, "isGarbage") & 1) != 0 || (objc_msgSend(v17, "isGarbage") & 1) == 0))
      {
        BurstLoggingMessage("NEW BEST\n");
        v12 = v17;
        v15 = v37;
      }
    }
    v42 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  }
  while (v42);
  return v12;
}

- (void)selectCoverPhotoFromMultiple:(id)a3 burstSize:(int)a4
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  float v23;
  int v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->isPortrait)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0, *(_QWORD *)&a4), "temporalOrder");
    v7 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "temporalOrder");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v15 = (float)((float)((float)(int)(objc_msgSend(v14, "temporalOrder") - v6) / (float)(v7 - v6)) * 0.33) + 1.0;
          -[CIBurstImageSetInternal version](self, "version");
          objc_msgSend(v14, "avgHorzDiffY");
          v17 = v15 * v16;
          objc_msgSend(v14, "blurExtent");
          v19 = v17 / (float)(v18 + 1.0);
          BurstLoggingMessage("Cover photo PORTRAIT selection score for %d:%s = %f (unbiased = %f)\n", objc_msgSend(v14, "temporalOrder"), (const char *)objc_msgSend((id)objc_msgSend(v14, "imageId"), "UTF8String"), v19, (float)(v19 / v15));
          if (v19 > v12)
          {
            v12 = v19;
            v10 = v14;
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v9);
      goto LABEL_17;
    }
LABEL_19:
    v33 = (void *)MEMORY[0x1E0CB3940];
    v31 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "imageId");
    v32 = v33;
    goto LABEL_20;
  }
  v20 = objc_msgSend(a3, "count", a3, *(_QWORD *)&a4) / 3uLL;
  v21 = objc_msgSend(a3, "count");
  if ((int)v20 > v21 + ~(_DWORD)v20)
    goto LABEL_19;
  v10 = 0;
  v22 = (int)v20;
  v23 = 0.0;
  v24 = v21 - 2 * v20;
  do
  {
    v25 = (void *)objc_msgSend(a3, "objectAtIndex:", v22);
    objc_msgSend(v25, "avgHorzDiffY");
    v27 = v26;
    objc_msgSend(v25, "blurExtent");
    v29 = v27 / (float)(v28 + 1.0);
    BurstLoggingMessage("Cover photo ACTION selection score for %d:%s = %f\n", objc_msgSend(v25, "temporalOrder"), (const char *)objc_msgSend((id)objc_msgSend(v25, "imageId"), "UTF8String"), v29);
    if (v29 > v23)
    {
      v23 = v29;
      v10 = v25;
    }
    ++v22;
    --v24;
  }
  while (v24);
LABEL_17:
  if (!v10)
    goto LABEL_19;
  v30 = (void *)MEMORY[0x1E0CB3940];
  v31 = objc_msgSend(v10, "imageId");
  v32 = v30;
LABEL_20:
  self->burstCoverSelection = (NSString *)(id)objc_msgSend(v32, "stringWithString:", v31);
}

- (id)bestImageIdentifiers
{
  void *v3;
  NSObject *dq;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  dq = self->dq;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CIBurstImageSetInternal_bestImageIdentifiers__block_invoke;
  block[3] = &unk_1E2EC2EE0;
  block[4] = self;
  block[5] = v3;
  dispatch_sync(dq, block);
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 2)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        v11 = 0u;
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
                objc_enumerationMutation(v3);
              objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++)));
            }
            while (v7 != v9);
            v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          }
          while (v7);
        }
      }
    }
  }
  -[CIBurstImageSetInternal setBestImageIdentifiersArray:](self, "setBestImageIdentifiersArray:", v3);
  return v3;
}

void __47__CIBurstImageSetInternal_bestImageIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  int v6;
  float v7;
  unint64_t v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _DWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  signed int v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  float v74;
  BOOL v75;
  float v76;
  BOOL v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  int v83;
  float v84;
  float v85;
  uint64_t v86;
  double v87;
  double v88;
  int v89;
  float v90;
  float v91;
  float v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  CIBurstClusterDivider *v97;
  void *v98;
  double v99;
  int v100;
  int v101;
  float v102;
  int v103;
  int v104;
  float v105;
  int v106;
  float *v107;
  uint64_t v108;
  uint64_t v109;
  float v110;
  float v111;
  double v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  int v122;
  int v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  float v128;
  float v129;
  float v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  void *v141;
  double v142;
  double v143;
  int v144;
  float v145;
  double v146;
  float v147;
  double v148;
  float v149;
  float v150;
  float v151;
  uint64_t v152;
  float v153;
  unint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  float v159;
  float v160;
  float v161;
  _BOOL4 v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  int v174;
  float v175;
  double v176;
  float v177;
  void *v178;
  float v179;
  float v180;
  float v181;
  void *v182;
  void *v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t j;
  void *v202;
  void *v203;
  void *v204;
  int v205;
  unsigned int v206;
  double v207;
  unint64_t v208;
  char v209;
  float v210;
  float v211;
  uint64_t v212;
  void *v213;
  void *v214;
  float v215;
  double v216;
  float v217;
  void *v219;
  void *v220;
  float v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  int v225;
  uint64_t v226;
  int v227;
  uint64_t v228;
  void *v229;
  float v230;
  float v231;
  float v232;
  float v233;
  uint64_t v234;
  void *v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  double v242;
  double v243;
  float v244;
  float v245;
  int v246;
  unsigned int v247;
  unsigned int v248;
  unsigned __int8 v249;
  float v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  float v254;
  float v255;
  BOOL v257;
  CIBurstClusterDivider *v258;
  double v259;
  void *v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  uint64_t k;
  void *v268;
  CIBurstThumbnailCluster *v269;
  int v270;
  uint64_t v271;
  int v272;
  uint64_t v273;
  int v274;
  void *v275;
  int v276;
  unint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  void *v289;
  unint64_t v290;
  CIBurstThumbnailCluster *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t m;
  float v297;
  void *v298;
  uint64_t v299;
  uint64_t v300;
  int v301;
  uint64_t v302;
  uint64_t n;
  void *v304;
  void *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t ii;
  void *v310;
  void *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t jj;
  uint64_t v316;
  int *v317;
  void *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t kk;
  void *v323;
  void *v324;
  uint64_t v325;
  uint64_t v326;
  int v327;
  uint64_t v328;
  uint64_t mm;
  float v330;
  unint64_t v331;
  void *v332;
  void *v333;
  int v334;
  void *v335;
  void *v336;
  float v337;
  unint64_t v338;
  void *v339;
  void *v340;
  float v341;
  void *v342;
  int v343;
  float v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  uint64_t v348;
  float v349;
  uint64_t i1;
  void *v351;
  int v352;
  float v353;
  float v354;
  float v355;
  const char *v356;
  void *v357;
  void *v358;
  uint64_t v359;
  void *v360;
  void *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t nn;
  void *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t i2;
  const char *v371;
  unint64_t v372;
  uint64_t v373;
  void *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  void *v379;
  char *v380;
  int *v381;
  char *v382;
  uint64_t v383;
  uint64_t v384;
  float v385;
  uint64_t v386;
  char *v387;
  float v388;
  uint64_t v389;
  id obj;
  id obja;
  id objb;
  id v393;
  int v394;
  id v395;
  id v396;
  uint64_t v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  int v446;
  int v447;
  _BYTE v448[128];
  _BYTE v449[128];
  _BYTE v450[128];
  _BYTE v451[128];
  _BYTE v452[128];
  _BYTE v453[128];
  _BYTE v454[128];
  _BYTE v455[128];
  _BYTE v456[128];
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  _BYTE v464[128];
  uint64_t v465;

  v1 = a1;
  v465 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "processClusters:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 80), "calcFaceScores:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 32));
    objc_msgSend(*(id *)(v1 + 32), "computeAllImageScores");
    if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count"))
    {
      v2 = 0;
      do
      {
        v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectAtIndex:", v2), "burstImages"), "objectAtIndex:", 0);
        if (v3)
        {
          v4 = v3;
          v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "imageId"), "UTF8String");
          v6 = objc_msgSend(v4, "faceStatArray") ? objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count") : 0;
          objc_msgSend(v4, "avgHorzDiffY");
          BurstLoggingMessage("%s:   # faces = %d, avgH = %f\n", v5, v6, v7);
          if (objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count"))
          {
            v8 = 0;
            do
            {
              v9 = (void *)objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "objectAtIndex:", v8);
              v10 = objc_msgSend(v9, "faceId");
              objc_msgSend(v9, "faceRect");
              v12 = v11;
              objc_msgSend(v9, "faceRect");
              v14 = v13;
              objc_msgSend(v9, "faceRect");
              v16 = v15;
              objc_msgSend(v9, "faceRect");
              v18 = v17;
              objc_msgSend(v9, "focusScore");
              v20 = v19;
              objc_msgSend(v9, "normalizedFocusScore");
              BurstLoggingMessage("    face id=%d, rect=%.3f,%.3f,%.3f,%.3f, focus=%.3f, faceScore=%.3f, leftEyeOpen=%d, rightEyeOpen=%d\n", v10, v12, v14, v16, v18, v20, v21, objc_msgSend(v9, "leftEyeOpen"), objc_msgSend(v9, "rightEyeOpen"));
              ++v8;
            }
            while (objc_msgSend((id)objc_msgSend(v4, "faceStatArray"), "count") > v8);
          }
        }
        ++v2;
      }
      while (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count") > v2);
    }
    v22 = *(void **)(*(_QWORD *)(v1 + 32) + 32);
    if (v22)
    {
      if (objc_msgSend(v22, "count"))
      {
        v23 = *(void **)(*(_QWORD *)(v1 + 32) + 32);
        v397 = v1;
        if (v23)
        {
          v24 = objc_msgSend(v23, "count");
          v25 = (char *)malloc_type_malloc(4 * (v24 * v24), 0x100004052888210uLL);
          if (v25)
            v26 = (int)v24 < 2;
          else
            v26 = 1;
          if (!v26)
          {
            v393 = 0;
            v27 = v24 << 32;
            v28 = (int)v24;
            v29 = ((v24 << 32) - 0x100000000) >> 32;
            v30 = v24;
            if (v29 <= 1)
              v29 = 1;
            v375 = v29;
            v377 = (int)v24;
            v31 = 4 * (int)v24;
            v373 = 4 * v28 + 4;
            v380 = v25;
            v32 = v25;
            v384 = v27;
            v33 = v25;
            do
            {
              obj = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectAtIndex:", v393), "burstImages"), "objectAtIndex:", 0);
              v382 = (char *)v393 + 1;
              v34 = v23;
              if ((uint64_t)v393 + 1 < v377)
              {
                v35 = v31;
                v36 = 1;
                v37 = v384;
                do
                {
                  objc_msgSend(obj, "computeImageDistance:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectAtIndex:", (char *)v393 + v36), "burstImages"), "objectAtIndex:", 0));
                  v39 = v38 * 1000000.0;
                  *(_DWORD *)&v32[4 * v36] = (int)v39;
                  *(_DWORD *)&v32[v35] = (int)v39;
                  v33[(_QWORD)v393 + ((v27 * (uint64_t)v393) >> 32)] = 0;
                  v33[(_QWORD)v393 + v36 + (v37 >> 32)] = 0;
                  v37 += v27;
                  ++v36;
                  v35 += v31;
                }
                while (v30 != v36);
              }
              v384 += v27;
              --v30;
              v32 += v373;
              v393 = (char *)v393 + 1;
              v23 = v34;
            }
            while (v382 != (char *)v375);
            v1 = v397;
            v25 = v380;
          }
        }
        else
        {
          v25 = 0;
        }
        v381 = (int *)v25;
        v40 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count");
        v41 = *(_QWORD *)(v1 + 32);
        v42 = *(void **)(v41 + 32);
        if ((int)v40 < 7)
        {
          v55 = (void *)objc_msgSend(*(id *)(v41 + 32), "objectAtIndex:", 0);
          if ((int)v40 >= 2)
          {
            v56 = v40 + 1;
            do
            {
              objc_msgSend(v55, "addItemsFromCluster:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectAtIndex:", (v56 - 2)));
              objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "removeObjectAtIndex:", (v56-- - 2));
            }
            while (v56 > 2);
          }
          goto LABEL_362;
        }
        v43 = *(void **)(v41 + 152);
        obja = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
        v44 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
        v447 = 0;
        v45 = (v40 - 1);
        v46 = (char *)&gShortBurstWeights;
        v47 = (char *)&gMediumBurstWeights;
        v48 = (char *)&gWhyNotTryVideoInsteadWeights;
        v446 = v40 - 1;
        if (v40 < 0x65)
          v48 = (char *)&gLongBurstWeights;
        if (v40 >= 0x33)
          v47 = v48;
        v444 = 0u;
        v445 = 0u;
        v383 = v40;
        if (v40 >= 0x15)
          v46 = v47;
        v387 = v46;
        v442 = 0uLL;
        v443 = 0uLL;
        v49 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v442, v464, 16);
        if (v49)
        {
          v50 = v49;
          v51 = 0;
          v52 = *(_QWORD *)v443;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v443 != v52)
                objc_enumerationMutation(v42);
              v54 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v442 + 1) + 8 * i), "burstImages"), "objectAtIndex:", 0);
              if (!objc_msgSend((id)objc_msgSend(v54, "faceStatArray"), "count")
                && !objc_msgSend(v54, "numHWFaces"))
              {
                ++v51;
              }
            }
            v50 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v442, v464, 16);
          }
          while (v50);
        }
        else
        {
          v51 = 0;
        }
        BurstLoggingMessage("Images without faces = %d, threshold = %d, total # = %d\n", v51, (v383 >> 2) + 1, v383);
        if (v51 <= (int)((v383 >> 2) + 1))
        {
          BurstLoggingMessage("Classified as portrait mode. Affects cover photo selection.\n");
          *(_BYTE *)(v41 + 73) = 1;
          v387 = (char *)&gWhyNotTryVideoInsteadWeights;
        }
        v57 = 0;
        v58 = v45;
        v59 = (v383 - 2);
        v60 = 0.0;
        v61 = v383 - 1;
        v62 = v45 - 1;
        v63 = v59 - 1;
        v64 = (char *)(v381 + 1);
        v65 = 0.0;
        v66 = 0.0;
        v67 = 0.0;
        v68 = 0.0;
        v69 = 0.0;
        v70 = 0.0;
        do
        {
          v71 = v57 + 1;
          if (v57 + 1 < (unint64_t)v383)
          {
            v72 = 0;
            do
            {
              v73 = (float)*(int *)&v64[4 * v72];
              if (v57)
                v74 = -0.0;
              else
                v74 = (float)*(int *)&v64[4 * v72];
              if (v57 + v72)
                v75 = v57 == 1;
              else
                v75 = 1;
              if (v75)
                v76 = (float)*(int *)&v64[4 * v72];
              else
                v76 = -0.0;
              v77 = v63 == v72 || v57 == v59;
              v60 = v60 + v73;
              v65 = v65 + (float)(v73 * v73);
              v66 = v66 + 1.0;
              v70 = v70 + v74;
              v69 = v69 + v76;
              if (v77)
                v78 = (float)*(int *)&v64[4 * v72];
              else
                v78 = -0.0;
              v67 = v67 + v78;
              if (v62 != v72)
                v73 = -0.0;
              v68 = v68 + v73;
              ++v72;
            }
            while (v61 != v72);
          }
          --v61;
          --v62;
          --v63;
          v64 += 4 * v383 + 4;
          ++v57;
        }
        while (v71 != v45);
        v79 = v60 / v66;
        BurstLoggingMessage("all costs within valid region: \t\tmean = %f, std = %f\n", v79, sqrtf((float)(v65 / v66) - (float)(v79 * v79)));
        v80 = (float)(int)v45;
        v81 = v70 / (float)(int)v45;
        BurstLoggingMessage("First average cost = %f\n", v81);
        if (v81 <= 575000.0)
        {
          v83 = 0;
        }
        else
        {
          v82 = v69 / v80;
          BurstLoggingMessage("Second average cost = %f\n", v82);
          if (v82 <= 575000.0)
          {
            BurstLoggingMessage("--Invalidating one outlier from the start of the burst\n");
            v447 = 1;
            v83 = -1;
          }
          else
          {
            BurstLoggingMessage("--Invalidating two outliers from the start of the burst\n");
            v447 = 2;
            v83 = -2;
          }
        }
        v84 = v68 / v80;
        BurstLoggingMessage("Last average cost = %f\n", v84);
        if (v84 > 575000.0)
        {
          v85 = v67 / v80;
          BurstLoggingMessage("Second-to-last average cost = %f\n", v85);
          if (v85 <= 575000.0)
          {
            BurstLoggingMessage("--Invalidating one outlier from the end of the burst\n");
            v58 = v383 - 2;
          }
          else
          {
            BurstLoggingMessage("--Invalidating two outliers from the end of the burst\n");
            v58 = v383 - 3;
          }
          v446 = v58;
        }
        if (v58 + v83 <= 5)
        {
          BurstLoggingMessage("Number of images too few after invalidation at the endpoints. Return one selection.\n");
        }
        else
        {
          v460 = 0uLL;
          *(_QWORD *)&v461 = 0;
          findBestThreeWayDivision((uint64_t)v381, v383, &v447, &v446, 0, -1, -1, (uint64_t)&v460);
          v86 = v460;
          BurstLoggingMessage("Result of three-way division: finalCost: %f, inOutRatio: %f\n", *(float *)&v460, *((float *)&v460 + 1));
          LODWORD(v87) = v86;
          objc_msgSend(v43, "setTestMaxInnerDistance:", v87);
          LODWORD(v88) = HIDWORD(v86);
          objc_msgSend(v43, "setTestInOutRatio:", v88);
          if ((objc_msgSend(v43, "isBurstAction") & 1) != 0)
          {
            v378 = v45;
            v374 = (void *)v44;
            BurstLoggingMessage("Classified as action.\n");
            *(_BYTE *)(v41 + 72) = 1;
            v89 = v446;
            v90 = 0.0;
            v91 = 0.0;
            v92 = 0.0;
            v394 = v447;
            v376 = v446;
            if (v446 > v447)
            {
              v93 = v447;
              v94 = v383 + v383 * v447;
              v95 = ~(uint64_t)v447;
              v96 = -(uint64_t)v447;
              do
              {
                v97 = objc_alloc_init(CIBurstClusterDivider);
                v98 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v93), "burstImages"), "objectAtIndex:", 0);
                v100 = v93 + 1;
                v101 = v93 + 4;
                if (v89 < (int)v93 + 4)
                  v101 = v89;
                if (v93 >= v101)
                {
                  v110 = NAN;
                }
                else
                {
                  v102 = 0.0;
                  v103 = v94;
                  v104 = v93 + 1;
                  v105 = 0.0;
                  do
                  {
                    if (v394 <= v104 - 4)
                      v106 = v104 - 4;
                    else
                      v106 = v394;
                    if (v93 >= v106)
                    {
                      v107 = (float *)&v387[4 * v95 + 4 * v104];
                      v108 = v93;
                      v109 = v96 + v104;
                      do
                      {
                        if (v109 <= 4)
                        {
                          v105 = v105 + (float)((float)v381[v103 + v108] * *v107);
                          v102 = v102 + *v107;
                        }
                        ++v107;
                        ++v109;
                        v26 = v108-- <= v106;
                      }
                      while (!v26);
                    }
                    ++v104;
                    v103 += v383;
                  }
                  while (v104 <= v101);
                  v110 = v105 / v102;
                }
                *(float *)&v99 = v110;
                -[CIBurstClusterDivider setDividerScore:](v97, "setDividerScore:", v99);
                -[CIBurstClusterDivider setLeftImage:](v97, "setLeftImage:", v93);
                objc_msgSend(v98, "actionClusteringScore");
                -[CIBurstClusterDivider setActionAmount:](v97, "setActionAmount:");
                -[CIBurstClusterDivider dividerScore](v97, "dividerScore");
                v112 = v111;
                objc_msgSend(v98, "actionClusteringScore");
                BurstLoggingMessage("Between %d and %d: \t%f \t%f \t\tmotion: %f\n", v93, v93 + 1, v110, v112, v113);
                objc_msgSend(obja, "addObject:", v97);

                objc_msgSend(v98, "actionClusteringScore");
                v91 = v91 + v114;
                objc_msgSend(v98, "actionClusteringScore");
                v116 = v115;
                objc_msgSend(v98, "actionClusteringScore");
                v94 += v383;
                v92 = v92 + (float)(v116 * v117);
                --v95;
                --v96;
                ++v93;
                v89 = v376;
              }
              while ((_DWORD)v376 != v100);
            }
            v118 = (float)(v89 - v394);
            v119 = v91 / v118;
            v385 = v118;
            v120 = sqrtf((float)(v92 / v118) - (float)(v119 * v119));
            v121 = v119 - v120;
            if ((float)(v119 - v120) < 5000.0)
              v121 = 5000.0;
            if (v121 > 9000.0)
              v121 = 9000.0;
            v388 = v121;
            BurstLoggingMessage("Action mean = %f, action std = %f, action threshold = %f\n", v119, v120, v121);
            if (v89 > v394)
            {
              v122 = v89;
              v123 = v394;
              v124 = v394 - 4;
              v90 = 0.0;
              v125 = v394;
              do
              {
                if ((int)v125 - 4 <= v394)
                  v126 = v394;
                else
                  v126 = v125 - 4;
                v127 = v125 + 4;
                if ((int)v125 + 4 >= v122)
                  v127 = v122;
                v128 = 0.0;
                v129 = 0.0;
                v130 = 0.0;
                if (v126 < v127)
                {
                  if (v394 <= v124)
                    v131 = v124;
                  else
                    v131 = v394;
                  v132 = v131;
                  v133 = v127;
                  do
                  {
                    if (v123 != (_DWORD)v132)
                    {
                      v134 = (void *)objc_msgSend(obja, "objectAtIndex:", v132 - v394);
                      objc_msgSend(v134, "dividerScore");
                      v128 = v128 + v135;
                      objc_msgSend(v134, "dividerScore");
                      v137 = v136;
                      objc_msgSend(v134, "dividerScore");
                      v129 = v129 + (float)(v137 * v138);
                      v130 = v130 + 1.0;
                    }
                    ++v132;
                  }
                  while (v132 < v133);
                }
                v139 = v128 / v130;
                v140 = sqrtf((float)(v129 / v130) - (float)(v139 * v139));
                v141 = (void *)objc_msgSend(obja, "objectAtIndex:", v125 - v394);
                *(float *)&v142 = (float)(v128 / v130) + (float)(v140 * 0.5);
                objc_msgSend(v141, "setNoiseThreshold:", v142);
                *(float *)&v143 = (float)(v128 / v130) + (float)(v140 * 3.0);
                objc_msgSend(v141, "setHighNoiseThreshold:", v143);
                v144 = objc_msgSend(v141, "leftImage");
                objc_msgSend(v141, "dividerScore");
                v146 = v145;
                objc_msgSend(v141, "noiseThreshold");
                v148 = v147;
                objc_msgSend(v141, "highNoiseThreshold");
                BurstLoggingMessage("Local statistics for divider %03d\t with score %f:\t\t noise threshold = %f, high threshold = %f (mean %f, std %f)\n", v144, v146, v148, v149, v139, v140);
                objc_msgSend(v141, "dividerScore");
                v90 = v90 + v150;
                ++v125;
                ++v124;
                ++v123;
                v122 = v376;
              }
              while ((_DWORD)v376 != (_DWORD)v125);
            }
            if ((float)(v90 / v385) <= 150000.0)
              v151 = v90 / v385;
            else
              v151 = 150000.0;
            BurstLoggingMessage("Overall mean divider score = %f\n", v151);
            BurstLoggingMessage("clusterDividerArraySize = %d\n", objc_msgSend(obja, "count"));
            if ((unint64_t)(objc_msgSend(obja, "count") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v152 = 0;
              if (v79 <= 280000.0)
                v153 = v79;
              else
                v153 = 280000.0;
              do
              {
                v154 = v152 + 1;
                v155 = (void *)objc_msgSend(obja, "objectAtIndex:", v152 + 1);
                objc_msgSend(v155, "setTrueLocalMaximum:", 0);
                v156 = objc_msgSend(obja, "objectAtIndex:", v152);
                v157 = (void *)v156;
                if (v152 + 1 >= (int)v383 - 2)
                {
                  v158 = 0;
                  if (v156)
                  {
LABEL_135:
                    objc_msgSend(v157, "dividerScore");
                    v160 = v159;
                    objc_msgSend(v155, "dividerScore");
                    v162 = v160 <= v161;
                    if (v158)
                      goto LABEL_136;
                    goto LABEL_138;
                  }
                }
                else
                {
                  v158 = (void *)objc_msgSend(obja, "objectAtIndex:", (v152 + 2));
                  if (v157)
                    goto LABEL_135;
                }
                v162 = 1;
                if (v158)
                {
LABEL_136:
                  objc_msgSend(v158, "dividerScore");
                  v164 = v163;
                  objc_msgSend(v155, "dividerScore");
                  if (v164 > v165)
                    v162 = 0;
                }
LABEL_138:
                objc_msgSend(v155, "dividerScore");
                if (v162 && v166 >= 27500.0)
                {
                  objc_msgSend(v155, "dividerScore");
                  v168 = v167;
                  objc_msgSend(v155, "noiseThreshold");
                  if (v168 >= v169
                    && ((objc_msgSend(v155, "dividerScore"), v170 >= v151)
                     || (objc_msgSend(v155, "dividerScore"),
                         v172 = v171,
                         objc_msgSend(v155, "highNoiseThreshold"),
                         v172 >= v173)))
                  {
                    v178 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", (int)objc_msgSend(v155, "leftImage")), "burstImages"), "objectAtIndex:", 0);
                    objc_msgSend(v178, "actionClusteringScore");
                    if ((v179 >= v388 || (objc_msgSend(v155, "dividerScore"), v180 >= v153))
                      && (objc_msgSend(v178, "actionClusteringScore"), v181 >= 1.0))
                    {
                      if (v154 < 2)
                        goto LABEL_158;
                      if (objc_msgSend(obja, "count") - 2 <= v154)
                        goto LABEL_158;
                      v182 = (void *)objc_msgSend(obja, "objectAtIndex:", (v152 - 1));
                      v183 = (void *)objc_msgSend(obja, "objectAtIndex:", (v152 + 3));
                      objc_msgSend(v157, "dividerScore");
                      v185 = v184;
                      objc_msgSend(v155, "dividerScore");
                      if ((float)(v185 / v186) <= 0.95)
                      {
                        objc_msgSend(v158, "dividerScore");
                        v188 = v187;
                        objc_msgSend(v155, "dividerScore");
                        if ((float)(v188 / v189) <= 0.95)
                          goto LABEL_158;
                      }
                      objc_msgSend(v182, "dividerScore");
                      v191 = v190;
                      objc_msgSend(v155, "dividerScore");
                      if (v191 <= v192
                        && (objc_msgSend(v183, "dividerScore"),
                            v194 = v193,
                            objc_msgSend(v155, "dividerScore"),
                            v194 <= v195))
                      {
LABEL_158:
                        objc_msgSend(v155, "setTrueLocalMaximum:", 1);
                        objc_msgSend(v374, "addObject:", v155);
                      }
                      else
                      {
                        BurstLoggingMessage("Locally-maximal divider %d not considered due to being potential noise (nearby peak).\n");
                      }
                    }
                    else
                    {
                      objc_msgSend(v155, "leftImage");
                      objc_msgSend(v178, "actionClusteringScore");
                      BurstLoggingMessage("Locally-maximal divider %d not considered due to lack of any motion: %f\n");
                    }
                  }
                  else
                  {
                    v174 = objc_msgSend(v155, "leftImage");
                    objc_msgSend(v155, "dividerScore");
                    v176 = v175;
                    objc_msgSend(v155, "noiseThreshold");
                    BurstLoggingMessage("Locally-maximal divider %d not considered due to being potential noise (%f vs %f,%f)\n", v174, v176, v177, v151);
                  }
                }
                v196 = objc_msgSend(obja, "count") - 1;
                v197 = v152 + 2;
                ++v152;
              }
              while (v196 > v197);
            }
            BurstLoggingMessage("local maxima size: %ld\n", objc_msgSend(v374, "count"));
            v440 = 0u;
            v441 = 0u;
            v438 = 0u;
            v439 = 0u;
            v198 = objc_msgSend(v374, "countByEnumeratingWithState:objects:count:", &v438, &v460, 16);
            v1 = v397;
            if (v198)
            {
              v199 = v198;
              v200 = *(_QWORD *)v439;
              do
              {
                for (j = 0; j != v199; ++j)
                {
                  if (*(_QWORD *)v439 != v200)
                    objc_enumerationMutation(v374);
                  BurstLoggingMessage("divider %d\n", objc_msgSend(*(id *)(*((_QWORD *)&v438 + 1) + 8 * j), "leftImage"));
                }
                v199 = objc_msgSend(v374, "countByEnumeratingWithState:objects:count:", &v438, &v460, 16);
              }
              while (v199);
            }
            v372 = objc_msgSend(v374, "count");
            if (v372 <= 1)
            {
              BurstLoggingMessage("Re-running three-way division with minClusterSize = %d, maxClusterSize = %d\n", (int)(float)((float)(int)v383 * 0.1), (int)(float)((float)(int)v383 * 0.7));
              v458 = 0;
              v457 = 0;
              v459 = 0;
              findBestThreeWayDivision((uint64_t)v381, v383, &v447, &v446, 0, (int)(float)((float)(int)v383 * 0.1), (int)(float)((float)(int)v383 * 0.7), (uint64_t)&v457);
              v278 = v457;
              v279 = (int)v458;
              v280 = SHIDWORD(v458);
              v281 = (int)v459;
              v282 = SHIDWORD(v459);
              if (v378 > SHIDWORD(v458))
              {
                v283 = (int)v383 - 1;
                do
                  objc_msgSend(v42, "removeObjectAtIndex:", v283--);
                while (v283 > v280);
              }
              v284 = objc_msgSend(v42, "objectAtIndex:", v282 + 1);
              if ((int)v280 > (int)v282 + 1)
              {
                v285 = (void *)v284;
                do
                {
                  objc_msgSend(v285, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v280));
                  objc_msgSend(v42, "removeObjectAtIndex:", v280--);
                }
                while (v280 > v282 + 1);
              }
              v286 = objc_msgSend(v42, "objectAtIndex:", v281 + 1);
              if ((int)v282 > (int)v281 + 1)
              {
                v287 = (void *)v286;
                do
                {
                  objc_msgSend(v287, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v282));
                  objc_msgSend(v42, "removeObjectAtIndex:", v282--);
                }
                while (v282 > v281 + 1);
              }
              v288 = objc_msgSend(v42, "objectAtIndex:", v279);
              if ((int)v281 > (int)v279)
              {
                v289 = (void *)v288;
                do
                {
                  objc_msgSend(v289, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v281));
                  objc_msgSend(v42, "removeObjectAtIndex:", v281--);
                }
                while (v281 > v279);
              }
              if ((int)v279 >= 1)
              {
                v290 = v279 + 1;
                do
                  objc_msgSend(v42, "removeObjectAtIndex:", (v290-- - 2));
                while (v290 > 1);
              }
              BurstLoggingMessage("Clustering costs: maxInner = %f, inOutRatio = %f\n", *(float *)&v278, *((float *)&v278 + 1));
            }
            else
            {
              v202 = (void *)objc_msgSend(v374, "sortedArrayUsingSelector:", sel_compareDividers_);
              v203 = (void *)objc_msgSend(v202, "objectAtIndex:", 0);
              v204 = (void *)objc_msgSend(v202, "objectAtIndex:", 1);
              BurstLoggingMessage("Strongest local maxima: %d and %d\n", objc_msgSend(v203, "leftImage"), objc_msgSend(v204, "leftImage"));
              v205 = objc_msgSend(v203, "leftImage");
              v206 = objc_msgSend(v203, "leftImage");
              if (objc_msgSend(obja, "count") > (unint64_t)(v205 + 1))
              {
                v208 = v205 + 1;
                v209 = 1;
                v210 = 0.0;
                v211 = 0.0;
                v212 = v206;
                do
                {
                  v213 = (void *)objc_msgSend(obja, "objectAtIndex:", v208);
                  v214 = v213;
                  if (v211 != 0.0)
                  {
                    objc_msgSend(v213, "dividerScore");
                    if (*(float *)&v207 > v211)
                      break;
                  }
                  objc_msgSend(v214, "dividerScore");
                  v211 = v215;
                  v216 = v215;
                  objc_msgSend(v203, "dividerScore");
                  v207 = v217 * 0.75;
                  if (v211 <= v79 || v207 >= v216)
                    break;
                  objc_msgSend(v204, "dividerScore", v207);
                  if (v211 <= *(float *)&v207)
                    break;
                  BurstLoggingMessage("Expanding main peak to include divider %d\n", objc_msgSend(v214, "leftImage"));
                  objc_msgSend(v374, "addObject:", v214);
                  if ((v209 & 1) == 0)
                    break;
                  if ((int)v212 < 1)
                    break;
                  v219 = (void *)objc_msgSend(obja, "objectAtIndex:", --v212);
                  v220 = v219;
                  if (v210 != 0.0)
                  {
                    objc_msgSend(v219, "dividerScore");
                    if (*(float *)&v207 > v210)
                      break;
                  }
                  objc_msgSend(v220, "dividerScore");
                  v210 = v221;
                  objc_msgSend(v203, "dividerScore");
                  if (v210 <= v79)
                    break;
                  v207 = *(float *)&v207 * 0.75;
                  if (v207 >= v210)
                    break;
                  objc_msgSend(v204, "dividerScore");
                  if (v210 <= *(float *)&v207)
                    break;
                  BurstLoggingMessage("Expanding main peak to include divider %d\n", objc_msgSend(v220, "leftImage"));
                  objc_msgSend(v374, "addObject:", v220);
                  ++v208;
                  v209 = 0;
                }
                while (objc_msgSend(obja, "count") > v208);
              }
              v222 = (void *)objc_msgSend(v374, "sortedArrayUsingSelector:", v207);
              BurstLoggingMessage("Adding action-based cluster boundaries.\n");
              v379 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
              v434 = 0u;
              v435 = 0u;
              v436 = 0u;
              v437 = 0u;
              objb = v222;
              v223 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v434, &v457, 16);
              if (v223)
              {
                v224 = v223;
                v225 = 0;
                v226 = *(_QWORD *)v435;
                v227 = v394;
                v386 = *(_QWORD *)v435;
                do
                {
                  v228 = 0;
                  v389 = v224;
                  do
                  {
                    if (*(_QWORD *)v435 != v226)
                      objc_enumerationMutation(objb);
                    v229 = *(void **)(*((_QWORD *)&v434 + 1) + 8 * v228);
                    if ((int)(objc_msgSend(v229, "leftImage") - v227) >= 7)
                    {
                      v230 = 0.0;
                      v231 = 0.0;
                      v232 = 0.0;
                      v233 = 0.0;
                      if (v227 <= (int)objc_msgSend(v229, "leftImage"))
                      {
                        v234 = v227;
                        do
                        {
                          v235 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v234), "burstImages"), "objectAtIndex:", 0);
                          objc_msgSend(v235, "registrationErrorIntegral");
                          if (v233 < v236)
                          {
                            objc_msgSend(v235, "registrationErrorIntegral");
                            v233 = v237;
                          }
                          objc_msgSend(v235, "registrationErrorIntegral");
                          v230 = v230 + v238;
                          objc_msgSend(v235, "registrationErrorIntegral");
                          v240 = v239;
                          objc_msgSend(v235, "registrationErrorIntegral");
                          v231 = v231 + (float)(v240 * v241);
                          v232 = v232 + 1.0;
                          v26 = v234++ < (int)objc_msgSend(v229, "leftImage");
                        }
                        while (v26);
                      }
                      v242 = (float)(v230 / v232);
                      v243 = sqrtf((float)(v231 / v232) - (float)((float)(v230 / v232) * (float)(v230 / v232)));
                      v244 = v242 + v243 * 0.5;
                      if (v244 >= 20000.0)
                        v245 = v242 + v243 * 0.5;
                      else
                        v245 = 20000.0;
                      v246 = v225 + 1;
                      BurstLoggingMessage("Action statistics for cluster %d: mean %f std %f threshold %f\n", v225 + 1, (float)(v230 / v232), v243, v245);
                      v247 = objc_msgSend(v229, "leftImage");
                      v248 = 0;
                      v249 = 0;
                      v250 = v233 * 0.99;
                      v251 = (int)v247;
                      LODWORD(v252) = -1;
                      do
                      {
                        v253 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", v251), "burstImages"), "objectAtIndex:", 0);
                        objc_msgSend(v253, "registrationErrorIntegral");
                        if (v254 <= v245)
                          v252 = v252;
                        else
                          v252 = v247;
                        objc_msgSend(v253, "registrationErrorIntegral");
                        v257 = v255 > v250 && v248 < 2;
                        v249 |= v257;
                        --v251;
                        ++v248;
                        --v247;
                      }
                      while (v248 != 4);
                      if ((int)v252 <= 0)
                      {
                        v226 = v386;
                        v224 = v389;
                        v225 = v246;
                      }
                      else
                      {
                        v226 = v386;
                        v225 = v246;
                        if ((((_DWORD)v252 != objc_msgSend(v229, "leftImage")) & v249) == 1)
                        {
                          BurstLoggingMessage("Adding ACTION DIVIDER at location %d\n", v252);
                          v258 = objc_alloc_init(CIBurstClusterDivider);
                          LODWORD(v259) = 0;
                          -[CIBurstClusterDivider setDividerScore:](v258, "setDividerScore:", v259);
                          -[CIBurstClusterDivider setLeftImage:](v258, "setLeftImage:", v252);
                          objc_msgSend(v379, "addObject:", v258);

                        }
                        v224 = v389;
                      }
                    }
                    else
                    {
                      BurstLoggingMessage("Cluster %d is too small for action-based cluster boundaries\n", ++v225);
                    }
                    v227 = objc_msgSend(v229, "leftImage") + 1;
                    ++v228;
                  }
                  while (v228 != v224);
                  v224 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v434, &v457, 16);
                }
                while (v224);
              }
              objc_msgSend(v374, "addObjectsFromArray:", v379);
              v260 = (void *)objc_msgSend(v374, "sortedArrayUsingSelector:", sel_compareIndices_);
              v261 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v260, "count") + 1);
              v430 = 0u;
              v431 = 0u;
              v432 = 0u;
              v433 = 0u;
              v262 = v260;
              v263 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v430, v456, 16);
              if (v263)
              {
                v264 = v263;
                v265 = *(_QWORD *)v431;
                v266 = v394;
                do
                {
                  for (k = 0; k != v264; ++k)
                  {
                    if (*(_QWORD *)v431 != v265)
                      objc_enumerationMutation(v262);
                    v268 = *(void **)(*((_QWORD *)&v430 + 1) + 8 * k);
                    v269 = objc_alloc_init(CIBurstThumbnailCluster);
                    v270 = objc_msgSend(v268, "leftImage");
                    if (v270 >= v266)
                    {
                      v271 = v270;
                      do
                      {
                        -[CIBurstThumbnailCluster addItemsFromCluster:](v269, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v271));
                        v26 = v271-- <= v266;
                      }
                      while (!v26);
                    }
                    v266 = objc_msgSend(v268, "leftImage") + 1;
                    objc_msgSend(v261, "addObject:", v269);

                  }
                  v264 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v430, v456, 16);
                }
                while (v264);
              }
              else
              {
                v266 = v394;
              }
              v291 = objc_alloc_init(CIBurstThumbnailCluster);
              v292 = v376;
              if ((int)v376 >= v266)
              {
                do
                {
                  -[CIBurstThumbnailCluster addItemsFromCluster:](v291, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", v292));
                  v26 = v292-- <= v266;
                }
                while (!v26);
              }
              objc_msgSend(v261, "addObject:", v291);

              objc_msgSend(v42, "removeAllObjects");
              v428 = 0u;
              v429 = 0u;
              v426 = 0u;
              v427 = 0u;
              v293 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v426, v455, 16);
              v1 = v397;
              if (v293)
              {
                v294 = v293;
                v295 = *(_QWORD *)v427;
                do
                {
                  for (m = 0; m != v294; ++m)
                  {
                    if (*(_QWORD *)v427 != v295)
                      objc_enumerationMutation(v261);
                    objc_msgSend(v42, "addObject:", *(_QWORD *)(*((_QWORD *)&v426 + 1) + 8 * m));
                  }
                  v294 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v426, v455, 16);
                }
                while (v294);
              }
            }
            v297 = 0.0;
            if (v372 <= 1)
              goto LABEL_271;
            goto LABEL_270;
          }
          BurstLoggingMessage("Classified as non-action.\n");
          *(_BYTE *)(v41 + 72) = 0;
          v58 = v446;
        }
        v26 = (int)v45 <= v58;
        v272 = v45;
        v1 = v397;
        if (!v26)
        {
          v273 = v272;
          do
            objc_msgSend(v42, "removeObjectAtIndex:", v273--);
          while (v273 > v58);
        }
        v274 = v447;
        if (v447 >= 1)
        {
          do
          {
            objc_msgSend(v42, "removeObjectAtIndex:", 0);
            --v274;
          }
          while (v274);
        }
        v275 = (void *)objc_msgSend(v42, "objectAtIndex:", 0);
        v276 = objc_msgSend(v42, "count");
        if (v276 > 1)
        {
          v277 = v276 + 1;
          do
          {
            objc_msgSend(v275, "addItemsFromCluster:", objc_msgSend(v42, "objectAtIndex:", (v277 - 2)));
            objc_msgSend(v42, "removeObjectAtIndex:", (v277-- - 2));
          }
          while (v277 > 2);
        }
LABEL_270:
        v297 = v79;
LABEL_271:
        v424 = 0u;
        v425 = 0u;
        v422 = 0u;
        v423 = 0u;
        v298 = *(void **)(*(_QWORD *)(v1 + 32) + 32);
        v299 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v422, v454, 16);
        if (v299)
        {
          v300 = v299;
          v301 = 0;
          v302 = *(_QWORD *)v423;
          do
          {
            for (n = 0; n != v300; ++n)
            {
              if (*(_QWORD *)v423 != v302)
                objc_enumerationMutation(v298);
              v304 = *(void **)(*((_QWORD *)&v422 + 1) + 8 * n);
              BurstLoggingMessage("Performing emotional rejection of face images in cluster %d:\n", v301 + n);
              objc_msgSend(*(id *)(v1 + 32), "performEmotionalRejectionOnCluster:", objc_msgSend(v304, "burstImages"));
            }
            v300 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v422, v454, 16);
            v301 += n;
          }
          while (v300);
        }
        if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count") >= 2)
        {
          v395 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
          v420 = 0u;
          v421 = 0u;
          v418 = 0u;
          v419 = 0u;
          v305 = *(void **)(*(_QWORD *)(v1 + 32) + 32);
          v306 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v418, v453, 16);
          if (v306)
          {
            v307 = v306;
            v308 = *(_QWORD *)v419;
            do
            {
              for (ii = 0; ii != v307; ++ii)
              {
                if (*(_QWORD *)v419 != v308)
                  objc_enumerationMutation(v305);
                v310 = *(void **)(*((_QWORD *)&v418 + 1) + 8 * ii);
                BurstLoggingMessage("Items in next cluster:\n");
                v416 = 0u;
                v417 = 0u;
                v414 = 0u;
                v415 = 0u;
                v311 = (void *)objc_msgSend(v310, "burstImages");
                v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v414, v452, 16);
                if (v312)
                {
                  v313 = v312;
                  v314 = *(_QWORD *)v415;
                  do
                  {
                    for (jj = 0; jj != v313; ++jj)
                    {
                      if (*(_QWORD *)v415 != v314)
                        objc_enumerationMutation(v311);
                      BurstLoggingMessage("%s\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v414 + 1) + 8 * jj), "imageId"), "UTF8String"));
                    }
                    v313 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v414, v452, 16);
                  }
                  while (v313);
                }
                v1 = v397;
                v316 = objc_msgSend(*(id *)(v397 + 32), "findBestImage:useActionScores:", objc_msgSend(v310, "burstImages"), *(_BYTE *)(*(_QWORD *)(v397 + 32) + 73) == 0);
                if (v316)
                  objc_msgSend(v395, "addObject:", v316);
              }
              v307 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v418, v453, 16);
            }
            while (v307);
          }
          v317 = v381;
          v318 = v395;
          if (*(_BYTE *)(*(_QWORD *)(v1 + 32) + 73))
          {
            v412 = 0u;
            v413 = 0u;
            v410 = 0u;
            v411 = 0u;
            v319 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v410, v451, 16);
            if (v319)
            {
              v320 = v319;
              v321 = *(_QWORD *)v411;
              do
              {
                for (kk = 0; kk != v320; ++kk)
                {
                  if (*(_QWORD *)v411 != v321)
                    objc_enumerationMutation(v395);
                  v323 = *(void **)(*((_QWORD *)&v410 + 1) + 8 * kk);
                  v406 = 0u;
                  v407 = 0u;
                  v408 = 0u;
                  v409 = 0u;
                  v324 = (void *)objc_msgSend(v323, "faceStatArray");
                  v325 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v406, v450, 16);
                  if (!v325)
                    goto LABEL_311;
                  v326 = v325;
                  v327 = 0;
                  v328 = *(_QWORD *)v407;
                  do
                  {
                    for (mm = 0; mm != v326; ++mm)
                    {
                      if (*(_QWORD *)v407 != v328)
                        objc_enumerationMutation(v324);
                      objc_msgSend(*(id *)(*((_QWORD *)&v406 + 1) + 8 * mm), "normalizedFocusScore");
                      if (v330 >= 1.0)
                        ++v327;
                    }
                    v326 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v406, v450, 16);
                  }
                  while (v326);
                  v1 = v397;
                  if (!v327)
                  {
LABEL_311:
                    BurstLoggingMessage("Image %s is classified as garbage for portrait mode, no sharp faces.\n", (const char *)objc_msgSend((id)objc_msgSend(v323, "imageId"), "UTF8String"));
                    objc_msgSend(v323, "setIsGarbage:", 1);
                  }
                }
                v320 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v410, v451, 16);
              }
              while (v320);
            }
            v318 = v395;
            v317 = v381;
            if (objc_msgSend(v395, "count") && objc_msgSend(v395, "count") != 1)
            {
              v331 = 0;
              do
              {
                v332 = (void *)objc_msgSend(v395, "objectAtIndex:", v331++);
                v333 = (void *)objc_msgSend(v395, "objectAtIndex:", v331);
                BurstLoggingMessage("Checking temporal order: %d vs. %d\n", objc_msgSend(v332, "temporalOrder"), objc_msgSend(v333, "temporalOrder"));
                v334 = objc_msgSend(v332, "temporalOrder");
                if (v334 == objc_msgSend(v333, "temporalOrder") - 1
                  && (objc_msgSend(v333, "isGarbage") & 1) == 0)
                {
                  BurstLoggingMessage("Removing %d:%s\n", objc_msgSend(v332, "temporalOrder"), (const char *)objc_msgSend((id)objc_msgSend(v332, "imageId"), "UTF8String"));
                  objc_msgSend(v332, "setIsGarbage:", 1);
                }
              }
              while (objc_msgSend(v395, "count") - 1 > v331);
            }
          }
          v335 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
          if ((unint64_t)objc_msgSend(v318, "count") < 4)
          {
            v404 = 0u;
            v405 = 0u;
            v402 = 0u;
            v403 = 0u;
            v362 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v402, v449, 16);
            if (v362)
            {
              v363 = v362;
              v364 = *(_QWORD *)v403;
              do
              {
                for (nn = 0; nn != v363; ++nn)
                {
                  if (*(_QWORD *)v403 != v364)
                    objc_enumerationMutation(v395);
                  v366 = *(void **)(*((_QWORD *)&v402 + 1) + 8 * nn);
                  if ((objc_msgSend(v366, "isGarbage") & 1) == 0
                    && (objc_msgSend(v366, "emotionallyRejected") & 1) == 0)
                  {
                    objc_msgSend(v335, "addObject:", v366);
                  }
                }
                v318 = v395;
                v363 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v402, v449, 16);
              }
              while (v363);
            }
            if (objc_msgSend(v335, "count"))
              goto LABEL_377;
            v359 = objc_msgSend(v318, "objectAtIndex:", 0);
            v358 = v335;
          }
          else
          {
            v336 = (void *)objc_msgSend(v318, "sortedArrayUsingSelector:", sel_compareImageOrder_);
            if ((float)(v297 / 4.5) <= 70000.0)
              v337 = v297 / 4.5;
            else
              v337 = 70000.0;
            BurstLoggingMessage("Threshold for dupes: %f\n", v337);
            if (objc_msgSend(v336, "count"))
            {
              v338 = 0;
              v339 = 0;
              v396 = v336;
              do
              {
                v340 = (void *)objc_msgSend(v336, "objectAtIndex:", v338);
                v341 = 0.0;
                if (objc_msgSend(v336, "count") - 1 > v338)
                {
                  v342 = (void *)objc_msgSend(v336, "objectAtIndex:", v338 + 1);
                  v343 = objc_msgSend(v340, "temporalOrder");
                  v341 = (float)v317[(int)(objc_msgSend(v342, "temporalOrder") + v343 * v383)];
                  objc_msgSend(v340, "computeAEMatrixDifference:", v342);
                  v1 = v397;
                  BurstLoggingMessage("Distance between selections %d and %d: %f, %f\n", objc_msgSend(v340, "temporalOrder"), objc_msgSend(v342, "temporalOrder"), v341, v344);
                }
                if (objc_msgSend(v336, "count") - 1 <= v338 || v341 >= v337)
                {
                  if (v339)
                  {
                    objc_msgSend(v339, "addObject:", v340);
                    v463 = 0u;
                    v462 = 0u;
                    v461 = 0u;
                    v460 = 0u;
                    v345 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v460, v464, 16);
                    if (!v345)
                      goto LABEL_348;
                    v346 = v345;
                    v347 = 0;
                    v348 = *(_QWORD *)v461;
                    v349 = 0.0;
                    do
                    {
                      for (i1 = 0; i1 != v346; ++i1)
                      {
                        if (*(_QWORD *)v461 != v348)
                          objc_enumerationMutation(v339);
                        v351 = *(void **)(*((_QWORD *)&v460 + 1) + 8 * i1);
                        v352 = objc_msgSend(v351, "temporalOrder");
                        objc_msgSend(v351, "imageScore");
                        BurstLoggingMessage("Selection score of %d is %f... isGarbage = %d\n", v352, v353, objc_msgSend(v351, "isGarbage"));
                        objc_msgSend(v351, "imageScore");
                        if (v354 > v349
                          && (objc_msgSend(v351, "isGarbage") & 1) == 0
                          && (objc_msgSend(v351, "emotionallyRejected") & 1) == 0)
                        {
                          objc_msgSend(v351, "imageScore");
                          v349 = v355;
                          v347 = v351;
                        }
                      }
                      v346 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v460, v464, 16);
                    }
                    while (v346);
                    v317 = v381;
                    v336 = v396;
                    if (v347)
                    {
                      BurstLoggingMessage("Choosing candidate %d from a series of dupes\n", objc_msgSend(v347, "temporalOrder"));
                      objc_msgSend(v335, "addObject:", v347);
                    }
                    else
                    {
LABEL_348:
                      BurstLoggingMessage("Throwing away all dupes due to garbage classification\n");
                    }
                    objc_msgSend(v339, "removeAllObjects");
                    v339 = 0;
                    v1 = v397;
                  }
                  else
                  {
                    if ((objc_msgSend(v340, "isGarbage") & 1) != 0
                      || (objc_msgSend(v340, "emotionallyRejected") & 1) != 0)
                    {
                      if (objc_msgSend(v340, "isGarbage"))
                        v356 = "trash";
                      else
                        v356 = "reject";
                      v371 = v356;
                      v317 = v381;
                      BurstLoggingMessage("Tossing out the %s on %d\n", v371, objc_msgSend(v340, "temporalOrder"));
                    }
                    else
                    {
                      BurstLoggingMessage("Keeping candidate %d\n", objc_msgSend(v340, "temporalOrder"));
                      objc_msgSend(v335, "addObject:", v340);
                    }
                    v339 = 0;
                  }
                }
                else
                {
                  if (!v339)
                    v339 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
                  objc_msgSend(v339, "addObject:", v340);
                }
                ++v338;
              }
              while (objc_msgSend(v336, "count") > v338);
            }
            if (objc_msgSend(v335, "count"))
              goto LABEL_377;
            v357 = (void *)objc_msgSend(v336, "objectAtIndex:", (unint64_t)(objc_msgSend(v336, "count") + 1) >> 1);
            BurstLoggingMessage("All images are garbage. Picking the middle selection = %s.\n", (const char *)objc_msgSend((id)objc_msgSend(v357, "imageId"), "UTF8String"));
            v358 = v335;
            v359 = (uint64_t)v357;
          }
          objc_msgSend(v358, "addObject:", v359);
LABEL_377:
          objc_msgSend(*(id *)(v1 + 32), "selectCoverPhotoFromMultiple:burstSize:", v335, v383);
          v400 = 0u;
          v401 = 0u;
          v398 = 0u;
          v399 = 0u;
          v367 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v398, v448, 16);
          if (v367)
          {
            v368 = v367;
            v369 = *(_QWORD *)v399;
            do
            {
              for (i2 = 0; i2 != v368; ++i2)
              {
                if (*(_QWORD *)v399 != v369)
                  objc_enumerationMutation(v335);
                objc_msgSend(*(id *)(v1 + 40), "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v398 + 1) + 8 * i2), "imageId"));
              }
              v368 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v398, v448, 16);
            }
            while (v368);
          }
LABEL_384:
          free(v381);
          return;
        }
        v55 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectAtIndex:", 0);
        BurstLoggingMessage("All items in one cluster.\n");
LABEL_362:
        v360 = (void *)objc_msgSend(*(id *)(v1 + 32), "findBestImage:useActionScores:", objc_msgSend(v55, "burstImages"), 0);
        if (v360)
        {
          v361 = v360;
          *(_QWORD *)(*(_QWORD *)(v1 + 32) + 64) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", objc_msgSend(v360, "imageId"));
          objc_msgSend(*(id *)(v1 + 40), "addObject:", objc_msgSend(v361, "imageId"));
        }
        goto LABEL_384;
      }
    }
  }
}

- (id)imageClusterForIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->clusterByImageIdentifier)
  {
    self->clusterByImageIdentifier = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    if (-[NSMutableArray count](self->clusterArray, "count"))
    {
      v4 = 0;
      do
      {
        v5 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", v4);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v6 = (void *)objc_msgSend(v5, "burstImages");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v26 != v9)
                objc_enumerationMutation(v6);
              -[NSMutableDictionary setObject:forKey:](self->clusterByImageIdentifier, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "imageId"));
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v8);
        }
        ++v4;
      }
      while (-[NSMutableArray count](self->clusterArray, "count") > v4);
    }
  }
  v11 = (void *)-[NSMutableDictionary objectForKey:](self->clusterByImageIdentifier, "objectForKey:", a3);
  if (!v11)
    return 0;
  v12 = (void *)-[NSMutableArray objectAtIndex:](self->clusterArray, "objectAtIndex:", (int)objc_msgSend(v11, "intValue"));
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v12, "burstImages"), "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = (void *)objc_msgSend(v12, "burstImages");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "imageId"));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  return v13;
}

- (BOOL)isFaceDetectionForced
{
  CIBurstImageFaceAnalysisContext *faceAnalysisContext;

  faceAnalysisContext = self->faceAnalysisContext;
  if (faceAnalysisContext)
    LOBYTE(faceAnalysisContext) = -[CIBurstImageFaceAnalysisContext forceFaceDetectionEnable](faceAnalysisContext, "forceFaceDetectionEnable");
  return (char)faceAnalysisContext;
}

- (BOOL)isPortrait
{
  if (!-[CIBurstImageSetInternal bestImageIdentifiersArray](self, "bestImageIdentifiersArray"))
    -[CIBurstImageSetInternal bestImageIdentifiers](self, "bestImageIdentifiers");
  return self->isPortrait;
}

- (BOOL)isAction
{
  if (!-[CIBurstImageSetInternal bestImageIdentifiersArray](self, "bestImageIdentifiersArray"))
    -[CIBurstImageSetInternal bestImageIdentifiers](self, "bestImageIdentifiers");
  return self->isAction;
}

- (NSMutableArray)clusterArray
{
  return self->clusterArray;
}

- (void)setClusterArray:(id)a3
{
  self->clusterArray = (NSMutableArray *)a3;
}

- (int)temporalOrder
{
  return self->temporalOrder;
}

- (void)setTemporalOrder:(int)a3
{
  self->temporalOrder = a3;
}

- (NSCountedSet)faceIDCounts
{
  return self->faceIDCounts;
}

- (void)setFaceIDCounts:(id)a3
{
  self->faceIDCounts = (NSCountedSet *)a3;
}

- (NSMutableArray)allImageIdentifiers
{
  return self->allImageIdentifiers;
}

- (void)setAllImageIdentifiers:(id)a3
{
  self->allImageIdentifiers = (NSMutableArray *)a3;
}

- (CIBurstActionClassifier)actionClassifier
{
  return self->actionClassifier;
}

- (void)setActionClassifier:(id)a3
{
  self->actionClassifier = (CIBurstActionClassifier *)a3;
}

- (NSMutableDictionary)statsByImageIdentifier
{
  return self->statsByImageIdentifier;
}

- (void)setStatsByImageIdentifier:(id)a3
{
  self->statsByImageIdentifier = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)clusterByImageIdentifier
{
  return self->clusterByImageIdentifier;
}

- (void)setClusterByImageIdentifier:(id)a3
{
  self->clusterByImageIdentifier = (NSMutableDictionary *)a3;
}

- (NSString)burstLogFileName
{
  return self->burstLogFileName;
}

- (void)setBurstLogFileName:(id)a3
{
  self->burstLogFileName = (NSString *)a3;
}

- (int)maxNumPendingFrames
{
  return self->maxNumPendingFrames;
}

- (void)setMaxNumPendingFrames:(int)a3
{
  self->maxNumPendingFrames = a3;
}

- (BOOL)enableAnalysis
{
  return self->enableAnalysis;
}

- (void)setEnableAnalysis:(BOOL)a3
{
  self->enableAnalysis = a3;
}

- (int)dummyAnalysisCount
{
  return self->dummyAnalysisCount;
}

- (void)setDummyAnalysisCount:(int)a3
{
  self->dummyAnalysisCount = a3;
}

- (BOOL)enableFaceCore
{
  return self->enableFaceCore;
}

- (void)setEnableFaceCore:(BOOL)a3
{
  self->enableFaceCore = a3;
}

- (BOOL)enableDumpYUV
{
  return self->enableDumpYUV;
}

- (void)setEnableDumpYUV:(BOOL)a3
{
  self->enableDumpYUV = a3;
}

- (NSString)burstCoverSelection
{
  return self->burstCoverSelection;
}

- (void)setBurstCoverSelection:(id)a3
{
  self->burstCoverSelection = (NSString *)a3;
}

- (NSString)burstId
{
  return self->burstId;
}

- (void)setBurstId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSArray)bestImageIdentifiersArray
{
  return &self->bestImageIdentifiersArray->super;
}

- (void)setBestImageIdentifiersArray:(id)a3
{
  self->bestImageIdentifiersArray = (NSMutableArray *)a3;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
  self->_versionString = (NSString *)a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

@end
