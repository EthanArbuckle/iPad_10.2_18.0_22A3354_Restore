@implementation DRPDropletViewConfiguration

- (double)centerX
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  swift_beginAccess();
  return *v2;
}

- (void)setCenterX:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  swift_beginAccess();
  *v4 = a3;
}

- (double)centerY
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  swift_beginAccess();
  return *v2;
}

- (void)setCenterY:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)boundaryEdges
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  swift_beginAccess();
  return *v2;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  swift_beginAccess();
  *v4 = a3;
}

- (double)containerCornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerCornerRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (double)containerHeight
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerHeight:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  swift_beginAccess();
  *v4 = a3;
}

- (double)containerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (CATransform3D)containerTransform
{
  _OWORD *v4;
  CATransform3D *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform);
  result = (CATransform3D *)swift_beginAccess();
  v6 = v4[1];
  *(_OWORD *)&retstr->m11 = *v4;
  *(_OWORD *)&retstr->m13 = v6;
  v7 = v4[3];
  *(_OWORD *)&retstr->m21 = v4[2];
  *(_OWORD *)&retstr->m23 = v7;
  v8 = v4[5];
  *(_OWORD *)&retstr->m31 = v4[4];
  *(_OWORD *)&retstr->m33 = v8;
  v9 = v4[7];
  *(_OWORD *)&retstr->m41 = v4[6];
  *(_OWORD *)&retstr->m43 = v9;
  return result;
}

- (void)setContainerTransform:(CATransform3D *)a3
{
  CGFloat m43;
  CGFloat m44;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v12 = *(_OWORD *)&a3->m11;
  v10 = *(_OWORD *)&a3->m21;
  v11 = *(_OWORD *)&a3->m13;
  v8 = *(_OWORD *)&a3->m31;
  v9 = *(_OWORD *)&a3->m23;
  v6 = *(_OWORD *)&a3->m41;
  v7 = *(_OWORD *)&a3->m33;
  m43 = a3->m43;
  m44 = a3->m44;
  v5 = (char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  *(_OWORD *)v5 = v12;
  *((_OWORD *)v5 + 1) = v11;
  *((_OWORD *)v5 + 2) = v10;
  *((_OWORD *)v5 + 3) = v9;
  *((_OWORD *)v5 + 4) = v8;
  *((_OWORD *)v5 + 5) = v7;
  *((_OWORD *)v5 + 6) = v6;
  *((CGFloat *)v5 + 14) = m43;
  *((CGFloat *)v5 + 15) = m44;
}

- (UIColor)dropletColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setDropletColor:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)dropletRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setDropletRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (UIEdgeInsets)boundaryOutsets
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setBoundaryOutsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  swift_beginAccess();
  *v7 = top;
  v7[1] = left;
  v7[2] = bottom;
  v7[3] = right;
}

- (DRPDropletContextKeylineStyle)keylineStyle
{
  swift_beginAccess();
  return (DRPDropletContextKeylineStyle *)(id)swift_unknownObjectRetain();
}

- (void)setKeylineStyle:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)anyAnimationCompletionBlock
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock))
    return 0;
  v2 = *(_QWORD *)&self->centerX[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_23A81B198;
  v5[3] = &block_descriptor_88;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)removeAnyAnimationCompletionBlocks
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  *v2 = 0;
  v2[1] = 0;
  sub_23A823048(v3);
}

- (void)addAnyAnimationCompletionBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  DRPDropletViewConfiguration *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  DRPDropletViewConfiguration.addAnyAnimationCompletionBlock(_:)((uint64_t)sub_23A8230C0, v5);

  swift_release();
}

- (id)animationBlockForKeyPath:(id)a3
{
  return sub_23A81BC5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))DRPDropletViewConfiguration.animationBlock(forKeyPath:), (uint64_t)sub_23A81B560, (uint64_t)&block_descriptor_82);
}

