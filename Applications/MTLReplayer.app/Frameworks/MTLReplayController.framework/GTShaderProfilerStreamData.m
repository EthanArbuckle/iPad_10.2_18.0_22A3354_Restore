@implementation GTShaderProfilerStreamData

- (GTShaderProfilerStreamData)init
{
  GTShaderProfilerStreamData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTShaderProfilerStreamData;
  result = -[GTShaderProfilerStreamData init](&v3, "init");
  if (result)
  {
    result->_supportsFileFormatV2 = 0;
    result->_version = 4;
  }
  return result;
}

- (GTShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  GTShaderProfilerStreamData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTShaderProfilerStreamData;
  result = -[GTShaderProfilerStreamData init](&v5, "init");
  if (result)
  {
    result->_supportsFileFormatV2 = a3;
    result->_version = 4;
  }
  return result;
}

- (GTShaderProfilerStreamData)initWithCoder:(id)a3
{
  id v4;
  GTShaderProfilerStreamData *v5;
  int v6;
  uint64_t v7;
  int v8;
  GTShaderProfilerStreamData *v9;
  segment_command_64 *v10;
  char *v11;
  char *v12;
  segment_command_64 *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSString *traceName;
  uint64_t v28;
  NSMutableData *gpuCommandInfoData;
  uint64_t v30;
  NSMutableData *encoderInfoData;
  uint64_t v32;
  NSMutableData *pipelineStateInfoData;
  uint64_t v34;
  NSMutableData *commandBufferInfoData;
  uint64_t v36;
  NSMutableData *functionInfoData;
  uint64_t v38;
  NSMutableArray *strings;
  uint64_t v40;
  NSArray *batchIdFilterableCounters;
  uint64_t v42;
  NSMutableArray *archivedShaderProfilerData;
  uint64_t v44;
  NSMutableArray *archivedGPUTimelineData;
  uint64_t v46;
  NSMutableArray *archivedBatchIdFilteredCounterData;
  uint64_t v48;
  NSMutableArray *archivedAPSData;
  uint64_t v50;
  NSMutableArray *archivedAPSCounterData;
  uint64_t v52;
  NSMutableArray *archivedAPSTimelineData;
  objc_super v55;
  _QWORD v56[2];

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)GTShaderProfilerStreamData;
  v5 = -[GTShaderProfilerStreamData init](&v55, "init");
  if (!v5)
  {
LABEL_15:
    v9 = v5;
    goto LABEL_16;
  }
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  v8 = v6;
  v5->_version = v6;
  if (v6 > 4)
  {
    v9 = 0;
    goto LABEL_16;
  }
  if (v6 != 1
    || (v10 = (segment_command_64 *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gpuCommandInfoSize")),
        v11 = (char *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encoderInfoSize")),
        v12 = (char *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pipelineStateInfoSize")),
        v13 = (segment_command_64 *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("commandBufferInfoSize")),
        v14 = (char *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("functionInfoSize")),
        v9 = 0,
        v10 == &stru_20)
    && v11 == stru_20.segname
    && v12 == stru_20.segname
    && v13 == &stru_20
    && v14 == &stru_20.segname[8])
  {
    v56[0] = objc_opt_class(NSData, v7);
    v56[1] = objc_opt_class(NSMutableData, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

    v19 = objc_msgSend((id)objc_opt_class(v5, v18), "streamDataClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v5->_blitCallCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numBlitCalls"));
    v5->_supportsFileFormatV2 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSeparateAPSData"));
    v5->_gpuGeneration = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gpuGeneration"));
    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v21), CFSTR("metalPluginName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[GTShaderProfilerStreamData setMetalPluginName:](v5, "setMetalPluginName:", v23);

    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v24), CFSTR("traceName"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    traceName = v5->_traceName;
    v5->_traceName = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("gpuCommandInfoData")));
    gpuCommandInfoData = v5->_gpuCommandInfoData;
    v5->_gpuCommandInfoData = (NSMutableData *)v28;

    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("encoderInfoData")));
    encoderInfoData = v5->_encoderInfoData;
    v5->_encoderInfoData = (NSMutableData *)v30;

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("pipelineStateInfoData")));
    pipelineStateInfoData = v5->_pipelineStateInfoData;
    v5->_pipelineStateInfoData = (NSMutableData *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("commandBufferInfoData")));
    commandBufferInfoData = v5->_commandBufferInfoData;
    v5->_commandBufferInfoData = (NSMutableData *)v34;

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("functionInfoData")));
    functionInfoData = v5->_functionInfoData;
    v5->_functionInfoData = (NSMutableData *)v36;

    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("strings")));
    strings = v5->_strings;
    v5->_strings = (NSMutableArray *)v38;

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("batchIdFiterableCounters")));
    batchIdFilterableCounters = v5->_batchIdFilterableCounters;
    v5->_batchIdFilterableCounters = (NSArray *)v40;

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("shaderProfilerData")));
    archivedShaderProfilerData = v5->_archivedShaderProfilerData;
    v5->_archivedShaderProfilerData = (NSMutableArray *)v42;

    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("gpuTimelineData")));
    archivedGPUTimelineData = v5->_archivedGPUTimelineData;
    v5->_archivedGPUTimelineData = (NSMutableArray *)v44;

    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("batchIdFilteredCountersData")));
    archivedBatchIdFilteredCounterData = v5->_archivedBatchIdFilteredCounterData;
    v5->_archivedBatchIdFilteredCounterData = (NSMutableArray *)v46;

    if (v8 >= 2)
    {
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("APSData")));
      archivedAPSData = v5->_archivedAPSData;
      v5->_archivedAPSData = (NSMutableArray *)v48;

      v5->_gpuGeneration = 2;
      if (v8 != 2)
      {
        v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("APSCounterData")));
        archivedAPSCounterData = v5->_archivedAPSCounterData;
        v5->_archivedAPSCounterData = (NSMutableArray *)v50;

        if (v8 >= 4)
        {
          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("APSTimelineData")));
          archivedAPSTimelineData = v5->_archivedAPSTimelineData;
          v5->_archivedAPSTimelineData = (NSMutableArray *)v52;

        }
      }
    }
    v5->_dataSourceHasUnusedResources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dataSourceHasUnusedResources"));
    v5->_captureRange.location = (NSUInteger)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("captureRangeLocation"));
    v5->_captureRange.length = (NSUInteger)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("captureRangeLength"));

    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (void)encodeAPSArrayForOldHost:(id)a3 array:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = v6;
    objc_msgSend(v6, "removeAllObjects");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = objc_autoreleasePoolPush();
          v14 = objc_msgSend(v12, "mutableCopy");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("APSTraceDataFile")));
          if (v15 && !self->_supportsFileFormatV2)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v15, 1, 0));
            if (v16)
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("APSTraceData"));

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0));
          if (v17)
            objc_msgSend(v7, "addObject:", v17);

          objc_msgSend(v14, "removeAllObjects");
          if (v15)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            objc_msgSend(v18, "removeItemAtPath:error:", v15, 0);

          }
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v5 = v19;
    v6 = v7;
  }

}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version;
  void *v5;
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
  id v18;

  version = self->_version;
  v18 = a3;
  objc_msgSend(v18, "encodeInteger:forKey:", version, CFSTR("version"));
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:](self, "encodeAPSArrayForOldHost:array:", self->_tempAPSData, self->_archivedAPSData);
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:](self, "encodeAPSArrayForOldHost:array:", self->_tempAPSTimelineData, self->_archivedAPSTimelineData);
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:](self, "encodeAPSArrayForOldHost:array:", self->_tempAPSCounterData, self->_archivedAPSCounterData);
  objc_msgSend(v18, "encodeInteger:forKey:", 32, CFSTR("gpuCommandInfoSize"));
  objc_msgSend(v18, "encodeInteger:forKey:", 40, CFSTR("encoderInfoSize"));
  objc_msgSend(v18, "encodeInteger:forKey:", 40, CFSTR("pipelineStateInfoSize"));
  objc_msgSend(v18, "encodeInteger:forKey:", 32, CFSTR("commandBufferInfoSize"));
  objc_msgSend(v18, "encodeInteger:forKey:", 48, CFSTR("functionInfoSize"));
  objc_msgSend(v18, "encodeInteger:forKey:", -[GTShaderProfilerStreamData blitCallCount](self, "blitCallCount"), CFSTR("numBlitCalls"));
  objc_msgSend(v18, "encodeBool:forKey:", -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"), CFSTR("supportsSeparateAPSData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData gpuCommandInfoData](self, "gpuCommandInfoData"));
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("gpuCommandInfoData"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData encoderInfoData](self, "encoderInfoData"));
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("encoderInfoData"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData pipelineStateInfoData](self, "pipelineStateInfoData"));
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("pipelineStateInfoData"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData commandBufferInfoData](self, "commandBufferInfoData"));
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("commandBufferInfoData"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData functionInfoData](self, "functionInfoData"));
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("functionInfoData"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData strings](self, "strings"));
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("strings"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData batchIdFilterableCounters](self, "batchIdFilterableCounters"));
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("batchIdFiterableCounters"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedShaderProfilerData](self, "archivedShaderProfilerData"));
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("shaderProfilerData"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedGPUTimelineData](self, "archivedGPUTimelineData"));
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("gpuTimelineData"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedBatchIdFilteredCounterData](self, "archivedBatchIdFilteredCounterData"));
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("batchIdFilteredCountersData"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSData](self, "archivedAPSData"));
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("APSData"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSCounterData](self, "archivedAPSCounterData"));
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("APSCounterData"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSTimelineData](self, "archivedAPSTimelineData"));
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("APSTimelineData"));

  objc_msgSend(v18, "encodeBool:forKey:", self->_dataSourceHasUnusedResources, CFSTR("dataSourceHasUnusedResources"));
  objc_msgSend(v18, "encodeInteger:forKey:", self->_captureRange.location, CFSTR("captureRangeLocation"));
  objc_msgSend(v18, "encodeInteger:forKey:", self->_captureRange.length, CFSTR("captureRangeLength"));
  objc_msgSend(v18, "encodeInt32:forKey:", self->_gpuGeneration, CFSTR("gpuGeneration"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_metalPluginName, CFSTR("metalPluginName"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_traceName, CFSTR("traceName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[1] = -[GTShaderProfilerStreamData version](self, "version");
  v5[2] = -[GTShaderProfilerStreamData blitCallCount](self, "blitCallCount");
  *((_BYTE *)v5 + 272) = -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData gpuCommandInfoData](self, "gpuCommandInfoData"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[3];
  v5[3] = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData encoderInfoData](self, "encoderInfoData"));
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData pipelineStateInfoData](self, "pipelineStateInfoData"));
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData commandBufferInfoData](self, "commandBufferInfoData"));
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedShaderProfilerData](self, "archivedShaderProfilerData"));
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  v20 = (void *)v5[9];
  v5[9] = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedGPUTimelineData](self, "archivedGPUTimelineData"));
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  v23 = (void *)v5[8];
  v5[8] = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedBatchIdFilteredCounterData](self, "archivedBatchIdFilteredCounterData"));
  v25 = objc_msgSend(v24, "copyWithZone:", a3);
  v26 = (void *)v5[10];
  v5[10] = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSData](self, "archivedAPSData"));
  v28 = objc_msgSend(v27, "copyWithZone:", a3);
  v29 = (void *)v5[11];
  v5[11] = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSCounterData](self, "archivedAPSCounterData"));
  v31 = objc_msgSend(v30, "copyWithZone:", a3);
  v32 = (void *)v5[13];
  v5[13] = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSTimelineData](self, "archivedAPSTimelineData"));
  v34 = objc_msgSend(v33, "copyWithZone:", a3);
  v35 = (void *)v5[12];
  v5[12] = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData functionInfoData](self, "functionInfoData"));
  v37 = objc_msgSend(v36, "copyWithZone:", a3);
  v38 = (void *)v5[7];
  v5[7] = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData strings](self, "strings"));
  v40 = objc_msgSend(v39, "copyWithZone:", a3);
  v41 = (void *)v5[20];
  v5[20] = v40;

  *((_BYTE *)v5 + 192) = -[GTShaderProfilerStreamData dataSourceHasUnusedResources](self, "dataSourceHasUnusedResources");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData batchIdFilterableCounters](self, "batchIdFilterableCounters"));
  v43 = objc_msgSend(v42, "copyWithZone:", a3);
  v44 = (void *)v5[25];
  v5[25] = v43;

  return v5;
}

