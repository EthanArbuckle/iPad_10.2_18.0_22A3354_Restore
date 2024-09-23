@implementation _MTLLibrary

- (void)dealloc
{
  void *libraryData;
  objc_super v4;

  self->_functionDictionary = 0;
  libraryData = self->_libraryData;
  if (libraryData)
  {
    (*(void (**)(void *))(*(_QWORD *)libraryData + 24))(libraryData);
    self->_libraryData = 0;
  }
  if (self->_cacheEntry)
    -[MTLDevice releaseCacheEntry:](self->_device, "releaseCacheEntry:");

  self->_device = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MTLLibrary;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 completionHandler:(id)a7
{
  id v13;

  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setName:", a3);
  if (a6)
    objc_msgSend(v13, "setSpecializedName:", a6);
  if (a4)
    objc_msgSend(v13, "setConstantValues:", a4);
  -[_MTLLibrary newFunctionWithDescriptor:destinationArchive:functionCache:completionHandler:](self, "newFunctionWithDescriptor:destinationArchive:functionCache:completionHandler:", v13, 0, a5, a7);

}

- (void)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[8];

  v10 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:", objc_msgSend(a3, "name"));
  if (v10)
  {
    v11 = v10;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke;
    v14[3] = &unk_1E0FE42D8;
    v14[4] = self;
    v14[5] = a3;
    v14[6] = v10;
    v14[7] = a6;
    objc_msgSend(v10, "newSpecializedFunctionWithDescriptor:destinationArchive:functionCache:sync:completionHandler:", a3, 0, a5, 0, v14);

  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Function %@ was not found in the library"), objc_msgSend(a3, "name"));
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0CB2D50]);
    (*((void (**)(id, _QWORD, id))a6 + 2))(a6, 0, (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 5, v13));
  }
}

- (id)newFunctionWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = -[_MTLLibrary newFunctionWithNameInternal:](self, "newFunctionWithNameInternal:");
  v5 = v4;
  if (v4 && objc_msgSend(v4, "functionType") == 4)
    MTLReportFailure(1uLL, "-[_MTLLibrary newFunctionWithName:]", 6537, (uint64_t)CFSTR("Function %@ was not found in the library"), v6, v7, v8, v9, (uint64_t)a3);
  return v5;
}

- (id)newFunctionWithNameInternal:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v9;
  void *v10;
  id v11;
  MTLPipelineCollection *var0;
  BOOL v13;
  const __CFString *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v15 = CFSTR("functionName is not a NSString.");
    v16 = 1;
    v17 = 6498;
  }
  else
  {
    v15 = CFSTR("functionName must not be nil.");
    v16 = 0;
    v17 = 6495;
  }
  MTLReportFailure(v16, "-[_MTLLibrary newFunctionWithNameInternal:]", v17, (uint64_t)v15, v3, v4, v5, v6, v18);
LABEL_3:
  v9 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v9);
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_functionDictionary, "objectForKey:", a3);
  if (!v10)
    v10 = MTLLibraryContainer::functionWithName((uint64_t)self->_cacheEntry, (uint64_t)a3);
  v11 = v10;
  var0 = self->_cacheEntry->var0;
  if (var0)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (!v13)
    MTLPipelineCollection::addFunction((uint64_t)var0, (uint64_t)v10, (uint64_t)self->_libraryData, 0);
  os_unfair_lock_unlock(v9);
  return v10;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  return -[_MTLLibrary newFunctionWithName:constantValues:functionCache:error:](self, "newFunctionWithName:constantValues:functionCache:error:", a3, a4, objc_msgSend(a5, "functionCache"), a6);
}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  unint64_t v11;
  MTLDevice *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;

  v18 = 0;
  v9 = -[_MTLLibrary newSpecializedFunctionWithDescriptorInternal:destinationArchive:functionCache:error:](self, "newSpecializedFunctionWithDescriptorInternal:destinationArchive:functionCache:error:", a3, a4, 0, &v18);
  if (v9)
  {
    v10 = v9;
    if (a4)
      v11 = ((unint64_t)objc_msgSend(a4, "options") >> 1) & 1;
    else
      LODWORD(v11) = 0;
    if ((objc_msgSend(v10, "functionType", 0) == 5 || objc_msgSend(v10, "functionType") == 6)
      && -[MTLDevice supportsFunctionPointers](-[_MTLLibrary device](self, "device"), "supportsFunctionPointers")&& (objc_msgSend(a3, "options") & 1) != 0)
    {
      v12 = -[_MTLLibrary device](self, "device");
      if ((_DWORD)v11)
        -[MTLDevice compileVisibleFunction:withDescriptor:destinationBinaryArchive:error:](v12, "compileVisibleFunction:withDescriptor:destinationBinaryArchive:error:", v10, a3, a4, &v17);
      else
        -[MTLDevice compileVisibleFunction:withDescriptor:error:](v12, "compileVisibleFunction:withDescriptor:error:", v10, a3, &v17);
    }
    if ((objc_msgSend(a3, "options") & 1) != 0 && v17)
    {
      if (a5)
        *a5 = v17;

      return 0;
    }
    else
    {
      v13 = objc_msgSend(v10, "precompiledOutput");
      v14 = objc_msgSend(a3, "options");
      v15 = v14;
      if (v13)
        v15 = v14 | 1;
      objc_msgSend(v10, "setOptions:", v15);
    }
  }
  else
  {
    v10 = 0;
    if (a5)
      *a5 = v18;
  }
  return v10;
}

