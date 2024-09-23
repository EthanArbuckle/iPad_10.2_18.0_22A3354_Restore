@implementation ArticleThumbnailComponentSizerFactory

- (NSString)type
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int)role
{
  return *(_DWORD *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_role);
}

- (_TtC12NewsArticles37ArticleThumbnailComponentSizerFactory)init
{
  _TtC12NewsArticles37ArticleThumbnailComponentSizerFactory *result;

  result = (_TtC12NewsArticles37ArticleThumbnailComponentSizerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_linkedContentProvider));
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v11;
  _TtC12NewsArticles37ArticleThumbnailComponentSizerFactory *v12;
  id v13;
  void *v14;
  objc_class *v15;
  char *v16;
  id v17;
  _TtC12NewsArticles37ArticleThumbnailComponentSizerFactory *v18;
  objc_super v20;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = a5;
  swift_unknownObjectRetain();
  v12 = self;
  v13 = objc_msgSend(a6, sel_componentStyleForComponent_, a3);
  v14 = *(Class *)((char *)&v12->super.isa
                 + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_linkedContentProvider);
  v15 = (objc_class *)type metadata accessor for ArticleThumbnailComponentSizer();
  v16 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC12NewsArticles30ArticleThumbnailComponentSizer_linkedContentProvider] = v14;
  v20.receiver = v16;
  v20.super_class = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v17 = v14;
  v18 = -[ArticleThumbnailComponentSizerFactory initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v20, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, a3, a4, v13, a6, v11);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease_n();
  swift_unknownObjectRelease_n();
  swift_unknownObjectRelease();
  return v18;
}

@end
