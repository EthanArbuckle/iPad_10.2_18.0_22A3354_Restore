@implementation IKDOMDocumentFragment

- (id)nodeName
{
  return CFSTR("#document-fragment");
}

- (int64_t)nodeType
{
  return 11;
}

- (IKDOMHTMLCollection)children
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMDocumentFragment;
  -[IKDOMNode children](&v3, sel_children);
  return (IKDOMHTMLCollection *)(id)objc_claimAutoreleasedReturnValue();
}

- (IKDOMElement)firstElementChild
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMDocumentFragment;
  -[IKDOMNode firstElementChild](&v3, sel_firstElementChild);
  return (IKDOMElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (IKDOMElement)lastElementChild
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMDocumentFragment;
  -[IKDOMNode lastElementChild](&v3, sel_lastElementChild);
  return (IKDOMElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)childElementCount
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMDocumentFragment;
  return -[IKDOMNode childElementCount](&v3, sel_childElementCount);
}

@end
