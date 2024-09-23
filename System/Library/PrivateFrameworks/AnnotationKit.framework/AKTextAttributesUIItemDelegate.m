@implementation AKTextAttributesUIItemDelegate

- (int64_t)tag
{
  return 765106;
}

- (id)convertTextAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKTextAttributesUIItemDelegate parentController](self, "parentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertTextAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)syncTextAttributesToUI:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKTextAttributesUIItemDelegate parentController](self, "parentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncTextAttributesToUI:", v4);

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