- (const)gpuCommands
{
  return (const $D535F67AB11CE01139272ED1408C24C6 *)-[NSMutableData bytes](self->_gpuCommandInfoData, "bytes");
}

- (const)encoders
{
  return (const $BD801356BB6761D70137205404F699DC *)-[NSMutableData bytes](self->_encoderInfoData, "bytes");
}

- (const)pipelineStates
{
  return (const $BD801356BB6761D70137205404F699DC *)-[NSMutableData bytes](self->_pipelineStateInfoData, "bytes");
}

- (const)commandBuffers
{
  return (const $AE9166C28C07DA0297C1F610906ECF11 *)-[NSMutableData bytes](self->_commandBufferInfoData, "bytes");
}

- (const)functionInfo
{
  return (const $1DCF89E860F11EA061E0D2DB567B39C0 *)-[NSMutableData bytes](self->_functionInfoData, "bytes");
}

- (unint64_t)gpuCommandInfoCount
{
  return -[NSMutableData length](self->_gpuCommandInfoData, "length") >> 5;
}

- (unint64_t)encoderInfoCount
{
  return -[NSMutableData length](self->_encoderInfoData, "length") / 0x28;
}

- (unint64_t)pipelineStateInfoCount
{
  return -[NSMutableData length](self->_pipelineStateInfoData, "length") / 0x28;
}

