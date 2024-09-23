@implementation CMISmartStyleColorCubePoolV1

- (CMISmartStyleColorCubePoolV1)initWithDevice:(id)a3 andAllocator:(id)a4
{
  id v7;
  id v8;
  CMISmartStyleColorCubePoolV1 *v9;
  id *p_isa;
  CMISmartStyleColorCubePoolV1 *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CMISmartStyleColorCubePoolV1;
  v9 = -[CMISmartStyleColorCubePoolV1 init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9 && v7 && (objc_storeStrong((id *)&v9->_device, a3), v8))
  {
    objc_storeStrong(p_isa + 2, a4);
    v11 = p_isa;
  }
  else
  {
    FigDebugAssert3();
    v11 = 0;
  }

  return v11;
}

+ (unint64_t)requiredAllocatorSizeForCapacity:(unint64_t)a3 pixelFormat:(unint64_t)a4 dimension:(unint64_t)a5 device:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v9 = a6;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTextureType:", 7);
  objc_msgSend(v10, "setPixelFormat:", a4);
  objc_msgSend(v10, "setWidth:", a5);
  objc_msgSend(v10, "setHeight:", a5);
  objc_msgSend(v10, "setDepth:", a5);
  objc_msgSend(v10, "setUsage:", 7);
  v11 = objc_msgSend(v9, "heapTextureSizeAndAlignWithDescriptor:", v10);
  v13 = v12;

  return 2 * a3 * (v11 + (v13 >> 1)) / v13 * v13;
}

- (int)configureForCapacity:(unint64_t)a3 pixelFormat:(unint64_t)a4 dimension:(unint64_t)a5
{
  unint64_t v9;

  self->_pixelFormat = a4;
  self->_dimension = a5;
  v9 = -[FigMetalAllocator memSize](self->_allocator, "memSize");
  if (v9 < objc_msgSend((id)objc_opt_class(), "requiredAllocatorSizeForCapacity:pixelFormat:dimension:device:", a3, a4, a5, self->_device))FigDebugAssert3();
  else
    self->_counter = 0;
  return 0;
}

- (id)newColorCube
{
  void *v3;
  void *v4;
  CMISmartStyleColorCubeV1 *v5;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleColorCube_%lu_BG"), self->_counter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CMISmartStyleColorCubePoolV1 _newColorCubeTextureWithLabel:](self, "_newColorCubeTextureWithLabel:", v3);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleColorCube_%lu_FG"), self->_counter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CMISmartStyleColorCubePoolV1 _newColorCubeTextureWithLabel:](self, "_newColorCubeTextureWithLabel:", v4);

  v5 = -[CMISmartStyleColorCubeV1 initWithBackgroundCube:foregroundCube:]([CMISmartStyleColorCubeV1 alloc], "initWithBackgroundCube:foregroundCube:", v8, v7);
  if (v5)
    ++self->_counter;
  else
    FigDebugAssert3();
  FigMetalDecRef(&v8);
  FigMetalDecRef(&v7);

  return v5;
}

- (id)_newColorCubeTextureWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t pixelFormat;
  void *v8;
  unint64_t dimension;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = -[FigMetalAllocator newTextureDescriptor](self->_allocator, "newTextureDescriptor", a3);
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "setLabel:", 0);
  objc_msgSend(v5, "desc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextureType:", 7);

  pixelFormat = self->_pixelFormat;
  objc_msgSend(v5, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPixelFormat:", pixelFormat);

  dimension = self->_dimension;
  objc_msgSend(v5, "desc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWidth:", dimension);

  v11 = self->_dimension;
  objc_msgSend(v5, "desc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeight:", v11);

  v13 = self->_dimension;
  objc_msgSend(v5, "desc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDepth:", v13);

  objc_msgSend(v5, "desc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUsage:", 7);

  v16 = -[FigMetalAllocator newTextureWithDescriptor:](self->_allocator, "newTextureWithDescriptor:", v5);
  if (!v16)
  {
LABEL_4:
    FigDebugAssert3();
    FigSignalErrorAt();
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
