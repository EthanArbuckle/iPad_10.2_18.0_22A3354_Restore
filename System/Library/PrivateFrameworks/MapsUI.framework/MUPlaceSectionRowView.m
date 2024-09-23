@implementation MUPlaceSectionRowView

- (MUPlaceSectionRowView)initWithFrame:(CGRect)a3
{
  MUPlaceSectionRowView *v3;
  MUPlaceSectionRowView *v4;
  uint64_t v5;
  UIEditMenuInteraction *editMenuInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUPlaceSectionRowView;
  v3 = -[MKViewWithHairline initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3 && -[MUPlaceSectionRowView supportsInteractionMenuItems](v3, "supportsInteractionMenuItems"))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v4);
    editMenuInteraction = v4->_editMenuInteraction;
    v4->_editMenuInteraction = (UIEditMenuInteraction *)v5;

    -[MUPlaceSectionRowView addInteraction:](v4, "addInteraction:", v4->_editMenuInteraction);
  }
  return v4;
}

+ (id)rowViewWithContentView:(id)a3
{
  id v3;
  MUPlaceSectionRowView *v4;
  MUPlaceSectionRowView *v5;
  MUEdgeLayout *v6;

  v3 = a3;
  v4 = [MUPlaceSectionRowView alloc];
  v5 = -[MUPlaceSectionRowView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MUPlaceSectionRowView addSubview:](v5, "addSubview:", v3);
  v6 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", v3, v5);

  -[MUConstraintLayout activate](v6, "activate");
  return v5;
}

- (void)setSelected:(BOOL)a3
{
  -[MUPlaceSectionRowView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEditMenuInteraction *editMenuInteraction;
  void *v16;

  if (self->_selected != a3)
  {
    v4 = a4;
    self->_selected = a3;
    if (a3)
    {
      if (-[MUPlaceSectionRowView supportsInteractionMenuItems](self, "supportsInteractionMenuItems"))
      {
        -[MUPlaceSectionRowView center](self, "center");
        v7 = v6;
        v9 = v8;
        -[MUPlaceSectionRowView superview](self, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceSectionRowView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
        v12 = v11;
        v14 = v13;

        editMenuInteraction = self->_editMenuInteraction;
        objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("MUPlaceSectionRowViewMenu"), v12, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIEditMenuInteraction presentEditMenuWithConfiguration:](editMenuInteraction, "presentEditMenuWithConfiguration:", v16);

      }
    }
    -[MUPlaceSectionRowView _updateBackgroundColor:](self, "_updateBackgroundColor:", v4);
  }
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  if (self->_selected)
    +[MUInfoCardStyle rowSelectedColor](MUInfoCardStyle, "rowSelectedColor");
  else
    +[MUInfoCardStyle rowUnselectedColor](MUInfoCardStyle, "rowUnselectedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v8 = *MEMORY[0x1E0CC1AB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MUPlaceSectionRowView__updateBackgroundColor___block_invoke;
    v9[3] = &unk_1E2E01730;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", v9, 0, v8);

  }
  else
  {
    -[MUPlaceSectionRowView _mapkit_setBackgroundColor:](self, "_mapkit_setBackgroundColor:", v5);
  }

}

uint64_t __48__MUPlaceSectionRowView__updateBackgroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  -[MUPlaceSectionRowView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (-[MUPlaceSectionRowView handlesHighlighting](self, "handlesHighlighting"))
    -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  -[MUPlaceSectionRowView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  if (-[MUPlaceSectionRowView handlesHighlighting](self, "handlesHighlighting"))
    -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceSectionRowView;
  -[MUPlaceSectionRowView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  if (-[MUPlaceSectionRowView handlesHighlighting](self, "handlesHighlighting"))
    -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (BOOL)supportsInteractionMenuItems
{
  char v2;

  if (MUIdiomInTraitEnvironment(self) == 5)
    v2 = 0;
  else
    v2 = objc_opt_respondsToSelector();
  return v2 & 1;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MUPlaceSectionRowView _createCopyAction](self, "_createCopyAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  -[MUPlaceSectionRowView _speechMenuElementFromSuggestedActions:](self, "_speechMenuElementFromSuggestedActions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapsui_addObjectIfNotNil:", v9);

  if (!objc_msgSend(v7, "count"))
    -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__MUPlaceSectionRowView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E2E01970;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __86__MUPlaceSectionRowView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
}

- (id)_speechMenuElementFromSuggestedActions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0DC5100];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "identifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v7);

          if ((v12 & 1) != 0)
            goto LABEL_12;

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)_createCopyAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  _MULocalizedStringFromThisBundle(CFSTR("Copy [Pasteboard]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MUPlaceSectionRowView__createCopyAction__block_invoke;
  v7[3] = &unk_1E2E02840;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, CFSTR("Copy"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __42__MUPlaceSectionRowView__createCopyAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "copy:", 0);
    WeakRetained = v2;
  }

}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)handlesHighlighting
{
  return self->_handlesHighlighting;
}

- (void)setHandlesHighlighting:(BOOL)a3
{
  self->_handlesHighlighting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
}

@end
