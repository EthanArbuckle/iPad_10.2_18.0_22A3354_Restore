@implementation BWFigVideoCaptureSynchronizedStreamsGroup

- (BWFigVideoCaptureStream)cameraControlsStatisticsMasterStream
{
  return self->_cameraControlsStatisticsMasterStream;
}

- (uint64_t)_slaveConfigurationForStream:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = objc_msgSend(a2, "streamingRequiredWhenConfiguredAsSlave");
    v4 = objc_msgSend(a2, "firmwareTimeMachineEnabledWhenConfiguredAsSlave");
    v5 = objc_msgSend(a2, "masterToSlaveFrameRateRatio");
    v6[0] = *MEMORY[0x1E0D07CB8];
    v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6[1] = *MEMORY[0x1E0D07CB0];
    v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v6[2] = *MEMORY[0x1E0D07CA8];
    v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v5 > 1);
    v6[3] = *MEMORY[0x1E0D07CC0];
    v7[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  }
  return result;
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (BWFigCaptureSynchronizedStreamsGroup)syncGroup
{
  return self->_synchronizedStreamsGroup;
}

- (NSArray)activePortTypes
{
  return self->_activePortTypes;
}

- (void)setMaximumNumberOfSlaveStreamsWithFrameProcessingEnabled:(int)a3
{
  uint64_t v3;

  if (!self->_readOnly)
  {
    v3 = *(_QWORD *)&a3;
    if (-[BWFigVideoCaptureSynchronizedStreamsGroup maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported](self, "maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported"))
    {
      if (self->_maximumNumberOfSlaveStreamsWithFrameProcessingEnabled != (_DWORD)v3
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", *MEMORY[0x1E0D081D0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)))
      {
        self->_maximumNumberOfSlaveStreamsWithFrameProcessingEnabled = v3;
      }
    }
  }
}

- (BOOL)maximumNumberOfSlaveStreamsWithFrameProcessingEnabledSupported
{
  NSDictionary *v2;

  if (!self->_atomicMasterSlaveReconfigurationSupported)
    return 0;
  v2 = -[BWFigCaptureSynchronizedStreamsGroup supportedProperties](self->_synchronizedStreamsGroup, "supportedProperties");
  return -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D081D0]) != 0;
}

- (void)setMinimumMasterToSlaveFrameRateRatio:(unsigned int)a3
{
  if (!self->_readOnly)
    -[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", *MEMORY[0x1E0D081E8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (unsigned)minimumMasterToSlaveFrameRateRatio
{
  return objc_msgSend(-[BWFigCaptureSynchronizedStreamsGroup getProperty:error:](self->_synchronizedStreamsGroup, "getProperty:error:", *MEMORY[0x1E0D081E8], 0), "intValue");
}

- (BOOL)minimumMasterToSlaveFrameRateRatioSupported
{
  NSDictionary *v2;

  v2 = -[BWFigCaptureSynchronizedStreamsGroup supportedProperties](self->_synchronizedStreamsGroup, "supportedProperties");
  return -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D081E8]) != 0;
}

- (void)setMaximumNumberOfSlaveStreamsWithoutFrameSkipping:(int)a3
{
  uint64_t v3;

  if (!self->_readOnly)
  {
    v3 = *(_QWORD *)&a3;
    if (-[BWFigVideoCaptureSynchronizedStreamsGroup maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported](self, "maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported"))
    {
      if (self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping != (_DWORD)v3
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", *MEMORY[0x1E0D081D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)))
      {
        self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping = v3;
      }
    }
  }
}

- (BOOL)maximumNumberOfSlaveStreamsWithoutFrameSkippingSupported
{
  NSDictionary *v2;

  if (!self->_atomicMasterSlaveReconfigurationSupported)
    return 0;
  v2 = -[BWFigCaptureSynchronizedStreamsGroup supportedProperties](self->_synchronizedStreamsGroup, "supportedProperties");
  return -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D081D8]) != 0;
}

