@implementation CollectionViewLayoutEnvironment

- (NSCollectionLayoutContainer)container
{
  return (NSCollectionLayoutContainer *)(id)sub_1AB5C1AA8();
}

- (void)setContainer:(id)a3
{
  _TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AB5C1B04((uint64_t)a3);

}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)sub_1AB5C1B3C();
}

- (void)setTraitCollection:(id)a3
{
  id v4;
  _TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5C1B94((uint64_t)v4);

}

- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment)init
{
  sub_1AB5C1BA8();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment_traitCollection));
}

@end
