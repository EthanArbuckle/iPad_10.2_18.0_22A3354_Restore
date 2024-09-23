@implementation CNFaceTimeCell

- (CNFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNFaceTimeCell *v4;
  CNFaceTimeCell *v5;
  NSArray *tokens;
  void *v7;
  uint64_t v8;
  CNSchedulerProvider *schedulerProvider;
  NSDictionary *defaultActionPerType;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CNActionView *v16;
  CNActionView *actionView1;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  CNActionView *v22;
  CNActionView *actionView2;
  double v24;
  double v25;
  void *v26;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CNFaceTimeCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    tokens = v4->_tokens;
    v4->_tokens = (NSArray *)MEMORY[0x1E0C9AA60];

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultSchedulerProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v8;

    defaultActionPerType = v5->_defaultActionPerType;
    v5->_defaultActionPerType = (NSDictionary *)MEMORY[0x1E0C9AA70];

    +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell setIsFaceTimeAudioAvailable:](v5, "setIsFaceTimeAudioAvailable:", objc_msgSend(v11, "isFaceTimeAudioAvailable"));
    if (-[CNFaceTimeCell isFaceTimeAudioAvailable](v5, "isFaceTimeAudioAvailable"))
    {
      v12 = *MEMORY[0x1E0C965F8];
      v13 = *MEMORY[0x1E0C96658];
      v30[0] = *MEMORY[0x1E0C965F8];
      v30[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *MEMORY[0x1E0C96658];
      v29 = *MEMORY[0x1E0C96658];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0C965F8];
    }
    objc_storeStrong((id *)&v5->_supportedActionTypes, v14);

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(CNActionView);
    actionView1 = v5->_actionView1;
    v5->_actionView1 = v16;

    if (-[CNFaceTimeCell isFaceTimeAudioAvailable](v5, "isFaceTimeAudioAvailable"))
      v18 = v12;
    else
      v18 = v13;
    -[CNActionView setType:](v5->_actionView1, "setType:", v18);
    -[CNActionView setStyle:](v5->_actionView1, "setStyle:", objc_msgSend(v15, "inlineActionsViewStyle"));
    -[CNActionView setActionDelegate:](v5->_actionView1, "setActionDelegate:", v5);
    -[CNActionView setShowsMenuAsPrimaryAction:](v5->_actionView1, "setShowsMenuAsPrimaryAction:", 1);
    -[CNActionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionView1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[CNActionView setContentCompressionResistancePriority:forAxis:](v5->_actionView1, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    LODWORD(v20) = 1148846080;
    -[CNActionView setContentCompressionResistancePriority:forAxis:](v5->_actionView1, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    -[CNFaceTimeCell contentView](v5, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v5->_actionView1);

    if (-[CNFaceTimeCell isFaceTimeAudioAvailable](v5, "isFaceTimeAudioAvailable"))
    {
      v22 = objc_alloc_init(CNActionView);
      actionView2 = v5->_actionView2;
      v5->_actionView2 = v22;

      -[CNActionView setType:](v5->_actionView2, "setType:", v13);
      -[CNActionView setStyle:](v5->_actionView2, "setStyle:", objc_msgSend(v15, "inlineActionsViewStyle"));
      -[CNActionView setActionDelegate:](v5->_actionView2, "setActionDelegate:", v5);
      -[CNActionView setShowsMenuAsPrimaryAction:](v5->_actionView2, "setShowsMenuAsPrimaryAction:", 1);
      -[CNActionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionView2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v24) = 1148846080;
      -[CNActionView setContentCompressionResistancePriority:forAxis:](v5->_actionView2, "setContentCompressionResistancePriority:forAxis:", 0, v24);
      LODWORD(v25) = 1148846080;
      -[CNActionView setContentCompressionResistancePriority:forAxis:](v5->_actionView2, "setContentCompressionResistancePriority:forAxis:", 1, v25);
      -[CNFaceTimeCell contentView](v5, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v5->_actionView2);

    }
    -[CNFaceTimeCell updateHorizontalTouchAreas](v5, "updateHorizontalTouchAreas");

  }
  return v5;
}

- (void)setActionsDataSource:(id)a3
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
  void *v15;
  void *v16;
  CNUIUserActionListDataSource *v17;

  v17 = (CNUIUserActionListDataSource *)a3;
  if (self->_actionsDataSource != v17)
  {
    objc_storeStrong((id *)&self->_actionsDataSource, a3);
    -[CNFaceTimeCell actionView1](self, "actionView1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3870];
      -[CNFaceTimeCell actionView1](self, "actionView1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cnui_userActionSymbolImageForActionType:scale:withColor:", v8, -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFaceTimeCell actionView1](self, "actionView1");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v9);

    }
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0DC3870];
      -[CNFaceTimeCell actionView2](self, "actionView2");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cnui_userActionSymbolImageForActionType:scale:withColor:", v14, -1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFaceTimeCell actionView2](self, "actionView2");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v15);

    }
  }

}

