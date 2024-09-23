@implementation MOVStreamReader

- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Depth")) & 1) != 0)
  {
    v4 = CFSTR("FrontDepth");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Color")) & 1) != 0)
  {
    v4 = CFSTR("FrontColor");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IR")) & 1) != 0)
  {
    v4 = CFSTR("FrontIR");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (MOVStreamReader)initWithURL:(id)a3 error:(id *)a4
{
  return -[MOVStreamReader initWithURL:delegate:error:](self, "initWithURL:delegate:error:", a3, 0, a4);
}

- (MOVStreamReader)initWithURL:(id)a3 delegate:(id)a4 error:(id *)p_isa
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  MOVStreamReader *v13;
  id v14;
  id v15;
  AVURLAsset *v16;
  AVURLAsset *m_asset;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *timeRangeMetadataStream;
  NSObject *v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("URL must be a file URL type. (%@)"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", p_isa, v20, 5);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("File doesn't exist. (%@)"), v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", p_isa, v20, 6);
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)MOVStreamReader;
  v13 = -[MOVStreamReader init](&v29, sel_init);
  self = v13;
  if (!v13)
    goto LABEL_17;
  v14 = objc_storeWeak((id *)&v13->_delegate, v9);

  if (!v9)
    v15 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", CFSTR("No MOVStreamReaderDelegate set."), 0);
  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v8, 0);
  v16 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
  m_asset = self->m_asset;
  self->m_asset = v16;

  -[MOVStreamReader movVersionCheck](self, "movVersionCheck");
  *(_WORD *)&self->_l010OutputFormatRAW14L016 = 257;
  self->_bufferCacheMode = 0;
  -[MOVStreamReader setSkipEmptyEditVideoFrame:](self, "setSkipEmptyEditVideoFrame:", 0);
  -[MOVStreamReader timeRangeMetadataKeyHint](self, "timeRangeMetadataKeyHint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[MOVStreamReader timeRangeMetadataKeyHint](self, "timeRangeMetadataKeyHint");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("MidExposureTimeStamp");
  }
  -[MOVStreamReader setTimeRangeMetadataKey:](self, "setTimeRangeMetadataKey:", v19);
  if (v18)

  timeRangeMetadataStream = self->_timeRangeMetadataStream;
  self->_timeRangeMetadataStream = 0;

  v27 = *MEMORY[0x24BDC0D90];
  v28 = *(_QWORD *)(MEMORY[0x24BDC0D90] + 16);
  if (-[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v27, p_isa))
  {
LABEL_17:
    self = self;
    p_isa = (id *)&self->super.isa;
    goto LABEL_12;
  }
  if (!p_isa)
    goto LABEL_12;
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = *p_isa;
    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl(&dword_210675000, v25, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot initialize reader: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
  }

LABEL_11:
  p_isa = 0;
LABEL_12:

  return (MOVStreamReader *)p_isa;
}

- (MOVStreamReader)initWithContentsOfFile:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MOVStreamReader *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    self = -[MOVStreamReader initWithContentsOfURL:delegate:error:](self, "initWithContentsOfURL:delegate:error:", v10, v9, a5);
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid file path. (%@)"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v12, 5);

    v11 = 0;
  }

  return v11;
}

- (MOVStreamReader)initWithAsset:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  MOVStreamReader *v11;
  MOVStreamReader *v12;
  MOVStreamReader *v13;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  NSString *timeRangeMetadataStream;
  NSObject *v19;
  id v20;
  __int128 v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
  v24.receiver = self;
  v24.super_class = (Class)MOVStreamReader;
  v11 = -[MOVStreamReader init](&v24, sel_init);
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_10;
  v14 = objc_storeWeak((id *)&v11->_delegate, v10);

  if (!v10)
    v15 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", CFSTR("No MOVStreamReaderDelegate set."), 0);
  -[MOVStreamReader setSkipEmptyEditVideoFrame:](v13, "setSkipEmptyEditVideoFrame:", 0);
  objc_storeStrong((id *)&v12->m_asset, a3);
  -[MOVStreamReader movVersionCheck](v13, "movVersionCheck");
  *(_WORD *)&v13->_l010OutputFormatRAW14L016 = 256;
  v13->_bufferCacheMode = 0;
  -[MOVStreamReader timeRangeMetadataKeyHint](v13, "timeRangeMetadataKeyHint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[MOVStreamReader timeRangeMetadataKeyHint](v13, "timeRangeMetadataKeyHint");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("MidExposureTimeStamp");
  }
  -[MOVStreamReader setTimeRangeMetadataKey:](v13, "setTimeRangeMetadataKey:", v17);
  if (v16)

  timeRangeMetadataStream = v13->_timeRangeMetadataStream;
  v13->_timeRangeMetadataStream = 0;

  v22 = *MEMORY[0x24BDC0D90];
  v23 = *(_QWORD *)(MEMORY[0x24BDC0D90] + 16);
  if (!-[MOVStreamReader resetReaderTo:error:](v13, "resetReaderTo:error:", &v22, a5))
  {
    if (a5)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *a5;
        *(_DWORD *)buf = 138543362;
        v26 = v20;
        _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot initialize reader: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
      }

      a5 = 0;
    }
  }
  else
  {
LABEL_10:
    a5 = v13;
  }

  return (MOVStreamReader *)a5;
}

- (MOVStreamReader)initWithContentsOfURL:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  MOVStreamReader *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("URL must be a file URL type. (%@)"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v13, 5);
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("File doesn't exist. (%@)"), v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v13, 6);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MOVStreamReader initWithAsset:delegate:error:](self, "initWithAsset:delegate:error:", v13, v9, a5);
  v14 = self;
LABEL_7:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetReader cancelReading](self->m_assetReader, "cancelReading");
  v3.receiver = self;
  v3.super_class = (Class)MOVStreamReader;
  -[MOVStreamReader dealloc](&v3, sel_dealloc);
}

- (BOOL)resetReader:(id *)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x24BDC0D90];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D90] + 16);
  return -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v4, a3);
}

- (void)clearOutputs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sampleStreams;
  NSMutableArray *v5;
  NSMutableArray *orderedVideoStreamIds;
  NSMutableDictionary *v7;
  NSMutableDictionary *metadataStreams;
  NSMutableArray *v9;
  NSMutableArray *orderedMetadataStreamIds;
  NSMutableArray *v11;
  NSMutableArray *orderedAudioStreamIds;
  NSMutableArray *v13;
  NSMutableArray *orderedSceneStreamIds;
  NSMutableArray *v15;
  NSMutableArray *orderedTimeCodeStreamIds;

  -[NSMutableDictionary removeAllObjects](self->_sampleStreams, "removeAllObjects");
  v3 = (NSMutableDictionary *)objc_opt_new();
  sampleStreams = self->_sampleStreams;
  self->_sampleStreams = v3;

  -[NSMutableArray removeAllObjects](self->_orderedVideoStreamIds, "removeAllObjects");
  v5 = (NSMutableArray *)objc_opt_new();
  orderedVideoStreamIds = self->_orderedVideoStreamIds;
  self->_orderedVideoStreamIds = v5;

  -[NSMutableDictionary removeAllObjects](self->_metadataStreams, "removeAllObjects");
  v7 = (NSMutableDictionary *)objc_opt_new();
  metadataStreams = self->_metadataStreams;
  self->_metadataStreams = v7;

  -[NSMutableArray removeAllObjects](self->_orderedMetadataStreamIds, "removeAllObjects");
  v9 = (NSMutableArray *)objc_opt_new();
  orderedMetadataStreamIds = self->_orderedMetadataStreamIds;
  self->_orderedMetadataStreamIds = v9;

  -[NSMutableArray removeAllObjects](self->_orderedAudioStreamIds, "removeAllObjects");
  v11 = (NSMutableArray *)objc_opt_new();
  orderedAudioStreamIds = self->_orderedAudioStreamIds;
  self->_orderedAudioStreamIds = v11;

  -[NSMutableArray removeAllObjects](self->_orderedSceneStreamIds, "removeAllObjects");
  v13 = (NSMutableArray *)objc_opt_new();
  orderedSceneStreamIds = self->_orderedSceneStreamIds;
  self->_orderedSceneStreamIds = v13;

  -[NSMutableArray removeAllObjects](self->_orderedTimeCodeStreamIds, "removeAllObjects");
  v15 = (NSMutableArray *)objc_opt_new();
  orderedTimeCodeStreamIds = self->_orderedTimeCodeStreamIds;
  self->_orderedTimeCodeStreamIds = v15;

}

