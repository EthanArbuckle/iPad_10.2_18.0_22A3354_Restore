@implementation FigMetalHeapAllocator

- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  MTLHeap *heap;
  id v6;
  uint64_t v7;
  uint64_t v8;

  heap = self->_heap;
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v6, "options");

  return (id)-[MTLHeap newBufferWithLength:options:offset:](heap, "newBufferWithLength:options:offset:", v7, v8, a4);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForBufferDescriptor:(id)a3
{
  FigMetalUtils *utils;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  utils = self->_utils;
  v4 = a3;
  -[FigMetalUtils device](utils, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = objc_msgSend(v4, "options");

  v8 = objc_msgSend(v5, "heapBufferSizeAndAlignWithLength:options:", v6, v7);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id v6;
  void *v7;
  MTLHeap *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  MTLHeap *heap;
  void *v15;
  void *v16;
  FigMetalUtils *utils;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v6 = a3;
  if (objc_msgSend(v6, "isLinear"))
  {
    objc_msgSend(v6, "desc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "textureType") == 2)
    {

    }
    else
    {
      objc_msgSend(v6, "desc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "textureType");

      if (v12)
      {
LABEL_6:
        FigSignalErrorAt();
        v10 = 0;
        goto LABEL_9;
      }
    }
    v13 = -[FigMetalHeapAllocator getSizeAndAlignForDescriptor:](self, "getSizeAndAlignForDescriptor:", v6);
    heap = self->_heap;
    objc_msgSend(v6, "desc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)-[MTLHeap newBufferWithLength:options:offset:](heap, "newBufferWithLength:options:offset:", v13, objc_msgSend(v15, "resourceOptions"), a4);

    if (v16)
    {
      utils = self->_utils;
      objc_msgSend(v6, "desc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "width");
      objc_msgSend(v6, "desc");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "height");
      objc_msgSend(v6, "desc");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "pixelFormat");
      objc_msgSend(v6, "desc");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[FigMetalUtils texture2DFromBuffer:width:height:format:offset:usage:](utils, "texture2DFromBuffer:width:height:format:offset:usage:", v16, v19, v21, v23, 0, objc_msgSend(v24, "usage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v8 = self->_heap;
  objc_msgSend(v6, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[MTLHeap newTextureWithDescriptor:offset:](v8, "newTextureWithDescriptor:offset:", v9, a4);

LABEL_9:
  return v10;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForDescriptor:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = a3;
  v5 = objc_msgSend(v4, "isLinear");
  -[FigMetalUtils device](self->_utils, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = objc_msgSend(v6, "heapTextureSizeAndAlignWithDescriptor:", v7);

    -[FigMetalUtils device](self->_utils, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "desc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v6, "heapBufferSizeAndAlignWithLength:options:", v8, objc_msgSend(v7, "resourceOptions"));
  }
  else
  {

    v9 = objc_msgSend(v6, "heapTextureSizeAndAlignWithDescriptor:", v7);
  }
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (unint64_t)bufferOffset:(id)a3
{
  return objc_msgSend(a3, "heapOffset");
}

- (FigMetalHeapAllocator)initWithMetalUtils:(id)a3
{
  id v5;
  FigMetalHeapAllocator *v6;
  FigMetalHeapAllocator *v7;
  FigMetalHeapAllocator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FigMetalHeapAllocator;
  v6 = -[FigMetalHeapAllocator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_utils, a3);
    if (!v7->_utils)
    {
      FigSignalErrorAt();
      v8 = 0;
      goto LABEL_5;
    }
    v7->_alignment = 0;
  }
  v8 = v7;
LABEL_5:

  return v8;
}

- (int)setupWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTLHeap *v8;
  MTLHeap *heap;
  int v10;

  v4 = a3;
  if (objc_msgSend(v4, "memSize"))
  {
    self->_memSize = objc_msgSend(v4, "memSize");
    v5 = (void *)objc_opt_new();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setSize:", self->_memSize);
      objc_msgSend(v6, "setType:", 1);
      objc_msgSend(v6, "setResourceOptions:", objc_msgSend(v4, "resourceOptions"));
      if (objc_msgSend(v4, "memoryPoolId"))
        objc_msgSend(v6, "setMemoryPoolId:", objc_msgSend(v4, "memoryPoolId"));
      if (objc_msgSend(v4, "wireMemory"))
        objc_msgSend(v6, "setResourceOptions:", objc_msgSend(v6, "resourceOptions") | 0x600000);
      -[FigMetalUtils device](self->_utils, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (MTLHeap *)objc_msgSend(v7, "newHeapWithDescriptor:", v6);
      heap = self->_heap;
      self->_heap = v8;

      if (self->_heap)
      {
        v10 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v10 = -1;
      }
    }
    else
    {
      v10 = FigSignalErrorAt();
    }
  }
  else
  {
    v10 = FigSignalErrorAt();
    v6 = 0;
  }

  return v10;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (BOOL)hasCreatedBuffer:(id)a3
{
  MTLHeap *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "heap");
  v4 = (MTLHeap *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self->_heap;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_heap, 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FigMetalHeapAllocator;
  -[FigMetalHeapAllocator dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return CFSTR("FigMetalAllocatorTypeHeap");
}

- (void)purgeResources
{
  MTLHeap *heap;

  heap = self->_heap;
  self->_heap = 0;

}

- (BOOL)hasCreatedTexture:(id)a3
{
  MTLHeap *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "heap");
  v4 = (MTLHeap *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self->_heap;

  return v5;
}

- (unint64_t)textureOffset:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "buffer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "buffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "heapOffset");
    v9 = objc_msgSend(v4, "heapOffset");

    if (v8 != v9)
    {
      fig_log_get_emitter();
      v13 = v3;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
  }
  v10 = objc_msgSend(v4, "heapOffset", v12, v13);

  return v10;
}

- (FigMetalUtils)utils
{
  return self->_utils;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

@end
