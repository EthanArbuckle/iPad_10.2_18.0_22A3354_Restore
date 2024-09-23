@implementation CAMPreviewAlignmentModel

- (CAMPreviewAlignmentModel)init
{
  CAMPreviewAlignmentModel *v2;
  CAMPreviewAlignmentModel *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[8];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMPreviewAlignmentModel;
  v2 = -[CAMPreviewAlignmentModel init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v9[5] = v4;
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v9[7] = v5;
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v9[0] = *MEMORY[0x1E0CD2610];
    v9[1] = v6;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v9[3] = v7;
    -[CAMPreviewAlignmentModel _setAlignmentTransform:](v2, "_setAlignmentTransform:", v9);
    -[CAMPreviewAlignmentModel _setAligned:](v3, "_setAligned:", 1);
  }
  return v3;
}

+ (double)desiredUpdateInterval
{
  return 0.0166666667;
}

- (void)applyDeviceMotion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CATransform3D *v33;
  double v34;
  CGFloat v35;
  long double v36;
  void *v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;
  CATransform3D v45;
  _OWORD v46[8];

  v4 = a3;
  -[CAMPreviewAlignmentModel _referenceDeviceMotion](self, "_referenceDeviceMotion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "attitude");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)objc_msgSend(v6, "copy");
    -[CAMPreviewAlignmentModel _referenceDeviceMotion](self, "_referenceDeviceMotion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attitude");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiplyByInverseOfAttitude:", v8);

    objc_msgSend(v4, "pitch");
    v10 = v9;
    objc_msgSend(v4, "roll");
    v12 = v11;
    objc_msgSend(v4, "yaw");
    v14 = v13;
    v15 = sqrt(v12 * v12 + v10 * v10 + v14 * v14);
    CEKProgressClamped();
    v17 = v16;
    LODWORD(v16) = 1.0;
    LODWORD(v18) = 0;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v22 = v17;
    objc_msgSend(v21, "_solveForInput:", v22);
    v24 = v23;

    -[CAMPreviewAlignmentModel opacity](self, "opacity");
    if (vabdd_f64(v24, v25) > 0.001)
    {
      -[CAMPreviewAlignmentModel opacity](self, "opacity");
      -[CAMPreviewAlignmentModel opacity](self, "opacity");
      CEKClamp();
      -[CAMPreviewAlignmentModel _setOpacity:](self, "_setOpacity:");
      -[CAMPreviewAlignmentModel observer](self, "observer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "previewAlignmentModelDidChangeOpacity:", self);

    }
    v27 = -[CAMPreviewAlignmentModel isAligned](self, "isAligned");
    if (v15 >= 0.0144 || !v27)
    {
      v28 = -[CAMPreviewAlignmentModel isAligned](self, "isAligned");
      if (v15 >= 0.012 || v28)
      {
        v34 = -v12;
        -[CAMPreviewAlignmentModel _setAligned:](self, "_setAligned:", 0);
        memset(&v45, 0, sizeof(v45));
        CATransform3DMakeRotation(&v45, v10, 1.0, 0.0, 0.0);
        memset(&v44, 0, sizeof(v44));
        CATransform3DMakeRotation(&v44, v34, 0.0, 1.0, 0.0);
        memset(&v43, 0, sizeof(v43));
        CATransform3DMakeRotation(&v43, v14, 0.0, 0.0, 1.0);
        memset(&v42, 0, sizeof(v42));
        a = v45;
        b = v43;
        CATransform3DConcat(&v42, &a, &b);
        memset(&a, 0, sizeof(a));
        b = v42;
        v39 = v44;
        CATransform3DConcat(&a, &b, &v39);
        v35 = sin(v34) * -200.0;
        v36 = sin(v10);
        memset(&b, 0, sizeof(b));
        v39 = a;
        CATransform3DTranslate(&b, &v39, v35, v36 * 200.0, sqrt(v36 * 200.0 * (v36 * 200.0) + v35 * v35));
        v38 = b;
        v33 = &v38;
      }
      else
      {
        -[CAMPreviewAlignmentModel _setAligned:](self, "_setAligned:", 1);
        v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        v46[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v46[5] = v29;
        v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        v46[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v46[7] = v30;
        v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        v46[0] = *MEMORY[0x1E0CD2610];
        v46[1] = v31;
        v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        v46[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v46[3] = v32;
        v33 = (CATransform3D *)v46;
      }
      -[CAMPreviewAlignmentModel _setAlignmentTransform:](self, "_setAlignmentTransform:", v33, *(_OWORD *)&v38.m11, *(_OWORD *)&v38.m13, *(_OWORD *)&v38.m21, *(_OWORD *)&v38.m23, *(_OWORD *)&v38.m31, *(_OWORD *)&v38.m33, *(_OWORD *)&v38.m41, *(_OWORD *)&v38.m43);
      -[CAMPreviewAlignmentModel observer](self, "observer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "previewAlignmentModelDidChangeAlignmentTransform:", self);

    }
  }
  else
  {
    -[CAMPreviewAlignmentModel _setReferenceDeviceMotion:](self, "_setReferenceDeviceMotion:", v4);
  }

}

- (void)reset
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  _OWORD v9[8];

  -[CAMPreviewAlignmentModel _setReferenceDeviceMotion:](self, "_setReferenceDeviceMotion:", 0);
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v9[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v9[0] = *MEMORY[0x1E0CD2610];
  v9[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v9[3] = v6;
  -[CAMPreviewAlignmentModel _setAlignmentTransform:](self, "_setAlignmentTransform:", v9);
  -[CAMPreviewAlignmentModel _setAligned:](self, "_setAligned:", 1);
  -[CAMPreviewAlignmentModel _setOpacity:](self, "_setOpacity:", 0.0);
  -[CAMPreviewAlignmentModel observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewAlignmentModelDidChangeAlignmentTransform:", self);

  -[CAMPreviewAlignmentModel observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewAlignmentModelDidChangeOpacity:", self);

}

- (CAMPreviewAlignmentModelObserver)observer
{
  return (CAMPreviewAlignmentModelObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (CATransform3D)alignmentTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m14;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m12;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)_setAlignmentTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_alignmentTransform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_alignmentTransform.m21 = v5;
  *(_OWORD *)&self->_alignmentTransform.m13 = v4;
  *(_OWORD *)&self->_alignmentTransform.m11 = v3;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_alignmentTransform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_alignmentTransform.m41 = v8;
  *(_OWORD *)&self->_alignmentTransform.m33 = v7;
  *(_OWORD *)&self->_alignmentTransform.m31 = v6;
}

- (BOOL)isAligned
{
  return self->_aligned;
}

- (void)_setAligned:(BOOL)a3
{
  self->_aligned = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)_setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CMDeviceMotion)_referenceDeviceMotion
{
  return self->__referenceDeviceMotion;
}

- (void)_setReferenceDeviceMotion:(id)a3
{
  objc_storeStrong((id *)&self->__referenceDeviceMotion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__referenceDeviceMotion, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
