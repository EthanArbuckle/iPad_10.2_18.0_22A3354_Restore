@implementation CollectionViewTableLayout

- (_TtC20ProductPageExtension25CollectionViewTableLayout)init
{
  _TtC20ProductPageExtension25CollectionViewTableLayout *v2;
  void *v3;
  _TtC20ProductPageExtension25CollectionViewTableLayout *v4;
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

- (_TtC20ProductPageExtension25CollectionViewTableLayout)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension25CollectionViewTableLayout *result;

  result = (_TtC20ProductPageExtension25CollectionViewTableLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CollectionViewTableLayout.swift", 52, 2, 26, 0);
  __break(1u);
  return result;
}

@end
