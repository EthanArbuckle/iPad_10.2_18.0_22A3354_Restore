@implementation AVMutableVideoComposition

+ (AVMutableVideoComposition)videoComposition
{
  return objc_alloc_init(AVMutableVideoComposition);
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset
{
  return (AVMutableVideoComposition *)(id)-[AVMutableVideoComposition mutableCopy](+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:prototypeInstruction:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:prototypeInstruction:", asset, 0), "mutableCopy");
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke;
  v4[3] = &unk_1E3032730;
  v4[4] = completionHandler;
  +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:prototypeInstruction:completionHandler:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:prototypeInstruction:completionHandler:", asset, 0, v4);
}

uint64_t __85__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (id)objc_msgSend(a2, "mutableCopy"), a3);
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4
{
  return 0;
}

+ (AVMutableVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction
{
  NSArray *v6;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  const __CFAllocator *v16;
  float v17;
  _OWORD *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  float v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CFDictionaryRef v33;
  CFDictionaryRef v34;
  void *v35;
  CFDictionaryRef v36;
  CFDictionaryRef v37;
  AVMutableVideoComposition *v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CMTimeFlags flags;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  const __CFDictionary *v48;
  void *v49;
  AVMutableVideoCompositionInstruction *v50;
  AVMutableVideoCompositionInstruction *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  AVMutableVideoCompositionLayerInstruction *v58;
  void *v59;
  AVMutableVideoCompositionInstruction *v60;
  AVMutableVideoCompositionInstruction *v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v67;
  AVAsset *v68;
  uint64_t v69;
  AVVideoCompositionInstruction *v70;
  void *v71;
  uint64_t v72;
  id obj;
  uint64_t v74;
  AVMutableVideoCompositionInstruction *v75;
  CGFloat rect;
  uint64_t recta;
  CMTimeRange v78;
  CMTime v79;
  CMTimeRange v80;
  CMTimeRange v81;
  CMTime time2;
  CGAffineTransform rhs;
  CGAffineTransform t1;
  CGAffineTransform time;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CMTimeRange v89;
  CMTimeRange range;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  CMTimeRange v95;
  CMTime duration;
  CMTimeRange v97;
  CMTime time1;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  CMTime v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  CGAffineTransform v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  CGFloat v126;
  CMTimeScale timescale;
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v130 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v68 = asset;
  v6 = -[AVAsset tracksWithMediaType:](asset, "tracksWithMediaType:", CFSTR("vide"));
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[NSArray sortedArrayUsingFunction:context:](v6, "sortedArrayUsingFunction:context:", trackLayerSort, 0);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  v70 = prototypeInstruction;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v121;
    rect = y;
    v15 = x;
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v17 = 0.0;
    v18 = (_OWORD *)MEMORY[0x1E0CA2E40];
    v67 = *(_QWORD *)v121;
    while (2)
    {
      v19 = 0;
      v74 = v13;
      do
      {
        if (*(_QWORD *)v121 != v14)
          objc_enumerationMutation(v11);
        v20 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v19);
        if (objc_msgSend(v20, "isEnabled"))
        {
          v21 = v18[1];
          *(_OWORD *)&v119.a = *v18;
          *(_OWORD *)&v119.c = v21;
          *(_OWORD *)&v119.tx = v18[2];
          objc_msgSend(v20, "nominalFrameRate");
          if (v22 > v17)
            v17 = v22;
          objc_msgSend(v20, "naturalSize");
          v24 = v23;
          v26 = v25;
          if (v20)
            objc_msgSend(v20, "preferredTransform");
          else
            memset(&v118, 0, sizeof(v118));
          v131.origin.x = v15;
          v131.origin.y = rect;
          v131.size.width = v24;
          v131.size.height = v26;
          v136 = CGRectApplyAffineTransform(v131, &v118);
          v132.origin.x = x;
          v132.origin.y = y;
          v132.size.width = width;
          v132.size.height = height;
          v133 = CGRectUnion(v132, v136);
          x = v133.origin.x;
          y = v133.origin.y;
          width = v133.size.width;
          height = v133.size.height;
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v27 = (void *)objc_msgSend(v20, "segments");
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v115;
LABEL_14:
            v31 = 0;
            while (1)
            {
              if (*(_QWORD *)v115 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v31);
              if (v32)
              {
                objc_msgSend(v32, "timeMapping");
              }
              else
              {
                v113 = 0u;
                v112 = 0u;
                v111 = 0u;
                v109 = 0u;
                v110 = 0u;
                v108 = 0u;
              }
              *(_OWORD *)&time.a = v111;
              *(_QWORD *)&time.c = v112;
              v33 = CMTimeCopyAsDictionary((CMTime *)&time, v16);
              if (!v33)
                return 0;
              v34 = v33;
              objc_msgSend(obj, "addObject:", v33);
              CFRelease(v34);
              if (v29 == ++v31)
              {
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
                if (v29)
                  goto LABEL_14;
                break;
              }
            }
          }
          v35 = (void *)objc_msgSend((id)objc_msgSend(v20, "segments"), "lastObject");
          if (v35)
          {
            objc_msgSend(v35, "timeMapping");
          }
          else
          {
            v106 = 0u;
            memset(&v107, 0, sizeof(v107));
            v104 = 0u;
            v105 = 0u;
          }
          v119 = v107;
          *(_OWORD *)&time.a = *(_OWORD *)&v107.a;
          time.c = v107.c;
          *(_OWORD *)&rhs.a = *(_OWORD *)&v107.d;
          rhs.c = v107.ty;
          CMTimeAdd(&v103, (CMTime *)&time, (CMTime *)&rhs);
          v36 = CMTimeCopyAsDictionary(&v103, v16);
          if (!v36)
            return 0;
          v37 = v36;
          objc_msgSend(obj, "addObject:", v36);
          CFRelease(v37);
          prototypeInstruction = v70;
          v14 = v67;
          v13 = v74;
          v18 = (_OWORD *)MEMORY[0x1E0CA2E40];
        }
        ++v19;
      }
      while (v19 != v13);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0.0;
  }
  v134.origin.x = x;
  v134.origin.y = y;
  v134.size.width = width;
  v134.size.height = height;
  v135 = CGRectStandardize(v134);
  v39 = v135.size.width;
  v40 = v135.size.height;
  memset(&v119, 0, sizeof(v119));
  CGAffineTransformMakeTranslation(&v119, -v135.origin.x, -v135.origin.y);
  objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_12);
  v41 = MEMORY[0x1E0CA2E18];
  v126 = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
  if (v42)
  {
    v43 = v42;
    flags = *(_DWORD *)(v41 + 12);
    v45 = *(double *)(v41 + 16);
    v46 = *(_QWORD *)v100;
    v69 = *(_QWORD *)v100;
    do
    {
      v47 = 0;
      v72 = v43;
      do
      {
        if (*(_QWORD *)v100 != v46)
          objc_enumerationMutation(obj);
        v48 = *(const __CFDictionary **)(*((_QWORD *)&v99 + 1) + 8 * v47);
        memset(&time1, 0, sizeof(time1));
        CMTimeMakeFromDictionary(&time1, v48);
        time.a = v126;
        *(_QWORD *)&time.b = __PAIR64__(flags, timescale);
        time.c = v45;
        *(_OWORD *)&rhs.a = *(_OWORD *)&time1.value;
        *(_QWORD *)&rhs.c = time1.epoch;
        if (CMTimeCompare((CMTime *)&time, (CMTime *)&rhs))
        {
          if ((flags & 1) != 0)
          {
            v49 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            recta = v47;
            if (prototypeInstruction && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              v50 = (AVMutableVideoCompositionInstruction *)(id)-[AVVideoCompositionInstruction mutableCopy](prototypeInstruction, "mutableCopy");
            else
              v50 = +[AVMutableVideoCompositionInstruction videoCompositionInstruction](AVMutableVideoCompositionInstruction, "videoCompositionInstruction");
            v51 = v50;
            *(_OWORD *)&time.a = *(_OWORD *)&time1.value;
            *(_QWORD *)&time.c = time1.epoch;
            rhs.a = v126;
            *(_QWORD *)&rhs.b = __PAIR64__(flags, timescale);
            rhs.c = v45;
            CMTimeSubtract(&duration, (CMTime *)&time, (CMTime *)&rhs);
            time.a = v126;
            *(_QWORD *)&time.b = __PAIR64__(flags, timescale);
            time.c = v45;
            CMTimeRangeMake(&v97, (CMTime *)&time, &duration);
            v95 = v97;
            v75 = v51;
            -[AVMutableVideoCompositionInstruction setTimeRange:](v51, "setTimeRange:", &v95);
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v52 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v124, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v92;
              do
              {
                for (i = 0; i != v53; ++i)
                {
                  if (*(_QWORD *)v92 != v54)
                    objc_enumerationMutation(v11);
                  v56 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                  if (objc_msgSend(v56, "isEnabled"))
                  {
                    time.a = v126;
                    *(_QWORD *)&time.b = __PAIR64__(flags, timescale);
                    time.c = v45;
                    v57 = (void *)objc_msgSend(v56, "segmentForTrackTime:", &time);
                    if ((objc_msgSend(v57, "isEmpty") & 1) == 0)
                    {
                      if (v57)
                      {
                        objc_msgSend(v57, "timeMapping");
                      }
                      else
                      {
                        v88 = 0u;
                        memset(&v89, 0, sizeof(v89));
                        v86 = 0u;
                        v87 = 0u;
                      }
                      range = v89;
                      time.a = v126;
                      *(_QWORD *)&time.b = __PAIR64__(flags, timescale);
                      time.c = v45;
                      if (CMTimeRangeContainsTime(&range, (CMTime *)&time))
                      {
                        memset(&time, 0, sizeof(time));
                        if (v56)
                          objc_msgSend(v56, "preferredTransform");
                        else
                          memset(&t1, 0, sizeof(t1));
                        rhs = v119;
                        CGAffineTransformConcat(&time, &t1, &rhs);
                        v58 = +[AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:](AVMutableVideoCompositionLayerInstruction, "videoCompositionLayerInstructionWithAssetTrack:", v56);
                        rhs = time;
                        *(CGFloat *)&time2.value = v126;
                        time2.timescale = timescale;
                        time2.flags = flags;
                        *(CGFloat *)&time2.epoch = v45;
                        -[AVMutableVideoCompositionLayerInstruction setTransform:atTime:](v58, "setTransform:atTime:", &rhs, &time2);
                        objc_msgSend(v49, "addObject:", v58);
                      }
                    }
                  }
                }
                v53 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v124, 16);
              }
              while (v53);
            }
            -[AVMutableVideoCompositionInstruction setLayerInstructions:](v75, "setLayerInstructions:", v49);
            objc_msgSend(v71, "addObject:", v75);
            v46 = v69;
            prototypeInstruction = v70;
            v43 = v72;
            v47 = recta;
          }
          v126 = *(double *)&time1.value;
          flags = time1.flags;
          timescale = time1.timescale;
          v45 = *(double *)&time1.epoch;
        }
        ++v47;
      }
      while (v47 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
    }
    while (v43);
  }
  v59 = (void *)objc_msgSend(v71, "lastObject");
  memset(&time, 0, 24);
  if (v59)
    objc_msgSend(v59, "timeRange");
  else
    memset(&v81, 0, sizeof(v81));
  CMTimeRangeGetEnd((CMTime *)&time, &v81);
  memset(&rhs, 0, 24);
  if (v68)
    -[AVAsset duration](v68, "duration");
  *(_OWORD *)&time1.value = *(_OWORD *)&rhs.a;
  time1.epoch = *(_QWORD *)&rhs.c;
  *(_OWORD *)&time2.value = *(_OWORD *)&time.a;
  time2.epoch = *(_QWORD *)&time.c;
  if (CMTimeCompare(&time1, &time2) >= 1)
  {
    if (prototypeInstruction && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v60 = (AVMutableVideoCompositionInstruction *)(id)-[AVVideoCompositionInstruction mutableCopy](prototypeInstruction, "mutableCopy");
    else
      v60 = +[AVMutableVideoCompositionInstruction videoCompositionInstruction](AVMutableVideoCompositionInstruction, "videoCompositionInstruction");
    v61 = v60;
    *(_OWORD *)&time1.value = *(_OWORD *)&rhs.a;
    time1.epoch = *(_QWORD *)&rhs.c;
    *(_OWORD *)&time2.value = *(_OWORD *)&time.a;
    time2.epoch = *(_QWORD *)&time.c;
    CMTimeSubtract(&v79, &time1, &time2);
    *(_OWORD *)&time1.value = *(_OWORD *)&time.a;
    time1.epoch = *(_QWORD *)&time.c;
    CMTimeRangeMake(&v80, &time1, &v79);
    v78 = v80;
    -[AVMutableVideoCompositionInstruction setTimeRange:](v61, "setTimeRange:", &v78);
    objc_msgSend(v71, "addObject:", v61);
  }
  v38 = +[AVMutableVideoComposition videoComposition](AVMutableVideoComposition, "videoComposition");
  if (-[NSArray count](v11, "count") == 1)
    v63 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0), "trackID");
  else
    v63 = 0;
  *(float *)&v62 = v17;
  -[AVVideoComposition _setFrameDurationForFrameRate:sourceTrackIDForFrameTiming:](v38, "_setFrameDurationForFrameRate:sourceTrackIDForFrameTiming:", v63, v62);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVAsset naturalSize](v68, "naturalSize");
    v39 = v64;
    v40 = v65;
  }
  -[AVMutableVideoComposition setRenderSize:](v38, "setRenderSize:", v39, v40);
  -[AVMutableVideoComposition setInstructions:](v38, "setInstructions:", v71);
  return v38;
}

