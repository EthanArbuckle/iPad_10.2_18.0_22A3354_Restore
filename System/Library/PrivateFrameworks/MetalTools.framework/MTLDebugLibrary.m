@implementation MTLDebugLibrary

- (MTLDebugLibrary)initWithLibrary:(id)a3 parent:(id)a4 type:(unint64_t)a5 code:(id)a6 options:(id)a7
{
  MTLDebugLibrary *v10;
  MTLDebugLibrary *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLDebugLibrary;
  v10 = -[MTLToolsObject initWithBaseObject:parent:](&v13, sel_initWithBaseObject_parent_, a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_debugType = a5;
    v10->_code = (id)objc_msgSend(a6, "copy");
    v11->_compileOptions = (MTLCompileOptions *)objc_msgSend(a7, "copy");
  }
  return v11;
}

- (void)dealloc
{
  unint64_t v3;
  uint64_t v4;
  objc_super v5;

  if (self->_imageFilterFunctionInfo)
  {
    if (-[NSArray count](self->_imageFilterFunctions, "count"))
    {
      v3 = 0;
      v4 = 16;
      do
      {
        free(*(void **)(&self->_imageFilterFunctionInfo->var0 + v4));
        ++v3;
        v4 += 24;
      }
      while (v3 < -[NSArray count](self->_imageFilterFunctions, "count"));
    }
    free(self->_imageFilterFunctionInfo);
    self->_imageFilterFunctionInfo = 0;
  }

  self->_imageFilterFunctions = 0;
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugLibrary;
  -[MTLToolsLibrary dealloc](&v5, sel_dealloc);
}

- (id)newFunctionWithName:(id)a3
{
  id result;
  id v6;
  id v7;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", result, self);

    return v7;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  validateNewFunctionWithConstantArguments((NSString *)a3, (MTLFunctionConstantValues *)a4);
  v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:error:", a3, a4, a5);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", v9, self);

  v12 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v11, "setConstantValues:", v12);

  return v11;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  id v10;
  _QWORD v11[7];

  validateNewFunctionWithConstantArguments((NSString *)a3, (MTLFunctionConstantValues *)a4);
  v9 = objc_msgSend(a4, "copy");
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__MTLDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v11[3] = &unk_24F7957A0;
  v11[4] = self;
  v11[5] = v9;
  v11[6] = a5;
  objc_msgSend(v10, "newFunctionWithName:constantValues:completionHandler:", a3, v9, v11);
}

void __72__MTLDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  objc_msgSend(v3, "setConstantValues:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)validateDescriptor:(id)a3 expectedClass:(Class)a4
{
  NSString *v7;

  if (!a3)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = NSStringFromClass(a4);
    MTLReportFailure();
  }
  if ((objc_msgSend(a3, "options", v7) & 1) != 0
    && (-[MTLDevice supportsFunctionPointers](-[MTLToolsLibrary device](self, "device"), "supportsFunctionPointers") & 1) == 0)
  {
LABEL_7:
    MTLReportFailure();
  }
}

- (id)copyConstantValues:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "constantValues");
  if (v3)
    return (id)objc_msgSend(v3, "copy");
  else
    return objc_alloc_init(MEMORY[0x24BDDD5A0]);
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  MTLFunctionDescriptor *v7;
  MTLFunctionConstantValues *v8;
  id v9;
  _QWORD v10[8];

  -[MTLDebugLibrary validateDescriptor:expectedClass:](self, "validateDescriptor:expectedClass:", a3, objc_opt_class());
  v7 = (MTLFunctionDescriptor *)-[MTLDevice unwrapMTLFunctionDescriptor:](-[MTLToolsLibrary device](self, "device"), "unwrapMTLFunctionDescriptor:", a3);
  v8 = -[MTLDebugLibrary copyConstantValues:](self, "copyConstantValues:", v7);
  validateNewFunctionWithConstantArguments(-[MTLFunctionDescriptor name](v7, "name"), v8);
  validateLinkedFunctionsHaveUniqueNames(v7);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__MTLDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v10[3] = &unk_24F7957C8;
  v10[4] = self;
  v10[5] = v8;
  v10[6] = v7;
  v10[7] = a4;
  objc_msgSend(v9, "newFunctionWithDescriptor:completionHandler:", v7, v10);
}

