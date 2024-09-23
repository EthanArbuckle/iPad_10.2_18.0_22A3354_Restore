@implementation HKGraphTile

- (HKGraphTile)initWithParentView:(id)a3 graphViewTileThread:(id)a4
{
  id v6;
  id v7;
  HKGraphTile *v8;
  void *v9;
  double v10;
  double v11;
  CALayer *v12;
  CALayer *caLayer;
  void *v14;
  void *v15;
  void *v16;
  _HKGraphTileRenderToImage *currentImageRenderer;
  objc_super v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKGraphTile;
  v8 = -[HKGraphTile init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;

    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    caLayer = v8->_caLayer;
    v8->_caLayer = v12;

    -[CALayer setContentsScale:](v8->_caLayer, "setContentsScale:", v11);
    -[CALayer setAnchorPoint:](v8->_caLayer, "setAnchorPoint:", 0.0, 0.0);
    -[CALayer setOpaque:](v8->_caLayer, "setOpaque:", 1);
    -[CALayer setDrawsAsynchronously:](v8->_caLayer, "setDrawsAsynchronously:", 1);
    -[CALayer setDelegate:](v8->_caLayer, "setDelegate:", v8);
    -[CALayer setContents:](v8->_caLayer, "setContents:", 0);
    -[CALayer setContentsFormat:](v8->_caLayer, "setContentsFormat:", *MEMORY[0x1E0CD29D8]);
    v20 = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v8->_caLayer, "setActions:", v15);

    objc_msgSend(v6, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v8->_caLayer);

    objc_storeWeak((id *)&v8->_graphViewTileThread, v7);
    v8->_currentColumn = -1;
    v8->_tileDisplayedSinceSetNeedsDisplay = 0;
    v8->_configurationChangedCounter = 0;
    objc_storeWeak((id *)&v8->_parentView, v6);
    currentImageRenderer = v8->_currentImageRenderer;
    v8->_currentImageRenderer = 0;

    v8->_lastImageAssignmentTime = 0.0;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphTile lastImageAssignmentTime](self, "lastImageAssignmentTime");
  +[_HKGraphTileDelayedRendererReleaseManager handleDelayedRendererRelease:lastAssignmentTime:](_HKGraphTileDelayedRendererReleaseManager, "handleDelayedRendererRelease:lastAssignmentTime:", v3);

  -[HKGraphTile caLayer](self, "caLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)HKGraphTile;
  -[HKGraphTile dealloc](&v5, sel_dealloc);
}

- (void)configureTileWithScreenRect:(CGRect)a3 column:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_currentColumn = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[CALayer setBounds:](self->_caLayer, "setBounds:", 0.0, 0.0, width, height);
  -[CALayer setPosition:](self->_caLayer, "setPosition:", x, y);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  ++self->_configurationChangedCounter;
  -[HKGraphTile refreshTileContent](self, "refreshTileContent");
}

- (void)prepareTileForReuse
{
  self->_currentColumn = -1;
  -[HKGraphTile setDrawingDelegate:](self, "setDrawingDelegate:", 0);
  ++self->_configurationChangedCounter;
}

- (BOOL)hidden
{
  void *v2;
  char v3;

  -[HKGraphTile caLayer](self, "caLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[HKGraphTile caLayer](self, "caLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)refreshTileContent
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _HKGraphTileBackgroundRenderingContext *v10;
  void *v11;
  double v12;
  double v13;
  _HKGraphTileBackgroundRenderingContext *v14;
  void *v15;
  id v16;

  self->_tileDisplayedSinceSetNeedsDisplay = 0;
  -[HKGraphTile graphViewTileThread](self, "graphViewTileThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKGraphTile drawingDelegate](self, "drawingDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphTile caLayer](self, "caLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "createTileRendererWithTileRect:column:", -[HKGraphTile currentColumn](self, "currentColumn"), v6, v7, v8, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v10 = [_HKGraphTileBackgroundRenderingContext alloc];
    -[HKGraphTile caLayer](self, "caLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v14 = -[_HKGraphTileBackgroundRenderingContext initWithGraphTile:graphViewRenderer:tileSize:configurationChangedCounter:](v10, "initWithGraphTile:graphViewRenderer:tileSize:configurationChangedCounter:", self, v16, -[HKGraphTile configurationChangedCounter](self, "configurationChangedCounter"), v12, v13);

    -[HKGraphTile graphViewTileThread](self, "graphViewTileThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scheduleRedrawUsingRenderer:", v14);

  }
  else
  {
    -[HKGraphTile caLayer](self, "caLayer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsDisplay");
  }

}

- (id)_imageRendererForSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _HKGraphTileRenderToImage *v18;

  height = a3.height;
  width = a3.width;
  -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeInPoints");
    if (vabdd_f64(width, v9) <= 0.01)
    {
      -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeInPoints");
      v12 = vabdd_f64(height, v11);

      if (v12 <= 0.01)
        return -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
    }
    else
    {

    }
  }
  -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphTile lastImageAssignmentTime](self, "lastImageAssignmentTime");
    +[_HKGraphTileDelayedRendererReleaseManager handleDelayedRendererRelease:lastAssignmentTime:](_HKGraphTileDelayedRendererReleaseManager, "handleDelayedRendererRelease:lastAssignmentTime:", v14);

    -[HKGraphTile setCurrentImageRenderer:](self, "setCurrentImageRenderer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  v18 = -[_HKGraphTileRenderToImage initWithSize:scale:invertedYAxis:]([_HKGraphTileRenderToImage alloc], "initWithSize:scale:invertedYAxis:", 1, width, height, v17);
  -[HKGraphTile setCurrentImageRenderer:](self, "setCurrentImageRenderer:", v18);

  return -[HKGraphTile currentImageRenderer](self, "currentImageRenderer");
}

