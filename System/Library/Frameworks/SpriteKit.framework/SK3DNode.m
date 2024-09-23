@implementation SK3DNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSceneTime:(NSTimeInterval)sceneTime
{
  *((NSTimeInterval *)self->_skc3DNode + 74) = sceneTime;
}

- (NSTimeInterval)sceneTime
{
  return *((double *)self->_skc3DNode + 74);
}

- (void)setPlaying:(BOOL)playing
{
  *((_BYTE *)self->_skc3DNode + 616) = playing;
}

- (BOOL)isPlaying
{
  return *((_BYTE *)self->_skc3DNode + 616);
}

- (void)setLoops:(BOOL)loops
{
  *((_BYTE *)self->_skc3DNode + 617) = loops;
}

- (BOOL)loops
{
  return *((_BYTE *)self->_skc3DNode + 617);
}

- (void)setPointOfView:(SCNNode *)pointOfView
{
  objc_storeStrong((id *)self->_skc3DNode + 76, pointOfView);
}

- (SCNNode)pointOfView
{
  return (SCNNode *)*((id *)self->_skc3DNode + 76);
}

- (BOOL)autoenablesDefaultLighting
{
  return *((_BYTE *)self->_skc3DNode + 618);
}

- (void)setAutoenablesDefaultLighting:(BOOL)autoenablesDefaultLighting
{
  *((_BYTE *)self->_skc3DNode + 618) = autoenablesDefaultLighting;
}

- (void)_makeBackingNode
{
  SKC3DNode *v2;

  v2 = (SKC3DNode *)operator new();
  SKC3DNode::SKC3DNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SK3DNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skc3DNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SK3DNode)init
{
  SK3DNode *v2;

  v2 = -[SK3DNode initWithViewportSize:](self, "initWithViewportSize:", 1.0, 1.0);
  -[SK3DNode commonInit](v2, "commonInit");
  return v2;
}

- (SK3DNode)initWithViewportSize:(CGSize)viewportSize
{
  double height;
  double width;
  SK3DNode *v5;
  SK3DNode *v6;
  objc_super v8;

  height = viewportSize.height;
  width = viewportSize.width;
  v8.receiver = self;
  v8.super_class = (Class)SK3DNode;
  v5 = -[SKNode init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SK3DNode commonInit](v5, "commonInit");
    -[SKNode set_anchorPoint:](v6, "set_anchorPoint:", 0.5, 0.5);
    -[SK3DNode setViewportSize:](v6, "setViewportSize:", width, height);
  }
  return v6;
}

- (SK3DNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SK3DNode *v5;
  SK3DNode *v6;
  void *v7;
  objc_super v9;

  v4 = aDecoder;
  v9.receiver = self;
  v9.super_class = (Class)SK3DNode;
  v5 = -[SKNode initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SK3DNode commonInit](v5, "commonInit");
    -[NSCoder decodeCGSizeForKey:](v4, "decodeCGSizeForKey:", CFSTR("viewportSize"));
    -[SK3DNode setViewportSize:](v6, "setViewportSize:");
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SK3DNode setScnScene:](v6, "setScnScene:", v7);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SK3DNode;
  -[SKNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SK3DNode viewportSize](self, "viewportSize");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("viewportSize"));
  -[SK3DNode scnScene](self, "scnScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_scene"));

}

