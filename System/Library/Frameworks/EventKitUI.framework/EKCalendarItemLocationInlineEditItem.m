@implementation EKCalendarItemLocationInlineEditItem

- (EKCalendarItemLocationInlineEditItem)init
{
  EKCalendarItemLocationInlineEditItem *v2;
  EKUILocationEditItemModel *v3;
  EKUILocationEditItemModel *viewModel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemLocationInlineEditItem;
  v2 = -[EKCalendarItemLocationInlineEditItem init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(EKUILocationEditItemModel);
    viewModel = v2->_viewModel;
    v2->_viewModel = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[EKUILocationEditItemModel reset](self->_viewModel, "reset");
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarItemLocationInlineEditItem;
  -[EKCalendarItemLocationInlineEditItem dealloc](&v3, sel_dealloc);
}

- (void)refreshFromCalendarItemAndStore
{
  -[EKUILocationEditItemModel rebuild:](self->_viewModel, "rebuild:", self);
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  double v15;
  double result;

  if (EKUIUsesLargeTextLayout(0))
    return *MEMORY[0x1E0DC53D8];
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "cell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "cell");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bannerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intrinsicContentSize");
      v6 = v15;

      return v6;
    }

  }
  objc_msgSend((id)objc_opt_class(), "scaledHeightOfSystemTableViewCell");
  return result;
}

- (BOOL)isInline
{
  return 1;
}

- (void)reset
{
  -[EKUILocationEditItemModel reset](self->_viewModel, "reset");
}

- (unint64_t)numberOfSubitems
{
  _BOOL4 v3;
  void *v4;
  unint64_t v5;

  v3 = -[EKUILocationEditItemModel displaysPlaceholder](self->_viewModel, "displaysPlaceholder");
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + v3;

  return v5;
}

