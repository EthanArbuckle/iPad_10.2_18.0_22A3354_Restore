@implementation JFXTextEffectFrame

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_hitAreaPath);
  CGPathRelease(self->_expandedHitAreaPath);
  v3.receiver = self;
  v3.super_class = (Class)JFXTextEffectFrame;
  -[JFXTextEffectFrame dealloc](&v3, sel_dealloc);
}

+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  double height;
  double width;
  id v17;
  id v18;
  void *v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v9 = a9;
  v10 = a8;
  v11 = a7;
  v13 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  v21 = *a6;
  v19 = (void *)objc_msgSend(v18, "initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v17, v13, &v21, v11, v10, v9, width, height);

  return v19;
}

- (CGRect)viewSpaceObjectBounds
{
  __int128 v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  CGPoint v7;
  CGPoint v8;
  double v9;
  double v10;
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
  PVCGPointQuad v21;
  _QWORD v22[2];
  uint64_t (*v23)(uint64_t);
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGPoint v50;
  CGPoint v51;
  CGPoint v52;
  CGPoint v53;
  PVCGPointQuad v54;
  CGRect v55;
  CGRect result;

  v52 = (CGPoint)0;
  v53 = (CGPoint)0;
  v50 = (CGPoint)0;
  v51 = (CGPoint)0;
  -[JFXTextEffectFrame objectBounds](self, "objectBounds");
  PVCGPointQuad_from_CGRect(v55);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[JFXTextEffectFrame transform](self, "transform");
  v34 = 0;
  v35 = &v34;
  v36 = 0x6010000000;
  v37 = &unk_226ACDFC7;
  v3 = *(_OWORD *)(MEMORY[0x24BE790E8] + 16);
  v38 = *MEMORY[0x24BE790E8];
  v39 = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BE790E8] + 48);
  v40 = *(_OWORD *)(MEMORY[0x24BE790E8] + 32);
  v41 = v4;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v23 = __43__JFXTextEffectFrame_viewSpaceObjectBounds__block_invoke;
  v24 = &unk_24EE5B7C0;
  v27 = v44;
  v28 = v45;
  v25 = v42;
  v26 = v43;
  v31 = v48;
  v32 = v49;
  v29 = v46;
  v30 = v47;
  v33 = &v34;
  v21.a = v50;
  v21.b = v51;
  v21.c = v52;
  v21.d = v53;
  v5 = v22;
  v6 = 0;
  do
  {
    v54 = v21;
    PVCGPointQuad_get_point_at_index(&v54);
    ((void (*)(_QWORD *, uint64_t))v23)(v5, v6);
    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 4);

  v7 = (CGPoint)*((_OWORD *)v35 + 3);
  v54.a = (CGPoint)*((_OWORD *)v35 + 2);
  v54.b = v7;
  v8 = (CGPoint)*((_OWORD *)v35 + 5);
  v54.c = (CGPoint)*((_OWORD *)v35 + 4);
  v54.d = v8;
  pv_bounding_CGRect(&v54);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  _Block_object_dispose(&v34, 8);
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

uint64_t __43__JFXTextEffectFrame_viewSpaceObjectBounds__block_invoke(uint64_t a1)
{
  CGPoint v3;

  pv_simd_matrix_transform_vector();
  return PVCGPointQuad_set_point_at_index((PVCGPointQuad *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 32), v3);
}

- (CGPoint)center
{
  double v2;
  double v3;
  PVCGPointQuad v4;
  CGPoint result;

  -[JFXTextEffectFrame cornerPoints](self, "cornerPoints");
  pv_CGPoint_get_quad_center(&v4);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setHitAreaPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_hitAreaPath);
  self->_hitAreaPath = a3;
}

- (void)setExpandedHitAreaPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_expandedHitAreaPath);
  self->_expandedHitAreaPath = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  id v19;
  id v20;
  CMTime time;
  objc_super v22;
  CGSize v23;
  CGPoint v24;
  CGSize v25;
  CGRect v26;

  v19 = (id)MEMORY[0x24BDD17C8];
  v22.receiver = self;
  v22.super_class = (Class)JFXTextEffectFrame;
  -[JFXTextEffectFrame description](&v22, sel_description);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame time](self, "time");
  v17 = (__CFString *)CMTimeCopyDescription(0, &time);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXTextEffectFrame forcePosterFrame](self, "forcePosterFrame"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", PVCoordinateSystemOriginNames[-[JFXTextEffectFrame effectOrigin](self, "effectOrigin")]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame effectSize](self, "effectSize");
  NSStringFromCGSize(v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame center](self, "center");
  NSStringFromCGPoint(v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", PVCoordinateSystemOriginNames[-[JFXTextEffectFrame origin](self, "origin")]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame relativeToSize](self, "relativeToSize");
  NSStringFromCGSize(v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame cornerPoints](self, "cornerPoints");
  NSStringFromPVCGPointQuad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame objectBounds](self, "objectBounds");
  NSStringFromCGRect(v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame hitAreaPoints](self, "hitAreaPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectFrame transform](self, "transform");
  NSStringFromSIMDDouble4x4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[JFXTextEffectFrame textFrames](self, "textFrames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@\ntime: %@\nforcePosterFrame: %@\neffectOrigin: %@\neffectSize: %@\n\ncenter: %@\n\norigin: %@\nrelativeToSize: %@\n\ncornerPoints:\n%@\n\nobjectBounds: %@\n\nhitAreaPoints: %@\n\ntransform:\n%@\n\ntextFrames (count): %@"), v18, v17, v14, v16, v15, v13, v12, v11, v3, v4, v5, v6, v9);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)forcePosterFrame
{
  return self->_forcePosterFrame;
}

