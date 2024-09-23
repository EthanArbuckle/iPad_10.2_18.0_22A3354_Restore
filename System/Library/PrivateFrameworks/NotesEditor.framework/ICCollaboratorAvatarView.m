@implementation ICCollaboratorAvatarView

+ (double)animationDuration
{
  return 0.375;
}

+ (double)animationSpringDamping
{
  return 0.85;
}

+ (double)contentHeight
{
  id v2;
  double result;
  void *v4;
  double v5;
  double v6;

  v2 = objc_msgSend((id)objc_opt_self(), sel_ic_preferredFontForStyle_withFontWeight_, *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1438]);
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, sel_lineHeight);
    v6 = v5;

    result = v6 + 6.0;
    if (v6 + 6.0 <= 30.0)
      return 30.0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DD9D2140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___ICCollaboratorAvatarView_color));
}

- (UIView)boundingSuperview
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___ICCollaboratorAvatarView_boundingSuperview));
}

- (CGPoint)frameAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorPoint);
  v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFrameAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  ICCollaboratorAvatarView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1DD904FC8(x, y);

}

- (BOOL)frameAnchorIsInverted
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorIsInverted);
}

- (void)setFrameAnchorIsInverted:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorIsInverted) = a3;
}

- (BOOL)isExpanded
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_isExpanded);
}

- (void)setIsExpanded:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_isExpanded) = a3;
}

- (ICCollaboratorAvatarView)initWithFrame:(CGRect)a3
{
  sub_1DD907EC8();
}

- (ICCollaboratorAvatarView)initWithCoder:(id)a3
{
  sub_1DD905B70(a3);
}

- (void)didMoveToWindow
{
  ICCollaboratorAvatarView *v2;

  v2 = self;
  CollaboratorAvatarView.didMoveToWindow()();

}

- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  ICCollaboratorAvatarView *v6;

  v6 = self;
  sub_1DD906088(a3, a4);

}

- (void)removeFromSuperviewAnimatedWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  ICCollaboratorAvatarView *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1DD9081FC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1DD9061F8((uint64_t)v7, v6);
  sub_1DD8FE450((uint64_t)v7);

}

- (void)updateWithoutAnimation
{
  ICCollaboratorAvatarView *v2;

  v2 = self;
  sub_1DD9050E4(0);

}

- (void)handleTap:(id)a3
{
  id v4;
  ICCollaboratorAvatarView *v5;

  v4 = a3;
  v5 = self;
  sub_1DD907FCC();

}

- (void)handleHoverWithRecognizer:(id)a3
{
  id v4;
  ICCollaboratorAvatarView *v5;

  v4 = a3;
  v5 = self;
  sub_1DD907A04(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___labelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___labelHeightConstraint));
}

@end
