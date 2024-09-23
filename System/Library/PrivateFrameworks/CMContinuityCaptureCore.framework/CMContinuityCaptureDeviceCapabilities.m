@implementation CMContinuityCaptureDeviceCapabilities

- (CMContinuityCaptureDeviceCapabilities)initWithEntityType:(int64_t)a3 streamFormats:(id)a4 manualFramingSupportedStreamFormats:(id)a5 controls:(id)a6
{
  id v11;
  id v12;
  id v13;
  CMContinuityCaptureDeviceCapabilities *v14;
  CMContinuityCaptureDeviceCapabilities *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureDeviceCapabilities;
  v14 = -[CMContinuityCaptureDeviceCapabilities init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_entityType = a3;
    objc_storeStrong((id *)&v14->_streamFormats, a4);
    objc_storeStrong((id *)&v15->_manualFramingSupportedStreamFormats, a5);
    objc_storeStrong((id *)&v15->_controls, a6);
  }

  return v15;
}

- (CMContinuityCaptureDeviceCapabilities)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMContinuityCaptureStreamFormat *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMContinuityCaptureStreamFormat *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CMContinuityCaptureControl *v34;
  NSObject *v35;
  void *v36;
  CMContinuityCaptureDeviceCapabilities *v37;
  NSObject *v39;
  id v40;
  uint64_t v41;
  CMContinuityCaptureDeviceCapabilities *v42;
  uint64_t v43;
  NSObject *obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EntityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CMContinuityCaptureLog(2);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:].cold.1();
    goto LABEL_46;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EntityType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StreamFormats"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    CMContinuityCaptureLog(2);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:].cold.2();
LABEL_46:
    v37 = 0;
LABEL_50:
    v36 = (void *)v43;
    goto LABEL_41;
  }
  v41 = v9;
  v42 = self;
  v45 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StreamFormats"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = objc_claimAutoreleasedReturnValue();
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v55;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v55 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14);
        v16 = -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:]([CMContinuityCaptureStreamFormat alloc], "initWithDictionaryRepresentation:", v15);
        if (v16)
        {
          objc_msgSend(v5, "addObject:", v16);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v15;
            _os_log_error_impl(&dword_227C5D000, v17, OS_LOG_TYPE_ERROR, "Could not create stream format: %@", buf, 0xCu);
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v12);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ManualFramingSupportedStreamFormats"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v51;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v22);
        v24 = -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:]([CMContinuityCaptureStreamFormat alloc], "initWithDictionaryRepresentation:", v23);
        if (v24)
        {
          objc_msgSend(v45, "addObject:", v24);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v23;
            _os_log_error_impl(&dword_227C5D000, v25, OS_LOG_TYPE_ERROR, "Could not create manual framing supported stream format: %@", buf, 0xCu);
          }

        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v20);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Controls"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    CMContinuityCaptureLog(2);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:].cold.3();

    v37 = 0;
    self = v42;
    v6 = v45;
    goto LABEL_50;
  }
  v40 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Controls"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  v29 = (void *)v43;
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v47;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v27);
        v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v32);
        v34 = -[CMContinuityCaptureControl initWithDictionaryRepresentation:]([CMContinuityCaptureControl alloc], "initWithDictionaryRepresentation:", v33);
        if (v34)
        {
          objc_msgSend(v29, "addObject:", v34);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v33;
            _os_log_error_impl(&dword_227C5D000, v35, OS_LOG_TYPE_ERROR, "Could not create control: %@", buf, 0xCu);
          }

          v29 = (void *)v43;
        }

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v30);
  }
  v6 = v45;
  v36 = v29;
  self = -[CMContinuityCaptureDeviceCapabilities initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:](v42, "initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:", v41, v5, v45, v29);

  v37 = self;
  v4 = v40;
LABEL_41:

  return v37;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_entityType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("EntityType"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = self->_streamFormats;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v12), "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("StreamFormats"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = self->_manualFramingSupportedStreamFormats;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18), "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ManualFramingSupportedStreamFormats"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_controls;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "dictionaryRepresentation", (_QWORD)v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Controls"));
  return v3;
}

