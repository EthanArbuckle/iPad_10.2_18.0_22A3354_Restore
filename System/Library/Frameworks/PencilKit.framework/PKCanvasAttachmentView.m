@implementation PKCanvasAttachmentView

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCanvasAttachmentView;
  -[PKAttachmentView drawingDidChangeVisibleStrokes:](&v5, sel_drawingDidChangeVisibleStrokes_, a3);
  -[PKCanvasAttachmentView canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_drawingDidChange");

}

- (BOOL)wantsFullyRendered
{
  return -[PKCanvasAttachmentView _wantsFullyRenderedNotification](self, "_wantsFullyRenderedNotification")
      || -[NSMutableArray count](self->_fullyRenderedCompletionBlocks, "count") != 0;
}

- (void)fullyRendered
{
  id v2;

  -[PKCanvasAttachmentView canvasView](self, "canvasView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fullyRendered");

}

- (BOOL)disableTileAnimations
{
  void *v3;
  BOOL v4;

  -[PKCanvasAttachmentView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isHidden") & 1) != 0
    || -[NSMutableArray count](self->_fullyRenderedCompletionBlocks, "count") != 0;

  return v4;
}

- (CGAffineTransform)drawingTransform
{
  CGAffineTransform *result;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  __int128 v11;

  result = (CGAffineTransform *)-[PKCanvasAttachmentView drawingWidth](self, "drawingWidth");
  if (v6 <= 0.0)
  {
    v10 = MEMORY[0x1E0C9BAA8];
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v10 + 32);
  }
  else
  {
    -[PKCanvasAttachmentView bounds](self, "bounds");
    v8 = v7;
    -[PKCanvasAttachmentView drawingWidth](self, "drawingWidth");
    return CGAffineTransformMakeScale(retstr, v8 / v9, v8 / v9);
  }
  return result;
}

- (id)tiledView
{
  void *v2;
  void *v3;

  -[PKCanvasAttachmentView canvasView](self, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tiledView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKCanvasView)canvasView
{
  return (PKCanvasView *)objc_loadWeakRetained((id *)&self->_canvasView);
}

- (void)setCanvasView:(id)a3
{
  objc_storeWeak((id *)&self->_canvasView, a3);
}

- (BOOL)_wantsFullyRenderedNotification
{
  return self->__wantsFullyRenderedNotification;
}

- (void)set_wantsFullyRenderedNotification:(BOOL)a3
{
  self->__wantsFullyRenderedNotification = a3;
}

- (double)drawingWidth
{
  return self->_drawingWidth;
}

- (void)setDrawingWidth:(double)a3
{
  self->_drawingWidth = a3;
}

- (NSMutableArray)fullyRenderedCompletionBlocks
{
  return self->_fullyRenderedCompletionBlocks;
}

- (void)setFullyRenderedCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_fullyRenderedCompletionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyRenderedCompletionBlocks, 0);
  objc_destroyWeak((id *)&self->_canvasView);
}

@end
