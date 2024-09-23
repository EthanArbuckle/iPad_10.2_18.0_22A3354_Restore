@implementation PKMentionView

- (PKMentionView)initWithMentionItem:(id)a3 possibleParticipants:(id)a4 inDrawing:(id)a5
{
  PKMentionItem *v8;
  id v9;
  id v10;
  PKMentionView *v11;
  PKMentionItem *mentionItem;
  PKMentionItem *v13;
  uint64_t v14;
  NSArray *possibleParticipants;
  objc_super v17;

  v8 = (PKMentionItem *)a3;
  v17.receiver = self;
  v17.super_class = (Class)PKMentionView;
  v9 = a5;
  v10 = a4;
  v11 = -[PKDetectionView init](&v17, sel_init);
  mentionItem = v11->_mentionItem;
  v11->_mentionItem = v8;
  v13 = v8;

  -[PKDetectionItem setDrawing:](v11->_mentionItem, "setDrawing:", v9, v17.receiver, v17.super_class);
  v14 = objc_msgSend(v10, "copy");

  possibleParticipants = v11->_possibleParticipants;
  v11->_possibleParticipants = (NSArray *)v14;

  return v11;
}

- (id)item
{
  return self->_mentionItem;
}

- (void)setMentionColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_mentionColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mentionColor, a3);
    -[PKMentionView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (id)_underlineColor
{
  UIColor *mentionColor;
  UIColor *v4;

  if (-[PKMentionItem active](self->_mentionItem, "active") && (mentionColor = self->_mentionColor) != 0)
  {
    v4 = mentionColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (double)_underlineThickness
{
  return 1.0;
}

- (void)updateActivationState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[PKMentionView mentionItem](self, "mentionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mentionUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PKMentionView mentionItem](self, "mentionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateUUID");

  -[PKMentionView mentionItem](self, "mentionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mentionUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v6 && (objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
  {
    -[PKMentionView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "mentionViewDidActivateMention:withParticpant:", self, 0);
    else
      objc_msgSend(v7, "mentionViewWillDeactivateMention:", self);

    -[PKMentionView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.pencilkit.mentionView");
}

- (id)accessibilityValue
{
  return -[PKMentionItem mentionResult](self->_mentionItem, "mentionResult");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E777AB90;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  _BYTE v37[128];
  uint64_t v38;
  CGSize v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mentionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mentionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _PencilKitBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Convert to text"), CFSTR("Convert to text"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3428];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v35[3] = &unk_1E7778D68;
    v35[4] = *(_QWORD *)(a1 + 32);
    v36 = v6;
    v9 = v6;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v7, 0, v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 32), "mentionItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mentionResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "possibleParticipants");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v17, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "color");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scale");
          v23 = v22;
          v39.width = 24.0;
          v39.height = 24.0;
          UIGraphicsBeginImageContextWithOptions(v39, 0, v23);

          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 4.0, 4.0, 16.0, 16.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addClip");

          objc_msgSend(v20, "set");
          v40.origin.x = 4.0;
          v40.origin.y = 4.0;
          v40.size.width = 16.0;
          v40.size.height = 16.0;
          UIRectFill(v40);
          UIGraphicsGetImageFromCurrentImageContext();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
          v30[3] = &unk_1E7778D68;
          v30[4] = *(_QWORD *)(a1 + 32);
          v30[5] = v17;
          objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v19, v25, 0, v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v26);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Participants to mention"), CFSTR("Participants to mention"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v12, v2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setMentionColor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mentionViewWillDeactivateMention:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "mentionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionViewDidDeactivateMention:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v6, "setActionName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mentionView:registerCommand:", *(_QWORD *)(a1 + 32), v6);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

void __71__PKMentionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMentionColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "mentionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionViewDidActivateMention:withParticpant:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Convert to mention"), CFSTR("Convert to mention"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionName:", v6);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mentionView:registerCommand:", *(_QWORD *)(a1 + 32), v8);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPath:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[PKMentionView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PKMentionView frame](self, "frame");
  v19 = v18 * 0.5;
  v28.origin.x = v11;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  v29 = CGRectInset(v28, 0.0, v19);
  v20 = (void *)objc_msgSend(v9, "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  -[PKMentionView setBlankPreviewView:](self, "setBlankPreviewView:", v20);

  -[PKMentionView blankPreviewView](self, "blankPreviewView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOpaque:", 0);

  -[PKMentionView superview](self, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMentionView blankPreviewView](self, "blankPreviewView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  v24 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[PKMentionView blankPreviewView](self, "blankPreviewView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithView:parameters:", v25, v6);

  return v26;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKMentionView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __73__PKMentionView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blankPreviewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setBlankPreviewView:", 0);
}

- (PKMentionItem)mentionItem
{
  return self->_mentionItem;
}

- (UIColor)mentionColor
{
  return self->_mentionColor;
}

- (PKMentionViewDelegate)delegate
{
  return (PKMentionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)blankPreviewView
{
  return self->_blankPreviewView;
}

- (void)setBlankPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_blankPreviewView, a3);
}

- (NSArray)possibleParticipants
{
  return self->_possibleParticipants;
}

- (void)setPossibleParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleParticipants, 0);
  objc_storeStrong((id *)&self->_blankPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mentionColor, 0);
  objc_storeStrong((id *)&self->_mentionItem, 0);
}

@end
