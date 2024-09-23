@implementation GTMutableShaderProfilerStreamData

- (GTMutableShaderProfilerStreamData)init
{
  GTMutableShaderProfilerStreamData *v2;
  GTMutableShaderProfilerStreamData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMutableShaderProfilerStreamData;
  v2 = -[GTShaderProfilerStreamData initWithNewFileFormatV2Support:](&v5, "initWithNewFileFormatV2Support:", 0);
  v3 = v2;
  if (v2)
    -[GTMutableShaderProfilerStreamData _commonInit](v2, "_commonInit");
  return v3;
}

- (GTMutableShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  GTMutableShaderProfilerStreamData *v3;
  GTMutableShaderProfilerStreamData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTMutableShaderProfilerStreamData;
  v3 = -[GTShaderProfilerStreamData initWithNewFileFormatV2Support:](&v6, "initWithNewFileFormatV2Support:", a3);
  v4 = v3;
  if (v3)
    -[GTMutableShaderProfilerStreamData _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  NSMutableData *v3;
  NSMutableData *gpuCommandInfoData;
  uint64_t v5;
  NSMutableData *v6;
  NSMutableData *encoderInfoData;
  uint64_t v8;
  NSMutableData *v9;
  NSMutableData *pipelineStateInfoData;
  uint64_t v11;
  NSMutableData *v12;
  NSMutableData *commandBufferInfoData;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *archivedShaderProfilerData;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *archivedGPUTimelineData;
  uint64_t v20;
  NSMutableArray *v21;
  NSMutableArray *archivedBatchIdFilteredCounterData;
  uint64_t v23;
  NSMutableArray *v24;
  NSMutableArray *archivedAPSData;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *archivedAPSCounterData;
  uint64_t v29;
  NSMutableArray *v30;
  NSMutableArray *archivedAPSTimelineData;
  uint64_t v32;
  NSMutableData *v33;
  NSMutableData *functionInfoData;
  uint64_t v35;
  NSMutableArray *v36;
  NSMutableArray *strings;
  uint64_t v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *stringDict;
  uint64_t v41;
  NSLock *v42;
  NSLock *addLock;

  v3 = (NSMutableData *)objc_opt_new(NSMutableData, a2);
  gpuCommandInfoData = self->super._gpuCommandInfoData;
  self->super._gpuCommandInfoData = v3;

  v6 = (NSMutableData *)objc_opt_new(NSMutableData, v5);
  encoderInfoData = self->super._encoderInfoData;
  self->super._encoderInfoData = v6;

  v9 = (NSMutableData *)objc_opt_new(NSMutableData, v8);
  pipelineStateInfoData = self->super._pipelineStateInfoData;
  self->super._pipelineStateInfoData = v9;

  v12 = (NSMutableData *)objc_opt_new(NSMutableData, v11);
  commandBufferInfoData = self->super._commandBufferInfoData;
  self->super._commandBufferInfoData = v12;

  v15 = (NSMutableArray *)objc_opt_new(NSMutableArray, v14);
  archivedShaderProfilerData = self->super._archivedShaderProfilerData;
  self->super._archivedShaderProfilerData = v15;

  v18 = (NSMutableArray *)objc_opt_new(NSMutableArray, v17);
  archivedGPUTimelineData = self->super._archivedGPUTimelineData;
  self->super._archivedGPUTimelineData = v18;

  v21 = (NSMutableArray *)objc_opt_new(NSMutableArray, v20);
  archivedBatchIdFilteredCounterData = self->super._archivedBatchIdFilteredCounterData;
  self->super._archivedBatchIdFilteredCounterData = v21;

  v24 = (NSMutableArray *)objc_opt_new(NSMutableArray, v23);
  archivedAPSData = self->super._archivedAPSData;
  self->super._archivedAPSData = v24;

  v27 = (NSMutableArray *)objc_opt_new(NSMutableArray, v26);
  archivedAPSCounterData = self->super._archivedAPSCounterData;
  self->super._archivedAPSCounterData = v27;

  v30 = (NSMutableArray *)objc_opt_new(NSMutableArray, v29);
  archivedAPSTimelineData = self->super._archivedAPSTimelineData;
  self->super._archivedAPSTimelineData = v30;

  v33 = (NSMutableData *)objc_opt_new(NSMutableData, v32);
  functionInfoData = self->super._functionInfoData;
  self->super._functionInfoData = v33;

  v36 = (NSMutableArray *)objc_opt_new(NSMutableArray, v35);
  strings = self->super._strings;
  self->super._strings = v36;

  v39 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v38);
  stringDict = self->super._stringDict;
  self->super._stringDict = v39;

  v42 = (NSLock *)objc_opt_new(NSLock, v41);
  addLock = self->_addLock;
  self->_addLock = v42;

}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTMutableShaderProfilerStreamData;
  -[GTShaderProfilerStreamData encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (void)addGPUCommands:(id *)a3 count:(unint64_t)a4
{
  NSMutableData *gpuCommandInfoData;
  id v5;

  gpuCommandInfoData = self->super._gpuCommandInfoData;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 32 * a4));
  -[NSMutableData appendData:](gpuCommandInfoData, "appendData:", v5);

}