- (BOOL)registerOutput:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *orderedVideoStreamIds;
  void *v7;
  NSMutableDictionary *sampleStreams;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSMutableArray *orderedAudioStreamIds;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableArray *orderedMetadataStreamIds;
  void *v16;
  NSMutableDictionary *metadataStreams;
  NSMutableArray *orderedSceneStreamIds;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableArray *orderedTimeCodeStreamIds;
  void *v22;
  NSMutableDictionary *v23;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "mediaType"))
    {
      case 0:
        orderedVideoStreamIds = self->_orderedVideoStreamIds;
        objc_msgSend(v5, "streamId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](orderedVideoStreamIds, "addObject:", v7);

        sampleStreams = self->_sampleStreams;
        objc_msgSend(v5, "streamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](sampleStreams, "setObject:forKey:", v5, v9);
        break;
      case 1:
        orderedAudioStreamIds = self->_orderedAudioStreamIds;
        objc_msgSend(v5, "streamId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](orderedAudioStreamIds, "addObject:", v13);

        v14 = self->_sampleStreams;
        objc_msgSend(v5, "streamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v5, v9);
        break;
      case 2:
        orderedMetadataStreamIds = self->_orderedMetadataStreamIds;
        objc_msgSend(v5, "streamId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](orderedMetadataStreamIds, "addObject:", v16);

        metadataStreams = self->_metadataStreams;
        objc_msgSend(v5, "streamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](metadataStreams, "setObject:forKey:", v5, v9);
        break;
      case 3:
        orderedSceneStreamIds = self->_orderedSceneStreamIds;
        objc_msgSend(v5, "streamId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](orderedSceneStreamIds, "addObject:", v19);

        v20 = self->_sampleStreams;
        objc_msgSend(v5, "streamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v5, v9);
        break;
      case 4:
        orderedTimeCodeStreamIds = self->_orderedTimeCodeStreamIds;
        objc_msgSend(v5, "streamId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](orderedTimeCodeStreamIds, "addObject:", v22);

        v23 = self->_sampleStreams;
        objc_msgSend(v5, "streamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v5, v9);
        break;
      default:
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v25 = 134217984;
          v26 = objc_msgSend(v5, "mediaType");
          _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "MOVStreamReader registerOutput unknown media type (%ld).", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_9;
    }

    v11 = 1;
  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "MOVStreamReader registerOutput with nil output.", (uint8_t *)&v25, 2u);
    }
LABEL_9:

    v11 = 0;
  }

  return v11;
}

- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4
{
  CMTimeRange v7;
  CMTime duration;
  CMTime start;
  CMTimeRange v10;

  memset(&v10, 0, sizeof(v10));
  start = *(CMTime *)a3;
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D60];
  CMTimeRangeMake(&v10, &start, &duration);
  v7 = v10;
  return -[MOVStreamReader resetReaderWithTimeRange:error:](self, "resetReaderWithTimeRange:error:", &v7, a4);
}

- (BOOL)resetReaderWithTimeRange:(id *)a3 error:(id *)a4
{
  const __CFAllocator *v4;
  __int128 v5;
  NSObject *v6;
  const __CFString *v7;
  id *v8;
  BOOL v9;
  AVAssetReader *m_assetReader;
  id v12;
  AVURLAsset *m_asset;
  AVAssetReader *v14;
  AVAssetReader *v15;
  MOVStreamReader *v16;
  uint64_t v17;
  MOVStreamReaderDelegate **p_delegate;
  id *i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  MOVStreamReaderStreamOutput *v25;
  AVAssetReader *v26;
  MIOVersion *movVersion;
  id WeakRetained;
  MOVStreamReaderStreamOutput *v29;
  id v30;
  id v31;
  id v32;
  char v33;
  NSObject *v34;
  _BOOL4 v35;
  MOVStreamReader *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  MOVStreamReaderStreamOutput *v46;
  AVAssetReader *v47;
  MIOVersion *v48;
  uint64_t bufferCacheMode;
  id v50;
  MOVStreamReaderStreamOutput *v51;
  id v52;
  id v53;
  id v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  MOVStreamReader *v60;
  MOVStreamReaderDelegate **v61;
  id *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  MOVStreamReaderStreamOutput *v68;
  AVAssetReader *v69;
  MIOVersion *v70;
  id v71;
  MOVStreamReaderStreamOutput *v72;
  id v73;
  id v74;
  id v75;
  char v76;
  NSObject *v77;
  _BOOL4 v78;
  MOVStreamReader *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  MOVStreamReader *v83;
  MOVStreamReaderDelegate **v84;
  id *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  MOVStreamReaderStreamOutput *v91;
  AVAssetReader *v92;
  MIOVersion *v93;
  id v94;
  MOVStreamReaderStreamOutput *v95;
  id v96;
  id v97;
  id v98;
  char v99;
  NSObject *v100;
  _BOOL4 v101;
  MOVStreamReader *v102;
  NSObject *v103;
  MOVStreamReader *v104;
  uint64_t v105;
  MOVStreamReaderDelegate **v106;
  uint64_t k;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  MOVStreamReaderStreamOutput *v112;
  AVAssetReader *v113;
  MIOVersion *v114;
  id v115;
  MOVStreamReaderStreamOutput *v116;
  id v117;
  id v118;
  id v119;
  char v120;
  void *v121;
  _BOOL4 v122;
  MOVStreamReader *v123;
  NSObject *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t m;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t n;
  MOVStreamReader *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t ii;
  void *v143;
  void *v144;
  NSObject *v145;
  __int128 v146;
  void *v147;
  void *v148;
  NSObject *v149;
  __int128 v150;
  void *v151;
  void *v152;
  _BOOL4 v153;
  void *v154;
  unint64_t v155;
  void *v156;
  id v157;
  int v158;
  uint64_t v159;
  void *v160;
  BOOL v161;
  void *v162;
  void *v163;
  void *v164;
  NSArray *v165;
  NSArray *timeRangeMetadataSamples;
  NSString *v167;
  NSString *timeRangeMetadataStream;
  id v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  __CFString *v176;
  id v177;
  id v178;
  id v179;
  id v180;
  NSObject *v181;
  id *location;
  id *locationa;
  id *locationb;
  id *locationc;
  id *locationd;
  NSObject *locatione;
  id *locationf;
  id obj;
  id obja;
  id objb;
  id objc;
  void *v193;
  _OWORD v195[3];
  _QWORD v196[5];
  NSObject *v197;
  id v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  id v211;
  __int128 v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  int v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  int v220;
  unint64_t v221;
  unint64_t v222;
  _OWORD v223[3];
  id v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  id v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  id v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  id v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  id v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  id v249;
  CMTimeRange range;
  _BYTE v251[128];
  _BYTE v252[128];
  uint8_t v253[128];
  _BYTE buf[12];
  int v255;
  uint64_t v256;
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  uint64_t v262;

  v262 = *MEMORY[0x24BDAC8D0];
  if (!self->m_asset)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("MOVStreamReader asset is nil"), 25);
    return 0;
  }
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v176 = (__CFString *)CMTimeRangeCopyDescription(v4, &range);
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v176;
    _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_INFO, "Set reader to time range: %{public}@", buf, 0xCu);
  }

  if ((a3->var0.var2 & 1) == 0)
  {
    v7 = CFSTR("Time to reset to is invalid");
    v8 = a4;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", v8, v7, 25);
    v9 = 0;
    goto LABEL_11;
  }
  v8 = a4;
  if ((a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    v7 = CFSTR("Time range to reset to is invalid");
    goto LABEL_10;
  }
  m_assetReader = self->m_assetReader;
  if (m_assetReader)
    -[AVAssetReader cancelReading](m_assetReader, "cancelReading", a4);
  v12 = objc_alloc(MEMORY[0x24BDB23B8]);
  m_asset = self->m_asset;
  v249 = 0;
  v14 = (AVAssetReader *)objc_msgSend(v12, "initWithAsset:error:", m_asset, &v249);
  v173 = v249;
  v15 = self->m_assetReader;
  self->m_assetReader = v14;

  if (v173)
  {
    if (a4)
    {
      v9 = 0;
      *a4 = (id)objc_msgSend(v173, "copy");
    }
    else
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v149 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v173;
        _os_log_impl(&dword_210675000, v149, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
      }

      v9 = 0;
    }
    goto LABEL_197;
  }
  v16 = self;
  -[MOVStreamReader clearOutputs](self, "clearOutputs");
  v193 = (void *)objc_opt_new();
  -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1D48]);
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v261, 16);
  if (v17)
  {
    v177 = *(id *)v246;
    p_delegate = &self->_delegate;
    do
    {
      location = (id *)v17;
      for (i = 0; i != location; i = (id *)((char *)i + 1))
      {
        if (*(id *)v246 != v177)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v245 + 1) + 8 * (_QWORD)i);
        objc_msgSend(CFSTR("Unknown"), "stringByAppendingFormat:", CFSTR("-time-code"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSMutableArray count](v16->_orderedTimeCodeStreamIds, "count"))
        {
          objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("-%lu"), -[NSMutableArray count](v16->_orderedTimeCodeStreamIds, "count"));
          v22 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v22;
          v16 = self;
        }
        +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:forTrack:](MIOMovieMetadataUtility, "findAllAssociatedMetadataTracksInAsset:forTrack:", v16->m_asset, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "addObjectsFromArray:", v23);
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v21;
            _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup time code output for '%{public}@'.", buf, 0xCu);
          }

          v16 = self;
        }
        v25 = [MOVStreamReaderStreamOutput alloc];
        v26 = v16->m_assetReader;
        movVersion = v16->_movVersion;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        v244 = 0;
        v29 = -[MOVStreamReaderStreamOutput initWithTimeCodeTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:](v25, "initWithTimeCodeTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:", v20, v26, v23, movVersion, v21, self, WeakRetained, &v244);
        v30 = v244;

        if (v30)
        {
          v31 = objc_loadWeakRetained((id *)p_delegate);
          if (v31)
          {
            v32 = objc_loadWeakRetained((id *)p_delegate);
            v33 = objc_opt_respondsToSelector();

            if ((v33 & 1) != 0)
            {
              -[MOVStreamReader delegate](self, "delegate");
              v34 = objc_claimAutoreleasedReturnValue();
              -[NSObject reader:didReceiveWarning:](v34, "reader:didReceiveWarning:", self, v30);
LABEL_41:

            }
          }
        }
        else
        {
          v35 = +[MIOLog debugEnabled](MIOLog, "debugEnabled");
          v36 = self;
          if (v35)
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v21;
              _os_log_impl(&dword_210675000, v37, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register time code output for '%{public}@'.", buf, 0xCu);
            }

            v36 = self;
          }
          if (!-[MOVStreamReader registerOutput:](v36, "registerOutput:", v29))
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v21;
              _os_log_impl(&dword_210675000, v34, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register time code output for '%{public}@', failed.", buf, 0xCu);
            }
            goto LABEL_41;
          }
        }

        v16 = self;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v261, 16);
    }
    while (v17);
  }

  -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v242 = 0u;
  v243 = 0u;
  v240 = 0u;
  v241 = 0u;
  obja = v38;
  v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v240, v260, 16);
  if (!v39)
    goto LABEL_69;
  v178 = *(id *)v241;
  locationa = (id *)&self->_delegate;
  do
  {
    for (j = 0; j != v39; ++j)
    {
      if (*(id *)v241 != v178)
        objc_enumerationMutation(obja);
      v41 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * j);
      objc_msgSend(CFSTR("Unknown"), "stringByAppendingFormat:", CFSTR("-video"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](self->_orderedVideoStreamIds, "count"))
      {
        objc_msgSend(v42, "stringByAppendingFormat:", CFSTR("-%lu"), -[NSMutableArray count](self->_orderedVideoStreamIds, "count"));
        v43 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v43;
      }
      +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:forTrack:](MIOMovieMetadataUtility, "findAllAssociatedMetadataTracksInAsset:forTrack:", self->m_asset, v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "addObjectsFromArray:", v44);
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v42;
          _os_log_impl(&dword_210675000, v45, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup video output for '%{public}@'.", buf, 0xCu);
        }

      }
      v46 = [MOVStreamReaderStreamOutput alloc];
      v47 = self->m_assetReader;
      v48 = self->_movVersion;
      bufferCacheMode = self->_bufferCacheMode;
      v50 = objc_loadWeakRetained(locationa);
      v239 = 0;
      v51 = -[MOVStreamReaderStreamOutput initWithVideoTrack:assetReader:associatedMetadataTracks:version:bufferCacheMode:unknownStreamId:reader:delegate:error:](v46, "initWithVideoTrack:assetReader:associatedMetadataTracks:version:bufferCacheMode:unknownStreamId:reader:delegate:error:", v41, v47, v44, v48, bufferCacheMode, v42, self, v50, &v239);
      v52 = v239;

      if (v52)
      {
        v53 = objc_loadWeakRetained(locationa);
        if (v53)
        {
          v54 = objc_loadWeakRetained(locationa);
          v55 = objc_opt_respondsToSelector();

          if ((v55 & 1) != 0)
          {
            -[MOVStreamReader delegate](self, "delegate");
            v56 = objc_claimAutoreleasedReturnValue();
            -[NSObject reader:didReceiveWarning:](v56, "reader:didReceiveWarning:", self, v52);
LABEL_66:

          }
        }
      }
      else
      {
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v42;
            _os_log_impl(&dword_210675000, v57, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register video output for '%{public}@'.", buf, 0xCu);
          }

        }
        if (!-[MOVStreamReader registerOutput:](self, "registerOutput:", v51))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v42;
            _os_log_impl(&dword_210675000, v56, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register video output for '%{public}@', failed.", buf, 0xCu);
          }
          goto LABEL_66;
        }
      }

    }
    v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v240, v260, 16);
  }
  while (v39);
