@implementation IKMenuBarElement

+ (id)supportedFeatures
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MenuBarDocument");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (IKMenuBarElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  IKMenuBarElement *v5;
  IKMenuBarElement *v6;
  void *v7;
  uint64_t v8;
  IKAppMenuBarDocument *menuBarDocument;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IKMenuBarElement;
  v5 = -[IKCollectionElement initWithDOMElement:parent:elementFactory:](&v11, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[IKViewElement features](v5, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    menuBarDocument = v6->_menuBarDocument;
    v6->_menuBarDocument = (IKAppMenuBarDocument *)v8;

  }
  return v6;
}

- (IKAppMenuBarDocument)menuBarDocument
{
  return self->_menuBarDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuBarDocument, 0);
}

@end
