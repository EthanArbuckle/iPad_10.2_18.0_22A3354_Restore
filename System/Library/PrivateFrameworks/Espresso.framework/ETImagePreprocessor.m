@implementation ETImagePreprocessor

- (ETImagePreprocessor)initWithImagePreprocessParams:(id)a3
{
  id v4;
  ETImagePreprocessor *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  blob_cpu *ptr;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *imageShape;
  CFStringRef *v27;
  CGColorSpaceRef v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  _BYTE v41[12];
  int v42;
  __int128 v43;
  void *__p[2];
  uint64_t v45;
  int v46;
  objc_super v47;
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ETImagePreprocessor;
  v5 = -[ETImagePreprocessor init](&v47, sel_init);
  if (v5)
  {
    v46 = 0;
    Espresso::create_context(&v46, &v40);
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v5->ctx, (__int128 *)&v40);
    v6 = *(std::__shared_weak_count **)v41;
    if (*(_QWORD *)v41)
    {
      v7 = (unint64_t *)(*(_QWORD *)v41 + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v9 = operator new(0x118uLL);
    v9[1] = 0;
    v9[2] = 0;
    *v9 = &off_1E2DC1868;
    v40 = Espresso::blob_cpu::blob_cpu((uint64_t)(v9 + 3), &v5->ctx.__ptr_, 0);
    *(_QWORD *)v41 = v9;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v5->imageBlob, (__int128 *)&v40);
    v10 = *(std::__shared_weak_count **)v41;
    if (*(_QWORD *)v41)
    {
      v11 = (unint64_t *)(*(_QWORD *)v41 + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = objc_msgSend(v4, "width");
    v14 = objc_msgSend(v4, "height");
    v15 = objc_msgSend(v4, "channels");
    v45 = 0;
    *(_OWORD *)__p = 0u;
    v43 = 0u;
    v40 = __PAIR64__(v14, v13);
    *(_DWORD *)v41 = v15;
    *(_QWORD *)&v41[4] = 0x100000001;
    v42 = -1;
    ptr = v5->imageBlob.__ptr_;
    v38 = 0;
    v39 = 0;
    (*(void (**)(blob_cpu *, uint64_t *, uint64_t *))(*(_QWORD *)ptr + 16))(ptr, &v40, &v38);
    v17 = v39;
    if (v39)
    {
      p_shared_owners = (unint64_t *)&v39->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = objc_msgSend(v4, "channels");
    v21 = 4;
    if (v20 <= 2)
      v21 = 1;
    v5->nChannels = v21;
    v48[0] = &unk_1E2DEDA48;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v4, "channels"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v4, "height"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v4, "width"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v25 = objc_claimAutoreleasedReturnValue();
    imageShape = v5->imageShape;
    v5->imageShape = (NSArray *)v25;

    v27 = (CFStringRef *)MEMORY[0x1E0C9DA10];
    if (v5->nChannels != 4)
      v27 = (CFStringRef *)MEMORY[0x1E0C9D978];
    v28 = CGColorSpaceCreateWithName(*v27);
    v5->bytesPerPixel = v5->nChannels;
    v5->bitsPerComponent = 8;
    v5->colorSpace = v28;
    v29 = malloc_type_malloc(v5->bytesPerPixel * objc_msgSend(v4, "width") * objc_msgSend(v4, "height"), 0x14E4FF2FuLL);
    v30 = objc_msgSend(v4, "height");
    v31 = objc_msgSend(v4, "width");
    v32 = v5->bytesPerPixel * objc_msgSend(v4, "width");
    v5->targetBuffer.data = v29;
    v5->targetBuffer.height = v30;
    v5->targetBuffer.width = v31;
    v5->targetBuffer.rowBytes = v32;
    v5->param.is_network_bgr = objc_msgSend(v4, "network_wants_bgr");
    objc_msgSend(v4, "bias_r");
    v5->param.bias_r = v33;
    objc_msgSend(v4, "bias_g");
    v5->param.bias_g = v34;
    objc_msgSend(v4, "bias_b");
    v5->param.bias_b = v35;
    objc_msgSend(v4, "scale");
    v5->param.scale = v36;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

  return v5;
}

- (id)tensorWithCGImage:(CGImage *)a3
{
  abstract_context *ptr;
  ETDataTensor *v5;
  _QWORD v7[5];

  -[ETImagePreprocessor loadSrcBufferWithCGImage:](self, "loadSrcBufferWithCGImage:", a3);
  -[ETImagePreprocessor preprocess](self, "preprocess");
  ptr = self->ctx.__ptr_;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ETImagePreprocessor_tensorWithCGImage___block_invoke;
  v7[3] = &unk_1E2DD3720;
  v7[4] = self;
  Espresso::abstract_context::compute_batch_sync(ptr, v7);
  if (!*(_QWORD *)(*((_QWORD *)self->imageBlob.__ptr_ + 20) + 24))
    return 0;
  v5 = [ETDataTensor alloc];
  return -[ETDataTensor initWithData:type:shape:strides:](v5, "initWithData:type:shape:strides:", *(_QWORD *)(*((_QWORD *)self->imageBlob.__ptr_ + 20) + 24), 2, self->imageShape, MEMORY[0x1E0C9AA60]);
}

- (id)tensorWithPath:(id)a3
{
  id v4;
  CGDataProvider *v5;
  void *v6;
  void *v7;
  int v8;
  CGImageRef v9;
  CGImage *v10;
  void *v11;

  v4 = objc_retainAutorelease(a3);
  v5 = CGDataProviderCreateWithFilename((const char *)objc_msgSend(v4, "UTF8String"));
  if (!v5)
    Espresso::throw_exception_selector<Espresso::io_error,char const*>("Cannot load image with path %s", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  objc_msgSend(v4, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("png")))
  {

  }
  else
  {
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PNG"));

    if (!v8)
    {
      v9 = CGImageCreateWithJPEGDataProvider(v5, 0, 0, kCGRenderingIntentDefault);
      goto LABEL_7;
    }
  }
  v9 = CGImageCreateWithPNGDataProvider(v5, 0, 0, kCGRenderingIntentDefault);
LABEL_7:
  v10 = v9;
  -[ETImagePreprocessor tensorWithCGImage:](self, "tensorWithCGImage:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v10);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->colorSpace);
  free(self->targetBuffer.data);
  free(self->srcBuffer.data);
  v3.receiver = self;
  v3.super_class = (Class)ETImagePreprocessor;
  -[ETImagePreprocessor dealloc](&v3, sel_dealloc);
}

- (void)preprocess
{
  vImagePixelCount height;
  vImagePixelCount width;
  size_t rowBytes;
  vImagePixelCount v5;
  vImage_Buffer v6;

  height = self->srcBuffer.height;
  width = self->srcBuffer.width;
  rowBytes = self->srcBuffer.rowBytes;
  if (width >= height)
    v5 = self->srcBuffer.height;
  else
    v5 = self->srcBuffer.width;
  v6.data = (char *)self->srcBuffer.data + rowBytes * ((height - v5) >> 1) + self->bytesPerPixel * ((width - v5) >> 1);
  v6.height = v5;
  v6.width = v5;
  v6.rowBytes = rowBytes;
  vImageScale_ARGB8888(&v6, &self->targetBuffer, 0, 0);
}

- (void)loadSrcBufferWithCGImage:(CGImage *)a3
{
  int Width;
  int Height;
  unsigned int v7;
  unint64_t v8;
  unint64_t currentSrcBufferSize;
  unint64_t v10;
  void *data;
  size_t v12;
  CGContext *v13;
  uint8_t permuteMap[4];
  CGRect v15;

  if (a3)
  {
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    if (Width >= 1)
    {
      v7 = Height;
      if (Height >= 1)
      {
        v8 = self->nChannels * Width * Height;
        currentSrcBufferSize = self->currentSrcBufferSize;
        if (v8 <= currentSrcBufferSize)
        {
          data = self->srcBuffer.data;
        }
        else
        {
          if (currentSrcBufferSize)
          {
            free(self->srcBuffer.data);
            currentSrcBufferSize = 2 * self->currentSrcBufferSize;
          }
          if (v8 <= currentSrcBufferSize)
            v10 = currentSrcBufferSize;
          else
            v10 = v8;
          self->currentSrcBufferSize = v10;
          data = malloc_type_malloc(v10, 0x2D98B55AuLL);
          self->srcBuffer.data = data;
        }
        v12 = self->bytesPerPixel * Width;
        v13 = CGBitmapContextCreate(data, Width, v7, self->bitsPerComponent, v12, self->colorSpace, 0x4001u);
        v15.size.width = (double)Width;
        v15.size.height = (double)(int)v7;
        v15.origin.x = 0.0;
        v15.origin.y = 0.0;
        CGContextDrawImage(v13, v15, a3);
        self->srcBuffer.height = v7;
        self->srcBuffer.width = Width;
        self->srcBuffer.rowBytes = v12;
        *(_DWORD *)permuteMap = 50331906;
        vImagePermuteChannels_ARGB8888(&self->srcBuffer, &self->srcBuffer, permuteMap, 0);
        CGContextRelease(v13);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageShape, 0);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->ctx);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->imageBlob);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 1065353216;
  *(_QWORD *)((char *)self + 28) = 0;
  *(_QWORD *)((char *)self + 20) = 0;
  *((_DWORD *)self + 9) = 0;
  *(_QWORD *)((char *)self + 12) = 0x100000000;
  *((_DWORD *)self + 20) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *((_QWORD *)self + 7) = _D0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

void __41__ETImagePreprocessor_tensorWithCGImage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  void *__p;
  void *v10;
  _OWORD *v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(int **)(v3 + 88);
  v7 = *(_OWORD *)(v3 + 160);
  v8 = *(_OWORD *)(v3 + 176);
  v5 = operator new(0x20uLL);
  v10 = v5 + 2;
  v11 = v5 + 2;
  *v5 = v7;
  v5[1] = v8;
  __p = v5;
  Espresso::fill_blob_with_images_batch_safe_v2(a2, v4, (const char ***)&__p, *(unsigned int *)(v3 + 120), v6, (__int128 *)(v3 + 8));
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
}

@end
