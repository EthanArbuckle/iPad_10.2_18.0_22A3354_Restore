@implementation _MTLFunction

- (id)vendorPrivate
{
  return self->_vendorPrivate;
}

- (unint64_t)functionType
{
  return self->_functionType;
}

- (void)dealloc
{
  void *libraryData;
  MTLDebugInstrumentationData *debugInstrumentationData;
  objc_super v5;

  self->_device = 0;
  self->_vendorPrivate = 0;

  self->_name = 0;
  self->_vertexAttributes = 0;

  self->_arguments = 0;
  self->_returnType = 0;
  libraryData = self->_libraryData;
  if (libraryData)
  {
    (*(void (**)(void *))(*(_QWORD *)libraryData + 24))(libraryData);
    self->_libraryData = 0;
  }

  self->_unpackedFilePath = 0;
  debugInstrumentationData = self->_debugInstrumentationData;
  if (debugInstrumentationData)

  v5.receiver = self;
  v5.super_class = (Class)_MTLFunction;
  -[_MTLObjectWithLabel dealloc](&v5, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  return -[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:functionReflection:](self, "newArgumentEncoderWithBufferIndex:reflection:functionReflection:", a3, a4, -[_MTLFunction reflectionWithOptions:binaryArchives:](self, "reflectionWithOptions:binaryArchives:", 3, a5));
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  v7 = (void *)-[MTLDevice compiler](self->_device, "compiler");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___MTLFunction_reflectionWithOptions_binaryArchives___block_invoke;
  v10[3] = &unk_1E0FE4398;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  objc_msgSend(v7, "reflectionWithFunction:options:sync:binaryArchives:completionHandler:", self, a3, 1, a4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)setVendorPrivate:(id)a3
{
  id v5;

  v5 = a3;

  self->_vendorPrivate = a3;
}

- (_MTLFunction)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 device:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  _MTLFunction *v13;
  id v14;
  id v15;
  const __CFString *v17;
  unint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  unint64_t v21;
  uint64_t v22;
  objc_super v23;

  if (!a3)
  {
    v17 = CFSTR("name must not be nil.");
    v18 = 0;
    v19 = 9999;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = CFSTR("name is not a NSString.");
    v18 = 1;
    v19 = 10002;
LABEL_10:
    MTLReportFailure(v18, "-[_MTLFunction initWithName:type:libraryData:device:]", v19, (uint64_t)v17, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
    if (a6)
      goto LABEL_4;
LABEL_11:
    v20 = CFSTR("device must not be nil.");
    v21 = 0;
    v22 = 10005;
    goto LABEL_13;
  }
  if (!a6)
    goto LABEL_11;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v20 = CFSTR("device is not a MTLDevice.");
  v21 = 1;
  v22 = 10008;
LABEL_13:
  MTLReportFailure(v21, "-[_MTLFunction initWithName:type:libraryData:device:]", v22, (uint64_t)v20, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
LABEL_5:
  if (a4 - 1 >= 8)
    MTLReportFailure(0, "validateMTLFunctionType", 9910, (uint64_t)CFSTR("type is not a valid MTLFunctionType."), (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)v23.receiver);
  v23.receiver = self;
  v23.super_class = (Class)_MTLFunction;
  v13 = -[_MTLObjectWithLabel init](&v23, sel_init);
  v13->_device = (MTLDevice *)a6;
  v14 = a6;
  v13->_libraryData = a5;
  (*(void (**)(void *))(*(_QWORD *)a5 + 16))(a5);
  v13->_vendorPrivate = 0;
  v13->_functionType = a4;
  v13->_vertexAttributes = 0;
  v13->_returnType = 0;
  v13->_arguments = 0;
  v13->_name = (NSString *)a3;
  v15 = a3;
  return v13;
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 functionReflection:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  id v20;

  if (!objc_msgSend((id)objc_msgSend(a5, "arguments"), "count"))
    goto LABEL_6;
  v13 = 0;
  while (1)
  {
    v14 = (void *)objc_msgSend((id)objc_msgSend(a5, "arguments"), "objectAtIndexedSubscript:", v13);
    if (!objc_msgSend(v14, "type") && objc_msgSend(v14, "index") == a3)
      break;
    if (++v13 >= (unint64_t)objc_msgSend((id)objc_msgSend(a5, "arguments"), "count"))
      goto LABEL_6;
  }
  v17 = v14;
  if (v17)
  {
    v18 = v17;
    v19 = (void *)-[MTLDevice newIndirectArgumentBufferLayoutWithStructType:](self->_device, "newIndirectArgumentBufferLayoutWithStructType:", objc_msgSend(v17, "bufferStructType"));
    objc_msgSend(v19, "setStructType:withDevice:", objc_msgSend(v18, "bufferStructType"), self->_device);
    v15 = (void *)-[MTLDevice newArgumentEncoderWithLayout:](self->_device, "newArgumentEncoderWithLayout:", v19);
    if (a4)
    {
      *a4 = v18;
      _MTLFixIABReflectionOffsetsWithLayout(v18, v19, self->_device);
    }

    v20 = v18;
  }
  else
  {
LABEL_6:
    MTLReportFailure(0, "-[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:functionReflection:]", 10287, (uint64_t)CFSTR("bufferIndex %lu does not identify an argument buffer"), v9, v10, v11, v12, a3);
    return 0;
  }
  return v15;
}

- (void)libraryData
{
  return self->_libraryData;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return -[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:", a3, 0, 0);
}

- (unsigned)functionRef
{
  return 0;
}

- (const)bitCodeHash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction bitCodeHash]", 10051, (uint64_t)CFSTR("Unreachable code"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bitCodeFileSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction bitCodeFileSize]", 10057, (uint64_t)CFSTR("Unreachable code"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unsigned)requiredLLVMVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction requiredLLVMVersion]", 10064, (uint64_t)CFSTR("Unreachable code"), v2, v3, v4, v5, vars0);
  return 0;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction newFunctionWithPluginData:bitcodeType:]", 10072, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, vars0);
  return 0;
}

