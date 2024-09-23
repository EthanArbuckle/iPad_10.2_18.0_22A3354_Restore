@implementation HMIVideoAnalyzerConfiguration

- (HMIVideoAnalyzerConfiguration)init
{
  char *v2;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  CMTime v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerConfiguration;
  v2 = -[HMIVideoAnalyzerConfiguration init](&v11, sel_init);
  if (v2)
  {
    CMTimeMake(&v10, 1, 1);
    v3 = *(_OWORD *)&v10.value;
    *((_QWORD *)v2 + 14) = v10.epoch;
    *((_OWORD *)v2 + 6) = v3;
    *((_QWORD *)v2 + 6) = 100;
    v4 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v2 + 120) = *MEMORY[0x24BDC0D40];
    *((_QWORD *)v2 + 17) = *(_QWORD *)(v4 + 16);
    CMTimeMake(&v10, 20, 1);
    v5 = *(_OWORD *)&v10.value;
    *((_QWORD *)v2 + 20) = v10.epoch;
    *((_OWORD *)v2 + 9) = v5;
    *((_DWORD *)v2 + 4) = 1635148593;
    *((_QWORD *)v2 + 7) = 0x4014000000000000;
    CMTimeMake(&v10, 8, 1);
    v6 = *(_OWORD *)&v10.value;
    *((_QWORD *)v2 + 23) = v10.epoch;
    *(_OWORD *)(v2 + 168) = v6;
    *((_QWORD *)v2 + 10) = 2;
    v2[8] = 1;
    v2[9] = 1;
    v7 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;

    v8 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

    *((_QWORD *)v2 + 3) = 0x3FE8000000000000;
    *((_QWORD *)v2 + 4) = 0x3FD0000000000000;
    *((_QWORD *)v2 + 11) = 1;
    v2[10] = 0;
    v2[11] = 1;
    *((_WORD *)v2 + 6) = 1;
    *((_DWORD *)v2 + 5) = 1635148593;
    *((_QWORD *)v2 + 5) = 0x3FF0000000000000;
  }
  return (HMIVideoAnalyzerConfiguration *)v2;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int64_t v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  CMTime v70;
  CMTime v71;
  CMTime v72;
  CMTime time;
  _QWORD v74[20];

  v74[18] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration thumbnailInterval](self, "thumbnailInterval");
  objc_msgSend(v4, "numberWithDouble:", CMTimeGetSeconds(&time));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Thumbnail Interval"), v69);
  v74[0] = v68;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerConfiguration thumbnailHeight](self, "thumbnailHeight"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Thumbnail Height"), v67);
  v74[1] = v66;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration timelapseInterval](self, "timelapseInterval");
  objc_msgSend(v7, "numberWithDouble:", CMTimeGetSeconds(&v72));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Timelapse Interval"), v65);
  v74[2] = v64;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration timelapsePreferredFragmentDuration](self, "timelapsePreferredFragmentDuration");
  objc_msgSend(v9, "numberWithDouble:", CMTimeGetSeconds(&v71));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Timelapse Preferred Fragment Duration"), v63);
  v74[3] = v62;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  HMIFourCCString(-[HMIVideoAnalyzerConfiguration timelapseCodecType](self, "timelapseCodecType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Timelapse Codec"), v61);
  v74[4] = v60;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration maxFragmentDuration](self, "maxFragmentDuration");
  objc_msgSend(v12, "numberWithDouble:", CMTimeGetSeconds(&v70));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Max Fragment Duration"), v59);
  v74[5] = v58;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration maxFragmentAnalysisDuration](self, "maxFragmentAnalysisDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Max Fragment Analysis Duration"), v57);
  v74[6] = v56;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  v16 = -[HMIVideoAnalyzerConfiguration decodeMode](self, "decodeMode");
  v17 = CFSTR("IFrameOnly");
  if (v16 != 1)
    v17 = CFSTR("None");
  if (v16 == 2)
    v17 = CFSTR("Full");
  v51 = v17;
  v55 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Decode Mode"), v51);
  v74[7] = v55;
  v18 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerConfiguration transcode](self, "transcode");
  HMFBooleanToString();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Transcode"), v54);
  v74[8] = v53;
  v19 = objc_alloc(MEMORY[0x24BE3F140]);
  HMIFourCCString(-[HMIVideoAnalyzerConfiguration transcodeCodecType](self, "transcodeCodecType"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Transcode Codec"), v52);
  v74[9] = v50;
  v20 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerConfiguration passthroughAudio](self, "passthroughAudio");
  HMFBooleanToString();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Passthrough Audio"), v49);
  v74[10] = v48;
  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerConfiguration redactFrames](self, "redactFrames");
  HMFBooleanToString();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Redact frames"), v47);
  v74[11] = v46;
  v22 = objc_alloc(MEMORY[0x24BE3F140]);
  v23 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration minFrameQuality](self, "minFrameQuality");
  objc_msgSend(v23, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v22, "initWithName:value:", CFSTR("Min Frame Quality"), v45);
  v74[12] = v43;
  v24 = objc_alloc(MEMORY[0x24BE3F140]);
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration minFrameScale](self, "minFrameScale");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Min Frame Scale"), v26);
  v74[13] = v27;
  v28 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerConfiguration camera](self, "camera");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithName:value:", CFSTR("Camera"), v29);
  v74[14] = v30;
  v31 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerConfiguration homeUUID](self, "homeUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithName:value:", CFSTR("Home UUID"), v32);
  v74[15] = v33;
  v34 = objc_alloc(MEMORY[0x24BE3F140]);
  if (-[HMIVideoAnalyzerConfiguration packageClassifierMode](self, "packageClassifierMode"))
    v35 = CFSTR("Detector");
  else
    v35 = CFSTR("None");
  v36 = (void *)objc_msgSend(v34, "initWithName:value:", CFSTR("Package Classifier Mode"), v35, v43);
  v74[16] = v36;
  v37 = objc_alloc(MEMORY[0x24BE3F140]);
  v38 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerConfiguration analysisFPS](self, "analysisFPS");
  objc_msgSend(v38, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v37, "initWithName:value:", CFSTR("Analysis FPS"), v39);
  v74[17] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  HMIVideoAnalyzerConfiguration *v4;
  HMIVideoAnalyzerConfiguration *v5;
  char v6;
  int32_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int32_t v11;
  unsigned int v12;
  unsigned int v13;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  int64_t v21;
  _BOOL4 v22;
  int v23;
  unsigned int v24;
  _BOOL4 v25;
  int v26;
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  int v30;
  _BOOL4 v31;
  int v32;
  _BOOL4 v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  char v41;
  int64_t v42;
  char v43;
  double v44;
  double v45;
  double v46;
  char v47;
  void *v48;
  uint64_t v49;
  char v50;
  void *v51;
  void *v52;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime time2;
  CMTime time1;

  v4 = (HMIVideoAnalyzerConfiguration *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMIVideoAnalyzerConfiguration thumbnailInterval](self, "thumbnailInterval");
      if (v5)
        -[HMIVideoAnalyzerConfiguration thumbnailInterval](v5, "thumbnailInterval");
      else
        memset(&time2, 0, sizeof(time2));
      v7 = CMTimeCompare(&time1, &time2);
      v8 = -[HMIVideoAnalyzerConfiguration thumbnailHeight](self, "thumbnailHeight");
      v9 = -[HMIVideoAnalyzerConfiguration thumbnailHeight](v5, "thumbnailHeight");
      -[HMIVideoAnalyzerConfiguration timelapseInterval](self, "timelapseInterval");
      if (v5)
        -[HMIVideoAnalyzerConfiguration timelapseInterval](v5, "timelapseInterval");
      else
        memset(&v58, 0, sizeof(v58));
      v10 = CMTimeCompare(&v59, &v58) | v7;
      -[HMIVideoAnalyzerConfiguration timelapsePreferredFragmentDuration](self, "timelapsePreferredFragmentDuration");
      if (v5)
        -[HMIVideoAnalyzerConfiguration timelapsePreferredFragmentDuration](v5, "timelapsePreferredFragmentDuration");
      else
        memset(&v56, 0, sizeof(v56));
      v11 = CMTimeCompare(&v57, &v56);
      v12 = -[HMIVideoAnalyzerConfiguration timelapseCodecType](self, "timelapseCodecType");
      v13 = -[HMIVideoAnalyzerConfiguration timelapseCodecType](v5, "timelapseCodecType");
      v16 = v8 == v9 && (v10 | v11) == 0 && v12 == v13;
      -[HMIVideoAnalyzerConfiguration maxFragmentDuration](self, "maxFragmentDuration");
      if (v5)
        -[HMIVideoAnalyzerConfiguration maxFragmentDuration](v5, "maxFragmentDuration");
      else
        memset(&v54, 0, sizeof(v54));
      if (CMTimeCompare(&v55, &v54))
        v16 = 0;
      -[HMIVideoAnalyzerConfiguration maxFragmentAnalysisDuration](self, "maxFragmentAnalysisDuration", v54.value, *(_QWORD *)&v54.timescale, v54.epoch);
      v18 = v17;
      -[HMIVideoAnalyzerConfiguration maxFragmentAnalysisDuration](v5, "maxFragmentAnalysisDuration");
      v20 = v18 == v19 && v16;
      v21 = -[HMIVideoAnalyzerConfiguration decodeMode](self, "decodeMode");
      if (v21 != -[HMIVideoAnalyzerConfiguration decodeMode](v5, "decodeMode"))
        v20 = 0;
      v22 = -[HMIVideoAnalyzerConfiguration transcode](self, "transcode");
      v23 = v20 & ~(v22 ^ -[HMIVideoAnalyzerConfiguration transcode](v5, "transcode"));
      v24 = -[HMIVideoAnalyzerConfiguration transcodeCodecType](self, "transcodeCodecType");
      if (v24 != -[HMIVideoAnalyzerConfiguration transcodeCodecType](v5, "transcodeCodecType"))
        v23 = 0;
      v25 = -[HMIVideoAnalyzerConfiguration passthroughAudio](self, "passthroughAudio");
      v26 = v25 ^ -[HMIVideoAnalyzerConfiguration passthroughAudio](v5, "passthroughAudio");
      v27 = -[HMIVideoAnalyzerConfiguration redactFrames](self, "redactFrames");
      v28 = v26 | v27 ^ -[HMIVideoAnalyzerConfiguration redactFrames](v5, "redactFrames");
      v29 = -[HMIVideoAnalyzerConfiguration allowReducedConfiguration](self, "allowReducedConfiguration");
      v30 = v29 ^ -[HMIVideoAnalyzerConfiguration allowReducedConfiguration](v5, "allowReducedConfiguration");
      v31 = -[HMIVideoAnalyzerConfiguration enableTemporalEventFiltering](self, "enableTemporalEventFiltering");
      v32 = v28 | v30 | v31 ^ -[HMIVideoAnalyzerConfiguration enableTemporalEventFiltering](v5, "enableTemporalEventFiltering");
      v33 = -[HMIVideoAnalyzerConfiguration saveAnalyzerResultsToDisk](self, "saveAnalyzerResultsToDisk");
      v34 = v23 & ~(v32 | v33 ^ -[HMIVideoAnalyzerConfiguration saveAnalyzerResultsToDisk](v5, "saveAnalyzerResultsToDisk"));
      -[HMIVideoAnalyzerConfiguration minFrameQuality](self, "minFrameQuality");
      v36 = v35;
      -[HMIVideoAnalyzerConfiguration minFrameQuality](v5, "minFrameQuality");
      if (v36 != v37)
        LOBYTE(v34) = 0;
      -[HMIVideoAnalyzerConfiguration minFrameScale](self, "minFrameScale");
      v39 = v38;
      -[HMIVideoAnalyzerConfiguration minFrameScale](v5, "minFrameScale");
      if (v39 == v40)
        v41 = v34;
      else
        v41 = 0;
      v42 = -[HMIVideoAnalyzerConfiguration packageClassifierMode](self, "packageClassifierMode");
      if (v42 == -[HMIVideoAnalyzerConfiguration packageClassifierMode](v5, "packageClassifierMode"))
        v43 = v41;
      else
        v43 = 0;
      -[HMIVideoAnalyzerConfiguration analysisFPS](self, "analysisFPS");
      v45 = v44;
      -[HMIVideoAnalyzerConfiguration analysisFPS](v5, "analysisFPS");
      if (v45 == v46)
        v47 = v43;
      else
        v47 = 0;
      -[HMIVideoAnalyzerConfiguration camera](self, "camera");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerConfiguration camera](v5, "camera");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = HMFEqualObjects();

      -[HMIVideoAnalyzerConfiguration homeUUID](self, "homeUUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerConfiguration homeUUID](v5, "homeUUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = HMFEqualObjects();

      v6 = v47 & v50 & v49;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)setMinFrameQuality:(double)a3
{
  BOOL v3;
  BOOL v4;
  HMIVideoAnalyzerConfiguration *v5;
  SEL v6;

  if (a3 > 0.0)
  {
    v4 = a3 == 1.0;
    v3 = a3 >= 1.0;
  }
  else
  {
    v3 = 1;
    v4 = 0;
  }
  if (!v4 && v3)
  {
    v5 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerConfiguration minFrameQuality](v5, v6);
  }
  else
  {
    self->_minFrameQuality = a3;
  }
}

