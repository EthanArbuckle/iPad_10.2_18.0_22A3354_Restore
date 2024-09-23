@implementation MTLDebugPipelineLibrary

- (MTLDebugPipelineLibrary)initWithLibrary:(id)a3 parent:(id)a4 filePath:(id)a5
{
  MTLDebugPipelineLibrary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugPipelineLibrary;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
    v6->_filePath = (NSString *)objc_msgSend(a5, "copy");
  return v6;
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  MTLDebugComputePipelineState *v14;
  MTLDebugComputePipelineState *v15;
  void *v17;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  v17 = 0;
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithName:options:reflection:error:", a3, a4 | 0x10003, &v17, a6);
  v12 = (void *)v11;
  if (a5)
    *a5 = v17;
  if (!v11)
    return 0;
  v13 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineDescriptorWithName:error:", a3, 0);
  v14 = [MTLDebugComputePipelineState alloc];
  v15 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:](v14, "initWithComputePipelineState:reflection:parent:descriptor:", v12, v17, self, v13);

  return v15;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  MTLDebugRenderPipelineState *v14;
  MTLDebugRenderPipelineState *v15;
  void *v17;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  v17 = 0;
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithName:options:reflection:error:", a3, a4 | 0x10003, &v17, a6);
  v12 = (void *)v11;
  if (a5)
    *a5 = v17;
  if (!v11)
    return 0;
  v13 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineDescriptorWithName:error:", a3, 0);
  v14 = [MTLDebugRenderPipelineState alloc];
  v15 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:descriptor:](v14, "initWithPipelineState:reflection:parent:descriptor:", v12, v17, self, v13);

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugPipelineLibrary;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
