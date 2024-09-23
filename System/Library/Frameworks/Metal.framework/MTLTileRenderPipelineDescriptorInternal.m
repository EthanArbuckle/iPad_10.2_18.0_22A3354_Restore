@implementation MTLTileRenderPipelineDescriptorInternal

- (MTLTileRenderPipelineDescriptorInternal)init
{
  MTLTileRenderPipelineDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  v2 = -[MTLTileRenderPipelineDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_private.attachments = objc_alloc_init(MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal);
    v2->_private.var0.sampleCount = 1;
    v2->_private.threadgroupSizeMatchesTileSize = 0;
    v2->_private.colorSampleCount = 0;
    v2->_private.tileBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v2->_private.maxTotalThreadsPerThreadgroup = 0;
    v2->_private.textureWriteRoundingMode = 0;
    v2->_private.linkedFunctions = 0;
    v2->_private.supportAddingBinaryFunctions = 0;
    v2->_private.maxStackCallDepth = 1;
    v2->_private.profileControl = 0;
    v2->_private.preloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_private.maxAccelerationStructureTraversalDepth = 0;
    v2->_private.shaderValidation = 0;
    v2->_private.shaderValidationState = 0;
  }
  return v2;
}

- (void)dealloc
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  -[MTLTileRenderPipelineDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  _QWORD *v9;
  uint64_t v10;
  NSDictionary *pluginData;
  uint64_t v12;
  unint64_t maxStackCallDepth;
  uint64_t v14;
  NSDictionary *gpuCompilerSPIOptions;
  unint64_t maxAccelerationStructureTraversalDepth;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    p_private = &self->_private;
    v9 = (_QWORD *)(v5 + 32);
    do
    {
      *(_QWORD *)(*v9 + 8 + v7 * 8) = -[MTLTileRenderPipelineColorAttachmentDescriptorInternal copyWithZone:](p_private->attachments->_descriptors[v7], "copyWithZone:", a3);
      ++v7;
    }
    while (v7 != 8);
    *(_QWORD *)(v6 + 40) = p_private->var0.sampleCount;
    *(_QWORD *)(v6 + 80) = p_private->colorSampleCount;
    *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](p_private->label, "copyWithZone:", a3);
    v10 = 0;
    *(_QWORD *)(v6 + 56) = p_private->tileFunction;
    *(_BYTE *)(v6 + 64) = p_private->threadgroupSizeMatchesTileSize;
    do
    {
      *(_QWORD *)(*(_QWORD *)(v6 + 88) + 8 + v10 * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](p_private->tileBuffers->_descriptors[v10], "copyWithZone:", a3);
      ++v10;
    }
    while (v10 != 31);
    *(_WORD *)(v6 + 96) = p_private->maxTotalThreadsPerThreadgroup;
    pluginData = p_private->pluginData;
    *(_QWORD *)(v6 + 104) = p_private->textureWriteRoundingMode;
    *(_QWORD *)(v6 + 112) = pluginData;
    *(_QWORD *)(v6 + 120) = -[NSArray copy](p_private->binaryArchives, "copy");
    *(_QWORD *)(v6 + 128) = -[MTLLinkedFunctions copy](p_private->linkedFunctions, "copy");
    v12 = -[NSArray copy](p_private->preloadedLibraries, "copy");
    maxStackCallDepth = p_private->maxStackCallDepth;
    *(_QWORD *)(v6 + 136) = v12;
    *(_QWORD *)(v6 + 144) = maxStackCallDepth;
    *(_BYTE *)(v6 + 152) = p_private->supportAddingBinaryFunctions;
    v14 = -[MTLProfileControl copy](p_private->profileControl, "copy");
    maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
    gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
    *(_QWORD *)(v6 + 160) = v14;
    *(_QWORD *)(v6 + 168) = maxAccelerationStructureTraversalDepth;
    *(_QWORD *)(v6 + 176) = -[NSDictionary copy](gpuCompilerSPIOptions, "copy");
    *(_OWORD *)(v6 + 184) = *(_OWORD *)&p_private->shaderValidation;
  }
  return (id)v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  unint64_t sampleCount;
  const __CFString *label;
  MTLFunction *tileFunction;
  uint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  unint64_t v22;
  void *v23;
  MTLTileRenderPipelineDescriptorPrivate *v24;
  unint64_t v25;
  void *v26;
  uint64_t Name;
  void *v28;
  uint64_t i;
  MTLPipelineBufferDescriptorInternal *v30;
  uint64_t v31;
  MTLLinkedFunctions *linkedFunctions;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  MTLTileRenderPipelineDescriptorInternal *v37;
  unint64_t v38;
  objc_super v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[21];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = a3 + 8;
  objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
  v48[0] = v5;
  v48[1] = CFSTR("label =");
  v37 = self;
  p_private = &self->_private;
  sampleCount = self->_private.var0.sampleCount;
  label = (const __CFString *)self->_private.label;
  if (!label)
    label = CFSTR("<none>");
  v48[2] = label;
  v48[3] = v5;
  v48[4] = CFSTR("Raster Sample Count =");
  v48[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sampleCount);
  v48[6] = v5;
  v48[7] = CFSTR("Tile Function =");
  tileFunction = self->_private.tileFunction;
  if (tileFunction)
    v12 = -[MTLFunction formattedDescription:](tileFunction, "formattedDescription:", a3 + 8);
  else
    v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v48[8] = v12;
  v48[9] = v5;
  v13 = CFSTR("false");
  if (self->_private.threadgroupSizeMatchesTileSize)
    v13 = CFSTR("true");
  v48[10] = CFSTR("threadgroupSizeMatchesTileSize =");
  v48[11] = v13;
  v48[12] = v5;
  v48[13] = CFSTR("colorSampleCount =");
  v48[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.colorSampleCount);
  v48[15] = v5;
  v48[16] = CFSTR("maxTotalThreadsPerThreadgroup =");
  v48[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_private.maxTotalThreadsPerThreadgroup);
  v48[18] = v5;
  v48[19] = CFSTR("textureWriteRoundingMode =");
  v48[20] = MTLRoundingModeString(self->_private.textureWriteRoundingMode);
  v14 = 0x1E0C99000uLL;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 21));
  v15 = 0;
  v38 = a3 + 12;
  v16 = 0x1E0CB3000uLL;
  v17 = CFSTR("Color Attachment %u:");
  do
  {
    if (p_private->attachments->_descriptors[v15])
    {
      v47[0] = v5;
      v47[1] = objc_msgSend(*(id *)(v16 + 2368), "stringWithFormat:", v17, v15);
      v47[2] = tileColorAttachmentFormattedDescription(v6, &p_private->attachments->_descriptors[v15]->super);
      v18 = v47;
    }
    else
    {
      v46[0] = v5;
      v46[1] = objc_msgSend(*(id *)(v16 + 2368), "stringWithFormat:", v17, v15);
      v19 = v5;
      v20 = v6;
      v21 = v17;
      v22 = v16;
      v49[0] = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", v38, CFSTR(" "), 0);
      v49[1] = CFSTR("pixelFormat =");
      v23 = v7;
      v24 = p_private;
      v25 = v14;
      v26 = *(void **)(v22 + 2368);
      Name = MTLPixelFormatGetName(0);
      v28 = v26;
      v14 = v25;
      p_private = v24;
      v7 = v23;
      v49[2] = objc_msgSend(v28, "stringWithUTF8String:", Name);
      v16 = v22;
      v17 = v21;
      v6 = v20;
      v5 = v19;
      v46[2] = objc_msgSend((id)objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v49, 3), "componentsJoinedByString:", CFSTR(" "));
      v18 = v46;
    }
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v18, 3));
    ++v15;
  }
  while (v15 != 8);
  for (i = 0; i != 31; ++i)
  {
    objc_msgSend(v7, "addObject:", v5);
    objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(v16 + 2368), "stringWithFormat:", CFSTR("Buffer %u:"), i));
    v30 = p_private->tileBuffers->_descriptors[i];
    if (v30)
      v31 = pipelineBufferFormattedDescription(v6, v30);
    else
      v31 = pipelineBufferDefaultFormattedDescription(v6);
    objc_msgSend(v7, "addObject:", v31);
  }
  v45[0] = v5;
  v45[1] = CFSTR("linkedFunction =:");
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions)
    v33 = -[MTLLinkedFunctions formattedDescription:](linkedFunctions, "formattedDescription:", v6);
  else
    v33 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v45[2] = v33;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v45, 3));
  v44[0] = v5;
  v44[1] = CFSTR("supportAddingBinaryFunctions =");
  if (p_private->supportAddingBinaryFunctions)
    v34 = CFSTR("YES");
  else
    v34 = CFSTR("NO");
  v44[2] = v34;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v44, 3));
  v43[0] = v5;
  v43[1] = CFSTR("maxCallStackDepth =");
  v43[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxStackCallDepth);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v43, 3));
  v42[0] = v5;
  v42[1] = CFSTR("maxAccelerationStructureTraversalDepth =");
  v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxAccelerationStructureTraversalDepth);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v42, 3));
  v41[0] = v5;
  v41[1] = CFSTR("shaderValidation =");
  v41[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", p_private->shaderValidation);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v41, 3));
  v40[0] = v5;
  v40[1] = CFSTR("shaderValidationState =");
  v40[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", p_private->shaderValidationState);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 3360), "arrayWithObjects:count:", v40, 3));
  v35 = *(void **)(v16 + 2368);
  v39.receiver = v37;
  v39.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  return (id)objc_msgSend(v35, "stringWithFormat:", CFSTR("%@%@"), -[MTLTileRenderPipelineDescriptorInternal description](&v39, sel_description), objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLTileRenderPipelineDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)rasterSampleCount
{
  return self->_private.var0.sampleCount;
}

- (void)setRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.sampleCount = a3;
}

- (id)pluginData
{
  return self->_private.pluginData;
}

- (void)setPluginData:(id)a3
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  NSDictionary *pluginData;

  p_private = &self->_private;
  pluginData = self->_private.pluginData;
  if (pluginData != a3)
  {

    p_private->pluginData = (NSDictionary *)a3;
  }
}

