@implementation NSDictionary(MediaAnalysis)

- (uint64_t)vcp_version
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("version"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (uint64_t)vcp_dateModified
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("dateModified"));
}

- (uint64_t)vcp_dateAnalyzed
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("dateAnalyzed"));
}

- (uint64_t)vcp_types
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("performedAnalysisTypes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)vcp_flags
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("flags"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)vcp_statsFlags
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("statsFlags"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongValue");

  return v2;
}

- (double)vcp_quality
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("quality"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = -1.0;
  }

  return v4;
}

- (uint64_t)vcp_results
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("metadataRanges"));
}

- (id)vcp_fingerprint
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("masterFingerprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", CFSTR("adjustedFingerprint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPFingerprint fingerprintWithMaster:adjusted:](VCPFingerprint, "fingerprintWithMaster:adjusted:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)vcp_degraded
{
  return ((unint64_t)objc_msgSend(a1, "vcp_flags") >> 18) & 1;
}

- (unint64_t)vcp_streamedVideo
{
  return ((unint64_t)objc_msgSend(a1, "vcp_flags") >> 29) & 1;
}

- (id)vcp_actionsAggregated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  void *v18;
  float v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "vcp_results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("humanActions"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v30 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              if ((int)objc_msgSend(v12, "intValue") >= 2)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "floatValue");
                v15 = v14;

                objc_msgSend(v2, "objectForKeyedSubscript:", v12);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v16
                  || (objc_msgSend(v2, "objectForKeyedSubscript:", v12),
                      v18 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v18, "floatValue"),
                      v20 = v19 < v15,
                      v18,
                      v16,
                      v20))
                {
                  *(float *)&v17 = v15;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, v12);

                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, v12);

                }
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v9);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }

  return v28;
}

- (id)vcp_queryActionResultForPHFace:()MediaAnalysis
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CMTimeFlags flags;
  CMTimeEpoch v9;
  CMTimeValue v10;
  CMTimeScale v11;
  CMTimeFlags v12;
  CMTimeEpoch v13;
  const __CFDictionary *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  float v27;
  CMTimeEpoch v28;
  CMTimeScale v29;
  uint64_t v30;
  const __CFDictionary *v31;
  float Seconds;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  uint64_t i;
  void *v48;
  void *v49;
  float v50;
  void *v51;
  NSObject *v52;
  float v53;
  const __CFDictionary *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  uint64_t j;
  void *v65;
  void *v66;
  float v67;
  float v68;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  void *v80;
  void *v82;
  __int128 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  CMTimeScale v92;
  CMTimeEpoch epoch;
  void *v94;
  id obj;
  id obja;
  void *v97;
  void *v98;
  void *v99;
  CFDictionaryRef dictionaryRepresentation;
  id v101;
  CMTime duration;
  CMTime start;
  CMTimeRange v104;
  CMTimeRange v105;
  CMTime v106;
  CMTime v107;
  CMTime v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  CMTime v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  CMTime rhs;
  CMTimeRange buf;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  CMTimeRange v138;
  CMTimeValue value;
  CMTimeScale timescale;
  _QWORD v141[2];
  _QWORD v142[5];

  v142[2] = *MEMORY[0x1E0C80C00];
  v101 = a3;
  objc_msgSend(a1, "vcp_results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v141[0] = CFSTR("HighlightBestTrim");
    v141[1] = CFSTR("HighlightMaxDuration");
    v142[0] = MEMORY[0x1E0C9AAB0];
    v142[1] = &unk_1E6B71FD0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MediaAnalysisPostProcessMovieHighlights(a1, v6, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    value = *MEMORY[0x1E0CA2E40];
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
    v11 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v12 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
    v97 = v7;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v97, "objectAtIndexedSubscript:", 0);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v138, v14);
      value = v138.start.value;
      flags = v138.start.flags;
      timescale = v138.start.timescale;
      v10 = v138.duration.value;
      epoch = v138.start.epoch;
      v12 = v138.duration.flags;
      v92 = v138.duration.timescale;
      v13 = v138.duration.epoch;

      if ((flags & 1) == 0)
      {
LABEL_19:
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v138.start.value) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : not find the best highlight", (uint8_t *)&v138, 2u);
        }
        dictionaryRepresentation = 0;
        v15 = 0;
        goto LABEL_107;
      }
    }
    else
    {
      v92 = v11;
      epoch = v9;
      if ((flags & 1) == 0)
        goto LABEL_19;
    }
    if ((v12 & 1) == 0 || v13 || v10 < 0)
      goto LABEL_19;
    objc_msgSend(v101, "faceClusteringProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "faceprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "faceprintData");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v91 || objc_msgSend(v101, "detectionType") != 1)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v101, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v138.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v138.start.value + 4) = (CMTimeValue)v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : no faceprint data for face: %@", (uint8_t *)&v138, 0xCu);

      }
      goto LABEL_105;
    }
    v131 = 0;
    +[VCPVNImageprintWrapper generateVNImageprintWithType:archiveData:andError:](VCPVNImageprintWrapper, "generateVNImageprintWithType:archiveData:andError:", 0, v91, &v131);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v131;
    if (v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v138.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v138.start.value + 4) = (CMTimeValue)v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to decode torsoprint %@", (uint8_t *)&v138, 0xCu);

      }