- (NSArray)functionNames
{
  MTLLibraryContainer *cacheEntry;
  NSArray *result;

  cacheEntry = self->_cacheEntry;
  result = (NSArray *)cacheEntry->var5;
  if (!result)
    return (NSArray *)(*(uint64_t (**)(MTLLibraryData *))(*(_QWORD *)cacheEntry->var3 + 40))(cacheEntry->var3);
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 error:(id *)a7
{
  id v13;
  void *v14;
  int v15;
  MTLPipelineCollection *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  MTLPipelineCollection *var0;
  BOOL v22;

  v13 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:");
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "needsFunctionConstantValues");
    if (a6 || v15)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setName:", a3);
      if (a6)
        objc_msgSend(v20, "setSpecializedName:", a6);
      if (a4)
        objc_msgSend(v20, "setConstantValues:", a4);
      v17 = (void *)objc_msgSend(v14, "newSpecializedFunctionWithDescriptor:destinationArchive:functionCache:error:", v20, 0, a5, a7);
      var0 = self->_cacheEntry->var0;
      if (var0)
        v22 = v17 == 0;
      else
        v22 = 1;
      if (!v22)
        MTLPipelineCollection::addSpecializedFunction((uint64_t)var0, (uint64_t)v14, (uint64_t)v17, (uint64_t)self, (uint64_t)v20);

    }
    else
    {
      v16 = self->_cacheEntry->var0;
      if (v16)
        MTLPipelineCollection::addFunction((uint64_t)v16, (uint64_t)v14, (uint64_t)self->_libraryData, 0);
      return v14;
    }
  }
  else
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Function %@ was not found in the library"), a3);
    if (a7)
    {
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);
      v17 = 0;
      *a7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 5, v19);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

- (id)newSpecializedFunctionWithDescriptorInternal:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v11 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:", objc_msgSend(a3, "name"));
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_msgSend(v11, "newSpecializedFunctionWithDescriptor:destinationArchive:functionCache:error:", a3, a4, a5, a6);
    if (self->_cacheEntry->var0)
    {
      v14 = objc_msgSend(a3, "options");
      if (v13 == v12)
      {
        if ((v14 & 0x10) == 0)
          MTLPipelineCollection::addFunction((uint64_t)self->_cacheEntry->var0, (uint64_t)v12, (uint64_t)self->_libraryData, objc_msgSend(a3, "options"));
      }
      else if (v13 && (v14 & 0x10) == 0)
      {
        MTLPipelineCollection::addSpecializedFunction((uint64_t)self->_cacheEntry->var0, (uint64_t)v12, (uint64_t)v13, (uint64_t)self, (uint64_t)a3);
      }
    }

  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Function %@ was not found in the library"), objc_msgSend(a3, "name"));
    if (a6)
    {
      v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 5, v16);
      v13 = 0;
      *a6 = v17;
    }
    else
    {
      return 0;
    }
  }
  return v13;
}

