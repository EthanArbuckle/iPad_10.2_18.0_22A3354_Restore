@implementation _MTLRenderPipelineState

- (NSString)label
{
  return self->_label;
}

- (_MTLRenderPipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _MTLRenderPipelineState *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  objc_super v24;
  _OWORD v25[3];
  uint64_t v26;

  v26 = 0;
  memset(v25, 0, sizeof(v25));
  _MTLMessageContextBegin_((uint64_t)v25, (uint64_t)"-[_MTLRenderPipelineState initWithDevice:pipelineStateDescriptor:]", 5561, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4)
        goto LABEL_4;
LABEL_19:
      v23 = CFSTR("desc must not be nil.");
LABEL_21:
      _MTLMessageContextPush_((uint64_t)v25, 4, (uint64_t)v23, v7, v8, v9, v10, v11, (uint64_t)v24.receiver);
      goto LABEL_5;
    }
    v21 = CFSTR("device is not a MTLDevice.");
    v22 = 8;
  }
  else
  {
    v21 = CFSTR("device must not be nil.");
    v22 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v25, v22, (uint64_t)v21, v7, v8, v9, v10, v11, (uint64_t)v24.receiver);
  if (!a4)
    goto LABEL_19;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = CFSTR("desc is not a MTLRenderPipelineDescriptor.");
    goto LABEL_21;
  }
LABEL_5:
  if (objc_msgSend(a4, "isTessellationFactorScaleEnabled")
    && objc_msgSend(a4, "supportIndirectCommandBuffers"))
  {
    _MTLMessageContextPush_((uint64_t)v25, 4, (uint64_t)CFSTR("pipelines with tessellationFactorScaleEnabled = YES are not compatible with indirect command buffers"), v12, v13, v14, v15, v16, (uint64_t)v24.receiver);
  }
  _MTLMessageContextEnd((uint64_t)v25);
  v24.receiver = self;
  v24.super_class = (Class)_MTLRenderPipelineState;
  v17 = -[_MTLRenderPipelineState init](&v24, sel_init);
  if (v17)
  {
    v17->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v17->_device = (MTLDevice *)a3;
    v17->_supportIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v17->_textureWriteRoundingMode = objc_msgSend(a4, "textureWriteRoundingMode");
    if (objc_msgSend(a4, "meshFunction"))
    {
      v18 = objc_msgSend(a4, "maxTotalThreadsPerObjectThreadgroup");
      if (!v18)
        v18 = objc_msgSend(a3, "maxTotalComputeThreadsPerThreadgroup");
      v17->_maxTotalThreadsPerObjectThreadgroup = v18;
      v19 = objc_msgSend(a4, "maxTotalThreadsPerMeshThreadgroup");
      if (!v19)
        v19 = objc_msgSend(a3, "maxTotalComputeThreadsPerThreadgroup");
      v17->_maxTotalThreadsPerMeshThreadgroup = v19;
      v17->_maxTotalThreadgroupsPerMeshGrid = -1;
      v17->_objectThreadExecutionWidth = -1;
      v17->_meshThreadExecutionWidth = -1;
    }
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  self->_vertexDebugInstrumentationData = 0;
  self->_fragmentDebugInstrumentationData = 0;

  self->_tileDebugInstrumentationData = 0;
  self->_objectDebugInstrumentationData = 0;

  self->_meshDebugInstrumentationData = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLRenderPipelineState;
  -[_MTLRenderPipelineState dealloc](&v3, sel_dealloc);
}

- (id)pipelineBinaries
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;

  v11 = objc_msgSend(a4, "maxTotalThreadgroupsPerMeshGrid");
  if (v11)
    v12 = v11;
  else
    v12 = -1;
  return -[_MTLRenderPipelineState initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:maxTotalThreadgroupsPerMeshGrid:](self, "initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:maxTotalThreadgroupsPerMeshGrid:", a3, a4, a5, a6, v12);
}

- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _MTLRenderPipelineState *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  objc_super v25;
  _OWORD v26[3];
  uint64_t v27;

  v27 = 0;
  memset(v26, 0, sizeof(v26));
  _MTLMessageContextBegin_((uint64_t)v26, (uint64_t)"-[_MTLRenderPipelineState initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:maxTotalThreadgroupsPerMeshGrid:]", 5620, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (!a3)
  {
    v22 = CFSTR("device must not be nil.");
    v23 = 4;
    goto LABEL_14;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF1690) & 1) == 0)
  {
    v22 = CFSTR("device is not a MTLDevice.");
    v23 = 8;
LABEL_14:
    _MTLMessageContextPush_((uint64_t)v26, v23, (uint64_t)v22, v13, v14, v15, v16, v17, (uint64_t)v25.receiver);
    if (a4)
      goto LABEL_4;
LABEL_15:
    v24 = CFSTR("desc must not be nil.");
    goto LABEL_17;
  }
  if (!a4)
    goto LABEL_15;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v24 = CFSTR("desc is not a MTLMeshRenderPipelineDescriptor.");
LABEL_17:
  _MTLMessageContextPush_((uint64_t)v26, 4, (uint64_t)v24, v13, v14, v15, v16, v17, (uint64_t)v25.receiver);
LABEL_5:
  _MTLMessageContextEnd((uint64_t)v26);
  v25.receiver = self;
  v25.super_class = (Class)_MTLRenderPipelineState;
  v18 = -[_MTLRenderPipelineState init](&v25, sel_init);
  if (v18)
  {
    v18->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v18->_device = (MTLDevice *)a3;
    v18->_supportIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v18->_textureWriteRoundingMode = objc_msgSend(a4, "textureWriteRoundingMode");
    v19 = objc_msgSend(a4, "maxTotalThreadsPerObjectThreadgroup");
    if (!v19)
      v19 = objc_msgSend(a3, "maxTotalComputeThreadsPerThreadgroup");
    v18->_maxTotalThreadsPerObjectThreadgroup = v19;
    v20 = objc_msgSend(a4, "maxTotalThreadsPerMeshThreadgroup");
    if (!v20)
      v20 = objc_msgSend(a3, "maxTotalComputeThreadsPerThreadgroup");
    v18->_objectThreadExecutionWidth = a5;
    v18->_meshThreadExecutionWidth = a6;
    v18->_maxTotalThreadsPerMeshThreadgroup = v20;
    v18->_maxTotalThreadgroupsPerMeshGrid = a7;
  }
  return v18;
}

- (_MTLRenderPipelineState)initWithDeviceAndTileDesc:(id)a3 tilePipelineStateDescriptor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _MTLRenderPipelineState *v12;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  objc_super v18;
  _OWORD v19[3];
  uint64_t v20;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  _MTLMessageContextBegin_((uint64_t)v19, (uint64_t)"-[_MTLRenderPipelineState initWithDeviceAndTileDesc:tilePipelineStateDescriptor:]", 5661, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (!a3)
  {
    v14 = CFSTR("device must not be nil.");
    v15 = 4;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = CFSTR("device is not a MTLDevice.");
    v15 = 8;
LABEL_10:
    _MTLMessageContextPush_((uint64_t)v19, v15, (uint64_t)v14, v7, v8, v9, v10, v11, (uint64_t)v18.receiver);
    if (a4)
      goto LABEL_4;
LABEL_11:
    v16 = CFSTR("desc must not be nil.");
    v17 = 4;
    goto LABEL_13;
  }
  if (!a4)
    goto LABEL_11;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v16 = CFSTR("desc is not a MTLRenderPipelineDescriptor.");
  v17 = 8;
LABEL_13:
  _MTLMessageContextPush_((uint64_t)v19, v17, (uint64_t)v16, v7, v8, v9, v10, v11, (uint64_t)v18.receiver);
LABEL_5:
  _MTLMessageContextEnd((uint64_t)v19);
  v18.receiver = self;
  v18.super_class = (Class)_MTLRenderPipelineState;
  v12 = -[_MTLRenderPipelineState init](&v18, sel_init);
  if (v12)
  {
    v12->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v12->_device = (MTLDevice *)a3;
    v12->_threadgroupSizeMatchesTileSize = objc_msgSend(a4, "threadgroupSizeMatchesTileSize");
  }
  return v12;
}

- (_MTLRenderPipelineState)initWithParent:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _MTLRenderPipelineState *v10;
  const __CFString *v12;
  uint64_t v13;
  objc_super v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  _MTLMessageContextBegin_((uint64_t)v15, (uint64_t)"-[_MTLRenderPipelineState initWithParent:]", 5693, 0, 3, (uint64_t)"Render Pipeline State Validation");
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v12 = CFSTR("parent is not a _MTLRenderPipelineState.");
    v13 = 8;
  }
  else
  {
    v12 = CFSTR("parent must not be nil.");
    v13 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v15, v13, (uint64_t)v12, v5, v6, v7, v8, v9, (uint64_t)v14.receiver);
