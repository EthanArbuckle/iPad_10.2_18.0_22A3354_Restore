@implementation CFXEffectEditorView

- (CFXEffectEditorView)initWithMode:(unint64_t)a3 delegate:(id)a4
{
  id v7;
  CFXEffectEditorView *v8;
  CFXEffectEditorView *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *effectRenderingQueue;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CFXEffectEditorView;
  v8 = -[CFXEffectEditorView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    v9->_mode = a3;
    -[CFXEffectEditorView setBackgroundColor:](v9, "setBackgroundColor:", 0);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    -[CFXEffectEditorView setDisplayScale:](v9, "setDisplayScale:");

    v11 = MEMORY[0x24BDBD8B8];
    v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v9->_editTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v9->_editTransform.c = v12;
    *(_OWORD *)&v9->_editTransform.tx = *(_OWORD *)(v11 + 32);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("CFXEffectEditorView.effectUpdateQueue", v13);
    effectRenderingQueue = v9->_effectRenderingQueue;
    v9->_effectRenderingQueue = (OS_dispatch_queue *)v14;

    -[CFXEffectEditorView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    v9->_appliedEditingGestures = 0;
    v9->_lastTouchLocationInView = (CGPoint)kInvalidTouchLocation;
    v9->_lastSpacingBetweenTouchAndCenterOfEffect = (CGPoint)kInvalidTouchLocation;
    v9->_displayLinkBusyOnRenderQueue = 0;
    v9->_isRenderingEditEffect = 0;
    v9->_isRenderPendingForEditEffect = 0;
    -[CFXEffectEditorView CFX_setupGestures](v9, "CFX_setupGestures");
    -[CFXEffectEditorView CFX_setupControls](v9, "CFX_setupControls");
    if (a3 == 1)
      -[CFXEffectEditorView CFX_setUserInteractionEnabledIfPossible:](v9, "CFX_setUserInteractionEnabledIfPossible:", 0);
    if (isDrawEffectsEditorBoundsEnabled())
    {
      -[CFXEffectEditorView layer](v9, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderWidth:", 2.0);

      objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "CGColor");
      -[CFXEffectEditorView layer](v9, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBorderColor:", v18);

    }
    -[CFXEffectEditorView startUpdatingDebugOverlayView](v9, "startUpdatingDebugOverlayView");
    -[CFXEffectEditorView initializeAvailabilityOfFrequentCalledDelegateMethods](v9, "initializeAvailabilityOfFrequentCalledDelegateMethods");

  }
  return v9;
}

- (void)initializeAvailabilityOfFrequentCalledDelegateMethods
{
  void *v3;
  void *v4;
  id v5;

  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_delegateSupportsDidMoveEffect = objc_opt_respondsToSelector() & 1;

  -[CFXEffectEditorView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_delegateSupportsCalculatingAnimatedFaceTrackingTransform = objc_opt_respondsToSelector() & 1;

  -[CFXEffectEditorView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_delegateSupportsApplyAnimationTransformsToEffect = objc_opt_respondsToSelector() & 1;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CFXEffectEditorView stopUpdatingDebugOverlayView](self, "stopUpdatingDebugOverlayView");
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectEditorView;
  -[CFXEffectEditorView dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXEffectEditorView;
  -[CFXEffectEditorView layoutSubviews](&v3, sel_layoutSubviews);
  -[CFXEffectEditorView CFX_effectPreviewBoundsDidChange](self, "CFX_effectPreviewBoundsDidChange");
}

- (void)CFX_effectPreviewBoundsDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXEffectEditorView CFX_updateEditControlsLayout](self, "CFX_updateEditControlsLayout");
  -[CFXEffectEditorView CFX_updateTextEditFieldLayout](self, "CFX_updateTextEditFieldLayout");
  -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CFXEffectEditorView_CFX_effectPreviewBoundsDidChange__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __55__CFXEffectEditorView_CFX_effectPreviewBoundsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (void)CFX_setupGestures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_didTap_);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  -[CFXEffectEditorView addGestureRecognizer:](self, "addGestureRecognizer:", v6);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C60]), "initWithTarget:action:", self, sel_didPinch_);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setScale:", 1.0);
  -[CFXEffectEditorView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D18]), "initWithTarget:action:", self, sel_didRotate_);
  objc_msgSend(v4, "setDelegate:", self);
  -[CFXEffectEditorView addGestureRecognizer:](self, "addGestureRecognizer:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_didPan_);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setMinimumNumberOfTouches:", 1);
  -[CFXEffectEditorView addGestureRecognizer:](self, "addGestureRecognizer:", v5);

}

- (void)didTap:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  v4 = objc_msgSend(v25, "state") == 3;
  v5 = v25;
  if (v4)
  {
    objc_msgSend(v25, "locationInView:", self);
    v7 = v6;
    v9 = v8;
    -[CFXEffectEditorView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectEditorView:effectAtPoint:", self, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_4;
    if (!-[CFXEffectEditorView CFX_isPreviewingEditEffect](self, "CFX_isPreviewingEditEffect"))
      goto LABEL_9;
    -[CFXEffectEditorView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "effectEditorView:isEffectAtPoint:effect:", self, v16, v7, v9);

    if (!v17)
      goto LABEL_9;
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_4:
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "jtEffect");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {
        -[CFXEffectEditorView beginTextEditing](self, "beginTextEditing");
      }
      else
      {
        -[CFXEffectEditorView CFX_endEditingEffect](self, "CFX_endEditingEffect");
        -[CFXEffectEditorView CFX_beginEditingEffect:isAnimating:](self, "CFX_beginEditingEffect:isAnimating:", v11, 0);
        -[CFXEffectEditorView CFX_beginTextEditing](self, "CFX_beginTextEditing");
      }
    }
    else
    {
LABEL_9:
      -[CFXEffectEditorView delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
      {
        -[CFXEffectEditorView endEditingAnimated:withCompletionBlock:](self, "endEditingAnimated:withCompletionBlock:", 1, 0);
        goto LABEL_13;
      }
      -[CFXEffectEditorView convertPoint:toView:](self, "convertPoint:toView:", 0, v7, v9);
      v22 = v21;
      v24 = v23;
      -[CFXEffectEditorView endEditingAnimated:withCompletionBlock:](self, "endEditingAnimated:withCompletionBlock:", 1, 0);
      -[CFXEffectEditorView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "effectEditorView:didEndEditingByTappingOutSideEffectAtScreenPoint:", self, v22, v24);
    }

LABEL_13:
    v5 = v25;
  }

}

- (void)setAppliedEditingGestures:(unint64_t)a3
{
  void *v5;
  unint64_t appliedEditingGestures;
  BOOL v7;
  uint64_t v8;
  id v9;

  if (self->_appliedEditingGestures != a3)
  {
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffect");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    appliedEditingGestures = self->_appliedEditingGestures;
    if (a3)
      v7 = appliedEditingGestures == 0;
    else
      v7 = 0;
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v9, "beginInteractiveEditing");
    }
    else
    {
      if (a3 || !appliedEditingGestures)
        goto LABEL_15;
      objc_msgSend(v9, "endInteractiveEditing");
    }
    objc_msgSend(MEMORY[0x24BE79010], "setInteractiveMode:", v8);
LABEL_15:
    self->_appliedEditingGestures = a3;

  }
}

- (void)handlePinchGesture:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  if (!-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    if (objc_msgSend(v6, "state") == 1)
    {
      -[CFXEffectEditorView CFX_hideEditControls](self, "CFX_hideEditControls");
      v4 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") | 2;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
    }
    objc_msgSend(v6, "scale");
    -[CFXEffectEditorView CFX_scaleEffect:](self, "CFX_scaleEffect:");
    objc_msgSend(v6, "setScale:", 1.0);
    if (objc_msgSend(v6, "state") == 3 || objc_msgSend(v6, "state") == 4)
    {
      v5 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") & 0xFFFFFFFFFFFFFFFDLL;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView CFX_showEditControls](self, "CFX_showEditControls");
    }
  }

}