- (unint64_t)commandBufferInfoCount
{
  return -[NSMutableData length](self->_commandBufferInfoData, "length") >> 5;
}

- (unint64_t)functionInfoCount
{
  return -[NSMutableData length](self->_functionInfoData, "length") / 0x30;
}

- (void)unloadAPSData:(BOOL)a3
{
  NSMutableArray *unarchivedAPSData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray **p_archivedAPSData;
  NSMutableArray *archivedAPSData;
  NSMutableArray *v9;
  NSMutableArray *archivedAPSTimelineData;
  NSMutableArray *v11;
  NSMutableArray *archivedAPSCounterData;
  NSMutableArray *v13;
  NSMutableArray *unarchivedAPSTimelineData;
  NSMutableArray *v15;
  NSMutableArray *unarchivedAPSCounterData;

  if (a3)
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (unarchivedAPSData)
    {
      -[NSMutableArray removeAllObjects](unarchivedAPSData, "removeAllObjects");
      v5 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = 0;

    }
    archivedAPSData = self->_archivedAPSData;
    p_archivedAPSData = &self->_archivedAPSData;
    v6 = archivedAPSData;
    if (archivedAPSData)
    {
LABEL_5:
      -[NSMutableArray removeAllObjects](v6, "removeAllObjects");
      v9 = *p_archivedAPSData;
      *p_archivedAPSData = 0;

    }
  }
  else
  {
    archivedAPSTimelineData = self->_archivedAPSTimelineData;
    if (archivedAPSTimelineData)
    {
      -[NSMutableArray removeAllObjects](archivedAPSTimelineData, "removeAllObjects");
      v11 = self->_archivedAPSTimelineData;
      self->_archivedAPSTimelineData = 0;

    }
    archivedAPSCounterData = self->_archivedAPSCounterData;
    if (archivedAPSCounterData)
    {
      -[NSMutableArray removeAllObjects](archivedAPSCounterData, "removeAllObjects");
      v13 = self->_archivedAPSCounterData;
      self->_archivedAPSCounterData = 0;

    }
    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (unarchivedAPSTimelineData)
    {
      -[NSMutableArray removeAllObjects](unarchivedAPSTimelineData, "removeAllObjects");
      v15 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = 0;

    }
    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    p_archivedAPSData = &self->_unarchivedAPSCounterData;
    v6 = unarchivedAPSCounterData;
    if (unarchivedAPSCounterData)
      goto LABEL_5;
  }
}

