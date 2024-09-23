@implementation AVInfoPanelDescriptionViewController

- (AVInfoPanelDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AVInfoPanelDescriptionViewController *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVInfoPanelDescriptionViewController;
  v4 = -[AVInfoPanelDescriptionViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    AVLocalizedString(CFSTR("INFO"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = v4;
    v7.super_class = (Class)AVInfoPanelDescriptionViewController;
    -[AVInfoPanelDescriptionViewController setTitle:](&v7, sel_setTitle_, v5);

  }
  return v4;
}

- (AVInfoPanelDescriptionViewController)initWithCoder:(id)a3
{
  AVInfoPanelDescriptionViewController *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVInfoPanelDescriptionViewController;
  v3 = -[AVInfoPanelDescriptionViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    AVLocalizedString(CFSTR("INFO"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = v3;
    v6.super_class = (Class)AVInfoPanelDescriptionViewController;
    -[AVInfoPanelDescriptionViewController setTitle:](&v6, sel_setTitle_, v4);

  }
  return v3;
}

- (void)loadView
{
  id v3;
  AVInfoPanelDescriptionView *v4;
  AVInfoPanelDescriptionView *descriptionView;
  AVInfoPanelDescriptionView *v6;
  void *v7;
  AVInfoPanelDescriptionView *v8;
  void *v9;
  AVInfoPanelDescriptionView *v10;
  void *v11;
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
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AVInfoPanelDescriptionViewController setView:](self, "setView:", v3);
  v4 = objc_alloc_init(AVInfoPanelDescriptionView);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v4;

  -[AVInfoPanelDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = self->_descriptionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.921568627, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelDescriptionView setTitleTextColor:](v6, "setTitleTextColor:", v7);

  v8 = self->_descriptionView;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelDescriptionView setTextFont:](v8, "setTextFont:", v9);

  v10 = self->_descriptionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.921568627, 0.6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelDescriptionView setTextColor:](v10, "setTextColor:", v11);

  objc_msgSend(v3, "addSubview:", self->_descriptionView);
  -[AVInfoPanelDescriptionView topAnchor](self->_descriptionView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  -[AVInfoPanelDescriptionView bottomAnchor](self->_descriptionView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  -[AVInfoPanelDescriptionView leftAnchor](self->_descriptionView, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  -[AVInfoPanelDescriptionView rightAnchor](self->_descriptionView, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
  -[AVInfoPanelDescriptionViewController _updateActionButtons](self, "_updateActionButtons");

}

- (void)viewDidLoad
{
  AVInfoPanelDescriptionView *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVInfoPanelDescriptionViewController;
  -[AVInfoPanelDescriptionViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = self->_descriptionView;
  -[AVInfoPanelDescriptionViewController _durationString](self, "_durationString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelDescriptionView setDurationText:](v3, "setDurationText:", v4);

  -[AVInfoPanelDescriptionView setClosedCaptionBadgeHidden:](v3, "setClosedCaptionBadgeHidden:", -[AVInfoPanelDescriptionViewController isClosedCaptioned](self, "isClosedCaptioned") ^ 1);
  -[AVInfoPanelDescriptionViewController _updateActionButtons](self, "_updateActionButtons");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVInfoPanelDescriptionViewController;
  -[AVInfoPanelDescriptionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Kind");
  v8[0] = CFSTR("Info");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AVPlayerViewControllerDidShowInfoViewControllerNotification"), self, v5);

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVInfoPanelDescriptionViewController;
  -[AVInfoPanelDescriptionViewController willMoveToParentViewController:](&v4, sel_willMoveToParentViewController_, a3);
  -[AVInfoPanelDescriptionViewController _updateViewsWithNewMetadata](self, "_updateViewsWithNewMetadata");
}

- (void)setMetadata:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_metadata != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_metadata, a3);
    -[AVInfoPanelDescriptionViewController _updateViewsWithNewMetadata](self, "_updateViewsWithNewMetadata");
    v5 = v6;
  }

}

- (void)setDuration:(double)a3
{
  AVInfoPanelDescriptionView *v4;
  id v5;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    v4 = self->_descriptionView;
    -[AVInfoPanelDescriptionViewController _durationString](self, "_durationString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionView setDurationText:](v4, "setDurationText:", v5);

  }
}

- (void)setClosedCaptioned:(BOOL)a3
{
  if (self->_closedCaptioned != a3)
  {
    self->_closedCaptioned = a3;
    -[AVInfoPanelDescriptionView setClosedCaptionBadgeHidden:](self->_descriptionView, "setClosedCaptionBadgeHidden:", !a3);
  }
}

- (BOOL)hasContent
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[AVInfoPanelDescriptionView posterImage](self->_descriptionView, "posterImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v11[0] = *MEMORY[0x1E0C8A870];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = *MEMORY[0x1E0C8A848];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v8 != 0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)setActions:(id)a3
{
  NSArray *v5;
  NSArray *actions;
  char v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  actions = self->_actions;
  if (actions != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqual:](actions, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_actions, a3);
      -[AVInfoPanelDescriptionViewController _updateActionButtons](self, "_updateActionButtons");
      v5 = v8;
    }
  }

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  +[AVInfoPanelDescriptionView layoutSize](AVInfoPanelDescriptionView, "layoutSize");
  v3 = v2 + 20.0;
  v5 = v4 + 0.0 + 10.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_metadataItemForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x1E0C8B220];
      -[AVInfoPanelDescriptionViewController metadata](self, "metadata", (_QWORD)v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metadataItemsFromArray:filteredByIdentifier:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (void)_updateViewsWithNewMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  AVInfoPanelDescriptionView *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[2];
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  -[AVInfoPanelDescriptionViewController metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v85[0] = *MEMORY[0x1E0C8A848];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = *MEMORY[0x1E0C8A870];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0C8A9A0];
    v83[0] = CFSTR("avkt/com.apple.avkit.alternateSubTitle");
    v83[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0C8A9F8];
    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AB08], *MEMORY[0x1E0C8A9F8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v11;
    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAA8], *MEMORY[0x1E0C8A9E8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAF0], v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v15;
    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A818], *MEMORY[0x1E0C8A9E0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v17);
    v71 = objc_claimAutoreleasedReturnValue();

    v80 = CFSTR("avkt/com.apple.avkit.seasonNumber");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = CFSTR("avkt/com.apple.avkit.episodeNumber");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v20);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = CFSTR("avkt/com.apple.avkit.rottenTomatoesRating");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v21);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = CFSTR("avkt/com.apple.avkit.rottenTomatoesFreshness");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v22);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A888], *MEMORY[0x1E0C8A9D0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v23;
    objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAF8], v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v25);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "stringValue");
    v26 = objc_claimAutoreleasedReturnValue();
    v69 = v6;
    objc_msgSend(v6, "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v14;
    objc_msgSend(v14, "stringValue");
    v28 = objc_claimAutoreleasedReturnValue();
    v68 = v9;
    objc_msgSend(v9, "stringValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {

      v30 = 0;
    }
    else
    {
      v30 = v29;
      v29 = v27;
    }
    v31 = 0;
    v70 = v30;
    if (v19 && v74)
    {
      v32 = v26;
      objc_msgSend(v19, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v19, "stringValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v19, "value");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) != 0)
        {
          objc_msgSend(v19, "value");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v35 = 0;
        }
      }
      objc_msgSend(v74, "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v40 = objc_opt_isKindOfClass();

      if ((v40 & 1) != 0)
      {
        objc_msgSend(v74, "stringValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v74, "value");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_opt_respondsToSelector();

        if ((v43 & 1) != 0)
        {
          objc_msgSend(v74, "value");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringValue");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v41 = 0;
        }
      }
      v45 = (void *)MEMORY[0x1E0CB3940];
      AVLocalizedString(CFSTR("Season %@, Episode %@"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", v46, v35, v41);
      v31 = objc_claimAutoreleasedReturnValue();

      v26 = v32;
      v30 = v70;
    }
    v47 = self->_descriptionView;
    v62 = (void *)v31;
    -[AVInfoPanelDescriptionView setSeasonEpisodeText:](v47, "setSeasonEpisodeText:", v31);
    v63 = v29;
    -[AVInfoPanelDescriptionView setTitleText:](v47, "setTitleText:", v29);
    -[AVInfoPanelDescriptionView setSecondaryTitleText:](v47, "setSecondaryTitleText:", v30);
    v65 = (void *)v26;
    -[AVInfoPanelDescriptionView setSummaryText:](v47, "setSummaryText:", v26);
    v64 = (void *)v28;
    -[AVInfoPanelDescriptionView setGenreText:](v47, "setGenreText:", v28);
    -[AVInfoPanelDescriptionViewController _releaseDateStringStyle:](self, "_releaseDateStringStyle:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionView setDateText:](v47, "setDateText:", v48);
    objc_msgSend(v72, "numberValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "integerValue");
    objc_msgSend(v73, "numberValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "floatValue");
    -[AVInfoPanelDescriptionView setTomatoFreshness:rating:hidden:](v47, "setTomatoFreshness:rating:hidden:", v50, v73 == 0);

    v52 = (void *)v71;
    +[AVMediaContentRatings displayStringForMetadataItem:](AVMediaContentRatings, "displayStringForMetadataItem:", v71);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVMediaContentRatings imageForMetadataItem:](AVMediaContentRatings, "imageForMetadataItem:", v71);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVRatingProviders shared](AVRatingProviders, "shared");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "findRatingString:", v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v56, "image");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "imageWithBaselineOffsetFromBottom:", 1.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v56, "isImageMask"))
      {
        v52 = (void *)v71;
        v61 = v64;
        goto LABEL_27;
      }
      objc_msgSend(v58, "imageWithRenderingMode:", 2);
      v59 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v71;
    }
    else
    {
      objc_msgSend(v54, "imageWithBaselineOffsetFromBottom:", 1.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[AVMediaContentRatings isImageMaskForMetadataItem:](AVMediaContentRatings, "isImageMaskForMetadataItem:", v71))
      {
        v60 = 2;
      }
      else
      {
        v60 = 1;
      }
      objc_msgSend(v58, "imageWithRenderingMode:", v60);
      v59 = objc_claimAutoreleasedReturnValue();

    }
    v61 = v64;

    v58 = (void *)v59;
LABEL_27:
    -[AVInfoPanelDescriptionView setContentMediaRatingText:image:](v47, "setContentMediaRatingText:image:", v53, v58);
    -[AVInfoPanelDescriptionView setViewingModeBadge:](v47, "setViewingModeBadge:", -[AVInfoPanelDescriptionViewController viewingModeBadge](self, "viewingModeBadge"));
    -[AVInfoPanelDescriptionViewController _loadPosterFromMetadataItem:](self, "_loadPosterFromMetadataItem:", v66);
    -[AVInfoPanelDescriptionView setPosterViewHidden:](v47, "setPosterViewHidden:", v66 == 0);

  }
  -[AVInfoPanelDescriptionViewController _updateActionButtons](self, "_updateActionButtons");
}