- (BOOL)isSaveable
{
  unint64_t v3;

  if (-[EKCalendarItemLocationInlineEditItem numberOfSubitems](self, "numberOfSubitems"))
  {
    v3 = 0;
    do
      -[EKCalendarItemLocationInlineEditItem isSubitemAtIndexSaveable:](self, "isSubitemAtIndexSaveable:", v3++);
    while (v3 < -[EKCalendarItemLocationInlineEditItem numberOfSubitems](self, "numberOfSubitems"));
  }
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return -[EKCalendarItemLocationInlineEditItem cellForSubitemAtIndex:inEditor:](self, "cellForSubitemAtIndex:inEditor:", a3, 0);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 inEditor:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  EKUILocationEditItemModel *viewModel;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  EKUILocationEditItemCell *v17;
  EKUITableViewCell *p_super;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  EKUIClearButtonCell *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  EKUIClearButtonCell *v32;
  void *v33;
  void *v34;
  char v35;
  EKEventDetailSuggestedLocationCell *v36;
  void *v37;
  char isKindOfClass;
  EKUIClearButtonCell *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  EKUILocationEditItemModel *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;

  v7 = a4;
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a3)
  {
    p_super = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    -[EKUILocationEditItemModel placeholderCellText](self->_viewModel, "placeholderCellText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](p_super, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "_placeholderColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](p_super, "textLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextColor:", v22);

    -[EKCalendarItemLocationInlineEditItem _setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:](self, "_setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:", v7, p_super, 1);
  }
  else
  {
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v11, "locationType"))
    {
      case 0:
        viewModel = self->_viewModel;
        -[EKEventEditItem event](self, "event");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[EKUILocationEditItemModel shouldDisplayRowModelWithConferenceCell:event:](viewModel, "shouldDisplayRowModelWithConferenceCell:event:", v11, v13);

        objc_msgSend(v11, "cell");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14)
        {

          if (v16)
          {
            objc_msgSend(v11, "cell");
            v17 = (EKUILocationEditItemCell *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = -[EKUILocationEditItemCell initWithStyle:reuseIdentifier:]([EKUILocationEditItemCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
          }
          p_super = (EKUITableViewCell *)v17;
          v44 = self->_viewModel;
          -[EKEventEditItem event](self, "event");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUILocationEditItemModel refreshConferenceRoomCell:event:](v44, "refreshConferenceRoomCell:event:", p_super, v45);

          -[EKUITableViewCell clearButton](p_super, "clearButton");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItemLocationInlineEditItem _updateClearButtonAndMakeVisible:index:](self, "_updateClearButtonAndMakeVisible:index:", v43, a3);
        }
        else
        {
          if (v15
            && (objc_msgSend(v11, "cell"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v37,
                v16,
                (isKindOfClass & 1) != 0))
          {
            objc_msgSend(v11, "cell");
            v39 = (EKUIClearButtonCell *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = -[EKUIClearButtonCell initWithStyle:reuseIdentifier:]([EKUIClearButtonCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
          }
          p_super = &v39->super;
          objc_msgSend(v11, "location");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItemLocationInlineEditItem _updateMapLocationCell:index:location:](self, "_updateMapLocationCell:index:location:", p_super, a3, v43);
        }
        goto LABEL_36;
      case 1:
        objc_msgSend(v11, "cell");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v11, "cell");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v26 = objc_opt_isKindOfClass();

          if ((v26 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 209, CFSTR("Map location model has wrong cell type"));

          }
          objc_msgSend(v11, "cell");
          v27 = (EKUIClearButtonCell *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = -[EKUIClearButtonCell initWithStyle:reuseIdentifier:]([EKUIClearButtonCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
        }
        p_super = &v27->super;
        objc_msgSend(v11, "location");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemLocationInlineEditItem _updateMapLocationCell:index:location:](self, "_updateMapLocationCell:index:location:", p_super, a3, v40);

        -[EKCalendarItemLocationInlineEditItem _setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:](self, "_setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:", v7, p_super, 1);
        goto LABEL_37;
      case 2:
        objc_msgSend(v11, "conference");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v11, "cell");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v11, "cell");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v31 = objc_opt_isKindOfClass();

            if ((v31 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 186, CFSTR("Virtual conference model has wrong cell type"));

            }
            objc_msgSend(v11, "cell");
            v32 = (EKUIClearButtonCell *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = -[EKUIClearButtonCell initWithStyle:reuseIdentifier:]([EKUIClearButtonCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
          }
          p_super = &v32->super;
          objc_msgSend(v11, "conference");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItemLocationInlineEditItem _updateVirtualConferenceCell:index:virtualConference:](self, "_updateVirtualConferenceCell:index:virtualConference:", p_super, a3, v41);
        }
        else
        {
          p_super = -[EKUIPendingVideoConferenceCell initWithStyle:reuseIdentifier:]([EKUIPendingVideoConferenceCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
          -[EKUITableViewCell clearButton](p_super, "clearButton");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItemLocationInlineEditItem _updateClearButtonAndMakeVisible:index:](self, "_updateClearButtonAndMakeVisible:index:", v41, a3);
        }

        objc_msgSend(v11, "conference");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemLocationInlineEditItem _setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:](self, "_setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:", v7, p_super, objc_msgSend(v43, "isWritable"));
LABEL_36:

        goto LABEL_37;
      case 3:
        objc_msgSend(v11, "cell");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v11, "cell");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 167, CFSTR("Suggested location model has wrong cell type"));

          }
          objc_msgSend(v11, "cell");
          v36 = (EKEventDetailSuggestedLocationCell *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = -[EKEventDetailSuggestedLocationCell initWithInlineStyle:]([EKEventDetailSuggestedLocationCell alloc], "initWithInlineStyle:", 1);
        }
        p_super = (EKUITableViewCell *)v36;
        -[EKEventDetailSuggestedLocationCell setDelegate:](v36, "setDelegate:", self);
        -[EKEventEditItem event](self, "event");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUITableViewCell setEvent:](p_super, "setEvent:", v42);

LABEL_37:
        objc_msgSend(v11, "setCell:", p_super);
        break;
      default:
        p_super = 0;
        break;
    }

  }
  -[EKUITableViewCell setTag:](p_super, "setTag:", a3);

  return p_super;
}