- (id)newSpecializedFunctionWithHash:(id *)a3
{
  return -[_MTLLibrary newSpecializedFunctionWithHash:libraryPath:](self, "newSpecializedFunctionWithHash:libraryPath:", a3, 0);
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLLibrary newFunctionWithDescriptor:destinationArchive:error:](self, "newFunctionWithDescriptor:destinationArchive:error:", a3, 0, a4);
}

- (_MTLLibrary)initWithLibraryContainer:(MTLLibraryContainer *)a3 device:(id)a4
{
  _MTLLibrary *v6;
  MTLLibraryData *var3;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MTLLibrary;
  v6 = -[_MTLObjectWithLabel init](&v9, sel_init);
  var3 = a3->var3;
  (*(void (**)(MTLLibraryData *))(*(_QWORD *)var3 + 16))(var3);
  v6->_device = (MTLDevice *)a4;
  v6->_cacheEntry = a3;
  MTLAtomicIncrement((unsigned int *)&a3->var1);
  v6->_libraryData = var3;
  v6->_functionDictionary = (NSMutableDictionary *)a3->var4;
  return v6;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  return -[_MTLLibrary newFunctionWithName:constantValues:functionCache:specializedName:error:](self, "newFunctionWithName:constantValues:functionCache:specializedName:error:", a3, a4, 0, 0, a5);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  -[_MTLLibrary newFunctionWithDescriptor:destinationArchive:functionCache:completionHandler:](self, "newFunctionWithDescriptor:destinationArchive:functionCache:completionHandler:", a3, 0, 0, a4);
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  -[_MTLLibrary newFunctionWithName:constantValues:functionCache:specializedName:completionHandler:](self, "newFunctionWithName:constantValues:functionCache:specializedName:completionHandler:", a3, a4, 0, 0, a5);
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  return -[_MTLLibrary newFunctionWithName:constantValues:functionCache:specializedName:error:](self, "newFunctionWithName:constantValues:functionCache:specializedName:error:", a3, a4, a5, 0, a6);
}

- (NSArray)externFunctionNames
{
  MTLLibraryContainer *cacheEntry;
  NSArray *result;

  cacheEntry = self->_cacheEntry;
  result = (NSArray *)cacheEntry->var6;
  if (!result)
    return (NSArray *)(*(uint64_t (**)(MTLLibraryData *))(*(_QWORD *)cacheEntry->var3 + 48))(cacheEntry->var3);
  return result;
}

- (NSArray)variableList
{
  return (NSArray *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 56))(self->_libraryData);
}

- (id)bitCodeWithHash:(id *)a3
{
  return (id)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *))(*(_QWORD *)self->_libraryData
                                                                                          + 136))(self->_libraryData, a3);
}

- (id)newMetalScript
{
  return (id)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 144))(self->_libraryData);
}

- (id)newFunctionWithHash:(id *)a3
{
  os_unfair_lock_s *v5;
  void *v6;

  v5 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v5);
  v6 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, MTLDevice *))(*(_QWORD *)self->_libraryData + 168))(self->_libraryData, a3, self->_device);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4
{
  os_unfair_lock_s *v7;
  void *v8;

  v7 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v7);
  v8 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, id, MTLDevice *))(*(_QWORD *)self->_libraryData + 176))(self->_libraryData, a3, a4, self->_device);
  os_unfair_lock_unlock(v7);
  return v8;
}

- (id)newStitchedFunctionWithHash:(id *)a3
{
  os_unfair_lock_s *v5;
  void *v6;

  v5 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v5);
  v6 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, MTLDevice *))(*(_QWORD *)self->_libraryData + 184))(self->_libraryData, a3, self->_device);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (BOOL)getFunctionAliasAndNameForHash:(id *)a3 functionName:(id *)a4 alias:(id *)a5
{
  os_unfair_lock_s *v9;

  v9 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v9);
  LOBYTE(a5) = (*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, id *, id *))(*(_QWORD *)self->_libraryData + 232))(self->_libraryData, a3, a4, a5);
  os_unfair_lock_unlock(v9);
  return (char)a5;
}

- (BOOL)isStub
{
  return (*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 248))(self->_libraryData);
}

- (id)libraryDataContents
{
  return (id)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 32))(self->_libraryData);
}

- (NSString)overrideTriple
{
  return (NSString *)*((_QWORD *)self->_libraryData + 11);
}

