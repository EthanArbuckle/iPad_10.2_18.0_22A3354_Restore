@implementation BSUIVibrancyEffectValues

- (void)calculateValuesForConfiguration:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float32x4_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float32x4_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float32x4_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  float32x4_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  float32x4_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v4 = a3;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v51 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v52 = v5;
  v53 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v49 = *(float32x4_t *)MEMORY[0x1E0CD2338];
  v50 = v6;
  v46 = v51;
  v47 = v5;
  v48 = v53;
  v44 = v49;
  v45 = v6;
  objc_msgSend(v4, "groupName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
  {
    v9 = 1.0;
    do
    {
      objc_msgSend(v4, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "effectType");
      v12 = objc_msgSend(v4, "backgroundType");
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
      +[BSUIVibrancyEffectValues _materialBackdropColorMatrixForType:heroColor:backgroundType:](BSUIVibrancyEffectValues, "_materialBackdropColorMatrixForType:heroColor:backgroundType:", v11, v10, v12);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      +[BSUIVibrancyEffectValues _vibrancyMatrixForType:heroColor:backgroundType:](BSUIVibrancyEffectValues, "_vibrancyMatrixForType:heroColor:backgroundType:", v11, v10, v12);
      v31 = v51;
      v32 = v52;
      v33 = v53;
      v29 = v49;
      v30 = v50;
      v26 = v41;
      v27 = v42;
      v28 = v43;
      v24 = v39;
      v25 = v40;
      _lerpColorMatrices((uint64_t)&v49, (float32x2_t *)&v29, &v24, v9);
      v31 = v46;
      v32 = v47;
      v33 = v48;
      v29 = v44;
      v30 = v45;
      v26 = v36;
      v27 = v37;
      v28 = v38;
      v24 = v34;
      v25 = v35;
      objc_msgSend(v4, "blendAmount", *(double *)_lerpColorMatrices((uint64_t)&v44, (float32x2_t *)&v29, &v24, v9).i64);
      v14 = v13;
      objc_msgSend(v4, "blendConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        break;
      v9 = v9 * v14;
      v4 = v15;
    }
    while (v9 > 0.00000011920929);
    if (v8)
      goto LABEL_6;
  }
  else
  {
    v15 = 0;
    if (v7)
    {
LABEL_6:
      v16 = (void *)MEMORY[0x1E0CB3940];
      v41 = v51;
      v42 = v52;
      v43 = v53;
      v39 = v49;
      v40 = v50;
      v17 = _colorMatrixHash(v39.f32);
      v41 = v46;
      v42 = v47;
      v43 = v48;
      v39 = v44;
      v40 = v45;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%lu-%lu"), v8, v17, _colorMatrixHash(v39.f32));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v18 = 0;
LABEL_9:
  objc_storeStrong((id *)&self->_groupName, v18);
  if (v8)

  v19 = v52;
  *(_OWORD *)&self->_backdropColorMatrix.m24 = v51;
  *(_OWORD *)&self->_backdropColorMatrix.m33 = v19;
  *(_OWORD *)&self->_backdropColorMatrix.m42 = v53;
  v20 = v50;
  *(float32x4_t *)&self->_backdropColorMatrix.m11 = v49;
  *(_OWORD *)&self->_backdropColorMatrix.m15 = v20;
  v21 = v48;
  v22 = v46;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v47;
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v21;
  v23 = v45;
  *(float32x4_t *)&self->_vibrantColorMatrix.m11 = v44;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v23;
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v22;

}

- (id)transformVibrantColor:(id)a3
{
  id v4;
  void *v5;
  float v7;

  v4 = a3;
  -[BSUIVibrancyEffectValues vibrantColorMatrix](self, "vibrantColorMatrix");
  _transformUIColor(v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transformBackdropColor:(id)a3
{
  id v4;
  void *v5;
  float v7;

  v4 = a3;
  -[BSUIVibrancyEffectValues backdropColorMatrix](self, "backdropColorMatrix");
  _transformUIColor(v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transformColor:(id)a3 withVibrantMask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[BSUIVibrancyEffectValues transformBackdropColor:](self, "transformBackdropColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alphaComponent");
  objc_msgSend(v8, "colorWithAlphaComponent:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_colorBlendedWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyEffectValues transformVibrantColor:](self, "transformVibrantColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_luminance");
  v13 = v12;
  objc_msgSend(v7, "alphaComponent");
  objc_msgSend(v11, "colorWithAlphaComponent:", v13 * v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_colorBlendedWithColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (CAColorMatrix)_materialBackdropColorMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  CAColorMatrix *result;
  id v15;

  v10 = a5;
  v15 = v10;
  if ((unint64_t)a4 < 2)
  {
    objc_msgSend(a2, "_colorizedMaterialBackdropMatrixForType:heroColor:backgroundType:", a4, v10, a6);
    goto LABEL_11;
  }
  if (a4 == 3)
    goto LABEL_9;
  if (a4 == 2)
  {
    if (!a6 || a6 == 2)
    {
      *(_OWORD *)&retstr->m11 = xmmword_1A024F120;
      *(_OWORD *)&retstr->m15 = xmmword_1A024F130;
      *(_OWORD *)&retstr->m24 = xmmword_1A024F140;
      *(_OWORD *)&retstr->m33 = xmmword_1A024F150;
      *(_OWORD *)&retstr->m42 = xmmword_1A024F160;
      goto LABEL_11;
    }
    if (a6 == 1)
    {
      *(_OWORD *)&retstr->m21 = 0u;
      *(_OWORD *)&retstr->m25 = 0u;
      *(_OWORD *)&retstr->m42 = 0u;
      *(_OWORD *)&retstr->m34 = 0u;
      *(_OWORD *)&retstr->m12 = 0u;
      retstr->m11 = 0.88;
      retstr->m22 = 0.88;
      retstr->m33 = 0.88;
      retstr->m44 = 1.0;
      goto LABEL_11;
    }
LABEL_9:
    v11 = (_OWORD *)MEMORY[0x1E0CD2338];
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    *(_OWORD *)&retstr->m33 = v12;
    *(_OWORD *)&retstr->m42 = v11[4];
    v13 = v11[1];
    *(_OWORD *)&retstr->m11 = *v11;
    *(_OWORD *)&retstr->m15 = v13;
  }
LABEL_11:

  return result;
}

+ (CAColorMatrix)_colorizedMaterialBackdropMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float v24;
  __int128 v25;
  CAColorMatrix *result;
  __int128 v27;
  _BYTE v28[64];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v8 = a5;
  v36 = 0.0;
  v37 = 0.0;
  v34 = 0.0;
  v35 = 0.0;
  objc_msgSend(v8, "getRed:green:blue:alpha:", &v37, &v36, &v35, &v34);
  if (a4)
  {
    HIDWORD(v9) = HIDWORD(v35);
    v10 = v37;
    v11 = v36;
    v12 = v35;
  }
  else
  {
    v35 = 0.9;
    v36 = 0.9;
    v37 = 0.9;
    v12 = 0.9;
    v11 = 0.9;
    v10 = 0.9;
  }
  v13 = v34;
  *(_OWORD *)&retstr->m24 = xmmword_1A024F304;
  *(_OWORD *)&retstr->m33 = unk_1A024F314;
  *(_OWORD *)&retstr->m42 = xmmword_1A024F324;
  *(_OWORD *)&retstr->m11 = xmmword_1A024F2E4;
  *(_OWORD *)&retstr->m15 = unk_1A024F2F4;
  LODWORD(v9) = 0.5;
  _curve(COERCE_DOUBLE(__PAIR64__(unk_1A024F2F8, LODWORD(v13))), 0.0, v9, (__n128)xmmword_1A024F170);
  if (a4)
  {
    LODWORD(v15) = 0;
    LODWORD(v16) = 0.5;
    *(float *)&v14 = v13;
    _curve(v14, v15, v16, (__n128)xmmword_1A024F170);
  }
  *(_OWORD *)&v28[16] = xmmword_1A024F304;
  *(_OWORD *)&v28[32] = unk_1A024F314;
  *(_OWORD *)&v28[48] = xmmword_1A024F324;
  v27 = xmmword_1A024F2E4;
  *(_OWORD *)v28 = unk_1A024F2F4;
  CAColorMatrixConcat();
  v17 = v32;
  *(_OWORD *)&retstr->m24 = v31;
  *(_OWORD *)&retstr->m33 = v17;
  *(_OWORD *)&retstr->m42 = v33;
  v18 = v30;
  *(_OWORD *)&retstr->m11 = v29;
  *(_OWORD *)&retstr->m15 = v18;
  v19 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v28[16] = *(_OWORD *)&retstr->m24;
  *(_OWORD *)&v28[32] = v19;
  *(_OWORD *)&v28[48] = *(_OWORD *)&retstr->m42;
  v20 = *(_OWORD *)&retstr->m15;
  v27 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)v28 = v20;
  CAColorMatrixConcat();
  v21 = v32;
  *(_OWORD *)&retstr->m24 = v31;
  *(_OWORD *)&retstr->m33 = v21;
  *(_OWORD *)&retstr->m42 = v33;
  v22 = v30;
  *(_OWORD *)&retstr->m11 = v29;
  *(_OWORD *)&retstr->m15 = v22;
  if (a4)
  {
    v23 = *(_OWORD *)&retstr->m33;
    v24 = v13 * 0.25 / (v13 * 0.5 + -0.25 - v13 + 1.0) + 0.0;
    v31 = *(_OWORD *)&retstr->m24;
    v32 = v23;
    v33 = *(_OWORD *)&retstr->m42;
    v25 = *(_OWORD *)&retstr->m15;
    v29 = *(_OWORD *)&retstr->m11;
    v30 = v25;
    v27 = xmmword_1A024F120;
    *(float *)v28 = v10 * 0.2;
    *(_OWORD *)&v28[4] = xmmword_1A024F190;
    *(float *)&v28[20] = v11 * 0.2;
    *(_OWORD *)&v28[24] = xmmword_1A024F1A0;
    *(float *)&v28[40] = v12 * 0.2;
    *(_OWORD *)&v28[44] = xmmword_1A024F180;
    *(_DWORD *)&v28[60] = 0;
    _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)&v29, (float32x4_t *)&v27, (float)((float)(v24 * 0.9) + 0.1));
  }

  return result;
}

+ (CAColorMatrix)_vibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  id v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  CAColorMatrix *result;
  id v15;

  v10 = a5;
  v15 = v10;
  if ((unint64_t)a4 < 2)
  {
LABEL_8:
    objc_msgSend(a2, "_colorizedVibrancyMatrixForType:heroColor:backgroundType:", a4, v10, a6);
    goto LABEL_12;
  }
  if (a4 == 3)
  {
    v11 = (_OWORD *)MEMORY[0x1E0CD2338];
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    *(_OWORD *)&retstr->m33 = v12;
    *(_OWORD *)&retstr->m42 = v11[4];
    v13 = v11[1];
    *(_OWORD *)&retstr->m11 = *v11;
    *(_OWORD *)&retstr->m15 = v13;
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    if (!a6 || a6 == 2)
    {
      *(_OWORD *)&retstr->m24 = 0u;
      *(_OWORD *)&retstr->m33 = 0u;
      *(_OWORD *)&retstr->m42 = 0u;
      *(_OWORD *)&retstr->m11 = 0u;
      *(_OWORD *)&retstr->m15 = 0u;
      retstr->m15 = 1.25;
      retstr->m25 = 1.25;
      retstr->m35 = 1.25;
      goto LABEL_11;
    }
    if (a6 == 1)
    {
      *(_OWORD *)&retstr->m33 = 0u;
      *(_OWORD *)&retstr->m42 = 0u;
      *(_OWORD *)&retstr->m15 = 0u;
      *(_OWORD *)&retstr->m24 = 0u;
      *(_OWORD *)&retstr->m11 = 0u;
LABEL_11:
      retstr->m44 = 1.0;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_12:

  return result;
}

+ (CAColorMatrix)_colorizedVibrancyMatrixForType:(SEL)a3 heroColor:(int64_t)a4 backgroundType:(id)a5
{
  float v8;
  float v9;
  float v10;
  float v11;
  __int128 v12;
  __int128 v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CAColorMatrix *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[32];
  _BYTE v24[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v32 = 0.0;
  v33 = 0.0;
  v30 = 0.0;
  v31 = 0.0;
  objc_msgSend(a5, "getRed:green:blue:alpha:", &v33, &v32, &v31, &v30);
  if (!a4)
  {
    v31 = 0.9;
    v32 = 0.9;
    v33 = 0.9;
  }
  v8 = v30;
  v9 = v33;
  v10 = v32;
  v11 = v31;
  *(_OWORD *)&retstr->m24 = xmmword_1A024F304;
  *(_OWORD *)&retstr->m33 = unk_1A024F314;
  *(_OWORD *)&retstr->m42 = xmmword_1A024F324;
  *(_OWORD *)&retstr->m11 = xmmword_1A024F2E4;
  *(_OWORD *)&retstr->m15 = unk_1A024F2F4;
  *(_OWORD *)&v23[16] = xmmword_1A024F304;
  *(_OWORD *)v24 = unk_1A024F314;
  *(_OWORD *)&v24[16] = xmmword_1A024F324;
  v22 = xmmword_1A024F2E4;
  *(_OWORD *)v23 = unk_1A024F2F4;
  CAColorMatrixConcat();
  v12 = v28;
  *(_OWORD *)&retstr->m24 = v27;
  *(_OWORD *)&retstr->m33 = v12;
  *(_OWORD *)&retstr->m42 = v29;
  v13 = v26;
  *(_OWORD *)&retstr->m11 = v25;
  *(_OWORD *)&retstr->m15 = v13;
  if (a4)
  {
    v22 = 0uLL;
    v14 = v8 * 0.2 / (v8 * 0.4 + -0.2 - v8 + 1.0) + 0.0;
    v15 = *(_OWORD *)&retstr->m33;
    v27 = *(_OWORD *)&retstr->m24;
    v28 = v15;
    v29 = *(_OWORD *)&retstr->m42;
    v16 = *(_OWORD *)&retstr->m15;
    v25 = *(_OWORD *)&retstr->m11;
    v26 = v16;
    *(float *)v23 = v9;
    *(_QWORD *)&v23[12] = 0;
    *(_QWORD *)&v23[4] = 0;
    *(float *)&v23[20] = v10;
    *(_QWORD *)&v23[24] = 0;
    *(_QWORD *)v24 = 0;
    *(float *)&v24[8] = v11;
    *(_DWORD *)&v24[20] = 0;
    *(_QWORD *)&v24[12] = 0;
    *(_QWORD *)&v24[24] = 1065353216;
    _lerpColorMatrices((uint64_t)retstr, (float32x2_t *)&v25, (float32x4_t *)&v22, (float)((float)(v14 * 0.95) + 0.05));
  }
  *(_OWORD *)&retstr->m41 = xmmword_1A024F1D0;
  retstr->m45 = 0.0;
  v17 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v23[16] = *(_OWORD *)&retstr->m24;
  *(_OWORD *)v24 = v17;
  *(_OWORD *)&v24[16] = *(_OWORD *)&retstr->m42;
  v18 = *(_OWORD *)&retstr->m15;
  v22 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)v23 = v18;
  result = (CAColorMatrix *)CAColorMatrixConcat();
  v20 = v28;
  *(_OWORD *)&retstr->m24 = v27;
  *(_OWORD *)&retstr->m33 = v20;
  *(_OWORD *)&retstr->m42 = v29;
  v21 = v26;
  *(_OWORD *)&retstr->m11 = v25;
  *(_OWORD *)&retstr->m15 = v21;
  return result;
}

- (CAColorMatrix)backdropColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[1].m15;
  v4 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (CAColorMatrix)vibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].m11;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[1].m42;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[2].m15;
  v4 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m24;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
