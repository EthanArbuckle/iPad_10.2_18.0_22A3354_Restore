@implementation PDFPageLayerTile

- (PDFPageLayerTile)initWithFrame:(CGRect)a3 forPageLayer:(id)a4 withRenderingTransform:(CGAffineTransform *)a5 tileContentsScale:(double)a6 generationID:(int)a7
{
  id v11;
  PDFPageLayerTile *v12;
  PDFPageLayerTile *v13;
  PDFTileSurface *pageSurface;
  __int128 v15;
  __int128 v16;
  void *v17;
  objc_super v19;

  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDFPageLayerTile;
  v12 = -[PDFPageLayerTile init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PDFPageLayerTile setFrame:](v12, "setFrame:", PDFRectToCGRect(v12));
    -[PDFPageLayerTile setContentsOpaque:](v13, "setContentsOpaque:", 1);
    -[PDFPageLayerTile setContents:](v13, "setContents:", 0);
    pageSurface = v13->pageSurface;
    v13->pageSurface = 0;

    objc_storeWeak((id *)&v13->pageLayer, v11);
    v16 = *(_OWORD *)&a5->c;
    v15 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&v13->renderingTransform.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v13->renderingTransform.c = v16;
    *(_OWORD *)&v13->renderingTransform.tx = v15;
    v13->generationID = a7;
    atomic_store(0, (unsigned __int8 *)&v13->isWorking);
    atomic_store(0, (unsigned __int8 *)&v13->hasContent);
    v13->tileContentsScale = a6;
    -[PDFPageLayerTile setContentsScale:](v13, "setContentsScale:", a6);
    -[PDFPageLayerTile setContentsGravity:](v13, "setContentsGravity:", *MEMORY[0x24BDE5C68]);
    -[PDFPageLayerTile setEdgeAntialiasingMask:](v13, "setEdgeAntialiasingMask:", 0);
    -[PDFPageLayerTile setMinificationFilter:](v13, "setMinificationFilter:", *MEMORY[0x24BDE5BB0]);
    -[PDFPageLayerTile setMagnificationFilter:](v13, "setMagnificationFilter:", *MEMORY[0x24BDE5B58]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Generation %d"), v13->generationID);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageLayerTile setName:](v13, "setName:", v17);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->pageSurface)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    +[PDFTilePool sharedPool](PDFTilePool, "sharedPool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "releasePDFTileSurface:", self->pageSurface);

    -[PDFPageLayerTile setContents:](self, "setContents:", 0);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFPageLayerTile;
  -[PDFPageLayerTile dealloc](&v4, sel_dealloc);
}

- (void)hasStartedWork
{
  atomic_store(1u, (unsigned __int8 *)&self->isWorking);
}

- (BOOL)isWorking
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->isWorking);
  return v2 & 1;
}

- (BOOL)hasContent
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->hasContent);
  return v2 & 1;
}

- (void)recievePDFTileSurface:(id)a3
{
  id WeakRetained;
  uint64_t type;
  void *v7;
  char *v8;

  v8 = (char *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->pageLayer);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_storeStrong((id *)&self->pageSurface, a3);
    type = self->pageSurface->type;
    if (type <= 2)
      -[PDFPageLayerTile setContents:](self, "setContents:", *(_QWORD *)&v8[*off_24C25D0F0[type]]);
    atomic_store(0, (unsigned __int8 *)&self->isWorking);
    atomic_store(1u, (unsigned __int8 *)&self->hasContent);
    -[PDFPageLayerTile setName:](self, "setName:", CFSTR("PDFPageLayerTile [Image Set]"));
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(WeakRetained, "tileDrawingComplete:", self);
  }
  else
  {
    +[PDFTilePool sharedPool](PDFTilePool, "sharedPool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "releasePDFTileSurface:", v8);

  }
}

- (void)drawInContext:(CGContext *)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  CGAffineTransform renderingTransform;
  CGRect ClipBoundingBox;
  CGRect v15;

  -[PDFPageLayerTile hasStartedWork](self, "hasStartedWork");
  CGContextSetRGBFillColor(a3, 1.0, 1.0, 1.0, 1.0);
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v15 = CGRectIntegral(ClipBoundingBox);
  CGContextFillRect(a3, v15);
  renderingTransform = self->renderingTransform;
  CGContextSetCTM();
  v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread", *(_OWORD *)&renderingTransform.a, *(_OWORD *)&renderingTransform.c, *(_OWORD *)&renderingTransform.tx);
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 0);
  v6 = +[PDFPage shouldHideAnnotationsForThisThread](PDFPage, "shouldHideAnnotationsForThisThread");
  +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", 1);
  v7 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread](PDFPage, "isExcludingAKAnnotationRenderingForThisThread");
  +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->pageLayer);
  objc_msgSend(WeakRetained, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyDisplayList");
  if (v10)
  {
    v11 = (const void *)v10;
    CGDisplayListDrawInContext();
    CFRelease(v11);
  }
  else
  {
    -[PDFPageLayerTile renderingProperties](self, "renderingProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawWithBox:toContext:", objc_msgSend(v12, "displayBox"), a3);

  }
  +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", v7);
  +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", v6);
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v5);
  atomic_store(0, (unsigned __int8 *)&self->isWorking);
  atomic_store(1u, (unsigned __int8 *)&self->hasContent);
  objc_msgSend(WeakRetained, "tileDrawingComplete:", self);

}

- (PDFRenderingProperties)renderingProperties
{
  return (PDFRenderingProperties *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRenderingProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CGRect)rootViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rootViewFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRootViewFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_rootViewFrame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingProperties, 0);
  objc_storeStrong((id *)&self->pageSurface, 0);
  objc_destroyWeak((id *)&self->pageLayer);
}

@end
