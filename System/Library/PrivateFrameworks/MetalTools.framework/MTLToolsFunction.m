@implementation MTLToolsFunction

- (MTLToolsFunction)initWithFunction:(id)a3 library:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsFunction;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (id)formattedDescription:(unint64_t)a3
{
  return &stru_24F795D30;
}

- (unint64_t)functionType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionType");
}

- (NSArray)vertexAttributes
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vertexAttributes");
}

- (MTLType)returnType
{
  return (MTLType *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "returnType");
}

- (NSArray)arguments
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "arguments");
}

- (NSArray)bindings
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bindings");
}

- (NSArray)importedSymbols
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedSymbols");
}

- (NSArray)importedLibraries
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedLibraries");
}

- (NSArray)stageInputAttributes
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "stageInputAttributes");
}

- (NSString)name
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "name");
}

- (NSString)filePath
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "filePath");
}

- (int64_t)lineNumber
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "lineNumber");
}

- (NSString)unpackedFilePath
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "unpackedFilePath");
}

- (id)functionInputs
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionInputs");
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugInstrumentationData");
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unint64_t)renderTargetArrayIndexType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderTargetArrayIndexType");
}

- (NSDictionary)functionConstantsDictionary
{
  return (NSDictionary *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionConstantsDictionary");
}

- (unint64_t)patchType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "patchType");
}

- (int64_t)patchControlPointCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "patchControlPointCount");
}

- (unint64_t)options
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "options");
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  id result;
  id v5;
  MTLToolsArgumentEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  id result;
  id v6;
  MTLToolsArgumentEncoder *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  id result;
  id v6;
  MTLToolsArgumentEncoder *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:pipelineLibrary:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  id result;
  id v7;
  MTLToolsArgumentEncoder *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  id result;
  id v7;
  MTLToolsArgumentEncoder *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (NSArray)relocations
{
  return self->_relocations;
}

- (void)setRelocations:(id)a3
{
  NSArray *relocations;
  id v6;

  relocations = self->_relocations;
  if (relocations != a3)
  {

    self->_relocations = (NSArray *)objc_msgSend(a3, "copy");
    v6 = (id)-[MTLDevice unwrapMTLRelocations:](-[MTLToolsObject device](self, "device"), "unwrapMTLRelocations:", a3);
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRelocations:", v6);

  }
}

- (id)bitcodeData
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bitcodeData");
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reflectionWithOptions:", a3);
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reflectionWithOptions:pipelineLibrary:", a3, a4);
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reflectionWithOptions:binaryArchives:", a3, a4);
}

- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reflectionWithOptions:completionHandler:", a3, a4);
}

- (const)bitCodeHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bitCodeHash");
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  id result;
  id v6;
  MTLToolsFunction *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithPluginData:bitcodeType:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (MTLFunctionHandle)functionHandle
{
  return (MTLFunctionHandle *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandle");
}

- (id)precompiledOutput
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "precompiledOutput");
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->functionObjectCache, "removeKey:", self->super._baseObject);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsFunction;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

@end
