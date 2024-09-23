@implementation PKSelectionView

- (PKSelectionView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  PKSelectionView *v15;
  PKSelectionView *v16;
  PKSelectionView *v17;
  uint64_t v18;
  UITapGestureRecognizer *editMenuGR;
  uint64_t v20;
  UITapGestureRecognizer *doubleTapGR;
  BOOL v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  UIDragInteraction *dragInteraction;
  uint64_t v28;
  UILongPressGestureRecognizer *dragGR;
  UIDragInteraction *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  _OWORD v41[3];
  objc_super v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v42.receiver = self;
  v42.super_class = (Class)PKSelectionView;
  v15 = -[PKAdornmentView initWithFrame:strokeSelection:selectionController:selectionType:](&v42, sel_initWithFrame_strokeSelection_selectionController_selectionType_, v13, v14, a6, x, y, width, height);
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    -[PKSelectionView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("com.apple.pencilkit.selectionView"));
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v17, sel_toggleEditMenu);
    editMenuGR = v17->_editMenuGR;
    v17->_editMenuGR = (UITapGestureRecognizer *)v18;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v17->_editMenuGR, "setNumberOfTapsRequired:", 1);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v17, sel_didDoubleTap);
    doubleTapGR = v17->_doubleTapGR;
    v17->_doubleTapGR = (UITapGestureRecognizer *)v20;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v17->_doubleTapGR, "setNumberOfTapsRequired:", 2);
    if (a6)
      v22 = a6 == 6;
    else
      v22 = 1;
    v23 = !v22;
    -[UITapGestureRecognizer setEnabled:](v17->_doubleTapGR, "setEnabled:", v23);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    if (v25)
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v17);
      dragInteraction = v17->_dragInteraction;
      v17->_dragInteraction = (UIDragInteraction *)v26;

      -[PKSelectionView addInteraction:](v17, "addInteraction:", v17->_dragInteraction);
    }
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v17, sel_dragSelection_);
    dragGR = v17->_dragGR;
    v17->_dragGR = (UILongPressGestureRecognizer *)v28;

    -[UILongPressGestureRecognizer setName:](v17->_dragGR, "setName:", CFSTR("PKSelectionDragGesture"));
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v17->_dragGR, "setMinimumPressDuration:", 0.0);
    if (PKIsDeviceLocked())
    {
      v30 = v17->_dragInteraction;
      if (v30)
        -[UIDragInteraction setEnabled:](v30, "setEnabled:", 0);
    }
    v17->_selectionType = a6;
    -[PKAdornmentView selectionController](v17, "selectionController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "drawing");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)v31, v32, (uint64_t)v41);
    v34 = v41[1];
    v33 = v41[2];
    *(_OWORD *)&v16->_selectionDrawingTransform.a = v41[0];
    *(_OWORD *)&v16->_selectionDrawingTransform.c = v34;
    *(_OWORD *)&v16->_selectionDrawingTransform.tx = v33;

    -[PKAdornmentView selectionController](v17, "selectionController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "drawing");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_originalStrokeFrame.origin.x = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v35, v13, v36);
    v16->_originalStrokeFrame.origin.y = v37;
    v16->_originalStrokeFrame.size.width = v38;
    v16->_originalStrokeFrame.size.height = v39;

  }
  return v17;
}

- (id)_selectionViewGestures
{
  UITapGestureRecognizer *editMenuGR;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  editMenuGR = self->_editMenuGR;
  v4[0] = self->_dragGR;
  v4[1] = editMenuGR;
  v4[2] = self->_doubleTapGR;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_dragInteraction)
    -[PKSelectionView removeInteraction:](self, "removeInteraction:");
  v3.receiver = self;
  v3.super_class = (Class)PKSelectionView;
  -[PKSelectionView dealloc](&v3, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSelectionView;
  -[PKSelectionView willMoveToWindow:](&v11, sel_willMoveToWindow_, v4);
  -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setupSelectionAdornment");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5310], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5330], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);

  if (v4)
  {
    -[PKSelectionView becomeFirstResponder](self, "becomeFirstResponder");
    objc_msgSend(v4, "windowScene");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _setupWindowNotificationsForScene:](self, "_setupWindowNotificationsForScene:", v9);
  }
  else
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_willRemoveSelectionView:", self);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v12;
  id *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKSelectionView frame](self, "frame");
  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v10;
  v17.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v12 = CGRectEqualToRect(v16, v17);
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionView;
  -[PKSelectionView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_didEndDraggingSelection:", self);

  }
}

- (void)_setupWindowNotificationsForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__clearSelection_, *MEMORY[0x1E0DC5310], v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__clearSelection_, *MEMORY[0x1E0DC5330], v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__clearSelection_, *MEMORY[0x1E0DC5318], v7);

}

- (void)_clearSelection:(id)a3
{
  id v3;

  -[PKAdornmentView selectionController](self, "selectionController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v3, 0);

}

- (void)generateStrokeImageForPasteAndDND
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PKSelectionView_generateStrokeImageForPasteAndDND__block_invoke;
  v5[3] = &unk_1E77771E8;
  v5[4] = self;
  -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:]((uint64_t)v3, v4, 1, 0, v5);

}

void __52__PKSelectionView_generateStrokeImageForPasteAndDND__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "strokeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrokeImage:", v4);

}

- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y;
  double x;
  _BOOL4 v8;
  unsigned __int8 v9;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  float64x2_t v24;
  uint64_t v25;
  double v26;
  float64x2_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id *v47;
  void *v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  _BYTE v67[128];
  uint64_t v68;
  CGPoint v69;
  CGRect v70;

  y = a3.y;
  x = a3.x;
  v68 = *MEMORY[0x1E0C80C00];
  if (-[PKSelectionView selectionType](self, "selectionType") == 6)
    return 0;
  -[PKSelectionView bounds](self, "bounds");
  v69.x = x;
  v69.y = y;
  if (!CGRectContainsPoint(v70, v69))
    return 0;
  if (-[PKSelectionView selectionType](self, "selectionType")
    && -[PKSelectionView selectionType](self, "selectionType") != 6)
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      WeakRetained = objc_loadWeakRetained((id *)(v11 + 112));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "convertPoint:fromView:", self, x, y);
    v52 = v15;
    v53 = v14;

    v65 = 0u;
    v66 = 0u;
    v64 = 0u;
    -[PKAdornmentView selectionController](self, "selectionController");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = objc_loadWeakRetained((id *)(v16 + 112));
    else
      v18 = 0;
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "drawing");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v18, "transformFromViewToStrokeSpaceInDrawing:", v20);
    }
    else
    {
      v65 = 0u;
      v66 = 0u;
      v64 = 0u;
    }

    v49 = v65;
    v50 = v66;
    v51 = v64;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "strokes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v23)
    {
      v24 = vaddq_f64(v50, vmlaq_n_f64(vmulq_n_f64(v49, v52), v51, v53));
      v25 = *(_QWORD *)v61;
      if (a4)
        v26 = 10.0;
      else
        v26 = 20.0;
      v27 = v24;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v61 != v25)
            objc_enumerationMutation(v22);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "intersectsPoint:boundsOutset:minimumStrokeThreshold:", *(_OWORD *)&v27, v26, v26) & 1) != 0)
          {
            v8 = 1;
            goto LABEL_28;
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        if (v23)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_28:

  }
  else
  {
    v8 = -[PKSelectionView lassoContainsPoint:](self, "lassoContainsPoint:", x, y);
  }
  v9 = v8;
  if (!v8)
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = objc_loadWeakRetained((id *)(v29 + 112));
    else
      v31 = 0;
    -[PKSelectionView convertPoint:toView:](self, "convertPoint:toView:", v31, x, y);
    v33 = v32;
    v35 = v34;

    -[PKAdornmentView selectionController](self, "selectionController");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    if (v36)
      v38 = objc_loadWeakRetained((id *)(v36 + 112));
    else
      v38 = 0;
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "drawing");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v38, "transformFromViewToStrokeSpaceInDrawing:", v40);
      v42 = v55;
      v41 = v54;
      v44 = v57;
      v43 = v56;
      v45 = v59;
      v46 = v58;
    }
    else
    {
      v45 = 0.0;
      v44 = 0.0;
      v42 = 0.0;
      v46 = 0.0;
      v43 = 0.0;
      v41 = 0.0;
    }

    -[PKAdornmentView selectionController](self, "selectionController");
    v47 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKSelectionController _selectedExternalElementsContainsPoint:inAttachment:](v47, v48, v46 + v35 * v43 + v41 * v33, v45 + v35 * v44 + v42 * v33);

  }
  return v9;
}

- (BOOL)lassoContainsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat a;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;
  const CGPath *v23;
  BOOL v24;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  uint64_t v33;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v33 = *MEMORY[0x1E0C80C00];
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[PKAdornmentView selectionController](self, "selectionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "drawing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)v15, v17, (uint64_t)&v30);
  v31 = v30;
  DKD_CGAffineTransformDecompose((uint64_t)&v31, (uint64_t)&v32);
  a = v32.a;

  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&v32, -v8, -v10);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, a, a);
  t1 = v32;
  memset(&v29, 0, sizeof(v29));
  t2 = v31;
  CGAffineTransformConcat(&v29, &t1, &t2);
  v26 = v29;
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v37 = CGRectApplyAffineTransform(v36, &v26);
  if (v37.size.width < 44.0 || v37.size.height < 44.0)
  {
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v35.x = x;
    v35.y = y;
    return CGRectContainsPoint(v38, v35);
  }
  else
  {
    -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      return 0;
    }
    else
    {
      -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lassoPath");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = (const CGPath *)objc_msgSend(v22, "CGPath");
      v34.x = x;
      v34.y = y;
      v24 = CGPathContainsPoint(v23, 0, v34, 0);

    }
  }
  return v24;
}

- (int64_t)editingInteractionConfiguration
{
  return 0;
}

- (id)keyCommands
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  _PencilKitBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Copy strokes"), CFSTR("Copy strokes"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __30__PKSelectionView_keyCommands__block_invoke((uint64_t)CFSTR("c"), 0x100000, (uint64_t)sel_copy_, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  _PencilKitBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cut strokes"), CFSTR("Cut strokes"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __30__PKSelectionView_keyCommands__block_invoke((uint64_t)CFSTR("x"), 0x100000, (uint64_t)sel_cut_, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  _PencilKitBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Paste strokes"), CFSTR("Paste strokes"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __30__PKSelectionView_keyCommands__block_invoke((uint64_t)CFSTR("v"), 0x100000, (uint64_t)sel_paste_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Duplicate strokes"), CFSTR("Duplicate strokes"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __30__PKSelectionView_keyCommands__block_invoke((uint64_t)CFSTR("d"), 0x100000, (uint64_t)sel_duplicate_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  _PencilKitBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Delete strokes"), CFSTR("Delete strokes"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __30__PKSelectionView_keyCommands__block_invoke((uint64_t)CFSTR("\b"), 0, (uint64_t)sel_delete_, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __30__PKSelectionView_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", a1, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscoverabilityTitle:", v7);

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return -[PKSelectionView selectionType](self, "selectionType") != 6;
}

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSelectionView;
  return -[PKSelectionView becomeFirstResponder](&v3, sel_becomeFirstResponder);
}

- (void)toggleEditMenu
{
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v22 = (id)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  v5 = objc_msgSend(WeakRetained, "editMenuVisible");

  -[PKAdornmentView selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v23 = (id)v6;
    if (v6)
      v7 = objc_loadWeakRetained((id *)(v6 + 112));
    else
      v7 = 0;
    objc_msgSend(v7, "editMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissMenu");
LABEL_19:

    return;
  }
  if (!v6 || (v9 = *(unsigned __int8 *)(v6 + 104), (id)v6, !v9))
  {
    if ((-[PKSelectionView isFirstResponder](self, "isFirstResponder") & 1) == 0)
      -[PKSelectionView becomeFirstResponder](self, "becomeFirstResponder");
    -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "editMenuLocation");
    v11 = v10;
    v13 = v12;

    -[PKAdornmentView selectionController](self, "selectionController");
    v14 = objc_claimAutoreleasedReturnValue();
    v25 = (id)v14;
    if (v14)
      v15 = objc_loadWeakRetained((id *)(v14 + 112));
    else
      v15 = 0;
    -[PKSelectionView convertPoint:toView:](self, "convertPoint:toView:", v15, v11, v13);
    v17 = v16;
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("PKEditMenuConfigurationIdentifier"), v17, v19);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView selectionController](self, "selectionController");
    v20 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v20;
    if (v20)
      v8 = objc_loadWeakRetained((id *)(v20 + 112));
    else
      v8 = 0;
    objc_msgSend(v8, "editMenuInteraction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentEditMenuWithConfiguration:", v23);

    goto LABEL_19;
  }
}

