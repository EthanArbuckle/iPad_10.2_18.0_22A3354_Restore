@implementation CKBrowserDragManager

- (CKBrowserDragManager)initWithTargetView:(id)a3
{
  id v4;
  CKBrowserDragManager *v5;
  CKBrowserDragManager *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKBrowserDragManager;
  v5 = -[CKBrowserDragManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CKBrowserDragManager setTargetView:](v5, "setTargetView:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v6, sel_tapRecognized_);
    objc_msgSend(v7, "setMinimumPressDuration:", 2.22507386e-308);
    objc_msgSend(v7, "setDelegate:", v6);
    objc_msgSend(v7, "setCancelsTouchesInView:", 0);
    objc_msgSend(v4, "addGestureRecognizer:", v7);
    -[CKBrowserDragManager setGestureRecognizer:](v6, "setGestureRecognizer:", v7);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[CKBrowserDragManager targetView](self, "targetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserDragManager;
  -[CKBrowserDragManager dealloc](&v6, sel_dealloc);
}

- (BOOL)usesSeparateDragWindow
{
  if (IMIsRunningIniMessageAppsViewService()
    || IMIsRunningIniMessageAppExtension()
    || CKIsRunningInInCallService())
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") ^ 1;
  }
}

- (void)beginDraggingItem:(id)a3 withDragImage:(id)a4 fromRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CKAnimatedImage *v13;
  void *v14;
  CKAnimatedImage *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (a4)
  {
    v12 = a4;
    v13 = [CKAnimatedImage alloc];
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[CKAnimatedImage initWithImages:durations:](v13, "initWithImages:durations:", v14, &unk_1E286F520);
    -[CKBrowserDragManager beginDraggingItem:withAnimatedDragImage:fromRect:](self, "beginDraggingItem:withAnimatedDragImage:fromRect:", v11, v15, x, y, width, height);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = 0;
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", CFSTR("CKBrowserDragManagerDragException"), CFSTR("beginDraggingItem, should not be called with a nil image parameter"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    IMLogSimulateCrashForException();
  }

}