- (void)_updateActionButtons
{
  uint64_t v3;
  void *v4;
  NSArray *v5;
  id v6;

  if (-[AVInfoPanelDescriptionViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = self->_actions;
    if (-[NSArray count](v5, "count"))
    {
      -[NSArray bs_filter:](v5, "bs_filter:", &__block_literal_global_5222);
      v3 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v3;
    }
    else
    {
      v4 = v5;
    }
    v6 = v4;
    -[AVInfoPanelDescriptionView setActions:](self->_descriptionView, "setActions:", v4);

  }
}

- (void)_updatePosterViewWithImage:(id)a3
{
  -[AVInfoPanelDescriptionView setPosterImage:](self->_descriptionView, "setPosterImage:", a3);
}

- (void)_loadPosterFromMetadataItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVInfoPanelDescriptionViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke;
  v6[3] = &unk_1E5BB3D20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF3F60, v6);

}

- (id)_releaseDateStringStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(void);
  id v18;
  void *v19;
  _QWORD v21[6];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A890], *MEMORY[0x1E0C8A9D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AA90], *MEMORY[0x1E0C8A9E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AB10], *MEMORY[0x1E0C8A9F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A918], *MEMORY[0x1E0C8A9D8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A820], *MEMORY[0x1E0C8A9E0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVInfoPanelDescriptionViewController _metadataItemForIdentifiers:](self, "_metadataItemForIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelDescriptionViewController creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__AVInfoPanelDescriptionViewController__releaseDateStringStyle___block_invoke;
  v21[3] = &unk_1E5BB1588;
  v21[4] = self;
  v21[5] = a3;
  v15 = MEMORY[0x1AF43E9B8](v21);
  v16 = (void *)v15;
  if (v12)
  {
    v17 = *(void (**)(void))(v15 + 16);
  }
  else
  {
    if (v13)
    {
      v18 = v13;
      goto LABEL_6;
    }
    v17 = *(void (**)(void))(v15 + 16);
  }
  v17();
  v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v19 = v18;

  return v19;
}

