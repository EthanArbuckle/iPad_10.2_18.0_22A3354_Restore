@implementation NTKComplicationDisplayWrapperView

- (NTKComplicationDisplayWrapperView)init
{
  NTKComplicationDisplayWrapperView *v2;
  NTKComplicationDisplayWrapperView *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  NSHashTable *backgroundObservers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationDisplayWrapperView;
  v2 = -[NTKComplicationDisplayWrapperView init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxSize = (CGSize)vdupq_n_s64(0x47EFFFFFE0000000uLL);
    v2->_family = -1;
    v2->_paused = 1;
    v2->_layoutOverride = 0;
    v2->_tapInternalInputEnabled = 1;
    v2->_tapEnabled = 1;
    -[NTKComplicationDisplayWrapperView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", v2->_tapInternalInputEnabled);
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v3->_editingTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v3->_editingTransform.c = v6;
    v7 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)&v3->_editingTransform.tx = v7;
    *(_OWORD *)&v3->_contentTransform.a = v5;
    *(_OWORD *)&v3->_contentTransform.c = v6;
    *(_OWORD *)&v3->_contentTransform.tx = v7;
    *(_OWORD *)&v3->_tritiumTransform.a = v5;
    *(_OWORD *)&v3->_tritiumTransform.c = v6;
    *(_OWORD *)&v3->_tritiumTransform.tx = v7;
    -[NTKComplicationDisplayWrapperView addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__invokeTouchUpInsideHandler, 64);
    -[NTKComplicationDisplayWrapperView addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__invokeTouchDownHandler, 1);
    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSensitiveUIObserver:", v3);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundObservers = v3->_backgroundObservers;
    v3->_backgroundObservers = (NSHashTable *)v9;

  }
  return v3;
}

- (NTKComplicationDisplayWrapperView)initWithFamily:(int64_t)a3
{
  NTKComplicationDisplayWrapperView *result;

  result = -[NTKComplicationDisplayWrapperView init](self, "init");
  if (result)
    result->_family = a3;
  return result;
}

- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3 layoutOverride:(int64_t)a4
{
  NTKComplicationDisplayWrapperView *v6;
  uint64_t v7;
  NTKComplicationDisplayWrapperView *v8;
  NSObject *v9;
  void *v10;

  v6 = -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:](self, "initWithLegacyDisplay:");
  v8 = v6;
  if (v6)
  {
    v6->_layoutOverride = a4;
    if (!a3)
    {
      if (NTKInternalBuild(v6, v7))
      {
        _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:layoutOverride:].cold.1(v9);

        objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKComplicationDisplayWrapperView setBackgroundColor:](v8, "setBackgroundColor:", v10);

      }
    }
  }
  return v8;
}

- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3
{
  id v4;
  NTKComplicationDisplayWrapperView *v5;
  double v6;
  NTKComplicationDisplayWrapperView *v7;

  v4 = a3;
  v5 = -[NTKComplicationDisplayWrapperView init](self, "init");
  v7 = v5;
  if (v5)
  {
    v5->_hasLegacyDisplay = 1;
    LODWORD(v6) = -1.0;
    -[NTKComplicationDisplayWrapperView _setDisplay:withComplicationAnimation:animationType:animationFraction:](v5, "_setDisplay:withComplicationAnimation:animationType:animationFraction:", v4, 0, 0, v6);
  }

  return v7;
}

- (NTKComplicationDisplayWrapperView)initWithCustomRichDisplay:(id)a3
{
  id v4;
  NTKComplicationDisplayWrapperView *v5;
  double v6;
  NTKComplicationDisplayWrapperView *v7;

  v4 = a3;
  v5 = -[NTKComplicationDisplayWrapperView init](self, "init");
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = -1.0;
    -[NTKComplicationDisplayWrapperView _setDisplay:withComplicationAnimation:animationType:animationFraction:](v5, "_setDisplay:withComplicationAnimation:animationType:animationFraction:", v4, 0, 0, v6);
  }

  return v7;
}

- (NTKComplicationDisplayWrapperView)initWithCustomTemplateDisplay:(id)a3 isDetachedDisplay:(BOOL)a4 family:(int64_t)a5
{
  id v8;
  NTKComplicationDisplayWrapperView *v9;
  NTKComplicationDisplayWrapperView *v10;

  v8 = a3;
  v9 = -[NTKComplicationDisplayWrapperView init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_family = a5;
    v9->_isDetachedDisplay = a4;
    -[NTKComplicationDisplayWrapperView setCustomDisplay:](v9, "setCustomDisplay:", v8);
  }

  return v10;
}