+ (id)capabilitiesForEntityType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (AVGestaltGetBoolAnswer()
    && (a3 != 2
     || (objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A68], *MEMORY[0x24BDB1D50], 1), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5)))
  {
    objc_msgSend(a1, "_resolvedStreamFormatsForEntityType:requireManualFramingSupport:", a3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_resolvedStreamFormatsForEntityType:requireManualFramingSupport:", a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_resolvedControlsForEntityType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:", a3, v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_resolvedStreamFormatsForEntityType:(int64_t)a3 requireManualFramingSupport:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  CMContinuityCaptureStreamFormat *v10;
  uint64_t v11;
  CMContinuityCaptureStreamFormat *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CMContinuityCaptureStreamFormat *v20;
  CMContinuityCaptureStreamFormat *v21;
  CMContinuityCaptureStreamFormat *v22;
  CMContinuityCaptureStreamFormat *v23;
  CMContinuityCaptureStreamFormat *v24;
  CMContinuityCaptureStreamFormat *v25;
  CMContinuityCaptureStreamFormat *v26;
  CMContinuityCaptureStreamFormat *v27;
  CMContinuityCaptureStreamFormat *v28;
  CMContinuityCaptureStreamFormat *v29;
  CMContinuityCaptureStreamFormat *v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t j;
  void *v39;
  FourCharCode MediaSubType;
  uint64_t Dimensions;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  unsigned int v49;
  BOOL v52;
  CMContinuityCaptureStreamFormat *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  id obj;
  CMContinuityCaptureStreamFormat *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  void *v76;
  CMContinuityCaptureStreamFormat *v77;
  id v78;
  _BOOL4 v79;
  CMContinuityCaptureStreamFormat *v80;
  uint64_t v81;
  CMContinuityCaptureStreamFormat *v82;
  uint64_t v83;
  CMContinuityCaptureStreamFormat *v84;
  uint64_t v85;
  unsigned int v86;
  _QWORD v87[3];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  __int128 buf;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[5];

  v4 = a4;
  v101[2] = *MEMORY[0x24BDAC8D0];
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v79 = v4;
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v75 = a3;
  if (a3 == 3)
  {
    v10 = 0;
LABEL_17:
    v95 = 0u;
    v93 = 0u;
    v94 = 0u;
    v92 = 0u;
    obj = v68;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    if (!v73)
      goto LABEL_63;
    v72 = *(_QWORD *)v93;
    v71 = v10;
    while (1)
    {
      for (i = 0; i != v73; i = v56 + 1)
      {
        if (*(_QWORD *)v93 != v72)
          objc_enumerationMutation(obj);
        v74 = i;
        v32 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        v86 = objc_msgSend(v32, "pixelFormat");
        v85 = objc_msgSend(v32, "width");
        v83 = objc_msgSend(v32, "height");
        v76 = v32;
        v33 = objc_msgSend(v32, "maxFrameRate");
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        -[CMContinuityCaptureStreamFormat formats](v10, "formats");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
        if (v35)
        {
          v36 = v35;
          v78 = v34;
          v37 = 0;
          v81 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v89 != v81)
                objc_enumerationMutation(v78);
              v39 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              if (!v4
                || (objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * j), "isCenterStageSupported") & 1) != 0
                || objc_msgSend(v39, "isCenterStageSupportedForContinuityCamera"))
              {
                MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v39, "formatDescription"));
                Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v39, "formatDescription"));
                if (v4)
                {
                  objc_msgSend(v39, "videoFrameRateRangeForCenterStageForContinuityCamera");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v39, "videoSupportedFrameRateRanges");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "firstObject");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v44 = (int)Dimensions;
                v45 = Dimensions >> 32;
                objc_msgSend(v42, "minFrameRate");
                v47 = v46;
                objc_msgSend(v42, "maxFrameRate");
                v49 = v48;
                v52 = v86 != MediaSubType || v44 != v85 || v45 != v83 || v33 > v49;
                if (v52
                  || v37
                  && (-[NSObject maxFrameRate](v37, "maxFrameRate") != v49
                   || (objc_msgSend(v39, "isVideoHDRSupported") & 1) == 0)
                  && -[NSObject maxFrameRate](v37, "maxFrameRate") <= v49)
                {
                  v4 = v79;
                }
                else
                {
                  v53 = [CMContinuityCaptureStreamFormat alloc];
                  objc_msgSend(v76, "name");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v76)
                    objc_msgSend(v76, "minimumSupportedVersion");
                  else
                    memset(v87, 0, sizeof(v87));
                  v4 = v79;
                  v55 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v53, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", v54, v85, v83, v86, v47, v33, v75, v87);

                  v37 = v55;
                }

              }
            }
            v36 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
          }
          while (v36);

          v10 = v71;
          if (v37)
          {
            objc_msgSend(v69, "addObject:", v37);
            v56 = v74;
            goto LABEL_61;
          }
        }
        else
        {

        }
        CMContinuityCaptureLog(2);
        v37 = objc_claimAutoreleasedReturnValue();
        v56 = v74;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v76;
          _os_log_error_impl(&dword_227C5D000, v37, OS_LOG_TYPE_ERROR, "Could not resolved stream format: %@", (uint8_t *)&buf, 0xCu);
        }
