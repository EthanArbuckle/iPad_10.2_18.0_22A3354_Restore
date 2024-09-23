@implementation VCPVideoSaliencyAnalyzer

- (VCPVideoSaliencyAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  VCPVideoSaliencyAnalyzer *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VCPVideoSaliencyAnalyzer;
  v3 = -[VCPVideoSaliencyAnalyzer init](&v23, sel_init, a3);
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

    v8 = (__int128 *)MEMORY[0x1E0CA2E28];
    v9 = *MEMORY[0x1E0CA2E28];
    *((_QWORD *)v3 + 5) = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v3 + 24) = v9;
    v10 = *v8;
    *((_QWORD *)v3 + 8) = *((_QWORD *)v8 + 2);
    *((_OWORD *)v3 + 3) = v10;
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v3 + 72) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v3 + 11) = v11;
    +[VCPImageSaliencyAnalyzer analyzerWith:prune:](VCPImageSaliencyAnalyzer, "analyzerWith:prune:", 3, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = v12;

    v14 = (void *)*((_QWORD *)v3 + 12);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)*((_QWORD *)v3 + 13);
      *((_QWORD *)v3 + 13) = v15;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v3 + 14);
      *((_QWORD *)v3 + 14) = v17;

      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)*((_QWORD *)v3 + 15);
      *((_QWORD *)v3 + 15) = v19;

      v14 = v3;
    }
    v21 = v14;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (float)updateConfidence:(float)a3 prevBound:(CGRect)a4 newBound:(CGRect)a5 width:(int)a6 height:(int)a7
{
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  BOOL v14;
  float result;

  v8 = a4.origin.x + a4.size.width * 0.5;
  v9 = a4.origin.y + a4.size.height * 0.5;
  v10 = a5.origin.x + a5.size.width * 0.5;
  v11 = a5.origin.y + a5.size.height * 0.5;
  v12 = expf((float)((float)((float)((float)((float)(v11 - (float)((float)a7 * 0.5))* (float)(v11 - (float)((float)a7 * 0.5)))+ (float)((float)(v10 - (float)((float)a6 * 0.5))* (float)(v10 - (float)((float)a6 * 0.5))))- (float)((float)((float)(v9 - (float)((float)a7 * 0.5)) * (float)(v9 - (float)((float)a7 * 0.5)))+ (float)((float)(v8 - (float)((float)a6 * 0.5)) * (float)(v8 - (float)((float)a6 * 0.5)))))* -2.0)/ (float)(a6 * a6 + a7 * a7))* a3;
  v13 = 1.0;
  if (v12 < 1.0)
    v13 = v12;
  v14 = v12 > 0.0;
  result = 0.0;
  if (v14)
    return v13;
  return result;
}

- (BOOL)isOutOfBoundary:(CGRect)a3
{
  float v3;
  float v4;
  float v5;

  v3 = a3.origin.x + a3.size.width * 0.5;
  v4 = a3.origin.y + a3.size.height * 0.5;
  if (v4 >= v3)
    v5 = v3;
  else
    v5 = v4;
  if (v3 < v4)
    v3 = v4;
  return v3 > 0.9 || v5 < 0.1;
}