- (void)setCustomDisplay:(id)a3
{
  double v3;

  LODWORD(v3) = -1.0;
  -[NTKComplicationDisplayWrapperView _setDisplay:withComplicationAnimation:animationType:animationFraction:](self, "_setDisplay:withComplicationAnimation:animationType:animationFraction:", a3, 0, 0, v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSensitiveUIObserver:", self);

  -[CLKComplicationTemplate endUpdatesForClient:](self->_template, "endUpdatesForClient:", self);
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationDisplayWrapperView;
  -[NTKComplicationDisplayWrapperView dealloc](&v4, sel_dealloc);
}

- (void)_updateConcatenatedTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  objc_super v7;
  CGAffineTransform v8;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&t1.a = *(_OWORD *)&v11.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = *(_OWORD *)&v11.tx;
  v4 = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_editingTransform.a;
  *(_OWORD *)&t2.c = v4;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_editingTransform.tx;
  CGAffineTransformConcat(&v11, &t1, &t2);
  t2 = v11;
  v5 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformConcat(&t1, &t2, &v8);
  v11 = t1;
  t2 = t1;
  v6 = *(_OWORD *)&self->_tritiumTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_tritiumTransform.a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_tritiumTransform.tx;
  CGAffineTransformConcat(&t1, &t2, &v8);
  v11 = t1;
  v7.receiver = self;
  v7.super_class = (Class)NTKComplicationDisplayWrapperView;
  -[NTKComplicationDisplayWrapperView setTransform:](&v7, sel_setTransform_, &t1);
}

- (void)setEditingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editingTransform.c = v4;
  *(_OWORD *)&self->_editingTransform.tx = v3;
  -[NTKComplicationDisplayWrapperView _updateConcatenatedTransform](self, "_updateConcatenatedTransform");
}

- (void)setTritiumTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_tritiumTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_tritiumTransform.c = v4;
  *(_OWORD *)&self->_tritiumTransform.tx = v3;
  -[NTKComplicationDisplayWrapperView _updateConcatenatedTransform](self, "_updateConcatenatedTransform");
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  -[NTKComplicationDisplayWrapperView _updateConcatenatedTransform](self, "_updateConcatenatedTransform");
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5
{
  double v5;

  LODWORD(v5) = -1.0;
  -[NTKComplicationDisplayWrapperView _setComplicationTemplate:reason:animation:animationType:animationFraction:](self, "_setComplicationTemplate:reason:animation:animationType:animationFraction:", a3, a4, a5, 0, v5);
}

- (void)_setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5 animationType:(unint64_t)a6 animationFraction:(float)a7
{
  CLKComplicationTemplate *v13;
  CLKComplicationTemplate **p_template;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  CDComplicationDisplay *display;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  BOOL v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = (CLKComplicationTemplate *)a3;
  p_template = &self->_template;
  if (self->_template != v13)
  {
    -[CLKComplicationTemplate endUpdatesForClient:](self->_prevTemplate, "endUpdatesForClient:", self);
    objc_storeStrong((id *)&self->_prevTemplate, *p_template);
    objc_storeStrong((id *)&self->_template, a3);
    if (!self->_paused)
      -[CLKComplicationTemplate beginUpdatesForClient:](*p_template, "beginUpdatesForClient:", self);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = self->_backgroundObservers;
    v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "displayWrapperTemplateBackgroundChanged");
        }
        v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v17);
    }

    display = self->_display;
    if (!self->_isDetachedDisplay)
    {
      v21 = objc_opt_class();
      v22 = (uint64_t)NTKComplicationDisplayClassForTemplateAndFamily(v13, self->_family);
      if (!v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = objc_opt_class();
        else
          v22 = 0;
      }
      -[NTKComplicationDisplayWrapperView display](self, "display");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "conformsToProtocol:", &unk_1F8E08940);

      if (v24)
      {
        -[NTKComplicationDisplayWrapperView display](self, "display");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "complicationTemplate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = a5;
        v28 = a4;
        v29 = v21;
        v30 = a6;
        v31 = -[CLKComplicationTemplate isEqual:](v13, "isEqual:", v27);

        v32 = v31 == 0;
        a6 = v30;
        v21 = v29;
        a4 = v28;
        a5 = v33;
        if (!v32)
          a5 = 0;

      }
      if (!v21 || v21 != v22 || a5)
      {
        *(float *)&v25 = a7;
        -[NTKComplicationDisplayWrapperView _replaceDisplayWithDisplayClass:template:reason:animation:animationType:animationFraction:](self, "_replaceDisplayWithDisplayClass:template:reason:animation:animationType:animationFraction:", v22, v13, a4, a5, a6, v25);
        goto LABEL_27;
      }
      if (!-[CDComplicationDisplay conformsToProtocol:](self->_display, "conformsToProtocol:", &unk_1F8E08940))
      {
LABEL_27:
        -[NTKComplicationDisplayWrapperView _updateVisibilityForSensitivity:](self, "_updateVisibilityForSensitivity:", -[CLKComplicationTemplate uiSensitivity](v13, "uiSensitivity"));
        goto LABEL_28;
      }
      display = self->_display;
    }
    -[CDComplicationDisplay setComplicationTemplate:reason:](display, "setComplicationTemplate:reason:", v13, a4);
    goto LABEL_27;
  }
