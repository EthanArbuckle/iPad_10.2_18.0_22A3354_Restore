@implementation ARUndistortionMapping

- (ARUndistortionMapping)initWithImageSize:(CGSize)a3
{
  double height;
  double width;
  ARUndistortionMapping *v5;
  ARUndistortionMapping *v6;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)ARUndistortionMapping;
  v5 = -[ARUndistortionMapping init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_imageSize.width = width;
    v5->_imageSize.height = height;
    std::vector<float>::resize((uint64_t)&v5->_mappingU, (unint64_t)(width * height));
    std::vector<float>::resize((uint64_t)&v6->_mappingV, (unint64_t)(v6->_imageSize.width * v6->_imageSize.height));
  }
  return v6;
}

- (void)createVImageMappingIfNeededForImage:(vImage_Buffer *)a3
{
  void *__p;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!self->_mapping)
  {
    kdebug_trace();
    v8 = 0;
    v9 = 0;
    v7 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v7, self->_mappingU.__begin_, (uint64_t)self->_mappingU.__end_, self->_mappingU.__end_ - self->_mappingU.__begin_);
    __p = 0;
    v5 = 0;
    v6 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, self->_mappingV.__begin_, (uint64_t)self->_mappingV.__end_, self->_mappingV.__end_ - self->_mappingV.__begin_);
    v10 = 0;
    self->_mapping = (vImageMapping *)vImageMapping_CreateFromMap_Image8U();
    if (__p)
    {
      v5 = __p;
      operator delete(__p);
    }
    if (v7)
    {
      v8 = v7;
      operator delete(v7);
    }
    kdebug_trace();
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_mapping)
    vImageMapping_Release();
  v3.receiver = self;
  v3.super_class = (Class)ARUndistortionMapping;
  -[ARUndistortionMapping dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;

  begin = self->_mappingV.__begin_;
  if (begin)
  {
    self->_mappingV.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_mappingU.__begin_;
  if (v4)
  {
    self->_mappingU.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
