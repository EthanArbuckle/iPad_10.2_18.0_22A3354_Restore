@implementation VCPLightVideoAnalyzer

- (VCPLightVideoAnalyzer)initWithAVAsset:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v7;
  VCPLightVideoAnalyzer *v8;
  VCPLightVideoAnalyzer *v9;
  void *v10;
  void *v11;
  VCPLightVideoAnalyzer *v12;
  NSArray *metaTracks;
  uint64_t v14;
  NSMutableDictionary *publicMutableResults;
  uint64_t v16;
  NSMutableDictionary *privateMutableResults;
  VCPLightVideoAnalyzer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VCPLightVideoAnalyzer;
  v8 = -[VCPLightVideoAnalyzer init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    if (!v7)
      goto LABEL_9;
    objc_storeStrong((id *)&v8->_avAsset, a3);
    objc_msgSend(v7, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "preferredTransform");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    *(_OWORD *)&v9->_transform.a = v20;
    *(_OWORD *)&v9->_transform.c = v21;
    *(_OWORD *)&v9->_transform.tx = v22;

    v9->_requestedAnalyses = a4;
    metaTracks = v9->_metaTracks;
    v9->_metaTracks = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    publicMutableResults = v9->_publicMutableResults;
    v9->_publicMutableResults = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    privateMutableResults = v9->_privateMutableResults;
    v9->_privateMutableResults = (NSMutableDictionary *)v16;

    if (!v9->_publicMutableResults || (v18 = v9, !v9->_privateMutableResults))
LABEL_9:
      v18 = 0;
    v12 = v18;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findMetaTrackforType:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_metaTracks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v8, "formatDescriptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v9);
              CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((_QWORD *)&v18 + 1) + 8 * j));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13 && (objc_msgSend(v13, "containsObject:", v4) & 1) != 0)
              {
                v15 = v8;

                goto LABEL_20;
              }

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v15 = 0;
    }
    while (v6);
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (int)processMetaTrackForType:(id)a3 cancel:(id)a4 flags:(unint64_t *)a5
{
  id v8;
  uint64_t (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const opaqueCMFormatDescription *v15;
  void *v16;
  void *v17;
  void *v18;
  VCPMetaTrackDecoder *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  BOOL v27;
  NSMutableDictionary *publicMutableResults;
  void *v29;
  void *v30;
  BOOL v31;
  NSMutableDictionary *privateMutableResults;
  void *v33;
  void *v35;
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (**)(_QWORD))a4;
  -[VCPLightVideoAnalyzer findMetaTrackforType:](self, "findMetaTrackforType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v10;
  if (!v10)
  {
    v18 = 0;
    v19 = 0;
LABEL_13:
    LODWORD(v15) = 0;
    goto LABEL_36;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v10, "formatDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v37 + 1) + 8 * i);
        CMMetadataFormatDescriptionGetIdentifiers(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && (objc_msgSend(v16, "containsObject:", v8) & 1) != 0)
        {

          goto LABEL_15;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_15:

  v19 = -[VCPMetaTrackDecoder initWithTrack:]([VCPMetaTrackDecoder alloc], "initWithTrack:", v35);
  if (!v19)
  {
    v18 = 0;
    LODWORD(v15) = -50;
    goto LABEL_36;
  }
  v20 = *(_OWORD *)&self->_transform.c;
  v36[0] = *(_OWORD *)&self->_transform.a;
  v36[1] = v20;
  v36[2] = *(_OWORD *)&self->_transform.tx;
  +[VCPVideoMetaAnalyzer analyzerForTrackType:withTransform:requestAnalyses:formatDescription:](VCPVideoMetaAnalyzer, "analyzerForTrackType:withTransform:requestAnalyses:formatDescription:", v8, v36, self->_requestedAnalyses, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPLightVideoAnalyzer photoOffset](self, "photoOffset");
  v21 = objc_msgSend(v18, "setPhotoOffset:");
  if (!v18)
  {
    LODWORD(v15) = -108;
    goto LABEL_36;
  }
  do
  {
    v22 = (void *)MEMORY[0x1BCCA1B2C](v21);
    if ((v9[2](v9) & 1) != 0)
    {
      LODWORD(v15) = -128;
      v23 = 1;
    }
    else
    {
      v24 = -[VCPMetaTrackDecoder copyNextMetadataGroup](v19, "copyNextMetadataGroup");
      if (v24)
      {
        v25 = objc_msgSend(v18, "processMetadataGroup:flags:", v24, a5);
        v23 = v25 != 0;
        if (v25)
          LODWORD(v15) = v25;
      }
      else
      {
        v23 = 11;
      }

    }
    objc_autoreleasePoolPop(v22);
  }
  while (!v23);
  if (v23 == 11)
  {
    if (-[VCPMetaTrackDecoder status](v19, "status") != 2)
    {
      LODWORD(v15) = -19;
      goto LABEL_36;
    }
    LODWORD(v15) = objc_msgSend(v18, "finalizeAnalysis");
    if (!(_DWORD)v15)
    {
      objc_msgSend(v18, "publicResults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (!v27)
      {
        publicMutableResults = self->_publicMutableResults;
        objc_msgSend(v18, "publicResults");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary addEntriesFromDictionary:](publicMutableResults, "addEntriesFromDictionary:", v29);

      }
      objc_msgSend(v18, "privateResults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (!v31)
      {
        privateMutableResults = self->_privateMutableResults;
        objc_msgSend(v18, "privateResults");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary addEntriesFromDictionary:](privateMutableResults, "addEntriesFromDictionary:", v33);

      }
      goto LABEL_13;
    }
  }
LABEL_36:

  return (int)v15;
}

- (int)checkTimeRangeConsistency
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  double Seconds;
  double v8;
  float v9;
  float v10;
  CMTime v12;
  CMTime time;
  CMTimeRange range;
  CMTime v15;
  CMTime duration;
  CMTime start;
  CMTimeRange v18;
  CMTimeRange v19;
  CMTimeRange v20;
  __int128 v21;
  _OWORD v22[2];
  CMTime rhs;
  CMTime lhs;

  -[AVAsset vcp_firstEnabledTrackWithMediaType:](self->_avAsset, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_privateMutableResults, "objectForKey:", CFSTR("OrientationResults"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    memset(v22, 0, sizeof(v22));
    v21 = 0u;
    objc_msgSend(v3, "timeRange");
    memset(&v20, 0, sizeof(v20));
    CMTimeRangeMakeFromDictionary(&v20, (CFDictionaryRef)objc_msgSend(v5, "firstObject"));
    memset(&v19, 0, sizeof(v19));
    CMTimeRangeMakeFromDictionary(&v19, (CFDictionaryRef)objc_msgSend(v5, "lastObject"));
    memset(&v18, 0, sizeof(v18));
    start = v20.start;
    range = v19;
    CMTimeRangeGetEnd(&v15, &range);
    lhs = v15;
    rhs = v20.start;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake(&v18, &start, &duration);
    time = *(CMTime *)((char *)v22 + 8);
    Seconds = CMTimeGetSeconds(&time);
    v12 = v18.duration;
    v8 = CMTimeGetSeconds(&v12);
    v9 = Seconds;
    if (v9 != 0.0)
    {
      v10 = v8;
      if ((float)(vabds_f32(v9, v10) / v9) >= 0.25)
        -[NSMutableDictionary removeObjectForKey:](self->_privateMutableResults, "removeObjectForKey:", CFSTR("OrientationResults"));
    }
  }

  return 0;
}

- (int)postProcessOrientationResults
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateMutableResults, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v15;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v18 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v7 = (void *)objc_msgSend(v6, "mutableCopy");
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributes"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("orientation"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if ((int)objc_msgSend(v9, "intValue") <= 8)
            v10 = kQuickTimeVideoOrientationToVCPOrientation[(int)objc_msgSend(v9, "intValue")];
          else
            v10 = 0;
          v21 = CFSTR("orientation");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("attributes"));

          objc_msgSend(v2, "addObject:", v7);
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v3);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_publicMutableResults, "setObject:forKeyedSubscript:", v2, CFSTR("OrientationResults"));
  }

  return 0;
}