- (NSDictionary)functionConstantsDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction functionConstantsDictionary]", 10137, (uint64_t)CFSTR("Unreachable code"), v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *name;
  const __CFString *v14;
  MTLDevice *device;
  const __CFString *v16;
  unint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  objc_super v21;
  _QWORD v22[13];

  v22[12] = *MEMORY[0x1E0C80C00];
  v5 = a3 + 4;
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 5, CFSTR(" "), 0);
  v8 = (void *)-[_MTLFunction stageInputAttributes](self, "stageInputAttributes");
  if (v8)
  {
    v9 = (void *)objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v10 = objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet")), "componentsJoinedByString:", v7);
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)_MTLFunction;
  v12 = -[_MTLFunction description](&v21, sel_description);
  name = self->_name;
  v22[0] = v6;
  v22[1] = CFSTR("name =");
  if (name)
    v14 = (const __CFString *)name;
  else
    v14 = CFSTR("<none>");
  v22[2] = v14;
  v22[3] = v6;
  v22[4] = CFSTR("device =");
  device = self->_device;
  if (device)
    v16 = (const __CFString *)-[MTLDevice formattedDescription:](device, "formattedDescription:", v5);
  else
    v16 = CFSTR("<null>");
  v22[5] = v16;
  v22[6] = v6;
  v22[7] = CFSTR("functionType =");
  v17 = self->_functionType - 1;
  if (v17 > 7)
    v18 = CFSTR("Unknown");
  else
    v18 = (const __CFString *)*((_QWORD *)&off_1E0FE4A78 + v17);
  v22[8] = v18;
  v22[9] = v6;
  if (v10)
    v19 = (const __CFString *)v10;
  else
    v19 = CFSTR("<none>");
  v22[10] = CFSTR("attributes:");
  v22[11] = v19;
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 12), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[_MTLFunction formattedDescription:](self, "formattedDescription:", 0);
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  return -[_MTLFunction reflectionWithOptions:pipelineLibrary:](self, "reflectionWithOptions:pipelineLibrary:", a3, 0);
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  v7 = (void *)-[MTLDevice compiler](self->_device, "compiler");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___MTLFunction_reflectionWithOptions_pipelineLibrary___block_invoke;
  v10[3] = &unk_1E0FE4398;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  objc_msgSend(v7, "reflectionWithFunction:options:sync:pipelineLibrary:completionHandler:", self, a3, 1, a4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  void *v7;
  _QWORD v8[7];

  v7 = (void *)-[MTLDevice compiler](self->_device, "compiler");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___MTLFunction_reflectionWithOptions_completionHandler___block_invoke;
  v8[3] = &unk_1E0FE43C0;
  v8[5] = a4;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v7, "reflectionWithFunction:options:sync:completionHandler:", self, a3, 0, v8);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return -[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:", a3, a4, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return -[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:", a3, 0, a4);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  return -[_MTLFunction newArgumentEncoderWithBufferIndex:reflection:functionReflection:](self, "newArgumentEncoderWithBufferIndex:reflection:functionReflection:", a3, a4, -[_MTLFunction reflectionWithOptions:pipelineLibrary:](self, "reflectionWithOptions:pipelineLibrary:", 3, a5));
}

- (id)bitcodeData
{
  return (id)-[_MTLFunction bitcodeDataInternal](self, "bitcodeDataInternal");
}

- (const)functionConstantSpecializationHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_functionConstantSpecializationHash;
}

- (MTLFunctionHandle)functionHandle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLFunction functionHandle]", 10334, (uint64_t)CFSTR("Driver needs to override this"), v2, v3, v4, v5, vars0);
  return 0;
}

- (NSString)unpackedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUnpackedFilePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (unint64_t)options
{
  return self->_options;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSArray)importedSymbols
{
  return self->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_importedLibraries;
}

@end