uint64_t __88__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction___block_invoke(int a1, CFDictionaryRef dictionaryRepresentation, const __CFDictionary *a3)
{
  CMTime v5;
  CMTime time1;
  CMTime v7;
  CMTime v8;

  memset(&v8, 0, sizeof(v8));
  CMTimeMakeFromDictionary(&v8, dictionaryRepresentation);
  memset(&v7, 0, sizeof(v7));
  CMTimeMakeFromDictionary(&v7, a3);
  time1 = v8;
  v5 = v7;
  if (CMTimeCompare(&time1, &v5) > 0)
    return 1;
  time1 = v8;
  v5 = v7;
  return (uint64_t)CMTimeCompare(&time1, &v5) >> 31;
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset prototypeInstruction:(AVVideoCompositionInstruction *)prototypeInstruction completionHandler:(void *)completionHandler
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction_completionHandler___block_invoke;
  v5[3] = &unk_1E3030ED8;
  v5[4] = a1;
  v5[5] = asset;
  v5[6] = prototypeInstruction;
  v5[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1E3093B80, (uint64_t)v5);
}

uint64_t __106__AVMutableVideoComposition_videoCompositionWithPropertiesOfAsset_prototypeInstruction_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "videoCompositionWithPropertiesOfAsset:prototypeInstruction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)builtInCompositorName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition builtInCompositorName](&v3, sel_builtInCompositorName);
}

