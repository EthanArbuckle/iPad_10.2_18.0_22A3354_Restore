@implementation CSProminentUISpacerViewController

- (CSProminentUISpacerViewController)init
{
  CSProminentUISpacerViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSProminentUISpacerViewController;
  result = -[CSProminentUISpacerViewController init](&v3, sel_init);
  if (result)
    result->_containerSize = (CGSize)*MEMORY[0x1E0C9D820];
  return result;
}

- (void)loadView
{
  CSProminentUISpacerView *v3;
  CSProminentUISpacerView *v4;

  v3 = [CSProminentUISpacerView alloc];
  v4 = -[CSProminentUISpacerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CSProminentUISpacerView setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
  -[CSProminentUISpacerViewController setView:](self, "setView:", v4);
  -[CSProminentUISpacerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)viewDidLoad
{
  void *v3;
  CSDashBoardRemoteContentSettings *v4;
  CSDashBoardRemoteContentSettings *remoteContentSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSProminentUISpacerViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dashBoardRemoteContentSettings");
  v4 = (CSDashBoardRemoteContentSettings *)objc_claimAutoreleasedReturnValue();
  remoteContentSettings = self->_remoteContentSettings;
  self->_remoteContentSettings = v4;

  -[PTSettings addKeyObserver:](self->_remoteContentSettings, "addKeyObserver:", self);
  -[CSProminentUISpacerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)setTopMarginToMimic:(double)a3
{
  if (self->_topMarginToMimic != a3)
  {
    self->_topMarginToMimic = a3;
    -[CSProminentUISpacerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    -[CSProminentUISpacerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)usesBackgroundView
{
  return 0;
}

- (BOOL)insetsMargins
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_remoteContentSettings == a3)
    -[CSProminentUISpacerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  double width;
  double topMarginToMimic;
  id v5;

  width = self->_containerSize.width;
  topMarginToMimic = self->_topMarginToMimic;
  -[CSProminentUISpacerViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, topMarginToMimic);
  -[CSProminentUISpacerViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, width, topMarginToMimic);

}

- (double)topMarginToMimic
{
  return self->_topMarginToMimic;
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
}

@end