- (void)enumerateUnarchivedShaderProfilerData:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData unarchivedShaderProfilerData](self, "unarchivedShaderProfilerData", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)unarchivedShaderProfilerData
{
  uint64_t v3;
  NSMutableArray *unarchivedShaderProfilerData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (-[NSMutableArray count](self->_archivedShaderProfilerData, "count"))
  {
    unarchivedShaderProfilerData = self->_unarchivedShaderProfilerData;
    if (!unarchivedShaderProfilerData || !-[NSMutableArray count](unarchivedShaderProfilerData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedShaderProfilerData;
      self->_unarchivedShaderProfilerData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = self->_archivedShaderProfilerData;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);
            v19 = 0;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v15, &v19));
            v17 = v19;
            if (v16)
              -[NSMutableArray addObject:](self->_unarchivedShaderProfilerData, "addObject:", v16);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v12);
      }

    }
  }
  return (NSArray *)self->_unarchivedShaderProfilerData;
}

- (void)enumerateUnarchivedGPUTimelineData:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData unarchivedGPUTimelineData](self, "unarchivedGPUTimelineData", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)unarchivedGPUTimelineData
{
  uint64_t v3;
  NSMutableArray *unarchivedGPUTimelineData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (-[NSMutableArray count](self->_archivedGPUTimelineData, "count"))
  {
    unarchivedGPUTimelineData = self->_unarchivedGPUTimelineData;
    if (!unarchivedGPUTimelineData || !-[NSMutableArray count](unarchivedGPUTimelineData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedGPUTimelineData;
      self->_unarchivedGPUTimelineData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = self->_archivedGPUTimelineData;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);
            v19 = 0;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v15, &v19));
            v17 = v19;
            if (v16)
              -[NSMutableArray addObject:](self->_unarchivedGPUTimelineData, "addObject:", v16);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v12);
      }

    }
  }
  return (NSArray *)self->_unarchivedGPUTimelineData;
}

- (id)patchLocalFileData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  if (!-[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"))
  {
    v9 = v4;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("APSTraceDataFile")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Source")));
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("APS_USC")))
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("APSTraceData")));
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_dataFileURL, "URLByAppendingPathComponent:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if ((v14 & 1) != 0)
    {
      v16 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v12, 1, &v16));
      if (!v16)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("APSTraceData"));

        goto LABEL_4;
      }
      v9 = v4;

    }
    else
    {
      v9 = v4;
    }

    goto LABEL_6;
  }
LABEL_4:

LABEL_5:
  v9 = v5;
LABEL_6:

LABEL_8:
  return v9;
}

- (NSArray)unarchivedAPSData
{
  uint64_t v3;
  NSMutableArray *unarchivedAPSData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (-[NSMutableArray count](self->_archivedAPSData, "count"))
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (!unarchivedAPSData || !-[NSMutableArray count](unarchivedAPSData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = self->_archivedAPSData;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13);
            v21 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v14, &v21));
            v16 = v21;
            if (v15)
            {
              v17 = self->_unarchivedAPSData;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);

            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }

    }
  }
  return (NSArray *)self->_unarchivedAPSData;
}

