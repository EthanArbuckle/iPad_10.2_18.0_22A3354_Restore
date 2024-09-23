@implementation DropletParticipantView

- (_TtC9DropletUI22DropletParticipantView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A84B7F0();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_23A849AE0(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_23A849B30(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_23A849AE0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_23A849B30(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DropletParticipantView();
  -[DropletParticipantView center](&v4, sel_center);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  _TtC9DropletUI22DropletParticipantView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_23A849FC4(x, y);

}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DropletParticipantView();
  result = (CGAffineTransform *)-[CGAffineTransform transform](&v10, sel_transform);
  v5 = v8;
  v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  CGFloat tx;
  CGFloat ty;
  objc_class *v6;
  _TtC9DropletUI22DropletParticipantView *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v12 = *(_OWORD *)&a3->c;
  v13 = *(_OWORD *)&a3->a;
  tx = a3->tx;
  ty = a3->ty;
  v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v15.receiver = self;
  v15.super_class = v6;
  v7 = self;
  -[DropletParticipantView transform](&v15, sel_transform);
  v16 = v19;
  v17 = v20;
  v18 = v21;
  v14.receiver = v7;
  v14.super_class = v6;
  v19 = v13;
  v20 = v12;
  *(CGFloat *)&v21 = tx;
  *((CGFloat *)&v21 + 1) = ty;
  -[DropletParticipantView setTransform:](&v14, sel_setTransform_, &v19);
  -[DropletParticipantView transform](v7, sel_transform);
  if ((sub_23A84C2D0() & 1) != 0
    || (v8 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews),
        swift_beginAccess(),
        v9 = *v8,
        (v10 = *(_QWORD *)(v9 + 16)) == 0))
  {

  }
  else
  {
    v11 = v9 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_23A84A4D0(v11, v7);
      v11 += 8;
      --v10;
    }
    while (v10);

    swift_bridgeObjectRelease();
  }
}

- (CATransform3D)transform3D
{
  CATransform3D *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for DropletParticipantView();
  result = (CATransform3D *)-[CATransform3D transform3D](&v20, sel_transform3D);
  v5 = v13;
  v6 = v14;
  v7 = v15;
  v8 = v16;
  v9 = v17;
  v10 = v18;
  v11 = v19;
  *(_OWORD *)&retstr->m11 = v12;
  *(_OWORD *)&retstr->m13 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m23 = v7;
  *(_OWORD *)&retstr->m31 = v8;
  *(_OWORD *)&retstr->m33 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  *(_OWORD *)&retstr->m43 = v11;
  return result;
}

- (void)setTransform3D:(CATransform3D *)a3
{
  CGFloat m43;
  CGFloat m44;
  objc_class *v6;
  _TtC9DropletUI22DropletParticipantView *v7;
  CGFloat v8;
  CGFloat v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CATransform3D b;
  objc_super v37;
  CATransform3D a;
  objc_super v39;

  v27 = *(_OWORD *)&a3->m13;
  v28 = *(_OWORD *)&a3->m11;
  v25 = *(_OWORD *)&a3->m23;
  v26 = *(_OWORD *)&a3->m21;
  v23 = *(_OWORD *)&a3->m33;
  v24 = *(_OWORD *)&a3->m31;
  v22 = *(_OWORD *)&a3->m41;
  m43 = a3->m43;
  m44 = a3->m44;
  v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v39.receiver = self;
  v39.super_class = v6;
  v7 = self;
  -[DropletParticipantView transform3D](&v39, sel_transform3D);
  v34 = *(_OWORD *)&a.m13;
  v35 = *(_OWORD *)&a.m11;
  v32 = *(_OWORD *)&a.m23;
  v33 = *(_OWORD *)&a.m21;
  v30 = *(_OWORD *)&a.m33;
  v31 = *(_OWORD *)&a.m31;
  v29 = *(_OWORD *)&a.m41;
  v8 = a.m43;
  v9 = a.m44;
  v37.receiver = v7;
  v37.super_class = v6;
  *(_OWORD *)&a.m11 = v28;
  *(_OWORD *)&a.m13 = v27;
  *(_OWORD *)&a.m21 = v26;
  *(_OWORD *)&a.m23 = v25;
  *(_OWORD *)&a.m31 = v24;
  *(_OWORD *)&a.m33 = v23;
  *(_OWORD *)&a.m41 = v22;
  a.m43 = m43;
  a.m44 = m44;
  -[DropletParticipantView setTransform3D:](&v37, sel_setTransform3D_, &a);
  -[DropletParticipantView transform3D](v7, sel_transform3D);
  v10 = *(_OWORD *)&a.m11;
  v11 = *(_OWORD *)&a.m13;
  v12 = *(_OWORD *)&a.m21;
  v13 = *(_OWORD *)&a.m23;
  v14 = *(_OWORD *)&a.m31;
  v15 = *(_OWORD *)&a.m33;
  v16 = *(_OWORD *)&a.m41;
  v17 = *(_OWORD *)&a.m43;
  *(_OWORD *)&a.m11 = v35;
  *(_OWORD *)&a.m13 = v34;
  *(_OWORD *)&a.m21 = v33;
  *(_OWORD *)&a.m23 = v32;
  *(_OWORD *)&a.m31 = v31;
  *(_OWORD *)&a.m33 = v30;
  *(_OWORD *)&a.m41 = v29;
  a.m43 = v8;
  a.m44 = v9;
  *(_OWORD *)&b.m11 = v10;
  *(_OWORD *)&b.m13 = v11;
  *(_OWORD *)&b.m21 = v12;
  *(_OWORD *)&b.m23 = v13;
  *(_OWORD *)&b.m31 = v14;
  *(_OWORD *)&b.m33 = v15;
  *(_OWORD *)&b.m41 = v16;
  *(_OWORD *)&b.m43 = v17;
  if (CATransform3DEqualToTransform(&a, &b)
    || (v18 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews),
        swift_beginAccess(),
        v19 = *v18,
        (v20 = *(_QWORD *)(v19 + 16)) == 0))
  {

  }
  else
  {
    v21 = v19 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_23A84A9D4(v21, v7);
      v21 += 8;
      --v20;
    }
    while (v20);

    swift_bridgeObjectRelease();
  }
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletParticipantView();
  return -[DropletParticipantView isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC9DropletUI22DropletParticipantView *v6;
  unsigned int v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  objc_super v14;
  objc_super v15;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DropletParticipantView();
  v15.receiver = self;
  v15.super_class = v5;
  v6 = self;
  v7 = -[DropletParticipantView isHidden](&v15, sel_isHidden);
  v14.receiver = v6;
  v14.super_class = v5;
  -[DropletParticipantView setHidden:](&v14, sel_setHidden_, v3);
  if (v7 == -[DropletParticipantView isHidden](v6, sel_isHidden)
    || (v8 = (char *)v6 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews,
        swift_beginAccess(),
        (v9 = *(_QWORD *)(*(_QWORD *)v8 + 16)) == 0))
  {

  }
  else
  {
    v10 = *(_QWORD *)v8 + 32;
    swift_bridgeObjectRetain();
    v11 = (_QWORD *)MEMORY[0x24BEE4EA0];
    do
    {
      v12 = (_QWORD *)MEMORY[0x23B858660](v10);
      if (v12)
      {
        v13 = v12;
        (*(void (**)(_TtC9DropletUI22DropletParticipantView *, BOOL))((*v11 & *v12) + 0xF8))(v6, -[DropletParticipantView isHidden](v6, sel_isHidden));

      }
      v10 += 8;
      --v9;
    }
    while (v9);

    swift_bridgeObjectRelease();
  }
}