- (id)superviewOfView:(id)a3 matchingClass:(Class)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)beginDraggingItem:(id)a3 withAnimatedDragImage:(id)a4 fromRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  CKBrowserDragWindow *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CKBrowserDragViewController *v67;
  void *v68;
  CKBrowserDragViewController *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  NSObject *v90;
  void *v91;
  char v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  char isKindOfClass;
  double v98;
  double v99;
  double v100;
  double v101;
  uint8_t buf[16];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "state");

  if (CKIsRunningInMacCatalyst())
  {
    -[CKBrowserDragManager currentItem](self, "currentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_12;
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v90, OS_LOG_TYPE_INFO, "Drag and drop cancelled, current gesture recognizer state is not recognized, changed, or began", buf, 2u);
      }

    }
    -[CKBrowserDragManager delegate](self, "delegate");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_opt_respondsToSelector();

    if ((v92 & 1) != 0)
    {
      -[CKBrowserDragManager delegate](self, "delegate");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "dragManager:didEndDraggingItem:toDragTarget:dropArea:", self, v11, 0, 0);

    }
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
  {
    v17 = CKIsRunningInCameraAppsClient();

    if (!v17)
    {
      v18 = (void *)MEMORY[0x1E0CEAAC8];
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sharedTextEffectsWindowForWindowScene:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v19) = objc_msgSend(v21, "_isFullscreen");
      if (!(_DWORD)v19)
        goto LABEL_30;
    }
  }
  else
  {

  }
  -[CKBrowserDragManager currentItem](self, "currentItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

    goto LABEL_30;
  }
  if ((unint64_t)(v14 - 1) > 2)
    goto LABEL_30;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("CKBrowserDragManagerWillStartDraggingNotification"), 0);

  -[CKBrowserDragManager setCurrentItem:](self, "setCurrentItem:", v11);
  v24 = -[CKBrowserDragManager usesSeparateDragWindow](self, "usesSeparateDragWindow");
  -[CKBrowserDragManager targetView](self, "targetView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v27 = [CKBrowserDragWindow alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v29 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:restrictedToPortraitOrientation:](v27, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, 0);

    v26 = (void *)v29;
  }
  -[CKBrowserDragManager setDragWindow:](self, "setDragWindow:", v26);
  -[CKBrowserDragManager targetView](self, "targetView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertRect:toView:", 0, x, y, width, height);
  v100 = v32;
  v101 = v31;
  v98 = v34;
  v99 = v33;

  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragManager targetView](self, "targetView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "locationInView:", v36);
  v38 = v37;
  v40 = v39;

  -[CKBrowserDragManager targetView](self, "targetView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "convertPoint:toView:", 0, v38, v40);
  v43 = v42;
  v45 = v44;

  -[CKBrowserDragManager targetView](self, "targetView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragManager superviewOfView:matchingClass:](self, "superviewOfView:matchingClass:", v46, objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserDragManager targetView](self, "targetView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "convertRect:toView:", v47, x, y, width, height);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;

  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "locationInView:", v47);
  v59 = v58;
  v61 = v60;

  -[CKBrowserDragManager targetView](self, "targetView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "convertPoint:toView:", v47, v59, v61);
  v64 = v63;
  v66 = v65;

  v67 = [CKBrowserDragViewController alloc];
  -[CKBrowserDragManager gestureRecognizer](self, "gestureRecognizer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = -[CKBrowserDragViewController initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:](v67, "initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:", v12, v68, v101, v100, v99, v98, v43, v45, v50, v52, v54, v56, v64, v66);

  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "windowScene");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "_enhancedWindowingEnabled");

  if (v72)
    -[CKBrowserDragViewController setKeyboardWindowSourceView:](v69, "setKeyboardWindowSourceView:", v47);
  -[CKBrowserDragViewController setDelegate:](v69, "setDelegate:", self);
  -[CKBrowserDragManager setDragViewController:](self, "setDragViewController:", v69);
  if (v24)
    v73 = 0;
  else
    v73 = 5;
  -[CKBrowserDragViewController setModalPresentationStyle:](v69, "setModalPresentationStyle:", v73);
  -[CKBrowserDragManager delegate](self, "delegate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_opt_respondsToSelector();

  if ((v75 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController setCanScale:](v69, "setCanScale:", objc_msgSend(v76, "dragManager:canScaleItem:", self, v11));

  }
  -[CKBrowserDragManager delegate](self, "delegate");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_opt_respondsToSelector();

  if ((v78 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController setCanRotate:](v69, "setCanRotate:", objc_msgSend(v79, "dragManager:canRotateItem:", self, v11));

  }
  -[CKBrowserDragManager delegate](self, "delegate");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_opt_respondsToSelector();

  if ((v81 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController setCanPeel:](v69, "setCanPeel:", objc_msgSend(v82, "dragManager:canPeelItem:", self, v11));

  }
  objc_msgSend(v26, "setHidden:", 0);
  objc_msgSend(v26, "rootViewController");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v94 = 10;
    while (1)
    {
      objc_msgSend(v83, "presentedViewController");
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95)
        break;
      v96 = (void *)v95;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v83, "presentedViewController");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v83 = v84;
      if (!--v94)
        goto LABEL_27;
    }
  }
  v84 = v83;
LABEL_27:
  objc_msgSend(v84, "presentViewController:animated:completion:", v69, 0, 0);
  -[CKBrowserDragManager setPresentingViewController:](self, "setPresentingViewController:", v84);
  -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "dragManagerDidBeginDragging:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "postNotificationName:object:", CFSTR("CKBrowserDragManagerDidStartDraggingNotification"), 0);

  -[CKBrowserDragManager delegate](self, "delegate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_opt_respondsToSelector();

  if ((v88 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "dragManager:didBeginDraggingItem:", self, v11);

  }
LABEL_36:

}

- (void)setPlusButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKBrowserDragManager dragViewController](self, "dragViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlusImageViewHidden:", v3);

}

- (void)tapRecognized:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[CKBrowserDragManager targetView](self, "targetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CKBrowserDragManager setLocationInView:](self, "setLocationInView:", v7, v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)browserDragViewController:(id)a3 draggedWithTarget:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragManager:draggedItemWithTarget:", self, v10);

  -[CKBrowserDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragManager currentItem](self, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dragManager:didDragItem:toDragTarget:", self, v9, v10);

  }
}