- (void)handleRotateGesture:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  if (!-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    if (objc_msgSend(v6, "state") == 1)
    {
      -[CFXEffectEditorView CFX_hideEditControls](self, "CFX_hideEditControls");
      v4 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") | 4;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
    }
    objc_msgSend(v6, "rotation");
    -[CFXEffectEditorView CFX_rotateEffect:](self, "CFX_rotateEffect:");
    objc_msgSend(v6, "setRotation:", 0.0);
    if (objc_msgSend(v6, "state") == 3 || objc_msgSend(v6, "state") == 4)
    {
      v5 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") & 0xFFFFFFFFFFFFFFFBLL;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView CFX_showEditControls](self, "CFX_showEditControls");
    }
  }

}

- (void)handlePanGesture:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    if (objc_msgSend(v7, "state") == 1)
    {
      -[CFXEffectEditorView CFX_hideEditControls](self, "CFX_hideEditControls");
      v4 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") | 1;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v4);
    }
    if (objc_msgSend(v7, "state") == 3 || objc_msgSend(v7, "state") == 4)
    {
      v5 = -[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures") & 0xFFFFFFFFFFFFFFFELL;
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", v5);
      -[CFXEffectEditorView CFX_showEditControls](self, "CFX_showEditControls");
    }
    -[CFXEffectEditorView CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:](self, "CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:", v7);
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslation:inView:", v6, 0.0, 0.0);

  }
}

- (void)CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v29 = a3;
  v4 = objc_msgSend(v29, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    if (!-[CFXEffectEditorView appliedEditingGestures](self, "appliedEditingGestures"))
    {
      -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:", 1.79769313e308, 1.79769313e308);
      -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:", 1.79769313e308, 1.79769313e308);
      goto LABEL_7;
    }
  }
  else
  {
    if (v4 == 2)
    {
      objc_msgSend(v29, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "translationInView:", v21);
      v23 = v22;
      v25 = v24;

      -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView");
      v27 = v23 + v26;
      -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView");
      -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:", v27, v25 + v28);
      goto LABEL_9;
    }
    if (v4 == 1)
    {
      objc_msgSend(v29, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "locationInView:", v5);
      v7 = v6;
      v9 = v8;
      objc_msgSend(v29, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
      -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:");

      -[CFXEffectEditorView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView lastTouchLocation](self, "lastTouchLocation");
      v14 = v13;
      v16 = v15;
      -[CFXEffectEditorView renderBounds](self, "renderBounds");
      objc_msgSend(v11, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v12, v14, v16, v17, v18, v19, v20);
      -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:");

LABEL_7:
      -[CFXEffectEditorView CFX_updateExternalEffectTrackingRunningState](self, "CFX_updateExternalEffectTrackingRunningState");
    }
  }
LABEL_9:

}

- (void)CFX_setUserInteractionEnabledIfPossible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;

  v3 = a3;
  v5 = -[CFXEffectEditorView mode](self, "mode") != 1 && v3;
  -[CFXEffectEditorView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
  }
  v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (BOOL)isEditing
{
  void *v2;
  BOOL v3;

  -[CFXEffectEditorView editEffect](self, "editEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)beginEditingEffect:(id)a3
{
  -[CFXEffectEditorView beginEditingEffect:animated:withCompletionBlock:](self, "beginEditingEffect:animated:withCompletionBlock:", a3, 0, 0);
}

- (void)beginEditingEffect:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  int v6;
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[5];
  BOOL v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = -[CFXEffectEditorView isEditing](self, "isEditing");
  if (v9)
    -[CFXEffectEditorView CFX_addBeginEditingCompletionBlock:](self, "CFX_addBeginEditingCompletionBlock:", v9);
  if (!-[CFXEffectEditorView isBeginningEditing](self, "isBeginningEditing"))
  {
    -[CFXEffectEditorView setIsBeginningEditing:](self, "setIsBeginningEditing:", 1);
    v11 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke;
    v25[3] = &unk_24EE57C98;
    v26 = v10;
    v25[4] = self;
    v12 = (void (**)(_QWORD))MEMORY[0x2276A1F6C](v25);
    -[CFXEffectEditorView CFX_setUserInteractionEnabledIfPossible:](self, "CFX_setUserInteractionEnabledIfPossible:", 0);
    -[CFXEffectEditorView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "effectEditorView:shouldDisableEditingAnimationForEffect:", self, v8);

      v6 &= ~v16;
    }
    if (-[CFXEffectEditorView mode](self, "mode") == 2 && v6)
    {
      objc_msgSend(v8, "jtEffect");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 1);
      -[CFXEffectEditorView CFX_beginEditingEffect:isAnimating:](self, "CFX_beginEditingEffect:isAnimating:", v8, 1);
      v23[0] = v11;
      v23[1] = 3221225472;
      v23[2] = __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke_2;
      v23[3] = &unk_24EE580C8;
      v24 = v12;
      -[CFXEffectEditorView CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:](self, "CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:", v23);

    }
    else
    {
      -[CFXEffectEditorView CFX_beginEditingEffect:isAnimating:](self, "CFX_beginEditingEffect:isAnimating:", v8, 0);
      if (-[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle"))
      {
        objc_msgSend(v8, "jtEffect");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "type");

        if (v19 == 2)
        {
          objc_msgSend(v8, "jtEffect");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "trackingProps");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "userFeedbackForTrackingType:needsHaptics:", objc_msgSend(v22, "trackingType"), 1);

        }
      }
      v12[2](v12);
    }

  }
}

uint64_t __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectEditorViewDidBeginEditing:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsBeginningEditing:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "beginEditingCompletionBlocks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))();
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setBeginEditingCompletionBlocks:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setUserInteractionEnabledIfPossible:", 1);
}