- (BWFigVideoCaptureSynchronizedStreamsGroup)initWithSynchronizedStreamsGroup:(id)a3 activeStreams:(id)a4 readOnly:(BOOL)a5 baseZoomFactorOverrides:(id)a6 clientBaseZoomFactorsByPortType:(id)a7 error:(int *)a8
{
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  BWFigCaptureSynchronizedStreamsGroup *v23;
  NSDictionary *v24;
  uint64_t v25;
  id v26;
  char v27;
  int *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  int ViewAndPose;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  ViewAndPose = 0;
  if (objc_msgSend(a4, "count"))
  {
    v37.receiver = self;
    v37.super_class = (Class)BWFigVideoCaptureSynchronizedStreamsGroup;
    self = -[BWFigVideoCaptureSynchronizedStreamsGroup init](&v37, sel_init);
    if (!self)
      return self;
    v31 = a7;
    v32 = a3;
    v29 = a8;
    v30 = a6;
    self->_activeStreams = (NSArray *)a4;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = 0u;
    v34 = 0u;
    v16 = a4 != 0;
    v35 = 0u;
    v36 = 0u;
    v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      v20 = *MEMORY[0x1E0D073F8];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(a4);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "addObject:", objc_msgSend(v22, "portType"));
          v16 &= objc_msgSend((id)objc_msgSend(v22, "supportedProperties"), "objectForKeyedSubscript:", v20) != 0;
        }
        v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v18);
    }
    self->_activePortTypes = (NSArray *)objc_msgSend(v15, "copy");
    v23 = (BWFigCaptureSynchronizedStreamsGroup *)v32;
    self->_synchronizedStreamsGroup = v23;
    if (v23)
    {
      self->_readOnly = a5;
      if ((a5
         || (ViewAndPose = -[BWFigCaptureSynchronizedStreamsGroup setActiveStreams:](v23, "setActiveStreams:", a4)) == 0)
        && ((v16 & 1) != 0
         || (ViewAndPose = -[BWFigVideoCaptureSynchronizedStreamsGroup _getViewAndPoseMatrices]((uint64_t)self)) == 0)
        && (-[NSArray count](self->_activeStreams, "count") < 2
         || (ViewAndPose = -[BWFigVideoCaptureSynchronizedStreamsGroup _computeBaseZoomFactorsWithOverrides:clientBaseZoomFactorsByPortType:]((uint64_t)self, v30, v31)) == 0))
      {
        if (-[NSArray containsObject:](self->_activePortTypes, "containsObject:", *MEMORY[0x1E0D05A40])
          || (v24 = -[BWFigCaptureSynchronizedStreamsGroup supportedProperties](self->_synchronizedStreamsGroup, "supportedProperties"), v25 = -[NSDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D081B8]), self->_masterConfigurationSupported = v25 != 0, !v25))
        {
LABEL_24:
          *(_QWORD *)&self->_maximumNumberOfSlaveStreamsWithoutFrameSkipping = -1;
          self->_maximumNumberOfEnabledSlaveTimeMachines = -1;
          return self;
        }
        v26 = -[BWFigCaptureSynchronizedStreamsGroup getProperty:error:](self->_synchronizedStreamsGroup, "getProperty:error:", *MEMORY[0x1E0D081C0], &ViewAndPose);
        if (!ViewAndPose)
        {
          if (self->_masterConfigurationSupported)
            v27 = objc_msgSend(v26, "containsObject:", *MEMORY[0x1E0D08180]);
          else
            v27 = 0;
          self->_atomicMasterSlaveReconfigurationSupported = v27;
          goto LABEL_24;
        }
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      ViewAndPose = -12782;
    }
    a8 = v29;
  }
  else
  {
    FigDebugAssert3();
  }

  self = 0;
  if (a8)
    *a8 = ViewAndPose;
  return self;
}