- (void)setBuiltInCompositorName:(id)a3
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if ((objc_msgSend(a3, "isEqual:", -[AVVideoComposition builtInCompositorName](&v6, sel_builtInCompositorName)) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setBuiltInCompositorName:](&v5, sel_setBuiltInCompositorName_, a3);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (id)customVideoCompositorClass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition customVideoCompositorClass](&v3, sel_customVideoCompositorClass);
}

- (void)setCustomVideoCompositorClass:(id)customVideoCompositorClass
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition customVideoCompositorClass](&v6, sel_customVideoCompositorClass) != customVideoCompositorClass)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setCustomVideoCompositorClass:](&v5, sel_setCustomVideoCompositorClass_, customVideoCompositorClass);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (CMTime)frameDuration
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  return (CMTime *)-[CMTime frameDuration](&v4, sel_frameDuration);
}

- (void)setFrameDuration:(CMTime *)frameDuration
{
  objc_super v5;
  CMTime time1;
  objc_super v7;
  CMTime time2;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition frameDuration](&v7, sel_frameDuration);
  time1 = *frameDuration;
  if (CMTimeCompare(&time1, &time2))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    time1 = *frameDuration;
    -[AVVideoComposition setFrameDuration:](&v5, sel_setFrameDuration_, &time1);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition sourceTrackIDForFrameTiming](&v3, sel_sourceTrackIDForFrameTiming);
}

