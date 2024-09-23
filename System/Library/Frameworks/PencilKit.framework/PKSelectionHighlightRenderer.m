@implementation PKSelectionHighlightRenderer

- (PKSelectionHighlightRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7;
  id v8;
  PKSelectionHighlightRenderer *v9;
  PKSelectionHighlightRenderer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSelectionHighlightRenderer;
  v9 = -[PKSelectionHighlightRenderer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
  }

  return v10;
}

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4;
  PKSelectionHighlightRenderer *v5;
  PKSelectionHighlightRenderer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSelectionHighlightRenderer;
  v5 = -[PKSelectionHighlightRenderer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    -[PKSelectionHighlightRenderer _setupHighlightIfNecessary]((uint64_t)v6);
  }

  return v6;
}

- (void)_setupHighlightIfNecessary
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  id v18;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v2;

      objc_msgSend(*(id *)(a1 + 24), "bounds");
      v5 = v4;
      v7 = v6;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 24), "drawing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "scaleForDrawing:", v9);
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, v5 * v11, v7 * v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v12;
      v14 = v12;

      objc_msgSend(*(id *)(a1 + 8), "setContentsScale:", 1.0);
      v18 = objc_retainAutorelease(v14);
      objc_msgSend(*(id *)(a1 + 8), "setPath:", objc_msgSend(v18, "CGPath"));
      v15 = *(void **)(a1 + 8);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

      LODWORD(v17) = 1050253722;
      objc_msgSend(*(id *)(a1 + 8), "setOpacity:", v17);

    }
  }
}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (id)adornmentLayer
{
  return self->_highlightLayer;
}

- (void)_didBeginDraggingSelection
{
  double v2;

  LODWORD(v2) = 0;
  -[CAShapeLayer setOpacity:](self->_highlightLayer, "setOpacity:", v2);
}

- (void)_didEndDraggingSelection
{
  double v2;

  LODWORD(v2) = 1050253722;
  -[CAShapeLayer setOpacity:](self->_highlightLayer, "setOpacity:", v2);
}

- (CGPoint)editMenuLocation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  if (self)
  {
    +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", a4);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_renderingDelegate);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v8);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }

  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(v9, "applyTransform:", v13);
  -[PKSelectionHighlightRenderer _setupHighlightIfNecessary]((uint64_t)self);
  v12 = objc_retainAutorelease(v9);
  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", objc_msgSend(v12, "CGPath"));

}

- (id)_accessibilityUserTestingChildren
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end