- (void)addAlongsideAnimationBlockForKeyPath:(id)a3 animationBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DRPDropletViewConfiguration *v10;

  v5 = _Block_copy(a4);
  v6 = sub_23A84C21C();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_23A8230B0;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  DRPDropletViewConfiguration.addAlongsideAnimationBlock(forKeyPath:animationBlock:)(v6, v8, (uint64_t)v5, v9);
  sub_23A823048((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (id)behaviorSettingsForKeyPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  DRPDropletViewConfiguration *v7;
  void *v8;

  v4 = sub_23A84C21C();
  v6 = v5;
  v7 = self;
  v8 = (void *)DRPDropletViewConfiguration.behaviorSettings(forKeyPath:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setBehaviorSettingsForKeyPath:(id)a3 behaviorSettings:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  DRPDropletViewConfiguration *v9;

  v6 = sub_23A84C21C();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  DRPDropletViewConfiguration.setBehaviorSettingsForKeyPath(_:behaviorSettings:)(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)animationCompletionBlockForKeyPath:(id)a3
{
  return sub_23A81BC5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))DRPDropletViewConfiguration.animationCompletionBlock(forKeyPath:), (uint64_t)sub_23A81BD24, (uint64_t)&block_descriptor);
}

- (void)addAnimationCompletionBlockForKeyPath:(id)a3 animationCompletionBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DRPDropletViewConfiguration *v10;

  v5 = _Block_copy(a4);
  v6 = sub_23A84C21C();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_23A82307C;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  DRPDropletViewConfiguration.addAnimationCompletionBlock(forKeyPath:animationCompletionBlock:)(v6, v8, (uint64_t)v5, v9);
  sub_23A823048((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (DRPDropletViewConfiguration)initWithCenterX:(double)a3 centerY:(double)a4 boundaryEdges:(unint64_t)a5 containerCornerRadius:(double)a6 containerHeight:(double)a7 containerWidth:(double)a8 containerTransform:(CATransform3D *)a9 dropletColor:(id)a10 dropletRadius:(double)a11 boundaryOutsets:(UIEdgeInsets)a12 keylineStyle:(id)a13
{
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  DRPDropletViewConfiguration *v29;
  _OWORD v33[8];

  v20 = *(_OWORD *)&a9->m13;
  v33[0] = *(_OWORD *)&a9->m11;
  v33[1] = v20;
  v21 = *(_OWORD *)&a9->m23;
  v33[2] = *(_OWORD *)&a9->m21;
  v33[3] = v21;
  v22 = *(_OWORD *)&a9->m33;
  v33[4] = *(_OWORD *)&a9->m31;
  v33[5] = v22;
  v23 = *(_OWORD *)&a9->m43;
  v33[6] = *(_OWORD *)&a9->m41;
  v33[7] = v23;
  v24 = a10;
  swift_unknownObjectRetain();
  v29 = (DRPDropletViewConfiguration *)sub_23A8219BC(a5, v33, a10, (uint64_t)a13, a3, a4, a6, a7, a8, a11, a12.top, a12.left, v25, v26, v27, v28, *(uint64_t *)&a12.bottom, *(uint64_t *)&a12.right);

  swift_unknownObjectRelease();
  return v29;
}

- (DRPDropletViewConfiguration)initWithViewConfiguration:(id)a3
{
  return (DRPDropletViewConfiguration *)DRPDropletViewConfiguration.init(viewConfiguration:)((char *)a3);
}

- (id)copy
{
  return objc_msgSend(objc_allocWithZone((Class)DRPDropletViewConfiguration), sel_initWithViewConfiguration_, self);
}

- (NSString)description
{
  DRPDropletViewConfiguration *v2;
  void *v3;

  v2 = self;
  sub_23A81D438(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2988);
  sub_23A821C40((unint64_t *)&qword_2569C2990, &qword_2569C2988, MEMORY[0x24BEE12B0]);
  sub_23A84C1F8();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  DRPDropletViewConfiguration *v2;
  void *v3;

  v2 = self;
  DRPDropletViewConfiguration.debugDescription.getter();

  v3 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  DRPDropletViewConfiguration *v4;
  DRPDropletViewConfiguration *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A84C30C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = DRPDropletViewConfiguration.isEqual(_:)((uint64_t)v8);

  sub_23A821CC8((uint64_t)v8);
  return v6;
}

- (DRPDropletViewConfiguration)init
{
  DRPDropletViewConfiguration *result;

  result = (DRPDropletViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  sub_23A823048(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)changeToIntelligentLightStyle:(unint64_t)a3 preferAudioReactivity:(BOOL)a4 canvasSize:(CGSize)a5
{
  double height;
  double width;
  _BOOL8 v7;
  id v10;
  id v11;
  DRPDropletViewConfiguration *v12;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v10 = objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle);
  v12 = self;
  v11 = objc_msgSend(v10, sel_initWithPreferringAudioReactivity_style_, v7, a3);
  -[DRPDropletViewConfiguration setKeylineStyle:](v12, sel_setKeylineStyle_, v11);

  -[DRPDropletViewConfiguration defaultResetKeylineForCanvasSize:](v12, sel_defaultResetKeylineForCanvasSize_, width, height);
}

- (void)defaultResetKeylineForCanvasSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  DRPDropletViewConfiguration *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  DRPDropletViewConfiguration.defaultResetKeyline(forCanvasSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

}

+ (id)trailingHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5
{
  return objc_msgSend(a1, sel_rightEdgeHintWithCanvasSize_centerY_progress_, a3.width, a3.height, a4, a5);
}

+ (id)rightEdgeHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5
{
  double height;
  double width;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;

  height = a3.height;
  width = a3.width;
  v10 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  objc_msgSend(v10, sel_rightEdgeHintSize);
  v12 = v11;
  objc_msgSend(v10, sel_rightEdgeHintDropletRadius);
  v14 = objc_msgSend(a1, sel_edgeHintWithCanvasSize_hintSize_edge_centerAlongEdge_progress_dropletRadius_, 8, width, height, v12, a4, a5, v13);

  return v14;
}

+ (id)edgeHintWithCanvasSize:(CGSize)a3 hintSize:(double)a4 edge:(unint64_t)a5 centerAlongEdge:(double)a6 progress:(double)a7 dropletRadius:(double)a8
{
  return sub_23A822474(a5, a3.width, a3.height, a4, a6, a7, a8);
}

+ (id)trailingContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8
{
  return objc_msgSend(a1, sel_rightEdgeContentPresentedWithCanvasSize_contentSize_centerY_dropletRadius_isOffscreen_inflationProgress_, a7, a3.width, a3.height, a4.width, a4.height, a5, a6, a8);
}

+ (id)rightEdgeContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8
{
  _BOOL4 v8;
  double width;
  double height;
  double v11;
  id v12;
  void *v13;
  double v14;

  v8 = a7;
  width = a4.width;
  height = a3.height;
  v11 = a3.width;
  v12 = objc_msgSend(a1, sel_edgeContentPresentedWithCanvasSize_edge_lengthAlongEdge_protrusionFromEdge_centerAlongEdge_inflationProgress_dropletRadius_, 8, a3.width, a3.height, a4.height, a4.width, a5, a8, a6);
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, sel_centerX);
    objc_msgSend(v13, sel_setCenterX_, width + v14);
  }
  objc_msgSend(v13, sel_defaultResetKeylineForCanvasSize_, v11, height);
  return v13;
}

+ (id)edgeContentPresentedWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 lengthAlongEdge:(double)a5 protrusionFromEdge:(double)a6 centerAlongEdge:(double)a7 inflationProgress:(double)a8 dropletRadius:(double)a9
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  swift_getObjCClassMetadata();
  return (id)sub_23A81EE70(a4, width, height, a5, a6, a7, a8, a9);
}

+ (id)edgeAdaptiveKeylineWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 protrusionFromEdge:(double)a5 centerAlongEdge:(double)a6 containerSize:(CGSize)a7 containerCornerRadius:(double)a8 transform3D:(CATransform3D *)a9 dropletRadius:(double)a10
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[8];

  v10 = *(_OWORD *)&a9->m13;
  v15[0] = *(_OWORD *)&a9->m11;
  v15[1] = v10;
  v11 = *(_OWORD *)&a9->m23;
  v15[2] = *(_OWORD *)&a9->m21;
  v15[3] = v11;
  v12 = *(_OWORD *)&a9->m33;
  v15[4] = *(_OWORD *)&a9->m31;
  v15[5] = v12;
  v13 = *(_OWORD *)&a9->m43;
  v15[6] = *(_OWORD *)&a9->m41;
  v15[7] = v13;
  return sub_23A8229EC(a4, (uint64_t *)v15, a3.width, a3.height, a5, a6, a7.width, a7.height, a8, a10);
}

@end
