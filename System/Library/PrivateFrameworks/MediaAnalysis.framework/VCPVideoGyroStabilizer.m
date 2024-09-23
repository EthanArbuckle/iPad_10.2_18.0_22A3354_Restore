@implementation VCPVideoGyroStabilizer

- (VCPVideoGyroStabilizer)initWithMetadata:(id)a3 sourceSize:(CGSize)a4 cropRect:(CGRect)a5 stillImageMetadata:(id)a6 timeRange:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  id v17;
  id v18;
  VCPVideoGyroStabilizer *v19;
  VCPVideoGyroStabilizer *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *analysisDict;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v24;
  __int128 v25;
  VCPVideoGyroStabilizer *v26;
  VCPVideoGyroStabilizer *v27;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  _OWORD v33[3];
  objc_super v34;
  CGSize v35;
  CGRect v36;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4.height;
  v14 = a4.width;
  v17 = a3;
  v18 = a6;
  v34.receiver = self;
  v34.super_class = (Class)VCPVideoGyroStabilizer;
  v19 = -[VCPVideoStabilizer init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    -[VCPVideoStabilizer setGyroStabilization:](v19, "setGyroStabilization:", 1);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    analysisDict = v20->_analysisDict;
    v20->_analysisDict = v21;

    v35.width = v14;
    v35.height = v13;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v35);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20->_analysisDict, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D3AA38]);

    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v24 = CGRectCreateDictionaryRepresentation(v36);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20->_analysisDict, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D3AA28]);

    v20->_cropSize.width = width;
    v20->_cropSize.height = height;
    objc_storeStrong((id *)&v20->_metadata, a3);
    -[VCPVideoStabilizer setIsPathConstraintsStabilization:](v20, "setIsPathConstraintsStabilization:", objc_msgSend(v18, "count") != 0);
    -[VCPVideoStabilizer setStillImageMetadata:](v20, "setStillImageMetadata:", v18);
    -[VCPVideoStabilizer setCropRect:](v20, "setCropRect:", x, y, width, height);
    -[VCPVideoStabilizer setSourceSize:](v20, "setSourceSize:", v14, v13);
    v25 = *(_OWORD *)&a7->var0.var3;
    v33[0] = *(_OWORD *)&a7->var0.var0;
    v33[1] = v25;
    v33[2] = *(_OWORD *)&a7->var1.var1;
    -[VCPVideoStabilizer setTimeRange:](v20, "setTimeRange:", v33);
    if (-[VCPVideoStabilizer isPathConstraintsStabilization](v20, "isPathConstraintsStabilization"))
    {
      -[VCPVideoStabilizer timeRange](v20, "timeRange");
      if ((v32 & 1) == 0
        || (-[VCPVideoStabilizer timeRange](v20, "timeRange"), (v31 & 1) == 0)
        || (-[VCPVideoStabilizer timeRange](v20, "timeRange"), v30)
        || (-[VCPVideoStabilizer timeRange](v20, "timeRange"), v26 = v20, v29 < 0))
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = v20;
    }
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (int)convertAnalysisResult
{
  void *v3;
  void *v4;
  void *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  const __CFDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSPoint v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  const __CFDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CFDictionaryRef v45;
  const __CFDictionary *v46;
  const __CFDictionary *v47;
  void *v48;
  id v49;
  void *v50;
  NSString *v51;
  NSPoint v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  float v60;
  float v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  id v74;
  void *v75;
  void *v76;
  CFDictionaryRef v77;
  NSArray *obj;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  CMTimeRange range;
  CMTime v88;
  CMTime v89;
  CMTime time1;
  CMTime v91;
  CMTime v92;
  uint64_t v93;
  CMTime time2;
  char v95;
  CMTime time;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  CMTime v101;
  int v102;
  CMTime rhs;
  CMTime lhs;
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  const __CFString *v108;
  void *v109;
  CFDictionaryRef v110;
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  const __CFString *v114;
  void *v115;
  _QWORD v116[2];
  CMTime v117;
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v102 = 0;
  v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analysisDict, "setObject:forKeyedSubscript:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analysisDict, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D3AA00]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analysisDict, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D3AA08]);
  time = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  v77 = CMTimeCopyAsDictionary(&time, 0);
  memset(&v101, 0, sizeof(v101));
  -[VCPVideoStabilizer stillImageMetadata](self, "stillImageMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v101, v6);

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = self->_metadata;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
  if (v7)
  {
    v83 = *(_QWORD *)v98;
    do
    {
      v79 = v7;
      for (i = 0; i != v79; ++i)
      {
        if (*(_QWORD *)v98 != v83)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MetaPresentationTimeResults"));
        v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        -[VCPVideoStabilizer timeRange](self, "timeRange");
        if ((time.flags & 1) != 0)
        {
          -[VCPVideoStabilizer timeRange](self, "timeRange");
          if ((v95 & 1) != 0)
          {
            -[VCPVideoStabilizer timeRange](self, "timeRange");
            if (!v93)
            {
              -[VCPVideoStabilizer timeRange](self, "timeRange");
              if ((v118 & 0x8000000000000000) == 0)
              {
                if (v12)
                {
                  -[VCPVideoStabilizer timeRange](self, "timeRange");
                  CMTimeMake(&v89, 2, 600);
                  lhs = time1;
                  rhs = v89;
                  CMTimeSubtract(&v91, &lhs, &rhs);
                  CMTimeMakeFromDictionary(&v88, v12);
                  lhs = v91;
                  rhs = v88;
                  if (CMTimeCompare(&lhs, &rhs) > 0)
                    goto LABEL_27;
                }
              }
            }
          }
        }
        if (!-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
        {
          -[VCPVideoStabilizer timeRange](self, "timeRange");
          if ((time.flags & 1) != 0)
          {
            -[VCPVideoStabilizer timeRange](self, "timeRange");
            if ((v95 & 1) != 0)
            {
              -[VCPVideoStabilizer timeRange](self, "timeRange");
              if (!v93)
              {
                -[VCPVideoStabilizer timeRange](self, "timeRange");
                if ((v118 & 0x8000000000000000) == 0)
                {
                  if (v12)
                  {
                    -[VCPVideoStabilizer timeRange](self, "timeRange");
                    CMTimeRangeGetEnd(&rhs, &range);
                    CMTimeMakeFromDictionary(&v91, v12);
                    time1 = rhs;
                    lhs = v91;
                    if (CMTimeCompare(&time1, &lhs) < 0)
                    {
                      v73 = 2;
                      goto LABEL_40;
                    }
LABEL_14:
                    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D3A9F8]);
                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
        if (v12)
          goto LABEL_14;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v77, *MEMORY[0x1E0D3A9F8]);
LABEL_16:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MetaHomographyResults"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D3A9F0]);

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MetaMotionBlurResults"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = NSPointFromString((NSString *)v16);

        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v16) = objc_msgSend(v18, "count") == 9;

        if ((v16 & 1) == 0
          || (objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]),
              (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
          || (objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = v20 == 0,
              v20,
              v19,
              v21))
        {
          v73 = 1;
          goto LABEL_40;
        }
        if (-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
        {
          memset(&v92, 0, sizeof(v92));
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("MetaPresentationTimeResults"));
          v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v92, v23);

          time = v92;
          time2 = v101;
          if (!CMTimeCompare(&time, &time2))
            goto LABEL_42;
          time = v92;
          time2 = v101;
          if (CMTimeCompare(&time, &time2) >= 1)
          {
            time = v92;
            time2 = v101;
            CMTimeSubtract(&v117, &time, &time2);
            CMTimeMake(&time1, 2, 600);
            time = v117;
            time2 = time1;
            if (CMTimeCompare(&time, &time2) < 0)
              goto LABEL_42;
          }
          time = v92;
          time2 = v101;
          if (CMTimeCompare(&time, &time2) < 0)
          {
            time = v101;
            time2 = v92;
            CMTimeSubtract(&lhs, &time, &time2);
            CMTimeMake(&rhs, 2, 600);
            time = lhs;
            time2 = rhs;
            if (CMTimeCompare(&time, &time2) < 0)
            {
LABEL_42:
              -[VCPVideoStabilizer stillImageMetadata](self, "stillImageMetadata");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("attributes"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("MetaPresentationTimeResults"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D3A9F8]);

              objc_msgSend(v85, "addObject:", v10);
              -[VCPVideoStabilizer motionBlurVector](self, "motionBlurVector");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17.x);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v116[0] = v34;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17.y);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v116[1] = v35;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v36);

              goto LABEL_43;
            }
          }
          time = v92;
          time2 = v101;
          if (CMTimeCompare(&time, &time2) >= 1)
          {
            v38 = objc_msgSend(v85, "count");
            if (v38
              && (-[VCPVideoStabilizer motionBlurVector](self, "motionBlurVector"),
                  v39 = (void *)objc_claimAutoreleasedReturnValue(),
                  v40 = v38 == objc_msgSend(v39, "count"),
                  v39,
                  v40))
            {
              v41 = v38 - 1;
              objc_msgSend(v85, "objectAtIndexedSubscript:", v38 - 1);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = CFSTR("privEMBVct");
              -[VCPVideoStabilizer motionBlurVector](self, "motionBlurVector");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectAtIndexedSubscript:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = v43;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
              v80 = (void *)objc_claimAutoreleasedReturnValue();

              v113[0] = v86;
              v113[1] = v10;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = *MEMORY[0x1E0D3AA08];
              v111[0] = *MEMORY[0x1E0D3AA00];
              v111[1] = v44;
              v112[0] = MEMORY[0x1E0C9AAB0];
              v112[1] = MEMORY[0x1E0C9AAB0];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              time = v101;
              v45 = CMTimeCopyAsDictionary(&time, 0);
              v110 = v45;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              memset(&time, 0, sizeof(time));
              objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]);
              v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CMTimeMakeFromDictionary(&time, v46);

              memset(&time2, 0, sizeof(time2));
              objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]);
              v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CMTimeMakeFromDictionary(&time2, v47);

              ICFillHomographyGaps();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = 0;
              if (objc_msgSend(v48, "count"))
              {
                objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = v48;
                objc_msgSend(v85, "addObject:", v50);

                objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]);
                v51 = (NSString *)objc_claimAutoreleasedReturnValue();
                v52 = NSPointFromString(v51);

                v108 = CFSTR("privEMBVct");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52.x);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v107[0] = v53;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52.y);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v107[1] = v54;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = v55;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
                v76 = (void *)objc_claimAutoreleasedReturnValue();

                alInterpolateMetadataForGap();
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = v49;

                if (objc_msgSend(v56, "count"))
                {
                  objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "floatValue");
                  v61 = v60;
                  objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "floatValue");
                  v66 = v65;

                  -[VCPVideoStabilizer motionBlurVector](self, "motionBlurVector");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v106[0] = v68;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v106[1] = v69;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "addObject:", v70);

                  v73 = 2;
                }
                else
                {
                  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v74, "description");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v117.value) = 138412290;
                    *(CMTimeValue *)((char *)&v117.value + 4) = (CMTimeValue)v72;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error interpolating metadata gaps: %@", (uint8_t *)&v117, 0xCu);

                  }
                  v73 = 1;
                }

                v49 = v74;