- (void)setSourceTrackIDForFrameTiming:(CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  uint64_t v3;
  objc_super v5;
  objc_super v6;

  v3 = *(_QWORD *)&sourceTrackIDForFrameTiming;
  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition sourceTrackIDForFrameTiming](&v6, sel_sourceTrackIDForFrameTiming) != sourceTrackIDForFrameTiming)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setSourceTrackIDForFrameTiming:](&v5, sel_setSourceTrackIDForFrameTiming_, v3);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (CGSize)renderSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition renderSize](&v4, sel_renderSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRenderSize:(CGSize)renderSize
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;
  objc_super v10;

  height = renderSize.height;
  width = renderSize.width;
  v10.receiver = self;
  v10.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition renderSize](&v10, sel_renderSize);
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setRenderSize:](&v9, sel_setRenderSize_, width, height);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (float)renderScale
{
  float result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition renderScale](&v3, sel_renderScale);
  return result;
}

- (void)setRenderScale:(float)renderScale
{
  double v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition renderScale](&v7, sel_renderScale);
  if (*(float *)&v5 != renderScale)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMutableVideoComposition;
    *(float *)&v5 = renderScale;
    -[AVVideoComposition setRenderScale:](&v6, sel_setRenderScale_, v5);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (NSArray)instructions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition instructions](&v3, sel_instructions);
}

- (void)setInstructions:(NSArray *)instructions
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition setInstructions:](&v4, sel_setInstructions_, instructions);
  -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
}

