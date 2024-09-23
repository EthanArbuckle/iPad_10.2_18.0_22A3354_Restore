@implementation BWNodeOutputMediaConfiguration

- (BWFormatRequirements)formatRequirements
{
  return self->_formatRequirements;
}

- (BOOL)isDrivenByInputWithIndex:(unint64_t)a3
{
  NSArray *indexesOfInputsWhichDrivesThisOutput;

  indexesOfInputsWhichDrivesThisOutput = self->_indexesOfInputsWhichDrivesThisOutput;
  if (indexesOfInputsWhichDrivesThisOutput)
    return -[NSArray containsObject:](indexesOfInputsWhichDrivesThisOutput, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  else
    return a3 == 0;
}

- (BOOL)performsAttachedMediaRemapping
{
  return self->_performsAttachedMediaRemapping;
}

- (int)passthroughMode
{
  return self->_passthroughMode;
}

- (int)indexOfInputWhichDrivesThisOutput
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_indexesOfInputsWhichDrivesThisOutput, "count");
  if (v3)
    LODWORD(v3) = objc_msgSend(-[NSArray lastObject](self->_indexesOfInputsWhichDrivesThisOutput, "lastObject"), "intValue");
  return v3;
}

- (void)setProvidesPixelBufferPool:(BOOL)a3
{
  self->_providesPixelBufferPool = a3;
}

- (void)_setAssociatedAttachedMediaKey:(id)a3
{
  NSString *associatedAttachedMediaKey;
  NSString *attachedMediaKeyOfInputWhichDrivesThisOutput;
  void *v7;
  uint64_t v8;
  const __CFString *v9;

  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("Associated attached media key must not be nil");
    goto LABEL_8;
  }
  if (self->_associatedAttachedMediaKey)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("Associated attached media key can only be set once");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
  }
  associatedAttachedMediaKey = (NSString *)objc_msgSend(a3, "copy");
  self->_associatedAttachedMediaKey = associatedAttachedMediaKey;
  attachedMediaKeyOfInputWhichDrivesThisOutput = self->_attachedMediaKeyOfInputWhichDrivesThisOutput;
  if (!attachedMediaKeyOfInputWhichDrivesThisOutput)
  {
    attachedMediaKeyOfInputWhichDrivesThisOutput = (NSString *)objc_msgSend(a3, "copy");
    self->_attachedMediaKeyOfInputWhichDrivesThisOutput = attachedMediaKeyOfInputWhichDrivesThisOutput;
    associatedAttachedMediaKey = self->_associatedAttachedMediaKey;
  }
  self->_performsAttachedMediaRemapping = !-[NSString isEqualToString:](associatedAttachedMediaKey, "isEqualToString:", attachedMediaKeyOfInputWhichDrivesThisOutput);
}

- (BWNodeOutputMediaConfiguration)init
{
  BWNodeOutputMediaConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaConfiguration;
  result = -[BWNodeOutputMediaConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_passthroughMode = 0;
    result->_performsAttachedMediaRemapping = 0;
  }
  return result;
}

- (void)setProvidesDataBufferPool:(BOOL)a3
{
  self->_providesDataBufferPool = a3;
}

- (BOOL)providesPixelBufferPool
{
  return self->_providesPixelBufferPool;
}

- (int)owningNodeRetainedBufferCount
{
  return self->_owningNodeRetainedBufferCount;
}

- (BOOL)providesDataBufferPool
{
  return self->_providesDataBufferPool;
}

- (void)setPassthroughMode:(int)a3
{
  self->_passthroughMode = a3;
}

- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3
{
  self->_pixelBufferPoolProvidesBackPressure = a3;
}

- (void)setIndexesOfInputsWhichDrivesThisOutput:(id)a3
{

  self->_indexesOfInputsWhichDrivesThisOutput = 0;
  if (a3
    && (objc_msgSend(a3, "count") == 1
     && !objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "isEqual:", &unk_1E49F9AF8)
     || (unint64_t)objc_msgSend(a3, "count") >= 2))
  {
    self->_indexesOfInputsWhichDrivesThisOutput = (NSArray *)a3;
  }
}

- (void)setAttachedMediaKeyOfInputWhichDrivesThisOutput:(id)a3
{

  self->_attachedMediaKeyOfInputWhichDrivesThisOutput = (NSString *)objc_msgSend(a3, "copy");
  self->_performsAttachedMediaRemapping = !-[NSString isEqualToString:](self->_associatedAttachedMediaKey, "isEqualToString:", a3);
}

- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3
{
  uint64_t v3;
  _QWORD v5[2];

  v3 = *(_QWORD *)&a3;
  v5[1] = *MEMORY[0x1E0C80C00];

  self->_indexesOfInputsWhichDrivesThisOutput = 0;
  if ((_DWORD)v3)
  {
    v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    self->_indexesOfInputsWhichDrivesThisOutput = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaConfiguration;
  -[BWNodeOutputMediaConfiguration dealloc](&v3, sel_dealloc);
}

- (NSString)attachedMediaKeyOfInputWhichDrivesThisOutput
{
  return self->_attachedMediaKeyOfInputWhichDrivesThisOutput;
}

- (void)setFormatRequirements:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)pixelBufferPoolProvidesBackPressure
{
  return self->_pixelBufferPoolProvidesBackPressure;
}

- (void)setOwningNodeRetainedBufferCount:(int)a3
{
  self->_owningNodeRetainedBufferCount = a3;
}

- (NSArray)indexesOfInputsWhichDrivesThisOutput
{
  return self->_indexesOfInputsWhichDrivesThisOutput;
}

- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations
{
  return self->_pixelBufferPoolReportSlowBackPressureAllocations;
}

- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3
{
  self->_pixelBufferPoolReportSlowBackPressureAllocations = a3;
}

- (int)owningNodeIndefinitelyHeldBufferCount
{
  return self->_owningNodeIndefinitelyHeldBufferCount;
}

- (void)setOwningNodeIndefinitelyHeldBufferCount:(int)a3
{
  self->_owningNodeIndefinitelyHeldBufferCount = a3;
}

@end