- (void)_updateMapLocationCell:(id)a3 index:(unint64_t)a4 location:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  id v22;

  v22 = a5;
  v8 = a3;
  objc_msgSend(v8, "defaultContentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isStructured"))
  {
    objc_msgSend(v22, "contactLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v22, "contactLabel");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v22, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_7;
      objc_msgSend(v22, "address");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
LABEL_7:
    objc_msgSend(v9, "setText:", v12);

    objc_msgSend(v22, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _StringWithLineEndingsRemoved(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "_stringByReplacingCharactersInSet:withCharacter:", CFCharacterSetGetPredefined(kCFCharacterSetNewline), 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setSecondaryText:", v13);
    goto LABEL_8;
  }
  objc_msgSend(v22, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _StringWithLineEndingsRemoved(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v14);

LABEL_8:
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v19);

  objc_msgSend(v8, "setTitleSubtitleContentConfiguration:", v9);
  objc_msgSend(v8, "clearButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItemLocationInlineEditItem _updateClearButtonAndMakeVisible:index:](self, "_updateClearButtonAndMakeVisible:index:", v21, a4);
}

- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setTag:", a4);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__clearButtonTapped_, 64);
  objc_msgSend(v6, "setHidden:", 0);

}

- (void)_updateVirtualConferenceCell:(id)a3 index:(unint64_t)a4 virtualConference:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  EKCalendarItemLocationInlineEditItem *v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "isWritable"))
  {
    objc_msgSend(v8, "clearButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v8, "clearButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemLocationInlineEditItem _updateClearButtonAndMakeVisible:index:](self, "_updateClearButtonAndMakeVisible:index:", v11, a4);
  }

  v12 = (void *)MEMORY[0x1E0D0CD38];
  objc_msgSend(v10, "joinMethods");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke;
  v17[3] = &unk_1E601C748;
  v18 = v8;
  v19 = v10;
  v20 = self;
  v15 = v10;
  v16 = v8;
  objc_msgSend(v12, "displayDetailsForJoinMethod:completionHandler:", v14, v17);

}

void __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke_2;
  v8[3] = &unk_1E601A360;
  v9 = *(id *)(a1 + 32);
  v10 = v4;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", *(_QWORD *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("video"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttachmentWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v8, "appendAttributedString:", v9);

  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Video Call"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0CD38], "subtitleForVirtualConference:displayedWithTitle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v11;
  v15 = v14;

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
  objc_msgSend(v8, "appendAttributedString:", v16);

  v19 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttributes:range:", v18, 0, objc_msgSend(v8, "length"));

  objc_msgSend(v2, "setSecondaryAttributedText:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setTitleSubtitleContentConfiguration:", v2);
  objc_msgSend(*(id *)(a1 + 56), "notifyRequiresHeightChange");

}

- (void)_setEditor:(id)a3 andUpdateScribbleInteractionOnCell:(id)a4 addScribbleInteraction:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3)
  {
    objc_storeWeak((id *)&self->_editor, a3);
    objc_msgSend(v8, "interactions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_60);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (!objc_msgSend(v11, "count"))
      {
        v12 = objc_alloc_init((Class)getPKScribbleInteractionClass());
        objc_msgSend(v12, "setDelegate:", self);
        objc_msgSend(v12, "setElementSource:", self);
        objc_msgSend(v8, "addInteraction:", v12);

      }
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v8, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v15);
      }

    }
  }

}