uint64_t __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endEditingAnimated:(BOOL)a3 withCompletionBlock:(id)a4
{
  int v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  char v19;
  id location;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[CFXEffectEditorView isEditing](self, "isEditing"))
  {
    if (v6)
      -[CFXEffectEditorView CFX_addEndEditingCompletionBlock:](self, "CFX_addEndEditingCompletionBlock:", v6);
    if (!-[CFXEffectEditorView isEndingEditing](self, "isEndingEditing"))
    {
      if (-[CFXEffectEditorView isBeginningEditing](self, "isBeginningEditing"))
      {
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke;
        v17[3] = &unk_24EE5AFB8;
        objc_copyWeak(&v18, &location);
        v19 = v4;
        -[CFXEffectEditorView CFX_addBeginEditingCompletionBlock:](self, "CFX_addBeginEditingCompletionBlock:", v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        -[CFXEffectEditorView setIsEndingEditing:](self, "setIsEndingEditing:", 1);
        -[CFXEffectEditorView removeButton](self, "removeButton");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHidden:", 1);

        -[CFXEffectEditorView CFX_setUserInteractionEnabledIfPossible:](self, "CFX_setUserInteractionEnabledIfPossible:", 0);
        -[CFXEffectEditorView delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          -[CFXEffectEditorView delegate](self, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView editEffect](self, "editEffect");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "effectEditorView:shouldDisableEditingAnimationForEffect:", self, v11);

          v4 &= ~v12;
        }
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke_2;
        v16[3] = &unk_24EE57B60;
        v16[4] = self;
        v13 = (void (**)(_QWORD))MEMORY[0x2276A1F6C](v16);
        if (-[CFXEffectEditorView mode](self, "mode") == 2 && v4)
        {
          -[CFXEffectEditorView CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:](self, "CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:", v13);
        }
        else if ((-[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle") & v4) == 1
               && (-[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle"),
                   v14 = (void *)objc_claimAutoreleasedReturnValue(),
                   v14,
                   v14))
        {
          -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fadeOutAndEndHapticWithCompletionBlock:", v13);

        }
        else
        {
          v13[2](v13);
        }

      }
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

void __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endEditingAnimated:withCompletionBlock:", *(unsigned __int8 *)(a1 + 40), 0);

}

uint64_t __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "CFX_endEditingEffect");
  objc_msgSend(*(id *)(a1 + 32), "setEditEffect:", 0);
  objc_msgSend(*(id *)(a1 + 32), "CFX_hideEditControls");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectEditorViewDidEndEditing:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "CFX_stopTrackingExternalEffectChanges");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "endEditingCompletionBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "setEndEditingCompletionBlocks:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsEndingEditing:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setUserInteractionEnabledIfPossible:", 1);
}

- (void)notifyEffectTrackingDidChangeToType:(int64_t)a3
{
  id v5;

  if (-[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle"))
  {
    -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userFeedbackForTrackingType:needsHaptics:", a3, 1);

  }
}

- (void)CFX_beginEditingEffect:(id)a3 isAnimating:(BOOL)a4
{
  id v6;
  __int128 v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _OWORD v14[3];

  v6 = a3;
  -[CFXEffectEditorView setEffectWasEdited:](self, "setEffectWasEdited:", 0);
  -[CFXEffectEditorView setEditEffect:](self, "setEditEffect:", v6);
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v14[0] = *MEMORY[0x24BDBD8B8];
  v14[1] = v7;
  v14[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[CFXEffectEditorView setEditTransform:](self, "setEditTransform:", v14);
  objc_msgSend(v6, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "jtEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginInteractiveEditing");

  }
  if (!a4)
    -[CFXEffectEditorView CFX_showEditControls](self, "CFX_showEditControls");
  -[CFXEffectEditorView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effectEditorView:didBeginEditingEffect:", self, v6);

  }
  -[CFXEffectEditorView CFX_beginPreviewingEditEffect](self, "CFX_beginPreviewingEditEffect");

}

- (void)CFX_removeEffect
{
  void *v3;
  void *v4;

  -[CFXEffectEditorView CFX_endPreviewingEditEffect](self, "CFX_endPreviewingEditEffect");
  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView editEffect](self, "editEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectEditorView:didRemoveEffect:", self, v4);

  -[CFXEffectEditorView endEditingAnimated:withCompletionBlock:](self, "endEditingAnimated:withCompletionBlock:", 1, 0);
}

- (void)CFX_endEditingEffect
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  -[CFXEffectEditorView CFX_endTextEditing:](self, "CFX_endTextEditing:", 0);
  -[CFXEffectEditorView CFX_hideEditControls](self, "CFX_hideEditControls");
  -[CFXEffectEditorView CFX_endPreviewingEditEffect](self, "CFX_endPreviewingEditEffect");
  -[CFXEffectEditorView editEffect](self, "editEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jtEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endInteractiveEditing");

  }
  -[CFXEffectEditorView setAppliedEditingGestures:](self, "setAppliedEditingGestures:", 0);
  -[CFXEffectEditorView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectEditorView:didEndEditingEffect:", self, v11);

  }
  -[CFXEffectEditorView setEffectWasEdited:](self, "setEffectWasEdited:", 0);
}

- (void)CFX_addBeginEditingCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CFXEffectEditorView beginEditingCompletionBlocks](self, "beginEditingCompletionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[CFXEffectEditorView setBeginEditingCompletionBlocks:](self, "setBeginEditingCompletionBlocks:", v6);

  }
  -[CFXEffectEditorView beginEditingCompletionBlocks](self, "beginEditingCompletionBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "addObject:", v7);
}

- (void)CFX_addEndEditingCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CFXEffectEditorView endEditingCompletionBlocks](self, "endEditingCompletionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[CFXEffectEditorView setEndEditingCompletionBlocks:](self, "setEndEditingCompletionBlocks:", v6);

  }
  -[CFXEffectEditorView endEditingCompletionBlocks](self, "endEditingCompletionBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "addObject:", v7);
}

- (CGPoint)lastTouchLocation
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView");
  v5 = v4;
  v6 = 1.79769313e308;
  v7 = v5 == 1.79769313e308 && v3 == 1.79769313e308;
  v8 = 1.79769313e308;
  if (!v7)
  {
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "renderSize");
    v11 = v10;
    v13 = v12;

    -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView");
    v15 = v14;
    v17 = v16;
    -[CFXEffectEditorView bounds](self, "bounds");
    v6 = CGPointConvertToCoordinateSpace(2uLL, 0, v15, v17, v18, v19, v11, v13);
  }
  result.y = v8;
  result.x = v6;
  return result;
}

- (void)CFX_scaleEffect:(double)a3
{
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  -[CFXEffectEditorView editTransform](self, "editTransform");
  CGAffineTransformScale(&v7, &v6, a3, a3);
  v5 = v7;
  -[CFXEffectEditorView setEditTransform:](self, "setEditTransform:", &v5);
  -[CFXEffectEditorView CFX_applyEffectTransformChanges](self, "CFX_applyEffectTransformChanges");
}

- (void)CFX_rotateEffect:(double)a3
{
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  -[CFXEffectEditorView editTransform](self, "editTransform");
  CGAffineTransformRotate(&v7, &v6, a3);
  v5 = v7;
  -[CFXEffectEditorView setEditTransform:](self, "setEditTransform:", &v5);
  -[CFXEffectEditorView CFX_applyEffectTransformChanges](self, "CFX_applyEffectTransformChanges");
}

- (BOOL)CFX_updateOverlayForTranslation
{
  void *v3;
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
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView editEffect](self, "editEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView lastTouchLocation](self, "lastTouchLocation");
  v6 = v5;
  v8 = v7;
  -[CFXEffectEditorView renderBounds](self, "renderBounds");
  objc_msgSend(v3, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v4, v6, v8, v9, v10, v11, v12);
  v14 = v13;
  v16 = v15;

  -[CFXEffectEditorView lastSpacingBetweenTouchAndCenterOfEffect](self, "lastSpacingBetweenTouchAndCenterOfEffect");
  v18 = v14 - v17;
  -[CFXEffectEditorView lastSpacingBetweenTouchAndCenterOfEffect](self, "lastSpacingBetweenTouchAndCenterOfEffect");
  v20 = v16 - v19;
  v21 = v20 != *(double *)(MEMORY[0x24BDBEFB0] + 8) || v18 != *MEMORY[0x24BDBEFB0];
  if (v21)
  {
    -[CFXEffectEditorView editTransform](self, "editTransform");
    CGAffineTransformTranslate(&v25, &v24, v18, v20);
    v23 = v25;
    -[CFXEffectEditorView setEditTransform:](self, "setEditTransform:", &v23);
    -[CFXEffectEditorView CFX_applyEffectTransformChanges](self, "CFX_applyEffectTransformChanges");
  }
  return v21;
}

- (BOOL)CFX_updateTrackingTypeForTouchLocation
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[CFXEffectEditorView lastEffectMovedNotifyTime](self, "lastEffectMovedNotifyTime");
  if (v4 - v5 < 0.1)
    return 0;
  -[CFXEffectEditorView setLastEffectMovedNotifyTime:](self, "setLastEffectMovedNotifyTime:", v4);
  -[CFXEffectEditorView editEffect](self, "editEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 2)
  {
    objc_msgSend(v7, "jtEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v9, "trackingProps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "trackingType");

  if (-[CFXEffectEditorView delegateSupportsDidMoveEffect](self, "delegateSupportsDidMoveEffect"))
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView");
    objc_msgSend(v12, "effectEditorView:didMoveEffect:withTouchPoint:", self, v7);

  }
  if (-[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle") && v9)
  {
    -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackingProps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userFeedbackForTrackingType:needsHaptics:", objc_msgSend(v14, "trackingType"), 0);

  }
  objc_msgSend(v9, "trackingProps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "trackingType");

  v17 = v11 == v16;
  v6 = v11 != v16;
  if (!v17)
  {
    -[CFXEffectEditorView lastSpacingBetweenTouchAndCenterOfEffect](self, "lastSpacingBetweenTouchAndCenterOfEffect");
    if (v19 != 1.79769313e308 || v18 != 1.79769313e308)
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView lastTouchLocation](self, "lastTouchLocation");
      v23 = v22;
      v25 = v24;
      -[CFXEffectEditorView renderBounds](self, "renderBounds");
      objc_msgSend(v20, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v21, v23, v25, v26, v27, v28, v29);
      -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:");

    }
  }

  return v6;
}

- (void)CFX_applyEffectTransformChanges
{
  void *v3;
  void *v4;
  NSObject *v5;
  __int128 v6;
  _OWORD v7[3];
  _QWORD block[5];
  _BYTE v9[48];
  CGAffineTransform v10;

  -[CFXEffectEditorView editTransform](self, "editTransform");
  if (!CGAffineTransformIsIdentity(&v10))
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editTransform](self, "editTransform");
    -[CFXEffectEditorView renderBounds](self, "renderBounds");
    objc_msgSend(v3, "effectEditorView:didTransformEffect:transform:relativeToBounds:", self, v4, v9);

    -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__CFXEffectEditorView_CFX_applyEffectTransformChanges__block_invoke;
    block[3] = &unk_24EE57B60;
    block[4] = self;
    dispatch_async(v5, block);

    v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v7[0] = *MEMORY[0x24BDBD8B8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[CFXEffectEditorView setEditTransform:](self, "setEditTransform:", v7);
    -[CFXEffectEditorView setEffectWasEdited:](self, "setEffectWasEdited:", 1);
  }
}