LABEL_69:

  -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  objb = v58;
  v59 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v235, v259, 16);
  v60 = self;
  if (!v59)
    goto LABEL_94;
  v179 = *(id *)v236;
  v61 = &self->_delegate;
  while (2)
  {
    locationb = (id *)v59;
    v62 = 0;
    while (2)
    {
      if (*(id *)v236 != v179)
        objc_enumerationMutation(objb);
      v63 = *(_QWORD *)(*((_QWORD *)&v235 + 1) + 8 * (_QWORD)v62);
      objc_msgSend(CFSTR("Unknown"), "stringByAppendingFormat:", CFSTR("-audio"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](v60->_orderedAudioStreamIds, "count"))
      {
        objc_msgSend(v64, "stringByAppendingFormat:", CFSTR("-%lu"), -[NSMutableArray count](v60->_orderedAudioStreamIds, "count"));
        v65 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v65;
        v60 = self;
      }
      +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:forTrack:](MIOMovieMetadataUtility, "findAllAssociatedMetadataTracksInAsset:forTrack:", v60->m_asset, v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "addObjectsFromArray:", v66);
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v64;
          _os_log_impl(&dword_210675000, v67, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup audio output for '%{public}@'.", buf, 0xCu);
        }

        v60 = self;
      }
      v68 = [MOVStreamReaderStreamOutput alloc];
      v69 = v60->m_assetReader;
      v70 = v60->_movVersion;
      v71 = objc_loadWeakRetained((id *)v61);
      v234 = 0;
      v72 = -[MOVStreamReaderStreamOutput initWithAudioTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:](v68, "initWithAudioTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:", v63, v69, v66, v70, v64, self, v71, &v234);
      v73 = v234;

      if (v73)
      {
        v74 = objc_loadWeakRetained((id *)v61);
        if (v74)
        {
          v75 = objc_loadWeakRetained((id *)v61);
          v76 = objc_opt_respondsToSelector();

          if ((v76 & 1) != 0)
          {
            -[MOVStreamReader delegate](self, "delegate");
            v77 = objc_claimAutoreleasedReturnValue();
            -[NSObject reader:didReceiveWarning:](v77, "reader:didReceiveWarning:", self, v73);
            goto LABEL_91;
          }
        }
      }
      else
      {
        v78 = +[MIOLog debugEnabled](MIOLog, "debugEnabled");
        v79 = self;
        if (v78)
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v64;
            _os_log_impl(&dword_210675000, v80, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register audio output for '%{public}@'.", buf, 0xCu);
          }

          v79 = self;
        }
        if (!-[MOVStreamReader registerOutput:](v79, "registerOutput:", v72))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v64;
            _os_log_impl(&dword_210675000, v77, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register audio output for '%{public}@', failed.", buf, 0xCu);
          }
LABEL_91:

        }
      }

      v62 = (id *)((char *)v62 + 1);
      v60 = self;
      if (locationb != v62)
        continue;
      break;
    }
    v59 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v235, v259, 16);
    if (v59)
      continue;
    break;
  }
LABEL_94:

  v172 = (id)*MEMORY[0x24BDB1D30];
  -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v232 = 0u;
  v233 = 0u;
  v230 = 0u;
  v231 = 0u;
  objc = v81;
  v82 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v230, v258, 16);
  v83 = self;
  if (!v82)
    goto LABEL_119;
  v180 = *(id *)v231;
  v84 = &self->_delegate;
  while (2)
  {
    locationc = (id *)v82;
    v85 = 0;
    while (2)
    {
      if (*(id *)v231 != v180)
        objc_enumerationMutation(objc);
      v86 = *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)v85);
      objc_msgSend(CFSTR("Unknown"), "stringByAppendingFormat:", CFSTR("-scene"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](v83->_orderedSceneStreamIds, "count"))
      {
        objc_msgSend(v87, "stringByAppendingFormat:", CFSTR("-%lu"), -[NSMutableArray count](v83->_orderedSceneStreamIds, "count"));
        v88 = objc_claimAutoreleasedReturnValue();

        v87 = (void *)v88;
        v83 = self;
      }
      +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:forTrack:](MIOMovieMetadataUtility, "findAllAssociatedMetadataTracksInAsset:forTrack:", v83->m_asset, v86);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "addObjectsFromArray:", v89);
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v87;
          _os_log_impl(&dword_210675000, v90, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup scene output for '%{public}@'.", buf, 0xCu);
        }

        v83 = self;
      }
      v91 = [MOVStreamReaderStreamOutput alloc];
      v92 = v83->m_assetReader;
      v93 = v83->_movVersion;
      v94 = objc_loadWeakRetained((id *)v84);
      v229 = 0;
      v95 = -[MOVStreamReaderStreamOutput initWithSceneTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:](v91, "initWithSceneTrack:assetReader:associatedMetadataTracks:version:unknownStreamId:reader:delegate:error:", v86, v92, v89, v93, v87, self, v94, &v229);
      v96 = v229;

      if (v96)
      {
        v97 = objc_loadWeakRetained((id *)v84);
        if (v97)
        {
          v98 = objc_loadWeakRetained((id *)v84);
          v99 = objc_opt_respondsToSelector();

          if ((v99 & 1) != 0)
          {
            -[MOVStreamReader delegate](self, "delegate");
            v100 = objc_claimAutoreleasedReturnValue();
            -[NSObject reader:didReceiveWarning:](v100, "reader:didReceiveWarning:", self, v96);
            goto LABEL_116;
          }
        }
      }
      else
      {
        v101 = +[MIOLog debugEnabled](MIOLog, "debugEnabled");
        v102 = self;
        if (v101)
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v87;
            _os_log_impl(&dword_210675000, v103, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register scene output for '%{public}@'.", buf, 0xCu);
          }

          v102 = self;
        }
        if (!-[MOVStreamReader registerOutput:](v102, "registerOutput:", v95))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v87;
            _os_log_impl(&dword_210675000, v100, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register scene output for '%{public}@', failed.", buf, 0xCu);
          }