LABEL_28:

}

- (void)_replaceDisplayWithDisplayClass:(Class)a3 template:(id)a4 reason:(int64_t)a5 animation:(unint64_t)a6 animationType:(unint64_t)a7 animationFraction:(float)a8
{
  id v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  unint64_t v18;

  v18 = a6;
  v13 = a4;
  -[NTKComplicationDisplayWrapperView display](self, "display");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    objc_msgSend(v16, "setPaused:", -[NTKComplicationDisplayWrapperView paused](self, "paused"));

  }
  objc_msgSend(v15, "setTextLayoutStyle:", -[NTKComplicationDisplayWrapperView textLayoutStyle](self, "textLayoutStyle"));
  -[NTKComplicationDisplayWrapperView _prepareToSetDisplay:withComplicationAnimation:](self, "_prepareToSetDisplay:withComplicationAnimation:", v15, &v18);
  objc_msgSend(v15, "setComplicationTemplate:reason:", v13, a5);

  *(float *)&v17 = a8;
  -[NTKComplicationDisplayWrapperView _setDisplay:withComplicationAnimation:animationType:animationFraction:](self, "_setDisplay:withComplicationAnimation:animationType:animationFraction:", v15, v18, a7, v17);
  -[NTKComplicationDisplayWrapperView _didSetDisplayFromDisplay:withComplicationAnimation:](self, "_didSetDisplayFromDisplay:withComplicationAnimation:", v14, v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CDComplicationDisplay setTimeTravelDate:animated:](self->_display, "setTimeTravelDate:animated:", self->_timeTravelDate, v18 != 0);

}

- (void)_prepareToSetDisplay:(id)a3 withComplicationAnimation:(unint64_t *)a4
{
  int64_t v6;
  int64_t layoutOverride;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend((id)objc_opt_class(), "layoutOverride");
  else
    v6 = 0;
  layoutOverride = self->_layoutOverride;
  self->_didChangeLayoutOverride = v6 != layoutOverride;
  if (v6 != layoutOverride)
  {
    self->_layoutOverride = v6;
    *a4 = 0;
  }

}

- (void)_didSetDisplayFromDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4
{
  if (self->_didChangeLayoutOverride)
  {
    self->_didChangeLayoutOverride = 0;
    -[NTKComplicationDisplayWrapperView _invokeNeedsResizeHandler](self, "_invokeNeedsResizeHandler", a3, a4);
  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  CLKComplicationTemplate *v5;

  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    v5 = self->_template;
    if (a3)
      -[CLKComplicationTemplate endUpdatesForClient:](v5, "endUpdatesForClient:", self);
    else
      -[CLKComplicationTemplate beginUpdatesForClient:](v5, "beginUpdatesForClient:", self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDComplicationDisplay setPaused:](self->_display, "setPaused:", v3);
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[NTKComplicationDisplayWrapperView _setDisplayEditing:](self, "_setDisplayEditing:");
  }
}

- (void)setMaxSize:(CGSize)a3
{
  if (a3.width != self->_maxSize.width || a3.height != self->_maxSize.height)
  {
    self->_maxSize = a3;
    -[NTKComplicationDisplayWrapperView _setDisplayMaxSize:](self, "_setDisplayMaxSize:");
  }
}

- (void)setDimmed:(BOOL)a3
{
  -[NTKComplicationDisplayWrapperView setDimmed:animated:](self, "setDimmed:animated:", a3, 1);
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[NTKComplicationDisplayWrapperView _setDimmed:animated:](self, "_setDimmed:animated:");
  }
}

- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NTKComplicationDisplayWrapperView__setDimmed_animated___block_invoke;
  v7[3] = &unk_1E6BCF930;
  v7[4] = self;
  v8 = a3;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.2);
  else
    (*((void (**)(void *))v5 + 2))(v5);

}

