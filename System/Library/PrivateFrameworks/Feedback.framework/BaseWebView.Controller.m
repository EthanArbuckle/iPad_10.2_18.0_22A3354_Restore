@implementation BaseWebView.Controller

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller *v12;
  _QWORD v13[6];

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_22DE1F28C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v13[4] = sub_22DD7C9EC;
  v13[5] = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_22DD7BF80;
  v13[3] = &block_descriptor_0;
  v11 = _Block_copy(v13);
  v12 = v8;
  swift_release();
  objc_msgSend(v6, sel_evaluateJavaScript_completionHandler_, v9, v11);
  _Block_release(v11);

}

- (_TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller)init
{
  _OWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent);
  v4 = (objc_class *)type metadata accessor for BaseWebView.Controller();
  *v3 = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return -[BaseWebView.Controller init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_22DD7CB40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent), *(_QWORD *)&self->parent[OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent], *(_QWORD *)&self->parent[OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent+ 8], *(_QWORD *)&self->parent[OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent+ 16], *(_QWORD *)&self->parent[OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent+ 24], *(void **)&self->parent[OBJC_IVAR____TtCV8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D11BaseWebView10Controller_parent+ 32]);
}

@end
