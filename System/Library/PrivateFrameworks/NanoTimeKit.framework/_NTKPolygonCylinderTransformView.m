@implementation _NTKPolygonCylinderTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _NTKPolygonCylinderTransformView *v5;
  _NTKPolygonCylinderTransformView *v6;
  _NTKPolygonCylinderTransformView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NTKPolygonCylinderTransformView;
  -[_NTKPolygonCylinderTransformView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_NTKPolygonCylinderTransformView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (_NTKPolygonCylinderTransformView)initWithNumberOfFaces:(unint64_t)a3
{
  _NTKPolygonCylinderTransformView *v4;
  double v5;
  unint64_t numberOfVisibleFaces;
  double v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *faceViews;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_NTKPolygonCylinderTransformView;
  v4 = -[_NTKPolygonCylinderTransformView init](&v11, sel_init);
  if (v4)
  {
    if (a3 <= 1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ cannot have fewer than 2 faces"), objc_opt_class());
    v4->_numberOfFaces = a3;
    v5 = 6.28318531 / (double)a3;
    if (v5 <= 1.57079633)
    {
      numberOfVisibleFaces = v4->_numberOfVisibleFaces;
      v7 = 6.28318531 / (double)a3;
      do
      {
        ++numberOfVisibleFaces;
        v7 = v5 + v7;
      }
      while (v7 <= 1.57079633);
      v4->_numberOfVisibleFaces = numberOfVisibleFaces;
      v5 = 6.28318531 / (double)v4->_numberOfFaces;
    }
    v4->_exteriorAngle = v5;
    v4->_interiorAngle = 3.14159265 - v5;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    faceViews = v4->_faceViews;
    v4->_faceViews = v8;

  }
  return v4;
}

- (void)setView:(id)a3 forFaceAtIndex:(unint64_t)a4
{
  NSMutableDictionary *faceViews;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  faceViews = self->_faceViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](faceViews, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v13)
  {
    objc_msgSend(v8, "removeFromSuperview");
    if (v13)
    {
      objc_msgSend(v13, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDoubleSided:", 0);

      -[_NTKPolygonCylinderTransformView addSubview:](self, "addSubview:", v13);
      v10 = self->_faceViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, v11);
    }
    else
    {
      v12 = self->_faceViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v11);
    }

  }
}

- (id)viewForFaceAtIndex:(unint64_t)a3
{
  NSMutableDictionary *faceViews;
  void *v4;
  void *v5;

  faceViews = self->_faceViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](faceViews, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateFaceViewsWithBlock:(id)a3
{
  void (**v4)(id, unint64_t, void *, _BYTE *);
  unint64_t v5;
  NSMutableDictionary *faceViews;
  void *v7;
  void *v8;
  int v9;
  unsigned __int8 v10;

  v4 = (void (**)(id, unint64_t, void *, _BYTE *))a3;
  v10 = 0;
  if (self->_numberOfFaces)
  {
    v5 = 0;
    do
    {
      faceViews = self->_faceViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](faceViews, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v4[2](v4, v5, v8, &v10);
      v9 = v10;

      if (v9)
        break;
      ++v5;
    }
    while (v5 < self->_numberOfFaces);
  }

}

- (double)rotationAnglePerFace
{
  return self->_exteriorAngle;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  float v5;
  objc_super v6;

  height = a3.size.height;
  v6.receiver = self;
  v6.super_class = (Class)_NTKPolygonCylinderTransformView;
  -[_NTKPolygonCylinderTransformView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width);
  v5 = self->_interiorAngle * 0.5;
  self->_faceDistanceToCenter = height * 0.5 * tanf(v5);
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _QWORD v14[11];

  v3 = -[_NTKPolygonCylinderTransformView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1BCCA72B8](v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50___NTKPolygonCylinderTransformView_layoutSubviews__block_invoke;
  v14[3] = &unk_1E6BD9280;
  *(double *)&v14[5] = v12;
  v14[6] = v13;
  v14[7] = v5;
  v14[8] = v7;
  v14[9] = v9;
  v14[10] = v11;
  v14[4] = self;
  -[_NTKPolygonCylinderTransformView enumerateFaceViewsWithBlock:](self, "enumerateFaceViewsWithBlock:", v14);
}

- (CATransform3D)_transformForFaceIndex:(SEL)a3
{
  double faceDistanceToCenter;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CATransform3D *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CATransform3D v16;
  CATransform3D v17;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeRotation(retstr, -(self->_exteriorAngle * (double)a4), 1.0, 0.0, 0.0);
  faceDistanceToCenter = self->_faceDistanceToCenter;
  v7 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v16.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v16.m33 = v7;
  v8 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v16.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v16.m43 = v8;
  v9 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v16.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v16.m13 = v9;
  v10 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v16.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v16.m23 = v10;
  result = CATransform3DTranslate(&v17, &v16, 0.0, 0.0, faceDistanceToCenter);
  v12 = *(_OWORD *)&v17.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
  *(_OWORD *)&retstr->m33 = v12;
  v13 = *(_OWORD *)&v17.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
  *(_OWORD *)&retstr->m43 = v13;
  v14 = *(_OWORD *)&v17.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
  *(_OWORD *)&retstr->m13 = v14;
  v15 = *(_OWORD *)&v17.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
  *(_OWORD *)&retstr->m23 = v15;
  return result;
}

- (unint64_t)numberOfFaces
{
  return self->_numberOfFaces;
}

- (unint64_t)numberOfVisibleFaces
{
  return self->_numberOfVisibleFaces;
}

- (double)faceDistanceToCenter
{
  return self->_faceDistanceToCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceViews, 0);
}

@end