- (void)setOverrideTriple:(id)a3
{
  _QWORD *libraryData;
  id v4;

  libraryData = self->_libraryData;
  if ((id)libraryData[11] != a3)
  {
    v4 = (id)libraryData[11];
    libraryData[11] = objc_msgSend(a3, "copy");

  }
}

- (NSUUID)libraryIdentifier
{
  return (NSUUID *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 112))(self->_libraryData);
}

- (NSArray)specializedFunctionHashes
{
  return (NSArray *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 80))(self->_libraryData);
}

- (NSArray)stitchingFunctionHashes
{
  return (NSArray *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 96))(self->_libraryData);
}

- (NSArray)functionHashes
{
  return (NSArray *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 88))(self->_libraryData);
}

- (NSData)bitcodeData
{
  void *v3;
  unint64_t v4;
  NSData *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(_QWORD *)self->_libraryData + 216))(self->_libraryData, &v8, &v7);
  if (!v7)
    return 0;
  v3 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 32))(self->_libraryData);
  v4 = v7 + v8;
  if (v4 <= objc_msgSend(v3, "length"))
    v5 = (NSData *)objc_msgSend(v3, "subdataWithRange:", v8, v7);
  else
    v5 = 0;

  return v5;
}

- (id)newExternFunctionWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = -[_MTLLibrary newFunctionWithNameInternal:](self, "newFunctionWithNameInternal:");
  v5 = v4;
  if (v4 && objc_msgSend(v4, "functionType") != 4)
  {
    objc_msgSend(v5, "functionType");
    MTLReportFailure(1uLL, "-[_MTLLibrary newExternFunctionWithName:]", 6527, (uint64_t)CFSTR("Function %@ has type %@, expected MTLFunctionTypeExtern."), v7, v8, v9, v10, (uint64_t)a3);
  }
  return v5;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  -[_MTLLibrary newFunctionWithName:constantValues:functionCache:specializedName:completionHandler:](self, "newFunctionWithName:constantValues:functionCache:specializedName:completionHandler:", a3, a4, objc_msgSend(a5, "functionCache"), 0, a6);
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v8;

  v6 = (void *)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_libraryData + 128))(self->_libraryData, a2);
  if (v6)
    return objc_msgSend(v6, "writeToURL:options:error:", a3, 1, a4);
  if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("MTLLibrary is not formatted as a MetalLib file."), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 1, v8);
  }
  return 0;
}

- (int64_t)type
{
  return (*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 288))(self->_libraryData);
}

- (NSString)installName
{
  return (NSString *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_libraryData + 104))(self->_libraryData);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *v6;
  __CFString *v7;
  void *v8;
  NSString *v9;
  const __CFString *v10;
  MTLDevice *device;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[_MTLLibrary functionNames](self, "functionNames");
  v7 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)_MTLLibrary;
  v9 = -[_MTLLibrary description](&v16, sel_description);
  v17[0] = v5;
  v17[1] = CFSTR("label =");
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("<none>");
  v17[2] = v10;
  v17[3] = v5;
  v17[4] = CFSTR("device =");
  device = self->_device;
  if (device)
    v12 = (const __CFString *)-[MTLDevice formattedDescription:](device, "formattedDescription:", v4);
  else
    v12 = CFSTR("<null>");
  v17[5] = v12;
  v17[6] = v5;
  v17[7] = CFSTR("functionNames:");
  if (v6)
    v13 = -[NSArray componentsJoinedByString:](v6, "componentsJoinedByString:", CFSTR(" "));
  else
    v13 = CFSTR("<null>");
  v17[8] = v13;
  v14 = (void *)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 9), "componentsJoinedByString:", CFSTR(" ")));

  return v14;
}

- (NSString)description
{
  return (NSString *)-[_MTLLibrary formattedDescription:](self, "formattedDescription:", 0);
}

- (void)libraryData
{
  return self->_libraryData;
}

- (NSMutableDictionary)functionDictionary
{
  return self->_functionDictionary;
}

- (MTLLibraryContainer)cacheEntry
{
  return self->_cacheEntry;
}

- (BOOL)shaderValidationEnabled
{
  return self->_shaderValidationEnabled;
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
  self->_shaderValidationEnabled = a3;
}

@end