- (uint64_t)_computeBaseZoomFactorsWithOverrides:(void *)a3 clientBaseZoomFactorsByPortType:
{
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t i;
  uint64_t v13;
  float v14;
  float v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
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
  __int128 v39;
  __int128 v40;
  unsigned int v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = (_QWORD *)result;
    v41 = 0;
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "getProperty:error:", *MEMORY[0x1E0D081A8], &v41), "mutableCopy");
    if (v41)
    {
      FigDebugAssert3();
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = (void *)v5[3];
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v38;
        v11 = 3.4028e38;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v38 != v10)
              objc_enumerationMutation(v7);
            v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v6, "allKeys"), "containsObject:", v13))
            {
              objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v13), "floatValue");
              if (v11 >= v14)
              {
                objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v13), "floatValue");
                v11 = v15;
              }
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 3.4028e38;
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v16 = (void *)v5[2];
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "portType");
            objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v21), "floatValue");
            if (*(float *)&v22 == 0.0)
              *(float *)&v22 = 1.0;
            *(float *)&v22 = *(float *)&v22 / v11;
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), v21);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v18);
      }
      if (a3)
        v23 = a3;
      else
        v23 = v6;
      v5[7] = objc_msgSend(v23, "copy");
      if (a2)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = (void *)objc_msgSend(a2, "allKeys");
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v30;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v30 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k)), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
          }
          while (v26);
        }
      }
      v5[6] = objc_msgSend(v6, "copy");
    }

    return v41;
  }
  return result;
}

- (void)setMaximumNumberOfEnabledSlaveTimeMachines:(int)a3
{
  uint64_t v4;
  NSDictionary *v5;
  uint64_t v6;

  if (!self->_readOnly && self->_atomicMasterSlaveReconfigurationSupported)
  {
    v4 = *(_QWORD *)&a3;
    v5 = -[BWFigCaptureSynchronizedStreamsGroup supportedProperties](self->_synchronizedStreamsGroup, "supportedProperties");
    v6 = *MEMORY[0x1E0D081C8];
    if (-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D081C8]))
    {
      if (self->_maximumNumberOfEnabledSlaveTimeMachines != (_DWORD)v4
        && !-[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self->_synchronizedStreamsGroup, "setProperty:value:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4)))
      {
        self->_maximumNumberOfEnabledSlaveTimeMachines = v4;
      }
    }
  }
}

- (int)setMasterStream:(id)a3 allStreams:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  int v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_readOnly)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(a4);
          v12 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (v12 != a3)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", -[BWFigVideoCaptureSynchronizedStreamsGroup _slaveConfigurationForStream:]((uint64_t)self, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i)), objc_msgSend(v12, "portType"));
        }
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }
    if (self->_currentMasterStream == a3
      && (objc_msgSend(v7, "isEqualToDictionary:", self->_currentSlaveConfigurationsByPortType) & 1) != 0)
    {
      return 0;
    }
    if (self->_atomicMasterSlaveReconfigurationSupported)
    {
      v13 = -[BWFigCaptureSynchronizedStreamsGroup setMasterStream:slaveConfigurationsByPortType:](self->_synchronizedStreamsGroup, "setMasterStream:slaveConfigurationsByPortType:", objc_msgSend(a3, "stream"), v7);
      if (v13)
      {
        v14 = v13;
LABEL_30:
        FigDebugAssert3();
        return v14;
      }
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        v18 = *MEMORY[0x1E0D077E0];
        while (2)
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(a4);
            v20 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * j);
            if (v20 != a3)
            {
              v21 = objc_msgSend((id)objc_msgSend(v20, "stream"), "setProperty:value:", v18, objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "portType")));
              if (v21)
              {
                v14 = v21;
                goto LABEL_30;
              }
            }
          }
          v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v16)
            continue;
          break;
        }
      }
      if (self->_masterConfigurationSupported)
      {
        v22 = -[BWFigCaptureSynchronizedStreamsGroup setMasterStream:slaveConfigurationsByPortType:](self->_synchronizedStreamsGroup, "setMasterStream:slaveConfigurationsByPortType:", objc_msgSend(a3, "stream"), 0);
        if (v22)
        {
          v14 = v22;
          goto LABEL_30;
        }
      }
    }

    self->_currentMasterStream = (BWFigVideoCaptureStream *)a3;
    v14 = 0;
    self->_currentSlaveConfigurationsByPortType = (NSDictionary *)v7;
    return v14;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)setCameraControlsStatisticsMasterStream:(id)a3
{
  int result;

  if (self->_statsMasterHasBeenSet && self->_cameraControlsStatisticsMasterStream == a3)
    return 0;
  if (self->_readOnly || !self->_masterConfigurationSupported)
    return FigSignalErrorAt();
  result = -[BWFigCaptureSynchronizedStreamsGroup setCameraControlsMasterStream:](self->_synchronizedStreamsGroup, "setCameraControlsMasterStream:", objc_msgSend(a3, "stream"));
  if (!result)
  {
    self->_cameraControlsStatisticsMasterStream = (BWFigVideoCaptureStream *)a3;
    self->_statsMasterHasBeenSet = 1;
  }
  return result;
}