- (void)_setVelocity:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC9DropletUI22DropletParticipantView *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _TtC9DropletUI22DropletParticipantView *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _OWORD v18[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_23A84C30C();
    swift_unknownObjectRelease();
    if (a4)
    {
LABEL_3:
      v8 = sub_23A84C21C();
      v10 = v9;

      goto LABEL_6;
    }
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v11 = a4;
    v12 = self;
    if (a4)
      goto LABEL_3;
  }
  v8 = 0;
  v10 = 0;
LABEL_6:
  v13 = (char *)self + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews;
  swift_beginAccess();
  v14 = *(_QWORD *)(*(_QWORD *)v13 + 16);
  if (v14)
  {
    v15 = *(_QWORD *)v13 + 32;
    swift_bridgeObjectRetain();
    do
    {
      v16 = MEMORY[0x23B858660](v15);
      if (v16)
      {
        v17 = (void *)v16;
        sub_23A834B7C((uint64_t)v18, v8, v10);

      }
      v15 += 8;
      --v14;
    }
    while (v14);

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  swift_bridgeObjectRelease();
  sub_23A825594((uint64_t)v18, (uint64_t *)&unk_2542D8080);
}

- (void)_removeAllRetargetableAnimations:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9DropletUI22DropletParticipantView *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
  swift_beginAccess();
  v6 = *v5;
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 32;
    v9 = self;
    swift_bridgeObjectRetain();
    do
    {
      v10 = (void *)MEMORY[0x23B858660](v8);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, sel__removeAllRetargetableAnimations_, v3);

      }
      v8 += 8;
      --v7;
    }
    while (v7);

    swift_bridgeObjectRelease();
  }
}

- (void)removeFromSuperview
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DropletParticipantView();
  v2 = (char *)v9.receiver;
  -[DropletParticipantView removeFromSuperview](&v9, sel_removeFromSuperview);
  v3 = &v2[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  v4 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)v3 + 32;
    swift_bridgeObjectRetain();
    v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
    do
    {
      v7 = (_QWORD *)MEMORY[0x23B858660](v5);
      if (v7)
      {
        v8 = v7;
        (*(void (**)(char *))((*v6 & *v7) + 0x110))(v2);

      }
      v5 += 8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  sub_23A84B0E4();

}

- (_TtC9DropletUI22DropletParticipantView)initWithFrame:(CGRect)a3
{
  _TtC9DropletUI22DropletParticipantView *result;

  result = (_TtC9DropletUI22DropletParticipantView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_23A82E644(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._animationInfo + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._layerRetained + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._subviewCache + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *((_BYTE *)&self->super._window + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType));
  swift_bridgeObjectRelease();
}

@end
