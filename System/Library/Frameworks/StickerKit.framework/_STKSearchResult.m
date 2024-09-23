@implementation _STKSearchResult

- (STKStickerSearchQuery)originalQuery
{
  return (STKStickerSearchQuery *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____STKSearchResult_originalQuery));
}

- (NSArray)results
{
  void *v2;

  type metadata accessor for ImageGlyph(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_STKSearchResult)initWithOriginalQuery:(id)a3 results:(id)a4
{
  objc_class *v6;
  id v7;
  objc_super v9;

  type metadata accessor for ImageGlyph(0);
  v6 = (objc_class *)sub_2347178BC();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKSearchResult_originalQuery) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKSearchResult_results) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for _STKSearchResult();
  v7 = a3;
  return -[_STKSearchResult init](&v9, sel_init);
}

- (_STKSearchResult)init
{
  _STKSearchResult *result;

  result = (_STKSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
