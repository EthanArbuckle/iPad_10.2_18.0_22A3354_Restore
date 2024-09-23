@implementation NTKGreenfieldHighlightableFaceContainerView

- (NTKGreenfieldHighlightableFaceContainerView)initWithFace:(id)a3
{
  id v5;
  void *v6;
  NTKFaceViewController *v7;
  id v8;
  NTKFaceViewController *v9;
  void *v10;
  NTKGreenfieldHighlightableFaceContainerView *v11;
  NTKGreenfieldHighlightableFaceContainerView *v12;
  id v13;
  uint64_t v14;
  UIView *overlayView;
  UIView *v16;
  void *v17;
  id v18;
  uint64_t v19;
  UIView *highlightedDisplaysContainerView;
  uint64_t v21;
  NSMutableSet *highlightedSlots;
  uint64_t v23;
  NSMutableDictionary *highlightedSlotToDisplayWrapperViewMapping;
  uint64_t v25;
  NSMutableDictionary *slotToTemplateMapping;
  objc_super v28;
  _QWORD v29[4];
  id v30;

  v5 = a3;
  +[NTKGreenfieldHighlightableFaceContainerView _createFaceForDisplayingFrom:](NTKGreenfieldHighlightableFaceContainerView, "_createFaceForDisplayingFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [NTKFaceViewController alloc];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__NTKGreenfieldHighlightableFaceContainerView_initWithFace___block_invoke;
  v29[3] = &unk_1E6BCFDE0;
  v8 = v5;
  v30 = v8;
  v9 = -[NTKFaceViewController initWithFace:configuration:](v7, "initWithFace:configuration:", v6, v29);
  -[NTKFaceViewController faceView](v9, "faceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v28.receiver = self;
  v28.super_class = (Class)NTKGreenfieldHighlightableFaceContainerView;
  v11 = -[NTKGreenfieldHighlightableFaceContainerView initWithFrame:](&v28, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalFace, a3);
    objc_storeStrong((id *)&v12->_faceViewController, v9);
    -[NTKGreenfieldHighlightableFaceContainerView addSubview:](v12, "addSubview:", v10);
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v10, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    overlayView = v12->_overlayView;
    v12->_overlayView = (UIView *)v14;

    v16 = v12->_overlayView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIView setAlpha:](v12->_overlayView, "setAlpha:", 0.8);
    -[UIView setHidden:](v12->_overlayView, "setHidden:", 1);
    -[NTKGreenfieldHighlightableFaceContainerView addSubview:](v12, "addSubview:", v12->_overlayView);
    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v10, "bounds");
    v19 = objc_msgSend(v18, "initWithFrame:");
    highlightedDisplaysContainerView = v12->_highlightedDisplaysContainerView;
    v12->_highlightedDisplaysContainerView = (UIView *)v19;

    -[NTKGreenfieldHighlightableFaceContainerView addSubview:](v12, "addSubview:", v12->_highlightedDisplaysContainerView);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    highlightedSlots = v12->_highlightedSlots;
    v12->_highlightedSlots = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    highlightedSlotToDisplayWrapperViewMapping = v12->_highlightedSlotToDisplayWrapperViewMapping;
    v12->_highlightedSlotToDisplayWrapperViewMapping = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    slotToTemplateMapping = v12->_slotToTemplateMapping;
    v12->_slotToTemplateMapping = (NSMutableDictionary *)v25;

    -[NTKGreenfieldHighlightableFaceContainerView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
  }

  return v12;
}

void __60__NTKGreenfieldHighlightableFaceContainerView_initWithFace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "setDataMode:", 3);
  objc_msgSend(v8, "setShouldShowSnapshot:", 0);
  objc_msgSend(v8, "setShowsCanonicalContent:", 1);
  objc_msgSend(v8, "setShouldUseSampleTemplate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceCategory") != 1)
  {
    objc_msgSend(v3, "screenCornerRadius");
    v5 = v4;
    objc_msgSend(v8, "faceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

    objc_msgSend(v8, "faceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

  }
}

- (void)setTemplate:(id)a3 forSlot:(id)a4
{
  NSMutableDictionary *slotToTemplateMapping;
  id v7;

  slotToTemplateMapping = self->_slotToTemplateMapping;
  v7 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](slotToTemplateMapping, "setObject:forKeyedSubscript:", a3, v7);
  -[NTKGreenfieldHighlightableFaceContainerView _updateTemplateForSlot:](self, "_updateTemplateForSlot:", v7);

}