- (id)browserDragViewControllerTargetView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dragManagerTargetView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)browserDragViewController:(id)a3 dragEndedWithTarget:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  void (**v28)(_QWORD);
  _QWORD aBlock[5];
  id v30;
  id v31;
  int v32;
  char v33;

  v5 = a4;
  -[CKBrowserDragManager currentItem](self, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dragManager:dropAreaForDragTarget:", self, v5);

  }
  else
  {
    v8 = 0;
  }
  -[CKBrowserDragManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "dragManager:shouldCancelDraggingForItem:toDragTarget:dropArea:", self, v6, v5, v8);

  }
  else
  {
    v12 = 0;
  }
  v13 = MEMORY[0x1E0C809B0];
  if (!(_DWORD)v8)
    v12 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke;
  aBlock[3] = &unk_1E2750500;
  aBlock[4] = self;
  v14 = v6;
  v30 = v14;
  v15 = v5;
  v31 = v15;
  v32 = v8;
  v33 = v12;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v12 == 1)
  {
    -[CKBrowserDragManager dragViewController](self, "dragViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "animateBackToSourceCompletionBlock:", v16);

  }
  else
  {
    -[CKBrowserDragManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragManager currentItem](self, "currentItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "dragManager:canPeelItem:", self, v19);

    if (v20)
    {
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_2;
      v27[3] = &unk_1E2750528;
      v27[4] = self;
      v28 = v16;
      v21 = _Block_copy(v27);
      -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        -[CKBrowserDragManager transcriptDelegate](self, "transcriptDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v13;
        v25[1] = 3221225472;
        v25[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_4;
        v25[3] = &unk_1E2750578;
        v26 = v21;
        objc_msgSend(v24, "dragManager:overrideDropPointForTarget:completion:", self, v15, v25);

      }
      else
      {
        objc_msgSend(v15, "screenCoordinate");
        (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
      }

    }
    else
    {
      v16[2](v16);
    }
  }

}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dragManager:didEndDraggingItem:toDragTarget:dropArea:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));

  }
  if (*(_BYTE *)(a1 + 60))
  {
    v11 = CFSTR("CKBrowserDragManagerDidEndDragSuccessKey");
    v12[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CKBrowserDragManagerDidEndDraggingNotification"), 0, v5);

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setPresentingViewController:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "usesSeparateDragWindow"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dragWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "dragViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setDragViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDragWindow:", 0);
  objc_msgSend(*(id *)(a1 + 32), "transcriptDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dragManagerDidEndDragging:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "setCurrentItem:", 0);
}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "dragViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_3;
  v9[3] = &unk_1E274AED0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "animatePlacementAtPoint:shouldShrink:completionBlock:", a2, v9, a3, a4);

}

uint64_t __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_4(uint64_t a1, double a2, double a3)
{
  _QWORD block[4];
  id v6;
  double v7;
  double v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_5;
  block[3] = &unk_1E2750550;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)draggedSticker
{
  void *v2;
  void *v3;

  -[CKBrowserDragManager dragViewController](self, "dragViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggedSticker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKBrowserDragControllerDelegate)delegate
{
  return (CKBrowserDragControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKBrowserDragControllerTranscriptDelegate)transcriptDelegate
{
  return (CKBrowserDragControllerTranscriptDelegate *)objc_loadWeakRetained((id *)&self->_transcriptDelegate);
}

- (void)setTranscriptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transcriptDelegate, a3);
}

- (id)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
  objc_storeStrong(&self->_currentItem, a3);
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (CGPoint)locationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInView.x;
  y = self->_locationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInView:(CGPoint)a3
{
  self->_locationInView = a3;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (CKBrowserDragViewController)dragViewController
{
  return self->_dragViewController;
}

- (void)setDragViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dragViewController, a3);
}

- (UIWindow)dragWindow
{
  return self->_dragWindow;
}

- (void)setDragWindow:(id)a3
{
  objc_storeStrong((id *)&self->_dragWindow, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dragWindow, 0);
  objc_storeStrong((id *)&self->_dragViewController, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong(&self->_currentItem, 0);
  objc_destroyWeak((id *)&self->_transcriptDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
