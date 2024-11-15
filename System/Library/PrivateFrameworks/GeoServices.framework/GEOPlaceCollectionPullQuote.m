@implementation GEOPlaceCollectionPullQuote

- (GEOPlaceCollectionPullQuote)initWithPlainText:(id)a3 htmlText:(id)a4
{
  id v7;
  id v8;
  GEOPlaceCollectionPullQuote *v9;
  id *p_isa;
  GEOPlaceCollectionPullQuote *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") || objc_msgSend(v8, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOPlaceCollectionPullQuote;
    v9 = -[GEOPlaceCollectionPullQuote init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_plainTextDescription, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)plainTextDescription
{
  return self->_plainTextDescription;
}

- (NSString)htmlDescription
{
  return self->_htmlDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlDescription, 0);
  objc_storeStrong((id *)&self->_plainTextDescription, 0);
}

@end
