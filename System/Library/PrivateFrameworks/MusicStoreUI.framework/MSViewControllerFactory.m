@implementation MSViewControllerFactory

- (id)newDownloadManagerOptions
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB1E20]);
  objc_msgSend(v2, "setDownloadKinds:", objc_msgSend(MEMORY[0x24BEB1E18], "ITunesDownloadKinds"));
  objc_msgSend(v2, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x24BEC8CB8], "downloadExternalProperties"));
  objc_msgSend(v2, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x24BEC8CB8], "downloadProperties"));
  return v2;
}

- (id)newDownloadsViewController
{
  return 0;
}

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D68]), "initWithSection:", a3);
  objc_msgSend(v3, "setLocalizationBundle:", objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
  return v3;
}

- (id)newPlaceholderViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSViewControllerFactory;
  v2 = -[SUViewControllerFactory newPlaceholderViewController](&v4, sel_newPlaceholderViewController);
  objc_msgSend(v2, "setDefaultBackgroundGradient:", objc_msgSend(MEMORY[0x24BEC8D08], "gradientWithColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor")));
  return v2;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4
{
  id v4;
  uint64_t v6;
  objc_super v7;

  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)MSViewControllerFactory;
    return -[SUViewControllerFactory newViewControllerForPage:ofType:](&v7, sel_newViewControllerForPage_ofType_, a3);
  }
  v6 = objc_msgSend(a3, "type");
  if (v6 == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEC8D98]);
    objc_msgSend(v4, "setDataSourceClass:", objc_opt_class());
    return v4;
  }
  if (v6 == 1)
    return objc_alloc_init(MSTrackListViewController);
  else
    return objc_alloc_init(MSStructuredPageViewController);
}

- (id)newViewControllerForTrackList:(id)a3
{
  MSTrackListViewController *v4;

  v4 = objc_alloc_init(MSTrackListViewController);
  -[MSStructuredPageViewController reloadWithStorePage:forURL:](v4, "reloadWithStorePage:forURL:", a3, 0);
  return v4;
}

- (id)newVolumeViewController
{
  return objc_alloc_init(MSVolumeViewController);
}

@end