- (CGRect)editMenuTargetRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editMenuLocation");
  v5 = v4;
  v7 = v6;

  if (v5 == *MEMORY[0x1E0C9D538] && v7 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    goto LABEL_8;
  -[PKAdornmentView selectionController](self, "selectionController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v9 ? *(void **)(v9 + 120) : 0;
  v12 = v11;
  objc_msgSend(v12, "externalElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_8:
    -[PKSelectionView bounds](self, "bounds");
  }
  else
  {
    v14 = v5 + -2.5;
    v15 = v7 + -2.5;
    v16 = 5.0;
    v17 = 5.0;
  }
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)cut:(id)a3
{
  _QWORD *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController cut:](v4, v5);

}

- (void)copy:(id)a3
{
  _QWORD *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController copy:](v4, v5);

}

- (void)delete:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController delete:]((uint64_t)v4, v5);

}

- (void)paste:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController paste:]((uint64_t)v4, v5);

}

- (void)duplicate:(id)a3
{
  id *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController duplicate:](v4);

}

- (void)copyTranscription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController copyTranscription:]((uint64_t)v4);

}

- (void)translate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController translate:]((uint64_t)v4);

}

- (void)straighten:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController straighten:]((uint64_t)v4, v5);

}

- (void)refine:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController refine:]((uint64_t)v4, v5);

}

- (void)insertSpace:(id)a3
{
  id *v4;
  id v5;

  v5 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController insertSpace:](v4, v5);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  PKSelectionView *v5;

  if (-[PKSelectionView canPerformAction:withSender:](self, "canPerformAction:withSender:", a3, a4))
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  PKSelectionView *v14;
  id *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v21;
  objc_super v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PKSelectionView selectionType](self, "selectionType") != 6 && !self->_isDragging)
  {
    if (v7 && objc_msgSend(v7, "type") == 11)
    {
      v22.receiver = self;
      v22.super_class = (Class)PKSelectionView;
      -[PKSelectionView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v7, x, y);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    v21.receiver = self;
    v21.super_class = (Class)PKSelectionView;
    -[PKSelectionView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesForView:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "type") == 2;
    if (-[PKSelectionView containsPoint:forInputType:](self, "containsPoint:forInputType:", v13, x, y))
    {
      v14 = self;
    }
    else
    {
      -[PKAdornmentView selectionController](self, "selectionController");
      v15 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "knobsContainPoint:forInputType:", v13, x, y);

      if (v17)
      {
        -[PKAdornmentView selectionController](self, "selectionController");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = *(void **)(v18 + 152);
        else
          v20 = 0;
        v8 = v20;

        goto LABEL_16;
      }
      v14 = v10;
    }
    v8 = v14;
LABEL_16:

    goto LABEL_4;
  }
  v8 = 0;
LABEL_4:

  return v8;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  id *v6;
  void *v7;
  char v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PKAdornmentView selectionController](self, "selectionController");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectionInteraction](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_dragShouldBeginForSession:", v5);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v5, "locationInView:", self);
    self->_offsetInTouchView.x = v9;
    self->_offsetInTouchView.y = v10;
    -[PKSelectionView frame](self, "frame");
    self->_originalStrokeFrame.origin.x = v11;
    self->_originalStrokeFrame.origin.y = v12;
    self->_originalStrokeFrame.size.width = v13;
    self->_originalStrokeFrame.size.height = v14;
    -[PKAdornmentView selectionController](self, "selectionController");
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "externalElements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _itemProviderForExternalElements:inAttachment:](v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setExternalElementsItemProvider:", v19);

    v21 = objc_alloc(MEMORY[0x1E0CB36C8]);
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithObject:", v22);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v23);
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalContext:", v25);

    v28[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  v6 = objc_alloc(MEMORY[0x1E0DC3770]);
  -[PKSelectionView bounds](self, "bounds");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v12 = (void *)objc_msgSend(v6, "initWithContainer:center:", self, MidX, CGRectGetMidY(v23));
  v13 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  v15 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "strokeImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "combinedImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithImage:", v18);

  objc_msgSend(v19, "_setContinuousCornerRadius:", 13.0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v19, v13, v12);

  return v20;
}

- (void)transformBegan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGPoint *v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_originalStrokeFrame.origin.x = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v3, v4, v6);
  self->_originalStrokeFrame.origin.y = v7;
  self->_originalStrokeFrame.size.width = v8;
  self->_originalStrokeFrame.size.height = v9;

  v10 = (CGPoint *)MEMORY[0x1E0C9D538];
  self->_offsetInTouchView = (CGPoint)*MEMORY[0x1E0C9D538];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v12 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_resizeTransform.c = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_resizeTransform.tx = v11;
  *(_OWORD *)&self->_resizeTransform.a = v12;
  self->_currentScrollOffset = *v10;
  -[PKSelectionView _dragWillBegin](self, "_dragWillBegin");
  -[PKAdornmentView selectionController](self, "selectionController");
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didBeginDraggingSelection](v13);

  -[PKSelectionView didBeginDraggingSelection](self, "didBeginDraggingSelection");
}

- (void)transformChanged:(CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGRect *p_originalStrokeFrame;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGAffineTransform v12;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v15;
  _OWORD v16[3];
  CGAffineTransform v17;

  v5 = *(_OWORD *)&a3->c;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_resizeTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_resizeTransform.c = v5;
  *(_OWORD *)&self->_resizeTransform.tx = v4;
  v6 = *(_OWORD *)&a3->c;
  v16[0] = *(_OWORD *)&a3->a;
  v16[1] = v6;
  v16[2] = *(_OWORD *)&a3->tx;
  p_originalStrokeFrame = &self->_originalStrokeFrame;
  *(CGFloat *)&v4 = self->_originalStrokeFrame.origin.x;
  *(CGFloat *)&v6 = self->_originalStrokeFrame.origin.y;
  width = self->_originalStrokeFrame.size.width;
  height = self->_originalStrokeFrame.size.height;
  MidX = CGRectGetMidX(*(CGRect *)&v4);
  MidY = CGRectGetMidY(*p_originalStrokeFrame);
  CGAffineTransformMakeTranslation(&t1, MidX, MidY);
  -[PKSelectionView selectionDrawingStrokeTransform](self, "selectionDrawingStrokeTransform");
  CGAffineTransformConcat(&v15, &t1, &t2);
  DKDTransformInTransformSpace(v16, &v15, &v17);
  v12 = v17;
  -[PKSelectionView setTransform:](self, "setTransform:", &v12);
}

