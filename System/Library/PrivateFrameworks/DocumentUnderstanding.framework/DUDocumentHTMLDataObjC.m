@implementation DUDocumentHTMLDataObjC

- (DUDocumentHTMLDataObjC)init
{
  DUDocumentHTMLDataObjC *v2;
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v3;
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *underlyingElement;
  DUDocumentHTMLDataObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUDocumentHTMLDataObjC;
  v2 = -[DUDocumentHTMLDataObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding18DUDocumentHTMLData);
    underlyingElement = v2->_underlyingElement;
    v2->_underlyingElement = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)htmlString
{
  return -[DUDocumentHTMLData htmlString](self->_underlyingElement, "htmlString");
}

- (void)setHtmlString:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDocumentHTMLData setHtmlString:](self->_underlyingElement, "setHtmlString:", v4);

}

- (DUDocumentEmailDataObjC)documentEmailData
{
  void *v3;
  void *v4;
  void *v5;

  -[DUDocumentHTMLData documentEmailData](self->_underlyingElement, "documentEmailData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DUDocumentHTMLData documentEmailData](self->_underlyingElement, "documentEmailData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objCEmailDataForEmailData:](DUObjCCompatibilityUtils, "objCEmailDataForEmailData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (DUDocumentEmailDataObjC *)v5;
}

- (void)setDocumentEmailData:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils emailDataForObjCEmailData:](DUObjCCompatibilityUtils, "emailDataForObjCEmailData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUDocumentHTMLData setDocumentEmailData:](self->_underlyingElement, "setDocumentEmailData:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingElement, 0);
}

@end
