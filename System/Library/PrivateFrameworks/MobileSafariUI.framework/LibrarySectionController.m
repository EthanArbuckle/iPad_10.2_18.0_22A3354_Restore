@implementation LibrarySectionController

- (LibrarySectionController)initWithConfiguration:(id)a3
{
  id v5;
  LibrarySectionController *v6;
  LibrarySectionController *v7;
  LibrarySectionController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LibrarySectionController;
  v6 = -[LibrarySectionController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)filteredItemControllers
{
  void *v2;
  void *v3;

  -[LibrarySectionController itemControllers](self, "itemControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __51__LibrarySectionController_filteredItemControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (void)contentDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentObserver);
  objc_msgSend(WeakRetained, "librarySectionContentDidChange:", self);

}

- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5
{
  return a4;
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)itemControllers
{
  return self->_itemControllers;
}

- (LibraryContentObserver)contentObserver
{
  return (LibraryContentObserver *)objc_loadWeakRetained((id *)&self->_contentObserver);
}

- (void)setContentObserver:(id)a3
{
  objc_storeWeak((id *)&self->_contentObserver, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_contentObserver);
  objc_storeStrong((id *)&self->_itemControllers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
