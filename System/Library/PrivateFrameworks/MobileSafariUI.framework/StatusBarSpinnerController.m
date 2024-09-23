@implementation StatusBarSpinnerController

- (StatusBarSpinnerController)init
{
  StatusBarSpinnerController *v2;
  StatusBarSpinnerController *v3;
  StatusBarSpinnerController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StatusBarSpinnerController;
  v2 = -[StatusBarSpinnerController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (void)didStartLoadingResource
{
  int currentlyLoadingResourcesCount;

  currentlyLoadingResourcesCount = self->_currentlyLoadingResourcesCount;
  self->_currentlyLoadingResourcesCount = currentlyLoadingResourcesCount + 1;
  if (!currentlyLoadingResourcesCount && self->_enabled)
    -[StatusBarSpinnerController _setResourcesLoading:](self, "_setResourcesLoading:", 1);
}

- (void)didStopLoadingResource
{
  int v2;

  v2 = self->_currentlyLoadingResourcesCount - 1;
  self->_currentlyLoadingResourcesCount = v2;
  if (!v2 && self->_enabled)
    -[StatusBarSpinnerController _setResourcesLoading:](self, "_setResourcesLoading:", 0);
}

- (void)updateProgressWithResource:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  float v8;
  BOOL v9;
  id WeakRetained;
  double v11;
  id obj;

  v4 = a3;
  v5 = v4;
  if (self->_enabled)
  {
    obj = v4;
    v6 = objc_msgSend(v4, "isActive");
    v5 = obj;
    if (v6)
    {
      objc_msgSend(obj, "estimatedProgress");
      v8 = v7;
      v9 = v8 < 1.0 && v8 > 0.0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_resourceWhoseProgressIsShown);
      if (WeakRetained == obj && (objc_msgSend(obj, "isContentReady") & 1) == 0)
      {

        if (!v9)
          goto LABEL_10;
      }
      else
      {

      }
      *(float *)&v11 = v8;
      -[StatusBarSpinnerController _setProgress:](self, "_setProgress:", v11);
LABEL_10:
      objc_storeWeak((id *)&self->_resourceWhoseProgressIsShown, obj);
      v5 = obj;
    }
  }

}

- (void)didFailLoadingResource:(id)a3
{
  if (objc_msgSend(a3, "isActive"))
    -[StatusBarSpinnerController _setResourcesLoading:](self, "_setResourcesLoading:", 0);
}

- (void)_setResourcesLoading:(BOOL)a3
{
  self->_resourcesLoading = a3;
  -[StatusBarSpinnerController _updateProgressIndicator](self, "_updateProgressIndicator");
}

- (void)_setProgress:(float)a3
{
  self->_progress = a3;
  -[StatusBarSpinnerController _updateProgressIndicator](self, "_updateProgressIndicator");
}

- (void)_updateProgressIndicator
{
  float progress;
  BOOL v3;

  progress = self->_progress;
  v3 = progress > 0.0 && progress < 1.0;
  if (v3 || self->_resourcesLoading)
  {
    if (!self->_showingProgressIndicator)
    {
      self->_showingProgressIndicator = 1;
      +[DelayedSpinner showWithDelay](DelayedSpinner, "showWithDelay");
    }
  }
  else if (self->_showingProgressIndicator)
  {
    self->_showingProgressIndicator = 0;
    +[DelayedSpinner hide](DelayedSpinner, "hide");
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceWhoseProgressIsShown);
}

@end
