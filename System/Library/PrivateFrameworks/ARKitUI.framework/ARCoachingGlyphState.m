@implementation ARCoachingGlyphState

- (ARCoachingGlyphState)init
{
  ARCoachingGlyphState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARCoachingGlyphState;
  result = -[ARCoachingGlyphState init](&v3, sel_init);
  if (result)
    result->_snapState = 1;
  return result;
}

- (unint64_t)snapState
{
  return self->_snapState;
}

- (void)setSnapState:(unint64_t)a3
{
  void *v4;
  void *v5;
  _OWORD v6[4];
  _OWORD v7[4];
  _OWORD v8[4];
  _OWORD v9[4];

  self->_snapState = a3;
  -[ARCoachingGlyphState delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ARCoachingGlyphState delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapStateChanged");

    -[ARCoachingGlyphState computeQuaternionTarget](self, "computeQuaternionTarget");
    v9[0] = v9[2];
    v9[1] = v9[3];
    -[ARCoachingGlyphState setQuaternionTarget:](self, "setQuaternionTarget:", v9);
    -[ARCoachingGlyphState computeScaleTarget](self, "computeScaleTarget");
    v8[0] = v8[2];
    v8[1] = v8[3];
    -[ARCoachingGlyphState setScaleTarget:](self, "setScaleTarget:", v8);
    -[ARCoachingGlyphState computeTopPlaneTranslationTarget](self, "computeTopPlaneTranslationTarget");
    v7[0] = v7[2];
    v7[1] = v7[3];
    -[ARCoachingGlyphState setTopPlaneTranslationTarget:](self, "setTopPlaneTranslationTarget:", v7);
    -[ARCoachingGlyphState computeBottomPlaneTranslationTarget](self, "computeBottomPlaneTranslationTarget");
    v6[0] = v6[2];
    v6[1] = v6[3];
    -[ARCoachingGlyphState setBottomPlaneTranslationTarget:](self, "setBottomPlaneTranslationTarget:", v6);
  }
}

- (__n128)quaternionTarget
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 16);
  v3 = *(_OWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setQuaternionTarget:(_OWORD *)a3
{
  __int128 v4;
  void *v5;
  id v6;

  v4 = a3[1];
  a1[1] = *a3;
  a1[2] = v4;
  objc_msgSend(a1, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quaternionTargetChanged");

  }
}

- (__n128)scaleTarget
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setScaleTarget:(ARCoachingGlyphState *)self
{
  _OWORD *v2;
  __int128 v4;
  void *v5;
  id v6;

  v4 = v2[1];
  *(_OWORD *)self->_scaleTarget = *v2;
  *(_OWORD *)&self->_scaleTarget[16] = v4;
  -[ARCoachingGlyphState delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARCoachingGlyphState delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scaleTargetChanged");

  }
}

- (void)setTopPlaneTranslationTarget:(ARCoachingGlyphState *)self
{
  _OWORD *v2;
  __int128 v4;
  void *v5;
  id v6;

  v4 = v2[1];
  *(_OWORD *)self->_topPlaneTranslationTarget = *v2;
  *(_OWORD *)&self->_topPlaneTranslationTarget[16] = v4;
  -[ARCoachingGlyphState delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARCoachingGlyphState delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topPlaneTranslationTargetChanged");

  }
}

- (void)setBottomPlaneTranslationTarget:(ARCoachingGlyphState *)self
{
  _OWORD *v2;
  __int128 v4;
  void *v5;
  id v6;

  v4 = v2[1];
  *(_OWORD *)self->_bottomPlaneTranslationTarget = *v2;
  *(_OWORD *)&self->_bottomPlaneTranslationTarget[16] = v4;
  -[ARCoachingGlyphState delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARCoachingGlyphState delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomPlaneTranslationTargetChanged");

  }
}

- (uint64_t)computeQuaternionTarget
{
  uint64_t result;
  float64x2_t v5;
  __int128 v6;
  __int128 v7;
  float64x2_t v8;
  float64x2_t v9;

  result = objc_msgSend(a1, "snapState");
  switch(result)
  {
    case 0:
      if (a1[88])
      {
        v6 = xmmword_1DCCA11E0;
        v7 = xmmword_1DCCA11F0;
      }
      else
      {
        v6 = xmmword_1DCCA1200;
        v7 = xmmword_1DCCA1210;
      }
      goto LABEL_12;
    case 1:
    case 2:
      v5 = (float64x2_t)xmmword_1DCCA11D0;
      a2[1] = xmmword_1DCCA11D0;
      goto LABEL_7;
    case 3:
      +[ARCoachingTransformations lookAt:center:up:](ARCoachingTransformations, "lookAt:center:up:", -0.0000305175781, 0.0, 0.0078125);
      v8 = 0u;
      v9 = 0u;
      result = (uint64_t)+[ARCoachingTransformations fromMatrix:](ARCoachingTransformations, "fromMatrix:");
      v5 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_1DCCA1170, v8, 1), (float64x2_t)xmmword_1DCCA11A0, v8.f64[0]), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_1DCCA11B0, v9, 1), (float64x2_t)xmmword_1DCCA11C0, v9.f64[0]));
      a2[1] = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_1DCCA1180, v8, 1), (float64x2_t)xmmword_1DCCA1190, v8.f64[0]), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)xmmword_1DCCA1170, v9, 1), (float64x2_t)xmmword_1DCCA11A0, v9.f64[0]));