- (NSArray)unarchivedAPSCounterData
{
  uint64_t v3;
  NSMutableArray *unarchivedAPSCounterData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (-[NSMutableArray count](self->_archivedAPSCounterData, "count"))
  {
    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    if (!unarchivedAPSCounterData || !-[NSMutableArray count](unarchivedAPSCounterData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedAPSCounterData;
      self->_unarchivedAPSCounterData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = self->_archivedAPSCounterData;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13);
            v21 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v14, &v21));
            v16 = v21;
            if (v15)
            {
              v17 = self->_unarchivedAPSCounterData;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);

            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }

    }
  }
  return (NSArray *)self->_unarchivedAPSCounterData;
}

- (NSArray)unarchivedAPSTimelineData
{
  uint64_t v3;
  NSMutableArray *unarchivedAPSTimelineData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (-[NSMutableArray count](self->_archivedAPSTimelineData, "count"))
  {
    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (!unarchivedAPSTimelineData || !-[NSMutableArray count](unarchivedAPSTimelineData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = self->_archivedAPSTimelineData;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13);
            v21 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v14, &v21));
            v16 = v21;
            if (v15)
            {
              v17 = self->_unarchivedAPSTimelineData;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);

            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }

    }
  }
  return (NSArray *)self->_unarchivedAPSTimelineData;
}

- (void)enumerateUnarchivedBatchIdFilteredCounterData:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  NSMutableArray *unarchivedBatchIdFilteredCounterData;
  NSMutableArray *v7;
  NSMutableArray *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v4 = (void (**)(id, void *))a3;
  if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || !-[NSMutableArray count](unarchivedBatchIdFilteredCounterData, "count"))
    {
      v7 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
      v8 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v7;

      v10 = objc_msgSend((id)objc_opt_class(self, v9), "streamDataClasses");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
      {
        v12 = 0;
        do
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_archivedBatchIdFilteredCounterData, "objectAtIndexedSubscript:", v12));
          v16 = 0;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v13, &v16));
          v15 = v16;
          if (v14)
          {
            -[NSMutableArray addObject:](self->_unarchivedBatchIdFilteredCounterData, "addObject:", v14);
            v4[2](v4, v14);
          }

          ++v12;
        }
        while (v12 < (unint64_t)-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"));
      }

    }
  }

}

- (NSArray)unarchivedBatchIdFilteredCounterData
{
  uint64_t v3;
  NSMutableArray *unarchivedBatchIdFilteredCounterData;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || !-[NSMutableArray count](unarchivedBatchIdFilteredCounterData, "count"))
    {
      v5 = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
      v6 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v5;

      v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = self->_archivedBatchIdFilteredCounterData;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);
            v19 = 0;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v15, &v19));
            v17 = v19;
            if (v16)
              -[NSMutableArray addObject:](self->_unarchivedBatchIdFilteredCounterData, "addObject:", v16);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v12);
      }

    }
  }
  return (NSArray *)self->_unarchivedBatchIdFilteredCounterData;
}

- (id)_unarchiveAndPatchAPSData:(id)a3 apsData:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v8 = (void *)objc_opt_new(NSMutableArray, v7);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("APSTraceDataFile")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Source")));
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("APS_USC")))
          goto LABEL_10;
        if (v15)
        {
          v17 = objc_msgSend(v13, "mutableCopy");
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("APSTraceData"));
          objc_msgSend(v8, "addObject:", v17);

          goto LABEL_11;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("APSTraceData")));

        if (v18)
LABEL_10:
          objc_msgSend(v8, "addObject:", v13);
LABEL_11:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)debugDump:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  const $D535F67AB11CE01139272ED1408C24C6 *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_opt_new(NSMutableString, v4);
  if (-[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = -[GTShaderProfilerStreamData gpuCommands](self, "gpuCommands");
      objc_msgSend(v5, "appendFormat:", CFSTR("I: %d, E: %d, P: %d, F: %llu, S: %d, T: %d\n"), v8[v6].var0, v8[v6].var1, v8[v6].var3, v8[v6].var4, v8[v6].var6, v8[v6].var5);
      ++v7;
      ++v6;
    }
    while (v7 < -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount"));
  }
  objc_msgSend(v5, "writeToFile:atomically:encoding:error:", v9, 0, 4, 0);

}