- (NSDictionary)clientBaseZoomFactorsByPortType
{
  return self->_clientBaseZoomFactorsByPortType;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
  id v5;

  v5 = (id)-[NSDictionary mutableCopy](self->_baseZoomFactorsByPortType, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", a3);

  self->_baseZoomFactorsByPortType = (NSDictionary *)objc_msgSend(v5, "copy");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (uint64_t)_getViewAndPoseMatrices
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unsigned int v24;
  _BYTE v25[128];
  int v26;
  __int128 v27;
  _DWORD v28[7];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v24 = 0;
  v17 = -[BWFigVideoCaptureSynchronizedStreamsGroup _worldPortType](result);
  memset(v28, 0, sizeof(v28));
  v27 = 0u;
  v26 = 1065353216;
  v28[0] = 1065353216;
  v28[5] = 1065353216;
  v2 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26, 48);
  v16 = (void *)objc_msgSend(*(id *)(v1 + 8), "getProperty:error:", *MEMORY[0x1E0D081B0], &v24);
  if (v24)
  {
    FigDebugAssert3();
    goto LABEL_26;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v1;
  obj = *(id *)(v1 + 24);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  v7 = *(_QWORD *)v21;
  v8 = *MEMORY[0x1E0D05A18];
  v9 = *MEMORY[0x1E0D05A38];
  v18 = *MEMORY[0x1E0D05A50];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v12 = (void *)v2;
      if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) == 0)
      {
        v12 = (void *)v2;
        if ((objc_msgSend(v11, "isEqualToString:", v9) & 1) != 0)
          goto LABEL_15;
        v12 = (void *)v2;
        if ((objc_msgSend(v11, "isEqualToString:", v18) & 1) != 0)
          goto LABEL_15;
        if (!objc_msgSend((id)objc_msgSend(v16, "allKeys"), "containsObject:", v11))
        {
          v12 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v11);
LABEL_15:
          objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v11);
          if (v12)
            goto LABEL_19;
          goto LABEL_16;
        }
        v12 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v17);
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);
LABEL_16:
      if (objc_msgSend(v12, "length") == 48)
        v12 = BWInvertRowMajorViewMatrixData(v12);
      else
        v12 = 0;
LABEL_19:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  }
  while (v6);
LABEL_21:
  v13 = objc_msgSend(v3, "count");
  if (v13)
    v13 = objc_msgSend(v3, "copy");
  *(_QWORD *)(v15 + 32) = v13;
  v14 = objc_msgSend(v4, "count");
  if (v14)
    v14 = objc_msgSend(v4, "copy");
  *(_QWORD *)(v15 + 40) = v14;
LABEL_26:
  if (v24 == -12782)
    return 0;
  else
    return v24;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFigVideoCaptureSynchronizedStreamsGroup;
  -[BWFigVideoCaptureSynchronizedStreamsGroup dealloc](&v3, sel_dealloc);
}

- (id)cameraViewMatrixForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_cameraViewMatricesByPortType, "objectForKeyedSubscript:", a3);
}

- (id)cameraPoseMatrixForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_cameraPoseMatricesByPortType, "objectForKeyedSubscript:", a3);
}

- (uint64_t)_worldPortType
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 8), "streams", 0);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v3 = *MEMORY[0x1E0D05A38];
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v10;
    v6 = *MEMORY[0x1E0D05A50];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v1);
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "portType"), "hasPrefix:", CFSTR("PortTypeBack")))return *MEMORY[0x1E0D05A18];
        if (FigCFEqual())
          return v3;
        if (FigCFEqual())
          return v6;
      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  return v3;
}

@end