uint64_t __54__CFXEffectEditorView_CFX_applyEffectTransformChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (void)CFX_setupControls
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
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CFXFaceReticleView *v23;
  CFXFaceReticleView *v24;
  id v25;

  if (-[CFXEffectEditorView CFX_isRemoveAvailableInCurrentMode](self, "CFX_isRemoveAvailableInCurrentMode"))
  {
    v3 = (void *)objc_opt_new();
    -[CFXEffectEditorView setRemoveButton:](self, "setRemoveButton:", v3);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_tapRemoveButton_, 64);

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:forState:", v5, 0);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView addSubview:](self, "addSubview:", v7);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeToFit");

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowColor:", v13);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 0.25;
    objc_msgSend(v17, "setShadowOpacity:", v18);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowRadius:", 1.0);

    -[CFXEffectEditorView removeButton](self, "removeButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShadowOffset:", 1.0, 1.0);

  }
  if (-[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle"))
  {
    v23 = [CFXFaceReticleView alloc];
    -[CFXEffectEditorView bounds](self, "bounds");
    v24 = -[CFXFaceReticleView initWithFrame:reticleType:](v23, "initWithFrame:reticleType:", 0);
    -[CFXEffectEditorView setFaceTrackingReticle:](self, "setFaceTrackingReticle:", v24);

    -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView addSubview:](self, "addSubview:", v25);

  }
}

- (void)CFX_hideEditControls
{
  -[CFXEffectEditorView CFX_hideEditControls:](self, "CFX_hideEditControls:", 0);
}

- (void)CFX_forceHideEditControls
{
  -[CFXEffectEditorView CFX_hideEditControls:](self, "CFX_hideEditControls:", 1);
}

- (void)CFX_hideEditControls:(BOOL)a3
{
  void *v4;

  if (a3
    || !-[CFXEffectEditorView CFX_isRemoveAlwaysAvailableInCurrentMode](self, "CFX_isRemoveAlwaysAvailableInCurrentMode"))
  {
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
  -[CFXEffectEditorView CFX_updateExternalEffectTrackingRunningState](self, "CFX_updateExternalEffectTrackingRunningState");
}

- (CGRect)renderBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderSize");
  v4 = v3;
  v6 = v5;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)CFX_updateEditControlsLayout
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  if (-[CFXEffectEditorView CFX_isRemoveAvailableInCurrentMode](self, "CFX_isRemoveAvailableInCurrentMode"))
  {
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHidden");

    if ((v4 & 1) == 0)
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CFXEffectEditorView delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "removeButtonRelativeBoundsIsViewSpace");

        if (!v7)
        {
          -[CFXEffectEditorView delegate](self, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView editEffect](self, "editEffect");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView renderBounds](self, "renderBounds");
          objc_msgSend(v8, "effectEditorView:removeButtonPositionForEffect:relativeToBounds:", self, v9);
          v11 = v10;
          v13 = v12;

          -[CFXEffectEditorView renderBounds](self, "renderBounds");
          v15 = v14;
          v17 = v16;
          -[CFXEffectEditorView bounds](self, "bounds");
          v20 = CGPointConvertToCoordinateSpace(1uLL, 0, v11, v13, v15, v17, v18, v19);
          v22 = v21;
          -[CFXEffectEditorView removeButton](self, "removeButton");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setCenter:", v20, v22);
LABEL_9:

          return;
        }
      }
      else
      {

      }
      -[CFXEffectEditorView delegate](self, "delegate");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView bounds](self, "bounds");
      objc_msgSend(v29, "effectEditorView:removeButtonPositionForEffect:relativeToBounds:", self, v23);
      v25 = v24;
      v27 = v26;
      -[CFXEffectEditorView removeButton](self, "removeButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCenter:", v25, v27);

      goto LABEL_9;
    }
  }
}

- (BOOL)CFX_isRemoveAlwaysAvailableInCurrentMode
{
  return -[CFXEffectEditorView mode](self, "mode") == 2 && -[CFXEffectEditorView isEditing](self, "isEditing");
}

- (BOOL)CFX_isRemoveAvailableInCurrentMode
{
  return -[CFXEffectEditorView mode](self, "mode") != 1;
}

- (void)CFX_showEditControls
{
  void *v3;

  if (-[CFXEffectEditorView CFX_isRemoveAvailableInCurrentMode](self, "CFX_isRemoveAvailableInCurrentMode"))
  {
    -[CFXEffectEditorView removeButton](self, "removeButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    -[CFXEffectEditorView CFX_updateEditControlsLayout](self, "CFX_updateEditControlsLayout");
  }
  -[CFXEffectEditorView CFX_updateExternalEffectTrackingRunningState](self, "CFX_updateExternalEffectTrackingRunningState");
}

- (void)CFX_startTrackingExternalEffectChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_externalEffectTrackingDisplayLinkFired_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView setEditControlsTrackingDisplayLink:](self, "setEditControlsTrackingDisplayLink:", v5);

    -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredFramesPerSecond:", 60);

    -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addToRunLoop:forMode:", v7, *MEMORY[0x24BDBCB80]);

  }
}

- (void)CFX_stopTrackingExternalEffectChanges
{
  void *v3;
  void *v4;

  -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CFXEffectEditorView setEditControlsTrackingDisplayLink:](self, "setEditControlsTrackingDisplayLink:", 0);
  }
}

