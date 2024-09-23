@implementation ToggleContentBlockersActivity

- (id)activityType
{
  return CFSTR("SafariActivityTypeToggleContentBlockers");
}

- (id)activityTitleWithTabDocument:(id)a3
{
  objc_msgSend(a3, "wasLoadedWithContentBlockersEnabled");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  if (objc_msgSend(a3, "wasLoadedWithContentBlockersEnabled"))
    return CFSTR("shield.slash");
  else
    return CFSTR("checkmark.shield");
}

- (int64_t)actionType
{
  return 19;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isShowingReader") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "browserController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "perSitePreferencesVendor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentBlockersPreferenceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "hasEnabledContentBlockers");

  }
  return v4;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "reloadDisablingContentBlockers:", objc_msgSend(v4, "wasLoadedWithContentBlockersEnabled") ^ 1);

  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
