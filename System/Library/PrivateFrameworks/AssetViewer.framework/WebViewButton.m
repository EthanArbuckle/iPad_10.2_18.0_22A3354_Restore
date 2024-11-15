@implementation WebViewButton

- (_TtC11AssetViewer13WebViewButton)initWithFrame:(CGRect)a3
{
  return (_TtC11AssetViewer13WebViewButton *)sub_1D94CFADC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11AssetViewer13WebViewButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D94D0160();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WebViewButton();
  return -[WebViewButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WebViewButton();
  v4 = (char *)v5.receiver;
  -[WebViewButton setHighlighted:](&v5, sel_setHighlighted_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11AssetViewer13WebViewButton_highlightedOverlayView], sel_setHidden_, objc_msgSend(v4, sel_isHighlighted, v5.receiver, v5.super_class) ^ 1);

}

- (void).cxx_destruct
{
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11AssetViewer13WebViewButton_completionHandler));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer13WebViewButton_highlightedOverlayView));
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC11AssetViewer13WebViewButton *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D94D0284(MEMORY[0x1E0DF2290], "webView:didFinish", 1);

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4;
  _TtC11AssetViewer13WebViewButton *v5;

  v4 = a3;
  v5 = self;
  sub_1D94D0284(MEMORY[0x1E0DF2280], "webViewWebContentProcessDidTerminate:", 0);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC11AssetViewer13WebViewButton *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1D94D03AC(v11, "webView:didFail:withError:%s");

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC11AssetViewer13WebViewButton *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1D94D03AC(v11, "webView:didFailProvisionalNavigation:withError:%s");

}

@end