- (void)CFX_updateExternalEffectTrackingRunningState
{
  double v3;
  double v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;

  if (-[CFXEffectEditorView mode](self, "mode") == 2
    || ((-[CFXEffectEditorView lastTouchLocation](self, "lastTouchLocation"), v4 == 1.79769313e308)
      ? (v5 = v3 == 1.79769313e308)
      : (v5 = 0),
        v5
     && (-[CFXEffectEditorView mode](self, "mode")
      || (-[CFXEffectEditorView removeButton](self, "removeButton"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isHidden"),
          v7,
          (v8 & 1) != 0))))
  {
    v6 = 1;
  }
  else
  {
    -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
      v6 = 0;
    else
      -[CFXEffectEditorView CFX_startTrackingExternalEffectChanges](self, "CFX_startTrackingExternalEffectChanges");
  }
  -[CFXEffectEditorView editControlsTrackingDisplayLink](self, "editControlsTrackingDisplayLink");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPaused:", v6);

}

- (void)externalEffectTrackingDisplayLinkFired:(id)a3
{
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;

  -[CFXEffectEditorView lastTouchLocationInView](self, "lastTouchLocationInView", a3);
  v6 = v5 == 1.79769313e308 && v4 == 1.79769313e308;
  if (!v6
    && -[CFXEffectEditorView CFX_updateOverlayForTranslation](self, "CFX_updateOverlayForTranslation")
    && -[CFXEffectEditorView CFX_updateTrackingTypeForTouchLocation](self, "CFX_updateTrackingTypeForTouchLocation"))
  {
    -[CFXEffectEditorView CFX_updateOverlayForTranslation](self, "CFX_updateOverlayForTranslation");
  }
  -[CFXEffectEditorView CFX_updateEditControlsLayout](self, "CFX_updateEditControlsLayout");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[CFXEffectEditorView lastFaceRectacleUpdateTime](self, "lastFaceRectacleUpdateTime");
  if (v8 - v9 >= 0.0333333333)
  {
    v10 = -[CFXEffectEditorView CFX_useFaceReticle](self, "CFX_useFaceReticle");
    -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    if (v10)
    {
      objc_msgSend(v11, "setHidden:", 0);

      -[CFXEffectEditorView faceTrackingReticle](self, "faceTrackingReticle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView bounds](self, "bounds");
      objc_msgSend(v12, "updateFrameForDisplayRelativeToBounds:");

      -[CFXEffectEditorView setLastFaceRectacleUpdateTime:](self, "setLastFaceRectacleUpdateTime:", v8);
    }
    else
    {
      objc_msgSend(v11, "setHidden:", 1);

    }
  }
}

- (void)CFX_beginTextEditing
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD block[5];

  if (!-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "effectEditorView:shouldEditTextForEffect:", self, v4);

    if (v5)
    {
      -[CFXEffectEditorView CFX_getTextEditingProperties](self, "CFX_getTextEditingProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[CFXEffectEditorView delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0
          || (-[CFXEffectEditorView delegate](self, "delegate"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              -[CFXEffectEditorView editEffect](self, "editEffect"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v9, "effectEditorView:presentCustomTextEditingUI:", self, v10),
              v10,
              v9,
              (v11 & 1) == 0))
        {
          -[CFXEffectEditorView CFX_hideEditControls](self, "CFX_hideEditControls");
          -[CFXEffectEditorView setIsTextEditing:](self, "setIsTextEditing:", 1);
          -[CFXEffectEditorView delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView editEffect](self, "editEffect");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "effectEditorView:textForEffect:", self, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView setOldEditText:](self, "setOldEditText:", v14);

          -[CFXEffectEditorView delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView editEffect](self, "editEffect");
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "effectEditorView:didBeginEditingTextForEffect:", self, v16);

          -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __43__CFXEffectEditorView_CFX_beginTextEditing__block_invoke;
          block[3] = &unk_24EE57B60;
          block[4] = self;
          dispatch_async(v17, block);

          -[CFXEffectEditorView delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_opt_respondsToSelector();

          if ((v16 & 1) != 0)
          {
            -[CFXEffectEditorView delegate](self, "delegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CFXEffectEditorView editEffect](self, "editEffect");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CFXEffectEditorView setMaximumTextLength:](self, "setMaximumTextLength:", objc_msgSend(v19, "effectEditorView:maximumTextLengthForEffect:", self, v20));

          }
          else
          {
            -[CFXEffectEditorView setMaximumTextLength:](self, "setMaximumTextLength:", -1);
          }
          -[CFXEffectEditorView bounds](self, "bounds");
          +[CFXTextEffectEditorView viewWithFrame:textEditingProperties:](CFXTextEffectEditorView, "viewWithFrame:textEditingProperties:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView setTextEditorView:](self, "setTextEditorView:", v21);

          -[CFXEffectEditorView textEditorView](self, "textEditorView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDelegate:", self);

          -[CFXEffectEditorView setTruncateTextToMaximumLength:](self, "setTruncateTextToMaximumLength:", 0);
          objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setApplicationSupportsShakeToEdit:", 0);

          -[CFXEffectEditorView textEditorView](self, "textEditorView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectEditorView addSubview:](self, "addSubview:", v24);

          if (-[CFXEffectEditorView CFX_isRemoveAvailableInCurrentMode](self, "CFX_isRemoveAvailableInCurrentMode"))
          {
            -[CFXEffectEditorView removeButton](self, "removeButton");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[CFXEffectEditorView bringSubviewToFront:](self, "bringSubviewToFront:", v25);

          }
          -[CFXEffectEditorView textEditorView](self, "textEditorView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "applyTextEditingProperties:", v6);

          -[CFXEffectEditorView textEditorView](self, "textEditorView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "selectAll");

        }
      }

    }
  }
}

uint64_t __43__CFXEffectEditorView_CFX_beginTextEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (id)CFX_getTextEditingProperties
{
  void *v3;
  void *v4;
  void *v5;

  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView editEffect](self, "editEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView bounds](self, "bounds");
  objc_msgSend(v3, "effectEditorView:textEditingPropertiesForEffect:relativeToBounds:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)CFX_updateTextEditFieldLayout
{
  void *v3;
  id v4;

  if (-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    -[CFXEffectEditorView CFX_getTextEditingProperties](self, "CFX_getTextEditingProperties");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView textEditorView](self, "textEditorView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyTextEditingProperties:", v4);

  }
}

- (void)CFX_endTextEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (-[CFXEffectEditorView isTextEditing](self, "isTextEditing"))
  {
    if (v3)
    {
      -[CFXEffectEditorView oldEditText](self, "oldEditText");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectEditorView:textForEffect:", self, v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CFXEffectEditorView CFX_updateEffectText:updateTextProperties:](self, "CFX_updateEffectText:updateTextProperties:", v12, 0);
    -[CFXEffectEditorView textEditorView](self, "textEditorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endTextEditing");

    -[CFXEffectEditorView textEditorView](self, "textEditorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[CFXEffectEditorView setTextEditorView:](self, "setTextEditorView:", 0);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setApplicationSupportsShakeToEdit:", 1);

    -[CFXEffectEditorView setIsTextEditing:](self, "setIsTextEditing:", 0);
    -[CFXEffectEditorView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectEditorView:didEndEditingTextForEffect:wasCancelled:", self, v11, v3);

    -[CFXEffectEditorView CFX_showEditControls](self, "CFX_showEditControls");
  }
}

- (void)CFX_updateEffectText:(id)a3 updateTextProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if ((CFX_updateEffectText_updateTextProperties__applyingEffectAttributes & 1) == 0)
  {
    CFX_updateEffectText_updateTextProperties__applyingEffectAttributes = 1;
    if (-[CFXEffectEditorView truncateTextToMaximumLength](self, "truncateTextToMaximumLength"))
    {
      objc_msgSend(v6, "substringWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v6, "length"), (double)-[CFXEffectEditorView maximumTextLength](self, "maximumTextLength")));
      v7 = objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView setTruncateTextToMaximumLength:](self, "setTruncateTextToMaximumLength:", 0);
      v6 = (id)v7;
    }
    -[CFXEffectEditorView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectEditorView:didEditTextForEffect:newText:", self, v9, v6);

    if (v4)
    {
      -[CFXEffectEditorView CFX_getTextEditingProperties](self, "CFX_getTextEditingProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView textEditorView](self, "textEditorView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applyTextEditingProperties:", v10);

    }
    -[CFXEffectEditorView CFX_updateEditControlsLayout](self, "CFX_updateEditControlsLayout");
    -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CFXEffectEditorView_CFX_updateEffectText_updateTextProperties___block_invoke;
    block[3] = &unk_24EE57B60;
    block[4] = self;
    dispatch_async(v12, block);

    CFX_updateEffectText_updateTextProperties__applyingEffectAttributes = 0;
  }

}

uint64_t __65__CFXEffectEditorView_CFX_updateEffectText_updateTextProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (CGRect)CFX_textEditingFrame
{
  void *v3;
  double v4;
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
  CGRect result;

  -[CFXEffectEditorView textEditorView](self, "textEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textEditingFrameRelativeToView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)textEffectEditorView:(id)a3 textChanged:(id)a4 shouldUpdateTextEditingProperties:(BOOL)a5
{
  -[CFXEffectEditorView CFX_updateEffectText:updateTextProperties:](self, "CFX_updateEffectText:updateTextProperties:", a4, a5);
}

- (BOOL)textEffectEditorView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  length = a4.length;
  v8 = a3;
  v9 = a5;
  if (-[CFXEffectEditorView maximumTextLength](self, "maximumTextLength") != -1)
  {
    objc_msgSend(v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12 = v11 - length + objc_msgSend(v9, "length");
    if (v12 > -[CFXEffectEditorView maximumTextLength](self, "maximumTextLength"))
      -[CFXEffectEditorView setTruncateTextToMaximumLength:](self, "setTruncateTextToMaximumLength:", 1);

  }
  return 1;
}

- (JFXEffectsPreviewGenerator)previewGenerator
{
  JFXEffectsPreviewGenerator *previewGenerator;
  JFXEffectsPreviewGenerator *v4;
  JFXEffectsPreviewGenerator *v5;

  previewGenerator = self->_previewGenerator;
  if (!previewGenerator)
  {
    v4 = objc_alloc_init(JFXEffectsPreviewGenerator);
    v5 = self->_previewGenerator;
    self->_previewGenerator = v4;

    -[JFXEffectsPreviewGenerator trackStats:](self->_previewGenerator, "trackStats:", 0);
    -[JFXEffectsPreviewGenerator setName:](self->_previewGenerator, "setName:", CFSTR("EffectEditorPreview"));
    previewGenerator = self->_previewGenerator;
  }
  return previewGenerator;
}

- (void)CFX_beginPreviewingEditEffect
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  JFXImageView *v7;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD block[5];

  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectEditorViewShouldPreviewEditEffect:", self);

    if (v6)
    {
      v7 = objc_alloc_init(JFXImageView);
      -[CFXEffectEditorView setEditEffectPreview:](self, "setEditEffectPreview:", v7);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);

      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContentMode:", 2);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPreferIOSurfaceForYUV:", 1);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreferMetalKit:", 1);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView addSubview:](self, "addSubview:", v14);

      if (-[CFXEffectEditorView CFX_isRemoveAvailableInCurrentMode](self, "CFX_isRemoveAvailableInCurrentMode"))
      {
        -[CFXEffectEditorView removeButton](self, "removeButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXEffectEditorView bringSubviewToFront:](self, "bringSubviewToFront:", v15);

      }
      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leftAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView leftAnchor](self, "leftAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActive:", 1);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView rightAnchor](self, "rightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView topAnchor](self, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bottomAnchor");
      v30 = objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView bottomAnchor](self, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      -[CFXEffectEditorView delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = objc_opt_respondsToSelector();

      if ((v30 & 1) != 0)
      {
        -[CFXEffectEditorView delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "effectEditorViewWillBeginPreviewingEditEffect:", self);

      }
      -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
      v35 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__CFXEffectEditorView_CFX_beginPreviewingEditEffect__block_invoke;
      block[3] = &unk_24EE57B60;
      block[4] = self;
      dispatch_async(v35, block);

    }
  }
}

uint64_t __52__CFXEffectEditorView_CFX_beginPreviewingEditEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (BOOL)CFX_isPreviewingEditEffect
{
  void *v2;
  BOOL v3;

  -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)CFX_previewEditEffectIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "effect editor preview render dropped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  JTImage *v8;
  JTImage *v9;
  _QWORD block[4];
  JTImage *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 417) = 0;
  objc_msgSend(WeakRetained, "editEffectPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      objc_msgSend(v3, "objectEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v8 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
    kdebug_trace();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2;
    block[3] = &unk_24EE585C0;
    v11 = v8;
    v12 = WeakRetained;
    v13 = *(_QWORD *)(a1 + 32);
    v9 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;

  kdebug_trace();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "editEffectPreview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setJtImage:", v2);

  }
  CFXLog_DebugEffectEditorRenderer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_2();

  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 418))
  {
    CFXLog_DebugEffectEditorRenderer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "CFX_previewEditEffectIfNeeded");
  }
}

