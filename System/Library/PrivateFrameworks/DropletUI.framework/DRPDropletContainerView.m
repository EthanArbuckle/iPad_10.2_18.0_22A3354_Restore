@implementation DRPDropletContainerView

- (DRPDropletContainerView)initWithFrame:(CGRect)a3
{
  _OWORD *v3;
  __int128 v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_boundaryEdges) = 0;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
  v4 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *v3 = *MEMORY[0x24BEBE158];
  v3[1] = v4;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews) = (Class)MEMORY[0x24BEE4AF8];
  v6.receiver = self;
  v6.super_class = (Class)DRPDropletContainerView;
  return -[DRPDropletContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DRPDropletContainerView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  DRPDropletContainerView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_boundaryEdges) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
  v5 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *v4 = *MEMORY[0x24BEBE158];
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews) = (Class)MEMORY[0x24BEE4AF8];
  v6 = a3;

  result = (DRPDropletContainerView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (UIView)contentView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setContentView:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  DRPDropletContainerView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_23A823694(v6);

}

- (double)continuousCornerRadius
{
  double result;

  -[DRPDropletContainerView _continuousCornerRadius](self, sel__continuousCornerRadius);
  return result;
}

- (void)setContinuousCornerRadius:(double)a3
{
  -[DRPDropletContainerView _setContinuousCornerRadius:](self, sel__setContinuousCornerRadius_, a3);
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DRPDropletContainerView;
  -[DRPDropletContainerView _continuousCornerRadius](&v3, sel__continuousCornerRadius);
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  DRPDropletContainerView *v3;

  v3 = self;
  DRPDropletContainerView._continuousCornerRadius.setter();

}

- (unint64_t)boundaryEdges
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryEdges);
  swift_beginAccess();
  return *v2;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  DRPDropletContainerView *v4;

  v4 = self;
  DRPDropletContainerView.boundaryEdges.setter(a3);

}

- (UIEdgeInsets)boundaryOutsets
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
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
  double right;
  double bottom;
  double left;
  double top;
  DRPDropletContainerView *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  DRPDropletContainerView.boundaryOutsets.setter(top, left, bottom, right);

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
  v6.super_class = (Class)DRPDropletContainerView;
  -[DRPDropletContainerView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  DRPDropletContainerView *v3;

  v3 = self;
  DRPDropletContainerView.frame.setter();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)DRPDropletContainerView;
  -[DRPDropletContainerView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  DRPDropletContainerView *v3;

  v3 = self;
  DRPDropletContainerView.bounds.setter();

}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)DRPDropletContainerView;
  -[DRPDropletContainerView center](&v4, sel_center);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  DRPDropletContainerView *v3;

  v3 = self;
  DRPDropletContainerView.center.setter();

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
  v10.super_class = (Class)DRPDropletContainerView;
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
  __int128 v3;
  DRPDropletContainerView *v4;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  v4 = self;
  DRPDropletContainerView.transform.setter(v5);

}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DRPDropletContainerView;
  return -[DRPDropletContainerView isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  DRPDropletContainerView *v4;

  v4 = self;
  DRPDropletContainerView.isHidden.setter(a3);

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
  v20.super_class = (Class)DRPDropletContainerView;
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
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  DRPDropletContainerView *v7;
  _OWORD v8[8];

  v3 = *(_OWORD *)&a3->m13;
  v8[0] = *(_OWORD *)&a3->m11;
  v8[1] = v3;
  v4 = *(_OWORD *)&a3->m23;
  v8[2] = *(_OWORD *)&a3->m21;
  v8[3] = v4;
  v5 = *(_OWORD *)&a3->m33;
  v8[4] = *(_OWORD *)&a3->m31;
  v8[5] = v5;
  v6 = *(_OWORD *)&a3->m43;
  v8[6] = *(_OWORD *)&a3->m41;
  v8[7] = v6;
  v7 = self;
  DRPDropletContainerView.transform3D.setter(v8);

}

- (void)_setVelocity:(id)a3 forKey:(id)a4
{
  id v6;
  DRPDropletContainerView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  DRPDropletContainerView *v12;
  _OWORD v13[2];

  if (!a3)
  {
    memset(v13, 0, sizeof(v13));
    v11 = a4;
    v12 = self;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v6 = a4;
  v7 = self;
  swift_unknownObjectRetain();
  sub_23A84C30C();
  swift_unknownObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_23A84C21C();
  v10 = v9;

LABEL_6:
  DRPDropletContainerView._setVelocity(_:forKey:)((uint64_t)v13, v8, v10);

  swift_bridgeObjectRelease();
  sub_23A825594((uint64_t)v13, (uint64_t *)&unk_2542D8080);
}

- (void)_removeAllRetargetableAnimations:(BOOL)a3
{
  DRPDropletContainerView *v4;

  v4 = self;
  DRPDropletContainerView._removeAllRetargetableAnimations(_:)(a3);

}

- (void)layoutSubviews
{
  DRPDropletContainerView *v2;

  v2 = self;
  DRPDropletContainerView.layoutSubviews()();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