LABEL_104:

LABEL_105:
      dictionaryRepresentation = 0;
      v15 = 0;
LABEL_106:

LABEL_107:
      goto LABEL_108;
    }
    objc_msgSend(v18, "torsoprint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(v138.start.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "queryActionResultForPHFace : torsoprint not available", (uint8_t *)&v138, 2u);
      }
      goto LABEL_104;
    }
    objc_msgSend(v18, "torsoprint");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v24 = v99;
    v87 = v24;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
    if (!v25)
    {

LABEL_110:
      v56 = 0;
      dictionaryRepresentation = 0;
LABEL_119:
      v15 = v56;

      goto LABEL_106;
    }
    dictionaryRepresentation = 0;
    obj = *(id *)v128;
    v27 = 0.0;
    *(_QWORD *)&v26 = 138412546;
    v83 = v26;
    v28 = epoch;
    v29 = v92;
LABEL_29:
    v30 = 0;
    v88 = v25;
    while (1)
    {
      if (*(id *)v128 != obj)
        objc_enumerationMutation(v24);
      v31 = *(const __CFDictionary **)(*((_QWORD *)&v127 + 1) + 8 * v30);
      memset(&v138, 0, sizeof(v138));
      CMTimeRangeMakeFromDictionary(&v138, v31);
      range = v138;
      memset(&v126, 0, sizeof(v126));
      otherRange.start.value = value;
      otherRange.start.timescale = timescale;
      otherRange.start.flags = flags;
      otherRange.start.epoch = v28;
      otherRange.duration.value = v10;
      otherRange.duration.timescale = v29;
      otherRange.duration.flags = v12;
      otherRange.duration.epoch = 0;
      CMTimeRangeGetIntersection(&v126, &range, &otherRange);
      if ((v126.start.flags & 1) == 0)
        goto LABEL_33;
      if ((v126.duration.flags & 1) == 0)
        goto LABEL_33;
      if (v126.duration.epoch)
        goto LABEL_33;
      if (v126.duration.value < 0)
        goto LABEL_33;
      time = v126.duration;
      Seconds = CMTimeGetSeconds(&time);
      if (Seconds < 1.0)
        goto LABEL_33;
      -[__CFDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", CFSTR("attributes"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("torsoPrint"));
      v90 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v90;
      if (v90)
      {
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEE048]), "initWithState:error:", v90, 0);
        if (!v35)
        {
          v89 = 0;
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.start.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to decode torsoprintAction", (uint8_t *)&buf, 2u);
          }
          goto LABEL_118;
        }
        if (v86)
        {
          v122 = 0;
          v89 = (void *)v35;
          objc_msgSend(v86, "computeDistance:withDistanceFunction:error:", v35, 0, &v122);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v122;
          if (v37)
          {
            v82 = v37;
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.start.value) = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to get compute torsoprint distance", (uint8_t *)&buf, 2u);
            }

            v34 = (void *)v90;
LABEL_118:

            v56 = 0;
            goto LABEL_119;
          }
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v101, "localIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "floatValue");
            LODWORD(buf.start.value) = v83;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v38;
            LOWORD(buf.start.flags) = 2048;
            *(double *)((char *)&buf.start.flags + 2) = v39;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "queryActionResultForPHFace : torsoprint distance with %@, %f", (uint8_t *)&buf, 0x16u);

          }
          if (v36 && (objc_msgSend(v36, "floatValue"), v40 < 0.3))
          {
            v85 = v36;
            -[__CFDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", CFSTR("attributes"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("humanActions"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v43 = v42;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
            if (v44)
            {
              v45 = *(_QWORD *)v119;
              v46 = 0.0;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v119 != v45)
                    objc_enumerationMutation(v43);
                  v48 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
                  if ((int)objc_msgSend(v48, "intValue", v83) >= 2)
                  {
                    objc_msgSend(v43, "objectForKeyedSubscript:", v48);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "floatValue");
                    if (v50 >= v46)
                      v46 = v50;

                  }
                }
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
              }
              while (v44);
            }
            else
            {
              v46 = 0.0;
            }

            v53 = v46 + Seconds;
            if (v53 <= v27)
            {
              v53 = v27;
            }
            else
            {
              v54 = v31;

              dictionaryRepresentation = v54;
            }
            objc_msgSend(v84, "addObject:", v31, v83);

            v27 = v53;
          }
          else
          {

          }
          v34 = (void *)v90;
          goto LABEL_73;
        }
        v51 = (void *)v35;
      }
      else
      {
        v51 = 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v52 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.start.value) = 0;
          _os_log_impl(&dword_1B6C4A000, v52, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to get torsoprints", (uint8_t *)&buf, 2u);
        }
      }
      v89 = v51;