- (void)setContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNFaceTimeCell reset](self, "reset");
    -[CNFaceTimeCell loadCachedActions](self, "loadCachedActions");
    -[CNFaceTimeCell discoverAvailableActionTypes](self, "discoverAvailableActionTypes");
    v5 = v6;
  }

}

- (void)reset
{
  -[CNFaceTimeCell setDefaultActionPerType:](self, "setDefaultActionPerType:", MEMORY[0x1E0C9AA70]);
}

- (void)loadCachedActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[CNFaceTimeCell supportedActionTypes](self, "supportedActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__CNFaceTimeCell_loadCachedActions__block_invoke;
  v8[3] = &unk_1E204F530;
  v8[4] = self;
  objc_msgSend(v3, "_cn_map:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99D80];
  -[CNFaceTimeCell supportedActionTypes](self, "supportedActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFaceTimeCell processModels:](self, "processModels:", v7);
}

- (void)discoverAvailableActionTypes
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  _BYTE *v24;
  id v25;
  id location;
  _QWORD v27[5];
  uint8_t v28[4];
  CNFaceTimeCell *v29;
  __int16 v30;
  void *v31;
  _BYTE buf[24];
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35[5];

  v35[2] = *(id *)MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[CNFaceTimeCell contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDebugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "[CNFaceTimeCell discoverAvailableActionTypes], %@ cancelling previous action discovering requests, contact now is %@", buf, 0x16u);

  }
  -[CNFaceTimeCell tokens](self, "tokens");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke;
  v27[3] = &unk_1E204F558;
  v27[4] = self;
  objc_msgSend((id)v4, "enumerateObjectsUsingBlock:", v27);

  -[CNFaceTimeCell setTokens:](self, "setTokens:", MEMORY[0x1E0C9AA60]);
  -[CNFaceTimeCell contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v6 == 0;

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3042000000;
    v33 = __Block_byref_object_copy__16223;
    v34 = __Block_byref_object_dispose__16224;
    v35[0] = 0;
    CNUILogContactCard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[CNFaceTimeCell contact](self, "contact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shortDebugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138412546;
      v29 = self;
      v30 = 2112;
      v31 = v19;
      _os_log_debug_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEBUG, "[CNFaceTimeCell discoverAvailableActionTypes], %@ subscribing action discovering requests for contact %@.", v28, 0x16u);

    }
    -[CNFaceTimeCell allModelsObservable](self, "allModelsObservable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell schedulerProvider](self, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscribeOn:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D13AF0];
    v20 = v5;
    v21 = 3221225472;
    v22 = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_12;
    v23 = &unk_1E204F5A8;
    objc_copyWeak(&v25, &location);
    v24 = buf;
    objc_msgSend(v13, "observerWithResultBlock:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subscribe:", v14, v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v15);
    objc_storeWeak((id *)(*(_QWORD *)&buf[8] + 40), v15);
    -[CNFaceTimeCell setTokens:](self, "setTokens:", v7);

    objc_destroyWeak(&v25);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(v35);
    objc_destroyWeak(&location);

  }
}

