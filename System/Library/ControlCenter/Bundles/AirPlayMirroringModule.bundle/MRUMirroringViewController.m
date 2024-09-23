@implementation MRUMirroringViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  MRUMirroringController *v7;
  MRUMirroringController *controller;
  FBSDisplayMonitor *v9;
  FBSDisplayMonitor *displayMonitor;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)MRUMirroringViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[MRUMirroringViewController updateGlyphPackageDescription](self, "updateGlyphPackageDescription");
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[MRUMirroringViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_updateGlyphPackageDescription);

  objc_msgSend(MEMORY[0x24BE64328], "screenMirroring");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v6);

  -[CCUIMenuModuleViewController setMinimumMenuItems:](self, "setMinimumMenuItems:", 4);
  -[CCUIMenuModuleViewController setVisibleMenuItems:](self, "setVisibleMenuItems:", 0.0);
  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 2);
  -[CCUIMenuModuleViewController setUseTrailingCheckmarkLayout:](self, "setUseTrailingCheckmarkLayout:", 1);
  v7 = (MRUMirroringController *)objc_alloc_init(MEMORY[0x24BE64310]);
  controller = self->_controller;
  self->_controller = v7;

  v9 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x24BE38450]);
  displayMonitor = self->_displayMonitor;
  self->_displayMonitor = v9;

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMirroringViewController;
  -[MRUMirroringViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRUMirroringViewController setShowMoreExpanded:](self, "setShowMoreExpanded:", 0);
  -[MRUMirroringViewController updateState](self, "updateState");
  -[MRUMirroringController setDelegate:](self->_controller, "setDelegate:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUMirroringViewController;
  -[MRUMirroringViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlyphState:", CFSTR("off"));

  -[MRUMirroringController setDelegate:](self->_controller, "setDelegate:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMirroringViewController;
  -[CCUIButtonModuleViewController setContentRenderingMode:](&v4, sel_setContentRenderingMode_, a3);
  -[MRUMirroringViewController updateState](self, "updateState");
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  MRUMirroringController *controller;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUMirroringViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v7, sel_willTransitionToExpandedContentMode_);
  -[MRUMirroringViewController updateState](self, "updateState");
  controller = self->_controller;
  if (v3)
  {
    -[MRUMirroringController startDetailedDiscovery](controller, "startDetailedDiscovery");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_230F9B108;
    v6[3] = &unk_24FFC8A38;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v6);
  }
  else
  {
    -[MRUMirroringController stopDetailedDiscovery](controller, "stopDetailedDiscovery");
    -[CCUIMenuModuleViewController setBusy:](self, "setBusy:", 0);
  }
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 4, 3, 17.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v3, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_systemImageNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "imageWithConfiguration:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mirroringController:(id)a3 didChangeOutputDevice:(id)a4
{
  -[MRUMirroringViewController updateState](self, "updateState", a3, a4);
  -[MRUMirroringViewController updateItems](self, "updateItems");
  MEMORY[0x24BEDD108](self, sel_updateFooter);
}

- (void)mirroringController:(id)a3 didUpdateBusyIdenifiers:(id)a4
{
  _QWORD v5[5];

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded", a3, a4))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_230F9B294;
    v5[3] = &unk_24FFC8A38;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v5);
  }
}