- (void)CFX_endPreviewingEditEffect
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  if (-[CFXEffectEditorView CFX_isPreviewingEditEffect](self, "CFX_isPreviewingEditEffect"))
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectEditorViewDidEndPreviewingEditingEffect:", self);

    }
    self->_isRenderingEditEffect = 0;
    -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[CFXEffectEditorView setEditEffectPreview:](self, "setEditEffectPreview:", 0);
  }
}

- (BOOL)CFX_useFaceReticle
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CFXEffectEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CFXEffectEditorView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectEditorViewShouldShowFaceReticle:", self);

  return v6;
}

- (id)CFX_springForTextEditAnimation
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDamping:", 40.0);
  objc_msgSend(v2, "setStiffness:", 400.0);
  objc_msgSend(v2, "setMass:", 1.0);
  objc_msgSend(v2, "setStiffness:", 400.0);
  objc_msgSend(v2, "setDamping:", 40.0);
  objc_msgSend(v2, "setInitialVelocity:", 0.0);
  objc_msgSend(v2, "settlingDuration");
  objc_msgSend(v2, "setDuration:");
  return v2;
}

- (void)CFX_startApplyingEffectAnimationViewDisplayLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_CFX_effectAnimationDisplayLinkFired_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectEditorView setEffectAnimationDisplayLink:](self, "setEffectAnimationDisplayLink:", v4);

  -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredFramesPerSecond:", 60);

  -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

}

- (void)CFX_stopApplyingEffectAnimationViewDisplayLink
{
  void *v3;
  void *v4;

  -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectEditorView effectAnimationDisplayLink](self, "effectAnimationDisplayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CFXEffectEditorView setEffectAnimationDisplayLink:](self, "setEffectAnimationDisplayLink:", 0);
  }
}

- (void)CFX_effectAnimationDisplayLinkFired:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  if (self->_isRenderingEditEffect)
  {
    kdebug_trace();
    CFXLog_DebugEffectEditorRenderer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CFXEffectEditorView CFX_effectAnimationDisplayLinkFired:].cold.1();

  }
  else if (self->_displayLinkBusyOnRenderQueue)
  {
    CFXLog_DebugEffectEditorRenderer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CFXEffectEditorView CFX_effectAnimationDisplayLinkFired:].cold.1();

    kdebug_trace();
  }
  else
  {
    kdebug_trace();
    -[CFXEffectEditorView CFX_applyEffectAnimationView:](self, "CFX_applyEffectAnimationView:", -[CFXEffectEditorView isEndingEditing](self, "isEndingEditing"));
  }

}

- (void)CFX_applyEffectAnimationView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _QWORD block[5];
  id v28;

  v3 = a3;
  -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEffectTransforms");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "effectEditorView:isFaceTrackingEffect:", self, v8);

    if (v9)
    {
      if (-[CFXEffectEditorView delegateSupportsCalculatingAnimatedFaceTrackingTransform](self, "delegateSupportsCalculatingAnimatedFaceTrackingTransform"))
      {
        -[CFXEffectEditorView delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fromEffectFrame");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "trackingType");
        objc_msgSend(v6, "faceTrackingTransform");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "toEffectFrame");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "trackingType");
        -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fractionComplete");
        *(float *)&v18 = v18;
        objc_msgSend(v10, "effectEditorView:calculateAnimatedFaceTrackingTransformWithCurrentFaceTrackingDataFromTrackingType:interpolatedWithFaceTrackingTransform:toTrackingType:atAnimationProgress:", self, v12, v13, v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[CFXEffectEditorView editEffectPreview](self, "editEffectPreview");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (!v19)
        {
          objc_msgSend(v20, "setHidden:", 1);

          goto LABEL_7;
        }
        objc_msgSend(v20, "setHidden:", 0);

        objc_msgSend(v6, "transform");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "transformAnimation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[JFXOverlayEffectTransforms transformsWithTransform:transformAnimation:faceTrackingTransform:](JFXOverlayEffectTransforms, "transformsWithTransform:transformAnimation:faceTrackingTransform:", v22, v23, v19);
        v24 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v24;
      }
    }
  }
  -[CFXEffectEditorView effectRenderingQueue](self, "effectRenderingQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CFXEffectEditorView_CFX_applyEffectAnimationView___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v6 = v6;
  v28 = v6;
  dispatch_async(v25, block);

LABEL_7:
}

uint64_t __52__CFXEffectEditorView_CFX_applyEffectAnimationView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 1;
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "editEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectEditorView:applyAnimationTransformsToEffect:transforms:", v3, v4, *(_QWORD *)(a1 + 40));

  kdebug_trace();
  result = objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 0;
  return result;
}

