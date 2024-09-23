@implementation _PKDataDetectorInteraction

- (_PKDataDetectorInteraction)initWithRecognitionController:(id)a3
{
  id v5;
  _PKDataDetectorInteraction *v6;
  _PKDataDetectorInteraction *v7;
  uint64_t v8;
  _PKDataDetectorController *dataDetectorController;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGPoint v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PKDataDetectorInteraction;
  v6 = -[_PKDataDetectorInteraction init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognitionController, a3);
    objc_msgSend(v5, "dataDetectorController");
    v8 = objc_claimAutoreleasedReturnValue();
    dataDetectorController = v7->_dataDetectorController;
    v7->_dataDetectorController = (_PKDataDetectorController *)v8;

    v10 = MEMORY[0x1E0C9BAA8];
    v11 = *MEMORY[0x1E0C9BAA8];
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7->_drawingTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7->_drawingTransform.c = v12;
    v13 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)&v7->_drawingTransform.tx = v13;
    *(_OWORD *)&v7->_highlightTransform.a = v11;
    *(_OWORD *)&v7->_highlightTransform.c = v12;
    *(_OWORD *)&v7->_highlightTransform.tx = v13;
    *(_OWORD *)&v7->_highlightPreviewTransform.tx = v13;
    *(_OWORD *)&v7->_highlightPreviewTransform.a = v11;
    *(_OWORD *)&v7->_highlightPreviewTransform.c = v12;
    v14 = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->_sourceRect.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v7->_sourceRect.origin = v14;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIContextMenuInteraction *menuInteraction;
  void *v7;
  UIContextMenuInteraction *v8;
  UIContextMenuInteraction *v9;
  UIContextMenuInteraction *v10;
  UIContextMenuInteraction *v11;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:");
    -[_PKDataDetectorInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && v3)
    {
      menuInteraction = self->_menuInteraction;

      if (!menuInteraction)
      {
        v9 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
        v10 = self->_menuInteraction;
        self->_menuInteraction = v9;

        -[_PKDataDetectorInteraction view](self, "view");
        v11 = (UIContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
        -[UIContextMenuInteraction addInteraction:](v11, "addInteraction:", self->_menuInteraction);
        v8 = v11;
        goto LABEL_12;
      }
      if (v3)
        return;
    }
    else
    {

      if (v3)
        return;
    }
    if (self->_menuInteraction)
    {
      -[_PKDataDetectorInteraction view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeInteraction:", self->_menuInteraction);

      v8 = self->_menuInteraction;
      self->_menuInteraction = 0;
LABEL_12:

    }
  }
}

- (void)willMoveToView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIContextMenuInteraction *menuInteraction;

  -[_PKDataDetectorInteraction view](self, "view", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_PKDataDetectorInteraction menuInteraction](self, "menuInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_PKDataDetectorInteraction view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PKDataDetectorInteraction menuInteraction](self, "menuInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeInteraction:", v8);

      menuInteraction = self->_menuInteraction;
      self->_menuInteraction = 0;

    }
  }
}

- (void)didMoveToView:(id)a3
{
  void *v4;
  UIContextMenuInteraction *v5;
  UIContextMenuInteraction *menuInteraction;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapGestureRecognizer;
  id v9;

  v9 = a3;
  -[_PKDataDetectorInteraction setView:](self, "setView:", v9);
  v4 = v9;
  if (v9)
  {
    if (-[_PKDataDetectorInteraction isEnabled](self, "isEnabled"))
    {
      v5 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
      menuInteraction = self->_menuInteraction;
      self->_menuInteraction = v5;

      objc_msgSend(v9, "addInteraction:", self->_menuInteraction);
    }
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapHandler_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", -[_PKDataDetectorInteraction isEnabled](self, "isEnabled"));
    objc_msgSend(v9, "addGestureRecognizer:", self->_tapGestureRecognizer);
    v4 = v9;
  }

}

