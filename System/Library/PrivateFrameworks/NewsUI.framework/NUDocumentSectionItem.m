@implementation NUDocumentSectionItem

- (NUDocumentSectionItem)initWithViewController:(id)a3 sectionHeight:(double)a4
{
  id v7;
  NUDocumentSectionItem *v8;
  NUDocumentSectionItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUDocumentSectionItem;
  v8 = -[NUDocumentSectionItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a3);
    v9->_sectionHeight = a4;
  }

  return v9;
}

- (id)sectionItemViewController
{
  return self->_viewController;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_getProperty(self, a2, 16, 1);
}

- (NUDocumentSectionItemHeightProvider)heightProvider
{
  return (NUDocumentSectionItemHeightProvider *)objc_getProperty(self, a2, 24, 1);
}

- (double)sectionHeight
{
  return self->_sectionHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightProvider, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