LABEL_116:

        }
      }

      v85 = (id *)((char *)v85 + 1);
      v83 = self;
      if (locationc != v85)
        continue;
      break;
    }
    v82 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v230, v258, 16);
    if (v82)
      continue;
    break;
  }
LABEL_119:

  v104 = self;
  -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1D10]);
  v227 = 0u;
  v228 = 0u;
  v225 = 0u;
  v226 = 0u;
  v181 = (id)objc_claimAutoreleasedReturnValue();
  v105 = -[NSObject countByEnumeratingWithState:objects:count:](v181, "countByEnumeratingWithState:objects:count:", &v225, v257, 16);
  if (v105)
  {
    locationd = *(id **)v226;
    v106 = &self->_delegate;
    while (2)
    {
      for (k = 0; k != v105; ++k)
      {
        if (*(id **)v226 != locationd)
          objc_enumerationMutation(v181);
        v108 = *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * k);
        if ((objc_msgSend(v193, "containsObject:", v108) & 1) == 0)
        {
          objc_msgSend(CFSTR("Unknown"), "stringByAppendingFormat:", CFSTR("-metadata"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableArray count](v104->_orderedMetadataStreamIds, "count"))
          {
            objc_msgSend(v109, "stringByAppendingFormat:", CFSTR("-%lu"), -[NSMutableArray count](v104->_orderedMetadataStreamIds, "count"));
            v110 = objc_claimAutoreleasedReturnValue();

            v109 = (void *)v110;
            v104 = self;
          }
          if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v109;
              _os_log_impl(&dword_210675000, v111, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup metadata output for '%{public}@'.", buf, 0xCu);
            }

            v104 = self;
          }
          v112 = [MOVStreamReaderStreamOutput alloc];
          v113 = v104->m_assetReader;
          v114 = v104->_movVersion;
          v115 = objc_loadWeakRetained((id *)v106);
          v224 = 0;
          v116 = -[MOVStreamReaderStreamOutput initWithMetadataTrack:assetReader:version:unknownStreamId:reader:delegate:error:](v112, "initWithMetadataTrack:assetReader:version:unknownStreamId:reader:delegate:error:", v108, v113, v114, v109, self, v115, &v224);
          v117 = v224;

          if (v117)
          {
            v118 = objc_loadWeakRetained((id *)v106);
            if (v118)
            {
              v119 = objc_loadWeakRetained((id *)v106);
              v120 = objc_opt_respondsToSelector();

              if ((v120 & 1) != 0)
              {
                -[MOVStreamReader delegate](self, "delegate");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "reader:didReceiveWarning:", self, v117);

              }
            }
          }
          else
          {
            v122 = +[MIOLog debugEnabled](MIOLog, "debugEnabled");
            v123 = self;
            if (v122)
            {
              +[MIOLog defaultLog](MIOLog, "defaultLog");
              v124 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v109;
                _os_log_impl(&dword_210675000, v124, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register metadata output for '%{public}@'.", buf, 0xCu);
              }

              v123 = self;
            }
            if (!-[MOVStreamReader registerOutput:](v123, "registerOutput:", v116))
            {
              +[MIOLog defaultLog](MIOLog, "defaultLog");
              v125 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v109;
                _os_log_impl(&dword_210675000, v125, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register metadata output for '%{public}@', failed.", buf, 0xCu);
              }

            }
            if (-[MOVStreamReaderStreamOutput isTimeRangeMetadataStream](v116, "isTimeRangeMetadataStream")
              && !self->_timeRangeMetadataSamples)
            {
              v150 = *(_OWORD *)&a3->var0.var3;
              v223[0] = *(_OWORD *)&a3->var0.var0;
              v223[1] = v150;
              v223[2] = *(_OWORD *)&a3->var1.var1;
              -[AVAssetReader setTimeRange:](self->m_assetReader, "setTimeRange:", v223);
              if (-[AVAssetReader startReading](self->m_assetReader, "startReading"))
              {
                -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                -[MOVStreamReader metadataTrackForStream:](self, "metadataTrackForStream:", v151);
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                v153 = v152 == 0;

                if (!v153)
                {
                  locationf = (id *)objc_opt_new();
                  v154 = 0;
                  v155 = 0;
                  while (1)
                  {
                    v222 = 0;
                    v221 = 0;
                    -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    v218 = v154;
                    -[MOVStreamReader grabNextTimeRangeMetadataSampleOfStream:rangeStartTime:rangeEndTime:presentationTimeRange:error:](self, "grabNextTimeRangeMetadataSampleOfStream:rangeStartTime:rangeEndTime:presentationTimeRange:error:", v156, &v222, &v221, 0, &v218);
                    v157 = v218;

                    v219 = *(_QWORD *)buf;
                    v158 = v255;
                    v220 = *(_DWORD *)&buf[8];
                    v159 = v256;

                    -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    v161 = -[MOVStreamReader hasReachedEndOfMetadataStream:](self, "hasReachedEndOfMetadataStream:", v160);

                    if (v161)
                      break;
                    if ((v158 & 1) == 0)
                    {
                      -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      NSLog(CFSTR("Time code that was read for stream %@ was not valid , error: %@"), v171, v157);
LABEL_192:

                      v9 = 0;
                      goto LABEL_193;
                    }
                    if (v155 >= v222 || v221 <= v222)
                    {
                      -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      NSLog(CFSTR("Time ranges are not strictly increasing or overlap for stream %@, error: %@"), v171, v157);
                      goto LABEL_192;
                    }
                    v162 = (void *)objc_opt_new();
                    objc_msgSend(v162, "setStartTime:", v222);
                    objc_msgSend(v162, "setEndTime:", v221);
                    v214 = v219;
                    v215 = v220;
                    v216 = v158;
                    v217 = v159;
                    objc_msgSend(v162, "setTimeCode:", &v214);
                    objc_msgSend(locationf, "addObject:", v162);
                    v155 = v222;

                    v154 = v157;
                  }
                  v165 = (NSArray *)objc_msgSend(locationf, "copy");
                  timeRangeMetadataSamples = self->_timeRangeMetadataSamples;
                  self->_timeRangeMetadataSamples = v165;

                  -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                  v167 = (NSString *)objc_claimAutoreleasedReturnValue();
                  timeRangeMetadataStream = self->_timeRangeMetadataStream;
                  self->_timeRangeMetadataStream = v167;

                  v212 = *MEMORY[0x24BDC0D90];
                  v213 = *(_QWORD *)(MEMORY[0x24BDC0D90] + 16);
                  v211 = 0;
                  v9 = -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v212, &v211);
                  v169 = v211;
                  if (!v9)
                  {
                    -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                    NSLog(CFSTR("Could not reset reader for time range metadata read of stream %@, error: %@"), v170, v169);

                  }
LABEL_193:

                  goto LABEL_194;
                }
                -[MOVStreamReaderStreamOutput streamId](v116, "streamId");
                v157 = (id)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("Could not create reader for stream %@ to build timed metadata track data structure, error: %@"), v157, 0);
              }
              else
              {
                v163 = (void *)MEMORY[0x24BDD17C8];
                -[AVAssetReader error](self->m_assetReader, "error");
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v163, "stringWithFormat:", CFSTR("Start Reading (AVAssetReader) Error: %@  Status: %ld"), v164, -[AVAssetReader status](self->m_assetReader, "status"));
                v157 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v157, 4);
              }
              v9 = 0;
