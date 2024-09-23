@implementation ADWorldToImageProjection

- (ADWorldToImageProjection)initWithPose:(__n128)a3 calibration:(__n128)a4
{
  id v8;
  ADWorldToImageProjection *v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  WorldToImageProjection *v18;
  __n128 v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  objc_super v25;
  _QWORD v26[3];
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a7;
  a1[1] = 0;
  v25.receiver = a1;
  v25.super_class = (Class)ADWorldToImageProjection;
  v9 = -[ADWorldToImageProjection init](&v25, sel_init);
  if (v9)
  {
    *((_QWORD *)&v20 + 1) = a2.n128_u32[2];
    v22 = a3.n128_u32[2];
    *(_QWORD *)&v20 = a2.n128_u64[0];
    v21 = a3.n128_u64[0];
    v24 = a4.n128_u32[2];
    v23 = a4.n128_u64[0];
    v19 = a5;
    v10 = v8;
    v26[0] = &off_24C421500;
    v26[1] = v10;
    v27 = v26;
    DisparityToDepth::VioProjectionFactory::create(&v20, (__int128 *)&v19, v26, (uint64_t *)&v18);
    v11 = v27;
    if (v27 == v26)
    {
      v12 = 4;
      v11 = v26;
    }
    else
    {
      if (!v27)
        goto LABEL_7;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_7:
    if (v18)
    {
      v9->_projection = v18;

    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

- (void)projectPoints:(ADWorldToImageProjection *)self count:(SEL)a2
{
  _OWORD *v2;
  unsigned int v3;
  unsigned int v4;
  _OWORD *v5;
  uint64_t v6;
  void *v7;
  __int128 *v8;
  __int128 v9;
  void *__p[3];

  v4 = v3;
  v5 = v2;
  v6 = v3;
  (*((void (**)(void **__return_ptr, WorldToImageProjection *, _OWORD *, _QWORD))self->_projection->var0 + 2))(__p, self->_projection, v2, v3);
  v7 = __p[0];
  if (v4)
  {
    v8 = (__int128 *)__p[0];
    do
    {
      v9 = *v8++;
      *v5++ = v9;
      --v6;
    }
    while (v6);
  }
  else if (!__p[0])
  {
    return;
  }
  __p[1] = v7;
  operator delete(v7);
}

- (void)dealloc
{
  WorldToImageProjection *projection;
  objc_super v4;

  projection = self->_projection;
  if (projection)
    (*((void (**)(WorldToImageProjection *, SEL))projection->var0 + 1))(projection, a2);
  v4.receiver = self;
  v4.super_class = (Class)ADWorldToImageProjection;
  -[ADWorldToImageProjection dealloc](&v4, sel_dealloc);
}

@end