LABEL_3:
  _MTLMessageContextEnd((uint64_t)v15);
  v14.receiver = self;
  v14.super_class = (Class)_MTLRenderPipelineState;
  v10 = -[_MTLRenderPipelineState init](&v14, sel_init);
  if (v10)
  {
    v10->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v10->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v10->_supportIndirectCommandBuffers = objc_msgSend(a3, "supportIndirectCommandBuffers");
    v10->_textureWriteRoundingMode = objc_msgSend(a3, "textureWriteRoundingMode");
    v10->_objectThreadExecutionWidth = objc_msgSend(a3, "objectThreadExecutionWidth");
    v10->_meshThreadExecutionWidth = objc_msgSend(a3, "meshThreadExecutionWidth");
    v10->_maxTotalThreadsPerObjectThreadgroup = objc_msgSend(a3, "maxTotalThreadsPerObjectThreadgroup");
    v10->_maxTotalThreadsPerMeshThreadgroup = objc_msgSend(a3, "maxTotalThreadsPerMeshThreadgroup");
  }
  return v10;
}

- (_MTLRenderPipelineState)initWithTileParent:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _MTLRenderPipelineState *v10;
  const __CFString *v12;
  uint64_t v13;
  objc_super v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  _MTLMessageContextBegin_((uint64_t)v15, (uint64_t)"-[_MTLRenderPipelineState initWithTileParent:]", 5728, 0, 3, (uint64_t)"Render Pipeline State Validation");
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v12 = CFSTR("parent is not a _MTLRenderPipelineState.");
    v13 = 8;
  }
  else
  {
    v12 = CFSTR("parent must not be nil.");
    v13 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v15, v13, (uint64_t)v12, v5, v6, v7, v8, v9, (uint64_t)v14.receiver);
LABEL_3:
  _MTLMessageContextEnd((uint64_t)v15);
  v14.receiver = self;
  v14.super_class = (Class)_MTLRenderPipelineState;
  v10 = -[_MTLRenderPipelineState init](&v14, sel_init);
  if (v10)
  {
    v10->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v10->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v10->_threadgroupSizeMatchesTileSize = objc_msgSend(a3, "threadgroupSizeMatchesTileSize");
    v10->_supportIndirectCommandBuffers = objc_msgSend(a3, "supportIndirectCommandBuffers");
    v10->_textureWriteRoundingMode = objc_msgSend(a3, "textureWriteRoundingMode");
  }
  return v10;
}

- (unsigned)getVertexShaderTelemetryID
{
  return -[_MTLRenderPipelineState uniqueIdentifier](self, "uniqueIdentifier");
}

- (unsigned)getFragmentShaderTelemetryID
{
  return -[_MTLRenderPipelineState uniqueIdentifier](self, "uniqueIdentifier");
}

- (unsigned)getObjectShaderTelemetryID
{
  return -[_MTLRenderPipelineState uniqueIdentifier](self, "uniqueIdentifier");
}

- (unsigned)getMeshShaderTelemetryID
{
  return -[_MTLRenderPipelineState uniqueIdentifier](self, "uniqueIdentifier");
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unint64_t)imageblockSampleLength
{
  return 0;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return 0;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_supportIndirectCommandBuffers;
}

- (int64_t)shaderValidation
{
  return 2;
}

