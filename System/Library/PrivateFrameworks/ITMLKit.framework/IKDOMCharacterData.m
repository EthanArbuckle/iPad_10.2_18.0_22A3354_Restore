@implementation IKDOMCharacterData

- (NSString)data
{
  _xmlNode *v2;
  xmlChar *Content;
  xmlChar *v4;
  void *v5;

  v2 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v2 && (Content = xmlNodeGetContent(v2)) != 0)
  {
    v4 = Content;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Content);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setData:(id)a3
{
  _xmlNode *v4;
  xmlNode *v5;
  id v6;

  v6 = a3;
  v4 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      xmlNodeSetContent(v5, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      -[IKDOMNode updatedAndMark:notify:](self, "updatedAndMark:notify:", 1, 1);
    }
  }

}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[IKDOMCharacterData data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

@end