uint64_t __109__EKCalendarItemLocationInlineEditItem__setEditor_andUpdateScribbleInteractionOnCell_addScribbleInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  getPKScribbleInteractionClass();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return 1;
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "locationType") != 0;
  return v10;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 1;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  EKLocationEditItemViewController *v15;
  void *v16;
  id WeakRetained;
  EKLocationEditItemViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  EKLocationEditItemViewController *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = -[EKCalendarItemLocationInlineEditItem _supportedSearchTypesForSubitemAtIndex:](self, "_supportedSearchTypesForSubitemAtIndex:");
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 <= a4)
  {
    v14 = 0;
  }
  else
  {
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = [EKLocationEditItemViewController alloc];
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._store);
  v18 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:](v15, "initWithFrame:calendarItem:eventStore:", v16, WeakRetained, x, y, width, height);

  -[EKEditItemViewController setEditDelegate:](v18, "setEditDelegate:", self);
  -[EKEditItemViewController setModal:](v18, "setModal:", 1);
  -[EKEditItemViewController setShowsDoneButton:](v18, "setShowsDoneButton:", 0);
  -[EKLocationEditItemViewController setSupportedSearchTypes:](v18, "setSupportedSearchTypes:", v10);
  -[EKUILocationEditItemModel mapLocationRowModel](self->_viewModel, "mapLocationRowModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKLocationEditItemViewController setLocationViewModel:](v18, "setLocationViewModel:", v19);

  -[EKUILocationEditItemModel virtualConferenceRowModel](self->_viewModel, "virtualConferenceRowModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKLocationEditItemViewController setConferenceViewModel:](v18, "setConferenceViewModel:", v20);

  if (v14)
  {
    -[EKUILocationEditItemModel virtualConferenceRowModel](self->_viewModel, "virtualConferenceRowModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController setConferenceTextFieldSelected:](v18, "setConferenceTextFieldSelected:", v14 == v21);

  }
  else
  {
    -[EKLocationEditItemViewController setConferenceTextFieldSelected:](v18, "setConferenceTextFieldSelected:", 0);
  }
  -[EKUILocationEditItemModel virtualConferenceRowModel](self->_viewModel, "virtualConferenceRowModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[EKUILocationEditItemModel virtualConferenceRowModel](self->_viewModel, "virtualConferenceRowModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController setDisableConferenceTextField:](v18, "setDisableConferenceTextField:", objc_msgSend(v24, "isWritable") ^ 1);

  }
  else
  {
    -[EKLocationEditItemViewController setDisableConferenceTextField:](v18, "setDisableConferenceTextField:", 0);
  }

  objc_storeStrong((id *)&self->_currentLocationEditController, v18);
  v25 = v18;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v25, sel_cancel);
  v27 = objc_alloc(MEMORY[0x1E0DC3500]);
  v32[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithBarButtonItems:representativeItem:", v28, 0);

  -[EKLocationEditItemViewController navigationItem](v25, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_dci_setFixedTrailingGroup:", v29);

  return v25;
}

- (unint64_t)_supportedSearchTypesForSubitemAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;

  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 2047;
  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "locationType") == 2)
  {
    objc_msgSend(v8, "conference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isWritable");

    if (v10)
      v11 = 1536;
    else
      v11 = 511;
  }
  else
  {
    v11 = 511;
  }

  return v11;
}

- (void)_clearButtonTapped:(id)a3
{
  -[EKCalendarItemLocationInlineEditItem _clearLocationAtIndex:](self, "_clearLocationAtIndex:", objc_msgSend(a3, "tag"));
}

- (void)_clearLocationAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  id WeakRetained;
  EKUILocationEditItemModel *viewModel;
  void *v10;
  id v11;

  -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "locationType") == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
      objc_msgSend(WeakRetained, "setPendingVideoConference:", 0);

    }
    viewModel = self->_viewModel;
    -[EKEventEditItem event](self, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILocationEditItemModel removeRowModelAtIndex:event:](viewModel, "removeRowModelAtIndex:event:", a3, v10);

    -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", a3);
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 9;
}