- (void)patchObjectIds:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const $BD801356BB6761D70137205404F699DC *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t var2;
  const $AE9166C28C07DA0297C1F610906ECF11 *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  const $BD801356BB6761D70137205404F699DC *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  const $1DCF89E860F11EA061E0D2DB567B39C0 *v21;
  uint64_t v22;
  unint64_t v23;
  $1DCF89E860F11EA061E0D2DB567B39C0 *v24;
  unint64_t var1;
  id v26;

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "BOOLForKey:", CFSTR("GPUDebugger.ShaderProfiler.DebugObjectIdPatch"));

  if (!self->_dataSourceHasUnusedResources)
  {
    v5 = -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount");
    if (v5 == objc_msgSend(v26, "encoderInfoCount"))
    {
      v6 = -[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount");
      if (v6 == objc_msgSend(v26, "pipelineStateInfoCount"))
      {
        v7 = -[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount");
        if (v7 == objc_msgSend(v26, "functionInfoCount"))
        {
          v8 = -[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount");
          if (v8 == objc_msgSend(v26, "commandBufferInfoCount"))
          {
            v9 = -[GTShaderProfilerStreamData encoders](self, "encoders");
            if (-[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount"))
            {
              v10 = 0;
              v11 = 0;
              do
              {
                var2 = v9[v10].var2;
                if (var2 >= *(_QWORD *)((char *)objc_msgSend(v26, "encoders") + v10 * 40 + 16))
                  v9[v10].var0 = *(_QWORD *)((char *)objc_msgSend(v26, "encoders") + v10 * 40);
                ++v11;
                ++v10;
              }
              while (v11 < -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount"));
            }
            v13 = -[GTShaderProfilerStreamData commandBuffers](self, "commandBuffers");
            if (-[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount"))
            {
              v14 = 0;
              v15 = 0;
              do
              {
                v16 = v13[v14].var2;
                if (v16 == *(_QWORD *)((char *)objc_msgSend(v26, "commandBuffers") + v14 * 32 + 16))
                  v13[v14].var0 = *(_QWORD *)((char *)objc_msgSend(v26, "commandBuffers") + v14 * 32);
                ++v15;
                ++v14;
              }
              while (v15 < -[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount"));
            }
            v17 = -[GTShaderProfilerStreamData pipelineStates](self, "pipelineStates");
            if (-[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount"))
            {
              v18 = 0;
              v19 = 0;
              do
              {
                v20 = v17[v18].var2;
                if (v20 == *(_QWORD *)((char *)objc_msgSend(v26, "pipelineStates") + v18 * 40 + 16))
                  v17[v18].var0 = *(_QWORD *)((char *)objc_msgSend(v26, "pipelineStates") + v18 * 40);
                ++v19;
                ++v18;
              }
              while (v19 < -[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount"));
            }
            v21 = -[GTShaderProfilerStreamData functionInfo](self, "functionInfo");
            if (-[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount"))
            {
              v22 = 0;
              v23 = 0;
              do
              {
                v24 = ($1DCF89E860F11EA061E0D2DB567B39C0 *)&v21[v22];
                var1 = v21[v22].var1;
                if (var1 == *(_QWORD *)((char *)objc_msgSend(v26, "functionInfo") + v22 * 48 + 8))
                {
                  v24->var0 = *(_QWORD *)((char *)objc_msgSend(v26, "functionInfo") + v22 * 48);
                  v24->var2 = *(_QWORD *)((char *)objc_msgSend(v26, "functionInfo") + v22 * 48 + 16);
                }
                ++v23;
                ++v22;
              }
              while (v23 < -[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount"));
            }
          }
        }
      }
    }
  }

}

- (void)setMetalPluginName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  NSString *metalPluginName;
  int v15;
  int v16;
  int v17;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "hasPrefix:", CFSTR("AGXMetal")))
    goto LABEL_17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("AGXMetal"), "length")));
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("G")) & 1) == 0
    && (objc_msgSend(v7, "hasPrefix:", CFSTR("A")) & 1) == 0
    && !objc_msgSend(v7, "hasPrefix:", CFSTR("1")))
  {

LABEL_17:
    goto LABEL_18;
  }
  v8 = objc_retainAutorelease(v7);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  v10 = objc_msgSend(v8, "hasPrefix:", CFSTR("1")) ^ 1;
  if ((unint64_t)objc_msgSend(v8, "length") <= v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    do
    {
      v12 = v9[v10] - 48;
      if (v12 > 9)
        break;
      v11 = v12 + 10 * v11;
      ++v10;
    }
    while (v10 < (unint64_t)objc_msgSend(v8, "length"));
    if (v11 == 15)
    {
      if (v10 < (unint64_t)objc_msgSend(v8, "length")
        && objc_msgSend(v8, "characterAtIndex:", v10) == 95
        || (id)v10 == objc_msgSend(v8, "length"))
      {
        v11 = 14;
      }
      else
      {
        v11 = 15;
      }
    }
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("A")))
    v15 = -11;
  else
    v15 = -10;
  v16 = v15 + v11;
  if (v16 < 0)
    v17 = -1;
  else
    v17 = v16;

  if ((v17 - 0x7FFFFFFF) < 2)
  {
    v13 = 0;
    goto LABEL_19;
  }
  if (v17 >= 5
    && (v17 != 5
     || (objc_msgSend(v5, "hasSuffix:", CFSTR("M")) & 1) == 0
     && (objc_msgSend(v5, "hasSuffix:", CFSTR("P")) & 1) == 0))
  {
    v13 = 2;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 1;
LABEL_19:
  self->_gpuGeneration = v13;
  metalPluginName = self->_metalPluginName;
  self->_metalPluginName = (NSString *)v5;

}

- (const)GPUCommandInfoFromFunctionIndex:(unsigned int)a3 subCommandIndex:(int)a4
{
  const $D535F67AB11CE01139272ED1408C24C6 *result;
  uint64_t v8;
  unint64_t v9;
  const $D535F67AB11CE01139272ED1408C24C6 *v10;

  result = -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount");
  if (result)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = -[GTShaderProfilerStreamData gpuCommands](self, "gpuCommands");
      if (v10[v8].var4 == a3 && v10[v8].var6 == a4)
        break;
      ++v9;
      ++v8;
      if (v9 >= -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount"))
        return 0;
    }
    return &v10[v9];
  }
  return result;
}

- (const)encoderInfoFromFunctionIndex:(unsigned int)a3
{
  const $BD801356BB6761D70137205404F699DC *result;
  uint64_t v6;
  uint64_t i;
  const $BD801356BB6761D70137205404F699DC *v8;

  result = -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount");
  if (result)
  {
    v6 = 0;
    for (i = 16; ; i += 40)
    {
      v8 = -[GTShaderProfilerStreamData encoders](self, "encoders");
      if (*(unint64_t *)((char *)&v8->var0 + i) == a3)
        break;
      if (++v6 >= -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount"))
        return 0;
    }
    return &v8[v6];
  }
  return result;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v28 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v28));
  v9 = v28;
  if (!v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData _setupDataPath](self, "_setupDataPath"));
    if (v12 && -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("streamData")));
      v27 = 0;
      objc_msgSend(v8, "writeToURL:options:error:", v13, 0, &v27);
      v10 = v27;

      if (v10)
      {
        if (a4)
        {
LABEL_8:
          v10 = objc_retainAutorelease(v10);
          v11 = 0;
          *a4 = v10;
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:
        v11 = 0;
        goto LABEL_27;
      }
      if (v6 && (objc_msgSend(v6, "isEqual:", v12) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v26 = 0;
        objc_msgSend(v22, "copyItemAtURL:toURL:error:", v12, v6, &v26);
        v10 = v26;

        if (v10)
        {
          if (a4)
            goto LABEL_8;
          goto LABEL_26;
        }
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      if (!v6 || (objc_msgSend(v6, "isEqual:", v12) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData traceName](self, "traceName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByDeletingPathExtension"));
        v17 = v15;
        if (v15)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("gpuprofiler_raw")));
        }
        else
        {
          v19 = (void *)objc_opt_new(NSUUID, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("gpuprofiler_raw")));

        }
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v18));
        v24 = 0;
        objc_msgSend(v8, "writeToURL:options:error:", v11, 1, &v24);
        v10 = v24;

        goto LABEL_27;
      }
      v25 = 0;
      objc_msgSend(v8, "writeToURL:options:error:", v6, 1, &v25);
      v10 = v25;
    }
    if (v6)
      v21 = v6;
    else
      v21 = v12;
    v11 = v21;
    goto LABEL_27;
  }
  v10 = v9;
  if (a4)
  {
    v10 = objc_retainAutorelease(v9);
    v11 = 0;
    *a4 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_28:

  objc_autoreleasePoolPop(v7);
  return v11;
}