- (void)setViewportSize:(CGSize)viewportSize
{
  double height;
  double width;
  __n128 Scale;
  int8x16_t v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  int32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float32x4_t v20;

  height = viewportSize.height;
  width = viewportSize.width;
  Scale = SKCNode::getScale((__n128 *)self->_skc3DNode);
  v7.i32[0] = 0;
  *(float *)&v8 = width;
  *(float *)&v9 = height;
  v10 = __PAIR64__(v9, v8);
  v11 = (int32x4_t)vandq_s8((int8x16_t)vclezq_f32((float32x4_t)Scale), (int8x16_t)xmmword_1DC9221D0);
  v11.i32[0] = vaddvq_s32(v11);
  v12.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v12.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v7.i64[0] = vceqq_s8(vandq_s8((int8x16_t)v11, v12), vandq_s8(v7, v12)).u64[0];
  v13 = vdupq_lane_s8(*(int8x8_t *)v7.i8, 0);
  v14 = (int8x16_t)vdupq_n_s64(v7.i8[0] & 0xF | (unint64_t)(16 * (v13.i8[1] & 0xF)) | ((v13.i8[2] & 0xF) << 8) & 0xFFF | ((v13.i8[3] & 0xFu) << 12) | ((unint64_t)(v13.i8[4] & 0xF) << 16) & 0xFFFFFFFFFF0FFFFFLL | ((unint64_t)(v13.i8[5] & 0xF) << 20) | ((unint64_t)(v13.i8[6] & 0xF) << 24) | ((unint64_t)(v13.i8[7] & 0xF) << 28) | ((unint64_t)(v13.i8[8] & 0xF) << 32) | ((unint64_t)(v13.i8[9] & 0xF) << 36) | ((unint64_t)(v13.i8[10] & 0xF) << 40) | ((unint64_t)(v13.i8[11] & 0xF) << 44) | ((unint64_t)(v13.i8[12] & 0xF) << 48) | ((unint64_t)(v13.i8[13] & 0xF) << 52) | ((unint64_t)(v13.i8[14] & 0xF) << 56) | ((unint64_t)v13.u8[15] << 60));
  __asm { FMOV            V3.4S, #1.0 }
  v20 = vdivq_f32((float32x4_t)v10, (float32x4_t)vbslq_s8(v14, (int8x16_t)Scale, _Q3));
  SKCNode::setSize((uint64_t)self->_skc3DNode, &v20);
}

- (CGSize)viewportSize
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(vmul_f32((float32x2_t)SKCNode::getScale((__n128 *)self->_skc3DNode).n128_u64[0], *(float32x2_t *)((char *)self->_skc3DNode + 336)));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

+ (SK3DNode)nodeWithViewportSize:(CGSize)viewportSize
{
  return (SK3DNode *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewportSize:", viewportSize.width, viewportSize.height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SK3DNode;
  v4 = -[SKNode copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SK3DNode viewportSize](self, "viewportSize");
  objc_msgSend(v4, "setViewportSize:");
  -[SK3DNode scnScene](self, "scnScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setScnScene:", v6);

  return v4;
}

- (SCNScene)scnScene
{
  return (SCNScene *)*((id *)self->_skc3DNode + 73);
}

- (void)_scnSceneDidUpdate:(id)a3
{
  SKCNode::setDirty((SKCNode *)self->_skc3DNode);
}

- (void)setScnScene:(SCNScene *)scnScene
{
  void *skc3DNode;
  void *v6;
  void *v7;
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  SCNScene *v13;

  v13 = scnScene;
  skc3DNode = self->_skc3DNode;
  if (*((_QWORD *)skc3DNode + 73))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("kC3DSceneDidUpdateNotification"), *((_QWORD *)self->_skc3DNode + 73));

    skc3DNode = self->_skc3DNode;
  }
  objc_storeStrong((id *)skc3DNode + 73, scnScene);
  objc_msgSend(*((id *)self->_skc3DNode + 70), "setScene:", *((_QWORD *)self->_skc3DNode + 73));
  objc_msgSend(*((id *)self->_skc3DNode + 70), "pointOfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v8 = self->_skc3DNode;
  v8[142] = v9;
  v8[143] = v10;
  v8[144] = v11;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__scnSceneDidUpdate_, CFSTR("kC3DSceneDidUpdateNotification"), v13);

  }
}

- (NSArray)hitTest:(CGPoint)point options:(NSDictionary *)options
{
  objc_msgSend(*((id *)self->_skc3DNode + 70), "hitTest:options:", options, point.x, point.y);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (vector_float3)projectPoint:(vector_float3)point
{
  __int128 v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  vector_float3 result;

  LODWORD(v4) = DWORD1(v3);
  LODWORD(v5) = DWORD2(v3);
  v6 = objc_msgSend(*((id *)self->_skc3DNode + 70), "projectPoint:", point.i64[0], point.i64[1], *(double *)&v3, v4, v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (vector_float3)unprojectPoint:(vector_float3)point
{
  __int128 v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  vector_float3 result;

  LODWORD(v4) = DWORD1(v3);
  LODWORD(v5) = DWORD2(v3);
  v6 = objc_msgSend(*((id *)self->_skc3DNode + 70), "unprojectPoint:", point.i64[0], point.i64[1], *(double *)&v3, v4, v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

@end