- (void)transformEnded
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  id v6;
  id v7;
  _QWORD *v8;

  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDragSelection]((uint64_t)v6);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSelectionAction:", 1);

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = *(_OWORD *)&self->_resizeTransform.c;
    v4 = *(_OWORD *)&self->_resizeTransform.tx;
    *(_OWORD *)(v3 + 168) = *(_OWORD *)&self->_resizeTransform.a;
    *(_OWORD *)(v3 + 184) = v5;
    *(_OWORD *)(v3 + 200) = v4;
  }

  -[PKSelectionView _cleanupDragState](self, "_cleanupDragState");
  -[PKAdornmentView selectionController](self, "selectionController");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didEndDraggingSelection](v8);

}

- (void)dragEnded:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  _QWORD *v8;

  y = a3.y;
  x = a3.x;
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDragSelection]((uint64_t)v6);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSelectionAction:", 1);

  -[PKSelectionView didEndGestureWithTranslation:](self, "didEndGestureWithTranslation:", x, y);
  -[PKAdornmentView selectionController](self, "selectionController");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didEndDraggingSelection](v8);

}

- (void)transformCancelled
{
  _QWORD *v3;

  -[PKSelectionView _resetDragState](self, "_resetDragState");
  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didEndDraggingSelection](v3);

}

- (void)hideStrokeImageView
{
  id *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKSelectionView;
  -[PKAdornmentView hideStrokeImageView](&v11, sel_hideStrokeImageView);
  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](v3, v4, 0);

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v5;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKSelectionView setTransform:](self, "setTransform:", v10);
  -[PKAdornmentView selectionController](self, "selectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionView setFrame:](self, "setFrame:", -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v6, v7, v9));

}

- (void)dragSelection:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  int v6;
  id *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double y;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat height;
  CGFloat v23;
  CGFloat v24;
  double MidX;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  id v34;
  char v35;
  double a;
  double b;
  double d;
  double c;
  double ty;
  double tx;
  id *v42;
  void *v43;
  void *v44;
  __int128 v45;
  double v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  v4 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v5 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = v5[104], v5, !v6))
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController topView](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "locationInView:", v8);
    v10 = v9;
    v12 = v11;
    x = self->_initialDragPosition.x;
    y = self->_initialDragPosition.y;
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 1)
    {
      self->_initialDragPosition.x = v10;
      self->_initialDragPosition.y = v12;
      -[PKSelectionView transformBegan](self, "transformBegan");
    }
    else
    {
      v16 = v10 - x;
      v17 = v12 - y;
      if (objc_msgSend(v4, "state") == 2)
      {
        v18 = self->_originalStrokeFrame.origin.x;
        v19 = self->_originalStrokeFrame.origin.y;
        -[PKSelectionView frame](self, "frame");
        v21 = v20;
        v46 = v17;
        -[PKSelectionView frame](self, "frame");
        height = v51.size.height;
        v23 = v16 + v18;
        v24 = v46 + v19;
        v51.origin.x = v16 + v18;
        v51.origin.y = v24;
        v51.size.width = v21;
        MidX = CGRectGetMidX(v51);
        v52.origin.x = v23;
        v52.origin.y = v24;
        v52.size.width = v21;
        v52.size.height = height;
        -[PKSelectionView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v52));
        -[PKAdornmentView selectionController](self, "selectionController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[PKSelectionController autoscrollForPointIfNecessary:]((uint64_t)v26, v10, v12);
        v29 = v28;

        v30 = v29 + self->_currentScrollOffset.y;
        self->_currentScrollOffset.x = v27 + self->_currentScrollOffset.x;
        self->_currentScrollOffset.y = v30;
        if (v15)
          objc_msgSend(v15, "drawingTransform");
        else
          memset(&v49, 0, sizeof(v49));
        CGAffineTransformInvert(&v50, &v49);
        a = v50.a;
        b = v50.b;
        c = v50.c;
        d = v50.d;
        tx = v50.tx;
        ty = v50.ty;
        -[PKAdornmentView selectionController](self, "selectionController");
        v42 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKAdornmentView strokeSelection](self, "strokeSelection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "externalElements");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v47.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v47.c = v45;
        *(_OWORD *)&v47.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        CGAffineTransformTranslate(&v48, &v47, tx + (v46 - v30) * c + a * v16, ty + (v46 - v30) * d + b * v16);
        -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v42, v44, &v48, v15);

      }
      else if (objc_msgSend(v4, "state") == 3)
      {
        -[PKSelectionView dragEnded:](self, "dragEnded:", v16, v12 - y);
        if (v16 == *MEMORY[0x1E0C9D538] && v17 == *(double *)(MEMORY[0x1E0C9D538] + 8))
        {
          -[PKAdornmentView selectionController](self, "selectionController");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          v34 = v32 ? objc_loadWeakRetained((id *)(v32 + 112)) : 0;
          v35 = objc_msgSend(v34, "editMenuVisible");

          if ((v35 & 1) == 0)
            -[PKSelectionView toggleEditMenu](self, "toggleEditMenu");
        }
      }
      else if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
      {
        -[PKSelectionView transformCancelled](self, "transformCancelled");
      }
    }

  }
}