uint64_t __57__NTKComplicationDisplayWrapperView__setDimmed_animated___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "alphaForDimmedState");
  else
    v2 = 1.0;
  return objc_msgSend(v1, "setAlpha:", v2);
}

- (void)setTapEnabled:(BOOL)a3
{
  _BOOL8 v4;

  if (self->_tapEnabled != a3)
  {
    self->_tapEnabled = a3;
    -[NTKComplicationDisplayWrapperView _tryToSetDisplayHighlighted:](self, "_tryToSetDisplayHighlighted:", 0);
    v4 = self->_tapEnabled && self->_tapInternalInputEnabled;
    -[NTKComplicationDisplayWrapperView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4);
  }
}

- (void)setTapAnimationEnabled:(BOOL)a3
{
  if (self->_tapAnimationEnabled != a3)
  {
    self->_tapAnimationEnabled = a3;
    -[NTKComplicationDisplayWrapperView _tryToSetDisplayHighlighted:](self, "_tryToSetDisplayHighlighted:", 0);
  }
}

- (void)setTapInternalInputEnabled:(BOOL)a3
{
  _BOOL8 v4;

  if (self->_tapInternalInputEnabled != a3)
  {
    self->_tapInternalInputEnabled = a3;
    -[NTKComplicationDisplayWrapperView _tryToSetDisplayHighlighted:](self, "_tryToSetDisplayHighlighted:", 0);
    v4 = self->_tapEnabled && self->_tapInternalInputEnabled;
    -[NTKComplicationDisplayWrapperView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4);
  }
}

- (BOOL)performTap
{
  void (**touchDownHandler)(id, void *);
  void *v4;
  void (**touchUpInsideHandler)(id, void *);
  void *v6;

  touchDownHandler = (void (**)(id, void *))self->_touchDownHandler;
  if (touchDownHandler)
  {
    -[NTKComplicationDisplayWrapperView display](self, "display");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    touchDownHandler[2](touchDownHandler, v4);

    touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
    if (!touchUpInsideHandler)
      return 1;
    goto LABEL_5;
  }
  touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
  if (touchUpInsideHandler)
  {
LABEL_5:
    -[NTKComplicationDisplayWrapperView display](self, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    touchUpInsideHandler[2](touchUpInsideHandler, v6);

    return 1;
  }
  return 0;
}

- (BOOL)_displayIsTappable
{
  void *v3;
  void *v4;
  double v5;
  int v6;

  -[NTKComplicationDisplayWrapperView display](self, "display");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_tapEnabled && (objc_msgSend(v3, "alpha"), v5 > 0.0))
    v6 = objc_msgSend(v4, "isHidden") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)_invokeTouchUpInsideHandler
{
  _BOOL4 v3;
  void (**touchUpInsideHandler)(id, void *);
  void *v5;

  if (!self->_touchUpInsideHandler)
    goto LABEL_5;
  v3 = -[NTKComplicationDisplayWrapperView _displayIsTappable](self, "_displayIsTappable");
  if (v3)
  {
    if (self->_tapInternalInputEnabled)
    {
      touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
      -[NTKComplicationDisplayWrapperView display](self, "display");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      touchUpInsideHandler[2](touchUpInsideHandler, v5);

      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_invokeTouchDownHandler
{
  void (**touchDownHandler)(id, id);
  id v4;

  if (self->_touchDownHandler
    && -[NTKComplicationDisplayWrapperView _displayIsTappable](self, "_displayIsTappable")
    && self->_tapInternalInputEnabled)
  {
    touchDownHandler = (void (**)(id, id))self->_touchDownHandler;
    -[NTKComplicationDisplayWrapperView display](self, "display");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    touchDownHandler[2](touchDownHandler, v4);

  }
}

- (void)sensitiveUIStateChanged
{
  id v3;

  -[NTKComplicationDisplayWrapperView complicationTemplate](self, "complicationTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationDisplayWrapperView _updateVisibilityForSensitivity:](self, "_updateVisibilityForSensitivity:", objc_msgSend(v3, "uiSensitivity"));

}

- (void)_invokeNeedsResizeHandler
{
  void (**needsResizeHandler)(void);

  needsResizeHandler = (void (**)(void))self->_needsResizeHandler;
  if (needsResizeHandler)
    needsResizeHandler[2]();
}

- (void)_tryToSetDisplayHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CDComplicationDisplay setHighlighted:](self->_display, "setHighlighted:", v3);
}

- (void)_setDisplayMaxSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CDComplicationDisplay setMaxSize:](self->_display, "setMaxSize:", width, height);
}

- (void)_setDisplayEditing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CDComplicationDisplay setEditing:](self->_display, "setEditing:", v3);
}