- (void)CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  JFXOverlayEffectAnimationView *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  void (**v53)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_13;
    -[CFXEffectEditorView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectEditorView:durationForBeginEditingAnimationForEffect:", self, v9);
    v11 = v10;

    if (v11 <= 0.0)
      goto LABEL_13;
    -[CFXEffectEditorView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      goto LABEL_13;
    if ((v19 & 1) != 0 && (v15 & 1) != 0 && (v17 & 1) != 0 && (v21 & 1) != 0)
    {
      -[CFXEffectEditorView delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "effectEditorView:willBeginAnimationBeforeEditingEffect:", self, v23);

      -[CFXEffectEditorView editEffect](self, "editEffect");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "jtEffect");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "renderEffect");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "outputSize");
      v28 = v27;
      v30 = v29;

      -[CFXEffectEditorView delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "effectEditorView:beginEditingAnimationFromFrameForEffect:relativeToBounds:", self, v32, 0.0, 0.0, v28, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "effectEditorView:beginEditingAnimationToFrameForEffect:relativeToBounds:", self, v35, 0.0, 0.0, v28, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView editEffect](self, "editEffect");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "jtEffect");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "effectEditorView:isFaceTrackingEffect:", self, v40);

      -[CFXEffectEditorView delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "effectEditorView:isFaceTrackingDataAvailableForEffect:", self, v43);

      if (v41 && (v44 & 1) == 0)
      {
        v45 = v36;

        v33 = v45;
      }
      v46 = -[JFXOverlayEffectAnimationView initWithEffectFrame:toEffectFrame:]([JFXOverlayEffectAnimationView alloc], "initWithEffectFrame:toEffectFrame:", v33, v36);
      -[CFXEffectEditorView setEffectAnimationView:](self, "setEffectAnimationView:", v46);

      -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView addSubview:](self, "addSubview:", v47);

      objc_msgSend(v38, "setHidden:", 0);
      objc_msgSend(v38, "beginEditingFaceTrackingTransforms");
      -[CFXEffectEditorView CFX_applyEffectAnimationView:](self, "CFX_applyEffectAnimationView:", 1);
      -[CFXEffectEditorView delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke;
      v51[3] = &unk_24EE580F0;
      v51[4] = self;
      v52 = v38;
      v53 = v4;
      v50 = v38;
      objc_msgSend(v48, "effectEditorView:didStartBeginEditingAnimationForEffect:completion:", self, v49, v51);

    }
    else
    {
LABEL_13:
      v4[2](v4);
    }
  }

}

void __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "CFX_startApplyingEffectAnimationViewDisplayLink");
  objc_msgSend(*(id *)(a1 + 32), "CFX_springForTextEditAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effectAnimationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_24EE59510;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animate:completion:", v2, v5);

}

uint64_t __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "CFX_stopApplyingEffectAnimationViewDisplayLink");
  objc_msgSend(*(id *)(a1 + 32), "CFX_applyEffectAnimationView:", objc_msgSend(*(id *)(a1 + 32), "isEndingEditing"));
  objc_msgSend(*(id *)(a1 + 32), "CFX_showEditControls");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "editEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectEditorView:didCompleteBeginEditingAnimationForEffect:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "effectAnimationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setEffectAnimationView:", 0);
  objc_msgSend(*(id *)(a1 + 40), "endEditingFaceTrackingTransforms");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  JFXOverlayEffectAnimationView *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  void (**v46)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CFXEffectEditorView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_10;
    -[CFXEffectEditorView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectEditorView:durationForEndEditingAnimationForEffect:", self, v9);
    v11 = v10;

    if (v11 <= 0.0)
      goto LABEL_10;
    -[CFXEffectEditorView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    -[CFXEffectEditorView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      goto LABEL_10;
    if ((v15 & 1) != 0 && (v17 & 1) != 0)
    {
      -[CFXEffectEditorView CFX_endTextEditing:](self, "CFX_endTextEditing:", 0);
      -[CFXEffectEditorView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "effectEditorView:willBeginAnimationAfterEditingEffect:", self, v19);

      -[CFXEffectEditorView editEffect](self, "editEffect");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "jtEffect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "renderEffect");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "outputSize");
      v24 = v23;
      v26 = v25;

      -[CFXEffectEditorView delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "effectEditorView:endEditingAnimationFromFrameForEffect:relativeToBounds:", self, v28, 0.0, 0.0, v24, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "effectEditorView:endEditingAnimationToFrameForEffect:relativeToBounds:", self, v31, 0.0, 0.0, v24, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = -[JFXOverlayEffectAnimationView initWithEffectFrame:toEffectFrame:]([JFXOverlayEffectAnimationView alloc], "initWithEffectFrame:toEffectFrame:", v29, v32);
      -[CFXEffectEditorView setEffectAnimationView:](self, "setEffectAnimationView:", v33);

      -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView addSubview:](self, "addSubview:", v34);

      -[CFXEffectEditorView editEffect](self, "editEffect");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "jtEffect");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "beginEditingFaceTrackingTransforms");
      -[CFXEffectEditorView CFX_applyEffectAnimationView:](self, "CFX_applyEffectAnimationView:", -[CFXEffectEditorView isEndingEditing](self, "isEndingEditing"));
      -[CFXEffectEditorView CFX_startApplyingEffectAnimationViewDisplayLink](self, "CFX_startApplyingEffectAnimationViewDisplayLink");
      -[CFXEffectEditorView CFX_springForTextEditAnimation](self, "CFX_springForTextEditAnimation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView effectAnimationView](self, "effectAnimationView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke;
      v44[3] = &unk_24EE59510;
      v44[4] = self;
      v39 = v36;
      v45 = v39;
      v46 = v4;
      objc_msgSend(v38, "animate:completion:", v37, v44);

      -[CFXEffectEditorView delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_opt_respondsToSelector();

      if ((v41 & 1) != 0)
      {
        -[CFXEffectEditorView delegate](self, "delegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXEffectEditorView editEffect](self, "editEffect");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "effectEditorView:didStartEndEditingAnimationForEffect:", self, v43);

      }
      -[CFXEffectEditorView CFX_forceHideEditControls](self, "CFX_forceHideEditControls");

    }
    else
    {
LABEL_10:
      v4[2](v4);
    }
  }

}

void __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_24EE580F0;
  v3 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v14 = *(id *)(a1 + 48);
  v4 = (void (**)(_QWORD))MEMORY[0x2276A1F6C](v12);
  objc_msgSend(*(id *)(a1 + 32), "CFX_stopApplyingEffectAnimationViewDisplayLink");
  objc_msgSend(*(id *)(a1 + 32), "CFX_applyEffectAnimationView:", objc_msgSend(*(id *)(a1 + 32), "isEndingEditing"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "editEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_3;
    v10[3] = &unk_24EE580C8;
    v11 = v4;
    objc_msgSend(v7, "effectEditorView:didCompleteEndEditingAnimationForEffect:completion:", v8, v9, v10);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "effectAnimationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setEffectAnimationView:", 0);
  objc_msgSend(*(id *)(a1 + 40), "endEditingFaceTrackingTransforms");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (JFXOverlayEffectDebugView)debugOverlayView
{
  JFXOverlayEffectDebugView *v3;
  JFXOverlayEffectDebugView *v4;
  JFXOverlayEffectDebugView *debugOverlayView;

  if (JFX_isDrawOverlayBoundsEnabled() && !self->_debugOverlayView)
  {
    v3 = [JFXOverlayEffectDebugView alloc];
    v4 = -[JFXOverlayEffectDebugView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    debugOverlayView = self->_debugOverlayView;
    self->_debugOverlayView = v4;

    -[CFXEffectEditorView addSubview:](self, "addSubview:", self->_debugOverlayView);
  }
  return self->_debugOverlayView;
}

- (void)startUpdatingDebugOverlayView
{
  void *v3;
  void *v4;
  id v5;

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_onDebugDisplayLink_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorView setDebugDisplayLink:](self, "setDebugDisplayLink:", v3);

    -[CFXEffectEditorView debugDisplayLink](self, "debugDisplayLink");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v4, *MEMORY[0x24BDBCB80]);

  }
}

- (void)stopUpdatingDebugOverlayView
{
  void *v3;

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    -[CFXEffectEditorView debugDisplayLink](self, "debugDisplayLink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[CFXEffectEditorView setDebugDisplayLink:](self, "setDebugDisplayLink:", 0);
  }
}

- (void)onDebugDisplayLink:(id)a3
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    -[CFXEffectEditorView editEffect](self, "editEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CFXEffectEditorView bounds](self, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[CFXEffectEditorView renderBounds](self, "renderBounds");
      v17 = CGRectFillRectToAspectInRect(v6, v8, v10, v12, v13, v14, v15, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[CFXEffectEditorView delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorView editEffect](self, "editEffect");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "effectEditorView:overlayEffectFrameForEffect:relativeToBounds:", self, v25, v17, v19, v21, v23);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      -[CFXEffectEditorView debugOverlayView](self, "debugOverlayView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateWithEffectFrame:", v33);

      -[CFXEffectEditorView debugOverlayView](self, "debugOverlayView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frame");
      v29 = v28;
      v31 = v30;

      -[CFXEffectEditorView debugOverlayView](self, "debugOverlayView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", v17, v19, v29, v31);

    }
  }
}