- (id)allModelsObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  -[CNFaceTimeCell supportedActionTypes](self, "supportedActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__CNFaceTimeCell_allModelsObservable__block_invoke;
  v14[3] = &unk_1E204F4C8;
  v14[4] = self;
  objc_msgSend(v3, "_cn_map:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D13AE8];
  -[CNFaceTimeCell schedulerProvider](self, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merge:schedulerProvider:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scan:seed:", &__block_literal_global_16217, MEMORY[0x1E0C9AA70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFaceTimeCell throttleDelay](self, "throttleDelay");
  v10 = v9;
  -[CNFaceTimeCell schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "throttle:schedulerProvider:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)processModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  CNFaceTimeCell *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNFaceTimeCell defaultActionPerType](self, "defaultActionPerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __32__CNFaceTimeCell_processModels___block_invoke;
  v12 = &unk_1E204F5D0;
  v7 = v6;
  v13 = v7;
  v14 = self;
  objc_msgSend(v4, "_cn_each:", &v9);

  if (objc_msgSend(v7, "count", v9, v10, v11, v12))
  {
    CNUILogContactCard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell processModels:], defaultActionPerType = %@", buf, 0xCu);
    }

  }
  -[CNFaceTimeCell setDefaultActionPerType:](self, "setDefaultActionPerType:", v7);

}

- (id)actionViewForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[CNFaceTimeCell actionView1](self, "actionView1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[CNFaceTimeCell actionView1](self, "actionView1");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  -[CNFaceTimeCell actionView2](self, "actionView2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)labelView
{
  UILabel *faceTimeLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  faceTimeLabel = self->_faceTimeLabel;
  if (!faceTimeLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_faceTimeLabel;
    self->_faceTimeLabel = v4;

    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_VIDEO_CONFERENCE"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_faceTimeLabel, "setText:", v7);

    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](self->_faceTimeLabel, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
    faceTimeLabel = self->_faceTimeLabel;
  }
  return faceTimeLabel;
}

- (void)performDefaultAction
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performDefaultAction]", v6, 2u);
  }

  -[CNFaceTimeCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:performActionForItem:withTransportType:", self, v5, 3);

}

- (double)minCellHeight
{
  return 60.0;
}

- (id)constantConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v13.receiver = self;
  v13.super_class = (Class)CNFaceTimeCell;
  -[CNLabeledCell constantConstraints](&v13, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFaceTimeCell actionView1](self, "actionView1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFaceTimeCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  return v5;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v24.receiver = self;
  v24.super_class = (Class)CNFaceTimeCell;
  -[CNLabeledCell variableConstraints](&v24, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFaceTimeCell actionView1](self, "actionView1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFaceTimeCell isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"))
  {
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v23 = objc_claimAutoreleasedReturnValue();

    -[CNFaceTimeCell actionView1](self, "actionView1");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v7, 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v14);

    v6 = (void *)v23;
  }
  objc_msgSend(v6, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFaceTimeCell faceTimeLabel](self, "faceTimeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v18);

  return v5;
}

- (void)updateHorizontalTouchAreas
{
  void *v3;
  void *v4;
  id v5;

  -[CNFaceTimeCell rightMostView](self, "rightMostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTouchInsets:", 0.0, -8.0, 0.0, -16.0);

  -[CNFaceTimeCell actionView2](self, "actionView2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNFaceTimeCell actionView2](self, "actionView2");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);

  }
}

- (void)didPressActionView:(id)a3 longPress:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  CNContactActionsController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNContactActionsController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNFaceTimeCell defaultActionPerType](self, "defaultActionPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v4;
  else
    v10 = 1;
  CNUILogContactCard();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("nil");
    *(_DWORD *)buf = 138413058;
    v25 = v12;
    if (v9)
      v13 = v9;
    v26 = 1024;
    v27 = v4;
    v28 = 1024;
    v29 = v10;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell, didPressActionView:longPress:], actionType = %@, longPress = %i, shouldPresentDisambiguation = %i, defaultAction = %@", buf, 0x22u);

  }
  if (v10)
  {
    v14 = [CNContactActionsController alloc];
    -[CNFaceTimeCell contact](self, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell actionsDataSource](self, "actionsDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v14, "initWithContact:dataSource:actionTypes:", v15, v16, v18);
    -[CNFaceTimeCell setActionsController:](self, "setActionsController:", v19);

    -[CNFaceTimeCell actionsController](self, "actionsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[CNFaceTimeCell actionsController](self, "actionsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setGenerateFaceTimeListItemsOnly:", 1);

    -[CNFaceTimeCell actionsController](self, "actionsController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "retrieveModels");

  }
  else
  {
    -[CNFaceTimeCell performAction:](self, "performAction:", v9);
  }

}

- (void)performAction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CNUILogContactCard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performAction:], action = %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  -[CNFaceTimeCell delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CNFaceTimeCell delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNFaceTimeCell delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "geminiDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "channelIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setChannelIdentifier:", v13);

    }
  }
  objc_msgSend(v4, "performActionWithContext:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__CNFaceTimeCell_performAction___block_invoke;
  v20[3] = &unk_1E204E100;
  v16 = v4;
  v21 = v16;
  objc_msgSend(v14, "addSuccessBlock:", v20);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __32__CNFaceTimeCell_performAction___block_invoke_37;
  v18[3] = &unk_1E204D1E8;
  v19 = v16;
  v17 = v16;
  objc_msgSend(v14, "addFailureBlock:", v18);

}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7
    && (-[CNFaceTimeCell actionsController](self, "actionsController"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6))
  {
    -[CNFaceTimeCell actionsController](self, "actionsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFaceTimeCell actionViewForType:](self, "actionViewForType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "updateWithMenuItems:", v7);
    v9 = v13 != 0;

  }
  else
  {
    v9 = 0;
  }
  CNUILogContactCard();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[CNFaceTimeCell actionsController](self, "actionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v17;
    v20 = 1024;
    v21 = v9;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell contactActionsController:didUpdateWithMenu:], actionType = %@, didUpdate = %i, menuItems = %@,", (uint8_t *)&v18, 0x1Cu);

  }
}