LABEL_7:
      *a2 = v5;
      break;
    case 4:
      if (a1[88])
      {
        v6 = xmmword_1DCCA1130;
        v7 = xmmword_1DCCA1140;
      }
      else
      {
        v6 = xmmword_1DCCA1150;
        v7 = xmmword_1DCCA1160;
      }
LABEL_12:
      *a2 = v7;
      a2[1] = v6;
      break;
    default:
      result = objc_msgSend(a1, "quaternionTarget");
      break;
  }
  return result;
}

- (int8x16_t)computeScaleTarget
{
  uint64_t v4;
  int8x16_t result;
  unint64_t v6;
  __int128 v7;
  int8x16_t v8;
  uint64_t v9;

  v4 = objc_msgSend(a1, "snapState");
  result.i64[0] = 0x3FB999999999999ALL;
  v6 = 0x3FB999999999999ALL;
  *(_QWORD *)&v7 = 0x3FB999999999999ALL;
  switch(v4)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
      result.i64[0] = 1.0;
      v6 = 1.0;
      *(_QWORD *)&v7 = 1.0;
      break;
    case 4:
      result.i64[0] = 0x3FD3333333333333;
      v6 = 0x3FD3333333333333;
      *(_QWORD *)&v7 = 0x3FD3333333333333;
      break;
    default:
      objc_msgSend(a1, "scaleTarget", 0.1, 0.1, 0.1);
      result = v8;
      v6 = vextq_s8(result, result, 8uLL).u64[0];
      *(_QWORD *)&v7 = v9;
      break;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v7;
  return result;
}

- (int8x16_t)computeTopPlaneTranslationTarget
{
  uint64_t v4;
  int8x16_t result;
  unint64_t v6;
  __int128 v7;
  int8x16_t v8;
  uint64_t v9;

  v4 = objc_msgSend(a1, "snapState");
  result.i64[0] = 0;
  v6 = 0;
  *(_QWORD *)&v7 = 0;
  switch(v4)
  {
    case 0:
    case 4:
      break;
    case 1:
    case 2:
      result.i64[0] = 0;
      v6 = -2.0;
      goto LABEL_5;
    case 3:
      result.i64[0] = 0;
      v6 = -1.0;
LABEL_5:
      *(_QWORD *)&v7 = 0;
      break;
    default:
      objc_msgSend(a1, "topPlaneTranslationTarget", 0.0, 0.0, 0.0);
      result = v8;
      v6 = vextq_s8(result, result, 8uLL).u64[0];
      *(_QWORD *)&v7 = v9;
      break;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v7;
  return result;
}

- (int8x16_t)computeBottomPlaneTranslationTarget
{
  unint64_t v4;
  __int128 v5;
  int8x16_t result;
  unint64_t v7;
  int8x16_t v8;
  uint64_t v9;

  v4 = objc_msgSend(a1, "snapState");
  *(_QWORD *)&v5 = 0;
  result.i64[0] = 0;
  v7 = 0;
  if (v4 >= 3 && v4 != 4)
  {
    if (v4 == 3)
    {
      result.i64[0] = 0;
      v7 = 1.0;
      *(_QWORD *)&v5 = 0;
    }
    else
    {
      objc_msgSend(a1, "bottomPlaneTranslationTarget", 0.0, 0.0, 0.0);
      result = v8;
      v7 = vextq_s8(result, result, 8uLL).u64[0];
      *(_QWORD *)&v5 = v9;
    }
  }
  result.i64[1] = v7;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (ARCoachingGlyphStateDelegate)delegate
{
  return (ARCoachingGlyphStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__n128)topPlaneTranslationTarget
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 112);
  v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)bottomPlaneTranslationTarget
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 144);
  v3 = *(_OWORD *)(a1 + 160);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
