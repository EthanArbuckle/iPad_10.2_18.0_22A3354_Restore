@implementation IKNavigationItem

- (IKNavigationItem)initWithDocument:(id)a3 presentationOptions:(id)a4
{
  id v7;
  id v8;
  IKNavigationItem *v9;
  IKNavigationItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKNavigationItem;
  v9 = -[IKNavigationItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (IKAppDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
