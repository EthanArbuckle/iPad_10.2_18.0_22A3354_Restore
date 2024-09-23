@implementation PrivacyCategoryCollectionViewCell

- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33PrivacyCategoryCollectionViewCell *)sub_10031D540();
}

- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8AppStore33PrivacyCategoryCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView;
  v6 = objc_allocWithZone((Class)type metadata accessor for PrivacyCategoryView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0, v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategory) = 0;

  result = (_TtC8AppStore33PrivacyCategoryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PrivacyCategoryCollectionViewCell.swift", 48, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v13.receiver;
  -[PrivacyCategoryCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  _TtC8AppStore33PrivacyCategoryCollectionViewCell *v2;

  v2 = self;
  sub_10031D130();

}

- (_TtC8AppStore19PrivacyCategoryView)accessibilityCategoryView
{
  return (_TtC8AppStore19PrivacyCategoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_itemLayoutContext);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategory));
}

@end