- (id)_setupDataPath
{
  NSURL *dataFileURL;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSURL *v17;
  NSURL *v18;
  NSURL *v19;
  id v20;

  dataFileURL = self->_dataFileURL;
  if (dataFileURL)
    return dataFileURL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData traceName](self, "traceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByDeletingPathExtension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("_stream")));
  v9 = v7;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    v11 = (void *)objc_opt_new(NSUUID, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/tmp/com.apple.gputools.profiling"), "stringByAppendingPathComponent:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("gpuprofiler_raw")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v14, "removeItemAtPath:error:", v13, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = 0;
  objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v20);
  v16 = v20;

  if (v16)
  {
    -[GTShaderProfilerStreamData setSupportsFileFormatV2:](self, "setSupportsFileFormatV2:", 0);
    v17 = 0;
  }
  else
  {
    v18 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
    v19 = self->_dataFileURL;
    self->_dataFileURL = v18;

    v17 = self->_dataFileURL;
  }

  return v17;
}

- (void)cleanupLocalFiles
{
  void *v3;
  void *v4;
  NSURL *dataFileURL;

  if (self->_dataFileURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_dataFileURL, "path"));
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

    dataFileURL = self->_dataFileURL;
    self->_dataFileURL = 0;

  }
}

- (void)dealloc
{
  NSURL *dataFileURL;
  objc_super v4;

  dataFileURL = self->_dataFileURL;
  if (dataFileURL)
    -[NSURL stopAccessingSecurityScopedResource](dataFileURL, "stopAccessingSecurityScopedResource");
  v4.receiver = self;
  v4.super_class = (Class)GTShaderProfilerStreamData;
  -[GTShaderProfilerStreamData dealloc](&v4, "dealloc");
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)blitCallCount
{
  return self->_blitCallCount;
}

- (NSData)gpuCommandInfoData
{
  return &self->_gpuCommandInfoData->super;
}

- (NSData)encoderInfoData
{
  return &self->_encoderInfoData->super;
}

- (NSData)pipelineStateInfoData
{
  return &self->_pipelineStateInfoData->super;
}

