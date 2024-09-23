@implementation SHShazamModule

- (void)setContentModuleContext:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  v5 = a3;
  -[SHShazamMenuModuleViewController setContentModuleContext:](self->_shazamMenuModuleViewController, "setContentModuleContext:", v5);

}

- (id)contentViewControllerForContext:(id)a3
{
  SHShazamMenuModuleViewController *shazamMenuModuleViewController;
  SHShazamMenuModuleViewController *v5;
  SHShazamMenuModuleViewController *v6;

  shazamMenuModuleViewController = self->_shazamMenuModuleViewController;
  if (!shazamMenuModuleViewController)
  {
    v5 = objc_alloc_init(SHShazamMenuModuleViewController);
    v6 = self->_shazamMenuModuleViewController;
    self->_shazamMenuModuleViewController = v5;

    -[SHShazamMenuModuleViewController setContentModuleContext:](self->_shazamMenuModuleViewController, "setContentModuleContext:", self->_contentModuleContext);
    shazamMenuModuleViewController = self->_shazamMenuModuleViewController;
  }
  return shazamMenuModuleViewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (SHShazamMenuModuleViewController)shazamMenuModuleViewController
{
  return self->_shazamMenuModuleViewController;
}

- (void)setShazamMenuModuleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shazamMenuModuleViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shazamMenuModuleViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
