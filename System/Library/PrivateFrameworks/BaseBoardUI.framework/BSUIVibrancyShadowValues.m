@implementation BSUIVibrancyShadowValues

- (void)calculateValuesForConfiguration:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  float32x4_t v16[5];
  _OWORD v17[5];
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = a3;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v25 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v26 = v5;
  v27 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v23 = *MEMORY[0x1E0CD2338];
  v24 = v6;
  if (v4)
  {
    v7 = v4;
    v8 = 1.0;
    do
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      v9 = objc_msgSend(v7, "effectType");
      objc_msgSend(v7, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSUIVibrancyShadowValues _shadowColorMatrixForType:heroColor:backgroundType:](BSUIVibrancyShadowValues, "_shadowColorMatrixForType:heroColor:backgroundType:", v9, v10, objc_msgSend(v7, "backgroundType"));

      v17[2] = v25;
      v17[3] = v26;
      v17[4] = v27;
      v17[0] = v23;
      v17[1] = v24;
      v16[2] = v20;
      v16[3] = v21;
      v16[4] = v22;
      v16[0] = v18;
      v16[1] = v19;
      objc_msgSend(v7, "blendAmount", *(double *)_lerpColorMatrices((uint64_t)&v23, (float32x2_t *)v17, v16, v8).i64);
      v12 = v11;
      objc_msgSend(v7, "blendConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        break;
      v8 = v8 * v12;
      v7 = v13;
    }
    while (v8 > 0.00000011920929);

  }
  v14 = v26;
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v25;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v14;
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v27;
  v15 = v24;
  *(_OWORD *)&self->_vibrantColorMatrix.m11 = v23;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v15;
}

- (id)transformShadowColor:(id)a3
{
  id v4;
  void *v5;
  float v7;

  v4 = a3;
  -[BSUIVibrancyShadowValues vibrantColorMatrix](self, "vibrantColorMatrix");
  _transformUIColor(v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CAColorMatrix)_lighteningShadowMatrix
{
  *retstr = *(CAColorMatrix *)byte_1A024F1E0;
  return result;
}

+ (CAColorMatrix)_darkeningShadowMatrix
{
  *(_OWORD *)&retstr->m11 = xmmword_1A024F230;
  *(_OWORD *)&retstr->m15 = xmmword_1A024F240;
  *(_OWORD *)&retstr->m24 = xmmword_1A024F250;
  *(_OWORD *)&retstr->m33 = xmmword_1A024F260;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&byte_1A024F1E0[64];
  return result;
}

+ (CAColorMatrix)_shadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  CAColorMatrix *result;
  id v14;

  v14 = a5;
  switch(a4)
  {
    case 0:
    case 2:
      if (!a6 || a6 == 2)
      {
        objc_msgSend(a2, "_darkeningShadowMatrix");
      }
      else
      {
        if (a6 != 1)
          goto LABEL_6;
        objc_msgSend(a2, "_lighteningShadowMatrix");
      }
      break;
    case 1:
LABEL_6:
      objc_msgSend(a2, "_colorizedShadowColorMatrixForType:heroColor:backgroundType:", a4, v14, a6);
      break;
    case 3:
      v10 = (_OWORD *)MEMORY[0x1E0CD2338];
      v11 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
      *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
      *(_OWORD *)&retstr->m33 = v11;
      *(_OWORD *)&retstr->m42 = v10[4];
      v12 = v10[1];
      *(_OWORD *)&retstr->m11 = *v10;
      *(_OWORD *)&retstr->m15 = v12;
      break;
    default:
      break;
  }

  return result;
}

+ (CAColorMatrix)_colorizedShadowColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  CAColorMatrix *result;
  float32x4_t v23[5];
  _OWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v37 = 0.0;
  v38 = 0.0;
  v35 = 0.0;
  v36 = 0.0;
  objc_msgSend(a5, "getRed:green:blue:alpha:", &v38, &v37, &v36, &v35);
  HIDWORD(v9) = HIDWORD(v37);
  HIDWORD(v13) = HIDWORD(v38);
  *(float *)&v13 = v38;
  *(float *)&v9 = v37;
  HIDWORD(v10) = HIDWORD(v36);
  *(float *)&v10 = v36;
  v11 = v35;
  v12 = 0.0;
  *(float *)&v13 = (float)((float)((float)((float)(*(float *)&v9 * 0.7152) + (float)(*(float *)&v13 * 0.2126))
                                 + (float)(*(float *)&v10 * 0.0722))
                         + (float)(v11 * 0.0))
                 + 0.0;
  if (!a6 || a6 == 2)
  {
    LODWORD(v9) = 1050253722;
    LODWORD(v10) = 0.5;
    v18 = _curve(v13, v9, v10, (__n128)xmmword_1A024F270);
    *(float *)&v19 = 1.0 - v11;
    LODWORD(v20) = 0;
    LODWORD(v21) = 1053609165;
    v12 = (float)((float)((float)(v18 + -0.3) / 0.2) + 0.0)
        + (float)((float)(1.0 - (float)((float)((float)(v18 + -0.3) / 0.2) + 0.0))
                * (float)(_curve(v19, v20, v21, (__n128)xmmword_1A024F170) / 0.4));
  }
  else if (a6 == 1)
  {
    LODWORD(v9) = 1059481190;
    LODWORD(v10) = 1062836634;
    v14 = _curve(v13, v9, v10, (__n128)xmmword_1A024F270);
    LODWORD(v15) = 1058642330;
    LODWORD(v16) = 1.0;
    *(float *)&v17 = v11;
    v12 = (float)((float)((float)((float)(v14 + -0.65) / 0.2) + 0.0)
                * (float)((float)(_curve(v17, v15, v16, (__n128)xmmword_1A024F280) + -0.6) / 0.4))
        + 0.0;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  objc_msgSend(a2, "_lighteningShadowMatrix");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  objc_msgSend(a2, "_darkeningShadowMatrix");
  v24[2] = v27;
  v24[3] = v28;
  v24[4] = v29;
  v24[0] = v25;
  v24[1] = v26;
  v23[2] = v32;
  v23[3] = v33;
  v23[4] = v34;
  v23[0] = v30;
  v23[1] = v31;
  _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)v24, v23, v12);
  return result;
}

- (CAColorMatrix)vibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self->m35;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[1].m13;
  v4 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

@end
