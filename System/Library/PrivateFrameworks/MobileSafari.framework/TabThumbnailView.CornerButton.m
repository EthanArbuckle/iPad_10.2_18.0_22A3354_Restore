@implementation TabThumbnailView.CornerButton

- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView12CornerButton *)sub_18B973F18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView12CornerButton *)sub_18B9740B4(a3);
}

- (void)didReceiveHover:(id)a3
{
  id v4;
  _TtCC12MobileSafari16TabThumbnailView12CornerButton *v5;

  v4 = a3;
  v5 = self;
  sub_18B97504C(v4);

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s12CornerButtonCMa();
  return -[TabThumbnailView.CornerButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtCC12MobileSafari16TabThumbnailView12CornerButton *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _TtCC12MobileSafari16TabThumbnailView12CornerButton *v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  v5 = (objc_class *)_s12CornerButtonCMa();
  v12.receiver = self;
  v12.super_class = v5;
  v6 = self;
  v7 = -[TabThumbnailView.CornerButton isHighlighted](&v12, sel_isHighlighted);
  v11.receiver = v6;
  v11.super_class = v5;
  -[TabThumbnailView.CornerButton setHighlighted:](&v11, sel_setHighlighted_, v3);
  if (v7 == -[TabThumbnailView.CornerButton isHighlighted](v6, sel_isHighlighted))
  {

  }
  else
  {
    if (qword_1EDFE8CB0 != -1)
      swift_once();
    v8 = qword_1EE007B50;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v6;
    v10 = v6;
    sub_18BA820D4(v8, 0, (uint64_t)sub_18B9763A0, v9, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (void)layoutSubviews
{
  _TtCC12MobileSafari16TabThumbnailView12CornerButton *v2;

  v2 = self;
  sub_18B9753AC();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtCC12MobileSafari16TabThumbnailView12CornerButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_18B975FA8();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_18B97563C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(uint64_t))sub_18B9760C0);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_18B97563C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(uint64_t))sub_18B9761F4);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton____lazy_storage___blurRadius));
  v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  v5 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  v6 = *(UIViewAnimationInfo **)((char *)&self->super.super._animationInfo
                               + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_vibrantEffectView));
}

@end