- (void)performDidEndGestureWithTranslation:(CGPoint)a3
{
  double c;
  double tx;
  double ty;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat MinX;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  double v46;
  double v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  char v54;
  uint64_t v55;
  dispatch_block_t v56;
  id finishDragToAttachmentBlock;
  dispatch_time_t v58;
  double d;
  double a;
  double y;
  double x;
  double b;
  _QWORD v65[5];
  _QWORD block[7];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _BYTE v77[128];
  _QWORD v78[6];
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v78[5] = *MEMORY[0x1E0C80C00];
  y = self->_originalStrokeFrame.origin.y;
  x = self->_originalStrokeFrame.origin.x;
  c = self->_resizeTransform.c;
  b = self->_resizeTransform.b;
  tx = self->_resizeTransform.tx;
  d = self->_resizeTransform.d;
  a = self->_resizeTransform.a;
  ty = self->_resizeTransform.ty;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[PKSelectionView center](self, "center");
  v76[0] = v8;
  v76[1] = v9;
  objc_msgSend(v7, "valueWithBytes:objCType:", v76, "{CGPoint=dd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB3B18];
  -[PKSelectionView frame](self, "frame");
  v12 = v79.origin.x;
  v13 = v79.origin.y;
  width = v79.size.width;
  height = v79.size.height;
  MaxX = CGRectGetMaxX(v79);
  v80.origin.x = v12;
  v80.origin.y = v13;
  v80.size.width = width;
  v80.size.height = height;
  *(CGFloat *)v75 = MaxX;
  v75[1] = CGRectGetMaxY(v80);
  objc_msgSend(v11, "valueWithBytes:objCType:", v75, "{CGPoint=dd}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB3B18];
  -[PKSelectionView frame](self, "frame");
  v19 = v81.origin.x;
  v20 = v81.origin.y;
  v21 = v81.size.width;
  v22 = v81.size.height;
  v23 = CGRectGetMaxX(v81);
  v82.origin.x = v19;
  v82.origin.y = v20;
  v82.size.width = v21;
  v82.size.height = v22;
  *(CGFloat *)v74 = v23;
  v74[1] = CGRectGetMinY(v82);
  objc_msgSend(v18, "valueWithBytes:objCType:", v74, "{CGPoint=dd}");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v24;
  v25 = (void *)MEMORY[0x1E0CB3B18];
  -[PKSelectionView frame](self, "frame");
  v26 = v83.origin.x;
  v27 = v83.origin.y;
  v28 = v83.size.width;
  v29 = v83.size.height;
  MinX = CGRectGetMinX(v83);
  v84.origin.x = v26;
  v84.origin.y = v27;
  v84.size.width = v28;
  v84.size.height = v29;
  *(CGFloat *)v73 = MinX;
  v73[1] = CGRectGetMinY(v84);
  objc_msgSend(v25, "valueWithBytes:objCType:", v73, "{CGPoint=dd}");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v31;
  v32 = (void *)MEMORY[0x1E0CB3B18];
  -[PKSelectionView frame](self, "frame");
  v33 = v85.origin.x;
  v34 = v85.origin.y;
  v35 = v85.size.width;
  v36 = v85.size.height;
  v37 = CGRectGetMinX(v85);
  v86.origin.x = v33;
  v86.origin.y = v34;
  v86.size.width = v35;
  v86.size.height = v36;
  *(CGFloat *)v72 = v37;
  v72[1] = CGRectGetMaxY(v86);
  objc_msgSend(v32, "valueWithBytes:objCType:", v72, "{CGPoint=dd}");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v40 = v39;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v68;
    while (2)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v68 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        -[PKAdornmentView selectionController](self, "selectionController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "CGPointValue");
        LOBYTE(v44) = -[PKSelectionController _isValidDropPointForStrokes:didInsertNewAttachment:]((uint64_t)v45, (uint64_t)&v71, v46, v47);

        if ((v44 & 1) != 0)
        {
          v48 = 1;
          goto LABEL_11;
        }
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v41)
        continue;
      break;
    }
  }
  v48 = 0;
LABEL_11:

  -[PKSelectionView _currentAttachment](self, "_currentAttachment");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_13;
  -[PKAdornmentView selectionController](self, "selectionController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "externalElements");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = tx + (a3.y + y) * c + a * (a3.x + x);
  v54 = -[PKSelectionController _externalElements:locationOutOfBounds:inAttachment:]((uint64_t)v50, v52, v49, v53, ty + (a3.y + y) * d + b * (a3.x + x));

  if ((v54 & 1) == 0)
  {
    v55 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke;
    block[3] = &unk_1E77771C0;
    block[4] = self;
    *(double *)&block[5] = v53;
    *(double *)&block[6] = ty + (a3.y + y) * d + b * (a3.x + x);
    v56 = dispatch_block_create((dispatch_block_flags_t)0, block);
    finishDragToAttachmentBlock = self->_finishDragToAttachmentBlock;
    self->_finishDragToAttachmentBlock = v56;

    if (v71)
    {
      v58 = dispatch_time(0, 1000000000);
      v65[0] = v55;
      v65[1] = 3221225472;
      v65[2] = __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke_2;
      v65[3] = &unk_1E7776F38;
      v65[4] = self;
      dispatch_after(v58, MEMORY[0x1E0C80D38], v65);
    }
    else
    {
      -[PKSelectionView _commitDragToAttachment](self, "_commitDragToAttachment");
    }
  }
  else
  {
LABEL_13:
    -[PKSelectionView _resetDragState](self, "_resetDragState");
  }

}

uint64_t __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didMoveStrokeSelectionToLocation:]((uint64_t)v2, *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "strokeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_currentAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v3, v5, v6);

  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDragState");
}

uint64_t __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 592))
  {
    v1 = result;
    v2 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_1BE213000, v2, OS_LOG_TYPE_FAULT, "Text attachment was not created at the bottom of the note in time for the selection drag to finish", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_commitDragToAttachment");
  }
  return result;
}

- (void)didEndGestureWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[5];

  y = a3.y;
  x = a3.x;
  -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__PKSelectionView_didEndGestureWithTranslation___block_invoke;
    v8[3] = &unk_1E7776F38;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PKSelectionView_didEndGestureWithTranslation___block_invoke_2;
    v7[3] = &unk_1E77770A8;
    v7[4] = self;
    *(double *)&v7[5] = x;
    *(double *)&v7[6] = y;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v8, v7);
  }
  else
  {
    -[PKSelectionView performDidEndGestureWithTranslation:](self, "performDidEndGestureWithTranslation:", x, y);
  }
}

void __48__PKSelectionView_didEndGestureWithTranslation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "selectionRenderer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didEndDraggingSelection");

}

uint64_t __48__PKSelectionView_didEndGestureWithTranslation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performDidEndGestureWithTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_commitDragToAttachment
{
  void (**finishDragToAttachmentBlock)(id, SEL);
  id v4;

  finishDragToAttachmentBlock = (void (**)(id, SEL))self->_finishDragToAttachmentBlock;
  if (finishDragToAttachmentBlock)
  {
    finishDragToAttachmentBlock[2](finishDragToAttachmentBlock, a2);
    v4 = self->_finishDragToAttachmentBlock;
    self->_finishDragToAttachmentBlock = 0;

  }
}

