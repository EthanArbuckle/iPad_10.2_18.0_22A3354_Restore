@implementation SUUIDocumentStackItem

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (SUUIDocumentStackItem)initWithDocument:(id)a3 presentationOptions:(id)a4
{
  id v7;
  id v8;
  SUUIDocumentStackItem *v9;
  SUUIDocumentStackItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDocumentStackItem;
  v9 = -[SUUIDocumentStackItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v10->_presentationOptions, a4);
    v10->_usesNavigationControllerForModalPresentation = 1;
  }

  return v10;
}

- (SUUIDocumentStackItem)init
{
  return -[SUUIDocumentStackItem initWithDocument:presentationOptions:](self, "initWithDocument:presentationOptions:", 0, 0);
}

- (void)_setDocument:(id)a3
{
  IKAppDocument *v5;
  IKAppDocument **p_document;
  IKAppDocument *document;
  IKAppDocument *v8;

  v5 = (IKAppDocument *)a3;
  document = self->_document;
  p_document = &self->_document;
  if (document != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_document, a3);
    v5 = v8;
  }

}

- (BOOL)isAnimated
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("animated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = objc_msgSend(v2, "BOOLValue");
    else
      v3 = 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (NSString)presentationType
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("type"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = CFSTR("sheet");
  v4 = v3;

  return v4;
}

- (NSString)sheetType
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("sheetType"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = CFSTR("formSheet");
  v4 = v3;

  return v4;
}

- (NSString)overlayType
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("overlayType"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = CFSTR("default");
  v4 = v3;

  return v4;
}

- (NSString)sourceElementIdentifier
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("sourceElement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (IKAppDocument)document
{
  return self->_document;
}

- (SUUINavigationDocumentController)navigationDocumentController
{
  return self->_navigationDocumentController;
}

- (void)setNavigationDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDocumentController, a3);
}

- (NSDictionary)presentationOptions
{
  return self->_presentationOptions;
}

- (BOOL)usesNavigationControllerForModalPresentation
{
  return self->_usesNavigationControllerForModalPresentation;
}

- (void)setUsesNavigationControllerForModalPresentation:(BOOL)a3
{
  self->_usesNavigationControllerForModalPresentation = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (void)setPopoverPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverPresentationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_navigationDocumentController, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