LABEL_61:

      }
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
      if (!v73)
      {
LABEL_63:

        v57 = v69;
        objc_msgSend(v69, "sortUsingComparator:", &__block_literal_global_14);
        goto LABEL_64;
      }
    }
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A68], *MEMORY[0x24BDB1D50], 1);
    v11 = objc_claimAutoreleasedReturnValue();
    buf = xmmword_227CED6D0;
    v99 = 0;
    v12 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:]([CMContinuityCaptureStreamFormat alloc], "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1920x1440"), 1920, 1440, 875704438, 1, 30, 2, &buf);
    objc_msgSend(v68, "addObject:", v12);
LABEL_16:

    v10 = (CMContinuityCaptureStreamFormat *)v11;
    goto LABEL_17;
  }
  if (a3 != 1)
  {
    CMContinuityCaptureLog(2);
    v12 = (CMContinuityCaptureStreamFormat *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      +[CMContinuityCaptureDeviceCapabilities _resolvedStreamFormatsForEntityType:requireManualFramingSupport:].cold.1(a3, &v12->super);
    v11 = 0;
    goto LABEL_16;
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v6 = *MEMORY[0x24BDB1A58];
    v101[0] = *MEMORY[0x24BDB1A28];
    v101[1] = v6;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = v101;
    v9 = 2;
  }
  else
  {
    v100 = *MEMORY[0x24BDB1A58];
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = &v100;
    v9 = 1;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9);
  v10 = (CMContinuityCaptureStreamFormat *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2468], "discoverySessionWithDeviceTypes:mediaType:position:", v10, *MEMORY[0x24BDB1D50], CMContinuityCaptureDevicePosition());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "devices");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v14, "devices");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        objc_msgSend(v14, "devices");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v11 = objc_claimAutoreleasedReturnValue();

        buf = xmmword_227CED6D0;
        v99 = 0;
        v84 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:]([CMContinuityCaptureStreamFormat alloc], "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1920x1440"), 1920, 1440, 875704438, 1, 30, 1, &buf);
        objc_msgSend(v68, "addObject:", v84);
        v20 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v82 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v20, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1920x1440p60"), 1920, 1440, 875704438, 1, 60, 1, &buf);
        objc_msgSend(v68, "addObject:", v82);
        v21 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v80 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v21, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1920x1080"), 1920, 1080, 875704438, 1, 30, 1, &buf);
        objc_msgSend(v68, "addObject:", v80);
        v22 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v77 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v22, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1920x1080p60"), 1920, 1080, 875704438, 1, 60, 1, &buf);
        objc_msgSend(v68, "addObject:", v77);
        v23 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v24 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v23, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1280x720"), 1280, 720, 875704438, 1, 30, 1, &buf);
        objc_msgSend(v68, "addObject:", v24);
        v25 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v26 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v25, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("1280x720p60"), 1280, 720, 875704438, 1, 60, 1, &buf);
        objc_msgSend(v68, "addObject:", v26);
        v27 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v12 = v10;
        v28 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v27, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("640x480"), 640, 480, 875704438, 1, 30, 1, &buf);
        objc_msgSend(v68, "addObject:", v28);
        v29 = [CMContinuityCaptureStreamFormat alloc];
        buf = xmmword_227CED6D0;
        v99 = 0;
        v30 = -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v29, "initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:", CFSTR("640x480p60"), 640, 480, 875704438, 1, 60, 1, &buf);
        v4 = v79;
        objc_msgSend(v68, "addObject:", v30);

        goto LABEL_16;
      }
    }
  }
  CMContinuityCaptureLog(2);
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    +[CMContinuityCaptureDeviceCapabilities _resolvedStreamFormatsForEntityType:requireManualFramingSupport:].cold.2(v60, v61, v62, v63, v64, v65, v66, v67);

  v57 = v69;