- (id)pruneRegions:(id)a3 withOverlapRatio:(float)a4
{
  void *v4;
  unint64_t v5;
  double *v6;
  unsigned int v7;
  double y;
  double width;
  double height;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  float v17;
  float v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  float v29;
  VCPSaliencyRegion *v30;
  double v31;
  VCPSaliencyRegion *v32;
  id v34;
  id v35;
  float v37;
  float v38;
  double rect[5];
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = (double *)MEMORY[0x1E0C9D648];
  while (objc_msgSend(v35, "count") > v5)
  {
    if (v5 >= 2)
      v7 = 2;
    else
      v7 = v5;
    v38 = kConfidenceThresh[v7];
    y = v6[1];
    rect[0] = *v6;
    width = v6[2];
    height = v6[3];
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    memset(&rect[1], 0, 32);
    objc_msgSend(v4, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &rect[1], v42, 16);
    if (v13)
    {
      v14 = **(_QWORD **)&rect[3];
      v37 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (**(_QWORD **)&rect[3] != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*(_QWORD *)&rect[2] + 8 * i);
          objc_msgSend(v16, "confidence");
          v18 = v17;
          if (v17 > v38)
          {
            objc_msgSend(v16, "bound");
            v20 = v19;
            v22 = v21;
            v24 = v23;
            v26 = v25;
            v44.origin.x = rect[0];
            v44.origin.y = y;
            v44.size.width = width;
            v44.size.height = height;
            if (CGRectIsEmpty(v44))
            {
              objc_msgSend(v11, "addObject:", v16);
              v37 = v18;
              rect[0] = v20;
              y = v22;
              width = v24;
              height = v26;
            }
            else
            {
              v45.origin.x = rect[0];
              v45.origin.y = y;
              v45.size.width = width;
              v45.size.height = height;
              v51.origin.x = v20;
              v51.origin.y = v22;
              v51.size.width = v24;
              v51.size.height = v26;
              if (CGRectIntersectsRect(v45, v51))
              {
                v46.origin.x = rect[0];
                v46.origin.y = y;
                v46.size.width = width;
                v46.size.height = height;
                v52.origin.x = v20;
                v52.origin.y = v22;
                v52.size.width = v24;
                v52.size.height = v26;
                v47 = CGRectIntersection(v46, v52);
                v27 = width * height;
                if (v24 * v26 < width * height)
                  v27 = v24 * v26;
                v28 = v27;
                if (v47.size.width * v47.size.height > (float)(v28 * a4))
                {
                  v48.origin.x = rect[0];
                  v48.origin.y = y;
                  v48.size.width = width;
                  v48.size.height = height;
                  v53.origin.x = v20;
                  v53.origin.y = v22;
                  v53.size.width = v24;
                  v53.size.height = v26;
                  v49 = CGRectUnion(v48, v53);
                  rect[0] = v49.origin.x;
                  y = v49.origin.y;
                  width = v49.size.width;
                  height = v49.size.height;
                  v29 = v37;
                  if (v37 < v18)
                    v29 = v18;
                  v37 = v29;
                  objc_msgSend(v11, "addObject:", v16);
                }
              }
            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &rect[1], v42, 16);
      }
      while (v13);
    }
    else
    {
      v37 = 0.0;
    }

    v50.origin.x = rect[0];
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    if (!CGRectIsEmpty(v50))
    {
      v30 = [VCPSaliencyRegion alloc];
      *(float *)&v31 = v37;
      v32 = -[VCPSaliencyRegion initWith:confidence:](v30, "initWith:confidence:", rect[0], y, width, height, v31);
      if (!v32)
        goto LABEL_30;
      objc_msgSend(v34, "addObject:", v32);

    }
    objc_msgSend(v4, "removeObjectsInArray:", v11);
    if (!objc_msgSend(v4, "count"))
    {
LABEL_30:

      break;
    }

    ++v5;
  }

  return v34;
}