- (void)_resetDragState
{
  __int128 *v3;
  __int128 v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];

  v3 = (__int128 *)MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v4;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKSelectionView setTransform:](self, "setTransform:", v13);
  -[PKSelectionView setFrame:](self, "setFrame:", self->_originalStrokeFrame.origin.x, self->_originalStrokeFrame.origin.y, self->_originalStrokeFrame.size.width, self->_originalStrokeFrame.size.height);
  v10 = *v3;
  v11 = v3[1];
  v12 = v3[2];
  -[PKAdornmentView selectionController](self, "selectionController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_OWORD *)(v5 + 168) = v10;
    *(_OWORD *)(v5 + 184) = v11;
    *(_OWORD *)(v5 + 200) = v12;
  }

  -[PKAdornmentView selectionController](self, "selectionController");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionView _currentAttachment](self, "_currentAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _resetExternalElements:inAttachment:](v6, v8, v9);

  -[PKSelectionView _cleanupDragState](self, "_cleanupDragState");
}

- (void)_cleanupDragState
{
  -[PKAdornmentView _putStrokesBackIntoTiledViewAnimated:](self, "_putStrokesBackIntoTiledViewAnimated:", 0);
  self->_isDragging = 0;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKSelectionView setAlpha:](self, "setAlpha:", a3, a4, 0.3);
  +[PKStatisticsManager sharedStatisticsManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDragAndDropSelection]((uint64_t)v5);

  -[PKSelectionView _resetDragState](self, "_resetDragState");
  -[PKAdornmentView selectionController](self, "selectionController");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionView _currentAttachment](self, "_currentAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _dragInteractionWillBeginForExternalElements:inAttachment:](v6, v8, v9);

  -[PKSelectionView _dragWillBegin](self, "_dragWillBegin");
}

- (void)_dragWillBegin
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  v6 = objc_msgSend(WeakRetained, "editMenuVisible");

  if (v6)
    -[PKSelectionView toggleEditMenu](self, "toggleEditMenu");
  -[PKAdornmentView _liftStrokesOutOfTiledView](self, "_liftStrokesOutOfTiledView");
  -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_didBeginDraggingSelection");

  self->_isDragging = 1;
}

- (void)makeViewAliveAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[11];

  y = a3.y;
  x = a3.x;
  -[PKSelectionView frame](self, "frame");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PKSelectionView_makeViewAliveAtLocation___block_invoke;
  v10[3] = &unk_1E77770D0;
  v10[4] = self;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  v10[7] = v6;
  v10[8] = v7;
  v10[9] = v8;
  v10[10] = v9;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v10, 0);
}

uint64_t __43__PKSelectionView_makeViewAliveAtLocation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40) - *(double *)(*(_QWORD *)(a1 + 32) + 648), *(double *)(a1 + 48) - *(double *)(*(_QWORD *)(a1 + 32) + 656), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)animateViewToOriginalPosition
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PKSelectionView_animateViewToOriginalPosition__block_invoke;
  v2[3] = &unk_1E7776F38;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v2, 0);
}

uint64_t __48__PKSelectionView_animateViewToOriginalPosition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 472), *(double *)(*(_QWORD *)(a1 + 32) + 480), *(double *)(*(_QWORD *)(a1 + 32) + 488), *(double *)(*(_QWORD *)(a1 + 32) + 496));
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v8 = a3;
  v9 = a4;
  self->_isDragging = 0;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v14[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_3;
    v15[3] = &unk_1E7776F38;
    v15[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_4;
    v14[3] = &unk_1E77770F8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v15, v14);
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke;
    v17[3] = &unk_1E7776F38;
    v17[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_2;
    v16[3] = &unk_1E77770F8;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v17, v16);
  }
  -[PKAdornmentView selectionController](self, "selectionController");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "externalElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionView _currentAttachment](self, "_currentAttachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _dragInteractionWillEndForExternalElements:withOperation:inAttachment:](v10, v12, a5, v13);

}

void __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 472), *(double *)(*(_QWORD *)(a1 + 32) + 480), *(double *)(*(_QWORD *)(a1 + 32) + 488), *(double *)(*(_QWORD *)(a1 + 32) + 496));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "selectionRenderer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_didEndDraggingSelection");

}

uint64_t __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDragState");
}

void __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "selectionRenderer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_didEndDraggingSelection");

}

uint64_t __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDragState");
}

- (void)updateLocationForDrop:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[PKSelectionView frame](self, "frame");
  -[PKSelectionView setFrame:](self, "setFrame:", x - self->_offsetInTouchView.x, y - self->_offsetInTouchView.y);
}

- (void)didBeginDraggingSelection
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[PKAdornmentView selectionController](self, "selectionController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 != 2)
  {
    objc_msgSend(v9, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

    objc_msgSend(v9, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[6];

  v5 = a3;
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[PKSelectionView _exactlyOneExternalElementSelected](self, "_exactlyOneExternalElementSelected"))
    {
      -[PKAdornmentView selectionController](self, "selectionController");
      v8 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKAdornmentView strokeSelection](self, "strokeSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalElements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionView _currentAttachment](self, "_currentAttachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _contextMenuInteraction:configurationForExternalElement:inAttachment:](v8, v5, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0DC3428];
      _PencilKitBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Copy"), CFSTR("Copy"), CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v41[3] = &unk_1E7777120;
      v41[4] = self;
      objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3428];
      _PencilKitBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Share"), CFSTR("Share"), CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v18;
      v40[1] = 3221225472;
      v40[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v40[3] = &unk_1E7777120;
      v40[4] = self;
      objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v22, v23, 0, v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0DC3428];
      _PencilKitBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Delete"), CFSTR("Delete"), CFSTR("Localizable"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v18;
      v39[1] = 3221225472;
      v39[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
      v39[3] = &unk_1E7777120;
      v39[4] = self;
      objc_msgSend(v25, "actionWithTitle:image:identifier:handler:", v27, v28, 0, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "setAttributes:", 2);
      v30 = (void *)MEMORY[0x1E0DC36B8];
      v35[0] = v18;
      v35[1] = 3221225472;
      v35[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
      v35[3] = &unk_1E7777148;
      v31 = v19;
      v36 = v31;
      v32 = v24;
      v37 = v32;
      v33 = v29;
      v38 = v33;
      objc_msgSend(v30, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    self->_displayingContextMenu = v13 != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController copy:](v2, *(void **)(a1 + 32));

}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void (**v1)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  aBlock[3] = &unk_1E7776F38;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v1[2](v1);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v1);

}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  objc_msgSend(*(id *)(a1 + 32), "strokeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v6, 0);

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceView:", v8);

  objc_msgSend(v7, "setModalTransitionStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v7, 1, 0);

}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController delete:]((uint64_t)v2, *(void **)(a1 + 32));

}