- (AVVideoCompositionCoreAnimationTool)animationTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition animationTool](&v3, sel_animationTool);
}

- (void)setAnimationTool:(AVVideoCompositionCoreAnimationTool *)animationTool
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition setAnimationTool:](&v4, sel_setAnimationTool_, animationTool);
  -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
}

- (NSArray)sourceSampleDataTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition sourceSampleDataTrackIDs](&v3, sel_sourceSampleDataTrackIDs);
}

- (void)setSourceSampleDataTrackIDs:(NSArray *)sourceSampleDataTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition setSourceSampleDataTrackIDs:](&v3, sel_setSourceSampleDataTrackIDs_, sourceSampleDataTrackIDs);
}

- (id)sourceVideoTrackWindowsForTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition sourceVideoTrackWindowsForTrackIDs](&v3, sel_sourceVideoTrackWindowsForTrackIDs);
}

- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition setSourceVideoTrackWindowsForTrackIDs:](&v3, sel_setSourceVideoTrackWindowsForTrackIDs_, a3);
}

- (id)sourceSampleDataTrackWindowsForTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition sourceSampleDataTrackWindowsForTrackIDs](&v3, sel_sourceSampleDataTrackWindowsForTrackIDs);
}

- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  -[AVVideoComposition setSourceSampleDataTrackWindowsForTrackIDs:](&v3, sel_setSourceSampleDataTrackWindowsForTrackIDs_, a3);
}

- (NSString)colorPrimaries
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition colorPrimaries](&v3, sel_colorPrimaries);
}

- (void)setColorPrimaries:(NSString *)colorPrimaries
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition colorPrimaries](&v6, sel_colorPrimaries) != colorPrimaries)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setColorPrimaries:](&v5, sel_setColorPrimaries_, colorPrimaries);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (NSString)colorYCbCrMatrix
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition colorYCbCrMatrix](&v3, sel_colorYCbCrMatrix);
}

- (void)setColorYCbCrMatrix:(NSString *)colorYCbCrMatrix
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition colorYCbCrMatrix](&v6, sel_colorYCbCrMatrix) != colorYCbCrMatrix)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setColorYCbCrMatrix:](&v5, sel_setColorYCbCrMatrix_, colorYCbCrMatrix);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (NSString)colorTransferFunction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition colorTransferFunction](&v3, sel_colorTransferFunction);
}

- (void)setColorTransferFunction:(NSString *)colorTransferFunction
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition colorTransferFunction](&v6, sel_colorTransferFunction) != colorTransferFunction)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setColorTransferFunction:](&v5, sel_setColorTransferFunction_, colorTransferFunction);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoComposition;
  return -[AVVideoComposition perFrameHDRDisplayMetadataPolicy](&v3, sel_perFrameHDRDisplayMetadataPolicy);
}

- (void)setPerFrameHDRDisplayMetadataPolicy:(AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMutableVideoComposition;
  if (-[AVVideoComposition perFrameHDRDisplayMetadataPolicy](&v6, sel_perFrameHDRDisplayMetadataPolicy) != perFrameHDRDisplayMetadataPolicy)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMutableVideoComposition;
    -[AVVideoComposition setPerFrameHDRDisplayMetadataPolicy:](&v5, sel_setPerFrameHDRDisplayMetadataPolicy_, perFrameHDRDisplayMetadataPolicy);
    -[AVVideoComposition _bumpChangeSeed](self, "_bumpChangeSeed");
  }
}

+ (AVMutableVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  objc_super v13;

  if (!asset)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "asset";
    goto LABEL_6;
  }
  if (!applier)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "handler";
LABEL_6:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)applier, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___AVMutableVideoComposition;
  return (AVMutableVideoComposition *)objc_msgSendSuper2(&v13, sel__mutableVideoCompositionWithAsset_applyingCIFiltersWithHandler_);
}

+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  _QWORD v12[8];

  if (!asset)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "asset != nil";
    goto LABEL_8;
  }
  if (!applier)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "applier != nil";
    goto LABEL_8;
  }
  if (!completionHandler)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "completionHandler != nil";
LABEL_8:
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)applier, (uint64_t)completionHandler, v5, v6, v7, (uint64_t)v10), 0);
    objc_exception_throw(v11);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __131__AVMutableVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E3032708;
  v12[4] = a1;
  v12[5] = asset;
  v12[6] = applier;
  v12[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1E3093B98, (uint64_t)v12);
}

uint64_t __131__AVMutableVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "videoCompositionWithAsset:applyingCIFiltersWithHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