- (BOOL)isSubitemAtIndexSaveable:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItemLocationInlineEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "isEqualToString:", v6);
    if (v9)
      v11 = v6 == 0;
    else
      v11 = 1;
    v12 = !v11;
    if ((v10 & 1) != 0)
      v13 = 0;
    else
      v13 = v12;
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v9 = v15;
      objc_msgSend(v15, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v6) & 1) != 0)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v9, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          v19 = v6 == 0;
        else
          v19 = 1;
        v13 = !v19;

      }
      goto LABEL_26;
    }
  }
  v17 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
  {
    v21 = 136315138;
    v22 = "-[EKCalendarItemLocationInlineEditItem isSubitemAtIndexSaveable:]";
    _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "%s - Location Inline Edit Item didn't have a text label on its non conference location cell; will return NO",
      (uint8_t *)&v21,
      0xCu);
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  EKUILocationEditItemModel *viewModel;
  void *v11;
  NSObject *v12;
  EKUILocationEditItemModel *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id WeakRetained;
  id v19;
  NSObject *v20;
  EKUILocationEditItemModel *v21;
  void *v22;
  EKUILocationEditItemModel *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  EKUILocationEditItemModel *v27;
  NSObject *v28;
  NSObject *v29;
  EKUILocationEditItemModel *v30;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!objc_msgSend(v5, "needsSave"))
    {
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v5, "locationViewModel");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedConferenceRoom");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedLocation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "locationViewModelRemoved"))
    {
      v9 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Removing row view model from view model: [%@]", buf, 0xCu);
      }
      viewModel = self->_viewModel;
      -[EKEventEditItem event](self, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUILocationEditItemModel removeRowModel:event:](viewModel, "removeRowModel:event:", v6, v11);
    }
    else
    {
      if (v7 || !v8)
      {
        if (v7 && !v8)
        {
          v28 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v7;
            _os_log_impl(&dword_1AF84D000, v28, OS_LOG_TYPE_DEBUG, "Updating event with selected conference room: [%@]", buf, 0xCu);
          }
          -[EKUILocationEditItemModel updateRowModel:withConferenceRoom:editItem:](self->_viewModel, "updateRowModel:withConferenceRoom:editItem:", v6, v7, self);
        }
LABEL_13:
        v33 = (void *)v6;
        v14 = (void *)v7;
        objc_msgSend(v5, "conferenceViewModel", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selectedVirtualConference");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v5, "pendingVirtualConference");
        WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
        objc_msgSend(WeakRetained, "setPendingVideoConference:", v17);

        v19 = objc_loadWeakRetained((id *)&self->_editor);
        LODWORD(v17) = objc_msgSend(v19, "pendingVideoConference");

        if ((_DWORD)v17)
        {
          v20 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v16;
            _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_DEBUG, "Updating event with pending virtual conference: [%@]", buf, 0xCu);
          }
          v21 = self->_viewModel;
          -[EKEventEditItem event](self, "event");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v21;
          v24 = v15;
          v25 = 0;
        }
        else
        {
          if (objc_msgSend(v5, "conferenceViewModelRemoved"))
          {
            v26 = kEKUILogEventEditorHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = (uint64_t)v15;
              _os_log_impl(&dword_1AF84D000, v26, OS_LOG_TYPE_DEBUG, "Removing row view model from view model: [%@]", buf, 0xCu);
            }
            v27 = self->_viewModel;
            -[EKEventEditItem event](self, "event");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKUILocationEditItemModel removeRowModel:event:](v27, "removeRowModel:event:", v15, v22);
            goto LABEL_31;
          }
          if (!v16)
          {
LABEL_32:

            goto LABEL_33;
          }
          v29 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v16;
            _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_DEBUG, "Updating event with selected virtual conference: [%@]", buf, 0xCu);
          }
          v30 = self->_viewModel;
          -[EKEventEditItem event](self, "event");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v30;
          v24 = v15;
          v25 = v16;
        }
        -[EKUILocationEditItemModel updateRowModel:withVirtualConference:event:](v23, "updateRowModel:withVirtualConference:event:", v24, v25, v22);
LABEL_31:

        goto LABEL_32;
      }
      v12 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v8;
        _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_DEBUG, "Updating event with selected structured location: [%@]", buf, 0xCu);
      }
      v13 = self->_viewModel;
      -[EKEventEditItem event](self, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUILocationEditItemModel updateRowModel:withMapLocation:event:](v13, "updateRowModel:withMapLocation:event:", v6, v8, v11);
    }

    goto LABEL_13;
  }