- (float)boundDistance:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5
{
  float v5;

  if (!a5)
    return 0.0;
  v5 = a3.origin.x + a3.size.width * 0.5 - (a4.origin.x + a4.size.width * 0.5);
  return fabsf(v5);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLastTracking;
  void *v7;
  int v8;
  int Width;
  VCPVideoSaliencyAnalyzer *v10;
  void *v11;
  float v12;
  NSMutableDictionary *trackers;
  id v14;
  id v15;
  __int128 v16;
  double v17;
  void *v18;
  VCPVideoSaliencyAnalyzer *v19;
  int64_t v20;
  CMTime *p_start;
  VCPImageSaliencyAnalyzer *saliencyAnalyer;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSString *v31;
  void *v32;
  int v33;
  int v34;
  VCPSaliencyRegion *v35;
  double v36;
  VCPSaliencyRegion *v37;
  VCPVideoSaliencyAnalyzer *v38;
  double v39;
  void *v40;
  uint64_t v41;
  int v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  double x;
  double y;
  double v53;
  double v54;
  VCPVideoObjectTracker *v55;
  VCPVideoObjectTracker *v56;
  NSMutableDictionary *v57;
  void *v58;
  NSMutableDictionary *confidences;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSMutableArray *detections;
  CFDictionaryRef v72;
  CFDictionaryRef v73;
  void *v74;
  NSArray *v75;
  NSArray *activeRegions;
  __int128 v77;
  void *v79;
  void *context;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id obj;
  NSArray *v86;
  id v87;
  int Height;
  uint64_t v89;
  CVPixelBufferRef pixelBuffera;
  CMTime *v93;
  CMTime v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  CMTime v99;
  __int128 v100;
  CMTimeEpoch epoch;
  CGAffineTransform v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  CMTime v112;
  _QWORD v113[5];
  id v114;
  id v115;
  __CVBuffer *v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  __int128 v121;
  int v122;
  int v123;
  __int128 v124;
  uint64_t v125;
  CMTime v126;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[2];
  _QWORD v133[2];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;
  NSRect v138;
  CGRect v139;
  CGRect v140;
  NSRect v141;

  v137 = *MEMORY[0x1E0C80C00];
  v93 = (CMTime *)a4;
  p_timeLastTracking = &self->_timeLastTracking;
  lhs = *(CMTime *)a4;
  rhs = (CMTime)self->_timeLastTracking;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 0.200000003
    || (lhs = *v93,
        rhs = (CMTime)self->_timeLastDetection,
        CMTimeSubtract(&v126, &lhs, &rhs),
        CMTimeGetSeconds(&v126) >= 1.0))
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    context = (void *)MEMORY[0x1BCCA1B2C]();
    v125 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (float)Width;
    trackers = self->_trackers;
    v119 = 0;
    v118 = 0;
    v124 = 0uLL;
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke;
    v113[3] = &unk_1E6B16F30;
    v117 = (float)(1.0 / (float)Width);
    v120 = (float)(-1.0 / (float)Height);
    v121 = xmmword_1B6FBD470;
    v116 = a3;
    v113[4] = self;
    v14 = v11;
    v114 = v14;
    v122 = Width;
    v123 = Height;
    v15 = v82;
    v115 = v15;
    v81 = v14;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trackers, "enumerateKeysAndObjectsUsingBlock:", v113);
    v16 = *(_OWORD *)&v93->value;
    p_timeLastTracking->epoch = v93->epoch;
    *(_OWORD *)&p_timeLastTracking->value = v16;
    -[NSMutableDictionary removeObjectsForKeys:](self->_trackers, "removeObjectsForKeys:", v14);
    lhs = *v93;
    rhs = (CMTime)self->_timeLastDetection;
    CMTimeSubtract(&v112, &lhs, &rhs);
    v79 = v15;
    if (CMTimeGetSeconds(&v112) >= 1.0)
    {
      -[NSMutableDictionary removeAllObjects](self->_trackers, "removeAllObjects");
      saliencyAnalyer = self->_saliencyAnalyer;
      v111 = 0;
      v8 = -[VCPImageSaliencyAnalyzer analyzePixelBuffer:flags:results:cancel:](saliencyAnalyer, "analyzePixelBuffer:flags:results:cancel:", a3, &v125, &v111, &__block_literal_global_24);
      v83 = v111;
      if (v8)
      {
LABEL_49:

        objc_autoreleasePoolPop(context);
        return v8;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v23, "arrayWithArray:", v24);

      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v108;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v108 != v28)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("saliencyBounds"));
            v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("saliencyConfidence"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "floatValue");
              v34 = v33;

              v35 = [VCPSaliencyRegion alloc];
              v138 = NSRectFromString(v31);
              LODWORD(v36) = v34;
              v37 = -[VCPSaliencyRegion initWith:confidence:](v35, "initWith:confidence:", v138.origin.x, v138.origin.y, v138.size.width, v138.size.height, v36);
              if (!v37)
              {

LABEL_45:
                v8 = -108;
                goto LABEL_48;
              }
              objc_msgSend(obj, "addObject:", v37);

            }
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
          if (v27)
            continue;
          break;
        }
      }

      objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_169);
      v38 = self;
      LODWORD(v39) = 0.5;
      -[VCPVideoSaliencyAnalyzer pruneRegions:withOverlapRatio:](self, "pruneRegions:withOverlapRatio:", obj, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v87 = v40;
      v41 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
      if (v41)
      {
        v42 = 0;
        v43 = v12;
        v44 = (float)-(float)Height;
        v45 = (double)Height;
        v89 = *(_QWORD *)v104;
LABEL_24:
        v46 = 0;
        if (v42 <= 4)
          v47 = 4;
        else
          v47 = v42;
        v48 = (v47 - v42);
        v49 = v42;
        while (1)
        {
          if (*(_QWORD *)v104 != v89)
            objc_enumerationMutation(v87);
          if (v48 == v46)
            break;
          v50 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v46);
          objc_msgSend(v50, "bound");
          *(_OWORD *)&v102.b = v124;
          v102.a = v43;
          v102.d = v44;
          v102.tx = 0.0;
          v102.ty = v45;
          v140 = CGRectApplyAffineTransform(v139, &v102);
          x = v140.origin.x;
          y = v140.origin.y;
          v53 = v140.size.width;
          v54 = v140.size.height;
          v55 = [VCPVideoObjectTracker alloc];
          v100 = *(_OWORD *)&v93->value;
          epoch = v93->epoch;
          v56 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v55, "initWithObjectBounds:inFrame:timestamp:", a3, &v100, x, y, v53, v54);
          if (!v56)
          {

            goto LABEL_45;
          }
          v57 = v38->_trackers;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v49 + v46);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v56, v58);

          confidences = self->_confidences;
          v60 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v50, "confidence");
          objc_msgSend(v60, "numberWithFloat:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v49 + v46);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](confidences, "setObject:forKey:", v61, v62);

          objc_msgSend(v84, "addObject:", v50);
          ++v46;
          v38 = self;
          if (v41 == v46)
          {
            v41 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
            v42 = v49 + v46;
            if (v41)
              goto LABEL_24;
            break;
          }
        }
      }

      v63 = *(_OWORD *)&v93->value;
      self->_timeLastDetection.epoch = v93->epoch;
      *(_OWORD *)&self->_timeLastDetection.value = v63;

      v10 = self;
    }
    else
    {
      objc_msgSend(v84, "addObjectsFromArray:", v15);
      v83 = 0;
    }
    LODWORD(v17) = 1045220557;
    -[VCPVideoSaliencyAnalyzer pruneRegions:withOverlapRatio:](v10, "pruneRegions:withOverlapRatio:", v84, v17);
    obj = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeAllObjects](v10->_latestRegions, "removeAllObjects");
    -[NSMutableArray addObjectsFromArray:](v10->_latestRegions, "addObjectsFromArray:", obj);
    v18 = (void *)objc_msgSend(obj, "copy");
    +[VCPSaliencyRegion attachSalientRegions:toPixelBuffer:](VCPSaliencyRegion, "attachSalientRegions:toPixelBuffer:", v18, a3);

    v19 = self;
    if (objc_msgSend(obj, "count") && !-[NSArray count](self->_activeRegions, "count"))
    {
      objc_storeStrong((id *)&self->_activeRegions, obj);
      v19 = self;
      v20 = v93->epoch;
      *(_OWORD *)&self->_start.value = *(_OWORD *)&v93->value;
      self->_start.epoch = v20;
    }
    p_start = (CMTime *)&v19->_start;
    lhs = *v93;
    rhs = (CMTime)v19->_start;
    CMTimeSubtract(&v99, &lhs, &rhs);
    if (CMTimeGetSeconds(&v99) >= 1.0)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v86 = v19->_activeRegions;
      v64 = -[NSArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v95, v134, 16);
      if (v64)
      {
        pixelBuffera = *(CVPixelBufferRef *)v96;
        do
        {
          for (j = 0; j != v64; ++j)
          {
            if (*(CVPixelBufferRef *)v96 != pixelBuffera)
              objc_enumerationMutation(v86);
            v66 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            v132[0] = CFSTR("saliencyBounds");
            objc_msgSend(v66, "bound");
            NSStringFromRect(v141);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v133[0] = v67;
            v132[1] = CFSTR("saliencyConfidence");
            v68 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v66, "confidence");
            objc_msgSend(v68, "numberWithFloat:");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v133[1] = v69;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            detections = self->_detections;
            v130[0] = CFSTR("start");
            lhs = *p_start;
            v72 = CMTimeCopyAsDictionary(&lhs, 0);
            v131[0] = v72;
            v130[1] = CFSTR("duration");
            lhs = *v93;
            rhs = *p_start;
            CMTimeSubtract(&v94, &lhs, &rhs);
            lhs = v94;
            v73 = CMTimeCopyAsDictionary(&lhs, 0);
            v130[2] = CFSTR("attributes");
            v131[1] = v73;
            v131[2] = v70;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 3);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](detections, "addObject:", v74);

          }
          v64 = -[NSArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v95, v134, 16);
        }
        while (v64);
      }

      if (objc_msgSend(obj, "count"))
      {
        v75 = (NSArray *)obj;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v75 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v93 = (CMTime *)MEMORY[0x1E0CA2E18];
      }
      activeRegions = self->_activeRegions;
      self->_activeRegions = v75;

      v8 = 0;
      v77 = *(_OWORD *)&v93->value;
      p_start->epoch = v93->epoch;
      *(_OWORD *)&p_start->value = v77;
    }
    else
    {
      v8 = 0;
    }
