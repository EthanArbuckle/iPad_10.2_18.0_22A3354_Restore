@implementation TabThumbnailView

- (_TtC12MobileSafari16TabThumbnailView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari16TabThumbnailView *)sub_18B9177FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari16TabThumbnailView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari16TabThumbnailView *)sub_18B917C2C(a3);
}

- (void)trailingCornerButtonReceivedTap
{
  void (*v2)(uint64_t);
  _TtC12MobileSafari16TabThumbnailView *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_closeHandler);
  v3 = self;
  v4 = sub_18BABFBB4();
  v2(v4);

  swift_release();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC12MobileSafari16TabThumbnailView *v8;
  void *v9;
  id v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (UIViewIgnoresTouchEvents())
  {

    v9 = 0;
  }
  else
  {
    v10 = sub_18B91A048((uint64_t)v7, x, y);
    if (!v10)
    {
      v12.receiver = v8;
      v12.super_class = (Class)type metadata accessor for TabThumbnailView();
      v10 = -[TabThumbnailView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    }
    v9 = v10;

  }
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TabThumbnailView();
  v7 = a4;
  v8 = v11.receiver;
  if (-[TabThumbnailView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {

LABEL_5:
    return 1;
  }
  v9 = sub_18B91A048((uint64_t)v7, x, y);

  if (v9)
  {
    v8 = v9;
    goto LABEL_5;
  }
  return 0;
}

- (void)contentSizeCategoryDidChange
{
  _TtC12MobileSafari16TabThumbnailView *v2;

  v2 = self;
  sub_18B91A2B0();

}

- (void)displayScaleDidChange
{
  _TtC12MobileSafari16TabThumbnailView *v2;

  v2 = self;
  sub_18B91A570();

}

- (void)layoutSubviews
{
  _TtC12MobileSafari16TabThumbnailView *v2;

  v2 = self;
  sub_18B91B770();

}

- (void)didMoveToWindow
{
  _TtC12MobileSafari16TabThumbnailView *v2;

  v2 = self;
  sub_18B91CD14();

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedCapsuleViewRegistration));
  swift_release();
  v3 = *(UIViewAnimationInfo **)((char *)&self->super.super._animationInfo
                               + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  v4 = *(id *)((char *)&self->super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  v5 = *(_UITraitChangeRegistry **)((char *)&self->super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  v6 = *(uint64_t *)((char *)&self->super.super._layerRetained
                  + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  v7 = *(NSArray **)((char *)&self->super.super._subviewCache
                   + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  v8 = *(UIWindow **)((char *)&self->super.super._window + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration);
  sub_18B91E8D4(*(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_configuration));
  swift_bridgeObjectRelease();
  sub_18B91E840(v3, v4, v5, v6, v7, v8);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedCapsuleContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_borrowedContentMatchMoveReferenceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_capsuleMatchMoveReferenceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_controlsContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_leadingCornerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_participantsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_pinnedTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_snapshotContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_snapshotImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_trailingCornerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView____lazy_storage___controlsVisibility));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView_matchMovedViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16TabThumbnailView____lazy_storage___attachedCapsuleVisibility));
  swift_release();
}

@end
