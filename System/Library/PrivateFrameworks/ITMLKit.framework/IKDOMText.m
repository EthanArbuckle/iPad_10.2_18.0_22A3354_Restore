@implementation IKDOMText

- (id)nodeName
{
  return CFSTR("#text");
}

- (int64_t)nodeType
{
  return 3;
}

- (void)setTextContent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMText;
  -[IKDOMCharacterData setData:](&v3, sel_setData_, a3);
}

@end
