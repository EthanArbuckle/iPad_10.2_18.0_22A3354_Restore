@implementation _MTLCommandBufferDescriptor

- (unint64_t)errorOptions
{
  return self->_errorOptions;
}

- (BOOL)disableFineGrainedComputePreemption
{
  return self->_disableFineGrainedComputePreemption;
}

- (MTLDeadlineProfile)deadlineProfile
{
  return self->_deadlineProfile;
}

- (BOOL)cloneIntersectionFunctionTablesPerDispatch
{
  return self->_cloneIntersectionFunctionTablesPerDispatch;
}

- (BOOL)captureProgramAddressTable
{
  return self->_captureProgramAddressTable;
}

- (BOOL)retainedReferences
{
  return self->_retainedReferences;
}

- (void)setRetainedReferences:(BOOL)a3
{
  self->_retainedReferences = a3;
}

- (void)setErrorOptions:(unint64_t)a3
{
  self->_errorOptions = a3;
}

- (_MTLCommandBufferDescriptor)init
{
  _MTLCommandBufferDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferDescriptor;
  result = -[_MTLCommandBufferDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_errorOptions = 0;
    result->_retainedReferences = 1;
    result->_captureProgramAddressTable = 0;
    result->_cloneIntersectionFunctionTablesPerDispatch = 0;
    result->_disableFineGrainedComputePreemption = 0;
    result->_deadlineProfile = 0;
    result->_logState = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRetainedReferences:", self->_retainedReferences);
    objc_msgSend(v5, "setErrorOptions:", self->_errorOptions);
    objc_msgSend(v5, "setCaptureProgramAddressTable:", self->_captureProgramAddressTable);
    objc_msgSend(v5, "setCloneIntersectionFunctionTablesPerDispatch:", self->_cloneIntersectionFunctionTablesPerDispatch);
    objc_msgSend(v5, "setDisableFineGrainedComputePreemption:", self->_disableFineGrainedComputePreemption);
    objc_msgSend(v5, "setDeadlineProfile:", self->_deadlineProfile);
    objc_msgSend(v5, "setLogState:", self->_logState);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferDescriptor;
  -[_MTLCommandBufferDescriptor dealloc](&v3, sel_dealloc);
}

- (void)setCaptureProgramAddressTable:(BOOL)a3
{
  self->_captureProgramAddressTable = a3;
}

- (void)setCloneIntersectionFunctionTablesPerDispatch:(BOOL)a3
{
  self->_cloneIntersectionFunctionTablesPerDispatch = a3;
}

- (void)setDeadlineProfile:(id)a3
{
  self->_deadlineProfile = (MTLDeadlineProfile *)a3;
}

- (void)setDisableFineGrainedComputePreemption:(BOOL)a3
{
  self->_disableFineGrainedComputePreemption = a3;
}

- (id)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
