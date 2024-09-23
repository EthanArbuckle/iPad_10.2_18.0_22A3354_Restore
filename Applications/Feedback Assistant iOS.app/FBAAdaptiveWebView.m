@implementation FBAAdaptiveWebView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBAAdaptiveWebView;
  -[FBAAdaptiveWebView layoutSubviews](&v3, "layoutSubviews");
  -[FBAAdaptiveWebView updateViewport](self, "updateViewport");
}

- (id)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBAAdaptiveWebView;
  v5 = -[FBAAdaptiveWebView loadHTMLString:baseURL:](&v8, "loadHTMLString:baseURL:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[FBAAdaptiveWebView updateViewport](self, "updateViewport");
  return v6;
}

- (void)updateViewport
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("var viewport = 'width=device-width initial-scale=1 minimum-scale=1 maximum-scale=1 user-scalable=no';                     var viewportElement = document.querySelector('meta[name=viewport]');                     if (viewportElement) {                     viewportElement.content = viewport;                     } else {                     viewportElement = document.createElement('meta');                     viewportElement.name = 'viewport';                     viewportElement.content = viewport;                     document.getElementsByTagName('head')[0].appendChild(viewportElement);                     }")));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043060;
  v4[3] = &unk_1000E7A18;
  v4[4] = self;
  -[FBAAdaptiveWebView evaluateJavaScript:completionHandler:](self, "evaluateJavaScript:completionHandler:", v3, v4);

}

@end