- (double)minFrameQuality
{
  return self->_minFrameQuality;
}

- (void)setMinFrameScale:(double)a3
{
  BOOL v3;
  BOOL v4;
  HMIVideoAnalyzerConfiguration *v5;
  SEL v6;

  if (a3 > 0.0)
  {
    v4 = a3 == 1.0;
    v3 = a3 >= 1.0;
  }
  else
  {
    v3 = 1;
    v4 = 0;
  }
  if (!v4 && v3)
  {
    v5 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerConfiguration minFrameScale](v5, v6);
  }
  else
  {
    self->_minFrameScale = a3;
  }
}

- (double)minFrameScale
{
  return self->_minFrameScale;
}

- (BOOL)timelapseVideo
{
  char v3;

  -[HMIVideoAnalyzerConfiguration timelapseInterval](self, "timelapseInterval");
  return v3 & 1;
}

- (void)setTimelapseVideo:(BOOL)a3
{
  CMTime v4;
  CMTime v5;

  if (a3)
    CMTimeMake(&v5, 1, 1);
  else
    v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  v4 = v5;
  -[HMIVideoAnalyzerConfiguration setTimelapseInterval:](self, "setTimelapseInterval:", &v4);
}

- (void)setTimelapseVideoPreferredFragmentDuration:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[HMIVideoAnalyzerConfiguration setTimelapsePreferredFragmentDuration:](self, "setTimelapsePreferredFragmentDuration:", &v3);
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (void)setAnalysisFPS:(double)a3
{
  HMIVideoAnalyzerConfiguration *v3;
  SEL v4;
  _NSZone *v5;

  if (a3 <= 0.0)
  {
    v3 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerConfiguration copyWithZone:](v3, v4, v5);
  }
  else
  {
    self->_analysisFPS = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMIVideoAnalyzerConfiguration *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v4 = objc_alloc_init(HMIVideoAnalyzerConfiguration);
  -[HMIVideoAnalyzerConfiguration thumbnailInterval](self, "thumbnailInterval");
  v20 = v22;
  v21 = v23;
  -[HMIVideoAnalyzerConfiguration setThumbnailInterval:](v4, "setThumbnailInterval:", &v20);
  -[HMIVideoAnalyzerConfiguration setThumbnailHeight:](v4, "setThumbnailHeight:", -[HMIVideoAnalyzerConfiguration thumbnailHeight](self, "thumbnailHeight"));
  -[HMIVideoAnalyzerConfiguration timelapseInterval](self, "timelapseInterval");
  v16 = v18;
  v17 = v19;
  -[HMIVideoAnalyzerConfiguration setTimelapseInterval:](v4, "setTimelapseInterval:", &v16);
  -[HMIVideoAnalyzerConfiguration timelapsePreferredFragmentDuration](self, "timelapsePreferredFragmentDuration");
  v12 = v14;
  v13 = v15;
  -[HMIVideoAnalyzerConfiguration setTimelapsePreferredFragmentDuration:](v4, "setTimelapsePreferredFragmentDuration:", &v12);
  -[HMIVideoAnalyzerConfiguration setTimelapseCodecType:](v4, "setTimelapseCodecType:", -[HMIVideoAnalyzerConfiguration timelapseCodecType](self, "timelapseCodecType"));
  -[HMIVideoAnalyzerConfiguration maxFragmentAnalysisDuration](self, "maxFragmentAnalysisDuration");
  -[HMIVideoAnalyzerConfiguration setMaxFragmentAnalysisDuration:](v4, "setMaxFragmentAnalysisDuration:");
  -[HMIVideoAnalyzerConfiguration maxFragmentDuration](self, "maxFragmentDuration");
  v8 = v10;
  v9 = v11;
  -[HMIVideoAnalyzerConfiguration setMaxFragmentDuration:](v4, "setMaxFragmentDuration:", &v8);
  -[HMIVideoAnalyzerConfiguration setDecodeMode:](v4, "setDecodeMode:", -[HMIVideoAnalyzerConfiguration decodeMode](self, "decodeMode"));
  -[HMIVideoAnalyzerConfiguration setTranscode:](v4, "setTranscode:", -[HMIVideoAnalyzerConfiguration transcode](self, "transcode"));
  -[HMIVideoAnalyzerConfiguration setTranscodeCodecType:](v4, "setTranscodeCodecType:", -[HMIVideoAnalyzerConfiguration transcodeCodecType](self, "transcodeCodecType"));
  -[HMIVideoAnalyzerConfiguration setPassthroughAudio:](v4, "setPassthroughAudio:", -[HMIVideoAnalyzerConfiguration passthroughAudio](self, "passthroughAudio"));
  -[HMIVideoAnalyzerConfiguration camera](self, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setCamera:](v4, "setCamera:", v5);

  -[HMIVideoAnalyzerConfiguration homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setHomeUUID:](v4, "setHomeUUID:", v6);

  -[HMIVideoAnalyzerConfiguration minFrameQuality](self, "minFrameQuality");
  -[HMIVideoAnalyzerConfiguration setMinFrameQuality:](v4, "setMinFrameQuality:");
  -[HMIVideoAnalyzerConfiguration minFrameScale](self, "minFrameScale");
  -[HMIVideoAnalyzerConfiguration setMinFrameScale:](v4, "setMinFrameScale:");
  -[HMIVideoAnalyzerConfiguration setPackageClassifierMode:](v4, "setPackageClassifierMode:", -[HMIVideoAnalyzerConfiguration packageClassifierMode](self, "packageClassifierMode"));
  -[HMIVideoAnalyzerConfiguration setRedactFrames:](v4, "setRedactFrames:", -[HMIVideoAnalyzerConfiguration redactFrames](self, "redactFrames"));
  -[HMIVideoAnalyzerConfiguration setAllowReducedConfiguration:](v4, "setAllowReducedConfiguration:", -[HMIVideoAnalyzerConfiguration allowReducedConfiguration](self, "allowReducedConfiguration"));
  -[HMIVideoAnalyzerConfiguration setEnableTemporalEventFiltering:](v4, "setEnableTemporalEventFiltering:", -[HMIVideoAnalyzerConfiguration enableTemporalEventFiltering](self, "enableTemporalEventFiltering"));
  -[HMIVideoAnalyzerConfiguration setSaveAnalyzerResultsToDisk:](v4, "setSaveAnalyzerResultsToDisk:", -[HMIVideoAnalyzerConfiguration saveAnalyzerResultsToDisk](self, "saveAnalyzerResultsToDisk"));
  -[HMIVideoAnalyzerConfiguration analysisFPS](self, "analysisFPS");
  -[HMIVideoAnalyzerConfiguration setAnalysisFPS:](v4, "setAnalysisFPS:");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerConfiguration init](self, "init");
  NSStringFromSelector(sel_thumbnailInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeForKey:", v6);
  }
  else
  {
    v46 = 0uLL;
    v47 = 0;
  }
  v44 = v46;
  v45 = v47;
  -[HMIVideoAnalyzerConfiguration setThumbnailInterval:](v5, "setThumbnailInterval:", &v44);

  NSStringFromSelector(sel_thumbnailHeight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setThumbnailHeight:](v5, "setThumbnailHeight:", objc_msgSend(v4, "decodeIntegerForKey:", v7));

  NSStringFromSelector(sel_timelapseInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeForKey:", v8);
  }
  else
  {
    v42 = 0uLL;
    v43 = 0;
  }
  v40 = v42;
  v41 = v43;
  -[HMIVideoAnalyzerConfiguration setTimelapseInterval:](v5, "setTimelapseInterval:", &v40);

  NSStringFromSelector(sel_timelapsePreferredFragmentDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeForKey:", v9);
  }
  else
  {
    v38 = 0uLL;
    v39 = 0;
  }
  v36 = v38;
  v37 = v39;
  -[HMIVideoAnalyzerConfiguration setTimelapsePreferredFragmentDuration:](v5, "setTimelapsePreferredFragmentDuration:", &v36);

  NSStringFromSelector(sel_timelapseCodecType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setTimelapseCodecType:](v5, "setTimelapseCodecType:", objc_msgSend(v4, "decodeIntegerForKey:", v10));

  NSStringFromSelector(sel_maxFragmentAnalysisDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v11);
  -[HMIVideoAnalyzerConfiguration setMaxFragmentAnalysisDuration:](v5, "setMaxFragmentAnalysisDuration:");

  NSStringFromSelector(sel_maxFragmentDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeForKey:", v12);
  }
  else
  {
    v34 = 0uLL;
    v35 = 0;
  }
  v32 = v34;
  v33 = v35;
  -[HMIVideoAnalyzerConfiguration setMaxFragmentDuration:](v5, "setMaxFragmentDuration:", &v32);

  NSStringFromSelector(sel_decodeMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setDecodeMode:](v5, "setDecodeMode:", objc_msgSend(v4, "decodeIntegerForKey:", v13));

  NSStringFromSelector(sel_transcode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setTranscode:](v5, "setTranscode:", objc_msgSend(v4, "decodeBoolForKey:", v14));

  NSStringFromSelector(sel_transcodeCodecType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setTranscodeCodecType:](v5, "setTranscodeCodecType:", objc_msgSend(v4, "decodeIntegerForKey:", v15));

  NSStringFromSelector(sel_passthroughAudio);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setPassthroughAudio:](v5, "setPassthroughAudio:", objc_msgSend(v4, "decodeBoolForKey:", v16));

  NSStringFromSelector(sel_redactFrames);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setRedactFrames:](v5, "setRedactFrames:", objc_msgSend(v4, "decodeBoolForKey:", v17));

  NSStringFromSelector(sel_allowReducedConfiguration);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setAllowReducedConfiguration:](v5, "setAllowReducedConfiguration:", objc_msgSend(v4, "decodeBoolForKey:", v18));

  NSStringFromSelector(sel_enableTemporalEventFiltering);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setEnableTemporalEventFiltering:](v5, "setEnableTemporalEventFiltering:", objc_msgSend(v4, "decodeBoolForKey:", v19));

  NSStringFromSelector(sel_saveAnalyzerResultsToDisk);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setSaveAnalyzerResultsToDisk:](v5, "setSaveAnalyzerResultsToDisk:", objc_msgSend(v4, "decodeBoolForKey:", v20));

  NSStringFromSelector(sel_minFrameQuality);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v21);
  -[HMIVideoAnalyzerConfiguration setMinFrameQuality:](v5, "setMinFrameQuality:");

  NSStringFromSelector(sel_minFrameScale);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v22);
  -[HMIVideoAnalyzerConfiguration setMinFrameScale:](v5, "setMinFrameScale:");

  v23 = objc_opt_class();
  NSStringFromSelector(sel_camera);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setCamera:](v5, "setCamera:", v25);

  v26 = objc_opt_class();
  NSStringFromSelector(sel_homeUUID);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setHomeUUID:](v5, "setHomeUUID:", v28);

  NSStringFromSelector(sel_packageClassifierMode);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerConfiguration setPackageClassifierMode:](v5, "setPackageClassifierMode:", objc_msgSend(v4, "decodeIntegerForKey:", v29));

  NSStringFromSelector(sel_analysisFPS);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v30);
  -[HMIVideoAnalyzerConfiguration setAnalysisFPS:](v5, "setAnalysisFPS:");

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  _BYTE v48[24];
  _BYTE v49[24];
  _BYTE v50[24];

  v4 = a3;
  -[HMIVideoAnalyzerConfiguration thumbnailInterval](self, "thumbnailInterval");
  NSStringFromSelector(sel_thumbnailInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCMTime:forKey:", v50, v5);

  v6 = -[HMIVideoAnalyzerConfiguration thumbnailHeight](self, "thumbnailHeight");
  NSStringFromSelector(sel_thumbnailHeight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v6, v7);

  -[HMIVideoAnalyzerConfiguration timelapseInterval](self, "timelapseInterval");
  NSStringFromSelector(sel_timelapseInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCMTime:forKey:", v49, v8);

  -[HMIVideoAnalyzerConfiguration timelapsePreferredFragmentDuration](self, "timelapsePreferredFragmentDuration");
  NSStringFromSelector(sel_timelapsePreferredFragmentDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCMTime:forKey:", v48, v9);

  v10 = -[HMIVideoAnalyzerConfiguration timelapseCodecType](self, "timelapseCodecType");
  NSStringFromSelector(sel_timelapseCodecType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v10, v11);

  -[HMIVideoAnalyzerConfiguration maxFragmentAnalysisDuration](self, "maxFragmentAnalysisDuration");
  v13 = v12;
  NSStringFromSelector(sel_maxFragmentAnalysisDuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v14, v13);

  -[HMIVideoAnalyzerConfiguration maxFragmentDuration](self, "maxFragmentDuration");
  NSStringFromSelector(sel_maxFragmentDuration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCMTime:forKey:", &v47, v15);

  v16 = -[HMIVideoAnalyzerConfiguration decodeMode](self, "decodeMode");
  NSStringFromSelector(sel_decodeMode);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v16, v17);

  v18 = -[HMIVideoAnalyzerConfiguration transcode](self, "transcode");
  NSStringFromSelector(sel_transcode);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v18, v19);

  v20 = -[HMIVideoAnalyzerConfiguration transcodeCodecType](self, "transcodeCodecType");
  NSStringFromSelector(sel_transcodeCodecType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v20, v21);

  v22 = -[HMIVideoAnalyzerConfiguration passthroughAudio](self, "passthroughAudio");
  NSStringFromSelector(sel_passthroughAudio);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v22, v23);

  v24 = -[HMIVideoAnalyzerConfiguration redactFrames](self, "redactFrames");
  NSStringFromSelector(sel_redactFrames);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v24, v25);

  v26 = -[HMIVideoAnalyzerConfiguration allowReducedConfiguration](self, "allowReducedConfiguration");
  NSStringFromSelector(sel_allowReducedConfiguration);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v26, v27);

  v28 = -[HMIVideoAnalyzerConfiguration enableTemporalEventFiltering](self, "enableTemporalEventFiltering");
  NSStringFromSelector(sel_enableTemporalEventFiltering);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v28, v29);

  v30 = -[HMIVideoAnalyzerConfiguration saveAnalyzerResultsToDisk](self, "saveAnalyzerResultsToDisk");
  NSStringFromSelector(sel_saveAnalyzerResultsToDisk);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v30, v31);

  -[HMIVideoAnalyzerConfiguration minFrameQuality](self, "minFrameQuality");
  v33 = v32;
  NSStringFromSelector(sel_minFrameQuality);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v34, v33);

  -[HMIVideoAnalyzerConfiguration minFrameScale](self, "minFrameScale");
  v36 = v35;
  NSStringFromSelector(sel_minFrameScale);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v37, v36);

  -[HMIVideoAnalyzerConfiguration camera](self, "camera");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_camera);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, v39);

  -[HMIVideoAnalyzerConfiguration homeUUID](self, "homeUUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeUUID);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, v41);

  v42 = -[HMIVideoAnalyzerConfiguration packageClassifierMode](self, "packageClassifierMode");
  NSStringFromSelector(sel_packageClassifierMode);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v42, v43);

  -[HMIVideoAnalyzerConfiguration analysisFPS](self, "analysisFPS");
  v45 = v44;
  NSStringFromSelector(sel_analysisFPS);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v46, v45);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)thumbnailInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_thumbnailInterval, 24, 1, 0);
  return result;
}

