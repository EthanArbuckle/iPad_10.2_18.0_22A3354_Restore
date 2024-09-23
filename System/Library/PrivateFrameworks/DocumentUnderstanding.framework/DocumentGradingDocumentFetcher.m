@implementation DocumentGradingDocumentFetcher

- (_TtC21DocumentUnderstanding30DocumentGradingDocumentFetcher)init
{
  id v3;
  _TtC21DocumentUnderstanding30DocumentGradingDocumentFetcher *v4;
  objc_super v6;

  v3 = objc_allocWithZone((Class)type metadata accessor for DUDocumentUpdater());
  v4 = self;
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC21DocumentUnderstanding30DocumentGradingDocumentFetcher_documentUpdater) = (Class)specialized DUDocumentUpdater.init(client:)(0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DocumentGradingDocumentFetcher();
  return -[DocumentGradingDocumentFetcher init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding30DocumentGradingDocumentFetcher_documentUpdater));
}

@end