id __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0DC39D0];
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "menuWithTitle:children:", CFSTR("Edit Selection"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  CGRect v25;
  CGRect v26;

  v6 = a3;
  v7 = a4;
  if (-[PKSelectionView _exactlyOneExternalElementSelected](self, "_exactlyOneExternalElementSelected"))
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externalElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _contextMenuInteraction:previewForHighlightingMenuWithConfiguration:forExternalElement:inAttachment:](v8, v6, v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0DC3B88]);
    -[PKSelectionView bounds](self, "bounds");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    MidX = CGRectGetMidX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v8 = (id *)objc_msgSend(v14, "initWithContainer:center:", self, MidX, CGRectGetMidY(v26));
    v9 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v20 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "strokeImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "combinedImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v20, "initWithImage:", v23);

    objc_msgSend(v10, "_setContinuousCornerRadius:", 13.0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v10, v9, v8);
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, "setPreferredCommitStyle:", 1, a4);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PKSelectionView _exactlyOneExternalElementSelected](self, "_exactlyOneExternalElementSelected"))
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "externalElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _contextMenuInteraction:willDisplayMenuForConfiguration:animator:forExternalElement:inAttachment:](v10, v15, v8, v9, v13, v14);

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  self->_displayingContextMenu = 0;
  if (-[PKSelectionView _exactlyOneExternalElementSelected](self, "_exactlyOneExternalElementSelected"))
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "externalElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionView _currentAttachment](self, "_currentAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _contextMenuInteraction:willEndForConfiguration:animator:forExternalElement:inAttachment:](v10, v15, v8, v9, v13, v14);

  }
}

- (BOOL)_exactlyOneExternalElementSelected
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") == 1;

  }
  return v5;
}

- (void)didDoubleTap
{
  UITapGestureRecognizer *doubleTapGR;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;

  doubleTapGR = self->_doubleTapGR;
  -[PKAdornmentView selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 112));
  else
    WeakRetained = 0;
  -[UITapGestureRecognizer locationInView:](doubleTapGR, "locationInView:", WeakRetained);
  v8 = v7;
  v10 = v9;

  -[PKSelectionView _handleDoubleTapInputAtPoint:](self, "_handleDoubleTapInputAtPoint:", v8, v10);
}

- (void)_handleDoubleTapInputAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t selectionType;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  -[UITapGestureRecognizer touches](self->_doubleTapGR, "touches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  v9 = v8 == 2;
  -[PKAdornmentView selectionController](self, "selectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v10, x, y, 5.0, 5.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAdornmentView selectionController](self, "selectionController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    WeakRetained = objc_loadWeakRetained((id *)(v12 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "pointInStrokeSpace:inDrawing:", v11, x, y);
  v16 = v15;
  v18 = v17;

  selectionType = self->_selectionType;
  if (selectionType != 5)
  {
    -[PKAdornmentView selectionController](self, "selectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "strokes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __48__PKSelectionView__handleDoubleTapInputAtPoint___block_invoke;
    v24[3] = &unk_1E7777170;
    v26 = (int)selectionType + 1;
    v24[4] = self;
    v25 = v11;
    -[PKSelectionController fetchStrokesToSelectAtPoint:inDrawing:withSelectionType:inputType:existingSelection:completion:]((uint64_t)v20, v25, v26, v9, v23, v24, v16, v18);

  }
}

void __48__PKSelectionView__handleDoubleTapInputAtPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  void *v5;
  id v6;

  v6 = a2;
  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", *(_QWORD *)(a1 + 48), objc_msgSend(v6, "contentType"), 1);

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intersectedStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectStrokes:forSelectionType:inDrawing:](v4, v5, *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));

}

- (id)_currentAttachment
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_findTranscriptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKAdornmentView selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PKSelectionView__findTranscriptionWithCompletion___block_invoke;
  v7[3] = &unk_1E7777198;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[PKSelectionController findTranscriptionWithCompletion:]((uint64_t)v5, v7);

}

void __52__PKSelectionView__findTranscriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "transcription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAccessibilityValue:", v3);

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "transcription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

- (id)_accessibilityUserTestingChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    v11.receiver = self;
    v11.super_class = (Class)PKSelectionView;
    -[PKSelectionView _accessibilityUserTestingChildren](&v11, sel__accessibilityUserTestingChildren);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAdornmentView selectionRenderer](self, "selectionRenderer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityUserTestingChildren");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    return v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSelectionView;
    -[PKSelectionView _accessibilityUserTestingChildren](&v10, sel__accessibilityUserTestingChildren);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (CGPoint)offsetInTouchView
{
  double x;
  double y;
  CGPoint result;

  x = self->_offsetInTouchView.x;
  y = self->_offsetInTouchView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGAffineTransform)selectionDrawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[14].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].d;
  return self;
}

- (void)setSelectionDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_selectionDrawingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_selectionDrawingTransform.c = v4;
  *(_OWORD *)&self->_selectionDrawingTransform.tx = v3;
}

- (CGAffineTransform)selectionDrawingStrokeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].d;
  return self;
}

- (void)setSelectionDrawingStrokeTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.c = v4;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.tx = v3;
}

- (BOOL)wantsDragPlatter
{
  return self->_wantsDragPlatter;
}

- (void)setWantsDragPlatter:(BOOL)a3
{
  self->_wantsDragPlatter = a3;
}

- (UILongPressGestureRecognizer)dragGR
{
  return self->_dragGR;
}

- (UITapGestureRecognizer)editMenuGR
{
  return self->_editMenuGR;
}

- (UITapGestureRecognizer)doubleTapGR
{
  return self->_doubleTapGR;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_selectionType = a3;
}

- (CGAffineTransform)userTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].d;
  return self;
}