LABEL_64:

  v58 = (void *)objc_msgSend(v57, "copy");
  return v58;
}

uint64_t __105__CMContinuityCaptureDeviceCapabilities__resolvedStreamFormatsForEntityType_requireManualFramingSupport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v15;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "width");
  if (v6 < objc_msgSend(v5, "width"))
    goto LABEL_9;
  v7 = objc_msgSend(v4, "width");
  if (v7 <= objc_msgSend(v5, "width"))
  {
    v8 = objc_msgSend(v4, "height");
    if (v8 < objc_msgSend(v5, "height"))
      goto LABEL_9;
    v9 = objc_msgSend(v4, "height");
    if (v9 <= objc_msgSend(v5, "height"))
    {
      v10 = objc_msgSend(v4, "minFrameRate");
      if (v10 >= objc_msgSend(v5, "minFrameRate"))
      {
        v11 = objc_msgSend(v4, "minFrameRate");
        if (v11 > objc_msgSend(v5, "minFrameRate"))
          goto LABEL_7;
        v13 = objc_msgSend(v4, "maxFrameRate");
        if (v13 >= objc_msgSend(v5, "maxFrameRate"))
        {
          v15 = objc_msgSend(v4, "maxFrameRate");
          v12 = v15 > objc_msgSend(v5, "maxFrameRate");
          goto LABEL_10;
        }
      }
LABEL_9:
      v12 = -1;
      goto LABEL_10;
    }
  }
LABEL_7:
  v12 = 1;
LABEL_10:

  return v12;
}