LABEL_34:
  -[EKUILocationEditItemModel reorderRowModels](self->_viewModel, "reorderRowModels");
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);

  return 1;
}

- (void)editItemPendingVideoConferenceCompleted:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  EKUILocationEditItemModel *viewModel;
  void *v19;
  EKUILocationEditItemModel *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  EKUILocationEditItemModel *v30;
  EKUILocationEditItemModel *v31;
  EKUILocationEditItemModel *v32;
  EKUILocationEditItemModel *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    -[EKUILocationEditItemModel reorderRowModels](self->_viewModel, "reorderRowModels");
    -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
    goto LABEL_20;
  }
  -[EKUILocationEditItemModel virtualConferenceRowModel](self->_viewModel, "virtualConferenceRowModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  objc_msgSend(v5, "selectedVirtualConference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
  v8 = objc_msgSend(WeakRetained, "pendingVideoConference");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_editor);
    objc_msgSend(v9, "setPendingVideoConference:", 0);

    objc_msgSend(v5, "pendingVirtualConferenceError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      EventKitUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Unable to Add Video Call Link"), &stru_1E601DFA8, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("The request timed out. Try adding the video call link again."), &stru_1E601DFA8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, &__block_literal_global_59);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v16);

      v17 = objc_loadWeakRetained((id *)&self->_editor);
      objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);

      viewModel = self->_viewModel;
      -[EKEventEditItem event](self, "event");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = viewModel;
      v21 = v34;
      -[EKUILocationEditItemModel removeRowModel:event:](v20, "removeRowModel:event:", v34, v19);

    }
    else if (v6)
    {
      v29 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_DEBUG, "Updating event with selected virtual conference: [%@]", buf, 0xCu);
      }
      v30 = self->_viewModel;
      -[EKEventEditItem event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v21 = v34;
      -[EKUILocationEditItemModel updateRowModel:withVirtualConference:event:](v31, "updateRowModel:withVirtualConference:event:", v34, v6, v12);
    }
    else
    {
      v32 = self->_viewModel;
      -[EKEventEditItem event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v21 = v34;
      -[EKUILocationEditItemModel removeRowModel:event:](v33, "removeRowModel:event:", v34, v12);
    }

    -[EKLocationEditItemViewController pendingVideoConferenceUpdated:](self->_currentLocationEditController, "pendingVideoConferenceUpdated:", v6);
    goto LABEL_19;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "joinMethods");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)MEMORY[0x1E0CAA038];
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v26), "URL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "invalidateConferenceURL:", v28);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v24);
  }

LABEL_20:
}

- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  EKUILocationEditItemModel *viewModel;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if ((objc_msgSend(WeakRetained, "isNew") & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
    if (objc_msgSend(v8, "_hasChangesForKey:", CFSTR("location")))
      v7 = 3;
    else
      v7 = 7;

  }
  v9 = (void *)MEMORY[0x1E0CAA160];
  v10 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  objc_msgSend(v10, "preferredLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictedLOI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInteractionWithPredictedLocationOfInterest:interaction:", v12, v7);

  v13 = -[EKUILocationEditItemModel indexOfPredictedLocation](self->_viewModel, "indexOfPredictedLocation");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v35 = v13;
    v36 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "title");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            v23 = (const __CFString *)v21;
          else
            v23 = &stru_1E601DFA8;
          objc_msgSend(v14, "addObject:", v23);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }

    v5 = v36;
    objc_msgSend(v36, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v24);

    objc_msgSend(v36, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAA060], "_locationStringForLocations:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTitle:", v26);

    -[EKEventEditItem event](self, "event");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "confirmPredictedLocation:", v36);

    objc_msgSend(v36, "setTitle:", v25);
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndex:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    viewModel = self->_viewModel;
    -[EKEventEditItem event](self, "event");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILocationEditItemModel updateRowModel:withMapLocation:event:](viewModel, "updateRowModel:withMapLocation:event:", v29, v36, v31);

    -[EKCalendarItemEditItem delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[EKCalendarItemLocationInlineEditItem numberOfSubitems](self, "numberOfSubitems"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "editItem:wantsRowInsertions:rowDeletions:rowReloads:", self, 0, v33, v34);

    -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", v35);
  }

}

