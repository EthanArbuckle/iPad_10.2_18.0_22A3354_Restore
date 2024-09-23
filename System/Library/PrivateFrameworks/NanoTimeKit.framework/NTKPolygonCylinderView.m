@implementation NTKPolygonCylinderView

- (NTKPolygonCylinderView)init
{
  NTKPolygonCylinderView *v2;
  NTKPolygonCylinderView *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[5];
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKPolygonCylinderView;
  v2 = -[NTKPolygonCylinderView init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKPolygonCylinderView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v10[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v10[3] = v5;
    v10[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v6 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v10[0] = *MEMORY[0x1E0CD2610];
    v10[1] = v7;
    v11 = v6;
    v12 = 0xBF6B4E81B4E81B4FLL;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v14 = v8;
    objc_msgSend(v4, "setSublayerTransform:", v10);

    -[NTKPolygonCylinderView _setRotationAngle:](v3, "_setRotationAngle:", 0.0);
  }
  return v3;
}

- (void)setNumberOfSides:(unint64_t)a3
{
  _NTKPolygonCylinderTransformView *v5;
  _NTKPolygonCylinderTransformView *transformView;

  if (-[NTKPolygonCylinderView numberOfSides](self, "numberOfSides") != a3)
  {
    -[_NTKPolygonCylinderTransformView removeFromSuperview](self->_transformView, "removeFromSuperview");
    v5 = -[_NTKPolygonCylinderTransformView initWithNumberOfFaces:]([_NTKPolygonCylinderTransformView alloc], "initWithNumberOfFaces:", a3);
    transformView = self->_transformView;
    self->_transformView = v5;

    -[NTKPolygonCylinderView addSubview:](self, "addSubview:", self->_transformView);
  }
}

- (unint64_t)numberOfSides
{
  return -[_NTKPolygonCylinderTransformView numberOfFaces](self->_transformView, "numberOfFaces");
}

- (unint64_t)numberOfVisibleSides
{
  return -[_NTKPolygonCylinderTransformView numberOfVisibleFaces](self->_transformView, "numberOfVisibleFaces");
}

- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4
{
  -[_NTKPolygonCylinderTransformView setView:forFaceAtIndex:](self->_transformView, "setView:forFaceAtIndex:", a3, a4);
}

- (id)viewForSideAtIndex:(unint64_t)a3
{
  return -[_NTKPolygonCylinderTransformView viewForFaceAtIndex:](self->_transformView, "viewForFaceAtIndex:", a3);
}

- (void)enumerateSideViewsWithBlock:(id)a3
{
  -[_NTKPolygonCylinderTransformView enumerateFaceViewsWithBlock:](self->_transformView, "enumerateFaceViewsWithBlock:", a3);
}

- (void)transitionToSideAtIndex:(unint64_t)a3
{
  -[NTKPolygonCylinderView _rotationAngleForFaceIndex:](self, "_rotationAngleForFaceIndex:", a3);
  -[NTKPolygonCylinderView _setRotationAngle:](self, "_setRotationAngle:");
}

- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5
{
  unint64_t v8;
  unint64_t v10;
  unint64_t v11;

  v8 = -[NTKPolygonCylinderView numberOfSides](self, "numberOfSides");
  if (v8 - 1 == a4 && a5 == 0)
    a5 = v8;
  if (a5 == v8 - 1)
    v10 = v8;
  else
    v10 = 0;
  if (a4)
    v11 = a4;
  else
    v11 = v10;
  -[NTKPolygonCylinderView _rotationAngleForFaceIndex:](self, "_rotationAngleForFaceIndex:", v11);
  -[NTKPolygonCylinderView _rotationAngleForFaceIndex:](self, "_rotationAngleForFaceIndex:", a5);
  CLKInterpolateBetweenFloatsClipped();
  -[NTKPolygonCylinderView _setRotationAngle:](self, "_setRotationAngle:");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _NTKPolygonCylinderTransformView *transformView;

  -[NTKPolygonCylinderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_NTKPolygonCylinderTransformView setBounds:](self->_transformView, "setBounds:");
  transformView = self->_transformView;
  MEMORY[0x1BCCA72B8](v11, v4, v6, v8, v10);
  -[_NTKPolygonCylinderTransformView setCenter:](transformView, "setCenter:");
  -[NTKPolygonCylinderView _updateTransform](self, "_updateTransform");
}

- (double)_rotationAngleForFaceIndex:(int64_t)a3
{
  double v4;

  -[_NTKPolygonCylinderTransformView rotationAnglePerFace](self->_transformView, "rotationAnglePerFace");
  return v4 * (double)a3;
}

- (void)_setRotationAngle:(double)a3
{
  float v4;

  for (; a3 < 0.0; a3 = a3 + 6.28318531)
    ;
  v4 = a3;
  self->_rotationAngle = fmodf(v4, 6.2832);
  -[NTKPolygonCylinderView _updateTransform](self, "_updateTransform");
  -[NTKPolygonCylinderView _informFaceViewsOfRotation](self, "_informFaceViewsOfRotation");
}

- (void)_informFaceViewsOfRotation
{
  _NTKPolygonCylinderTransformView *transformView;
  _QWORD v3[5];

  transformView = self->_transformView;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__NTKPolygonCylinderView__informFaceViewsOfRotation__block_invoke;
  v3[3] = &unk_1E6BD9258;
  v3[4] = self;
  -[_NTKPolygonCylinderTransformView enumerateFaceViewsWithBlock:](transformView, "enumerateFaceViewsWithBlock:", v3);
}

void __52__NTKPolygonCylinderView__informFaceViewsOfRotation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_rotationAngleForFaceIndex:", a2);
    v6 = vabdd_f64(*(double *)(*(_QWORD *)(a1 + 32) + 424), v5);
    if (v6 > 3.14159265)
      v6 = 6.28318531 - v6;
    objc_msgSend(v7, "setRotationFromFront:", v6);
  }

}

- (void)_updateTransform
{
  double v3;
  double rotationAngle;
  void *v5;
  CATransform3D v6;
  CATransform3D v7;
  CATransform3D v8;

  -[_NTKPolygonCylinderTransformView faceDistanceToCenter](self->_transformView, "faceDistanceToCenter");
  memset(&v8, 0, sizeof(v8));
  CATransform3DMakeTranslation(&v8, 0.0, 0.0, -v3);
  rotationAngle = self->_rotationAngle;
  v6 = v8;
  CATransform3DRotate(&v7, &v6, rotationAngle, 1.0, 0.0, 0.0);
  v8 = v7;
  -[_NTKPolygonCylinderTransformView layer](self->_transformView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v5, "setTransform:", &v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformView, 0);
}

@end