- (NSData)commandBufferInfoData
{
  return &self->_commandBufferInfoData->super;
}

- (NSArray)archivedGPUTimelineData
{
  return &self->_archivedGPUTimelineData->super;
}

- (NSArray)archivedShaderProfilerData
{
  return &self->_archivedShaderProfilerData->super;
}

- (NSArray)archivedAPSData
{
  return &self->_archivedAPSData->super;
}

- (NSArray)archivedAPSTimelineData
{
  return &self->_archivedAPSTimelineData->super;
}

- (NSArray)archivedAPSCounterData
{
  return &self->_archivedAPSCounterData->super;
}

- (NSData)functionInfoData
{
  return &self->_functionInfoData->super;
}

- (NSArray)strings
{
  return &self->_strings->super;
}

- (BOOL)dataSourceHasUnusedResources
{
  return self->_dataSourceHasUnusedResources;
}

- (_NSRange)dataSourceCaptureRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_captureRange.length;
  location = self->_captureRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)archivedBatchIdFilteredCounterData
{
  return &self->_archivedBatchIdFilteredCounterData->super;
}

- (NSArray)batchIdFilterableCounters
{
  return self->_batchIdFilterableCounters;
}

- (unsigned)gpuGeneration
{
  return self->_gpuGeneration;
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
  objc_storeStrong((id *)&self->_traceName, a3);
}

- (BOOL)supportsFileFormatV2
{
  return self->_supportsFileFormatV2;
}

- (void)setSupportsFileFormatV2:(BOOL)a3
{
  self->_supportsFileFormatV2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileURL, 0);
  objc_storeStrong((id *)&self->_tempAPSCounterData, 0);
  objc_storeStrong((id *)&self->_tempAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_tempAPSData, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_batchIdFilterableCounters, 0);
  objc_storeStrong((id *)&self->_stringDict, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSCounterData, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSData, 0);
  objc_storeStrong((id *)&self->_unarchivedBatchIdFilteredCounterData, 0);
  objc_storeStrong((id *)&self->_unarchivedGPUTimelineData, 0);
  objc_storeStrong((id *)&self->_unarchivedShaderProfilerData, 0);
  objc_storeStrong((id *)&self->_archivedAPSCounterData, 0);
  objc_storeStrong((id *)&self->_archivedAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_archivedAPSData, 0);
  objc_storeStrong((id *)&self->_archivedBatchIdFilteredCounterData, 0);
  objc_storeStrong((id *)&self->_archivedGPUTimelineData, 0);
  objc_storeStrong((id *)&self->_archivedShaderProfilerData, 0);
  objc_storeStrong((id *)&self->_functionInfoData, 0);
  objc_storeStrong((id *)&self->_commandBufferInfoData, 0);
  objc_storeStrong((id *)&self->_pipelineStateInfoData, 0);
  objc_storeStrong((id *)&self->_encoderInfoData, 0);
  objc_storeStrong((id *)&self->_gpuCommandInfoData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)streamDataClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v13 = objc_opt_class(NSData, a2);
  v14 = objc_opt_class(NSMutableData, v2);
  v15 = objc_opt_class(NSDictionary, v3);
  v16 = objc_opt_class(NSMutableDictionary, v4);
  v17 = objc_opt_class(NSArray, v5);
  v18 = objc_opt_class(NSMutableArray, v6);
  v19 = objc_opt_class(NSNumber, v7);
  v20 = objc_opt_class(NSString, v8);
  v21 = objc_opt_class(NSMutableString, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10, v13, v14, v15, v16, v17, v18, v19, v20));

  return v11;
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  uint64_t v20;
  id *v21;
  id v22;
  id v23;
  id *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;

  v4 = a3;
  v30 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByResolvingSymlinksInPath"));
  v8 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v7, &v30);
  v9 = v30;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v27 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v4, 0, &v27));
    v11 = v27;
    if (!v11)
    {
      v26 = 0;
      v22 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GTShaderProfilerStreamData, v12), v15, &v26);
      v21 = (id *)objc_claimAutoreleasedReturnValue(v22);
      v13 = v26;
      goto LABEL_18;
    }
    v13 = v11;
    goto LABEL_12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("streamData")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

  if (!v17)
  {
    v13 = 0;
LABEL_12:
    v21 = 0;
    goto LABEL_18;
  }
  v29 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v15, 0, &v29));
  v19 = v29;
  if (v19)
  {
    v13 = v19;
    v21 = 0;
  }
  else
  {
    v28 = 0;
    v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GTShaderProfilerStreamData, v20), v18, &v28);
    v24 = (id *)objc_claimAutoreleasedReturnValue(v23);
    v13 = v28;
    v21 = 0;
    if (!v13)
    {
      objc_storeStrong(v24 + 33, a3);
      v21 = v24;
    }

  }
LABEL_18:

  return v21;
}

+ (id)steamDataFromData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  v8 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GTShaderProfilerStreamData, v4), v3, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
