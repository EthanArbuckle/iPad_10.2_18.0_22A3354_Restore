@implementation HRTimelineHeaderView

+ (NSString)reuseIdentifier
{
  void *v2;

  swift_getObjCClassMetadata();
  sub_1BC3A4744();
  v2 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HRTimelineHeaderViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HRTimelineHeaderView_delegate;
  swift_beginAccess();
  return (HRTimelineHeaderViewDelegate *)(id)MEMORY[0x1BCCF37A4](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)separatorViewHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HRTimelineHeaderView_separatorViewHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setSeparatorViewHidden:(BOOL)a3
{
  unsigned __int8 *v5;
  HRTimelineHeaderView *v6;
  id v7;

  v5 = (unsigned __int8 *)self + OBJC_IVAR___HRTimelineHeaderView_separatorViewHidden;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  v7 = sub_1BC3CFE94();
  objc_msgSend(v7, sel_setHidden_, *v5);

}

- (HRTimelineHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1BC62C680();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (HRTimelineHeaderView *)TimelineHeaderView.init(reuseIdentifier:)(v3, v4);
}

- (HRTimelineHeaderView)initWithCoder:(id)a3
{
  return (HRTimelineHeaderView *)TimelineHeaderView.init(coder:)(a3);
}

- (void)applyTitle:(id)a3 subtitle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HRTimelineHeaderView *v11;

  v5 = sub_1BC62C680();
  v7 = v6;
  v8 = sub_1BC62C680();
  v10 = v9;
  v11 = self;
  sub_1BC3D0328(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)applyStyleFromNavigationBar:(id)a3
{
  HRTimelineHeaderView *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = self;
  v5 = a3;
  v6 = sub_1BC3CFDE8();
  if (v5 && (v7 = objc_msgSend(v5, sel__backdropViewLayerGroupName)) != 0)
  {
    v8 = v7;
    sub_1BC62C680();

    v10 = (id)sub_1BC62C650();
    swift_bridgeObjectRelease();
    v9 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;
  objc_msgSend(v6, sel__setGroupName_);

}

- (void)prepareForReuse
{
  HRTimelineHeaderView *v2;

  v2 = self;
  sub_1BC3D05D8();

}

- (BOOL)floating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TimelineHeaderView();
  return -[HRTimelineHeaderView floating](&v3, sel_floating);
}

- (void)setFloating:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  HRTimelineHeaderView *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for TimelineHeaderView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[HRTimelineHeaderView floating](&v9, sel_floating);
  v8.receiver = v6;
  v8.super_class = v5;
  -[HRTimelineHeaderView setFloating:](&v8, sel_setFloating_, v3);
  sub_1BC3D07A4(v7);

}

- (void)layoutSubviews
{
  HRTimelineHeaderView *v2;

  v2 = self;
  sub_1BC3D0960();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  HRTimelineHeaderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1BC3D0D50(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  HRTimelineHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1BC3D0E90(a3);

}

- (void).cxx_destruct
{
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR___HRTimelineHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRTimelineHeaderView____lazy_storage___separatorView));
}

@end