LABEL_194:

              locatione = v181;
              goto LABEL_195;
            }
          }

          v104 = self;
        }
      }
      v105 = -[NSObject countByEnumeratingWithState:objects:count:](v181, "countByEnumeratingWithState:objects:count:", &v225, v257, 16);
      if (v105)
        continue;
      break;
    }
  }

  locatione = dispatch_group_create();
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  -[NSMutableDictionary allValues](self->_sampleStreams, "allValues");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v126;
  v128 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v207, v253, 16);
  if (v128)
  {
    v129 = *(_QWORD *)v208;
    v130 = *MEMORY[0x24BDB20E8];
    do
    {
      for (m = 0; m != v128; ++m)
      {
        if (*(_QWORD *)v208 != v129)
          objc_enumerationMutation(v127);
        v132 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * m);
        v203 = 0u;
        v204 = 0u;
        v205 = 0u;
        v206 = 0u;
        objc_msgSend(v132, "getAssociatedMetadataStreamOutputs");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v203, v252, 16);
        if (v134)
        {
          v135 = *(_QWORD *)v204;
          do
          {
            for (n = 0; n != v134; ++n)
            {
              if (*(_QWORD *)v204 != v135)
                objc_enumerationMutation(v133);
              objc_msgSend(v132, "registerForAssociating:trackRelation:", *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * n), v130);
            }
            v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v203, v252, 16);
          }
          while (v134);
        }

      }
      v126 = v127;
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v207, v253, 16);
    }
    while (v128);
  }

  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v137 = self;
  -[NSMutableDictionary allValues](self->_sampleStreams, "allValues");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v199, v251, 16);
  if (v139)
  {
    v140 = *(_QWORD *)v200;
    v141 = *MEMORY[0x24BDB20F0];
    do
    {
      for (ii = 0; ii != v139; ++ii)
      {
        if (*(_QWORD *)v200 != v140)
          objc_enumerationMutation(v138);
        v143 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * ii);
        if (objc_msgSend(v143, "mediaType") != 4)
        {
          objc_initWeak((id *)buf, v137);
          dispatch_group_enter(locatione);
          objc_msgSend(v143, "assetTrack");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v196[0] = MEMORY[0x24BDAC760];
          v196[1] = 3221225472;
          v196[2] = __50__MOVStreamReader_resetReaderWithTimeRange_error___block_invoke;
          v196[3] = &unk_24CA45098;
          v196[4] = v143;
          v197 = locatione;
          objc_copyWeak(&v198, (id *)buf);
          objc_msgSend(v144, "loadAssociatedTracksOfType:completionHandler:", v141, v196);

          objc_destroyWeak(&v198);
          objc_destroyWeak((id *)buf);
          v137 = self;
        }
      }
      v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v199, v251, 16);
    }
    while (v139);
  }

  v145 = locatione;
  dispatch_group_wait(locatione, 0xFFFFFFFFFFFFFFFFLL);
  v146 = *(_OWORD *)&a3->var0.var3;
  v195[0] = *(_OWORD *)&a3->var0.var0;
  v195[1] = v146;
  v195[2] = *(_OWORD *)&a3->var1.var1;
  -[AVAssetReader setTimeRange:](self->m_assetReader, "setTimeRange:", v195);
  v9 = -[AVAssetReader startReading](self->m_assetReader, "startReading");
  if (!v9)
  {
    v147 = (void *)MEMORY[0x24BDD17C8];
    -[AVAssetReader error](self->m_assetReader, "error");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "stringWithFormat:", CFSTR("Start Reading (AVAssetReader) Error: %@  Status: %ld"), v148, -[AVAssetReader status](self->m_assetReader, "status"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v109, 4);
LABEL_195:

    v145 = locatione;
  }

LABEL_197:
LABEL_11:

  return v9;
}

void __50__MOVStreamReader_resetReaderWithTimeRange_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id *WeakRetained;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v16 = a3;
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not determine time code associations for %@, error: %@"), v6, v16);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained && objc_msgSend(v5, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(WeakRetained[3], "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v18;
        v10 = *MEMORY[0x24BDB20F0];
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v12, "mediaType") == 4)
            {
              objc_msgSend(v12, "assetTrack");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v5, "containsObject:", v13);

              if (v14)
                objc_msgSend(v12, "registerForAssociating:trackRelation:", *(_QWORD *)(a1 + 32), v10);
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

  }
}

- (id)timeRangeMetadataForPixelBuffer:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  if (self->_timeRangeMetadataSamples)
  {
    -[MOVStreamReader timeRangeMetadataKey](self, "timeRangeMetadataKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    if (a3 && v5)
    {
      CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVStreamReader timeRangeMetadataKey](self, "timeRangeMetadataKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_msgSend(v9, "unsignedLongLongValue");
        v11 = -[NSArray count](self->_timeRangeMetadataSamples, "count");
        v12 = v11 - 1;
        if (v11 >= 1)
        {
          v13 = 0;
          do
          {
            v14 = v12 - v13;
            if (v12 < v13)
              ++v14;
            v15 = v13 + (v14 >> 1);
            -[NSArray objectAtIndexedSubscript:](self->_timeRangeMetadataSamples, "objectAtIndexedSubscript:", v15);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v6, "startTime") <= v10)
            {
              if (objc_msgSend(v6, "endTime") >= v10)
                goto LABEL_15;
              v13 = v15 + 1;
            }
            else
            {
              v12 = v15 - 1;
            }

          }
          while (v13 <= v12);
        }
      }
      v6 = 0;
LABEL_15:

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)saveStream:(id)a3 toFile:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  char v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v31 = a4;
  v8 = (void *)objc_opt_new();
  -[MOVStreamReader trackForStream:](self, "trackForStream:", v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[MOVStreamReader metadataTrackForStream:](self, "metadataTrackForStream:", v30),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v8, "addObject:", v9);
    +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:forTrack:](MIOMovieMetadataUtility, "findAllAssociatedMetadataTracksInAsset:forTrack:", self->m_asset, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v10;
    if (v10)
      objc_msgSend(v8, "addObjectsFromArray:", v10);
    v11 = objc_alloc(MEMORY[0x24BDB25C0]);
    -[AVURLAsset URL](self->m_asset, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithURL:options:error:", v12, 0, a5);

    if (v13)
    {
      objc_msgSend(v13, "tracks");
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (!-[MOVStreamReader isTrack:byIdInTracks:](self, "isTrack:byIdInTracks:", v18, v8))
              objc_msgSend(v13, "removeTrack:", v18);
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v15);
      }

      v19 = objc_alloc(MEMORY[0x24BDB23A8]);
      v20 = (void *)objc_msgSend(v19, "initWithAsset:presetName:", v13, *MEMORY[0x24BDB19E0]);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setOutputURL:", v21);

      objc_msgSend(v20, "setOutputFileType:", *MEMORY[0x24BDB1C40]);
      v22 = dispatch_group_create();
      dispatch_group_enter(v22);
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __43__MOVStreamReader_saveStream_toFile_error___block_invoke;
      v32[3] = &unk_24CA44D60;
      v23 = v22;
      v33 = v23;
      objc_msgSend(v20, "exportAsynchronouslyWithCompletionHandler:", v32);
      dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(v20, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (a5)
        v26 = v25;
      else
        v26 = 1;
      if ((v26 & 1) == 0)
      {
        objc_msgSend(v20, "error");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain stream '%@'."), v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v28, 3);

    v25 = 0;
  }

  return v25;
}

void __43__MOVStreamReader_saveStream_toFile_error___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)isTrack:(id)a3 byIdInTracks:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "trackID", (_QWORD)v12);
        if (v10 == objc_msgSend(v5, "trackID"))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)movVersionCheck
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  MIOVersion *v9;
  MIOVersion *v10;
  MIOVersion *movVersion;
  MIOVersion *v12;
  MIOVersion *v13;
  id WeakRetained;
  id v15;
  char v16;
  id v17;
  MIOVersion *v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  MIOVersion *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[MOVStreamReader movstreamIOMetadataForMovie](self, "movstreamIOMetadataForMovie");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  +[MIOVersion allVersionedKeysForKey:modifier:](MIOVersion, "allVersionedKeysForKey:modifier:", CFSTR("version"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v28;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v6)
        objc_enumerationMutation(v4);
      objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  v26 = 0;
  v9 = -[MIOVersion initWithVersionString:error:]([MIOVersion alloc], "initWithVersionString:error:", v8, &v26);
  v10 = (MIOVersion *)v26;
  movVersion = self->_movVersion;
  self->_movVersion = v9;

  if (!self->_movVersion)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", CFSTR("No or invalid MOVStreamIO version information in MOV!"), 22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "reader:didReceiveWarning:", self, v24);

      }
    }
    +[MIOVersion versionZero](MIOVersion, "versionZero");
    v18 = (MIOVersion *)objc_claimAutoreleasedReturnValue();
    v19 = self->_movVersion;
    self->_movVersion = v18;
    goto LABEL_22;
  }
  v25 = v10;
  v12 = -[MIOVersion initWithVersionString:error:]([MIOVersion alloc], "initWithVersionString:error:", CFSTR("3.29.2"), &v25);
  v13 = v25;

  if (v13)
    __assert_rtn("-[MOVStreamReader movVersionCheck]", "MOVStreamReader.mm", 786, "versionError == nil");
  if (-[MIOVersion compareToVersion:](v12, "compareToVersion:", self->_movVersion) == -1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MOV created with a newer MOVStreamIO version '%@' (current '%@')!"), self->_movVersion, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v20)
    {
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        v23 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v23, "reader:didReceiveWarning:", self, v19);

      }
    }
    v10 = v12;
LABEL_22:

    goto LABEL_23;
  }
  v10 = v12;
LABEL_23:

}

- (BOOL)l010OutputFormatRAW14L016
{
  return self->_l010OutputFormatRAW14L016;
}