- (void)setComplicationDisplayViewState:(int64_t)a3 forSlot:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NTKGreenfieldHighlightableFaceContainerView *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  -[NTKFaceViewController face](self->_faceViewController, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace complicationForSlot:](self->_originalFace, "complicationForSlot:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "complication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "complicationType") == 31)
    {
      objc_msgSend(v8, "complication");
      v10 = objc_claimAutoreleasedReturnValue();
      +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:](NTKGreenfieldPlaceholderComplication, "placeholderWithComplication:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    else
    {
      v11 = v9;
    }

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v6, "preferredComplicationFamilyForComplication:withSlot:", v7, v19);
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v7, v12, v14, 1);

    if (!v15)
    {
      +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:](NTKGreenfieldPlaceholderComplication, "placeholderWithComplication:", v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

      v7 = v11;
    }
  }
  switch(a3)
  {
    case 2:
      -[NSMutableSet addObject:](self->_highlightedSlots, "addObject:", v19);
      objc_msgSend(v6, "setComplication:forSlot:", v7, v19);
      -[NTKGreenfieldHighlightableFaceContainerView _updateTemplateForSlot:](self, "_updateTemplateForSlot:", v19);
      v16 = self;
      v17 = 1;
      goto LABEL_15;
    case 1:
      -[NTKGreenfieldHighlightableFaceContainerView _toggleHighlight:forComplicationWrapperViewAtSlot:](self, "_toggleHighlight:forComplicationWrapperViewAtSlot:", 0, v19);
      +[NTKComplication nullComplication](NTKComplication, "nullComplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setComplication:forSlot:", v18, v19);

      break;
    case 0:
      -[NSMutableSet removeObject:](self->_highlightedSlots, "removeObject:", v19);
      objc_msgSend(v6, "setComplication:forSlot:", v7, v19);
      -[NTKGreenfieldHighlightableFaceContainerView _updateTemplateForSlot:](self, "_updateTemplateForSlot:", v19);
      v16 = self;
      v17 = 0;
LABEL_15:
      -[NTKGreenfieldHighlightableFaceContainerView _toggleHighlight:forComplicationWrapperViewAtSlot:](v16, "_toggleHighlight:forComplicationWrapperViewAtSlot:", v17, v19);
      break;
  }

}

- (void)layoutSubviews
{
  void *v3;
  NSMutableDictionary *highlightedSlotToDisplayWrapperViewMapping;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKGreenfieldHighlightableFaceContainerView;
  -[NTKGreenfieldHighlightableFaceContainerView layoutSubviews](&v8, sel_layoutSubviews);
  -[NTKFaceViewController faceView](self->_faceViewController, "faceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutComplicationViews");
  highlightedSlotToDisplayWrapperViewMapping = self->_highlightedSlotToDisplayWrapperViewMapping;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKGreenfieldHighlightableFaceContainerView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E6BD9928;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](highlightedSlotToDisplayWrapperViewMapping, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __61__NTKGreenfieldHighlightableFaceContainerView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "normalComplicationDisplayWrapperForSlot:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "convertRect:fromView:", v8);
  objc_msgSend(v6, "setFrame:");

}

- (void)_updateTemplateForSlot:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NTKFaceViewController face](self->_faceViewController, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceViewController faceView](self->_faceViewController, "faceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalComplicationDisplayWrapperForSlot:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_slotToTemplateMapping, "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "setComplicationTemplate:reason:animation:", v7, 0, 0);

  }
}

- (void)_toggleHighlight:(BOOL)a3 forComplicationWrapperViewAtSlot:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;

  v4 = a3;
  v19 = a4;
  -[NTKFaceViewController faceView](self->_faceViewController, "faceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");
  objc_msgSend(v6, "layoutIfNeeded");
  -[NTKFaceViewController face](self->_faceViewController, "face");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalComplicationDisplayWrapperForSlot:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setHidden:", 0);
    if (v4)
    {
      objc_msgSend(v7, "complicationForSlot:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceViewController _controllerForComplication:face:slot:](NTKFaceViewController, "_controllerForComplication:face:slot:", v10, v7, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceViewController _createNormalDisplayForComplicationController:slot:face:faceView:](NTKFaceViewController, "_createNormalDisplayForComplicationController:slot:face:faceView:", v11, v19, v7, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configureComplicationViewDisplayWrapper:forSlot:", v12, v19);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_slotToTemplateMapping, "objectForKeyedSubscript:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setComplicationTemplate:reason:animation:", v13, 0, 0);

      objc_msgSend(v12, "display");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v12, "display");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBezelTextColor:", v17);

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightedSlotToDisplayWrapperViewMapping, "setObject:forKeyedSubscript:", v12, v19);
      -[UIView addSubview:](self->_highlightedDisplaysContainerView, "addSubview:", v12);
      -[NTKGreenfieldHighlightableFaceContainerView setNeedsLayout](self, "setNeedsLayout");

    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightedSlotToDisplayWrapperViewMapping, "objectForKeyedSubscript:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightedSlotToDisplayWrapperViewMapping, "setObject:forKeyedSubscript:", 0, v19);
    }

    v18 = -[NSMutableDictionary count](self->_highlightedSlotToDisplayWrapperViewMapping, "count") == 0;
    -[UIView setHidden:](self->_overlayView, "setHidden:", v18);
    -[UIView setHidden:](self->_highlightedDisplaysContainerView, "setHidden:", v18);
  }

}

+ (id)_createFaceForDisplayingFrom:(id)a3
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a3, "deepCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleComplicationChangeObservation:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NTKGreenfieldHighlightableFaceContainerView__createFaceForDisplayingFrom___block_invoke;
  v6[3] = &unk_1E6BD2138;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v4, "enumerateComplicationSlotsWithBlock:", v6);

  return v4;
}

void __76__NTKGreenfieldHighlightableFaceContainerView__createFaceForDisplayingFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "complication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v4, "complication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setComplication:forSlot:", v7, v8);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotToTemplateMapping, 0);
  objc_storeStrong((id *)&self->_highlightedSlots, 0);
  objc_storeStrong((id *)&self->_highlightedSlotToDisplayWrapperViewMapping, 0);
  objc_storeStrong((id *)&self->_highlightedDisplaysContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_faceViewController, 0);
  objc_storeStrong((id *)&self->_originalFace, 0);
}

@end