- (void)didTapDismissSuggestedLocationCell:(id)a3
{
  void *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  -[EKEventEditItem event](self, "event", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rejectPredictedLocation");

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if ((objc_msgSend(WeakRetained, "isNew") & 1) != 0)
  {
    v6 = 4;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
    if (objc_msgSend(v7, "_hasChangesForKey:", CFSTR("location")))
      v6 = 4;
    else
      v6 = 8;

  }
  v8 = (void *)MEMORY[0x1E0CAA160];
  v9 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  objc_msgSend(v9, "preferredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedLOI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInteractionWithPredictedLocationOfInterest:interaction:", v11, v6);

  v12 = -[EKUILocationEditItemModel indexOfPredictedLocation](self->_viewModel, "indexOfPredictedLocation");
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    -[EKCalendarItemLocationInlineEditItem _clearLocationAtIndex:](self, "_clearLocationAtIndex:", v12);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, *MEMORY[0x1E0DC54D0], v5);

  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", v5);
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], v5);

  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged", a3);
  return 1;
}

- (id)searchStringForEventAutocomplete
{
  void *v2;
  void *v3;
  void *v4;

  -[EKCalendarItemLocationInlineEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v9;
    objc_msgSend(v4, "clearButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    objc_msgSend(v4, "defaultContentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleSubtitleContentConfiguration:", v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", 0);

      objc_msgSend(v9, "detailTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", 0);

      objc_msgSend(v9, "setAccessoryView:", 0);
    }
  }

}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  EKUILocationEditItemModel *viewModel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v15, "tag");
    -[EKUILocationEditItemModel rowModels](self->_viewModel, "rowModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    viewModel = self->_viewModel;
    if (v6 >= v8)
    {
      -[EKUILocationEditItemModel placeholderCellText](viewModel, "placeholderCellText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);
    }
    else
    {
      -[EKUILocationEditItemModel rowModels](viewModel, "rowModels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "locationType") == 1 || !objc_msgSend(v11, "locationType"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 669, CFSTR("Map or conference room location has wrong cell type"));

        }
        objc_msgSend(v11, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemLocationInlineEditItem _updateMapLocationCell:index:location:](self, "_updateMapLocationCell:index:location:", v15, v6, v12);
      }
      else
      {
        if (objc_msgSend(v11, "locationType") != 2)
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 672, CFSTR("Virtual conference has wrong cell type"));

        }
        objc_msgSend(v11, "conference");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemLocationInlineEditItem _updateVirtualConferenceCell:index:virtualConference:](self, "_updateVirtualConferenceCell:index:virtualConference:", v15, v6, v12);
      }
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  (*((void (**)(id, void *, uint64_t, CGPoint, __n128, CGSize, __n128))a5 + 2))(a5, &unk_1E606FA70, 0x7FFFFFFFFFFFFFFFLL, a4.origin, *(__n128 *)&a4.origin.y, a4.size, *(__n128 *)&a4.size.height);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editor);

  if (WeakRetained)
  {
    objc_msgSend(v8, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tag");

    v13 = objc_loadWeakRetained((id *)&self->_editor);
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    -[EKCalendarItemLocationInlineEditItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      objc_msgSend(v16, "setAutoFillSelectedTextField:", 0);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __121__EKCalendarItemLocationInlineEditItem__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
      v20[3] = &unk_1E601C7B0;
      v21 = v9;
      objc_msgSend(v16, "setViewAppearedBlock:", v20);

    }
    v17 = objc_loadWeakRetained((id *)&self->_editor);
    -[EKCalendarItemEditItem showViewController:editor:animated:](self, "showViewController:editor:animated:", v15, v17, 1);

  }
  else
  {
    v18 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_ERROR, "_Editor was nil, so couldn't call callback in focusElement.", v19, 2u);
    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __121__EKCalendarItemLocationInlineEditItem__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocationEditController, 0);
  objc_destroyWeak((id *)&self->_editor);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
