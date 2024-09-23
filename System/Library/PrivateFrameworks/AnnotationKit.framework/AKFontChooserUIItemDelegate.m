@implementation AKFontChooserUIItemDelegate

- (int64_t)tag
{
  return 765105;
}

- (id)convertFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKFontChooserUIItemDelegate parentController](self, "parentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)syncFontsToUI:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKFontChooserUIItemDelegate parentController](self, "parentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncFontsToUI:", v4);

}

- (AKTextAttributesViewController)parentController
{
  return (AKTextAttributesViewController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentController);
}

@end
