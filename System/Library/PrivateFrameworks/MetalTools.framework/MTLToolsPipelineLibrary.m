@implementation MTLToolsPipelineLibrary

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSArray)pipelineNames
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pipelineNames");
}

- (BOOL)disableRunTimeCompilation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "disableRunTimeCompilation");
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDisableRunTimeCompilation:", a3);
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsComputePipelineState *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithName:options:reflection:error:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsRenderPipelineState *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithName:options:reflection:error:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  abort();
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  abort();
}

- (NSArray)metallibPaths
{
  abort();
}

- (MTLPipelineCache)pipelineCache
{
  return (MTLPipelineCache *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pipelineCache");
}

- (MTLPipelineCache)functionCache
{
  return (MTLPipelineCache *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionCache");
}

@end