- (void)addEncoders:(id *)a3 count:(unint64_t)a4
{
  NSMutableData *encoderInfoData;
  id v5;

  encoderInfoData = self->super._encoderInfoData;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 40 * a4));
  -[NSMutableData appendData:](encoderInfoData, "appendData:", v5);

}

- (void)addPipelineStates:(id *)a3 count:(unint64_t)a4
{
  NSMutableData *pipelineStateInfoData;
  id v5;

  pipelineStateInfoData = self->super._pipelineStateInfoData;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 40 * a4));
  -[NSMutableData appendData:](pipelineStateInfoData, "appendData:", v5);

}

- (void)addCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  NSMutableData *commandBufferInfoData;
  id v5;

  commandBufferInfoData = self->super._commandBufferInfoData;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 32 * a4));
  -[NSMutableData appendData:](commandBufferInfoData, "appendData:", v5);

}

- (void)addShaderFunctionInfo:(id *)a3 count:(unint64_t)a4
{
  NSMutableData *functionInfoData;
  id v5;

  functionInfoData = self->super._functionInfoData;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 48 * a4));
  -[NSMutableData appendData:](functionInfoData, "appendData:", v5);

}

- (void)setNumBlitCalls:(unint64_t)a3
{
  self->super._blitCallCount = a3;
}

- (void)setDataSourceHasUnusedResources:(BOOL)a3 captureRange:(_NSRange)a4
{
  self->super._dataSourceHasUnusedResources = a3;
  self->super._captureRange = a4;
}

- (BOOL)addShaderProfilerData:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v8;

  if (!a3)
    return 0;
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8));
  v5 = v8;
  v6 = v5 == 0;
  if (!v5)
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedShaderProfilerData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v6;
}

- (BOOL)addGPUTimelineData:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v8;

  if (!a3)
    return 0;
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8));
  v5 = v8;
  v6 = v5 == 0;
  if (!v5)
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedGPUTimelineData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v6;
}

- (id)_copyForAddAPSData:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v28;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData _setupDataPath](self, "_setupDataPath"));
  v9 = objc_msgSend(v7, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ShaderProfilerData")));
  v11 = v10;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length")));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("ShaderProfilerData"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("APSTraceDataFile")));
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));

  v20 = -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2") ? v17 : v19;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("APSTraceDataFile"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = objc_msgSend(v21, "fileExistsAtPath:", v19);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v23, "removeItemAtPath:error:", v19, 0);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v28 = 0;
  objc_msgSend(v24, "copyItemAtPath:toPath:error:", v15, v19, &v28);
  v25 = v28;

  v26 = 0;
  if (!v25)
LABEL_10:
    v26 = v9;

  return v26;
}