- (int64_t)shaderValidationState
{
  return 2;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (unint64_t)allocatedSize
{
  return 0;
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState vertexFunctionHandleWithFunction:]", 5886, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState fragmentFunctionHandleWithFunction:]", 5892, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState tileFunctionHandleWithFunction:]", 5898, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState objectFunctionHandleWithFunction:]", 5905, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState meshFunctionHandleWithFunction:]", 5911, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  id result;

  switch(a4)
  {
    case 1uLL:
      result = -[_MTLRenderPipelineState vertexFunctionHandleWithFunction:](self, "vertexFunctionHandleWithFunction:", a3);
      break;
    case 2uLL:
      result = -[_MTLRenderPipelineState fragmentFunctionHandleWithFunction:](self, "fragmentFunctionHandleWithFunction:", a3);
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = -[_MTLRenderPipelineState tileFunctionHandleWithFunction:](self, "tileFunctionHandleWithFunction:", a3);
      break;
    case 8uLL:
      result = -[_MTLRenderPipelineState objectFunctionHandleWithFunction:](self, "objectFunctionHandleWithFunction:", a3);
      break;
    default:
      if (a4 == 16)
        result = -[_MTLRenderPipelineState meshFunctionHandleWithFunction:](self, "meshFunctionHandleWithFunction:", a3);
      else
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;

  switch(a4)
  {
    case 1uLL:
      result = -[_MTLRenderPipelineState newVisibleFunctionTableFromVertexStageWithDescriptor:](self, "newVisibleFunctionTableFromVertexStageWithDescriptor:", a3);
      break;
    case 2uLL:
      result = -[_MTLRenderPipelineState newVisibleFunctionTableFromFragmentStageWithDescriptor:](self, "newVisibleFunctionTableFromFragmentStageWithDescriptor:", a3);
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = -[_MTLRenderPipelineState newVisibleFunctionTableFromTileStageWithDescriptor:](self, "newVisibleFunctionTableFromTileStageWithDescriptor:", a3);
      break;
    case 8uLL:
      result = -[_MTLRenderPipelineState newVisibleFunctionTableFromObjectStageWithDescriptor:](self, "newVisibleFunctionTableFromObjectStageWithDescriptor:", a3);
      break;
    default:
      if (a4 == 16)
        result = -[_MTLRenderPipelineState newVisibleFunctionTableFromMeshStageWithDescriptor:](self, "newVisibleFunctionTableFromMeshStageWithDescriptor:", a3);
      else
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:]", 5998, (uint64_t)CFSTR("Driver needs to override this"), (uint64_t)a5, v5, v6, v7, vars0);
  return 0;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLRenderPipelineState newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:]", 6005, (uint64_t)CFSTR("Driver needs to override this"), v4, v5, v6, v7, vars0);
  return 0;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
    return -[_MTLRenderPipelineState newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:](self, "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"), a4);
  else
    return -[_MTLRenderPipelineState newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:](self, "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), a4);
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLRenderPipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;

  switch(a4)
  {
    case 1uLL:
      result = -[_MTLRenderPipelineState newVertexIntersectionFunctionTableWithDescriptor:](self, "newVertexIntersectionFunctionTableWithDescriptor:", a3);
      break;
    case 2uLL:
      result = -[_MTLRenderPipelineState newFragmentIntersectionFunctionTableWithDescriptor:](self, "newFragmentIntersectionFunctionTableWithDescriptor:", a3);
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = -[_MTLRenderPipelineState newTileIntersectionFunctionTableWithDescriptor:](self, "newTileIntersectionFunctionTableWithDescriptor:", a3);
      break;
    case 8uLL:
      result = -[_MTLRenderPipelineState newObjectIntersectionFunctionTableWithDescriptor:](self, "newObjectIntersectionFunctionTableWithDescriptor:", a3);
      break;
    default:
      if (a4 == 16)
        result = -[_MTLRenderPipelineState newMeshIntersectionFunctionTableWithDescriptor:](self, "newMeshIntersectionFunctionTableWithDescriptor:", a3);
      else
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLDebugInstrumentationData)vertexDebugInstrumentationData
{
  return self->_vertexDebugInstrumentationData;
}

- (void)setVertexDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData
{
  return self->_fragmentDebugInstrumentationData;
}

- (void)setFragmentDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (MTLDebugInstrumentationData)tileDebugInstrumentationData
{
  return self->_tileDebugInstrumentationData;
}

- (void)setTileDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unsigned)explicitVisibilityGroupID
{
  return self->_explicitVisibilityGroupID;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

- (unint64_t)objectThreadExecutionWidth
{
  return self->_objectThreadExecutionWidth;
}

- (unint64_t)meshThreadExecutionWidth
{
  return self->_meshThreadExecutionWidth;
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return self->_maxTotalThreadsPerObjectThreadgroup;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return self->_maxTotalThreadsPerMeshThreadgroup;
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  return self->_maxTotalThreadgroupsPerMeshGrid;
}

- (MTLDebugInstrumentationData)objectDebugInstrumentationData
{
  return self->_objectDebugInstrumentationData;
}

- (void)setObjectDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (MTLDebugInstrumentationData)meshDebugInstrumentationData
{
  return self->_meshDebugInstrumentationData;
}

- (void)setMeshDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return self->_threadgroupSizeMatchesTileSize;
}

- (unint64_t)imageBlockSampleLength
{
  return self->_imageBlockSampleLength;
}

@end