- (void)setL010OutputFormatRAW14L016:(BOOL)a3
{
  AVAssetReader *m_assetReader;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (self->_l010OutputFormatRAW14L016 != a3)
  {
    self->_l010OutputFormatRAW14L016 = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      -[AVAssetReader timeRange](m_assetReader, "timeRange");
    }
    else
    {
      v6 = 0u;
      v7 = 0u;
      v5 = 0u;
    }
    v8 = v5;
    v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (BOOL)rawBayerMSBReplication
{
  return self->_rawBayerMSBReplication;
}

- (void)setRawBayerMSBReplication:(BOOL)a3
{
  AVAssetReader *m_assetReader;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (self->_rawBayerMSBReplication != a3)
  {
    self->_rawBayerMSBReplication = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      -[AVAssetReader timeRange](m_assetReader, "timeRange");
    }
    else
    {
      v6 = 0u;
      v7 = 0u;
      v5 = 0u;
    }
    v8 = v5;
    v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  AVAssetReader *m_assetReader;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (self->_bufferCacheMode != a3)
  {
    self->_bufferCacheMode = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      -[AVAssetReader timeRange](m_assetReader, "timeRange");
    }
    else
    {
      v6 = 0u;
      v7 = 0u;
      v5 = 0u;
    }
    v8 = v5;
    v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (BOOL)skipSynthesizedTimeCode
{
  return self->_skipSynthesizedTimeCode;
}

- (void)setSkipSynthesizedTimeCode:(BOOL)a3
{
  AVAssetReader *m_assetReader;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (self->_skipSynthesizedTimeCode != a3)
  {
    self->_skipSynthesizedTimeCode = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      -[AVAssetReader timeRange](m_assetReader, "timeRange");
    }
    else
    {
      v6 = 0u;
      v7 = 0u;
      v5 = 0u;
    }
    v8 = v5;
    v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (CGAffineTransform)transformForStream:(SEL)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  CGAffineTransform *result;
  id v11;

  v11 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "transform");
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }

  }
  else
  {
    v8 = MEMORY[0x24BDBD8B8];
    v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }

  return result;
}

- (id)metadataForMovie
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  -[AVURLAsset metadata](self->m_asset, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__MOVStreamReader_metadataForMovie__block_invoke;
  v9[3] = &unk_24CA45038;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void __35__MOVStreamReader_metadataForMovie__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:](MOVStreamIOUtility, "isMOVStreamIOMovMetadataIdentifier:", v3);

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)movstreamIOMetadataForMovie
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v26;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[AVURLAsset metadata](self->m_asset, "metadata");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v3)
  {
    v28 = *(_QWORD *)v37;
    *(_QWORD *)&v4 = 138543362;
    v26 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        +[MIOVersion allVersionedKeysForKey:modifier:](MIOVersion, "allVersionedKeysForKey:modifier:", CFSTR("mdta/com.apple.framework.state.MOVStreamIO"), 0, v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (!v8)
          goto LABEL_30;
        v9 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v33 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v6, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v11) = objc_msgSend(v12, "isEqualToString:", v11);

            if ((_DWORD)v11)
            {
              v31 = 0;
              v13 = (void *)MEMORY[0x24BDD1770];
              objc_msgSend(v6, "value");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v13) = objc_msgSend(v13, "propertyList:isValidForFormat:", v14, 100);

              if ((_DWORD)v13)
              {
                v15 = (void *)MEMORY[0x24BDD1770];
                objc_msgSend(v6, "value");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = 0;
                objc_msgSend(v15, "propertyListWithData:options:format:error:", v16, 0, &v31, &v30);
                v17 = objc_claimAutoreleasedReturnValue();
                v18 = v30;

                if (v18)
                {
                  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_DEBUG, "MOVStreamIO state metadata is not in PLIST format. Fallback to JSON.", buf, 2u);
                    }

                  }
                  v20 = (void *)v17;
LABEL_24:

                  v22 = (void *)MEMORY[0x24BDD1608];
                  objc_msgSend(v6, "value");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = 0;
                  objc_msgSend(v22, "JSONObjectWithData:options:error:", v23, 1, &v29);
                  v21 = objc_claimAutoreleasedReturnValue();
                  v18 = v29;

                  if (v18 && +[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v24 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v26;
                      v41 = v18;
                      _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_DEBUG, "MOVStreamIO state metadata JSON error: %{public}@", buf, 0xCu);
                    }

                  }
LABEL_29:

                  v2 = (void *)v21;
                  goto LABEL_30;
                }
                v2 = (void *)v17;
              }
              v18 = 0;
              v21 = (uint64_t)v2;
              v20 = 0;
              if (!v21)
                goto LABEL_24;
              goto LABEL_29;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
          if (v8)
            continue;
          break;
        }
LABEL_30:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v3);
  }

  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTimeOfMovie
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVURLAsset metadata](self->m_asset, "metadata", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.session.starttime"));

        if (v10)
        {
          if (v8)
          {
            objc_msgSend(v8, "valueAsMovSessionStartTime");
          }
          else
          {
            retstr->var0 = 0;
            *(_QWORD *)&retstr->var1 = 0;
            retstr->var3 = 0;
          }

          return result;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }

  v12 = MEMORY[0x24BDC0D38];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D38];
  retstr->var3 = *(_QWORD *)(v12 + 16);
  return result;
}

- (id)timeRangeMetadataKeyHint
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AVURLAsset metadata](self->m_asset, "metadata", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"));

        if (v8)
        {
          objc_msgSend(v6, "valueAsTimeRangeMetadataKeyHint");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)getTimeRangeMetadataStream
{
  NSString *v3;

  if (-[MOVStreamReader containsTimeRangeMetadataStream](self, "containsTimeRangeMetadataStream"))
    v3 = self->_timeRangeMetadataStream;
  else
    v3 = 0;
  return v3;
}

- (id)getRelatedStreamForStreamId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relatedStreamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getRelationSpecifierForStreamId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getStreamsRelatedToStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_sampleStreams, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "relatedStreamId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          objc_msgSend(v10, "streamId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)trackMetadataForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customTrackMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)customTrackMetadataItemsForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customTrackMetadataItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForMetadataStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsMetadataStream:](self, "containsMetadataStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customTrackMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasTimeCodeForStream:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasTimeCode");
  else
    v5 = 0;

  return v5;
}

- (BOOL)hasSynthesizedTimeCodeForStream:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "timeCodeIsSynthesized");
  else
    v5 = 0;

  return v5;
}

- (opaqueCMFormatDescription)timeCodeFormatDescriptionStream:(id)a3
{
  void *v3;
  void *v4;
  opaqueCMFormatDescription *v5;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (opaqueCMFormatDescription *)objc_msgSend(v3, "timeCodeFormatDescription");
  else
    v5 = 0;

  return v5;
}

- (CGSize)getSizeForStream:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double width;
  double v8;
  double height;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CMVideoDimensions Dimensions;
  double v17;
  double v18;
  CGSize result;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "assetTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "naturalSize");
    width = v6;
    height = v8;

    objc_msgSend(v4, "assetTrack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formatDescriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v4, "assetTrack");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "formatDescriptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v15);
      if (Dimensions.width >= 1 && Dimensions.height >= 1)
      {
        width = (double)Dimensions.width;
        height = (double)Dimensions.height;
      }
    }
  }
  else
  {
    width = *MEMORY[0x24BDBF148];
    height = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)getOutputSizeForStream:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  CGSize result;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MOVStreamReader getSizeForStream:](self, "getSizeForStream:", v4);
    v7 = v6;
    v9 = v8;
    if (!objc_msgSend(v5, "mediaType"))
    {
      v10 = v5;
      objc_msgSend(v10, "postProcessor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_254A75328);

      if (v12)
      {
        objc_msgSend(v10, "postProcessor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (double)(unint64_t)objc_msgSend(v13, "adjustedWidthForWidth:", (unint64_t)v7);

      }
    }
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v14 = v7;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (unsigned)getOutputPixelFormatForStream:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "getOutputPixelFormatForStream");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)getOutputPixelFormatWasGuessedForStream:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "getOutputPixelFormatWasGuessedForStream");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)trackTypeInfoForStream:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "trackTypeInfo");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)trackForStream:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "assetTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)metadataTrackForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MOVStreamReader containsMetadataStream:](self, "containsMetadataStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)getFrameRateForStream:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  float v8;

  v4 = a3;
  v5 = 0.0;
  if (-[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetTrack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nominalFrameRate");
    v5 = v8;

  }
  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getMinFrameDurationForStream:(SEL)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v11;

  v11 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetTrack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "minFrameDuration");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }

  }
  else
  {
    v9 = MEMORY[0x24BDC0D38];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D38];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }

  return result;
}

- (unsigned)pixelFormatForStream:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "pixelFormatForStream");
  else
    v5 = -1;

  return v5;
}

- (void)removePixelBufferPadding:(BOOL)a3 forStream:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removePixelBufferPadding:", v4);

  }
}