- (void)_setDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6
{
  CDComplicationDisplay *v11;
  CDComplicationDisplay *v12;
  CDComplicationDisplay **p_display;
  CDComplicationDisplay *display;
  CLKComplicationTemplate *v15;
  CDComplicationDisplay *v16;
  void *v17;
  void (**displayConfigurationHandler)(id, _QWORD);
  char isKindOfClass;
  double v20;
  CDComplicationDisplay *v21;

  v11 = (CDComplicationDisplay *)a3;
  v12 = v11;
  p_display = &self->_display;
  display = self->_display;
  if (display != v11)
  {
    v21 = v11;
    if (display)
    {
      if ((-[CDComplicationDisplay conformsToProtocol:](v11, "conformsToProtocol:", &unk_1F8E08940) & 1) == 0)
      {
        v15 = self->_template;
        self->_template = 0;

      }
      -[CDComplicationDisplay setDisplayObserver:](*p_display, "setDisplayObserver:", 0);
      -[NTKComplicationDisplayWrapperView _removeDisplay:](self, "_removeDisplay:", *p_display);
    }
    objc_storeStrong((id *)&self->_display, a3);
    v12 = v21;
    if (*p_display)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = *p_display;
        -[NTKComplicationDisplayWrapperView filterProvider](self, "filterProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDComplicationDisplay setFilterProvider:](v16, "setFilterProvider:", v17);

      }
      -[CDComplicationDisplay setDisplayObserver:](*p_display, "setDisplayObserver:", self);
      -[NTKComplicationDisplayWrapperView _setDisplayEditing:](self, "_setDisplayEditing:", self->_editing);
      -[NTKComplicationDisplayWrapperView _setDisplayMaxSize:](self, "_setDisplayMaxSize:", self->_maxSize.width, self->_maxSize.height);
      displayConfigurationHandler = (void (**)(id, _QWORD))self->_displayConfigurationHandler;
      if (displayConfigurationHandler)
        ((void (**)(id, CDComplicationDisplay *))displayConfigurationHandler)[2](displayConfigurationHandler, v21);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = v21;
      if ((isKindOfClass & 1) != 0)
      {
        *(float *)&v20 = a6;
        -[NTKComplicationDisplayWrapperView setComplicationView:withComplicationAnimation:animationType:animationFraction:](self, "setComplicationView:withComplicationAnimation:animationType:animationFraction:", v21, a4, a5, v20);
        v12 = v21;
      }
    }
  }

}

- (void)setFilterProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_filterProvider, obj);
    v6 = objc_opt_respondsToSelector();
    v5 = obj;
    if ((v6 & 1) != 0)
    {
      -[CDComplicationDisplay setFilterProvider:](self->_display, "setFilterProvider:", obj);
      v5 = obj;
    }
  }

}