- (id)overlayEffectDebugViewOptions
{
  void *v2;
  void *v3;

  JFX_getDrawOverlayBoundsOptionsDictionary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:](JFXOverlayEffectDebugViewOptions, "debugViewOptionsWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CFXEffectEditorViewDelegate)delegate
{
  return self->_delegate;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CFXEffect)editEffect
{
  return self->_editEffect;
}

- (void)setEditEffect:(id)a3
{
  objc_storeStrong((id *)&self->_editEffect, a3);
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)isTextEditing
{
  return self->_isTextEditing;
}

- (void)setIsTextEditing:(BOOL)a3
{
  self->_isTextEditing = a3;
}

- (CGAffineTransform)editTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[13].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].a;
  return self;
}

- (void)setEditTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editTransform.c = v4;
  *(_OWORD *)&self->_editTransform.tx = v3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (BOOL)effectWasEdited
{
  return self->_effectWasEdited;
}

- (void)setEffectWasEdited:(BOOL)a3
{
  self->_effectWasEdited = a3;
}

- (UIButton)removeButton
{
  return self->_removeButton;
}

- (void)setRemoveButton:(id)a3
{
  objc_storeStrong((id *)&self->_removeButton, a3);
}

- (void)setDebugOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_debugOverlayView, a3);
}

- (CADisplayLink)debugDisplayLink
{
  return self->_debugDisplayLink;
}

- (void)setDebugDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_debugDisplayLink, a3);
}

- (CFXTextEffectEditorView)textEditorView
{
  return self->_textEditorView;
}

- (void)setTextEditorView:(id)a3
{
  objc_storeStrong((id *)&self->_textEditorView, a3);
}

- (void)setPreviewGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_previewGenerator, a3);
}

- (JFXImageView)editEffectPreview
{
  return self->_editEffectPreview;
}

- (void)setEditEffectPreview:(id)a3
{
  objc_storeStrong((id *)&self->_editEffectPreview, a3);
}

- (OS_dispatch_queue)effectRenderingQueue
{
  return self->_effectRenderingQueue;
}

- (NSString)oldEditText
{
  return self->_oldEditText;
}

- (void)setOldEditText:(id)a3
{
  objc_storeStrong((id *)&self->_oldEditText, a3);
}

- (BOOL)truncateTextToMaximumLength
{
  return self->_truncateTextToMaximumLength;
}

- (void)setTruncateTextToMaximumLength:(BOOL)a3
{
  self->_truncateTextToMaximumLength = a3;
}

- (unint64_t)maximumTextLength
{
  return self->_maximumTextLength;
}

- (void)setMaximumTextLength:(unint64_t)a3
{
  self->_maximumTextLength = a3;
}

- (CADisplayLink)editControlsTrackingDisplayLink
{
  return self->_editControlsTrackingDisplayLink;
}

- (void)setEditControlsTrackingDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_editControlsTrackingDisplayLink, a3);
}

- (CFXFaceReticleView)faceTrackingReticle
{
  return self->_faceTrackingReticle;
}

- (void)setFaceTrackingReticle:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingReticle, a3);
}

- (CGPoint)lastTouchLocationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchLocationInView.x;
  y = self->_lastTouchLocationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchLocationInView:(CGPoint)a3
{
  self->_lastTouchLocationInView = a3;
}

- (CGPoint)lastSpacingBetweenTouchAndCenterOfEffect
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastSpacingBetweenTouchAndCenterOfEffect.x;
  y = self->_lastSpacingBetweenTouchAndCenterOfEffect.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastSpacingBetweenTouchAndCenterOfEffect:(CGPoint)a3
{
  self->_lastSpacingBetweenTouchAndCenterOfEffect = a3;
}

- (JFXOverlayEffectAnimationView)effectAnimationView
{
  return self->_effectAnimationView;
}

- (void)setEffectAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_effectAnimationView, a3);
}

- (CADisplayLink)effectAnimationDisplayLink
{
  return self->_effectAnimationDisplayLink;
}

- (void)setEffectAnimationDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_effectAnimationDisplayLink, a3);
}

- (unint64_t)appliedEditingGestures
{
  return self->_appliedEditingGestures;
}

- (double)lastFaceRectacleUpdateTime
{
  return self->_lastFaceRectacleUpdateTime;
}

- (void)setLastFaceRectacleUpdateTime:(double)a3
{
  self->_lastFaceRectacleUpdateTime = a3;
}

- (double)lastEffectMovedNotifyTime
{
  return self->_lastEffectMovedNotifyTime;
}

- (void)setLastEffectMovedNotifyTime:(double)a3
{
  self->_lastEffectMovedNotifyTime = a3;
}

- (BOOL)isEndingEditing
{
  return self->_isEndingEditing;
}

- (void)setIsEndingEditing:(BOOL)a3
{
  self->_isEndingEditing = a3;
}

- (BOOL)isBeginningEditing
{
  return self->_isBeginningEditing;
}

- (void)setIsBeginningEditing:(BOOL)a3
{
  self->_isBeginningEditing = a3;
}

- (NSMutableArray)beginEditingCompletionBlocks
{
  return self->_beginEditingCompletionBlocks;
}

- (void)setBeginEditingCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_beginEditingCompletionBlocks, a3);
}

- (NSMutableArray)endEditingCompletionBlocks
{
  return self->_endEditingCompletionBlocks;
}

- (void)setEndEditingCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_endEditingCompletionBlocks, a3);
}

- (BOOL)delegateSupportsCalculatingAnimatedFaceTrackingTransform
{
  return self->_delegateSupportsCalculatingAnimatedFaceTrackingTransform;
}

- (BOOL)delegateSupportsDidMoveEffect
{
  return self->_delegateSupportsDidMoveEffect;
}

- (BOOL)delegateSupportsApplyAnimationTransformsToEffect
{
  return self->_delegateSupportsApplyAnimationTransformsToEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEditingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_beginEditingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_effectAnimationDisplayLink, 0);
  objc_storeStrong((id *)&self->_effectAnimationView, 0);
  objc_storeStrong((id *)&self->_faceTrackingReticle, 0);
  objc_storeStrong((id *)&self->_editControlsTrackingDisplayLink, 0);
  objc_storeStrong((id *)&self->_oldEditText, 0);
  objc_storeStrong((id *)&self->_effectRenderingQueue, 0);
  objc_storeStrong((id *)&self->_editEffectPreview, 0);
  objc_storeStrong((id *)&self->_previewGenerator, 0);
  objc_storeStrong((id *)&self->_textEditorView, 0);
  objc_storeStrong((id *)&self->_debugDisplayLink, 0);
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_removeButton, 0);
  objc_storeStrong((id *)&self->_editEffect, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "effect editor preview render pending", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "effect editor preview rendered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)CFX_effectAnimationDisplayLinkFired:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "effect editor animation render dropped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
