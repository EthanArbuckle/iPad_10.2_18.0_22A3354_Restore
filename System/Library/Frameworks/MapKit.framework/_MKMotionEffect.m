@implementation _MKMotionEffect

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  double vertical;
  double v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  id WeakRetained;

  vertical = a3.vertical;
  v5 = 0.5 - a3.horizontal * 0.5;
  *(float *)&v5 = v5;
  objc_msgSend(&unk_1E2159340, "CA_interpolateValue:byFraction:", &unk_1E2159358, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  self->_offset.horizontal = v7;

  v8 = 0.5 - vertical * 0.5;
  *(float *)&v8 = v8;
  objc_msgSend(&unk_1E2159340, "CA_interpolateValue:byFraction:", &unk_1E2159358, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  self->_offset.vertical = v10;

  if (self->_enabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "motionEffectDidUpdate:", self);

  }
  return 0;
}

- (UIOffset)rawOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_offset.horizontal;
  vertical = self->_offset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)offsetWithScale:(UIOffset)a3
{
  double v3;
  double v4;
  UIOffset result;

  v3 = a3.horizontal * self->_offset.horizontal;
  v4 = a3.vertical * self->_offset.vertical;
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (CATransform3D)transformWithTranslationScale:(SEL)a3 rotationScale:(UIOffset)a4
{
  double vertical;
  double v6;
  double horizontal;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  UIOffset *p_offset;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGFloat v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGFloat v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CATransform3D *result;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CATransform3D v42;
  CATransform3D v43;

  vertical = a5.vertical;
  v6 = a4.vertical;
  horizontal = a4.horizontal;
  v9 = (_OWORD *)MEMORY[0x1E0CD2610];
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v10;
  v11 = v9[7];
  *(_OWORD *)&retstr->m41 = v9[6];
  *(_OWORD *)&retstr->m43 = v11;
  v12 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v12;
  v13 = v9[3];
  *(_OWORD *)&retstr->m21 = v9[2];
  *(_OWORD *)&retstr->m23 = v13;
  retstr->m34 = -0.00111111111;
  p_offset = &self->_offset;
  *(double *)&v10 = a5.horizontal * self->_offset.horizontal;
  v15 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v15;
  v16 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v16;
  v17 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v17;
  v18 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v18;
  CATransform3DRotate(&v43, &v42, *(CGFloat *)&v10, 0.0, 1.0, 0.0);
  v19 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v19;
  v20 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v20;
  v21 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v21;
  v22 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v22;
  v23 = vertical * p_offset->vertical;
  v24 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v24;
  v25 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v25;
  v26 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v26;
  v27 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v27;
  CATransform3DRotate(&v43, &v42, v23, 1.0, 0.0, 0.0);
  v28 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v28;
  v29 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v29;
  v30 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v30;
  v31 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v31;
  v32 = -(p_offset->horizontal * horizontal);
  *(double *)&v31 = -(p_offset->vertical * v6);
  v33 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v33;
  v34 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v34;
  v35 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v35;
  v36 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v36;
  result = CATransform3DTranslate(&v43, &v42, v32, *(CGFloat *)&v31, 0.0);
  v38 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v38;
  v39 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v39;
  v40 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v40;
  v41 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v41;
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (_MKMotionEffectDelegate)delegate
{
  return (_MKMotionEffectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
