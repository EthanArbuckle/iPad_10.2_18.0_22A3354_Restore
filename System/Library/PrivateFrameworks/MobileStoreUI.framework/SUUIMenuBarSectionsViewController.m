@implementation SUUIMenuBarSectionsViewController

- (SUUIMenuBarSectionsViewController)initWithLayoutStyle:(int64_t)a3
{
  SUUIMenuBarSectionsViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIMenuBarSectionsViewController;
  result = -[SUUIStorePageSectionsViewController initWithLayoutStyle:](&v4, sel_initWithLayoutStyle_, a3);
  if (result)
    result->_numberOfIterationsForShelfPageSections = 1;
  return result;
}

- (id)defaultSectionForComponent:(id)a3
{
  id v4;
  SUUIMenuBarTemplateShelfPageSectionConfiguration *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "componentType") == 22)
  {
    v5 = -[SUUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:]([SUUIMenuBarTemplateShelfPageSectionConfiguration alloc], "initWithNumberOfIterations:", -[SUUIMenuBarSectionsViewController numberOfIterationsForShelfPageSections](self, "numberOfIterationsForShelfPageSections"));
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(v4, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDynamicContainer");

    if (v8)
      v6 = (objc_class *)objc_opt_class();
    v9 = (void *)objc_msgSend([v6 alloc], "initWithPageComponent:configuration:", v4, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfIterationsForShelfPageSections
{
  return self->_numberOfIterationsForShelfPageSections;
}

- (void)setNumberOfIterationsForShelfPageSections:(unint64_t)a3
{
  self->_numberOfIterationsForShelfPageSections = a3;
}

@end
