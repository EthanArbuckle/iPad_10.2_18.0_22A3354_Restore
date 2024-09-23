@implementation LargeHeroBreakoutCollectionViewCell

- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell *)sub_10032FA1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100330C30();
}

- (void)layoutSubviews
{
  _TtC8AppStore35LargeHeroBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_1003302DC();

}

- (void)prepareForReuse
{
  _TtC8AppStore35LargeHeroBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_10032E704();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[LargeHeroBreakoutCollectionViewCell traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10032F588();

}

- (void)didTapActionButton
{
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _TtC8AppStore35LargeHeroBreakoutCollectionViewCell *v6;

  v2 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailsView)
     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler;
  v3 = *(void (**)(uint64_t))v2;
  if (*(_QWORD *)v2)
  {
    v4 = *((_QWORD *)v2 + 1);
    v6 = self;
    v5 = sub_10003A340((uint64_t)v3, v4);
    v3(v5);
    sub_10003A350((uint64_t)v3, v4);

  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC8AppStore35LargeHeroBreakoutCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100330744((uint64_t)v4);

}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailsView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailPosition;
  v5 = type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_pageTraits));
}

@end
