@implementation GKImageDataConsumer

- (GKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  GKImageDataConsumer *result;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GKImageDataConsumer;
  result = -[GKImageDataConsumer init](&v10, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_scale = a4;
    result->_isLayeredImage = a5;
  }
  return result;
}

- (id)objectForData:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  GKImageDataConsumer *v9;
  GKImageDataConsumer *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  GKImageDataConsumer *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  GKImageDataConsumer *v25;
  double v26;
  double v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[GKImageDataConsumer isLayeredImage](self, "isLayeredImage");
  v8 = (void *)MEMORY[0x1E0DC3870];
  if (v7)
  {
    -[GKImageDataConsumer scale](self, "scale");
    objc_msgSend(v8, "_gkImageWithCheckedData:scale:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_gkImageWithCheckedData:", v6);
  }
  v9 = (GKImageDataConsumer *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[GKImageDataConsumer isLayeredImage](self, "isLayeredImage"))
    {
      v10 = v9;
    }
    else
    {
      -[GKImageDataConsumer size](self, "size");
      if (v14 == *MEMORY[0x1E0C9D820] && v13 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        v16 = v9;
      else
        v16 = self;
      -[GKImageDataConsumer size](v16, "size");
      v18 = v17;
      v20 = v19;
      v21 = objc_alloc_init(MEMORY[0x1E0DC3830]);
      -[GKImageDataConsumer scale](self, "scale");
      objc_msgSend(v21, "setScale:");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v18, v20);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __43__GKImageDataConsumer_objectForData_error___block_invoke;
      v24[3] = &unk_1E59C4738;
      v25 = v9;
      v26 = v18;
      v27 = v20;
      objc_msgSend(v22, "imageWithActions:", v24);
      v10 = (GKImageDataConsumer *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Could not decode image");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("GKImageDataConsumerErrorDomain"), -99, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

uint64_t __43__GKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)isLayeredImage
{
  return self->_isLayeredImage;
}

@end