- (void)didSelectActionType:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  id v6;
  CNContactActionsController *v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactActionsController *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [CNContactActionsController alloc];
  -[CNFaceTimeCell contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFaceTimeCell actionsDataSource](self, "actionsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v7, "initWithContact:dataSource:actionTypes:", v8, v9, v10);
  -[CNFaceTimeCell setActionsController:](self, "setActionsController:", v11);

  -[CNFaceTimeCell actionsController](self, "actionsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[CNFaceTimeCell actionsController](self, "actionsController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setGenerateFaceTimeListItemsOnly:", 1);

  -[CNFaceTimeCell actionsController](self, "actionsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "retrieveModels");

}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a4;
  -[CNFaceTimeCell actionsControllerPresentation](self, "actionsControllerPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CNFaceTimeCell_contactActionsController_didSelectAction___block_invoke;
  v13[3] = &unk_1E204F648;
  v13[4] = self;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v13);

  -[CNFaceTimeCell performAction:](self, "performAction:", v5);
  -[CNFaceTimeCell actionsController](self, "actionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFaceTimeCell actionsDataSource](self, "actionsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFaceTimeCell contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consumer:didSelectItem:forContact:actionType:", self, v5, v12, v10);

  -[CNFaceTimeCell setActionsController:](self, "setActionsController:", 0);
}

- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3
{
  return 1;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (UILabel)faceTimeLabel
{
  return self->_faceTimeLabel;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_isFaceTimeAudioAvailable;
}

- (void)setIsFaceTimeAudioAvailable:(BOOL)a3
{
  self->_isFaceTimeAudioAvailable = a3;
}

- (CNActionView)actionView1
{
  return self->_actionView1;
}

- (CNActionView)actionView2
{
  return self->_actionView2;
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (void)setSupportedActionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedActionTypes, a3);
}

- (CNCustomPresentation)actionsControllerPresentation
{
  return self->_actionsControllerPresentation;
}

- (void)setActionsControllerPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_actionsControllerPresentation, a3);
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerProvider, a3);
}

- (double)throttleDelay
{
  return self->_throttleDelay;
}

- (NSDictionary)defaultActionPerType
{
  return self->_defaultActionPerType;
}

- (void)setDefaultActionPerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionPerType, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_actionsControllerPresentation, 0);
  objc_storeStrong((id *)&self->_supportedActionTypes, 0);
  objc_storeStrong((id *)&self->_actionView2, 0);
  objc_storeStrong((id *)&self->_actionView1, 0);
  objc_storeStrong((id *)&self->_faceTimeLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
}

uint64_t __59__CNFaceTimeCell_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActionsControllerPresentation:", 0);
}

void __32__CNFaceTimeCell_performAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performAction:], did perform action %@", (uint8_t *)&v4, 0xCu);
  }

}

void __32__CNFaceTimeCell_performAction___block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_18AC56000, v2, OS_LOG_TYPE_ERROR, "[CNFaceTimeCell performAction:], failed to perform action %@", (uint8_t *)&v4, 0xCu);
  }

}

void __32__CNFaceTimeCell_processModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "defaultAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0C965C0];

  if (v6 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v10);
    objc_msgSend(*(id *)(a1 + 40), "actionViewForType:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", v5 == 0);

  }
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumer:actionModelsForContact:actionType:", 0, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__CNFaceTimeCell_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E204F4A0;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = a2;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2;
  v7[3] = &unk_1E204F648;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2_13;
  aBlock[3] = &unk_1E204F580;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:", v5);

  objc_destroyWeak(&v10);
}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2_13(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    objc_msgSend(WeakRetained, "tokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

    if (v4)
      objc_msgSend(WeakRetained, "processModels:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

id __35__CNFaceTimeCell_loadCachedActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "consumer:currentActionModelForContact:actionType:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13D90], "emptyModel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

@end
