@implementation ArticleThumbnailComponentView

- (void)renderContents
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  sub_1B9E47EB8();

}

- (void)discardContents
{
  _TtC12NewsArticles29ArticleThumbnailComponentView *v2;

  v2 = self;
  sub_1B9E48384();

}

- (void)presentComponentWithChanges:(id)a3
{
  int v3;
  _TtC12NewsArticles29ArticleThumbnailComponentView *v4;

  v3 = *(_DWORD *)&a3.var0 & 0x10101;
  v4 = self;
  sub_1B9E4849C(v3);

}

- (_TtC12NewsArticles29ArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v7;
  _TtC12NewsArticles29ArticleThumbnailComponentView *result;

  swift_unknownObjectRetain();
  v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles29ArticleThumbnailComponentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_linkedContentProvider));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_articleThumbnailViewRenderer);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29ArticleThumbnailComponentView_articleThumbnailView));
}

@end