- (void)setThumbnailInterval:(id *)a3
{
  objc_copyStruct(&self->_thumbnailInterval, a3, 24, 1, 0);
}

- (unint64_t)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (void)setThumbnailHeight:(unint64_t)a3
{
  self->_thumbnailHeight = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timelapseInterval, 24, 1, 0);
  return result;
}

- (void)setTimelapseInterval:(id *)a3
{
  objc_copyStruct(&self->_timelapseInterval, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapsePreferredFragmentDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timelapsePreferredFragmentDuration, 24, 1, 0);
  return result;
}

- (void)setTimelapsePreferredFragmentDuration:(id *)a3
{
  objc_copyStruct(&self->_timelapsePreferredFragmentDuration, a3, 24, 1, 0);
}

- (unsigned)timelapseCodecType
{
  return self->_timelapseCodecType;
}

- (void)setTimelapseCodecType:(unsigned int)a3
{
  self->_timelapseCodecType = a3;
}

- (double)maxFragmentAnalysisDuration
{
  return self->_maxFragmentAnalysisDuration;
}

- (void)setMaxFragmentAnalysisDuration:(double)a3
{
  self->_maxFragmentAnalysisDuration = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxFragmentDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_maxFragmentDuration, 24, 1, 0);
  return result;
}

- (void)setMaxFragmentDuration:(id *)a3
{
  objc_copyStruct(&self->_maxFragmentDuration, a3, 24, 1, 0);
}

