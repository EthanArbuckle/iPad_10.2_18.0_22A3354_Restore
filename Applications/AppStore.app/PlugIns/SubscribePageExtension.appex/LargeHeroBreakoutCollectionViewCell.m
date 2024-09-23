@implementation LargeHeroBreakoutCollectionViewCell

- (_TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell *)sub_10059666C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100597860();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_100596F2C();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_10059626C();

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
  sub_100595F08();

}

- (void)didTapActionButton
{
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell *v6;

  v2 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_detailsView)
     + OBJC_IVAR____TtC22SubscribePageExtension19BreakoutDetailsView_callToActionButtonHandler;
  v3 = *(void (**)(uint64_t))v2;
  if (*(_QWORD *)v2)
  {
    v4 = *((_QWORD *)v2 + 1);
    v6 = self;
    v5 = sub_100019320((uint64_t)v3, v4);
    v3(v5);
    sub_100019310((uint64_t)v3, v4);

  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100597394((uint64_t)v4);

}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;

  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_detailsView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_detailPosition;
  v5 = type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension35LargeHeroBreakoutCollectionViewCell_pageTraits));
}

@end
