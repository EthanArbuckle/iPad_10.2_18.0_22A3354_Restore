@implementation VNRPyramid

- (VNRPyramid)initWithMetalDevice:(id)a3 isForDeghosting:(BOOL)a4 width:(unint64_t)a5 height:(unint64_t)a6 nLumaLevels:(unint64_t)a7 nChromaLevels:(unint64_t)a8 lumaStartingLevel:(unint64_t)a9 chromaStartingLevel:(unint64_t)a10
{
  _BOOL4 v14;
  id v16;
  VNRPyramid *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t i;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  VNRPyramid *v30;
  unint64_t v32;
  id *p_isa;
  objc_super v34;

  v14 = a4;
  v16 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNRPyramid;
  v17 = -[VNRPyramid init](&v34, sel_init);
  if (!v17)
  {
    v18 = 0;
    goto LABEL_32;
  }
  if (a7)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a7);
    if (v18)
    {
      if (a8)
        goto LABEL_5;
LABEL_8:
      v19 = 0;
      goto LABEL_9;
    }
LABEL_32:
    v19 = 0;
LABEL_33:
    v23 = 0;
LABEL_34:
    v30 = 0;
    goto LABEL_29;
  }
  v18 = 0;
  if (!a8)
    goto LABEL_8;
LABEL_5:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a8);
  if (!v19)
    goto LABEL_33;
LABEL_9:
  if (v14)
    v20 = 10;
  else
    v20 = 25;
  if (v14)
    v21 = 10;
  else
    v21 = 65;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v20, a5, a6, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
    goto LABEL_34;
  v32 = a5;
  p_isa = (id *)&v17->super.isa;
  objc_msgSend(v22, "setUsage:", 3);
  if (a7)
  {
    for (i = 0; a7 != i; ++i)
    {
      if (i >= a9)
      {
        v25 = objc_msgSend(v16, "newTextureWithDescriptor:", v23);
        if (!v25)
        {
LABEL_30:
          v30 = 0;
          v17 = (VNRPyramid *)p_isa;
          goto LABEL_29;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (void *)v25;
      objc_msgSend(v18, "addObject:", v25);

      objc_msgSend(v23, "setWidth:", (unint64_t)(objc_msgSend(v23, "width") + 1) >> 1);
      objc_msgSend(v23, "setHeight:", (unint64_t)(objc_msgSend(v23, "height") + 1) >> 1);
    }
  }
  objc_msgSend(v23, "setPixelFormat:", v21);
  objc_msgSend(v23, "setWidth:", v32 >> 1);
  objc_msgSend(v23, "setHeight:", a6 >> 1);
  if (a8)
  {
    v27 = 0;
    do
    {
      if (v27 >= a10)
      {
        v28 = objc_msgSend(v16, "newTextureWithDescriptor:", v23);
        if (!v28)
          goto LABEL_30;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v28;
      objc_msgSend(v19, "addObject:", v28);

      objc_msgSend(v23, "setWidth:", (unint64_t)(objc_msgSend(v23, "width") + 1) >> 1);
      objc_msgSend(v23, "setHeight:", (unint64_t)(objc_msgSend(v23, "height") + 1) >> 1);
      ++v27;
    }
    while (a8 != v27);
  }
  v17 = (VNRPyramid *)p_isa;
  objc_storeStrong(p_isa + 1, v18);
  objc_storeStrong(p_isa + 2, v19);
  v30 = p_isa;
LABEL_29:

  return v30;
}

- (NSArray)lumaLevels
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)chromaLevels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromaLevels, 0);
  objc_storeStrong((id *)&self->_lumaLevels, 0);
}

@end