+ (id)_resolvedControlsForEntityType:(int64_t)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  CMContinuityCaptureControl *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  CMContinuityCaptureControl *v25;
  uint64_t v26;
  CMContinuityCaptureControl *v27;
  CMContinuityCaptureControl *v28;
  CMContinuityCaptureControl *v29;
  CMContinuityCaptureControl *v30;
  CMContinuityCaptureControl *v31;
  CMContinuityCaptureControl *v32;
  CMContinuityCaptureControl *v33;
  CMContinuityCaptureControl *v34;
  CMContinuityCaptureControl *v35;
  CMContinuityCaptureControl *v36;
  CMContinuityCaptureControl *v37;
  CMContinuityCaptureControl *v38;
  CMContinuityCaptureControl *v39;
  CMContinuityCaptureControl *v40;
  CMContinuityCaptureControl *v41;
  CMContinuityCaptureControl *v42;
  CMContinuityCaptureControl *v43;
  int DeviceClass;
  CMContinuityCaptureControl *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CMContinuityCaptureControl *v64;
  CMContinuityCaptureControl *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  CMContinuityCaptureControl *v74;
  void *v75;
  CMContinuityCaptureControl *v76;
  CMContinuityCaptureControl *v77;
  CMContinuityCaptureControl *v78;
  CMContinuityCaptureControl *v79;
  CMContinuityCaptureControl *v80;
  uint64_t v81;
  CMContinuityCaptureControl *v82;
  CMContinuityCaptureControl *v83;
  CMContinuityCaptureControl *v84;
  void *v85;
  void *v86;
  int v87;
  CMContinuityCaptureControl *v88;
  CMContinuityCaptureControl *v89;
  CMContinuityCaptureControl *v90;
  CMContinuityCaptureControl *v91;
  CMContinuityCaptureControl *v92;
  uint64_t v93;
  CMContinuityCaptureControl *v94;
  CMContinuityCaptureControl *v95;
  CMContinuityCaptureControl *v96;
  CMContinuityCaptureControl *v97;
  CMContinuityCaptureControl *v98;
  CMContinuityCaptureControl *v99;
  CMContinuityCaptureControl *v100;
  CMContinuityCaptureControl *v101;
  uint64_t v102;
  CMContinuityCaptureControl *v103;
  CMContinuityCaptureControl *v104;
  CMContinuityCaptureControl *v105;
  CMContinuityCaptureControl *v106;
  CMContinuityCaptureControl *v107;
  CMContinuityCaptureControl *v108;
  uint64_t v109;
  CMContinuityCaptureControl *v110;
  CMContinuityCaptureControl *v111;
  CMContinuityCaptureControl *v112;
  CMContinuityCaptureControl *v113;
  CMContinuityCaptureControl *v114;
  CMContinuityCaptureControl *v115;
  CMContinuityCaptureControl *v116;
  CMContinuityCaptureControl *v117;
  uint64_t v118;
  CMContinuityCaptureControl *v119;
  CMContinuityCaptureControl *v120;
  CMContinuityCaptureControl *v121;
  CMContinuityCaptureControl *v122;
  CMContinuityCaptureControl *v123;
  CMContinuityCaptureControl *v124;
  CMContinuityCaptureControl *v125;
  void *v126;
  CMContinuityCaptureControl *v128;
  CMContinuityCaptureControl *v129;
  CMContinuityCaptureControl *v130;
  CMContinuityCaptureControl *v131;
  CMContinuityCaptureControl *v132;
  void *v133;
  CMContinuityCaptureControl *v134;
  void *v135;
  uint64_t v136;
  CMContinuityCaptureControl *v137;
  id v138;
  CMContinuityCaptureControl *v139;
  void *v140;
  void *v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[4];

  v145[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v11 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:]([CMContinuityCaptureControl alloc], "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("OverheadCameraMode"), 0, 2, &v142, &unk_24F07F9A8);
    objc_msgSend(v5, "addObject:", v11);
LABEL_46:

    goto LABEL_47;
  }
  if (a3 == 1)
  {
    v6 = _os_feature_enabled_impl();
    v7 = *MEMORY[0x24BDB1A58];
    if ((v6 & 1) != 0)
    {
      v145[0] = *MEMORY[0x24BDB1A28];
      v145[1] = v7;
      v8 = (void *)MEMORY[0x24BDBCE30];
      v9 = v145;
      v10 = 2;
    }
    else
    {
      v144 = *MEMORY[0x24BDB1A58];
      v8 = (void *)MEMORY[0x24BDBCE30];
      v9 = &v144;
      v10 = 1;
    }
    objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
    v11 = (CMContinuityCaptureControl *)objc_claimAutoreleasedReturnValue();
    v12 = CMContinuityCaptureDevicePosition();
    v13 = *MEMORY[0x24BDB1D50];
    objc_msgSend(MEMORY[0x24BDB2468], "discoverySessionWithDeviceTypes:mediaType:position:", v11, *MEMORY[0x24BDB1D50], v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
      goto LABEL_17;
    objc_msgSend(v14, "devices");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16
      || (v17 = (void *)v16,
          objc_msgSend(v15, "devices"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v17,
          !v19))
    {
LABEL_17:
      CMContinuityCaptureLog(2);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        +[CMContinuityCaptureDeviceCapabilities _resolvedControlsForEntityType:].cold.1(v48, v49, v50, v51, v52, v53, v54, v55);
      goto LABEL_45;
    }
    v134 = v11;
    objc_msgSend(v15, "devices");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v136 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A50], v13, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", v7, v13, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(a1, "avcaptureDeviceSupportsCenterStage:", v21);
    v24 = objc_msgSend(a1, "avcaptureDeviceSupportsCenterStage:", v22);
    v141 = v21;
    v135 = v22;
    if ((v23 & 1) != 0 || v24)
    {
      v25 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v26 = MEMORY[0x24BDBD1C0];
      v139 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v25, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("4cc_cfen_glob_0000"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
      objc_msgSend(v5, "addObject:", v139);
      v27 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v137 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v27, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("4cc_cfac_glob_0000"), 0, 1, &v142, v26);
      objc_msgSend(v5, "addObject:", v137);
      v28 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v132 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v28, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("4cc_cfri_glob_0000"), 0, 1, &v142, 0x24F07FDC8);
      objc_msgSend(v5, "addObject:", v132);
      v29 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v130 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v29, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("4cc_cffm_glob_0000"), 0, 1, &v142, &unk_24F07F978);
      objc_msgSend(v5, "addObject:", v130);
      v30 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v31 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v30, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("StartPanningAtPoint"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v31);
      v32 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v33 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v32, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PanWithTranslation"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v33);
      v34 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v35 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v34, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PerformOneShotFraming"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v35);
      v36 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v37 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v36, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ResetFraming"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v37);
      v38 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v39 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v38, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("CenterStageFieldOfViewRestrictedToWide"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v39);
      v40 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v41 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v40, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ManualFramingDeviceType"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v41);
      v42 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v43 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v42, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ManualFramingSupported"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v43);

      v21 = v141;
      v22 = v135;

    }
    DeviceClass = GestaltGetDeviceClass();
    v45 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6E8;
    v143 = 1;
    v46 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v45, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("DeviceHasWideCamera"), 0, 1, &v142, MEMORY[0x24BDBD1C8]);
    v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v138 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v140 = v47;
    v133 = (void *)v46;
    if (DeviceClass == 3)
    {
      v48 = v136;
      if (v22 && !v21)
      {
        objc_msgSend(v5, "addObject:", v46);
        goto LABEL_23;
      }
    }
    else
    {
      v48 = v136;
      if (v22)
      {
        objc_msgSend(v5, "addObject:", v46);
        v56 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v22, "manualFramingMinZoomFactor");
        objc_msgSend(v56, "numberWithDouble:");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v57, *MEMORY[0x24BE10408]);

        v58 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v22, "manualFramingMaxZoomFactor");
        objc_msgSend(v58, "numberWithDouble:");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BE10400]);

        v60 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v22, "manualFramingDefaultZoomFactor");
        objc_msgSend(v60, "numberWithDouble:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v61, *MEMORY[0x24BE103F8]);

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v138);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v62, v63);

      }
    }
    if (v21)
    {
      v64 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v65 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v64, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("DeviceHasUltraWideCamera"), 0, 1, &v142, MEMORY[0x24BDBD1C8]);
      objc_msgSend(v5, "addObject:", v65);
      v66 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "manualFramingMinZoomFactor");
      objc_msgSend(v66, "numberWithDouble:");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "setObject:forKeyedSubscript:", v67, *MEMORY[0x24BE10408]);

      v68 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "manualFramingMaxZoomFactor");
      objc_msgSend(v68, "numberWithDouble:");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "setObject:forKeyedSubscript:", v69, *MEMORY[0x24BE10400]);

      v70 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "manualFramingDefaultZoomFactor");
      objc_msgSend(v70, "numberWithDouble:");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "setObject:forKeyedSubscript:", v71, *MEMORY[0x24BE103F8]);

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v138);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "setObject:forKeyedSubscript:", v72, v73);

      v47 = v140;
    }