- (double)duration
{
  AVURLAsset *m_asset;
  CMTime time;

  m_asset = self->m_asset;
  if (m_asset)
    -[AVURLAsset duration](m_asset, "duration");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstPts
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTime time1;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D38];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AVURLAsset tracks](self->m_asset, "tracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        if ((retstr->var2 & 1) == 0)
          goto LABEL_11;
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "timeRange");
        }
        else
        {
          v12 = 0u;
          v13 = 0u;
          v11 = 0u;
        }
        *(_OWORD *)&time1.value = v11;
        time1.epoch = v12;
        v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) < 0)
        {
LABEL_11:
          if (v8)
          {
            objc_msgSend(v8, "timeRange");
          }
          else
          {
            v12 = 0u;
            v13 = 0u;
            v11 = 0u;
          }
          *(_OWORD *)&retstr->var0 = v11;
          retstr->var3 = v12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return result;
}

- (id)timestampsForStream:(id)a3 restrictedTimeRange:(id *)a4
{
  id v6;
  MOVStreamTimestamps *v7;
  void *v8;
  __int128 v9;
  MOVStreamTimestamps *v10;
  _OWORD v12[3];

  v6 = a3;
  v7 = [MOVStreamTimestamps alloc];
  -[MOVStreamReader trackForStream:](self, "trackForStream:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  v10 = -[MOVStreamTimestamps initWithAssetTrack:restrictedTimeRange:](v7, "initWithAssetTrack:restrictedTimeRange:", v8, v12);

  return v10;
}

- (id)timestampsForStream:(id)a3
{
  id v4;
  MOVStreamTimestamps *v5;
  void *v6;
  MOVStreamTimestamps *v7;

  v4 = a3;
  v5 = [MOVStreamTimestamps alloc];
  -[MOVStreamReader trackForStream:](self, "trackForStream:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOVStreamTimestamps initWithAssetTrack:](v5, "initWithAssetTrack:", v6);

  return v7;
}

- (id)timestampsForMetadataStream:(id)a3
{
  id v4;
  MOVStreamTimestamps *v5;
  void *v6;
  MOVStreamTimestamps *v7;

  v4 = a3;
  v5 = [MOVStreamTimestamps alloc];
  -[MOVStreamReader metadataTrackForStream:](self, "metadataTrackForStream:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOVStreamTimestamps initWithAssetTrack:](v5, "initWithAssetTrack:", v6);

  -[MOVStreamTimestamps setShouldStartTimestampsAtZero:](v7, "setShouldStartTimestampsAtZero:", 0);
  return v7;
}

- (BOOL)containsStream:(id)a3 withMediaType:(int64_t)a4
{
  id v6;
  char v7;

  v6 = a3;
  if ((unint64_t)a4 >= 5)
    v7 = 0;
  else
    v7 = objc_msgSend(*(id *)((char *)&self->super.isa + qword_2106E4750[a4]), "containsObject:", v6);

  return v7;
}

- (BOOL)containsStream:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsMetadataStream:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsTimeRangeMetadataStream
{
  return self->_timeRangeMetadataSamples != 0;
}

- (id)getAllStreams
{
  return (id)-[NSMutableArray copy](self->_orderedVideoStreamIds, "copy");
}

- (id)getAllAudioStreams
{
  return (id)-[NSMutableArray copy](self->_orderedAudioStreamIds, "copy");
}

- (id)getAllSceneStreams
{
  return (id)-[NSMutableArray copy](self->_orderedSceneStreamIds, "copy");
}

- (id)getAllTimeCodeStreams
{
  return (id)-[NSMutableArray copy](self->_orderedTimeCodeStreamIds, "copy");
}

- (id)trackMetadataForAudioStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") == 1)
  {
    -[MOVStreamReader trackMetadataForStream:](self, "trackMetadataForStream:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForSceneStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") == 3)
  {
    -[MOVStreamReader trackMetadataForStream:](self, "trackMetadataForStream:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForTimeCodeStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") == 4)
  {
    -[MOVStreamReader trackMetadataForStream:](self, "trackMetadataForStream:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForVideoStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType"))
  {
    v6 = 0;
  }
  else
  {
    -[MOVStreamReader trackMetadataForStream:](self, "trackMetadataForStream:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)trackMetadataForStream:(id)a3 withMediaType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4 == 2)
  {
    -[MOVStreamReader trackMetadataForMetadataStream:](self, "trackMetadataForMetadataStream:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "mediaType") == a4)
    {
      -[MOVStreamReader trackMetadataForStream:](self, "trackMetadataForStream:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)containsAudioStream:(id)a3
{
  return -[NSMutableArray containsObject:](self->_orderedAudioStreamIds, "containsObject:", a3);
}

- (id)getAllMetadataStreams
{
  return (id)-[NSMutableArray copy](self->_orderedMetadataStreamIds, "copy");
}

- (id)getUnknownMetadataStreamsAssociatedTo:(id)a3
{
  -[MOVStreamReader getMetadataStreamsAssociatedTo:error:](self, "getMetadataStreamsAssociatedTo:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getMetadataStreamsAssociatedTo:(id)a3
{
  -[MOVStreamReader getMetadataStreamsAssociatedTo:error:](self, "getMetadataStreamsAssociatedTo:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getMetadataStreamsAssociatedTo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "getAssociatedMetadataStreams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain stream '%@'."), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 3);

    v9 = 0;
  }

  return v9;
}

- (id)outputForVideoStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (!objc_msgSend(v7, "mediaType"))
      {
        v10 = v8;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream '%@' is not a video stream."), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v9, 7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v9, 7);
    }

    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id."), 7);
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)outputForAudioStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "mediaType") == 1)
      {
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream '%@' is not an audio stream."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }

    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id."), 7);
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)outputForSceneStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "mediaType") == 3)
      {
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream '%@' is not a scene stream."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }

    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id."), 7);
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)outputForTimeCodeStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "mediaType") == 4)
      {
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream '%@' is not a time code stream."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }

    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id."), 7);
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)outputForMetadataStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "mediaType") == 2)
      {
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream '%@' is not a metadata stream."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);
    }

    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id."), 7);
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)outputsRelatedToOutput:(id)a3 trackAssociation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "associatedOutputs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nonretainedObjectValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v6)
          objc_msgSend(v7, "addObject:", v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  opaqueCMSampleBuffer *v15;
  void *v16;

  v10 = a3;
  v11 = v10;
  if (a5)
  {
    v12 = *MEMORY[0x24BDC0D38];
    a5->var3 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    *(_OWORD *)&a5->var0 = v12;
  }
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "nextSampleBufferForStreamAttachmentsData:timestamp:error:", a4, a5, a6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v16, 7);

      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, CFSTR("Missing stream id for copy next frame."), 7);
    v15 = 0;
  }

  return v15;
}

- (__CVBuffer)nextPixelBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  __CVBuffer *v15;
  void *v16;

  v10 = a3;
  v11 = v10;
  if (a5)
  {
    v12 = *MEMORY[0x24BDC0D38];
    a5->var3 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    *(_OWORD *)&a5->var0 = v12;
  }
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = (__CVBuffer *)objc_msgSend(v13, "nextPixelBufferForStreamAttachmentsData:timestamp:error:", a4, a5, a6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v16, 7);

      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, CFSTR("Missing stream id for copy next frame."), 7);
    v15 = 0;
  }

  return v15;
}

- (BOOL)copyNextStereoFramesForStream:(id)a3 leftBuffer:(__CVBuffer *)a4 rightBuffer:(__CVBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;

  v12 = a3;
  if (v12)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "copyNextStereoFrames:rightBuffer:timestamp:error:", a4, a5, a6, a7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a7, v16, 7);

      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a7, CFSTR("Missing stream id for copy next frame."), 7);
    v15 = 0;
  }

  return v15;
}

- (BOOL)isStereoStream:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStereoVideoStream");

  return v4;
}

- (id)stereoLayersForStream:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoLayerIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)additionalCompressionPropertiesForStream:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalCompressionProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  __CVBuffer *v11;
  void *v12;
  CVPixelBufferRef texture;
  __CVBuffer *v15;

  v8 = a3;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (!objc_msgSend(v9, "isStereoVideoStream"))
      {
        v11 = (__CVBuffer *)objc_msgSend(v10, "copyNextFrameForStreamTimestamp:error:", a4, a5);
        goto LABEL_10;
      }
      texture = 0;
      v15 = 0;
      if (objc_msgSend(v10, "copyNextStereoFrames:rightBuffer:timestamp:error:", &v15, &texture, a4, a5))
      {
        CVPixelBufferRelease(texture);
        v11 = v15;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v12, 7);

    }
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, CFSTR("Missing stream id for copy next frame."), 7);
  v11 = 0;
LABEL_11:

  return v11;
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  __CVBuffer *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  uint64_t v21;

  v12 = a3;
  if (v12)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = (__CVBuffer *)objc_msgSend(v13, "copyNextFrameForStreamTimestamp:timeCode:tcDropFrame:error:", a4, a5, a6, a7);
      if (a5 && self->_timeRangeMetadataSamples && self->_timeRangeMetadataKey)
      {
        -[MOVStreamReader timeRangeMetadataForPixelBuffer:](self, "timeRangeMetadataForPixelBuffer:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "timeCode");
          *(_OWORD *)&a5->subframes = v20;
          *(_QWORD *)&a5->hours = v21;
        }
        else
        {
          *(_QWORD *)&a5->subframes = 0;
          *(_QWORD *)&a5->type = 0;
          *(_QWORD *)&a5->hours = 0;
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a7, v18, 7);

      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a7, CFSTR("Missing stream id for copy next frame."), 7);
    v15 = 0;
  }

  return v15;
}

