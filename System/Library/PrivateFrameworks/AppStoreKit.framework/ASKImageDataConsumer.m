@implementation ASKImageDataConsumer

- (id)objectForData:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  ASKImageDataConsumer *v9;
  double v10;
  double v11;
  ASKImageDataConsumer *v13;
  void *v14;
  void *v15;
  ASKImageDataConsumer *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  ASKImageDataConsumer *v25;
  double v26;
  double v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = !-[ASKImageDataConsumer isLayeredImage](self, "isLayeredImage")
    && -[ASKImageDataConsumer renderIntent](self, "renderIntent") != 1;
  v8 = objc_alloc(MEMORY[0x1E0DC3870]);
  -[ASKImageDataConsumer scale](self, "scale");
  v9 = (ASKImageDataConsumer *)objc_msgSend(v8, "initWithData:scale:", v6);

  if (v9)
  {
    if (v7)
    {
      -[ASKImageDataConsumer size](self, "size");
      if (v11 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        v13 = v9;
      else
        v13 = self;
      -[ASKImageDataConsumer size](v13, "size");
      v18 = v17;
      v20 = v19;
      -[ASKImageDataConsumer imageRendererFormat](v9, "imageRendererFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASKImageDataConsumer scale](self, "scale");
      objc_msgSend(v21, "setScale:");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v18, v20);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __44__ASKImageDataConsumer_objectForData_error___block_invoke;
      v24[3] = &unk_1E9DB1CB0;
      v25 = v9;
      v26 = v18;
      v27 = v20;
      objc_msgSend(v22, "imageWithActions:", v24);
      v16 = (ASKImageDataConsumer *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v9;
    }
  }
  else
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Could not decode image");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ASKImageDataConsumerErrorDomain"), -99, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
  }

  return v16;
}

- (double)scale
{
  return self->_scale;
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

- (int64_t)renderIntent
{
  return self->_renderIntent;
}

- (BOOL)isLayeredImage
{
  return self->_isLayeredImage;
}

- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5 renderIntent:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  ASKImageDataConsumer *result;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)ASKImageDataConsumer;
  result = -[ASKImageDataConsumer init](&v12, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_scale = a4;
    result->_isLayeredImage = a5;
    result->_renderIntent = a6;
  }
  return result;
}

uint64_t __44__ASKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
