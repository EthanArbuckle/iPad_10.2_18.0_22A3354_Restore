@implementation MTLFunctionInternal

void __117___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_sync_completionHandler___block_invoke(uint64_t a1, uint64_t a2, dispatch_data_t data, uint64_t a4)
{
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *subrange;
  size_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _MTLLibrary *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  MTLAirEntry *v23;
  uint64_t v24;
  __n128 v25;
  NSObject *v26;
  size_t v27;
  MTLHashKey buffer_ptr;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v8, "remoteInsertionEnd");
  if (a2)
  {
    if (a4)
    {
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
      if (!v9)
        v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a4, 1);
    }
    else
    {
      v9 = CFSTR("empty error message");
    }
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 3, v13);
    v15 = *(NSObject **)(a1 + 64);
    if (v15)
      dispatch_release(v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v27 = 0;
    buffer_ptr.var0.var0 = 0;
    v10 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v27);
    subrange = 0;
    if ((*(_BYTE *)buffer_ptr.var0.var0 & 1) != 0)
    {
      v12 = *(unsigned int *)(buffer_ptr.var0.var0 + 44);
      if ((_DWORD)v12)
        subrange = dispatch_data_create_subrange(data, *(unsigned int *)(buffer_ptr.var0.var0 + 40), v12);
      else
        subrange = 0;
    }
    dispatch_release(v10);
    v19 = MTLLibraryBuilder::newLibraryWithData(*(_MTLDevice ***)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + 424), *(_MTLDevice **)(*(_QWORD *)(a1 + 40) + 24), subrange, *(_QWORD *)(a1 + 48), 0, v16, v17, v18);
    v20 = -[_MTLLibrary newFunctionWithName:](v19, "newFunctionWithName:", *(_QWORD *)(a1 + 56));
    *(_BYTE *)(v20 + 296) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 296);

    v21 = (void *)objc_msgSend(*(id *)(a1 + 40), "bitcodeData");
    v22 = dispatch_data_create((const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 0, 0);
    v23 = -[MTLAirEntry initWithData:bitcode:airScript:]([MTLAirEntry alloc], "initWithData:bitcode:airScript:", subrange, v22, *(_QWORD *)(a1 + 64));
    dispatch_release(v22);
    dispatch_release(subrange);
    v24 = *(_QWORD *)(a1 + 88);
    v25 = MTLHashKey::MTLHashKey((uint64_t)&buffer_ptr, a1 + 104);
    (*(void (**)(uint64_t, MTLHashKey *, MTLAirEntry *, __n128))(*(_QWORD *)v24 + 112))(v24, &buffer_ptr, v23, v25);
    MTLHashKey::~MTLHashKey(&buffer_ptr);
    v26 = *(NSObject **)(a1 + 64);
    if (*(_QWORD *)(v20 + 360))
    {
      if (v26)
        dispatch_release(v26);
    }
    else
    {
      *(_QWORD *)(v20 + 360) = v26;
    }
    objc_msgSend(*(id *)(a1 + 40), "storeTrackingDataWithDescriptor:function:variantHash:", *(_QWORD *)(a1 + 72), v20, a1 + 104);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

    v14 = 0;
  }

}

id __100___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __77___MTLFunctionInternal_storeTrackingDataWithDescriptor_function_variantHash___block_invoke()
{
  uint64_t result;

  result = MTLGetEnvDefault("MTL_ENABLE_METAL_SCRIPT_COLLECTION", 0);
  -[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::enableMetalScriptCollection = result != 0;
  return result;
}

uint64_t __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, NSObject *);
  void *v8;
  uint64_t v9;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 371))
  {
    v2 = result;
    v3 = (void *)objc_msgSend(*(id *)(v1 + 24), "compiler");
    v4 = *(_QWORD *)(v2 + 32);
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke_2;
    v8 = &unk_1E0FE43E8;
    v9 = v4;
    result = objc_msgSend(v3, "reflectionWithFunction:options:sync:completionHandler:");
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 371) = 1;
  }
  return result;
}

void __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  NSObject *v5;
  MTLArgumentReader *v6;
  void *v7;

  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  v5 = MTLNewReflectionData(a3);
  v6 = ReflectionReaderFactory<MTLStitchingReflectionReader>::Create(0x20000000);
  MTLFragmentReflectionReader::deserialize((uint64_t)v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(*((_QWORD *)v6 + 1) + 8), (*(_DWORD *)(*((_QWORD *)v6 + 1) + 16)- *(_DWORD *)(*((_QWORD *)v6 + 1) + 36)));
  v7 = *(void **)(*((_QWORD *)v6 + 2) + 112);
  if (v7)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v7;
  (*(void (**)(MTLArgumentReader *))(*(_QWORD *)v6 + 8))(v6);
  dispatch_release(v5);
}

@end
