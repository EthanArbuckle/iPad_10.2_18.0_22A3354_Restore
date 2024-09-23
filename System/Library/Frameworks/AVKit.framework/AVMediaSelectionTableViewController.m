@implementation AVMediaSelectionTableViewController

- (AVMediaSelectionTableViewController)initWithStyle:(int64_t)a3
{
  NSObject *v5;
  AVMediaSelectionTableViewController *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVMediaSelectionTableViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVMediaSelectionTableViewController initWithStyle:]";
    v12 = 1024;
    v13 = 79;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelectionTableViewController;
  v6 = -[AVMediaSelectionTableViewController initWithStyle:](&v9, sel_initWithStyle_, a3);
  if (v6)
  {
    AVLocalizedString(CFSTR("MEDIA_SELECTION_VIEW_CONTROLLER_NAVIGATION_ITEM_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaSelectionTableViewController setTitle:](v6, "setTitle:", v7);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVMediaSelectionTableViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "-[AVMediaSelectionTableViewController dealloc]";
    v9 = 1024;
    v10 = 93;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionTableViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), v5);

  v6.receiver = self;
  v6.super_class = (Class)AVMediaSelectionTableViewController;
  -[AVMediaSelectionTableViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)AVMediaSelectionTableViewController;
  -[AVMediaSelectionTableViewController viewDidLoad](&v25, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionTableViewController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_playerControllerMediaSelectionChanged_, CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), v4);

  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 30.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3F50];
  v26[0] = v6;
  v26[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectCombiningEffects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v9);
  v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  v12 = (void *)MEMORY[0x1E0DC44A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0901960784, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layerWithFillColor:opacity:filterType:", v13, *MEMORY[0x1E0CD2ED8], 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC44A0], "configWithContentConfig:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configureLayerView:", v11);

  objc_msgSend(v10, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v11);

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundView:", v10);

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AVMediaSelectionViewControllerCellReuseIdentifier"));

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v21);

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lineHeight");
  objc_msgSend(v22, "setEstimatedRowHeight:");

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSeparatorStyle:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[5];
  BOOL v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVMediaSelectionTableViewController;
  -[AVMediaSelectionTableViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke;
    v14[3] = &unk_1E5BB2E68;
    v14[4] = self;
    v15 = a3;
    v8 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v14);
    -[AVMediaSelectionTableViewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "initiallyInteractive"))
    {
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke_2;
      v11[3] = &unk_1E5BB2700;
      v12 = v10;
      v13 = v8;
      objc_msgSend(v12, "notifyWhenInteractionChangesUsingBlock:", v11);

    }
    else
    {
      v8[2](v8);
    }

  }
  else
  {
    -[AVMediaSelectionTableViewController tableView](self, "tableView");
    v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMediaSelectionTableViewController;
  -[AVMediaSelectionTableViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)playerControllerMediaSelectionChanged:(id)a3
{
  AVMediaSelectionOption *selectedAudioMediaSelectionOption;
  AVMediaSelectionOption *selectedLegibleMediaSelectionOption;
  id v6;

  selectedAudioMediaSelectionOption = self->_selectedAudioMediaSelectionOption;
  self->_selectedAudioMediaSelectionOption = 0;

  selectedLegibleMediaSelectionOption = self->_selectedLegibleMediaSelectionOption;
  self->_selectedLegibleMediaSelectionOption = 0;

  -[AVMediaSelectionTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (BOOL)_isSelectedOrCurrentAudioMediaSelectionOption:(id)a3
{
  AVMediaSelectionOption *v4;
  AVMediaSelectionOption **p_selectedAudioMediaSelectionOption;
  AVMediaSelectionOption *selectedAudioMediaSelectionOption;
  AVMediaSelectionOption *v7;
  void *v8;
  char v9;

  v4 = (AVMediaSelectionOption *)a3;
  p_selectedAudioMediaSelectionOption = &self->_selectedAudioMediaSelectionOption;
  selectedAudioMediaSelectionOption = self->_selectedAudioMediaSelectionOption;
  if (selectedAudioMediaSelectionOption)
  {
    v7 = selectedAudioMediaSelectionOption;
  }
  else
  {
    -[AVMediaSelectionTableViewController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAudioMediaSelectionOption");
    v7 = (AVMediaSelectionOption *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)p_selectedAudioMediaSelectionOption, v7);
  if (v7 == v4)
    v9 = 1;
  else
    v9 = -[AVMediaSelectionOption isEqual:](v4, "isEqual:", v7);

  return v9;
}

- (BOOL)_isSelectedOrCurrentLegibleMediaSelectionOption:(id)a3
{
  AVMediaSelectionOption *v4;
  AVMediaSelectionOption **p_selectedLegibleMediaSelectionOption;
  AVMediaSelectionOption *selectedLegibleMediaSelectionOption;
  AVMediaSelectionOption *v7;
  void *v8;
  char v9;

  v4 = (AVMediaSelectionOption *)a3;
  p_selectedLegibleMediaSelectionOption = &self->_selectedLegibleMediaSelectionOption;
  selectedLegibleMediaSelectionOption = self->_selectedLegibleMediaSelectionOption;
  if (selectedLegibleMediaSelectionOption)
  {
    v7 = selectedLegibleMediaSelectionOption;
  }
  else
  {
    -[AVMediaSelectionTableViewController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLegibleMediaSelectionOption");
    v7 = (AVMediaSelectionOption *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)p_selectedLegibleMediaSelectionOption, v7);
  if (v7 == v4)
    v9 = 1;
  else
    v9 = -[AVMediaSelectionOption isEqual:](v4, "isEqual:", v7);

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int64_t v9;
  void *v10;

  -[AVMediaSelectionTableViewController playerController](self, "playerController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hasAudioMediaSelectionOptions");
    if (a4 || !v7)
    {
      objc_msgSend(v6, "legibleMediaSelectionOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "audioMediaSelectionOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    v9 = objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AVMediaSelectionViewControllerCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionTableViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "hasAudioMediaSelectionOptions") && !objc_msgSend(v6, "section"))
    {
      objc_msgSend(v9, "audioMediaSelectionOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[AVMediaSelectionTableViewController _isSelectedOrCurrentAudioMediaSelectionOption:](self, "_isSelectedOrCurrentAudioMediaSelectionOption:", v11);
    }
    else
    {
      objc_msgSend(v9, "legibleMediaSelectionOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[AVMediaSelectionTableViewController _isSelectedOrCurrentLegibleMediaSelectionOption:](self, "_isSelectedOrCurrentLegibleMediaSelectionOption:", v11);
    }
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0745098039, 0.75);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v14);

    if (v13)
      v15 = 3;
    else
      v15 = 0;
    objc_msgSend(v7, "setAccessoryType:", v15);
    objc_msgSend(v7, "setRepresentedObject:", v11);
    objc_msgSend(v7, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v18);

  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  int64_t v6;

  -[AVMediaSelectionTableViewController playerController](self, "playerController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hasAudioMediaSelectionOptions");
    v6 = objc_msgSend(v4, "hasLegibleMediaSelectionOptions") + (unint64_t)v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  -[AVMediaSelectionTableViewController playerController](self, "playerController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (((a4 == 0) & objc_msgSend(v5, "hasAudioMediaSelectionOptions")) != 0)
      v7 = CFSTR("MEDIA_SELECTION_VIEW_CONTROLLER_AUDIO_OPTIONS_HEADER_TITLE");
    else
      v7 = CFSTR("MEDIA_SELECTION_VIEW_CONTROLLER_LEGIBLE_OPTIONS_HEADER_TITLE");
    AVLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v5);

  +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AVMediaSelectionTableViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  AVMediaSelectionOption *selectedLegibleMediaSelectionOption;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  AVMediaSelectionOption *selectedAudioMediaSelectionOption;
  void *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionTableViewController playerController](self, "playerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), v9);

  v10 = self;
  -[AVMediaSelectionTableViewController playerController](self, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "representedObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = v11;
    v32 = (void *)v13;
    v33 = v7;
    if (objc_msgSend(v11, "hasAudioMediaSelectionOptions") && !objc_msgSend(v7, "section"))
    {
      selectedAudioMediaSelectionOption = v10->_selectedAudioMediaSelectionOption;
      v10->_selectedAudioMediaSelectionOption = 0;

      objc_msgSend(v11, "setCurrentAudioMediaSelectionOption:", v13);
    }
    else
    {
      selectedLegibleMediaSelectionOption = v10->_selectedLegibleMediaSelectionOption;
      v10->_selectedLegibleMediaSelectionOption = 0;

      objc_msgSend(v11, "setCurrentLegibleMediaSelectionOption:", v13);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v6, "visibleCells");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
          objc_msgSend(v20, "representedObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "hasAudioMediaSelectionOptions"))
            goto LABEL_12;
          objc_msgSend(v6, "indexPathForCell:", v20);
          v22 = v14;
          v23 = v6;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "section");

          v6 = v23;
          v14 = v22;
          if (!v25)
            v26 = -[AVMediaSelectionTableViewController _isSelectedOrCurrentAudioMediaSelectionOption:](v10, "_isSelectedOrCurrentAudioMediaSelectionOption:", v21);
          else
LABEL_12:
            v26 = -[AVMediaSelectionTableViewController _isSelectedOrCurrentLegibleMediaSelectionOption:](v10, "_isSelectedOrCurrentLegibleMediaSelectionOption:", v21);
          if (v26)
            v27 = 3;
          else
            v27 = 0;
          objc_msgSend(v20, "setAccessoryType:", v27);

          ++v19;
        }
        while (v17 != v19);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v17 = v28;
      }
      while (v28);
    }

    v7 = v33;
    v11 = v14;
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionTableViewController playerController](v10, "playerController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v10, sel_playerControllerMediaSelectionChanged_, CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), v30);

}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_selectedLegibleMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_selectedAudioMediaSelectionOption, 0);
}

void __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, *(unsigned __int8 *)(a1 + 40));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

uint64_t __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