- (unint64_t)colorSampleCount
{
  return self->_private.colorSampleCount;
}

- (void)setColorSampleCount:(unint64_t)a3
{
  self->_private.colorSampleCount = a3;
}

- (id)tileBuffers
{
  return self->_private.tileBuffers;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (void)setProfileControl:(id)a3
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  MTLProfileControl *profileControl;

  p_private = &self->_private;
  profileControl = self->_private.profileControl;
  if (profileControl != a3)
  {

    p_private->profileControl = (MTLProfileControl *)objc_msgSend(a3, "copy");
  }
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.maxAccelerationStructureTraversalDepth = a3;
}

- (void)setShaderValidation:(int64_t)a3
{
  self->_private.shaderValidation = a3;
}

- (int64_t)shaderValidation
{
  return self->_private.shaderValidation;
}

- (void)setShaderValidationState:(int64_t)a3
{
  self->_private.shaderValidationState = a3;
}

- (int64_t)shaderValidationState
{
  return self->_private.shaderValidationState;
}

- (void)reset
{
  uint64_t v2;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  uint64_t v4;

  v2 = 0;
  p_private = &self->_private;
  do
  {

    p_private->attachments->_descriptors[v2++] = 0;
  }
  while (v2 != 8);
  p_private->threadgroupSizeMatchesTileSize = 0;
  p_private->var0.sampleCount = 1;
  p_private->colorSampleCount = 0;

  p_private->label = 0;
  v4 = 0;
  p_private->tileFunction = 0;
  do

  while (v4 != 31);
  p_private->maxTotalThreadsPerThreadgroup = 0;
  p_private->textureWriteRoundingMode = 0;

  p_private->pluginData = 0;
  p_private->binaryArchives = 0;

  p_private->linkedFunctions = 0;
  p_private->supportAddingBinaryFunctions = 0;
  p_private->preloadedLibraries = 0;
  p_private->maxStackCallDepth = 1;

  p_private->profileControl = 0;
  p_private->maxAccelerationStructureTraversalDepth = 0;
  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
}