- (void)setUserTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_userTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_userTransform.c = v4;
  *(_OWORD *)&self->_userTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_doubleTapGR, 0);
  objc_storeStrong((id *)&self->_editMenuGR, 0);
  objc_storeStrong((id *)&self->_dragGR, 0);
  objc_storeStrong(&self->_finishDragToAttachmentBlock, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
}

- (id)shapeMenuActions
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionView shapeSupportCache](self, "shapeSupportCache");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[1];
  if (objc_msgSend(v4, "count"))
  {
    if (v5)
      v6 = (void *)v5[1];
    else
      v6 = 0;
    +[PKShape snapToShapeActionNameForNumShapes:](PKShape, "snapToShapeActionNameForNumShapes:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PKSelectionView_ShapeSupport__shapeMenuActions__block_invoke;
    v12[3] = &unk_1E777D0D8;
    v12[4] = self;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v9, 0, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v10);
  }

  return v3;
}

uint64_t __49__PKSelectionView_ShapeSupport__shapeMenuActions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertToShapes:", 0);
}

- (id)shapeSupportCache
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  PKShapeDrawingController *v12;
  PKShapeDrawingController *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PKSelectionViewShapeSupportCache *value;
  void *v29;
  PKSelectionView *object;
  _OWORD v31[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PKAdornmentView selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;

  if (objc_msgSend(WeakRetained, "allowSnapToShape"))
  {
    -[PKAdornmentView strokeSelection](self, "strokeSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "strokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count") || (unint64_t)objc_msgSend(v7, "count") > 8)
    {
      v8 = 0;
LABEL_36:

      goto LABEL_37;
    }
    objc_getAssociatedObject(self, (const void *)shapeSupportCache_kAssociatedObjectKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_36;
    object = self;
    objc_msgSend(WeakRetained, "inputScale");
    v10 = v9;
    value = objc_alloc_init(PKSelectionViewShapeSupportCache);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PKShapeDrawingController);
    v13 = v12;
    if (v12)
      v12->_shapeRecognitionOn = 1;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v7;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v15)
    {
LABEL_24:

      v22 = objc_msgSend(v11, "count");
      v8 = value;
      if (v22 == objc_msgSend(v14, "count"))
      {
        v23 = (void *)objc_msgSend(v11, "copy");
        if (value)
          objc_storeStrong((id *)&value->_shapes, v23);

        objc_msgSend(v14, "array");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (value)
          objc_storeStrong((id *)&value->_originalStrokes, v24);

        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend(v11, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "type");
          if (value)
            value->_shapeType = v26;

        }
        else if (value)
        {
          value->_shapeType = 0;
        }
      }
      objc_setAssociatedObject(object, (const void *)shapeSupportCache_kAssociatedObjectKey, value, (void *)0x301);

      v7 = v29;
      goto LABEL_36;
    }
    v16 = v15;
    v17 = *(_QWORD *)v33;
LABEL_13:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
      if (objc_msgSend(v19, "_shapeType"))
        goto LABEL_22;
      objc_msgSend(v19, "_strokeData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "hasValidPointTimestampData"))
        goto LABEL_21;
      objc_msgSend(v19, "_strokeMask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        break;
LABEL_22:
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (!v16)
          goto LABEL_24;
        goto LABEL_13;
      }
    }
    memset(v31, 0, sizeof(v31));
    -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v13, v19, v31, 0, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v11, "addObject:", v20);
LABEL_21:

    goto LABEL_22;
  }
  v8 = 0;
LABEL_37:

  return v8;
}

- (BOOL)canConvertToShapeWithAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5
{
  id v8;
  BOOL v9;
  _QWORD *v11;
  void *v12;

  v8 = a4;
  if (sel_convertToShapes_ == a3)
  {
    -[PKSelectionView shapeSupportCache](self, "shapeSupportCache");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v11 = (_QWORD *)v11[1];
    v9 = objc_msgSend(v11, "count") != 0;

    if (a5)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    if (a5)
LABEL_3:
      *a5 = sel_convertToShapes_ == a3;
  }

  return v9;
}

- (void)convertToShapes:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  PKSelectionView *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[PKSelectionView shapeSupportCache](self, "shapeSupportCache", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)v4;
  if (v4)
  {
    v6 = *(id *)(v4 + 16);
    v7 = (void *)v5[1];
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = v7;
  -[PKAdornmentView selectionController](self, "selectionController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 112));
  else
    WeakRetained = 0;

  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v14 = objc_msgSend(v6, "count");
    if (v14 == objc_msgSend(v8, "count") && v13 && WeakRetained)
    {
      v32 = v13;
      v33 = WeakRetained;
      v31 = self;
      if (v5)
        v15 = (void *)v5[1];
      else
        v15 = 0;
      v16 = v15;
      +[PKShape snapToShapeActionNameForNumShapes:](PKShape, "snapToShapeActionNameForNumShapes:", objc_msgSend(v16, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logSelectionAction:", 8);

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v34 = v8;
      v19 = v8;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            +[PKStatisticsManager sharedStatisticsManager]();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKStatisticsManager recordCreateShapeWithType:fromMenu:multiple:]((uint64_t)v25, objc_msgSend(v24, "type"), 1, (unint64_t)objc_msgSend(v19, "count") > 1);

            objc_msgSend(v24, "strokes");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObjectsFromArray:", v26);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v21);
      }

      -[PKAdornmentView selectionController](v31, "selectionController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __49__PKSelectionView_ShapeSupport__convertToShapes___block_invoke;
      v35[3] = &unk_1E777B268;
      v13 = v32;
      v36 = v32;
      v37 = v6;
      v38 = v18;
      v39 = v30;
      WeakRetained = v33;
      v40 = v33;
      v28 = v30;
      v29 = v18;
      -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v27, v35);

      v8 = v34;
    }
  }

}

void __49__PKSelectionView_ShapeSupport__convertToShapes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "undoableDeleteStrokes:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "undoableAddNewStrokes:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActionName:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setActionName:", *(_QWORD *)(a1 + 56));
  v4 = *(void **)(a1 + 64);
  objc_msgSend(v4, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView:registerUndoCommands:", v5, v6);

  objc_msgSend(*(id *)(a1 + 64), "didChangeDrawing:", *(_QWORD *)(a1 + 32));
  v7 = *(void **)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_selectionRefreshWithChangeToDrawings:completion:", v8, &__block_literal_global_77);

}

@end
