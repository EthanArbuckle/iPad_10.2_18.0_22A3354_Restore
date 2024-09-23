@implementation SCNBezierCurveGeometry

- (SCNBezierCurveGeometry)initWithCGPath:(CGPath *)a3
{
  return -[SCNBezierCurveGeometry initWithCGPath:transform:](self, "initWithCGPath:transform:", a3, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
}

- (SCNBezierCurveGeometry)initWithCGPath:(__n128)a3 transform:(__n128)a4
{
  const void *v9;
  SCNBezierCurveGeometry *v10;
  objc_super v16;

  v9 = (const void *)C3DBezierCurveGeometryCreate();
  v16.receiver = a1;
  v16.super_class = (Class)SCNBezierCurveGeometry;
  v10 = -[SCNGeometry initWithGeometryRef:](&v16, sel_initWithGeometryRef_, v9);
  if (v10)
  {
    v10->_cgPath = (CGPath *)MEMORY[0x1DF0D3BCC](a7);
    *(__n128 *)&v10[1].super.super.isa = a2;
    *((__n128 *)&v10[1].super + 1) = a3;
    *(__n128 *)&v10[1].super._elements = a4;
    *(__n128 *)&v10[1].super._materials = a5;
    C3DBezierCurveGeometrySetPath((uint64_t)v9, v10->_cgPath);
  }
  CFRelease(v9);
  return v10;
}

- (void)dealloc
{
  CGPath *cgPath;
  objc_super v4;

  cgPath = self->_cgPath;
  if (cgPath)
  {
    CFRelease(cgPath);
    self->_cgPath = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNBezierCurveGeometry;
  -[SCNGeometry dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCGPath:", self->_cgPath);
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  return v4;
}

- (CGPath)CGPath
{
  return self->_cgPath;
}

- (void)encodeWithCoder:(id)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[4];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNBezierCurveGeometry;
  -[SCNGeometry encodeWithCoder:](&v9, sel_encodeWithCoder_);
  SCNEncodeCGPathForKey((uint64_t)a3, self->_cgPath, (uint64_t)CFSTR("path"));
  v5 = *((_OWORD *)&self[1].super + 1);
  v6 = *(_OWORD *)&self[1].super._elements;
  v7 = *(_OWORD *)&self[1].super._materials;
  v8[0] = *(_OWORD *)&self[1].super.super.isa;
  v8[1] = v5;
  v8[2] = v6;
  v8[3] = v7;
  SCNEncodeSCNMatrix4(a3, CFSTR("transform"), (uint64_t)v8);
}

- (SCNBezierCurveGeometry)initWithCoder:(id)a3
{
  SCNBezierCurveGeometry *v4;
  _BOOL8 v5;
  CGPath *v6;
  CGPath *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  CGPath *v25;
  _OWORD v26[4];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SCNBezierCurveGeometry;
  v4 = -[SCNGeometry initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = SCNDecodeCGPathForKey(a3, (uint64_t)CFSTR("path"));
    SCNDecodeSCNMatrix4(a3, (uint64_t)CFSTR("transform"), v26);
    v15 = v26[1];
    v17 = v26[0];
    v11 = v26[3];
    v13 = v26[2];
    if (v6)
      v7 = (CGPath *)CFRetain(v6);
    else
      v7 = 0;
    v4->_cgPath = v7;
    *(_OWORD *)&v4[1].super.super.isa = v17;
    *((_OWORD *)&v4[1].super + 1) = v15;
    *(_OWORD *)&v4[1].super._elements = v13;
    *(_OWORD *)&v4[1].super._materials = v11;
    v8 = -[SCNGeometry geometryRef](v4, "geometryRef", v11, v13, v15, v17);
    v9 = -[SCNGeometry sceneRef](v4, "sceneRef");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__SCNBezierCurveGeometry_initWithCoder___block_invoke;
    v19[3] = &__block_descriptor_112_e8_v16__0d8l;
    v24 = v8;
    v25 = v6;
    v20 = v18;
    v21 = v16;
    v22 = v14;
    v23 = v12;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, v4, v19);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

__n128 *__40__SCNBezierCurveGeometry_initWithCoder___block_invoke(uint64_t a1)
{
  C3DBezierCurveGeometrySetPath(*(_QWORD *)(a1 + 96), *(CFTypeRef *)(a1 + 104));
  return C3DBezierCurveGeometrySetTransform(*(__n128 **)(a1 + 96), *(__n128 *)(a1 + 32), *(__n128 *)(a1 + 48), *(__n128 *)(a1 + 64), *(__n128 *)(a1 + 80));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)geometrySources
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)geometrySourceChannels
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)geometrySourcesForSemantic:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)geometryElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)geometryElementCount
{
  return 0;
}

- (id)geometryElementAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)primitiveType
{
  return 2;
}

- (id)presentationGeometry
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPresentationGeometryWithGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

@end