- (id)label
{
  return self->_private.label;
}

- (void)setLabel:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  NSString *label;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v11 = CFSTR("label is not a NSString.");
    v12 = 1;
    v13 = 635;
  }
  else
  {
    v11 = CFSTR("label must not be nil.");
    v12 = 0;
    v13 = 632;
  }
  MTLReportFailure(v12, "-[MTLTileRenderPipelineDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setTileFunction:(id)a3
{
  id v5;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 && MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
    MTLReportFailure(1uLL, "-[MTLTileRenderPipelineDescriptorInternal setTileFunction:]", 648, (uint64_t)CFSTR("tileFunction is not a MTLFunction."), v7, v8, v9, v10, v11);
  v5 = a3;
  p_private = &self->_private;

  p_private->tileFunction = (MTLFunction *)a3;
}

- (id)tileFunction
{
  return self->_private.tileFunction;
}

- (void)setThreadgroupSizeMatchesTileSize:(BOOL)a3
{
  self->_private.threadgroupSizeMatchesTileSize = a3;
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return self->_private.threadgroupSizeMatchesTileSize;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;

  v7 = a3;
  if (a3 >= 0x10000)
    MTLReportFailure(0, "-[MTLTileRenderPipelineDescriptorInternal setMaxTotalThreadsPerThreadgroup:]", 679, (uint64_t)CFSTR("max total threads must be less than or equal to %d."), v3, v4, v5, v6, 0xFFFFLL);
  self->_private.maxTotalThreadsPerThreadgroup = v7;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_private.maxTotalThreadsPerThreadgroup;
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 104) = a2;
  return result;
}

