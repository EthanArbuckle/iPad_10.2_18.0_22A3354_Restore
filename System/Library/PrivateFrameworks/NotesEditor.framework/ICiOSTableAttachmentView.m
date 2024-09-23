@implementation ICiOSTableAttachmentView

- (id)tableAttachmentViewController
{
  id v2;
  uint64_t v3;

  -[ICiOSTableAttachmentView nextResponder](self, "nextResponder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentView;
  v4 = a3;
  -[ICiOSTableAttachmentView setHighlightPatternRegexFinder:](&v6, sel_setHighlightPatternRegexFinder_, v4);
  -[ICiOSTableAttachmentView tableAttachmentViewController](self, "tableAttachmentViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightPatternRegexFinder:", v4);

}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentView;
  -[ICiOSTableAttachmentView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICiOSTableAttachmentView tableAttachmentViewController](self, "tableAttachmentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideColumnRowButtons");

  }
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICiOSTableAttachmentView nextResponder](self, "nextResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetForAction:withSender:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICiOSTableAttachmentView;
    -[ICAttachmentView targetForAction:withSender:](&v10, sel_targetForAction_withSender_, a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICiOSTableAttachmentView;
  if (-[ICiOSTableAttachmentView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ICTableAttachmentView outsideViews](self, "outsideViews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "isDescendantOfView:", self))
          {
            if ((objc_msgSend(v14, "isHidden") & 1) == 0)
            {
              -[ICiOSTableAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
              if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
              {
                v8 = 1;
                goto LABEL_15;
              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_15:

  }
  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)setHighlightColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentView;
  v4 = a3;
  -[ICiOSTableAttachmentView setHighlightColor:](&v6, sel_setHighlightColor_, v4);
  -[ICiOSTableAttachmentView tableAttachmentViewController](self, "tableAttachmentViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightColor:", v4);

}

- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Table attachment"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICiOSTableAttachmentView tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeTableAccessibilityControllerIfNecessary");

  -[ICiOSTableAttachmentView tableAttachmentViewController](self, "tableAttachmentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_addNonNilObject:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

@end
