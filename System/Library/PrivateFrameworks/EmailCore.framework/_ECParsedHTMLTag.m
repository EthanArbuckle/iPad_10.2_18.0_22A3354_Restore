@implementation _ECParsedHTMLTag

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ECParsedHTMLTag;
  -[_ECParsedHTMLNode dealloc](&v3, sel_dealloc);
}

- (id)tagName
{
  return self->_tagName;
}

- (void)setTagName:(id)a3
{
  NSString *tagName;

  tagName = self->_tagName;
  if (tagName != a3)
  {

    self->_tagName = (NSString *)a3;
  }
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  id v5;
  id v7;
  _ECMessageBodyConsumableNewline *v8;
  void *v9;
  objc_super v10;

  v5 = -[_ECParsedHTMLTag tagName](self, "tagName");
  if ((objc_msgSend(a3, "isFull") & 1) != 0)
    return 0;
  if (+[ECMessageBodyParser isLinebreakImpliedBeforeTagName:](ECMessageBodyParser, "isLinebreakImpliedBeforeTagName:", v5))
  {
    objc_msgSend(a3, "appendNewline");
  }
  v10.receiver = self;
  v10.super_class = (Class)_ECParsedHTMLTag;
  v7 = -[_ECParsedHTMLNode copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator:](&v10, sel_copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator_, a3);
  if (+[ECMessageBodyParser isLinebreakImpliedAfterTagName:](ECMessageBodyParser, "isLinebreakImpliedAfterTagName:", v5))
  {
    v8 = objc_alloc_init(_ECMessageBodyConsumableNewline);
    if (v7)
    {
      objc_msgSend(v7, "addObject:", v8);
      v9 = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v8, 0);
    }

  }
  else
  {
    v9 = 0;
  }
  if (v7)
    return v7;
  else
    return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), -[_ECParsedHTMLTag tagName](self, "tagName"));
}

@end