- (void)updateItems
{
  void *v3;
  id v4;
  uint64_t v5;
  MRUMirroringController **p_controller;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  MRUMirroringMenuModuleItem *v14;
  void *v15;
  void *v16;
  MRUMirroringMenuModuleItem *v17;
  void *v18;
  unint64_t v19;
  MRUMirroringMenuModuleItem *v20;
  void *v21;
  MRUMirroringMenuModuleItem *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  uint64_t v27;
  id v28;
  MRUMirroringViewController *val;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  char v33;
  char v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    val = self;
    -[MRUMirroringController availableOutputDevices](self->_controller, "availableOutputDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "msv_filter:", &unk_24FFC8A78);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = sub_230F9B760;
    v40[3] = &unk_24FFC8AA0;
    v24 = v3;
    v41 = v24;
    objc_msgSend(v25, "msv_filter:", v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MRUMirroringViewController showMoreExpanded](self, "showMoreExpanded") || !objc_msgSend(v24, "count"))
    {
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v23);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v24;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v5)
    {
      v27 = *(_QWORD *)v37;
      p_controller = &self->_controller;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[MRUMirroringController busyIdentifiers](*p_controller, "busyIdentifiers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "deviceID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "containsObject:", v10);

          -[MRUMirroringController selectedOutputDevice](*p_controller, "selectedOutputDevice");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v8, "isEqual:", v12);

          objc_initWeak(&location, val);
          v14 = [MRUMirroringMenuModuleItem alloc];
          objc_msgSend(v8, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "deviceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = sub_230F9B780;
          v31[3] = &unk_24FFC8AC8;
          objc_copyWeak(&v32, &location);
          v33 = v13;
          v34 = v11;
          v31[4] = v8;
          v17 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v14, "initWithTitle:identifier:handler:", v15, v16, v31);

          objc_msgSend(MEMORY[0x24BE64310], "symbolNameForOutputDevice:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRUMirroringMenuModuleItem setSymbolName:](v17, "setSymbolName:", v18);

          -[CCUIMenuModuleItem setBusy:](v17, "setBusy:", v11);
          -[CCUIMenuModuleItem setSelected:](v17, "setSelected:", v13);
          objc_msgSend(v28, "addObject:", v17);

          objc_destroyWeak(&v32);
          objc_destroyWeak(&location);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v5);
    }

    if (!-[MRUMirroringViewController showMoreExpanded](val, "showMoreExpanded"))
    {
      v19 = objc_msgSend(v25, "count");
      if (v19 > objc_msgSend(obj, "count"))
      {
        v20 = [MRUMirroringMenuModuleItem alloc];
        objc_msgSend(MEMORY[0x24BE64328], "routingFooterShowMoreTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = sub_230F9B7E0;
        v30[3] = &unk_24FFC8AF0;
        v30[4] = val;
        v22 = -[CCUIMenuModuleItem initWithTitle:identifier:handler:](v20, "initWithTitle:identifier:handler:", v21, CFSTR("showmore"), v30);
        objc_msgSend(v28, "addObject:", v22);

      }
    }
    -[CCUIMenuModuleViewController setMenuItems:](val, "setMenuItems:", v28);
    -[CCUIMenuModuleViewController setBusy:](val, "setBusy:", objc_msgSend(v28, "count") == 0);

  }
}

- (void)updateFooter
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[MRUMirroringController selectedOutputDevice](self->_controller, "selectedOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE64328], "stopMirroring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_230F9B920;
    v5[3] = &unk_24FFC8B18;
    objc_copyWeak(&v6, &location);
    -[CCUIMenuModuleViewController setFooterButtonTitle:handler:](self, "setFooterButtonTitle:handler:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    MEMORY[0x24BEDD108](self, sel_removeFooterButton);
  }
}

- (void)updateGlyphPackageDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  id v7;

  -[MRUMirroringViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityContrast");
  v5 = CFSTR("Mirroring");
  if (v4 == 1)
    v5 = CFSTR("Mirroring_IC");
  v6 = v5;

  objc_msgSend(MEMORY[0x24BE642E8], "packageDescriptionWithName:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CCUIMenuModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v7);
}

- (void)updateState
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  if (-[CCUIButtonModuleViewController contentRenderingMode](self, "contentRenderingMode") == 1)
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGlyphState:", CFSTR("off"));

    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", 0);
  }
  else
  {
    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    {
      -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", 0);
      -[CCUIButtonModuleViewController buttonView](self, "buttonView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGlyphState:", CFSTR("off"));
    }
    else
    {
      -[MRUMirroringController selectedOutputDevice](self->_controller, "selectedOutputDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v4 != 0);

      -[MRUMirroringController selectedOutputDevice](self->_controller, "selectedOutputDevice");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v5 = CFSTR("on");
      else
        v5 = CFSTR("off");
      -[CCUIButtonModuleViewController buttonView](self, "buttonView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGlyphState:", v5);

    }
  }
}

- (void)selectOutputDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[MRUMirroringViewController isConnectedToExternalDisplay](self, "isConnectedToExternalDisplay")
    && (-[MRUMirroringController selectedOutputDevice](self->_controller, "selectedOutputDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BE64328], "airPlayErrorTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE64328], "airplayErrorExternalDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BE64328], "ok");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &unk_24FFC8B58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    -[MRUMirroringViewController showViewController:sender:](self, "showViewController:sender:", v8, self);
  }
  else
  {
    -[MRUMirroringController startMirroringToOutputDevice:completion:](self->_controller, "startMirroringToOutputDevice:completion:", v12, 0);
  }

}

- (void)stopMirroringDismissOnComplete:(BOOL)a3
{
  MRUMirroringController *controller;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  controller = self->_controller;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230F9BCF8;
  v6[3] = &unk_24FFC8B80;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  -[MRUMirroringController stopMirroringWithCompletion:](controller, "stopMirroringWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)isConnectedToExternalDisplay
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBSDisplayMonitor connectedIdentities](self->_displayMonitor, "connectedIdentities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isExternal") && objc_msgSend(v6, "connectionType") == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (MRUMirroringController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (BOOL)showMoreExpanded
{
  return self->_showMoreExpanded;
}

- (void)setShowMoreExpanded:(BOOL)a3
{
  self->_showMoreExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
