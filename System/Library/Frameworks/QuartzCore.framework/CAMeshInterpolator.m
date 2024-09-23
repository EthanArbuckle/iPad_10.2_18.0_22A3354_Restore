@implementation CAMeshInterpolator

- (void)dealloc
{
  unsigned int *interp;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  interp = (unsigned int *)self->_interp;
  if (interp)
  {
    v4 = interp + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)interp + 16))(interp, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAMeshInterpolator;
  -[CAMeshTransform dealloc](&v7, sel_dealloc);
}

- (id)meshTransformForLayer:(id)a3
{
  const CA::Rect *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CA::Render::MeshTransform *v9;
  CA::Render::MeshTransform *v10;
  _QWORD *v11;
  float64x2_t v13;
  double v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "bounds");
  v13.f64[0] = v5;
  v13.f64[1] = v6;
  v14 = v7;
  v15 = v8;
  if (v7 < 0.0)
  {
    v13.f64[0] = v7 + v5;
    v14 = -v7;
  }
  if (v8 < 0.0)
  {
    v13.f64[1] = v8 + v6;
    v15 = -v8;
  }
  v9 = CA::Render::MeshTransform::eval_interpolator((CA::Render::MeshTransform *)self->_interp, &v13, v4);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = -[CAMeshTransform _init]([CAMeshTransform alloc], "_init");
  v11[1] = v10;
  v11[2] = *((unsigned int *)v10 + 24);
  v11[3] = *((int *)v10 + 25);
  *((_BYTE *)v11 + 32) = *((_BYTE *)v10 + 108);
  return v11;
}

@end
