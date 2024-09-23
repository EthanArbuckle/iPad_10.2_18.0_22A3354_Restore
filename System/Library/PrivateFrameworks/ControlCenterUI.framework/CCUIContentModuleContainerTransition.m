@implementation CCUIContentModuleContainerTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7;
  id WeakRetained;
  _BOOL4 appearanceTransition;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  CGRect v28;

  v27 = a5;
  v7 = a4;
  objc_msgSend(v27, "addSubview:", v7);
  objc_msgSend(v27, "bounds");
  objc_msgSend(v7, "setFrame:");

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  appearanceTransition = self->_appearanceTransition;
  objc_msgSend(WeakRetained, "setExpanded:", self->_appearanceTransition);
  objc_msgSend(WeakRetained, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "willTransitionToExpandedContentMode:", appearanceTransition);
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "contentModuleWillTransitionToExpandedContentMode:", appearanceTransition);
  sendExpandModuleTransitionNotificationForSubviews(v11, appearanceTransition);
  -[CCUIContentModuleContainerTransition contentRestOverrideFrame](self, "contentRestOverrideFrame");
  if (CGRectIsEmpty(v28))
  {
    v12 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v12, "_contentFrameForRestState");
    v14 = v13;
    v16 = v15;

  }
  else
  {
    -[CCUIContentModuleContainerTransition contentRestOverrideFrame](self, "contentRestOverrideFrame");
    v14 = v17;
    v16 = v18;
  }
  if (appearanceTransition)
  {
    objc_msgSend(WeakRetained, "_contentBoundsForExpandedState");
    v20 = v19;
    v22 = v21;
    objc_msgSend(WeakRetained, "transitionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v23, v20, v22);

    -[CCUIContentModuleContainerTransition _removeMatchMoveAnimationFromTargetView:](self, "_removeMatchMoveAnimationFromTargetView:", v27);
  }
  else
  {
    objc_msgSend(WeakRetained, "transitionCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v24, v14, v16);

    v25 = v27;
    objc_msgSend(WeakRetained, "_contentSourceView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIContentModuleContainerTransition _setupMatchMoveAnimationWithSourceView:targetView:](self, "_setupMatchMoveAnimationWithSourceView:targetView:", v26, v25);

  }
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  CCUIContentModuleContainerViewController **p_viewController;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 appearanceTransition;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint8_t buf[16];
  CGRect v36;

  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContainerTransition contentRestOverrideFrame](self, "contentRestOverrideFrame");
  if (CGRectIsEmpty(v36))
  {
    v10 = objc_loadWeakRetained((id *)p_viewController);
    objc_msgSend(v10, "_contentFrameForRestState");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    -[CCUIContentModuleContainerTransition contentRestOverrideFrame](self, "contentRestOverrideFrame");
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }
  appearanceTransition = self->_appearanceTransition;
  v24 = *MEMORY[0x1E0D146A8];
  v25 = os_signpost_enabled((os_log_t)*MEMORY[0x1E0D146A8]);
  if (appearanceTransition)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_PRESENTATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
    }
    kdebug_trace();
    if (gSignpostListener)
      objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 5);
    objc_msgSend(WeakRetained, "contentModule");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentModuleContainerViewController:willOpenExpandedModule:", WeakRetained, v26);

    v27 = (void *)MEMORY[0x1E0DC3F10];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __87__CCUIContentModuleContainerTransition_performTransitionFromView_toView_containerView___block_invoke;
    v29[3] = &unk_1E8CFD290;
    v30 = v9;
    v31 = v12;
    v32 = v14;
    v33 = v16;
    v34 = v18;
    objc_msgSend(v27, "performWithoutAnimation:", v29);
    objc_msgSend(WeakRetained, "transitionToExpandedMode:", 1);

  }
  else
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
    }
    kdebug_trace();
    if (gSignpostListener)
      objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 7);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    objc_msgSend(WeakRetained, "contentModule");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentModuleContainerViewController:willCloseExpandedModule:", WeakRetained, v28);

    objc_msgSend(v9, "setFrame:", v12, v14, v16, v18);
    objc_msgSend(WeakRetained, "transitionToExpandedMode:", 0);
  }

}

uint64_t __87__CCUIContentModuleContainerTransition_performTransitionFromView_toView_containerView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)transitionDidEnd:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "contentModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_didEndTransitionWithContentModuleContainerTransition:completed:", self, 1);
    objc_msgSend(WeakRetained, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "didTransitionToExpandedContentMode:", self->_appearanceTransition);
    objc_msgSend(WeakRetained, "backgroundViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endAppearanceTransition");

    if (self->_appearanceTransition)
    {
      objc_msgSend(WeakRetained, "_setDidExpandModulePreference");
      objc_msgSend(v6, "contentModuleContainerViewController:didOpenExpandedModule:", WeakRetained, v5);
      v9 = *MEMORY[0x1E0D146A8];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0D146A8]))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_PRESENTATION_END", " enableTelemetry=YES ", buf, 2u);
      }
      kdebug_trace();
      if (gSignpostListener)
        objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 6);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__CCUIContentModuleContainerTransition_transitionDidEnd___block_invoke;
      v13[3] = &unk_1E8CFC3D0;
      v11 = WeakRetained;
      v14 = v11;
      objc_msgSend(v10, "performWithoutAnimation:", v13);
      objc_msgSend(v6, "contentModuleContainerViewController:didCloseExpandedModule:", v11, v5);
      objc_msgSend(v6, "contentModuleContainerViewController:didFinishInteractionWithModule:", v11, v5);
      v12 = *MEMORY[0x1E0D146A8];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0D146A8]))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CFB7D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DISMISSAL_END", " enableTelemetry=YES ", buf, 2u);
      }
      kdebug_trace();
      if (gSignpostListener)
        objc_msgSend((id)gSignpostListener, "didReceiveSignpost:", 8);

    }
  }
}

void __57__CCUIContentModuleContainerTransition_transitionDidEnd___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contentFrameForRestState");
  v3 = v2;
  v5 = v4;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v6, v7, v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v6, v7, v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "contentContainerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v6, v7, v3, v5);

}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CD27C0];
    v6 = a4;
    v7 = a3;
    objc_msgSend(v5, "animation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceLayer:", v9);

    objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v8, "setRemovedOnCompletion:", 0);
    objc_msgSend(v8, "setDuration:", INFINITY);
    objc_msgSend(v8, "setAppliesY:", 1);
    objc_msgSend(v8, "setAppliesX:", 1);
    objc_msgSend(v6, "bounds");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "convertRect:toView:", v6);
    v15 = v14;
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourcePoints:", v19);

    objc_msgSend(v6, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addAnimation:forKey:", v8, CFSTR("CCUIContentModuleContainerMatchMoveAnimationKey"));
  }
}

- (void)_removeMatchMoveAnimationFromTargetView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("CCUIContentModuleContainerMatchMoveAnimationKey"));

}

- (CCUIContentModuleContainerViewController)viewController
{
  return (CCUIContentModuleContainerViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (BOOL)isAppearanceTransition
{
  return self->_appearanceTransition;
}

- (void)setAppearanceTransition:(BOOL)a3
{
  self->_appearanceTransition = a3;
}

- (CGRect)contentRestOverrideFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRestOverrideFrame.origin.x;
  y = self->_contentRestOverrideFrame.origin.y;
  width = self->_contentRestOverrideFrame.size.width;
  height = self->_contentRestOverrideFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentRestOverrideFrame:(CGRect)a3
{
  self->_contentRestOverrideFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
