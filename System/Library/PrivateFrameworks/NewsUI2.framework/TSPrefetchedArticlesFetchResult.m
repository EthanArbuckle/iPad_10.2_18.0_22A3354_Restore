@implementation TSPrefetchedArticlesFetchResult

- (NSString)selectedArticleID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)articleIDs
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26D68();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSDictionary)prefetchedHeadlines
{
  void *v2;

  sub_1D5FAC880();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E267C8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (TSPrefetchedArticlesFetchResult)initWithSelectedArticleID:(id)a3 articleIDs:(id)a4 prefetchedHeadlines:(id)a5
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1D6E26978();
  v9 = v8;
  v10 = (objc_class *)sub_1D6E26D80();
  sub_1D5FAC880();
  v11 = (objc_class *)sub_1D6E267D4();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___TSPrefetchedArticlesFetchResult_selectedArticleID);
  *v12 = v7;
  v12[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSPrefetchedArticlesFetchResult_articleIDs) = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSPrefetchedArticlesFetchResult_prefetchedHeadlines) = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return -[TSPrefetchedArticlesFetchResult init](&v14, sel_init);
}

- (TSPrefetchedArticlesFetchResult)init
{
  TSPrefetchedArticlesFetchResult *result;

  result = (TSPrefetchedArticlesFetchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
