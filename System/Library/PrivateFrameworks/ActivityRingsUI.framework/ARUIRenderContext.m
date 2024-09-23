@implementation ARUIRenderContext

- (double)drawableSize
{
  return *(double *)(a1 + 88);
}

- (BOOL)opaque
{
  return LOBYTE(self->_screenScale);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFloat2:", *(double *)&self->_drawableSize[4]);
  objc_msgSend(v3, "appendBool:", LOBYTE(self->_screenScale));
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (float)screenScale
{
  return *(float *)self->_drawableSize;
}

- (__n128)skewAdjustmentMatrix
{
  return a1[1];
}

- (float)drawableDiameter
{
  return self->_drawableDiameter;
}

- (BOOL)presentsWithTransaction
{
  return BYTE1(self->_screenScale);
}

- (void)setOpaque:(BOOL)a3
{
  LOBYTE(self->_screenScale) = a3;
}

- (ARUIRenderContext)initWithSize:(CGSize)a3
{
  void *v4;
  double v5;
  float64x2_t v6;
  float v8;
  CGFloat width;
  CGFloat height;

  width = a3.width;
  height = a3.height;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  *(float *)&v5 = v5;
  v8 = *(float *)&v5;

  v6.f64[0] = width;
  v6.f64[1] = height;
  return -[ARUIRenderContext initWithDrawableSize:](self, "initWithDrawableSize:", COERCE_DOUBLE(vmul_n_f32(vcvt_f32_f64(v6), v8)));
}

- (ARUIRenderContext)initWithDrawableSize:(ARUIRenderContext *)self
{
  uint64_t v2;
  ARUIRenderContext *v3;
  void *v4;
  double v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v14;
  objc_super v15;

  v14 = v2;
  v15.receiver = self;
  v15.super_class = (Class)ARUIRenderContext;
  v3 = -[ARUIRenderContext init](&v15, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    *(float *)&v5 = v5;
    *(_DWORD *)v3->_drawableSize = LODWORD(v5);

    *(_QWORD *)&v3->_drawableSize[4] = v14;
    LOWORD(v3->_screenScale) = 1;
    if (ARUIFloatEqual(*(float *)&v14, *((float *)&v14 + 1)))
    {
      LODWORD(v3->_drawableDiameter) = v14;
      v6 = MEMORY[0x24BDAEE00];
      v7 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)&v3->_anon_10[4] = *MEMORY[0x24BDAEE00];
      *(_OWORD *)&v3->_anon_10[20] = v7;
      v8 = *(_OWORD *)(v6 + 48);
      *(_OWORD *)&v3->_anon_10[36] = *(_OWORD *)(v6 + 32);
      *(_OWORD *)&v3->_anon_10[52] = v8;
    }
    else
    {
      if (ARUIFloatGreater(*((float *)&v14 + 1), *(float *)&v14))
      {
        LODWORD(v3->_drawableDiameter) = v14;
        *(double *)&v9 = matrix_float4x4_scale_y();
      }
      else
      {
        v3->_drawableDiameter = *((float *)&v14 + 1);
        matrix_float4x4_scale_x();
      }
      *(_OWORD *)&v3->_anon_10[4] = v9;
      *(_OWORD *)&v3->_anon_10[20] = v10;
      *(_OWORD *)&v3->_anon_10[36] = v11;
      *(_OWORD *)&v3->_anon_10[52] = v12;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float32x2_t v6;
  float32x2_t v7;
  int screenScale_low;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = *(float32x2_t *)&self->_drawableSize[4];
    objc_msgSend(v5, "drawableSize");
    if (ARUIFloat2Equal(v6, v7))
    {
      screenScale_low = LOBYTE(self->_screenScale);
      v9 = screenScale_low == objc_msgSend(v5, "opaque");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", LOBYTE(self->_screenScale), CFSTR("opaque"));
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("drawableSize.x"), COERCE_FLOAT(*(_QWORD *)&self->_drawableSize[4]));
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("drawableSize.y"), *(float *)&self->_drawableSize[8]);
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("screenScale"), *(float *)self->_drawableSize);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", BYTE1(self->_screenScale), CFSTR("presentsWithTransaction"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPresentsWithTransaction:(BOOL)a3
{
  BYTE1(self->_screenScale) = a3;
}

@end