- (CGSize)preferredSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[NTKComplicationDisplayWrapperView bounds](self, "bounds");
  -[NTKComplicationDisplayWrapperView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CDComplicationDisplay *nextComplicationView;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CDComplicationDisplay sizeThatFits:](self->_currentComplicationView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  nextComplicationView = self->_nextComplicationView;
  if (nextComplicationView)
  {
    -[CDComplicationDisplay sizeThatFits:](nextComplicationView, "sizeThatFits:", width, height);
    if (v11 > v7)
      v7 = v11;
    if (v12 > v9)
      v9 = v12;
  }
  v13 = v7;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[CDComplicationDisplay pointInside:withEvent:](self->_currentComplicationView, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *earlierContainerView;
  UIView *laterContainerView;
  CDComplicationDisplay *currentComplicationView;
  __int128 v14;
  CDComplicationDisplay *v15;
  CDComplicationDisplay *nextComplicationView;
  CDComplicationDisplay *v17;
  CDComplicationDisplay *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)NTKComplicationDisplayWrapperView;
  -[NTKComplicationDisplayWrapperView layoutSubviews](&v29, sel_layoutSubviews);
  -[NTKComplicationDisplayWrapperView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_isAnimating)
  {
    v30 = CGRectInset(*(CGRect *)&v3, 0.0, -2.0);
    -[UIView setFrame:](self->_clipView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    earlierContainerView = self->_earlierContainerView;
    -[UIView bounds](self->_clipView, "bounds");
    -[UIView ntk_setBoundsAndPositionFromFrame:](earlierContainerView, "ntk_setBoundsAndPositionFromFrame:");
    laterContainerView = self->_laterContainerView;
    -[UIView bounds](self->_clipView, "bounds");
    -[UIView ntk_setBoundsAndPositionFromFrame:](laterContainerView, "ntk_setBoundsAndPositionFromFrame:");
    v8 = v8 + 2.0;
  }
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  currentComplicationView = self->_currentComplicationView;
  if (currentComplicationView)
  {
    -[CDComplicationDisplay transform](currentComplicationView, "transform");
    currentComplicationView = self->_currentComplicationView;
  }
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23 = *MEMORY[0x1E0C9BAA8];
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v24 = v14;
  v25 = v19;
  -[CDComplicationDisplay setTransform:](currentComplicationView, "setTransform:", &v23, v19, v14, v23);
  -[CDComplicationDisplay setFrame:](self->_currentComplicationView, "setFrame:", v7, v8, v9, v10);
  v15 = self->_currentComplicationView;
  v23 = v26;
  v24 = v27;
  v25 = v28;
  -[CDComplicationDisplay setTransform:](v15, "setTransform:", &v23);
  nextComplicationView = self->_nextComplicationView;
  if (nextComplicationView)
  {
    -[CDComplicationDisplay transform](nextComplicationView, "transform");
    v26 = v23;
    v27 = v24;
    v28 = v25;
    v17 = self->_nextComplicationView;
    v23 = v22;
    v24 = v21;
    v25 = v20;
    -[CDComplicationDisplay setTransform:](v17, "setTransform:", &v23);
    -[CDComplicationDisplay setFrame:](self->_nextComplicationView, "setFrame:", v7, v8, v9, v10);
    v18 = self->_nextComplicationView;
    v23 = v26;
    v24 = v27;
    v25 = v28;
    -[CDComplicationDisplay setTransform:](v18, "setTransform:", &v23);
  }
}

- (void)willPerformAppLaunchForComplication:(id)a3
{
  NTKComplicationDisplayWrapperAppLaunchDelegate **p_appLaunchDelegate;
  id WeakRetained;
  id v6;

  p_appLaunchDelegate = &self->_appLaunchDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appLaunchDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_appLaunchDelegate);
    objc_msgSend(v6, "willLaunchAppForComplicationDisplayWrapper:", self);

  }
}

- (void)_updateVisibilityForSensitivity:(int64_t)a3
{
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideForSensitivity:", a3);

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (_DWORD)v6 != -[CDComplicationDisplay isHidden](self->_display, "isHidden")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDComplicationDisplay setHidden:](self->_display, "setHidden:", v6);
  }
}

- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5
{
  void (**renderStatsHandler)(id, NTKComplicationDisplayWrapperView *, double, double);

  renderStatsHandler = (void (**)(id, NTKComplicationDisplayWrapperView *, double, double))self->_renderStatsHandler;
  if (renderStatsHandler)
    renderStatsHandler[2](renderStatsHandler, self, a4, a5);
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSDate **p_timeTravelDate;
  id v8;

  v4 = a4;
  p_timeTravelDate = &self->_timeTravelDate;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", *p_timeTravelDate) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CDComplicationDisplay setTimeTravelDate:animated:](self->_display, "setTimeTravelDate:animated:", *p_timeTravelDate, v4);
  }

}