LABEL_23:
    if (objc_msgSend(v47, "count"))
    {
      v74 = [CMContinuityCaptureControl alloc];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v47);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = xmmword_227CED6E8;
      v143 = 1;
      v76 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v74, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ZoomFactorConstantsByManualFramingDeviceType"), 0, 1, &v142, v75);

      objc_msgSend(v5, "addObject:", v76);
    }
    v77 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v131 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v77, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("FaceDetectionEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:");
    if ((objc_msgSend(a1, "avcaptureDeviceSupportsFlash:", v48) & 1) != 0
      || objc_msgSend(a1, "avcaptureDeviceSupportsFlash:", v21))
    {
      v78 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v79 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v78, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("Flash"), 0, 1, &v142, MEMORY[0x24BDBD1C8]);
      objc_msgSend(v5, "addObject:", v79);

    }
    v80 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v81 = MEMORY[0x24BDBD1C0];
    v129 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v80, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("AsyncStillCaptureEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:");
    v82 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v128 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v82, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("AsyncStillCaptureConfigurations"), 0, 1, &v142, 0);
    objc_msgSend(v5, "addObject:");
    v83 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v84 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v83, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("HumanBodyDetectionEnabled"), 0, 1, &v142, v81);
    objc_msgSend(v5, "addObject:", v84);
    objc_msgSend(v22, "supportedMetadataObjectIdentifiers");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "containsObject:", CFSTR("mdta/com.apple.quicktime.detected-human-full-body")))
    {

    }
    else
    {
      objc_msgSend(v21, "supportedMetadataObjectIdentifiers");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "containsObject:", CFSTR("mdta/com.apple.quicktime.detected-human-full-body"));

      if (!v87)
        goto LABEL_32;
    }
    v88 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v89 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v88, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("HumanFullBodyDetectionEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:", v89);

