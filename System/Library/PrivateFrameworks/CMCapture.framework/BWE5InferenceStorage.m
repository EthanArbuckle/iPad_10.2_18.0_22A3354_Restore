@implementation BWE5InferenceStorage

- (void)clear
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWE5InferenceStorage;
  -[BWInferenceProviderStorage clear](&v2, sel_clear);
}

- (BWE5InferenceStorage)initWithOperation:(e5rt_execution_stream_operation *)a3 stream:(e5rt_execution_stream *)a4 bindingNameByRequirement:(id)a5 requirementsNeedingPixelBuffers:(id)a6 requirementsNeedingPixelBufferPools:(id)a7 requirementsNeedingTensors:(id)a8
{
  BWE5InferenceStorage *v12;
  BWE5InferenceStorage *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWE5InferenceStorage;
  v12 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v17, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a6, a7);
  v13 = v12;
  if (v12)
  {
    v12->_operation = a3;
    v12->_stream = a4;
    v12->_bindingNameByRequirement = (NSDictionary *)objc_msgSend(a5, "copy");
    v14 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v15 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 259);
    v13->_tensorPortByRequirement = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v14, v15, objc_msgSend(a8, "count"));
  }
  return v13;
}

- (void)dealloc
{
  NSEnumerator *v3;
  NSEnumerator *v4;
  objc_super v5;

  e5rt_execution_stream_operation_release();
  e5rt_execution_stream_release();
  v3 = -[NSMapTable objectEnumerator](self->_tensorPortByRequirement, "objectEnumerator");
  v4 = v3;
  while (-[NSEnumerator nextObject](v3, "nextObject"))
  {
    e5rt_io_port_release();
    v3 = v4;
  }

  v5.receiver = self;
  v5.super_class = (Class)BWE5InferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v5, sel_dealloc);
}

- (id)bindingNameForRequirement:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_bindingNameByRequirement, "objectForKeyedSubscript:", a3);
}

- (e5rt_io_port)tensorPortForRequirement:(id)a3
{
  return (e5rt_io_port **)-[NSMapTable objectForKey:](self->_tensorPortByRequirement, "objectForKey:", a3);
}

- (void)setTensorPort:(e5rt_io_port *)a3 forRequirement:(id)a4
{
  if (-[NSMapTable objectForKey:](self->_tensorPortByRequirement, "objectForKey:", a4))
    e5rt_io_port_release();
  -[NSMapTable setObject:forKey:](self->_tensorPortByRequirement, "setObject:forKey:", a3, a4);
}

- (void)_newPackedFloat32SurfaceForRequirement:(_BOOL8 *)a3 elementCount:
{
  _BOOL8 v4;

  if (result)
  {
    v4 = !objc_msgSend(result, "tensorPortForRequirement:", a2)
      || e5rt_io_port_retain_tensor_desc()
      || e5rt_io_port_retain_buffer_object()
      || e5rt_tensor_desc_get_rank();
    if (a3)
      *a3 = v4;
    return 0;
  }
  return result;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5;
  void *v6;
  __IOSurface *v7;
  __IOSurface *v8;
  _DWORD *BaseAddress;
  int v10;
  int v11;
  id v12;
  void *v13;
  double v14;
  unint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t i;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  unint64_t v28;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(a3, "metadataKeys");
  v28 = 0;
  v7 = (__IOSurface *)-[BWE5InferenceStorage _newPackedFloat32SurfaceForRequirement:elementCount:](self, (uint64_t)a3, (_BOOL8 *)&v28);
  if (!v7)
  {
    FigDebugAssert3();
    return v5;
  }
  v8 = v7;
  BaseAddress = IOSurfaceGetBaseAddress(v7);
  v10 = objc_msgSend(a3, "mappingOption");
  v11 = v10;
  if (!v10 || v10 == 2)
  {
    v19 = objc_msgSend(v6, "count");
    if (v19 >= v28)
      v20 = v28;
    else
      v20 = v19;
    if (!v20)
      goto LABEL_22;
    for (i = 0; i != v20; ++i)
    {
      v22 = objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      LODWORD(v23) = BaseAddress[i];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), v22);
    }
    if (v11 != 2 || v28 <= v20)
      goto LABEL_22;
    v24 = objc_msgSend(v6, "objectAtIndexedSubscript:", v20 - 1);
    v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v25, 0);
    while (v20 < v28)
    {
      LODWORD(v26) = BaseAddress[v20];
      objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26));
      ++v20;
    }
    v17 = v5;
    v18 = v13;
    v16 = v24;
    goto LABEL_21;
  }
  if (v10 == 1)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = (void *)objc_msgSend(v12, "initWithCapacity:", v28);
    if (v28)
    {
      for (j = 0; j < v28; ++j)
      {
        LODWORD(v14) = BaseAddress[j];
        objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14));
      }
    }
    v16 = objc_msgSend(v6, "firstObject");
    v17 = v5;
    v18 = v13;
LABEL_21:
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v16);

  }
LABEL_22:
  CFRelease(v8);
  return v5;
}

- (e5rt_execution_stream_operation)operation
{
  return self->_operation;
}

- (e5rt_execution_stream)stream
{
  return self->_stream;
}

@end