- (void)setComplicationView:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6
{
  CDComplicationDisplay *v9;
  CDComplicationDisplay **p_currentComplicationView;
  CDComplicationDisplay *currentComplicationView;
  NSObject *v12;
  NSString *complicationSlotIdentifier;
  CDComplicationDisplay **p_nextComplicationView;
  CDComplicationDisplay *v15;
  CDComplicationDisplay **v16;
  objc_class *v17;
  CDComplicationDisplay *v18;
  CDComplicationDisplay *v19;
  UIView *v20;
  UIView *clipView;
  UIView *v22;
  UIView *earlierContainerView;
  UIView *v24;
  UIView *laterContainerView;
  NSObject *v26;
  NSString *v27;
  CDComplicationDisplay *nextComplicationView;
  CDComplicationDisplay *deferredComplicationView;
  CLKComplicationTemplate *prevTemplate;
  int v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = (CDComplicationDisplay *)a3;
  p_currentComplicationView = &self->_currentComplicationView;
  currentComplicationView = self->_currentComplicationView;
  if (currentComplicationView != v9)
  {
    if (self->_isAnimating)
    {
      objc_storeStrong((id *)&self->_deferredComplicationView, a3);
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        complicationSlotIdentifier = self->_complicationSlotIdentifier;
        v31 = 138412290;
        v32 = complicationSlotIdentifier;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: deferring animation (%@)", (uint8_t *)&v31, 0xCu);
      }

    }
    else if (a4 && currentComplicationView)
    {
      objc_storeStrong((id *)&self->_nextComplicationView, a3);
      -[CDComplicationDisplay removeFromSuperview](*p_currentComplicationView, "removeFromSuperview");
      if (a4 == 1)
        p_nextComplicationView = &self->_currentComplicationView;
      else
        p_nextComplicationView = &self->_nextComplicationView;
      v15 = *p_nextComplicationView;
      if (a4 == 1)
        v16 = &self->_nextComplicationView;
      else
        v16 = &self->_currentComplicationView;
      v17 = (objc_class *)MEMORY[0x1E0DC3F10];
      v18 = *v16;
      v19 = v15;
      v20 = (UIView *)objc_alloc_init(v17);
      clipView = self->_clipView;
      self->_clipView = v20;

      -[UIView setClipsToBounds:](self->_clipView, "setClipsToBounds:", 1);
      -[NTKComplicationDisplayWrapperView addSubview:](self, "addSubview:", self->_clipView);
      v22 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      earlierContainerView = self->_earlierContainerView;
      self->_earlierContainerView = v22;

      v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      laterContainerView = self->_laterContainerView;
      self->_laterContainerView = v24;

      -[UIView addSubview:](self->_clipView, "addSubview:", self->_laterContainerView);
      -[UIView addSubview:](self->_clipView, "addSubview:", self->_earlierContainerView);
      -[UIView addSubview:](self->_earlierContainerView, "addSubview:", v19);
      -[UIView addSubview:](self->_laterContainerView, "addSubview:", v18);
      self->_isAnimating = 1;
      -[NTKComplicationDisplayWrapperView setNeedsLayout](self, "setNeedsLayout");
      -[NTKComplicationDisplayWrapperView layoutIfNeeded](self, "layoutIfNeeded");
      -[NTKComplicationDisplayWrapperView _timelineAnimationDidFinish](self, "_timelineAnimationDidFinish");

    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_complicationSlotIdentifier;
        v31 = 138412290;
        v32 = v27;
        _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: Replace display non-animated (%@)", (uint8_t *)&v31, 0xCu);
      }

      -[CDComplicationDisplay removeFromSuperview](*p_currentComplicationView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_currentComplicationView, a3);
      -[NTKComplicationDisplayWrapperView _resetComplicationViews](self, "_resetComplicationViews");
      -[CDComplicationDisplay removeFromSuperview](self->_nextComplicationView, "removeFromSuperview");
      nextComplicationView = self->_nextComplicationView;
      self->_nextComplicationView = 0;

      deferredComplicationView = self->_deferredComplicationView;
      self->_deferredComplicationView = 0;

      -[CDComplicationDisplay setUserInteractionEnabled:](*p_currentComplicationView, "setUserInteractionEnabled:", 0);
      -[CLKComplicationTemplate endUpdatesForClient:](self->_prevTemplate, "endUpdatesForClient:", self);
      prevTemplate = self->_prevTemplate;
      self->_prevTemplate = 0;

    }
  }

}

- (void)_timelineAnimationDidFinish
{
  NSObject *v3;
  NSString *complicationSlotIdentifier;
  CDComplicationDisplay *deferredComplicationView;
  CDComplicationDisplay *v6;
  CDComplicationDisplay *currentComplicationView;
  CDComplicationDisplay *v8;
  CDComplicationDisplay *nextComplicationView;
  UIView *earlierContainerView;
  UIView *laterContainerView;
  UIView *clipView;
  CLKComplicationTemplate *prevTemplate;
  int v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    complicationSlotIdentifier = self->_complicationSlotIdentifier;
    v14 = 138412290;
    v15 = complicationSlotIdentifier;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: Complication animation did finish (%@)", (uint8_t *)&v14, 0xCu);
  }

  -[CDComplicationDisplay removeFromSuperview](self->_nextComplicationView, "removeFromSuperview");
  -[CDComplicationDisplay removeFromSuperview](self->_currentComplicationView, "removeFromSuperview");
  deferredComplicationView = self->_deferredComplicationView;
  if (!deferredComplicationView)
    deferredComplicationView = self->_nextComplicationView;
  v6 = deferredComplicationView;
  currentComplicationView = self->_currentComplicationView;
  self->_currentComplicationView = v6;

  v8 = self->_deferredComplicationView;
  self->_deferredComplicationView = 0;

  nextComplicationView = self->_nextComplicationView;
  self->_nextComplicationView = 0;

  self->_isAnimating = 0;
  -[NTKComplicationDisplayWrapperView _resetComplicationViews](self, "_resetComplicationViews");
  -[CDComplicationDisplay setUserInteractionEnabled:](self->_currentComplicationView, "setUserInteractionEnabled:", 0);
  -[NTKComplicationDisplayWrapperView _invokeNeedsResizeHandler](self, "_invokeNeedsResizeHandler");
  earlierContainerView = self->_earlierContainerView;
  self->_earlierContainerView = 0;

  laterContainerView = self->_laterContainerView;
  self->_laterContainerView = 0;

  -[UIView removeFromSuperview](self->_clipView, "removeFromSuperview");
  clipView = self->_clipView;
  self->_clipView = 0;

  -[CLKComplicationTemplate endUpdatesForClient:](self->_prevTemplate, "endUpdatesForClient:", self);
  prevTemplate = self->_prevTemplate;
  self->_prevTemplate = 0;

}