- (void)renderTileInBackgroundWithRenderer:(id)a3 tileSize:(CGSize)a4 configurationChangedCounter:(int64_t)a5
{
  double height;
  double width;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[4];
  id v16;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphTile.m"), 191, CFSTR("HKGraphTile renderTileInBackgroundWithRenderer: is expected to be called from the background thread only"));

  }
  if (height != 0.0 && width != 0.0)
  {
    -[HKGraphTile _imageRendererForSize:](self, "_imageRendererForSize:", width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke;
    v15[3] = &unk_1E9C3FF10;
    v16 = v10;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke_2;
    v14[3] = &unk_1E9C3FF38;
    v14[4] = self;
    v14[5] = a5;
    v14[6] = CFRetain((CFTypeRef)objc_msgSend(v11, "drawToImage:", v15));
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

uint64_t __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderContentToContext:", a2);
}

uint64_t __87__HKGraphTile_renderTileInBackgroundWithRenderer_tileSize_configurationChangedCounter___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "configurationChangedCounter");
  if (result == *(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "caLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContents:", v3);

    objc_msgSend(*(id *)(a1 + 32), "setLastImageAssignmentTime:", CACurrentMediaTime());
    CFRelease(*(CFTypeRef *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 32), "_handlePostRenderOperations");
  }
  return result;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphTile.m"), 230, CFSTR("HKGraphTile drawLayer:inContext: should only be called from the main thread"));

  }
  -[HKGraphTile drawingDelegate](self, "drawingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphTile caLayer](self, "caLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v7, "createTileRendererWithTileRect:column:", -[HKGraphTile currentColumn](self, "currentColumn"), v9, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "renderContentToContext:", a4);
  -[HKGraphTile _handlePostRenderOperations](self, "_handlePostRenderOperations");

}

- (void)_handlePostRenderOperations
{
  id v2;

  self->_tileDisplayedSinceSetNeedsDisplay = 1;
  -[HKGraphTile drawingDelegate](self, "drawingDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileRenderDidFinish");

}

- (HKGraphTileDrawingDelegate)drawingDelegate
{
  return (HKGraphTileDrawingDelegate *)objc_loadWeakRetained((id *)&self->_drawingDelegate);
}

- (void)setDrawingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_drawingDelegate, a3);
}

- (BOOL)tileDisplayedSinceSetNeedsDisplay
{
  return self->_tileDisplayedSinceSetNeedsDisplay;
}

- (int64_t)currentColumn
{
  return self->_currentColumn;
}

- (HKGraphViewTileThread)graphViewTileThread
{
  return (HKGraphViewTileThread *)objc_loadWeakRetained((id *)&self->_graphViewTileThread);
}

- (CALayer)caLayer
{
  return self->_caLayer;
}

- (void)setCaLayer:(id)a3
{
  objc_storeStrong((id *)&self->_caLayer, a3);
}

- (int64_t)configurationChangedCounter
{
  return self->_configurationChangedCounter;
}

- (void)setConfigurationChangedCounter:(int64_t)a3
{
  self->_configurationChangedCounter = a3;
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (_HKGraphTileRenderToImage)currentImageRenderer
{
  return self->_currentImageRenderer;
}

- (void)setCurrentImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageRenderer, a3);
}

- (double)lastImageAssignmentTime
{
  return self->_lastImageAssignmentTime;
}

- (void)setLastImageAssignmentTime:(double)a3
{
  self->_lastImageAssignmentTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImageRenderer, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_caLayer, 0);
  objc_destroyWeak((id *)&self->_graphViewTileThread);
  objc_destroyWeak((id *)&self->_drawingDelegate);
}

@end