- (void)setForcePosterFrame:(BOOL)a3
{
  self->_forcePosterFrame = a3;
}

- (int)effectOrigin
{
  return self->_effectOrigin;
}

- (void)setEffectOrigin:(int)a3
{
  self->_effectOrigin = a3;
}

- (CGSize)effectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_effectSize.width;
  height = self->_effectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEffectSize:(CGSize)a3
{
  self->_effectSize = a3;
}

- (int)origin
{
  return self->_origin;
}

- (void)setOrigin:(int)a3
{
  self->_origin = a3;
}

- (CGSize)relativeToSize
{
  double width;
  double height;
  CGSize result;

  width = self->_relativeToSize.width;
  height = self->_relativeToSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRelativeToSize:(CGSize)a3
{
  self->_relativeToSize = a3;
}

- (PVCGPointQuad)cornerPoints
{
  CGPoint v3;
  CGPoint v4;

  v3 = *(CGPoint *)&self[3].a.y;
  retstr->a = *(CGPoint *)&self[2].d.y;
  retstr->b = v3;
  v4 = *(CGPoint *)&self[3].c.y;
  retstr->c = *(CGPoint *)&self[3].b.y;
  retstr->d = v4;
  return self;
}

- (void)setCornerPoints:(PVCGPointQuad *)a3
{
  CGPoint a;
  CGPoint b;
  CGPoint c;

  a = a3->a;
  b = a3->b;
  c = a3->c;
  self->_cornerPoints.d = a3->d;
  self->_cornerPoints.c = c;
  self->_cornerPoints.b = b;
  self->_cornerPoints.a = a;
}

- (CGRect)outputROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outputROI.origin.x;
  y = self->_outputROI.origin.y;
  width = self->_outputROI.size.width;
  height = self->_outputROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (CGRect)objectBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_objectBounds.origin.x;
  y = self->_objectBounds.origin.y;
  width = self->_objectBounds.size.width;
  height = self->_objectBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setObjectBounds:(CGRect)a3
{
  self->_objectBounds = a3;
}

- (NSArray)hitAreaPoints
{
  return self->_hitAreaPoints;
}

- (void)setHitAreaPoints:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPoints, a3);
}

- (CGPath)hitAreaPath
{
  return self->_hitAreaPath;
}

- (CGPath)expandedHitAreaPath
{
  return self->_expandedHitAreaPath;
}

- (__n128)transform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 336);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 320);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 288);
  v6 = *(_OWORD *)(a1 + 304);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 288) = a3[2];
  *(_OWORD *)(a1 + 304) = v5;
  *(_OWORD *)(a1 + 256) = v3;
  *(_OWORD *)(a1 + 272) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 352) = a3[6];
  *(_OWORD *)(a1 + 368) = v8;
  *(__n128 *)(a1 + 320) = result;
  *(_OWORD *)(a1 + 336) = v7;
  return result;
}

- (__n128)transformInfo
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 448);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 416);
  v6 = *(_OWORD *)(a1 + 432);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransformInfo:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 416) = a3[2];
  *(_OWORD *)(a1 + 432) = v5;
  *(_OWORD *)(a1 + 384) = v3;
  *(_OWORD *)(a1 + 400) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 480) = a3[6];
  *(_OWORD *)(a1 + 496) = v8;
  *(__n128 *)(a1 + 448) = result;
  *(_OWORD *)(a1 + 464) = v7;
  return result;
}

- (JFXTextEffectTransforms)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
  objc_storeStrong((id *)&self->_transforms, a3);
}

- (NSArray)textFrames
{
  return self->_textFrames;
}

- (void)setTextFrames:(id)a3
{
  objc_storeStrong((id *)&self->_textFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrames, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_hitAreaPoints, 0);
}

@end
