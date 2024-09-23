@implementation PKStrokeRenderMask

- (PKStrokeRenderMask)initWithStroke:(id)a3 renderCache:(id)a4 maskPaths:(const void *)a5
{
  id v9;
  id v10;
  PKStrokeRenderMask *v11;
  PKStrokeRenderMask *v12;
  uint64_t p_maskPaths;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKStrokeRenderMask;
  v11 = -[PKStrokeRenderMask init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    p_maskPaths = (uint64_t)&v11->_maskPaths;
    if (&v12->_maskPaths != a5)
      std::vector<std::vector<ClipperLib::IntPoint>>::__assign_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(p_maskPaths, *(_QWORD *)a5, *((_QWORD *)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3));
    objc_storeStrong((id *)&v12->_stroke, a3);
    objc_storeStrong((id *)&v12->_renderCache, a4);
  }

  return v12;
}

- (const)maskPaths
{
  return &self->_maskPaths;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (PKStrokeRenderCache)renderCache
{
  return self->_renderCache;
}

- (void).cxx_destruct
{
  vector<std::vector<ClipperLib::IntPoint>, std::allocator<std::vector<ClipperLib::IntPoint>>> *p_maskPaths;

  objc_storeStrong((id *)&self->_renderCache, 0);
  objc_storeStrong((id *)&self->_stroke, 0);
  p_maskPaths = &self->_maskPaths;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_maskPaths);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