LABEL_48:

    goto LABEL_49;
  }
  v7 = (void *)-[NSMutableArray copy](self->_latestRegions, "copy");
  +[VCPSaliencyRegion attachSalientRegions:toPixelBuffer:](VCPSaliencyRegion, "attachSalientRegions:toPixelBuffer:", v7, a3);

  return 0;
}

void __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __int128 v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  id *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  VCPSaliencyRegion *v29;
  double v30;
  VCPSaliencyRegion *v31;
  double v32;
  int v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "trackObjectInFrame:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "objectBounds");
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v34.a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v34.c = v7;
  *(_OWORD *)&v34.tx = *(_OWORD *)(a1 + 96);
  v36 = CGRectApplyAffineTransform(v35, &v34);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  objc_msgSend(v6, "objectBounds");
  if (CGRectIsEmpty(v37)
    || (int)objc_msgSend(v6, "lostCount") > 10
    || objc_msgSend(*(id *)(a1 + 32), "isOutOfBoundary:", x, y, width, height))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(id **)(a1 + 32);
      objc_msgSend(v13[14], "objectForKeyedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v33 = v15;
      objc_msgSend(v6, "objectBoundsInitial");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v6, "objectBounds");
      v32 = v24;
      LODWORD(v24) = v33;
      objc_msgSend(v13, "updateConfidence:prevBound:newBound:width:height:", *(unsigned int *)(a1 + 112), *(unsigned int *)(a1 + 116), v24, v17, v19, v21, v23, *(_QWORD *)&v32, v25, v26, v27);
      LODWORD(v23) = v28;

      v29 = [VCPSaliencyRegion alloc];
      LODWORD(v30) = LODWORD(v23);
      v31 = -[VCPSaliencyRegion initWith:confidence:](v29, "initWith:confidence:", x, y, width, height, v30);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);

    }
  }

}