void __63__MTLDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  objc_msgSend(v3, "setConstantValues:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  MTLFunctionDescriptor *v7;
  MTLFunctionConstantValues *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[MTLDebugLibrary validateDescriptor:expectedClass:](self, "validateDescriptor:expectedClass:", a3, objc_opt_class());
  v7 = (MTLFunctionDescriptor *)-[MTLDevice unwrapMTLFunctionDescriptor:](-[MTLToolsLibrary device](self, "device"), "unwrapMTLFunctionDescriptor:", a3);
  v8 = -[MTLDebugLibrary copyConstantValues:](self, "copyConstantValues:", v7);
  validateNewFunctionWithConstantArguments(-[MTLFunctionDescriptor name](v7, "name"), v8);
  validateLinkedFunctionsHaveUniqueNames(v7);
  v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:error:", v7, a4);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", v9, self);

    objc_msgSend(v11, "setConstantValues:", v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  MTLFunctionConstantValues *v7;
  id v8;
  _QWORD v9[7];

  -[MTLDebugLibrary validateDescriptor:expectedClass:](self, "validateDescriptor:expectedClass:", a3, objc_opt_class());
  v7 = -[MTLDebugLibrary copyConstantValues:](self, "copyConstantValues:", a3);
  validateNewFunctionWithConstantArguments((NSString *)objc_msgSend(a3, "name"), v7);
  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__MTLDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v9[3] = &unk_24F7957A0;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a4;
  objc_msgSend(v8, "newIntersectionFunctionWithDescriptor:completionHandler:", a3, v9);
}

void __75__MTLDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  objc_msgSend(v3, "setConstantValues:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  MTLFunctionConstantValues *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[MTLDebugLibrary validateDescriptor:expectedClass:](self, "validateDescriptor:expectedClass:", a3, objc_opt_class());
  v7 = -[MTLDebugLibrary copyConstantValues:](self, "copyConstantValues:", a3);
  validateNewFunctionWithConstantArguments((NSString *)objc_msgSend(a3, "name"), v7);
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionWithDescriptor:error:", a3, a4);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[MTLToolsDevice getFunctionForBaseObject:library:](self->super.super._device, "getFunctionForBaseObject:library:", v8, self);

    objc_msgSend(v10, "setConstantValues:", v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setImageFilterFunctions:(id)a3 imageFilterFunctionInfo:(id *)a4
{
  unint64_t v7;
  uint64_t v8;
  NSArray *imageFilterFunctions;
  uint64_t v10;
  unint64_t v11;
  $770E8A7FC0CAB4D9C94F7225C8E0F716 *v12;
  size_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;

  if (self->_imageFilterFunctionInfo)
  {
    if (-[NSArray count](self->_imageFilterFunctions, "count"))
    {
      v7 = 0;
      v8 = 16;
      do
      {
        free(*(void **)(&self->_imageFilterFunctionInfo->var0 + v8));
        ++v7;
        v8 += 24;
      }
      while (v7 < -[NSArray count](self->_imageFilterFunctions, "count"));
    }
    free(self->_imageFilterFunctionInfo);
  }
  imageFilterFunctions = self->_imageFilterFunctions;
  if (imageFilterFunctions != a3)
  {
    if (imageFilterFunctions)

    a3 = (id)objc_msgSend(a3, "copy");
    self->_imageFilterFunctions = (NSArray *)a3;
  }
  self->_imageFilterFunctionInfo = ($770E8A7FC0CAB4D9C94F7225C8E0F716 *)malloc_type_malloc(24 * objc_msgSend(a3, "count"), 0x1060040D275764BuLL);
  if (-[NSArray count](self->_imageFilterFunctions, "count"))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = &self->_imageFilterFunctionInfo[v10];
      v12->var0 = a4[v10].var0;
      v12->var1 = a4[v10].var1;
      v13 = 24 * a4[v10].var1;
      if (v13)
      {
        v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(24 * a4[v10].var1, 0x92C25F38uLL);
        memcpy(v14, a4[v10].var2, v13);
      }
      else
      {
        v14 = 0;
      }
      v12->var2 = v14;
      ++v11;
      ++v10;
    }
    while (v11 < -[NSArray count](self->_imageFilterFunctions, "count"));
  }
}

- (unint64_t)debugType
{
  return self->_debugType;
}

- (void)setDebugType:(unint64_t)a3
{
  self->_debugType = a3;
}

- (id)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTLCompileOptions)compileOptions
{
  return self->_compileOptions;
}

- (void)setCompileOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)imageFilterFunctions
{
  return self->_imageFilterFunctions;
}

- ($770E8A7FC0CAB4D9C94F7225C8E0F716)imageFilterFunctionInfo
{
  return self->_imageFilterFunctionInfo;
}

@end