LABEL_66:
                v48 = v75;
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  v75 = v48;
                  objc_msgSend(v49, "description");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v117.value) = 138412290;
                  *(CMTimeValue *)((char *)&v117.value + 4) = (CMTimeValue)v71;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error interpolating homography gaps: %@", (uint8_t *)&v117, 0xCu);

                  v73 = 1;
                  goto LABEL_66;
                }
                v73 = 1;
              }

LABEL_40:
              if (v73 == 2)
                goto LABEL_44;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                LOWORD(time.value) = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Inconsistent number of metadata", (uint8_t *)&time, 2u);
              }

            }
            v28 = -18;
            goto LABEL_47;
          }
        }
        objc_msgSend(v85, "addObject:", v10);
        -[VCPVideoStabilizer motionBlurVector](self, "motionBlurVector");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17.x);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = v25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17.y);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v105[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v27);

LABEL_27:
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    }
    while (v7);
  }
LABEL_43:

LABEL_44:
  -[VCPVideoStabilizer setAnalysisResultRef:](self, "setAnalysisResultRef:", ICSynthesizeAnalysis());
  if (-[VCPVideoStabilizer analysisResultRef](self, "analysisResultRef"))
    v28 = 0;
  else
    v28 = -18;
LABEL_47:

  return v28;
}

- (void)storeAnalytics:(CGAffineTransform *)a3 isLivePhoto:(BOOL)a4
{
  _BOOL4 v4;
  id *v6;
  id v7;
  uint8_t v8[16];

  v4 = a4;
  if (-[VCPVideoStabilizer analysisResultRef](self, "analysisResultRef"))
  {
    v6 = (id *)MEMORY[0x1E0D3A9C0];
    if (!v4)
      v6 = (id *)MEMORY[0x1E0D3A9C8];
    v7 = *v6;
    -[VCPVideoStabilizer analysisResultRef](self, "analysisResultRef");
    ICStoreAnalyticsViaDodML();
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Gyro analytics stored via dodML", v8, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_analysisDict, 0);
}

@end
