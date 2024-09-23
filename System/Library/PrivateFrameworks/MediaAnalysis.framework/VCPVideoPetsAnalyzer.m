@implementation VCPVideoPetsAnalyzer

- (VCPVideoPetsAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  VCPImagePetsAnalyzer *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  VCPVideoPetsAnalyzer *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VCPVideoPetsAnalyzer;
  v3 = -[VCPVideoPetsAnalyzer init](&v21, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v6;

    v8 = *MEMORY[0x1E0CA2E28];
    *((_QWORD *)v3 + 5) = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v3 + 24) = v8;
    v9 = MEMORY[0x1E0CA2E18];
    v10 = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v3 + 8) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *((_OWORD *)v3 + 3) = v10;
    v11 = *(_QWORD *)(v9 + 16);
    *(_OWORD *)(v3 + 72) = *(_OWORD *)v9;
    *((_QWORD *)v3 + 11) = v11;
    v12 = -[VCPImagePetsAnalyzer initWithMaxNumRegions:]([VCPImagePetsAnalyzer alloc], "initWithMaxNumRegions:", 5);
    v13 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = v12;

    v14 = (void *)*((_QWORD *)v3 + 12);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)*((_QWORD *)v3 + 13);
      *((_QWORD *)v3 + 13) = v15;

      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v3 + 14);
      *((_QWORD *)v3 + 14) = v17;

      v14 = v3;
    }
    v19 = v14;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)parseResults:(id)a3 toDetections:(id)a4 atTime:(id *)a5 fromTime:(id *)a6 addActiveRegions:(id)a7
{
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSString *v19;
  void *v20;
  int v21;
  int v22;
  VCPPetsRegion *v23;
  double v24;
  VCPPetsRegion *v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CFDictionaryRef v33;
  CFDictionaryRef v34;
  void *v35;
  id v36;
  __int128 v37;
  id v38;
  void *v40;
  id obj;
  void *v42;
  id v43;
  uint64_t v44;
  id v46;
  CMTime v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CMTime rhs;
  CMTime time;
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[2];
  _QWORD v61[2];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;
  NSRect v65;
  NSRect v66;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v46 = a4;
  v11 = a7;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x1E0CA2E18];
    a6->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)&a6->var0 = v13;
    v11 = (id)v12;
  }
  v40 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
  v55 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("petsBounds"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = v21;

          v23 = [VCPPetsRegion alloc];
          v65 = NSRectFromString(v19);
          LODWORD(v24) = v22;
          v25 = -[VCPPetsRegion initWith:confidence:](v23, "initWith:confidence:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height, v24);
          if (!v25)
          {

            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v38 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          objc_msgSend(v42, "addObject:", v25);

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v15)
        continue;
      break;
    }
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v43 = v40;
  v26 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v26)
  {
    v44 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v49 != v44)
          objc_enumerationMutation(v43);
        v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v60[0] = CFSTR("petsBounds");
        objc_msgSend(v28, "bound");
        NSStringFromRect(v66);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = CFSTR("petsConfidence");
        v61[0] = v29;
        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "confidence");
        objc_msgSend(v30, "numberWithFloat:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        time = (CMTime)*a6;
        v58[0] = CFSTR("start");
        v33 = CMTimeCopyAsDictionary(&time, 0);
        v59[0] = v33;
        v58[1] = CFSTR("duration");
        time = (CMTime)*a5;
        rhs = (CMTime)*a6;
        CMTimeSubtract(&v47, &time, &rhs);
        time = v47;
        v34 = CMTimeCopyAsDictionary(&time, 0);
        v58[2] = CFSTR("attributes");
        v59[1] = v34;
        v59[2] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v35);

      }
      v26 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v42, "count"))
  {
    v36 = v42;

    v37 = *(_OWORD *)&a5->var0;
    a6->var3 = a5->var3;
    *(_OWORD *)&a6->var0 = v37;
  }
  else
  {
    v36 = v43;
  }
  v38 = v36;
  v40 = v38;
LABEL_25:

  return v38;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6 frameStats:(id)a7
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  VCPImagePetsAnalyzer *petsAnalyer;
  id v15;
  void *v16;
  NSMutableArray *petsDetections;
  NSArray *v18;
  NSArray *petsActiveRegions;
  void *v20;
  NSMutableArray *petsFaceDetections;
  NSArray *v22;
  NSArray *petsFaceActiveRegions;
  __int128 v24;
  void *v25;
  __int128 v27;
  int64_t v28;
  __int128 v29;
  int64_t var3;
  id v31;
  CMTime time;
  uint64_t v33;
  CMTime rhs;
  CMTime lhs;

  v10 = a7;
  v11 = (void *)MEMORY[0x1BCCA1B2C]();
  v33 = 0;
  lhs = *(CMTime *)a4;
  rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 1.0)
  {
    petsAnalyer = self->_petsAnalyer;
    v31 = 0;
    v12 = -[VCPImagePetsAnalyzer analyzePixelBuffer:flags:results:cancel:](petsAnalyer, "analyzePixelBuffer:flags:results:cancel:", a3, &v33, &v31, &__block_literal_global_0);
    v15 = v31;
    v13 = v15;
    if (!v12)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PetsResults"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      petsDetections = self->_petsDetections;
      v29 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      -[VCPVideoPetsAnalyzer parseResults:toDetections:atTime:fromTime:addActiveRegions:](self, "parseResults:toDetections:atTime:fromTime:addActiveRegions:", v16, petsDetections, &v29, &self->_petsStart, self->_petsActiveRegions);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      petsActiveRegions = self->_petsActiveRegions;
      self->_petsActiveRegions = v18;

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      petsFaceDetections = self->_petsFaceDetections;
      v27 = *(_OWORD *)&a4->var0;
      v28 = a4->var3;
      -[VCPVideoPetsAnalyzer parseResults:toDetections:atTime:fromTime:addActiveRegions:](self, "parseResults:toDetections:atTime:fromTime:addActiveRegions:", v20, petsFaceDetections, &v27, &self->_petsFaceStart, self->_petsFaceActiveRegions);
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
      petsFaceActiveRegions = self->_petsFaceActiveRegions;
      self->_petsFaceActiveRegions = v22;

      v12 = 0;
      v24 = *(_OWORD *)&a4->var0;
      self->_timeLastProcess.epoch = a4->var3;
      *(_OWORD *)&self->_timeLastProcess.value = v24;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  objc_autoreleasePoolPop(v11);
  if (!v12)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PetsResults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPetsDetections:", v25);

  }
  return v12;
}