- (void)_resetComplicationViews
{
  if (self->_currentComplicationView)
  {
    -[NTKComplicationDisplayWrapperView addSubview:](self, "addSubview:");
    -[CDComplicationDisplay setAlpha:](self->_currentComplicationView, "setAlpha:", 1.0);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  if (self->_tapAnimationEnabled)
  {
    v3 = a3;
    v5.receiver = self;
    v5.super_class = (Class)NTKComplicationDisplayWrapperView;
    -[NTKComplicationDisplayWrapperView setHighlighted:](&v5, sel_setHighlighted_);
    -[NTKComplicationDisplayWrapperView _tryToSetDisplayHighlighted:](self, "_tryToSetDisplayHighlighted:", v3);
  }
}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (void)addBackgroundObserver:(id)a3
{
  -[NSHashTable addObject:](self->_backgroundObservers, "addObject:", a3);
}

- (void)removeBackgroundObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_backgroundObservers, "removeObject:", a3);
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_template;
}

- (int64_t)family
{
  return self->_family;
}

- (NSString)complicationSlotIdentifier
{
  return self->_complicationSlotIdentifier;
}

- (void)setComplicationSlotIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSlotIdentifier, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->_textLayoutStyle = a3;
}

- (CDComplicationDisplay)display
{
  return self->_display;
}

- (id)displayConfigurationHandler
{
  return self->_displayConfigurationHandler;
}

- (void)setDisplayConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (CGAffineTransform)editingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[14].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].a;
  return self;
}

- (CGAffineTransform)tritiumTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].a;
  return self;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[16].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[17].a;
  return self;
}

- (NTKComplicationDisplayWrapperViewAnimationDelegate)animationDelegate
{
  return (NTKComplicationDisplayWrapperViewAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (NTKComplicationDisplayWrapperAppLaunchDelegate)appLaunchDelegate
{
  return (NTKComplicationDisplayWrapperAppLaunchDelegate *)objc_loadWeakRetained((id *)&self->_appLaunchDelegate);
}

- (void)setAppLaunchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appLaunchDelegate, a3);
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)needsResizeHandler
{
  return self->_needsResizeHandler;
}

- (void)setNeedsResizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)alphaForDimmedState
{
  return self->_alphaForDimmedState;
}

- (void)setAlphaForDimmedState:(double)a3
{
  self->_alphaForDimmedState = a3;
}

- (BOOL)hasLegacyDisplay
{
  return self->_hasLegacyDisplay;
}

- (int64_t)layoutOverride
{
  return self->_layoutOverride;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (id)renderStatsHandler
{
  return self->_renderStatsHandler;
}

- (void)setRenderStatsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (BOOL)tapInternalInputEnabled
{
  return self->_tapInternalInputEnabled;
}

- (BOOL)tapAnimationEnabled
{
  return self->_tapAnimationEnabled;
}

- (id)touchDownHandler
{
  return self->_touchDownHandler;
}

- (void)setTouchDownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (id)touchUpInsideHandler
{
  return self->_touchUpInsideHandler;
}

- (void)setTouchUpInsideHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchUpInsideHandler, 0);
  objc_storeStrong(&self->_touchDownHandler, 0);
  objc_storeStrong(&self->_renderStatsHandler, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong(&self->_needsResizeHandler, 0);
  objc_destroyWeak((id *)&self->_appLaunchDelegate);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_displayConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_complicationSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundObservers, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_prevTemplate, 0);
  objc_storeStrong((id *)&self->_laterContainerView, 0);
  objc_storeStrong((id *)&self->_earlierContainerView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_deferredComplicationView, 0);
  objc_storeStrong((id *)&self->_nextComplicationView, 0);
  objc_storeStrong((id *)&self->_currentComplicationView, 0);
}

- (void)initWithLegacyDisplay:(os_log_t)log layoutOverride:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKComplicationDisplayWrapperView missing legacy complication display", v1, 2u);
}

@end
