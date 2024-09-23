@implementation _MTLComputePipelineState

- (NSString)label
{
  return self->_label;
}

- (_MTLComputePipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MTLComputePipelineState *v11;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  unint64_t v17;
  uint64_t v18;
  objc_super v19;

  if (!a3)
  {
    v13 = CFSTR("device must not be nil.");
    v14 = 0;
    v15 = 1696;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = CFSTR("device is not a MTLDevice.");
    v14 = 1;
    v15 = 1699;
LABEL_10:
    MTLReportFailure(v14, "-[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:]", v15, (uint64_t)v13, v4, v5, v6, v7, (uint64_t)v19.receiver);
    if (a4)
      goto LABEL_4;
LABEL_11:
    v16 = CFSTR("desc must not be nil.");
    v17 = 0;
    v18 = 1702;
    goto LABEL_13;
  }
  if (!a4)
    goto LABEL_11;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v16 = CFSTR("desc is not a MTLComputePipelineDescriptor.");
  v17 = 1;
  v18 = 1705;
LABEL_13:
  MTLReportFailure(v17, "-[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:]", v18, (uint64_t)v16, v4, v5, v6, v7, (uint64_t)v19.receiver);
LABEL_5:
  v19.receiver = self;
  v19.super_class = (Class)_MTLComputePipelineState;
  v11 = -[_MTLComputePipelineState init](&v19, sel_init);
  if (v11)
  {
    v11->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v11->_device = (MTLDevice *)a3;
    v11->_supportIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v11->_textureWriteRoundingMode = objc_msgSend(a4, "textureWriteRoundingMode");
  }
  return v11;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  objc_super v3;

  self->_debugInstrumentationData = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLComputePipelineState;
  -[_MTLComputePipelineState dealloc](&v3, sel_dealloc);
}

- (_MTLComputePipelineState)initWithParent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _MTLComputePipelineState *v9;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  objc_super v14;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v11 = CFSTR("parent is not a _MTLComputePipelineState.");
    v12 = 1;
    v13 = 1729;
  }
  else
  {
    v11 = CFSTR("parent must not be nil.");
    v12 = 0;
    v13 = 1726;
  }
  MTLReportFailure(v12, "-[_MTLComputePipelineState initWithParent:]", v13, (uint64_t)v11, v3, v4, v5, v6, (uint64_t)v14.receiver);
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_MTLComputePipelineState;
  v9 = -[_MTLComputePipelineState init](&v14, sel_init);
  if (v9)
  {
    v9->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v9->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v9->_supportIndirectCommandBuffers = objc_msgSend(a3, "supportIndirectCommandBuffers");
    v9->_textureWriteRoundingMode = objc_msgSend(a3, "textureWriteRoundingMode");
    v9->_debugInstrumentationData = (MTLDebugInstrumentationData *)*((id *)a3 + 3);
  }
  return v9;
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  const __CFString *label;
  MTLDevice *device;
  const __CFString *v10;
  objc_super v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_MTLComputePipelineState;
  v7 = -[_MTLComputePipelineState description](&v12, sel_description);
  v13[0] = v5;
  v13[1] = CFSTR("label =");
  label = CFSTR("<none>");
  device = self->_device;
  if (self->_label)
    label = (const __CFString *)self->_label;
  v13[2] = label;
  v13[3] = v5;
  v13[4] = CFSTR("device =");
  if (device)
    v10 = (const __CFString *)-[MTLDevice formattedDescription:](device, "formattedDescription:", v4);
  else
    v10 = CFSTR("<null>");
  v13[5] = v10;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[_MTLComputePipelineState formattedDescription:](self, "formattedDescription:", 0);
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_supportIndirectCommandBuffers;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unsigned)getComputeKernelTelemetryID
{
  return -[_MTLComputePipelineState uniqueIdentifier](self, "uniqueIdentifier");
}

- (id)pipelineBinaries
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)functionHandleWithFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLComputePipelineState functionHandleWithFunction:]", 1830, (uint64_t)CFSTR("Driver needs to override this"), v3, v4, v5, v6, vars0);
  return 0;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newVisibleFunctionTableWithDescriptor:](-[_MTLComputePipelineState device](self, "device"), "newVisibleFunctionTableWithDescriptor:", a3);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLComputePipelineState newComputePipelineStateWithAdditionalBinaryFunctions:error:]", 1848, (uint64_t)CFSTR("Driver needs to override this"), v4, v5, v6, v7, vars0);
  return 0;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  return (id)-[MTLDevice newIntersectionFunctionTableWithDescriptor:](-[_MTLComputePipelineState device](self, "device"), "newIntersectionFunctionTableWithDescriptor:", a3);
}

- (unint64_t)allocatedSize
{
  return 0;
}

- (int64_t)shaderValidation
{
  return 2;
}

- (int64_t)shaderValidationState
{
  return 2;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end