- (uint64_t)textureWriteFPRoundingMode
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (void)setBinaryArchives:(id)a3
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  NSArray *binaryArchives;

  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (id)linkedFunctions
{
  id result;
  unint64_t *p_linkedFunctions;

  p_linkedFunctions = (unint64_t *)&self->_private.linkedFunctions;
  result = self->_private.linkedFunctions;
  if (!result)
  {
    result = objc_alloc_init(MTLLinkedFunctions);
    while (!__ldaxr(p_linkedFunctions))
    {
      if (!__stlxr((unint64_t)result, p_linkedFunctions))
      {
        *p_linkedFunctions = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (id)*p_linkedFunctions;
  }
  return result;
}

- (void)setLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  uint64_t v10;
  MTLLinkedFunctions *linkedFunctions;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLTileRenderPipelineDescriptorInternal setLinkedFunctions:]", 748, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v10);
  }
  p_private = &self->_private;
  if (p_private->linkedFunctions != a3)
  {
    linkedFunctions = p_private->linkedFunctions;
    p_private->linkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");

  }
}

- (id)preloadedLibraries
{
  return self->_private.preloadedLibraries;
}

- (void)setPreloadedLibraries:(id)a3
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  NSArray *preloadedLibraries;

  p_private = &self->_private;
  preloadedLibraries = self->_private.preloadedLibraries;
  if (preloadedLibraries != a3)
  {

    p_private->preloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)insertLibraries
{
  return self->_private.preloadedLibraries;
}

- (void)setInsertLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLTileRenderPipelineDescriptorInternal setPreloadedLibraries:](self, "setPreloadedLibraries:", a3);
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_private.supportAddingBinaryFunctions;
}

- (void)setSupportAddingBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingBinaryFunctions = a3;
}

- (unint64_t)maxCallStackDepth
{
  return self->_private.maxStackCallDepth;
}

- (void)setMaxCallStackDepth:(unint64_t)a3
{
  self->_private.maxStackCallDepth = a3;
}