- (int)analyzeAsset:(id)a3 flags:(unint64_t *)a4
{
  id v6;
  int v7;
  NSArray *v8;
  NSArray *metaTracks;
  unint64_t requestedAnalyses;
  uint64_t v12;

  v6 = a3;
  if (-[NSMutableDictionary count](self->_publicMutableResults, "count")
    && -[NSMutableDictionary count](self->_privateMutableResults, "count"))
  {
    v7 = 0;
    goto LABEL_24;
  }
  v12 = 0;
  -[AVAsset vcp_enabledTracksWithMediaType:](self->_avAsset, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  metaTracks = self->_metaTracks;
  self->_metaTracks = v8;

  if (!self->_metaTracks)
  {
LABEL_23:
    v7 = 0;
    *a4 |= v12;
    goto LABEL_24;
  }
  v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", *MEMORY[0x1E0CA2588], v6, &v12);
  if (v7)
    goto LABEL_24;
  requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0xC) == 4)
  {
    v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", *MEMORY[0x1E0C8A958], v6, &v12);
    if (v7)
      goto LABEL_24;
    requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0xC0) != 0)
  {
    v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", *MEMORY[0x1E0C8A988], v6, &v12);
    if (v7)
      goto LABEL_24;
    v7 = -[VCPLightVideoAnalyzer checkTimeRangeConsistency](self, "checkTimeRangeConsistency");
    if (v7)
      goto LABEL_24;
    requestedAnalyses = self->_requestedAnalyses;
    if ((requestedAnalyses & 0xC0) == 0x40)
    {
      v7 = -[VCPLightVideoAnalyzer postProcessOrientationResults](self, "postProcessOrientationResults");
      if (v7)
        goto LABEL_24;
      requestedAnalyses = self->_requestedAnalyses;
    }
  }
  if ((requestedAnalyses & 0x40000140300002C0) != 0)
  {
    v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", *MEMORY[0x1E0D053E0], v6, a4);
    if (v7)
      goto LABEL_24;
    requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0x10000000000) != 0)
  {
    v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", *MEMORY[0x1E0CA4CC0], v6, a4);
    if (v7)
      goto LABEL_24;
    requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0x20000000) == 0)
    goto LABEL_23;
  v7 = -[VCPLightVideoAnalyzer processMetaTrackForType:cancel:flags:](self, "processMetaTrackForType:cancel:flags:", CFSTR("mdta/com.apple.quicktime.smartstyle-info"), v6, a4);
  if (!v7)
    goto LABEL_23;
LABEL_24:

  return v7;
}

- (NSDictionary)publicResults
{
  return (NSDictionary *)self->_publicMutableResults;
}

- (NSDictionary)privateResults
{
  return (NSDictionary *)self->_privateMutableResults;
}

- (float)photoOffset
{
  return self->_photoOffset;
}

- (void)setPhotoOffset:(float)a3
{
  self->_photoOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMutableResults, 0);
  objc_storeStrong((id *)&self->_publicMutableResults, 0);
  objc_storeStrong((id *)&self->_metaTracks, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end