uint64_t __80__VCPVideoPetsAnalyzer_analyzeFrame_withTimestamp_andDuration_flags_frameStats___block_invoke()
{
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a4;
  v7 = *a5;
  return -[VCPVideoPetsAnalyzer analyzeFrame:withTimestamp:andDuration:flags:frameStats:](self, "analyzeFrame:withTimestamp:andDuration:flags:frameStats:", a3, &v8, &v7, a6, 0);
}

- (void)addDetectionToDict:(id *)a3 withActiveRegions:(id)a4 forPetsDetections:(id)a5 fromTime:(id *)a6
{
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFDictionaryRef v17;
  CFDictionaryRef v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time;
  CMTimeRange range;
  CMTime v30;
  CMTime v31;
  CMTime rhs;
  CMTime lhs;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;
  NSRect v40;

  v39 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v23 = a5;
  memset(&v31, 0, sizeof(v31));
  v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  lhs = v30;
  rhs = *(CMTime *)a6;
  CMTimeSubtract(&v31, &lhs, &rhs);
  time = v31;
  if (CMTimeGetSeconds(&time) > 0.300000012)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v20;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v10)
    {
      v22 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v36[0] = CFSTR("petsBounds");
          objc_msgSend(v12, "bound");
          NSStringFromRect(v40);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = v13;
          v36[1] = CFSTR("petsConfidence");
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "confidence");
          objc_msgSend(v14, "numberWithFloat:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          lhs = (CMTime)*a6;
          v34[0] = CFSTR("start");
          v17 = CMTimeCopyAsDictionary(&lhs, 0);
          v35[0] = v17;
          v34[1] = CFSTR("duration");
          lhs = v31;
          v18 = CMTimeCopyAsDictionary(&lhs, 0);
          v34[2] = CFSTR("attributes");
          v35[1] = v18;
          v35[2] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v19);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      }
      while (v10);
    }

  }
}

- (int)finishAnalysisPass:(id *)a3
{
  __int128 v5;
  NSArray *petsActiveRegions;
  NSMutableArray *petsDetections;
  NSArray *v8;
  NSArray *v9;
  __int128 v10;
  NSArray *petsFaceActiveRegions;
  NSMutableArray *petsFaceDetections;
  NSArray *v13;
  NSArray *v14;
  __int128 v16;
  int64_t v17;
  _OWORD v18[3];
  __int128 v19;
  int64_t epoch;
  _OWORD v21[3];

  if (-[NSArray count](self->_petsActiveRegions, "count"))
  {
    v5 = *(_OWORD *)&a3->var0.var3;
    v21[0] = *(_OWORD *)&a3->var0.var0;
    v21[1] = v5;
    petsActiveRegions = self->_petsActiveRegions;
    v21[2] = *(_OWORD *)&a3->var1.var1;
    petsDetections = self->_petsDetections;
    v19 = *(_OWORD *)&self->_petsStart.value;
    epoch = self->_petsStart.epoch;
    -[VCPVideoPetsAnalyzer addDetectionToDict:withActiveRegions:forPetsDetections:fromTime:](self, "addDetectionToDict:withActiveRegions:forPetsDetections:fromTime:", v21, petsActiveRegions, petsDetections, &v19);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_petsActiveRegions;
    self->_petsActiveRegions = v8;

  }
  if (-[NSArray count](self->_petsFaceActiveRegions, "count"))
  {
    v10 = *(_OWORD *)&a3->var0.var3;
    v18[0] = *(_OWORD *)&a3->var0.var0;
    v18[1] = v10;
    petsFaceActiveRegions = self->_petsFaceActiveRegions;
    v18[2] = *(_OWORD *)&a3->var1.var1;
    petsFaceDetections = self->_petsFaceDetections;
    v16 = *(_OWORD *)&self->_petsFaceStart.value;
    v17 = self->_petsFaceStart.epoch;
    -[VCPVideoPetsAnalyzer addDetectionToDict:withActiveRegions:forPetsDetections:fromTime:](self, "addDetectionToDict:withActiveRegions:forPetsDetections:fromTime:", v18, petsFaceActiveRegions, petsFaceDetections, &v16);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_petsFaceActiveRegions;
    self->_petsFaceActiveRegions = v13;

  }
  return 0;
}

- (id)results
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_petsDetections, "count"))
    objc_msgSend(v3, "setValue:forKey:", self->_petsDetections, CFSTR("PetsResults"));
  if (-[NSMutableArray count](self->_petsFaceDetections, "count"))
    objc_msgSend(v3, "setValue:forKey:", self->_petsFaceDetections, CFSTR("PetsFaceResults"));
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petsFaceActiveRegions, 0);
  objc_storeStrong((id *)&self->_petsActiveRegions, 0);
  objc_storeStrong((id *)&self->_petsAnalyer, 0);
  objc_storeStrong((id *)&self->_petsFaceDetections, 0);
  objc_storeStrong((id *)&self->_petsDetections, 0);
}

@end