uint64_t __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke_2()
{
  return 0;
}

uint64_t __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v5, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (int)finishAnalysisPass:(id *)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *detections;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  void *v15;
  NSArray *v16;
  NSArray *activeRegions;
  NSArray *obj;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime time;
  CMTimeRange range;
  CMTime v28;
  CMTime v29;
  CMTime rhs;
  CMTime lhs;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;
  NSRect v38;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_activeRegions, "count"))
  {
    memset(&v29, 0, sizeof(v29));
    v4 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v4;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v28, &range);
    lhs = v28;
    rhs = (CMTime)self->_start;
    CMTimeSubtract(&v29, &lhs, &rhs);
    time = v29;
    if (CMTimeGetSeconds(&time) > 1.0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      obj = self->_activeRegions;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
      if (v5)
      {
        v20 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v23 != v20)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v34[0] = CFSTR("saliencyBounds");
            objc_msgSend(v7, "bound");
            NSStringFromRect(v38);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = v8;
            v34[1] = CFSTR("saliencyConfidence");
            v9 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v7, "confidence");
            objc_msgSend(v9, "numberWithFloat:");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            detections = self->_detections;
            lhs = (CMTime)self->_start;
            v32[0] = CFSTR("start");
            v13 = CMTimeCopyAsDictionary(&lhs, 0);
            v33[0] = v13;
            v32[1] = CFSTR("duration");
            lhs = v29;
            v14 = CMTimeCopyAsDictionary(&lhs, 0);
            v32[2] = CFSTR("attributes");
            v33[1] = v14;
            v33[2] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](detections, "addObject:", v15);

          }
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
        }
        while (v5);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    activeRegions = self->_activeRegions;
    self->_activeRegions = v16;

  }
  return 0;
}

- (id)results
{
  void *v3;
  NSMutableArray *detections;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray count](self->_detections, "count");
  if (v3)
  {
    detections = self->_detections;
    v6 = CFSTR("SaliencyResults");
    v7[0] = detections;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRegions, 0);
  objc_storeStrong((id *)&self->_confidences, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_saliencyAnalyer, 0);
  objc_storeStrong((id *)&self->_latestRegions, 0);
  objc_storeStrong((id *)&self->_detections, 0);
}

@end
