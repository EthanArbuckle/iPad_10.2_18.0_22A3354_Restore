@implementation _MTLPipelineLibrary

- (MTLPipelineCache)pipelineCache
{
  return (MTLPipelineCache *)*((_QWORD *)self->_pipelineLibraryData + 2);
}

- (void)dealloc
{
  id *pipelineLibraryData;
  objc_super v4;

  pipelineLibraryData = (id *)self->_pipelineLibraryData;
  if (pipelineLibraryData)
  {
    PipelineLibraryData::~PipelineLibraryData(pipelineLibraryData);
    MEMORY[0x186DABFBC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLPipelineLibrary;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (BOOL)disableRunTimeCompilation
{
  return self->_disableRunTimeCompilation;
}

- (MTLPipelineCache)functionCache
{
  return (MTLPipelineCache *)*((_QWORD *)self->_pipelineLibraryData + 3);
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *v10;
  void *v11;

  v10 = MTLPipelineDescriptions::newRenderPipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)objc_msgSend(a3, "UTF8String"), *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a6);
  objc_msgSend(v10, "setPipelineLibrary:", self);
  if (!v10)
    return 0;
  v11 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:options:reflection:error:](self->_device, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v10, a4, a5, a6);

  return v11;
}

- (_MTLPipelineLibrary)initWithDevice:(id)a3 pipelineLibraryData:(void *)a4
{
  _MTLPipelineLibrary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MTLPipelineLibrary;
  v6 = -[_MTLObjectWithLabel init](&v8, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_pipelineLibraryData = a4;
    v6->_disableRunTimeCompilation = 0;
  }
  return v6;
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_disableRunTimeCompilation = a3;
  objc_msgSend(*((id *)self->_pipelineLibraryData + 2), "setDisableRunTimeCompilation:");
  objc_msgSend(*((id *)self->_pipelineLibraryData + 3), "setDisableRunTimeCompilation:", v3);
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *v10;
  void *v11;

  v10 = MTLPipelineDescriptions::newComputePipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)objc_msgSend(a3, "UTF8String"), *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a6);
  objc_msgSend(v10, "setPipelineLibrary:", self);
  if (!v10)
    return 0;
  v11 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self->_device, "newComputePipelineStateWithDescriptor:options:reflection:error:", v10, a4, a5, a6);

  return v11;
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return MTLPipelineDescriptions::newComputePipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)objc_msgSend(a3, "UTF8String"), *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a4);
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return MTLPipelineDescriptions::newRenderPipelineDescriptor(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, (char *)objc_msgSend(a3, "UTF8String"), *((_MTLPipelineCache **)self->_pipelineLibraryData + 3), (NSError **)a4);
}

- (NSArray)metallibPaths
{
  id v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void **v12;

  MTLPipelineDescriptions::libraryPaths(*(MTLPipelineDescriptions **)self->_pipelineLibraryData, &v10);
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = (NSArray *)(id)objc_msgSend(v2, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3));
  v4 = v10;
  for (i = v11; v4 != i; v4 += 24)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = v4;
    if (*(char *)(v4 + 23) < 0)
      v7 = *(_QWORD *)v4;
    v8 = (void *)objc_msgSend(v6, "initWithUTF8String:", v7);
    -[NSArray addObject:](v3, "addObject:", v8);

  }
  v12 = (void **)&v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v3;
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSArray)pipelineNames
{
  return self->_pipelineNames;
}

@end
