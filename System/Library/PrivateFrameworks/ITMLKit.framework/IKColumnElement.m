@implementation IKColumnElement

- (NSString)columnType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[IKViewElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    -[IKViewElement style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "copy");

  }
  return (NSString *)v6;
}

- (IKImageElement)headerImage
{
  return (IKImageElement *)-[IKViewElement childImageElementWithType:](self, "childImageElementWithType:", 0);
}

@end