- (id)dataDetectorHitTest:(CGPoint)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double y;
  double x;
  CGAffineTransform v12;
  CGAffineTransform v13;

  y = a3.y;
  x = a3.x;
  -[_PKDataDetectorInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden"))
  {

LABEL_6:
    v8 = 0;
    return v8;
  }
  -[_PKDataDetectorInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 <= 0.0)
    goto LABEL_6;
  memset(&v13, 0, sizeof(v13));
  -[_PKDataDetectorInteraction drawingTransform](self, "drawingTransform");
  CGAffineTransformInvert(&v13, &v12);
  -[_PKDataDetectorController hitTest:](self->_dataDetectorController, "hitTest:", vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, y), *(float64x2_t *)&v13.a, x)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  return v8;
}

- (id)itemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_PKDataDetectorController currentItems](self->_dataDetectorController, "currentItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if ((v13 & 1) != 0)
            goto LABEL_12;

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)tapHandler:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[_PKDataDetectorInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_PKDataDetectorInteraction handleTapAtPoint:](self, "handleTapAtPoint:", v7, v9);
}

- (BOOL)handleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v18;
  _BYTE v19[48];
  _BYTE v20[48];
  CGAffineTransform v21;

  y = a3.y;
  x = a3.x;
  -[_PKDataDetectorInteraction dataDetectorHitTest:](self, "dataDetectorHitTest:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    memset(&v21, 0, sizeof(v21));
    objc_msgSend(v6, "_frame");
    v9 = v8;
    objc_msgSend(v7, "_frame");
    CGAffineTransformMakeTranslation(&v21, v9, v10);
    -[_PKDataDetectorInteraction menuInteraction](self, "menuInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKDataDetectorInteraction view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKDataDetectorInteraction drawingTransform](self, "drawingTransform");
    -[_PKDataDetectorInteraction highlightTransform](self, "highlightTransform");
    -[_PKDataDetectorInteraction sourceRect](self, "sourceRect");
    v18 = v21;
    objc_msgSend(v7, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:", v11, v12, &v18, v20, v19, x, y, v13, v14, v15, v16);

  }
  return v7 != 0;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  -[_PKDataDetectorInteraction dataDetectorHitTest:](self, "dataDetectorHitTest:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKDataDetectorInteraction menuInteraction](self, "menuInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKDataDetectorInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKDataDetectorInteraction sourceRect](self, "sourceRect");
  objc_msgSend(v7, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:", v8, v9, v10, x, y, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  void *v24;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v8 = a4;
  v9 = a3;
  -[_PKDataDetectorInteraction itemWithIdentifier:](self, "itemWithIdentifier:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[_PKDataDetectorInteraction highlightPreviewTransform](self, "highlightPreviewTransform");
  v27.origin.x = v12;
  v27.origin.y = v14;
  v27.size.width = v16;
  v27.size.height = v18;
  v28 = CGRectApplyAffineTransform(v27, &v26);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  -[_PKDataDetectorInteraction view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextMenuInteraction:configuration:highlightPreviewInContainerView:frame:", v9, v8, v23, x, y, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKDataDetectorInteraction itemWithIdentifier:](self, "itemWithIdentifier:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "contextMenuInteraction:willPerformPreviewActionForMenuWithConfiguration:animator:", v10, v9, v8);
}

- (_PKDataDetectorController)dataDetectorController
{
  return self->_dataDetectorController;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CGAffineTransform)drawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].d;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_drawingTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.a = v3;
}

- (CGAffineTransform)highlightTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setHighlightTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_highlightTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_highlightTransform.c = v4;
  *(_OWORD *)&self->_highlightTransform.a = v3;
}

- (CGAffineTransform)highlightPreviewTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].d;
  return self;
}

- (void)setHighlightPreviewTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_highlightPreviewTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_highlightPreviewTransform.c = v4;
  *(_OWORD *)&self->_highlightPreviewTransform.a = v3;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_storeStrong((id *)&self->_dataDetectorController, 0);
  objc_storeStrong((id *)&self->_recognitionController, 0);
}

@end