LABEL_32:
    v90 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v91 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v90, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("SuppressVideoEffects"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:", v91);
    if ((objc_msgSend(a1, "avcaptureDeviceSupportsPortraitEffect:", v48) & 1) != 0
      || objc_msgSend(a1, "avcaptureDeviceSupportsPortraitEffect:", v21))
    {
      v92 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v93 = MEMORY[0x24BDBD1C0];
      v94 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v92, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PortraitEffectEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
      objc_msgSend(v5, "addObject:", v94);
      v95 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v96 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v95, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PortraitEffectActive"), 0, 1, &v142, v93);
      objc_msgSend(v5, "addObject:", v96);
      v97 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v98 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v97, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PortraitEffectAperture"), 0, 1, &v142, &unk_24F07FCC8);
      objc_msgSend(v5, "addObject:", v98);

    }
    v99 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v100 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v99, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("PerFrameExifDataEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:", v100);
    if ((objc_msgSend(a1, "avcaptureDeviceSupportsStudioLighting:", v48) & 1) != 0
      || objc_msgSend(a1, "avcaptureDeviceSupportsStudioLighting:", v141))
    {
      v101 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v102 = MEMORY[0x24BDBD1C0];
      v103 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v101, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("StudioLightingEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
      objc_msgSend(v5, "addObject:", v103);
      v104 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v105 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v104, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("StudioLightingActive"), 0, 1, &v142, v102);
      objc_msgSend(v5, "addObject:", v105);
      v106 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v107 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v106, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("StudioLightingIntensity"), 0, 1, &v142, &unk_24F07FCD8);
      objc_msgSend(v5, "addObject:", v107);

    }
    if ((objc_msgSend(a1, "avcaptureDeviceSupportsReactionEffects:", v48) & 1) != 0
      || objc_msgSend(a1, "avcaptureDeviceSupportsReactionEffects:", v141))
    {
      v108 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v109 = MEMORY[0x24BDBD1C0];
      v110 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v108, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ReactionEffectsEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
      objc_msgSend(v5, "addObject:", v110);
      v111 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v112 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v111, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ReactionEffectsActive"), 0, 1, &v142, v109);
      objc_msgSend(v5, "addObject:", v112);
      v113 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v114 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v113, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("GesturesEnabled"), 0, 1, &v142, v109);
      objc_msgSend(v5, "addObject:", v114);
      v115 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v116 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v115, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ReactionsInProgress"), 0, 1, &v142, MEMORY[0x24BDBD1A8]);
      objc_msgSend(v5, "addObject:", v116);

      v48 = v136;
    }
    if ((objc_msgSend(a1, "avcaptureDeviceSupportsBackgroundReplacement:", v48) & 1) != 0
      || objc_msgSend(a1, "avcaptureDeviceSupportsBackgroundReplacement:", v141))
    {
      v117 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v118 = MEMORY[0x24BDBD1C0];
      v119 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v117, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("BackgroundReplacementEnabled"), 0, 1, &v142, MEMORY[0x24BDBD1C0]);
      objc_msgSend(v5, "addObject:", v119);
      v120 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v121 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v120, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("BackgroundReplacementActive"), 0, 1, &v142, v118);
      objc_msgSend(v5, "addObject:", v121);
      v122 = [CMContinuityCaptureControl alloc];
      v142 = xmmword_227CED6D0;
      v143 = 0;
      v123 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v122, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("BackgroundReplacementPixelBuffer"), 0, 1, &v142, 0);
      objc_msgSend(v5, "addObject:", v123);

    }
    v124 = [CMContinuityCaptureControl alloc];
    v142 = xmmword_227CED6D0;
    v143 = 0;
    v125 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v124, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("VideoZoomFactor"), 0, 1, &v142, &unk_24F07F990);
    objc_msgSend(v5, "addObject:", v125);

    v11 = v134;
