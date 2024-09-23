@implementation MTLFunctionReflectionInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionReflectionInternal;
  -[MTLFunctionReflectionInternal dealloc](&v3, sel_dealloc);
}

- (MTLFunctionReflectionInternal)initWithDevice:(id)a3 reflectionData:(id)a4 functionType:(unint64_t)a5 options:(unint64_t)a6
{
  dispatch_data_t v11;
  NSObject *v12;
  NSObject *v13;
  MTLFunctionReflectionInternal *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MTLFunctionReflectionInternal *v25;
  MTLArgumentReader *v26;
  uint64_t v27;
  uint64_t v29;

  if ((a6 & 0x200008000) != 0)
    v11 = MTLNewEmulationReflectionData(a4);
  else
    v11 = MTLNewReflectionData(a4);
  v12 = v11;
  v13 = MTLNewReflectionPluginData(a4);
  v14 = 0;
  v15 = (void *)MEMORY[0x186DAC640]();
  switch(a5)
  {
    case 1uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v16 = ReflectionReaderFactory<MTLVertexReflectionReader>::Create(a6, v12);
      (*(void (**)(uint64_t *, id, NSObject *, _QWORD))(*v16 + 16))(v16, a3, v12, 0);
      goto LABEL_12;
    case 2uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v16 = (uint64_t *)ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(a6, v12);
      MTLFragmentReflectionReader::deserialize((uint64_t)v16);
      goto LABEL_12;
    case 3uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v16 = ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a6, v12);
      MTLFragmentReflectionReader::deserialize((uint64_t)v16);
      goto LABEL_12;
    case 6uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v16 = (uint64_t *)ReflectionReaderFactory<MTLIntersectionReflectionReader>::Create(a6, v12);
      MTLFragmentReflectionReader::deserialize((uint64_t)v16);
      MTLArgumentDeserializer::deserializePluginData(v16[1], v13);
      v17 = v16[1];
      v18 = v16[2];
      v19 = *(_QWORD *)(v17 + 8);
      v20 = *(unsigned int *)(v17 + 16);
      v21 = *(unsigned int *)(v17 + 36);
      v22 = *(_QWORD *)(v17 + 48);
      v23 = *(_QWORD *)(v18 + 112);
      v24 = *(_QWORD *)(v18 + 120);
      LODWORD(v29) = *(_DWORD *)(v18 + 128);
      v25 = self;
      goto LABEL_13;
    case 7uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v26 = ReflectionReaderFactory<MTLMeshReflectionReader>::Create(a6, v12);
      goto LABEL_11;
    case 8uLL:
      ReflectionValidator<MTLVertexReflectionReader>::Validate();
      v26 = ReflectionReaderFactory<MTLObjectReflectionReader>::Create(a6, v12);
LABEL_11:
      v16 = (uint64_t *)v26;
      MTLFragmentReflectionReader::deserialize((uint64_t)v26);
LABEL_12:
      MTLArgumentDeserializer::deserializePluginData(v16[1], v13);
      v27 = v16[1];
      v19 = *(_QWORD *)(v27 + 8);
      v20 = *(unsigned int *)(v27 + 16);
      v21 = *(unsigned int *)(v27 + 36);
      v22 = *(_QWORD *)(v27 + 48);
      LODWORD(v29) = 0;
      v25 = self;
      v23 = 0;
      v24 = 0;
LABEL_13:
      v14 = -[MTLFunctionReflectionInternal initWithArguments:argumentCount:builtInArgumentCount:pluginReturnData:primitiveKind:tags:tagCount:](v25, "initWithArguments:argumentCount:builtInArgumentCount:pluginReturnData:primitiveKind:tags:tagCount:", v19, v20, v21, v22, v23, v24, v29);
      if (v12)
        dispatch_release(v12);
      if (v13)
        dispatch_release(v13);
      (*(void (**)(uint64_t *))(*v16 + 8))(v16);
      break;
    default:
      break;
  }
  objc_autoreleasePoolPop(v15);
  return v14;
}

- (MTLFunctionReflectionInternal)initWithArguments:(id *)a3 argumentCount:(unsigned int)a4 builtInArgumentCount:(unsigned int)a5 pluginReturnData:(id)a6 primitiveKind:(unint64_t)a7 tags:(id *)a8 tagCount:(unsigned int)a9
{
  MTLFunctionReflectionInternal *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MTLFunctionReflectionInternal;
  v15 = -[MTLFunctionReflectionInternal init](&v21, sel_init);
  if (v15)
  {
    if (a4)
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4 - a5);
    else
      v16 = 0;
    v15->_arguments = (NSArray *)v16;
    if (a5)
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &a3[a4] - a5, a5);
    else
      v17 = 0;
    v15->_builtInArguments = (NSArray *)v17;
    if (a4)
      v18 = v15->_arguments;
    else
      v18 = 0;
    v15->_bindings = v18;
    v15->_pluginReturnData = (NSData *)a6;
    v15->_primitiveKind = a7;
    if (a9)
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a8, a9);
    else
      v19 = 0;
    v15->_tags = (NSArray *)v19;
  }
  return v15;
}

- (id)arguments
{
  return self->_arguments;
}

- (id)builtInArguments
{
  return self->_builtInArguments;
}

- (id)bindings
{
  return self->_bindings;
}

- (id)pluginReturnData
{
  return self->_pluginReturnData;
}

- (unint64_t)primitiveKind
{
  return self->_primitiveKind;
}

- (id)tags
{
  return self->_tags;
}

@end