LABEL_73:

      v24 = v87;
      v25 = v88;
      v28 = epoch;
      v29 = v92;
LABEL_33:
      if (++v30 == v25)
      {
        v55 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
        v25 = v55;
        if (!v55)
        {

          if (!dictionaryRepresentation)
            goto LABEL_110;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v84, "count") >= 2)
          {
            memset(&v138, 0, sizeof(v138));
            v94 = v56;
            CMTimeRangeMakeFromDictionary(&v138, dictionaryRepresentation);
            memset(&v117, 0, sizeof(v117));
            v126.start = v138.duration;
            CMTimeMultiplyByRatio(&rhs, &v126.start, 1, 2);
            *(_OWORD *)&v126.start.value = *(_OWORD *)&v138.start.value;
            v126.start.epoch = v138.start.epoch;
            buf.start = rhs;
            CMTimeAdd(&v117, &v126.start, &buf.start);
            -[__CFDictionary objectForKeyedSubscript:](dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("attributes"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("humanActions"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v59 = v58;
            v60 = 0;
            v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
            if (v61)
            {
              v62 = *(_QWORD *)v114;
              v63 = 0.0;
              do
              {
                for (j = 0; j != v61; ++j)
                {
                  if (*(_QWORD *)v114 != v62)
                    objc_enumerationMutation(v59);
                  v65 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                  objc_msgSend(v59, "objectForKeyedSubscript:", v65, v83);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "floatValue");
                  v68 = v67;

                  if ((int)objc_msgSend(v65, "intValue") >= 2 && v68 > v63)
                  {
                    v70 = v65;

                    v60 = v70;
                    v63 = v68;
                  }
                }
                v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
              }
              while (v61);
            }

            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            obja = v84;
            v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v110;
              do
              {
                for (k = 0; k != v71; ++k)
                {
                  if (*(_QWORD *)v110 != v72)
                    objc_enumerationMutation(obja);
                  v74 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("attributes"), v83);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("humanActions"));
                  v76 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v60)
                  {
                    objc_msgSend(v76, "objectForKeyedSubscript:", v60);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = v77 == 0;

                    if (!v78)
                    {
                      memset(&v126, 0, sizeof(v126));
                      CMTimeRangeMakeFromDictionary(&v126, (CFDictionaryRef)v74);
                      memset(&v108, 0, sizeof(v108));
                      buf.start = v126.duration;
                      CMTimeMultiplyByRatio(&v107, &buf.start, 1, 2);
                      *(_OWORD *)&buf.start.value = *(_OWORD *)&v126.start.value;
                      buf.start.epoch = v126.start.epoch;
                      rhs = v107;
                      CMTimeAdd(&v108, &buf.start, &rhs);
                      buf.start = v108;
                      rhs = v117;
                      CMTimeSubtract(&v106, &buf.start, &rhs);
                      if (fabs(CMTimeGetSeconds(&v106)) < 3.0)
                      {
                        v105 = v138;
                        v104 = v126;
                        CMTimeRangeGetUnion(&buf, &v105, &v104);
                        v138 = buf;
                      }
                    }
                  }

                }
                v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
              }
              while (v71);
            }

            start = v138.start;
            CMTimeToNSDictionary(&start);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v79, CFSTR("start"));

            duration = v138.duration;
            CMTimeToNSDictionary(&duration);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v80, CFSTR("duration"));

            v56 = v94;
          }
          goto LABEL_119;
        }
        goto LABEL_29;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v138.start.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "queryActionResultForPHFace : no action results", (uint8_t *)&v138, 2u);
  }
  dictionaryRepresentation = 0;
  v15 = 0;
LABEL_108:

  return v15;
}

@end
