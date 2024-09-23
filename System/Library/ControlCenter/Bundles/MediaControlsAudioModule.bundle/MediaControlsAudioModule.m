id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

 objc_msgSend_environment(v4, v8, v9, v10) != 1;
  else
    v11 = 0;
  objc_msgSend_volumeViewController(self, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrimaryGlyphShouldBeTinted_(v12, v13, v11, v14);

  objc_msgSend_volumeViewController(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (MRUVolumeViewController)volumeViewController
{
  MRUVolumeViewController *volumeViewController;
  id v4;
  const char *v5;
  uint64_t v6;
  float v7;
  void *v8;
  const char *v9;
  float v10;
  MRUVolumeViewController *v11;
  MRUVolumeViewController *v12;
  const char *v13;
  float v14;

  volumeViewController = self->_volumeViewController;
  if (!volumeViewController)
  {
    v4 = objc_alloc(MEMORY[0x24BE64340]);
    objc_msgSend_sharedController(MEMORY[0x24BE642F0], v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (MRUVolumeViewController *)objc_msgSend_initWithAudioModuleController_(v4, v9, (uint64_t)v8, v10);
    v12 = self->_volumeViewController;
    self->_volumeViewController = v11;

    objc_msgSend_setDelegate_(self->_volumeViewController, v13, (uint64_t)self, v14);
    volumeViewController = self->_volumeViewController;
  }
  return volumeViewController;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  MRUVolumeBackgroundViewController *volumeBackgroundViewController;
  id v5;
  const char *v6;
  uint64_t v7;
  float v8;
  void *v9;
  const char *v10;
  float v11;
  MRUVolumeBackgroundViewController *v12;
  MRUVolumeBackgroundViewController *v13;
  const char *v14;
  float v15;

  volumeBackgroundViewController = self->_volumeBackgroundViewController;
  if (!volumeBackgroundViewController)
  {
    v5 = objc_alloc(MEMORY[0x24BE64338]);
    objc_msgSend_sharedController(MEMORY[0x24BE642F0], v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (MRUVolumeBackgroundViewController *)objc_msgSend_initWithAudioModuleController_(v5, v10, (uint64_t)v9, v11);
    v13 = self->_volumeBackgroundViewController;
    self->_volumeBackgroundViewController = v12;

    objc_msgSend_setDelegate_(self->_volumeBackgroundViewController, v14, (uint64_t)self, v15);
    volumeBackgroundViewController = self->_volumeBackgroundViewController;
  }
  return volumeBackgroundViewController;
}

- (unint64_t)supportedGridSizeClasses
{
  return 2;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)volumeViewController:(id)a3 didChangeSystemVolumeValue:(float)a4
{
  MEMORY[0x24BEDD108](self->_volumeBackgroundViewController, sel_setSystemVolumeValue_, a3, a4);
}

- (void)volumeBackgroundViewController:(id)a3 didUpdatePrimaryInteractionEnabled:(BOOL)a4
{
  ((void (*)(MRUVolumeViewController *, char *, BOOL))MEMORY[0x24BEDD108])(self->_volumeViewController, sel_setPrimaryInteractionEnabled_, a4);
}

- (void)volumeBackgroundViewController:(id)a3 didUpdateSecondaryInteractionEnabled:(BOOL)a4
{
  ((void (*)(MRUVolumeViewController *, char *, BOOL))MEMORY[0x24BEDD108])(self->_volumeViewController, sel_setSecondaryInteractionEnabled_, a4);
}

- (id)volumeBackgroundViewControllerStylingProvider
{
  return (id)((uint64_t (*)(MRUVolumeViewController *, char *))MEMORY[0x24BEDD108])(self->_volumeViewController, sel_stylingProvider);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void)setVolumeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeViewController, a3);
}

- (MRUVolumeBackgroundViewController)volumeBackgroundViewController
{
  return self->_volumeBackgroundViewController;
}

- (void)setVolumeBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeBackgroundViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_volumeViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