- (unint64_t)hash
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  uint64_t v3;
  uint64_t descriptors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  NSDictionary *pluginData;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *gpuCompilerSPIOptions;
  unint64_t maxAccelerationStructureTraversalDepth;
  int v20[16];
  char colorSampleCount;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[248];
  unsigned __int16 maxTotalThreadsPerThreadgroup;
  int textureWriteRoundingMode;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t maxStackCallDepth;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;

  p_private = &self->_private;
  bzero(v20, 0x1B0uLL);
  v3 = 0;
  descriptors = (uint64_t)p_private->attachments->_descriptors;
  v5 = _MTLDefaultRenderPipelineAttachmentPrivate;
  do
  {
    v6 = *(_QWORD *)(descriptors + v3 * 4);
    v7 = v5;
    if (v6)
      v7 = *(unsigned int *)(v6 + 8);
    *(_QWORD *)&v20[v3] = v7;
    v3 += 2;
  }
  while (v3 != 16);
  colorSampleCount = p_private->colorSampleCount;
  v22 = LOBYTE(p_private->var0.sampleCount) | (p_private->threadgroupSizeMatchesTileSize << 8);
  v23 = -[NSString hash](p_private->label, "hash");
  v8 = -[MTLFunction hash](p_private->tileFunction, "hash");
  v9 = 0;
  v24 = v8;
  v10 = (uint64_t)p_private->tileBuffers->_descriptors;
  do
  {
    v11 = *(_QWORD *)(v10 + v9);
    if (v11)
      v12 = (uint64_t *)(v11 + 8);
    else
      v12 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v25[v9] = *v12;
    v9 += 8;
  }
  while (v9 != 248);
  maxTotalThreadsPerThreadgroup = p_private->maxTotalThreadsPerThreadgroup;
  pluginData = p_private->pluginData;
  textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  v28 = -[NSDictionary hash](pluginData, "hash");
  v29 = MTLHashArray(p_private->binaryArchives, 1, 0);
  v30 = -[MTLLinkedFunctions hash](p_private->linkedFunctions, "hash");
  v14 = MTLHashArray(p_private->preloadedLibraries, 1, 1);
  v15 = -(uint64_t)p_private->supportAddingBinaryFunctions;
  v31 = v14;
  v32 = v15;
  maxStackCallDepth = p_private->maxStackCallDepth;
  v16 = -[MTLProfileControl hash](p_private->profileControl, "hash");
  maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
  v34 = v16;
  v35 = maxAccelerationStructureTraversalDepth;
  v36 = -[NSDictionary hash](gpuCompilerSPIOptions, "hash");
  v37 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState(v20, 0x1B0uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  uint64_t v7;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  char *v9;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *v10;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *v11;
  BOOL v12;
  NSString *label;
  MTLFunction *tileFunction;
  uint64_t v15;
  MTLPipelineBufferDescriptorInternal *v16;
  MTLPipelineBufferDescriptorInternal *v17;
  BOOL v18;
  NSDictionary *pluginData;
  int v20;
  MTLProfileControl *profileControl;
  NSDictionary *gpuCompilerSPIOptions;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v7 = 0;
      p_private = &self->_private;
      v9 = (char *)a3 + 32;
      while (1)
      {
        v10 = p_private->attachments->_descriptors[v7];
        v11 = *(MTLTileRenderPipelineColorAttachmentDescriptorInternal **)(*(_QWORD *)v9 + 8 + v7 * 8);
        if (v10 != v11)
        {
          v12 = !v10 || v11 == 0;
          if (v12 || v10->_private.var0.var0.pixelFormat != v11->_private.var0.var0.pixelFormat)
            break;
        }
        if (++v7 == 8)
        {
          if (p_private->threadgroupSizeMatchesTileSize != v9[32]
            || p_private->var0.sampleCount != *((_QWORD *)v9 + 1)
            || p_private->colorSampleCount != *((_QWORD *)v9 + 6))
          {
            break;
          }
          label = p_private->label;
          if (label == *((NSString **)v9 + 2) || (v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
          {
            tileFunction = p_private->tileFunction;
            if (tileFunction == *((MTLFunction **)v9 + 3)
              || (v6 = -[MTLFunction isEqual:](tileFunction, "isEqual:")) != 0)
            {
              v15 = 0;
              while (1)
              {
                v16 = p_private->tileBuffers->_descriptors[v15];
                v17 = *(MTLPipelineBufferDescriptorInternal **)(*((_QWORD *)v9 + 7) + 8 + v15 * 8);
                if (v16 != v17)
                {
                  v18 = !v16 || v17 == 0;
                  if (v18 || v16->_private.var0.var1.var0 != v17->_private.var0.var1.var0)
                    goto LABEL_3;
                }
                if (++v15 == 31)
                {
                  if (p_private->maxTotalThreadsPerThreadgroup != *((unsigned __int16 *)v9 + 32)
                    || p_private->textureWriteRoundingMode != *((_QWORD *)v9 + 9))
                  {
                    goto LABEL_3;
                  }
                  pluginData = p_private->pluginData;
                  if (pluginData == *((NSDictionary **)v9 + 10)
                    || (v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                  {
                    v20 = MTLCompareArray(p_private->binaryArchives, *((void **)v9 + 11), 1, 0);
                    LOBYTE(v6) = 0;
                    if (v20)
                    {
                      v6 = MTLCompareFunctionList(p_private->linkedFunctions, *((void **)v9 + 12));
                      if (v6)
                      {
                        v6 = MTLCompareArray(p_private->preloadedLibraries, *((void **)v9 + 13), 1, 1);
                        if (v6)
                        {
                          if (p_private->supportAddingBinaryFunctions != v9[120]
                            || p_private->maxStackCallDepth != *((_QWORD *)v9 + 14))
                          {
                            goto LABEL_3;
                          }
                          profileControl = p_private->profileControl;
                          if (profileControl == *((MTLProfileControl **)v9 + 16)
                            || (v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:")) != 0)
                          {
                            if (p_private->maxAccelerationStructureTraversalDepth != *((_QWORD *)v9 + 17))
                              goto LABEL_3;
                            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
                            if (gpuCompilerSPIOptions == *((NSDictionary **)v9 + 18)
                              || (v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
                            {
                              if (p_private->shaderValidation != *((_QWORD *)v9 + 19))
                                goto LABEL_3;
                              LOBYTE(v6) = p_private->shaderValidationState == *((_QWORD *)v9 + 20);
                            }
                          }
                        }
                      }
                    }
                  }
                  return v6;
                }
              }
            }
          }
          return v6;
        }
      }
    }
LABEL_3:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  BOOL result;
  uint64_t v9;
  uint64_t v10;
  id v11;

  p_private = &self->_private;
  if (self->_private.var0.sampleCount || (objc_msgSend(a3, "supportsTextureSampleCount:", 0) & 1) != 0)
  {
    objc_msgSend(a3, "registerTileRenderPipelineDescriptor:", self, a4);
    validateWithDevice(a3, (uint64_t)p_private);
    return 1;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rasterSampleCount (%lu) is not supported by device."), p_private->var0.sampleCount);
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PipelineError"), 1, v10);
    result = 0;
    *a4 = v11;
  }
  return result;
}

- (void)validateWithDevice:(id)a3
{
  objc_msgSend(a3, "registerTileRenderPipelineDescriptor:", self);
  validateWithDevice(a3, (uint64_t)&self->_private);
}

- (id)newSerializedTileDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v5;
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  uint64_t v7;
  MTLLinkedFunctions *v8;
  _BOOL4 v9;
  MTLLinkedFunctions *linkedFunctions;
  int v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void **v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void **v31;
  size_t v32;
  size_t v33;
  _DWORD *v34;
  _DWORD *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _DWORD *v39;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *v40;
  unsigned int pixelFormat;
  void *v42;
  const void *v43;
  size_t v44;
  _DWORD *v45;
  _DWORD *v46;
  int v47;
  int v48;
  int v49;
  size_t v50;
  const void **v51;
  uint64_t v52;
  int v53;
  size_t v54;
  unsigned int v55;

  v5 = a4;
  p_private = &self->_private;
  v7 = -[MTLFunction functionType](self->_private.tileFunction, "functionType", a3, a4, a5);
  if (v7 == 3)
  {
    linkedFunctions = p_private->linkedFunctions;
    v55 = v5;
    if (linkedFunctions
      && (-[MTLLinkedFunctions functions](linkedFunctions, "functions")
       && -[NSArray count](-[MTLLinkedFunctions functions](p_private->linkedFunctions, "functions"), "count")
       || -[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions")
       && -[NSArray count](-[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions"), "count")))
    {
      v11 = 1;
      v12 = 20;
    }
    else
    {
      v11 = 0;
      v12 = 12;
    }
    v26 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), 0);
    v27 = v26 + v12;
    v28 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
    v29 = v28;
    v30 = v28 + v26 + v12;
    v53 = v11;
    if (v11)
    {
      v31 = (const void **)_MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
      v32 = (size_t)v31[2];
      v33 = v32 + v30;
    }
    else
    {
      v32 = 0;
      v31 = 0;
      v33 = v28 + v27;
      v30 = 0;
    }
    v45 = malloc_type_calloc(1uLL, v33, 0x875B66ABuLL);
    v46 = v45;
    v45[2] = v45[2] & 0xFFFFFFFD | (2 * (HIBYTE(v55) & 1));
    if (v26)
      v47 = v12;
    else
      v47 = 0;
    if (v29)
      v48 = v26 + v12;
    else
      v48 = 0;
    *v45 = v47;
    v45[1] = v48;
    if (v26)
      MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), &v45[(unint64_t)v12 / 4]);
    if (v29)
      MTLSerializePluginDataDictionary(p_private->pluginData, (_BYTE *)v46 + v27);
    if (v53)
    {
      v49 = v46[2] | 0x20;
      v46[3] = v30;
      v46[4] = v32;
      v46[2] = v49;
      memcpy((char *)v46 + v30, *v31, v32);
      free((void *)*v31);
      MEMORY[0x186DABFBC](v31, 0x1010C40113C0ABBLL);
    }
    v42 = (void *)*MEMORY[0x1E0C80CE0];
    v43 = v46;
    v44 = v33;
  }
  else
  {
    if (v7 != 2)
      return 0;
    v8 = p_private->linkedFunctions;
    v9 = v8
      && (-[MTLLinkedFunctions functions](v8, "functions")
       && -[NSArray count](-[MTLLinkedFunctions functions](p_private->linkedFunctions, "functions"), "count")
       || -[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions")
       && -[NSArray count](-[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions"), "count"));
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = p_private->attachments->_descriptors[v14];
      if (v16 && v16->_private.var0.var0.pixelFormat)
        ++v15;
      ++v14;
    }
    while (v14 != 8);
    v17 = 16;
    if (v9)
      v17 = 24;
    v18 = v17 + 2 * v15;
    v19 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), 0);
    v20 = v19 + v18;
    v21 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
    v22 = v21;
    v23 = v21 + v19 + v18;
    v52 = v18;
    if (v9)
    {
      v24 = (const void **)_MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
      v50 = (size_t)v24[2];
      v51 = v24;
      v25 = v50 + v23;
    }
    else
    {
      v50 = 0;
      v51 = 0;
      v25 = v21 + v20;
      v23 = 0;
    }
    v54 = v25;
    v34 = malloc_type_calloc(1uLL, v25, 0x7A26F777uLL);
    v35 = v34;
    v36 = 0;
    v37 = 0;
    v34[2] = (v5 << 6) & 0x40000000 | v15 | v34[2] & 0xBFFFFF00;
    v38 = 4;
    if (v9)
      v38 = 6;
    v39 = &v34[v38];
    do
    {
      v40 = p_private->attachments->_descriptors[v36];
      if (v40)
      {
        pixelFormat = v40->_private.var0.var0.pixelFormat;
        if (pixelFormat)
          *((_WORD *)v39 + v37++) = v36 | (16 * pixelFormat);
      }
      ++v36;
    }
    while (v36 != 8);
    if (v19)
    {
      *v34 = v52;
      MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), (_BYTE *)v34 + v52);
    }
    if (v22)
    {
      v35[1] = v20;
      MTLSerializePluginDataDictionary(p_private->pluginData, (_BYTE *)v35 + v20);
    }
    if (v9)
    {
      v35[2] |= 0x80000000;
      v35[4] = v23;
      v35[5] = v50;
      memcpy((char *)v35 + v23, *v51, v50);
      free((void *)*v51);
      MEMORY[0x186DABFBC](v51, 0x1010C40113C0ABBLL);
    }
    v42 = (void *)*MEMORY[0x1E0C80CE0];
    v43 = v35;
    v44 = v54;
  }
  return dispatch_data_create(v43, v44, 0, v42);
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  MTLTileRenderPipelineDescriptorPrivate *p_private;
  NSDictionary *gpuCompilerSPIOptions;

  p_private = &self->_private;
  gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
  if (gpuCompilerSPIOptions != a3)
  {

    p_private->gpuCompilerSPIOptions = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

@end
