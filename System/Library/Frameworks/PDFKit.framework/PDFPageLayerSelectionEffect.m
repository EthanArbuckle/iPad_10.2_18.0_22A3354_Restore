@implementation PDFPageLayerSelectionEffect

- (PDFPageLayerSelectionEffect)initWithPDFPageLayer:(id)a3
{
  id v4;
  PDFPageLayerSelectionEffect *v5;
  CALayer *v6;
  PDFPageLayerEffectPrivate *v7;
  CALayer *rootSelectionLayer;
  CALayer *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFPageLayerSelectionEffect;
  v5 = -[PDFPageLayerEffect initWithPDFPageLayer:](&v11, sel_initWithPDFPageLayer_, v4);
  if (v5)
  {
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    v7 = v5->super._private;
    rootSelectionLayer = v7->rootSelectionLayer;
    v7->rootSelectionLayer = v6;

    v9 = v5->super._private->rootSelectionLayer;
    objc_msgSend(v4, "bounds");
    -[CALayer setFrame:](v9, "setFrame:");
    -[PDFPageLayerSelectionEffect addSublayer:](v5, "addSublayer:", v5->super._private->rootSelectionLayer);
    -[CALayer setCompositingFilter:](v5->super._private->rootSelectionLayer, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
  }

  return v5;
}

- (void)setSelections:(id)a3
{
  uint64_t v4;
  PDFPageLayerEffectPrivate *v5;
  NSMutableArray *selections;

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = self->super._private;
  selections = v5->selections;
  v5->selections = (NSMutableArray *)v4;

  -[PDFPageLayerSelectionEffect _generateRects](self, "_generateRects");
}

- (void)addSelection:(id)a3
{
  id v4;
  NSMutableArray *selections;
  NSMutableArray *v6;
  PDFPageLayerEffectPrivate *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  selections = self->super._private->selections;
  v10 = v4;
  if (!selections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->super._private;
    v8 = v7->selections;
    v7->selections = v6;

    v4 = v10;
    selections = self->super._private->selections;
  }
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableArray addObject:](selections, "addObject:", v9);

  -[PDFPageLayerSelectionEffect _generateRects](self, "_generateRects");
}

- (void)updateColor:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CALayer sublayers](self->super._private->rootSelectionLayer, "sublayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v12 = (void *)v11[4];
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v13, "color");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              if (a3)
                +[PDFSelection defaultInactiveColor](PDFSelection, "defaultInactiveColor");
              else
                +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v15 = objc_retainAutorelease(v14);
            objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)_generateRects
{
  id WeakRetained;
  void *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t i;
  void *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  uint64_t Page;
  uint64_t NumberOfRectsAndTransforms;
  uint64_t j;
  SelectionRectInfo *v15;
  PDFPageLayerSelectionEffect *v16;
  NSMutableDictionary *v17;
  PDFPageLayerEffectPrivate *v18;
  NSMutableDictionary *selectionEffectLayers;
  NSMutableDictionary *v20;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  objc_msgSend(WeakRetained, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->super._private->selections;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v8 = (const __CFArray *)objc_msgSend(v7, "cgSelections");
          v9 = v8;
          if (v8)
          {
            Count = CFArrayGetCount(v8);
            if (Count >= 1)
            {
              v11 = 0;
              while (1)
              {
                CFArrayGetValueAtIndex(v9, v11);
                Page = CGPDFSelectionGetPage();
                if (Page == objc_msgSend(v3, "pageRef"))
                  break;
                if (Count == ++v11)
                  goto LABEL_16;
              }
              NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
              if (NumberOfRectsAndTransforms >= 1)
              {
                for (j = 0; j != NumberOfRectsAndTransforms; ++j)
                {
                  v15 = objc_alloc_init(SelectionRectInfo);
                  CGPDFSelectionGetRectAndTransform();
                  objc_storeWeak((id *)&v15->selection, v7);
                  objc_msgSend(v4, "addObject:", v15);

                }
              }
            }
          }
LABEL_16:
          ;
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v24);
    }

    v16 = self;
    if (!self->super._private->selectionEffectLayers)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v18 = self->super._private;
      selectionEffectLayers = v18->selectionEffectLayers;
      v18->selectionEffectLayers = v17;

      v16 = self;
    }
    objc_initWeak(&location, v16);
    v20 = self->super._private->selectionEffectLayers;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __45__PDFPageLayerSelectionEffect__generateRects__block_invoke;
    v25[3] = &unk_24C25D8C8;
    objc_copyWeak(&v26, &location);
    UpdateRectTransformDictionary(v20, v4, 0, v25, &__block_literal_global_82);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
}

PDFSelectionLayer *__45__PDFPageLayerSelectionEffect__generateRects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  PDFSelectionLayer *v5;
  double v6;
  double v7;
  PDFSelectionLayer *v8;
  __int128 v9;
  id v10;
  void *v11;
  id v12;
  PDFSelection *v13;
  PDFSelection *selection;
  _OWORD v16[3];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_alloc_init(PDFSelectionLayer);
    v6 = *((double *)v3 + 4);
    v7 = *((double *)v3 + 5);
    -[PDFSelectionLayer setFrame:](v5, "setFrame:", *((double *)v3 + 10)+ (*((double *)v3 + 3) + v7 * 0.5) * *((double *)v3 + 8)+ *((double *)v3 + 6) * (*((double *)v3 + 2) + v6 * 0.5)- v6 * 0.5, *((double *)v3 + 11)+ (*((double *)v3 + 3) + v7 * 0.5) * *((double *)v3 + 9)+ *((double *)v3 + 7) * (*((double *)v3 + 2) + v6 * 0.5)- v7 * 0.5);
    v9 = *((_OWORD *)v3 + 4);
    v16[0] = *((_OWORD *)v3 + 3);
    v16[1] = v9;
    v16[2] = *((_OWORD *)v3 + 5);
    -[PDFSelectionLayer setAffineTransform:](v5, "setAffineTransform:", v16);
    v10 = objc_loadWeakRetained((id *)v3 + 1);
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_retainAutorelease(v11);
    -[PDFSelectionLayer setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));
    v13 = (PDFSelection *)objc_loadWeakRetained((id *)v3 + 1);
    selection = v5->selection;
    v5->selection = v13;

    -[PDFSelectionLayer setZPosition:](v5, "setZPosition:", -300.0);
    -[PDFSelectionLayer setCompositingFilter:](v5, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
    objc_msgSend(*(id *)(WeakRetained[4] + 104), "addSublayer:", v5);
    v8 = v5;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __45__PDFPageLayerSelectionEffect__generateRects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id *v9;

  v9 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained(v9 + 1);
    objc_storeStrong(v5 + 4, WeakRetained);
    objc_msgSend(WeakRetained, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_retainAutorelease(v7);
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  }
}

@end
