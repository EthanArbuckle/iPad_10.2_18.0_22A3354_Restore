@implementation IKDOMComment

- (id)nodeName
{
  return CFSTR("#comment");
}

- (int64_t)nodeType
{
  return 8;
}

- (void)setTextContent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMComment;
  -[IKDOMCharacterData setData:](&v3, sel_setData_, a3);
}

@end
