@implementation CollectionViewTableLayout

- (_TtC8AppStore25CollectionViewTableLayout)init
{
  _TtC8AppStore25CollectionViewTableLayout *v2;
  void *v3;
  _TtC8AppStore25CollectionViewTableLayout *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CollectionViewTableLayout();
  v2 = -[CollectionViewTableLayout init](&v7, "init");
  v3 = (void *)objc_opt_self(UIColor);
  v4 = v2;
  v5 = objc_msgSend(v3, "separatorColor");
  -[CollectionViewTableLayout setSeparatorColor:](v4, "setSeparatorColor:", v5);

  return v4;
}

- (_TtC8AppStore25CollectionViewTableLayout)initWithCoder:(id)a3
{
  _TtC8AppStore25CollectionViewTableLayout *result;

  result = (_TtC8AppStore25CollectionViewTableLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/CollectionViewTableLayout.swift", 40, 2, 26, 0);
  __break(1u);
  return result;
}

@end
