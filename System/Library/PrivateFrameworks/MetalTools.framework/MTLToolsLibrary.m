@implementation MTLToolsLibrary

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->sourceLibraryObjectCache, "removeKey:", self->super._baseObject);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsLibrary;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (BOOL)shaderValidationEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "shaderValidationEnabled");
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setShaderValidationEnabled:", a3);
}

- (NSString)overrideTriple
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "overrideTriple");
}

- (void)setOverrideTriple:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setOverrideTriple:", a3);
}

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

- (NSUUID)libraryIdentifier
{
  return (NSUUID *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "libraryIdentifier");
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeToURL:error:", a3, a4);
}

- (id)newFunctionWithName:(id)a3
{
  id result;
  id v5;
  MTLToolsFunction *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newExternFunctionWithName:(id)a3
{
  id result;
  id v5;
  MTLToolsFunction *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newExternFunctionWithName:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id result;
  id v7;
  MTLToolsFunction *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:error:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsFunction *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:pipelineLibrary:error:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  id v9;
  _QWORD v10[6];

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__MTLToolsLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v10[3] = &unk_24F794428;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newFunctionWithName:constantValues:completionHandler:", a3, a4, v10);
}

void __72__MTLToolsLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v6 = -[MTLDevice unwrapMTLFunctionDescriptor:](-[MTLToolsLibrary device](self, "device"), "unwrapMTLFunctionDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__MTLToolsLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794910;
  v8[5] = v6;
  v8[6] = a4;
  v8[4] = self;
  objc_msgSend(v7, "newFunctionWithDescriptor:completionHandler:", v6, v8);
}

void __63__MTLToolsLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = (void *)-[MTLDevice unwrapMTLFunctionDescriptor:](-[MTLToolsLibrary device](self, "device"), "unwrapMTLFunctionDescriptor:", a3);
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super._device, "getFunctionForBaseObject:library:", v7, self);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v7;
  _QWORD v8[6];

  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__MTLToolsLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794428;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newIntersectionFunctionWithDescriptor:completionHandler:", a3, v8);
}

void __75__MTLToolsLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  id v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionWithDescriptor:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super._device, "getFunctionForBaseObject:library:", result, self);

    return v7;
  }
  return result;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  id v11;
  _QWORD v12[6];

  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__MTLToolsLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke;
  v12[3] = &unk_24F794428;
  v12[4] = self;
  v12[5] = a6;
  objc_msgSend(v11, "newFunctionWithName:constantValues:pipelineLibrary:completionHandler:", a3, a4, a5, v12);
}

void __88__MTLToolsLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  id result;
  id v7;
  MTLToolsFunction *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:destinationArchive:error:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (NSArray)functionNames
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionNames");
}

- (NSArray)externFunctionNames
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "externFunctionNames");
}

- (NSData)bitcodeData
{
  return (NSData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bitcodeData");
}

- (int64_t)type
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "type");
}

- (NSString)installName
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "installName");
}

@end