LABEL_45:

    goto LABEL_46;
  }
LABEL_47:
  v126 = (void *)objc_msgSend(v5, "copy");

  return v126;
}

+ (BOOL)avcaptureDeviceSupportsStudioLighting:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "formats", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isStudioLightSupported") & 1) != 0
          || (objc_msgSend(v8, "isStudioLightingSupportedForContinuityCamera") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsReactionEffects:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "formats", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "reactionEffectsSupported") & 1) != 0
          || (objc_msgSend(v8, "reactionEffectsSupportedForContinuityCamera") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsBackgroundReplacement:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "formats", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isBackgroundReplacementSupported") & 1) != 0
          || (objc_msgSend(v8, "isBackgroundReplacementSupportedForContinuityCamera") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsCenterStage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "formats", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isCenterStageSupported") & 1) != 0
          || (objc_msgSend(v8, "isCenterStageSupportedForContinuityCamera") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsFlash:(id)a3
{
  return objc_msgSend(a3, "hasFlash");
}

+ (BOOL)avcaptureDeviceSupportsPortraitEffect:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "formats", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isBackgroundBlurSupported") & 1) != 0
          || (objc_msgSend(v8, "isBackgroundBlurSupportedForContinuityCamera") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)supportsControlWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CMContinuityCaptureDeviceCapabilities controls](self, "controls", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int64_t entityType;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = self->_streamFormats;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v10), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = self->_manualFramingSupportedStreamFormats;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16), "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = self->_controls;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v20);
  }

  v24 = (void *)MEMORY[0x24BDD17C8];
  entityType = self->_entityType;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("entity: %d, formats: [%@], ManualFraming formats: [%@], controls: [%@]"), entityType, v26, v27, v28, (_QWORD)v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v29;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceCapabilities debugDescription](self, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (NSArray)streamFormats
{
  return self->_streamFormats;
}

- (NSArray)manualFramingSupportedStreamFormats
{
  return self->_manualFramingSupportedStreamFormats;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualFramingSupportedStreamFormats, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_streamFormats, 0);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_EntityType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_StreamFormats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_Controls", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

+ (void)_resolvedStreamFormatsForEntityType:(int)a1 requireManualFramingSupport:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "Unexpected entity type: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_14();
}

+ (void)_resolvedStreamFormatsForEntityType:(uint64_t)a3 requireManualFramingSupport:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, a1, a3, "Device discovery failed. Cannot resolve stream formats for entity type %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_resolvedControlsForEntityType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, a1, a3, "Device discovery failed. Cannot resolve controls for entity type %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