- (BOOL)addAPSData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *tempAPSData;

  v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSData)
  {
    if (v4)
      goto LABEL_3;
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }
  v7 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
  tempAPSData = self->super._tempAPSData;
  self->super._tempAPSData = v7;

  if (!v4)
    goto LABEL_6;
LABEL_3:
  v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:](self, "_copyForAddAPSData:prefix:", v4, CFSTR("Profiling_"));
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }
LABEL_7:
  -[NSLock unlock](self->_addLock, "unlock");

  return (char)v6;
}

- (BOOL)addAPSTimelineData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *tempAPSTimelineData;

  v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSTimelineData)
  {
    if (v4)
      goto LABEL_3;
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }
  v7 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
  tempAPSTimelineData = self->super._tempAPSTimelineData;
  self->super._tempAPSTimelineData = v7;

  if (!v4)
    goto LABEL_6;
LABEL_3:
  v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:](self, "_copyForAddAPSData:prefix:", v4, CFSTR("Timeline_"));
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSTimelineData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }
LABEL_7:
  -[NSLock unlock](self->_addLock, "unlock");

  return (char)v6;
}

- (BOOL)addAPSCounterData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *tempAPSCounterData;

  v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSCounterData)
  {
    if (v4)
      goto LABEL_3;
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }
  v7 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
  tempAPSCounterData = self->super._tempAPSCounterData;
  self->super._tempAPSCounterData = v7;

  if (!v4)
    goto LABEL_6;
LABEL_3:
  v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:](self, "_copyForAddAPSData:prefix:", v4, CFSTR("Counters_"));
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSCounterData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }
LABEL_7:
  -[NSLock unlock](self->_addLock, "unlock");

  return (char)v6;
}

- (void)removeAPSData
{
  -[NSLock lock](self->_addLock, "lock");
  -[NSMutableArray removeAllObjects](self->super._archivedAPSData, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->super._tempAPSData, "removeAllObjects");
  -[NSLock unlock](self->_addLock, "unlock");
}

- (void)removeAPSTimelineData
{
  -[NSLock lock](self->_addLock, "lock");
  -[NSMutableArray removeAllObjects](self->super._archivedAPSTimelineData, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->super._tempAPSTimelineData, "removeAllObjects");
  -[NSLock unlock](self->_addLock, "unlock");
}

- (void)removeAPSCounterData
{
  -[NSLock lock](self->_addLock, "lock");
  -[NSMutableArray removeAllObjects](self->super._archivedAPSCounterData, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->super._tempAPSCounterData, "removeAllObjects");
  -[NSLock unlock](self->_addLock, "unlock");
}

- (BOOL)addBatchIdFilteredCounterData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v9;

  if (!a3)
    return 0;
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9));
  v5 = v9;
  v6 = v5;
  v7 = v5 == 0;
  if (v5)
  {
    NSLog(CFSTR("%@"), v5);
  }
  else
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedBatchIdFilteredCounterData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v7;
}

- (void)setBatchIdFilterableCounters:(id)a3
{
  NSArray *v4;
  NSArray *batchIdFilterableCounters;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  batchIdFilterableCounters = self->super._batchIdFilterableCounters;
  self->super._batchIdFilterableCounters = v4;

}

- (unint64_t)addString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._stringDict, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    v7 = -[NSMutableArray count](self->super._strings, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._stringDict, "setObject:forKeyedSubscript:", v8, v4);

    -[NSMutableArray addObject:](self->super._strings, "addObject:", v4);
  }

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addLock, 0);
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;

  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", a3, 0, &v14));
  v4 = v14;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
  }
  else
  {
    v13 = 0;
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GTMutableShaderProfilerStreamData, v5), v3, &v13);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(v8);
    v6 = v13;
    v10 = objc_opt_new(NSLock, v9);
    v11 = (void *)v7[35];
    v7[35] = v10;

    v7[1] = 4;
  }

  return v7;
}

@end
