@implementation MTLGPUDebugLibrary

- (MTLGPUDebugLibrary)initWithLibrary:(id)a3 device:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugLibrary;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = -[MTLToolsDevice unwrapMTLFunctionDescriptor:](self->super.super._device, "unwrapMTLFunctionDescriptor:", a3);
  -[MTLToolsDevice modifyFunctionDescriptor:](self->super.super._device, "modifyFunctionDescriptor:", v6);
  v7 = (void *)-[MTLToolsObject newFunctionWithDescriptor:error:](self->super.super._baseObject, "newFunctionWithDescriptor:error:", v6, a4);
  v8 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", v7, self);

  objc_msgSend(v8, "prepareForBinaryFunctionUsage");
  return v8;
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  MTLToolsObject *baseObject;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLFunctionDescriptor:](self->super.super._device, "unwrapMTLFunctionDescriptor:", a3);
  -[MTLToolsDevice modifyFunctionDescriptor:](self->super.super._device, "modifyFunctionDescriptor:", v6);
  baseObject = self->super.super._baseObject;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__MTLGPUDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794428;
  v8[4] = self;
  v8[5] = a4;
  -[MTLToolsObject newFunctionWithDescriptor:completionHandler:](baseObject, "newFunctionWithDescriptor:completionHandler:", v6, v8);

}

void __66__MTLGPUDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v3, "prepareForBinaryFunctionUsage");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  MTLToolsObject *baseObject;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLFunctionDescriptor:](self->super.super._device, "unwrapMTLFunctionDescriptor:", a3);
  -[MTLToolsDevice modifyFunctionDescriptor:](self->super.super._device, "modifyFunctionDescriptor:", v6);
  baseObject = self->super.super._baseObject;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794428;
  v8[4] = self;
  v8[5] = a4;
  -[MTLToolsObject newIntersectionFunctionWithDescriptor:completionHandler:](baseObject, "newIntersectionFunctionWithDescriptor:completionHandler:", v6, v8);

}

void __78__MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v3, "prepareForBinaryFunctionUsage");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = -[MTLToolsDevice unwrapMTLFunctionDescriptor:](self->super.super._device, "unwrapMTLFunctionDescriptor:", a3);
  -[MTLToolsDevice modifyFunctionDescriptor:](self->super.super._device, "modifyFunctionDescriptor:", v6);
  v7 = (void *)-[MTLToolsObject newIntersectionFunctionWithDescriptor:error:](self->super.super._baseObject, "newIntersectionFunctionWithDescriptor:error:", v6, a4);
  v8 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", v7, self);

  objc_msgSend(v8, "prepareForBinaryFunctionUsage");
  return v8;
}

- (id)newFunctionWithName:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setName:", a3);
  objc_msgSend(v5, "setApplyFunctionConstants:", 0);
  v6 = -[MTLGPUDebugLibrary newFunctionWithDescriptor:error:](self, "newFunctionWithDescriptor:error:", v5, 0);

  return v6;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  void *v9;
  id v10;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setName:", a3);
  objc_msgSend(v9, "setConstantValues:", a4);
  v10 = -[MTLGPUDebugLibrary newFunctionWithDescriptor:error:](self, "newFunctionWithDescriptor:error:", v9, a5);

  return v10;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  void *v9;
  _QWORD v10[6];

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setName:", a3);
  objc_msgSend(v9, "setConstantValues:", a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__MTLGPUDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v10[3] = &unk_24F794450;
  v10[4] = v9;
  v10[5] = a5;
  -[MTLGPUDebugLibrary newFunctionWithDescriptor:completionHandler:](self, "newFunctionWithDescriptor:completionHandler:", v9, v10);
}

void __75__MTLGPUDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", a3);
  objc_msgSend(v8, "setConstantValues:", a4);

  abort();
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", a3);
  objc_msgSend(v8, "setConstantValues:", a4);

  abort();
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", a3);
  objc_msgSend(v8, "setConstantValues:", a4);

  abort();
}

@end
