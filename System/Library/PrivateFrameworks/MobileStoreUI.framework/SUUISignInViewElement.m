@implementation SUUISignInViewElement

- (SUUISignInViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUISignInViewElement;
  return -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v6, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
}

@end
