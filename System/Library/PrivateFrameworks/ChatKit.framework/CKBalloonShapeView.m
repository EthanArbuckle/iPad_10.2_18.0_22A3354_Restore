@implementation CKBalloonShapeView

- (CKBalloonDescriptor_t)descriptor
{
  char *v3;
  unint64_t v4;
  char v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  v3 = &self->var0 + OBJC_IVAR___CKBalloonShapeView_descriptor;
  v4 = *(unint64_t *)((char *)&self->var4 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  v5 = *(&self->var5 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  v6 = *(&self->var9 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  v7 = *(&self->var10 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  v8 = *(&self->var11 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  v9 = *(&self->var12 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  *(_DWORD *)&retstr->var0 = *(_DWORD *)(&self->var0 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  retstr->var4 = v4;
  retstr->var5 = v5;
  retstr->var6 = *(CKColor_t *)(v3 + 24);
  *(_OWORD *)&retstr->var7 = *(_OWORD *)(v3 + 56);
  retstr->var9 = v6;
  retstr->var10 = v7;
  retstr->var11 = v8;
  retstr->var12 = v9;
  return self;
}

- (void)setDescriptor:(CKBalloonDescriptor_t *)a3
{
  unint64_t var4;
  char var5;
  BOOL var9;
  BOOL var10;
  BOOL var11;
  BOOL var12;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CKBalloonShapeView *v13;

  var4 = a3->var4;
  var5 = a3->var5;
  var9 = a3->var9;
  var10 = a3->var10;
  var11 = a3->var11;
  var12 = a3->var12;
  v9 = (char *)self + OBJC_IVAR___CKBalloonShapeView_descriptor;
  v10 = *(_OWORD *)&a3->var6.red;
  v11 = *(_OWORD *)&a3->var6.blue;
  v12 = *(_OWORD *)&a3->var7;
  *(_DWORD *)v9 = *(_DWORD *)&a3->var0;
  *((_QWORD *)v9 + 1) = var4;
  v9[16] = var5;
  *(_OWORD *)(v9 + 24) = v10;
  *(_OWORD *)(v9 + 40) = v11;
  *(_OWORD *)(v9 + 56) = v12;
  v9[72] = var9;
  v9[73] = var10;
  v9[74] = var11;
  v9[75] = var12;
  v13 = self;
  sub_18E75214C();

}

- (CKBalloonShapeView)initWithDescriptor:(CKBalloonDescriptor_t *)a3 imageGenerator:(id)a4
{
  unint64_t var4;
  char var5;
  BOOL var9;
  BOOL var10;
  BOOL var11;
  BOOL var12;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  CKBalloonShapeView *v14;
  int v16;
  unint64_t v17;
  char v18;
  CKColor_t var6;
  __int128 v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  var4 = a3->var4;
  var5 = a3->var5;
  var9 = a3->var9;
  var10 = a3->var10;
  var11 = a3->var11;
  var12 = a3->var12;
  v16 = *(_DWORD *)&a3->var0;
  v17 = var4;
  v18 = var5;
  var6 = a3->var6;
  v20 = *(_OWORD *)&a3->var7;
  v21 = var9;
  v22 = var10;
  v23 = var11;
  v24 = var12;
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_18E7D0060;
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  *(_QWORD *)(v12 + 32) = sub_18E768F30();
  *(_QWORD *)(v12 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, 4.5);
  sub_18E768AF8();
  v13 = objc_allocWithZone((Class)CKBalloonShapeView);
  v14 = (CKBalloonShapeView *)sub_18E752764((uint64_t)&v16, v12, (uint64_t (*)(uint64_t))sub_18E754160, v11, 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (UIEdgeInsets)alignmentRectInsets
{
  CKBalloonShapeView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  CKBalloonShapeView.alignmentRectInsets.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CKBalloonShapeView)initWithCoder:(id)a3
{
  CKBalloonShapeView *result;

  result = (CKBalloonShapeView *)sub_18E769320();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)CKBalloonShapeView;
  -[CKBalloonShapeView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKBalloonShapeView *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CKBalloonShapeView;
  v7 = self;
  -[CKBalloonShapeView frame](&v21, sel_frame);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = v7;
  v20.super_class = (Class)CKBalloonShapeView;
  -[CKBalloonShapeView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[CKBalloonShapeView frame](v7, sel_frame);
  v23.origin.x = v16;
  v23.origin.y = v17;
  v23.size.width = v18;
  v23.size.height = v19;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  if (!CGRectEqualToRect(v22, v23))
    -[CKBalloonShapeView setNeedsLayout](v7, sel_setNeedsLayout);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_class *v4;
  id v5;
  CALayer v6;

  v4 = (objc_class *)a3;
  *(_QWORD *)&v6._attr.refcount = self;
  v5 = *(id *)&v6._attr.refcount;
  v6.super.isa = v4;
  CKBalloonShapeView.layoutSublayers(of:)(v6);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  BOOL v5;
  CKBalloonShapeView *v6;
  void *v7;
  objc_super v9;

  if (sub_18E768984() == 0xD000000000000011 && v4 == 0x800000018E81D840 || (sub_18E7693F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = self;
    v7 = (void *)sub_18E768954();
    v9.receiver = v6;
    v9.super_class = (Class)CKBalloonShapeView;
    v5 = -[CKBalloonShapeView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v7);

    swift_bridgeObjectRelease();
  }
  return v5;
}

- (void)layoutSubviews
{
  CKBalloonShapeView *v2;
  CKBalloonShapeView *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBalloonShapeView;
  v2 = self;
  -[CKBalloonShapeView layoutSubviews](&v4, sel_layoutSubviews);
  if ((*((_BYTE *)&v2->super.super._responderFlags + OBJC_IVAR___CKBalloonShapeView_drawingMode) & 1) == 0)
  {
    v3 = (CKBalloonShapeView *)objc_retain(*(id *)((char *)&v2->super.super.super.isa
                                                 + OBJC_IVAR___CKBalloonShapeView_drawingMode));
    sub_18E7534E8(v3);

    v2 = v3;
  }

}

- (CKBalloonShapeView)initWithFrame:(CGRect)a3
{
  CKBalloonShapeView *result;

  result = (CKBalloonShapeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
}

@end