- (CVSMPTETime)grabNextTimeCodeSampleForStream:(SEL)a3 timestamp:(id)a4 error:(id *)a5
{
  CVSMPTETime *result;
  CVSMPTETime *v8;
  char v9;

  result = -[MOVStreamReader grabNextSampleBufferForStream:timestamp:error:](self, "grabNextSampleBufferForStream:timestamp:error:", a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = 0;
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;
    *(_QWORD *)&retstr->subframes = 0;
    +[MOVStreamIOUtility timecode32ForSampleBuffer:dropFrame:](MOVStreamIOUtility, "timecode32ForSampleBuffer:dropFrame:", result, &v9);
    CFRelease(v8);
  }
  else
  {
    *(_QWORD *)&retstr->subframes = 0;
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;
  }
  return result;
}

- (opaqueCMSampleBuffer)grabNextSampleBufferForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  opaqueCMSampleBuffer *v11;
  void *v12;

  v8 = a3;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (opaqueCMSampleBuffer *)objc_msgSend(v9, "grabNextSampleBufferForStreamTimestamp:error:", a4, a5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v12, 7);

      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, CFSTR("Missing stream id for copy next frame."), 7);
    v11 = 0;
  }

  return v11;
}

- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 startTime:(id)a4 endTime:(unint64_t *)a5 error:(unint64_t *)a6
{
  return -[MOVStreamReader grabNextTimeRangeMetadataSampleOfStream:rangeStartTime:rangeEndTime:presentationTimeRange:error:](self, "grabNextTimeRangeMetadataSampleOfStream:rangeStartTime:rangeEndTime:presentationTimeRange:error:", a4, a5, a6, 0, a7);
}

- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 rangeStartTime:(id)a4 rangeEndTime:(unint64_t *)a5 presentationTimeRange:(unint64_t *)a6 error:(id *)a7
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  CVSMPTETime *result;
  unint64_t *v34;
  $69C59A32909E13F94AB58097350E6BB9 *v35;
  id *v36;
  CVSMPTETime *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  if (v14)
  {
    v39 = v14;
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v15;
    if (v15)
    {
      if ((objc_msgSend(v15, "isTimeRangeMetadataStream") & 1) != 0)
      {
        -[MOVStreamReader grabNextTimedMetadataGroupOfStream:error:](self, "grabNextTimedMetadataGroupOfStream:error:", v14, a8);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "endOfStreamReached"))
        {
          *(_QWORD *)&retstr->subframes = 0;
          *(_QWORD *)&retstr->type = 0;
          *(_QWORD *)&retstr->hours = 0;
LABEL_40:

          goto LABEL_41;
        }
        objc_msgSend(v38, "items");
        v49 = 0uLL;
        v50 = 0;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        v36 = a8;
        v37 = retstr;
        if (v17)
        {
          v34 = a6;
          v35 = a7;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v21 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v46 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v23, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(CFSTR("mdta/com.apple.stream_time_code"), "isEqualToString:", v24);

              if (v25)
              {
                if (v23)
                {
                  objc_msgSend(v23, "valueAsTimeCode");
                }
                else
                {
                  v42 = 0uLL;
                  *(_QWORD *)&v43 = 0;
                }
                v20 |= 1u;
                v49 = v42;
                v50 = v43;
              }
              else
              {
                objc_msgSend(v23, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(CFSTR("mdta/com.apple.stream_time_range_start"), "isEqualToString:", v26);

                if (v27)
                {
                  objc_msgSend(v23, "numberValue");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v28, "unsignedLongLongValue");

                  v20 |= 2u;
                }
                else
                {
                  objc_msgSend(v23, "identifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(CFSTR("mdta/com.apple.stream_time_range_end"), "isEqualToString:", v29);

                  if (v30)
                  {
                    objc_msgSend(v23, "numberValue");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v31, "unsignedLongLongValue");

                    v20 |= 4u;
                  }
                }
              }
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          }
          while (v17);

          if (v20 == 7)
          {
            if (a5)
              *a5 = v18;
            if (v34)
              *v34 = v19;
            if (v35)
            {
              if (v38)
              {
                objc_msgSend(v38, "timeRange");
              }
              else
              {
                v43 = 0u;
                v44 = 0u;
                v42 = 0u;
              }
              *(_OWORD *)&v35->var0.var0 = v42;
              *(_OWORD *)&v35->var0.var3 = v43;
              *(_OWORD *)&v35->var1.var1 = v44;
            }
            *(_OWORD *)&v37->subframes = v49;
            *(_QWORD *)&v37->hours = v50;
            goto LABEL_39;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The metadata stream '%@' did not contain all metadata items to be time range metadata."), v39);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", v36, v32, 31);
        *(_QWORD *)&v37->subframes = 0;
        *(_QWORD *)&v37->type = 0;
        *(_QWORD *)&v37->hours = 0;

LABEL_39:
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The metadata stream '%@' is not indicated as time range metadata."), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a8, v16, 31);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a8, v16, 7);
    }
    *(_QWORD *)&retstr->subframes = 0;
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;

LABEL_41:
    v14 = v39;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a8, CFSTR("Missing stream id for copy next frame."), 7);
  *(_QWORD *)&retstr->subframes = 0;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->hours = 0;
LABEL_42:

  return result;
}

- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4
{
  -[MOVStreamReader grabNextMetadataOfStream:timeRange:error:](self, "grabNextMetadataOfStream:timeRange:error:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)grabNextMetadataItemsOfTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 timeRange:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "grabNextMetadataItemsOfTrackAssociatedWithStreamWithIdentifier:timeRange:error:", v11, a5, a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v15, 7);

      v14 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, CFSTR("Missing stream id for copy next frame."), 7);
    v14 = 0;
  }

  return v14;
}

- (id)nextAttachmentForStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "nextAttachmentWithError:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't contain data for requested stream '%@'."), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v10, 7);

    v9 = 0;
  }

  return v9;
}

- (id)grabNextTimedMetadataGroupOfStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "grabNextTimedMetadataGroupOfStreamError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, CFSTR("Missing stream id for copy next frame."), 7);
    v8 = 0;
  }

  return v8;
}

- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!v8)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", CFSTR("Cannot grab metadata. Missing metadata stream id."), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      v11 = 0;
      goto LABEL_18;
    }
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v16 = CFSTR("Cannot grab metadata. Missing metadata stream id.");
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamReader]: %{public}@ ⚠️⚠️⚠️", buf, 0xCu);
    }
    goto LABEL_16;
  }
  -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot grab metadata. Unknown metadata stream '%@'."), v8);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", v12, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamReader]: %{public}@ ⚠️⚠️⚠️", buf, 0xCu);
      }

    }
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  -[NSObject grabNextMetadataOfStreamTimeRange:error:](v9, "grabNextMetadataOfStreamTimeRange:error:", a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  return v11;
}

- (BOOL)endOfStream
{
  return -[AVAssetReader status](self->m_assetReader, "status") != AVAssetReaderStatusReading;
}

- (BOOL)hasFinishedReading
{
  return -[AVAssetReader status](self->m_assetReader, "status") != AVAssetReaderStatusReading;
}

- (BOOL)hasReachedEndOfStream:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (v4 && -[MOVStreamReader containsStream:](self, "containsStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_sampleStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "endOfStreamReached");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasReachedEndOfMetadataStream:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (v4 && -[MOVStreamReader containsMetadataStream:](self, "containsMetadataStream:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_metadataStreams, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "endOfStreamReached");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)skipEmptyEditVideoFrame
{
  return self->_skipEmptyEditVideoFrame;
}

- (void)setSkipEmptyEditVideoFrame:(BOOL)a3
{
  self->_skipEmptyEditVideoFrame = a3;
}

- (BOOL)restrictVideoFramesToEdits
{
  return self->_restrictVideoFramesToEdits;
}

- (void)setRestrictVideoFramesToEdits:(BOOL)a3
{
  self->_restrictVideoFramesToEdits = a3;
}

- (NSString)timeRangeMetadataKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTimeRangeMetadataKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (MOVStreamReaderDelegate)delegate
{
  return (MOVStreamReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeRangeMetadataKey, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataSamples, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataStream, 0);
  objc_storeStrong((id *)&self->_movVersion, 0);
  objc_storeStrong((id *)&self->_orderedMetadataStreamIds, 0);
  objc_storeStrong((id *)&self->_metadataStreams, 0);
  objc_storeStrong((id *)&self->_orderedTimeCodeStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedSceneStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedAudioStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedVideoStreamIds, 0);
  objc_storeStrong((id *)&self->_sampleStreams, 0);
  objc_storeStrong((id *)&self->m_assetReader, 0);
  objc_storeStrong((id *)&self->m_asset, 0);
}

@end