- (id)_durationString
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_duration <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    v4 = v3;
    if (self->_duration >= 600.0)
      v5 = 96;
    else
      v5 = 192;
    objc_msgSend(v3, "setAllowedUnits:", v5);
    objc_msgSend(v4, "setUnitsStyle:", 2);
    objc_msgSend(v4, "stringFromTimeInterval:", self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E5BB5F88);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isClosedCaptioned
{
  return self->_closedCaptioned;
}

- (int64_t)viewingModeBadge
{
  return self->_viewingModeBadge;
}

- (void)setViewingModeBadge:(int64_t)a3
{
  self->_viewingModeBadge = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (AVPlayerController)playerController
{
  return (AVPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_monthDayYearFormatter, 0);
  objc_storeStrong((id *)&self->_yearFormatter, 0);
}

id __64__AVInfoPanelDescriptionViewController__releaseDateStringStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = 976;
    v6 = *(void **)(v4 + 976);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 976);
      *(_QWORD *)(v8 + 976) = v7;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setDateStyle:", 3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setTimeStyle:", 0);
LABEL_6:
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + v5);
    }
  }
  else
  {
    v5 = 968;
    v6 = *(void **)(v4 + 968);
    if (!v6)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 968);
      *(_QWORD *)(v11 + 968) = v10;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDateFormat:", CFSTR("yyyy"));
      goto LABEL_6;
    }
  }
  objc_msgSend(v6, "stringFromDate:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD);
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "dataValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke_2;
  v6[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v8, &location);
  v4 = v3;
  v7 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v6);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v5[2](v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePosterViewWithImage:", *(_QWORD *)(a1 + 32));

}

BOOL __60__AVInfoPanelDescriptionViewController__updateActionButtons__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "attributes") & 1) == 0;
}

@end
