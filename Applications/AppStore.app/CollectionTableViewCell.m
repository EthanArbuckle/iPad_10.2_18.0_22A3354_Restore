@implementation CollectionTableViewCell

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  v2 = v3.receiver;
  -[CollectionTableViewCell prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend(v2, "setSelectionStyle:", 0, v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  v2 = (char *)v14.receiver;
  -[CollectionTableViewCell layoutSubviews](&v14, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "contentView", v14.receiver, v14.super_class);
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    v2 = v4;
  }

}

- (_TtC8AppStore23CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8AppStore23CollectionTableViewCell *)sub_1002E0514(a3, (uint64_t)a4, v6);
}

- (_TtC8AppStore23CollectionTableViewCell)initWithCoder:(id)a3
{
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_dataSource) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_delegate);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  return -[CollectionTableViewCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_dataSource));
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView));
}

@end
