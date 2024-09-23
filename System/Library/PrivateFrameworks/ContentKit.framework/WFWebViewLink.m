@implementation WFWebViewLink

- (WFWebViewLink)initWithHref:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  WFWebViewLink *v11;
  WFWebViewLink *v12;
  WFWebViewLink *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFWebViewLink;
  v11 = -[WFWebViewLink init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_href, a3);
    v12->_rect.origin.x = x;
    v12->_rect.origin.y = y;
    v12->_rect.size.width = width;
    v12->_rect.size.height = height;
    v13 = v12;
  }

  return v12;
}

- (NSURL)href
{
  return self->_href;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_href, 0);
}

@end