- (BOOL)transcode
{
  return self->_transcode;
}

- (void)setTranscode:(BOOL)a3
{
  self->_transcode = a3;
}

- (unsigned)transcodeCodecType
{
  return self->_transcodeCodecType;
}

- (void)setTranscodeCodecType:(unsigned int)a3
{
  self->_transcodeCodecType = a3;
}

- (HMICamera)camera
{
  return (HMICamera *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCamera:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)passthroughAudio
{
  return self->_passthroughAudio;
}

- (void)setPassthroughAudio:(BOOL)a3
{
  self->_passthroughAudio = a3;
}

- (int64_t)decodeMode
{
  return self->_decodeMode;
}

- (void)setDecodeMode:(int64_t)a3
{
  self->_decodeMode = a3;
}

- (BOOL)redactFrames
{
  return self->_redactFrames;
}

- (void)setRedactFrames:(BOOL)a3
{
  self->_redactFrames = a3;
}

- (int64_t)packageClassifierMode
{
  return self->_packageClassifierMode;
}

- (void)setPackageClassifierMode:(int64_t)a3
{
  self->_packageClassifierMode = a3;
}

- (BOOL)allowReducedConfiguration
{
  return self->_allowReducedConfiguration;
}

- (void)setAllowReducedConfiguration:(BOOL)a3
{
  self->_allowReducedConfiguration = a3;
}

- (BOOL)enableTemporalEventFiltering
{
  return self->_enableTemporalEventFiltering;
}

- (void)setEnableTemporalEventFiltering:(BOOL)a3
{
  self->_enableTemporalEventFiltering = a3;
}

- (BOOL)saveAnalyzerResultsToDisk
{
  return self->_saveAnalyzerResultsToDisk;
}

- (void)setSaveAnalyzerResultsToDisk:(BOOL)a3
{
  self->_saveAnalyzerResultsToDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end
