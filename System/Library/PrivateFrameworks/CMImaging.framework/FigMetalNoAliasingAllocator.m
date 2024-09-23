@implementation FigMetalNoAliasingAllocator

- (FigMetalNoAliasingAllocator)initWithMetalUtils:(id)a3
{
  id v5;
  FigMetalNoAliasingAllocator *v6;
  FigMetalNoAliasingAllocator *v7;
  FigMetalNoAliasingAllocator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FigMetalNoAliasingAllocator;
  v6 = -[FigMetalNoAliasingAllocator init](&v10, sel_init);
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
    v7->_memSize = 0;
  }
  v8 = v7;
LABEL_5:

  return v8;
}

- (id)description
{
  return CFSTR("FigMetalAllocatorTypeNoAliasing");
}

- (int)setupWithDescriptor:(id)a3
{
  return 0;
}

- (BOOL)hasCreatedTexture:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "iosurface"))
  {
    objc_msgSend(v4, "buffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasCreatedBuffer:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "iosurface"))
  {
    objc_msgSend(v4, "heap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  FigMetalUtils *utils;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = a3;
  objc_msgSend(v4, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "height");
  utils = self->_utils;
  objc_msgSend(v4, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "width");
  objc_msgSend(v4, "desc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FigMetalUtils computeLinearTextureStride:format:](utils, "computeLinearTextureStride:format:", v9, objc_msgSend(v10, "pixelFormat"))* v6;
  v12 = v11;
  v13 = 0;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForBufferDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = objc_msgSend(a3, "length");
  v4 = 0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  FigMetalUtils *utils;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  utils = self->_utils;
  v5 = a3;
  -[FigMetalUtils device](utils, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v5, "options");

  v9 = (void *)objc_msgSend(v6, "newBufferWithLength:options:", v7, v8);
  return v9;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  FigMetalUtils *utils;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  utils = self->_utils;
  v5 = a3;
  -[FigMetalUtils device](utils, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "newTextureWithDescriptor:", v7);
  return v8;
}

- (unint64_t)textureOffset:(id)a3
{
  return 0;
}

- (unint64_t)bufferOffset:(id)a3
{
  return 0;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (FigMetalUtils)utils
{
  return self->_utils;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utils, 0);
}

@end
