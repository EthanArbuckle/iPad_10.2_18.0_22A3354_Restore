@implementation PDFHighlightDetectedFormFieldsEffectLayer

- (PDFHighlightDetectedFormFieldsEffectLayer)initWithPage:(id)a3
{
  id v4;
  PDFHighlightDetectedFormFieldsEffectLayer *v5;
  PDFHighlightDetectedFormFieldsEffectLayer *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  NSMutableArray *addedSublayers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDFHighlightDetectedFormFieldsEffectLayer;
  v5 = -[PDFHighlightDetectedFormFieldsEffectLayer init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_page, v4);
    v6->_displayBox = 1;
    objc_msgSend(v4, "boundsForBox:", 1);
    v6->_cropBox.origin.x = v7;
    v6->_cropBox.origin.y = v8;
    v6->_cropBox.size.width = v9;
    v6->_cropBox.size.height = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    addedSublayers = v6->_addedSublayers;
    v6->_addedSublayers = (NSMutableArray *)v11;

  }
  return v6;
}

- (void)setDisplayBox:(int64_t)a3
{
  self->_displayBox = a3;
}

- (void)updateVisibleLayers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_addedSublayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7++), "removeFromSuperlayer");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_addedSublayers, "removeAllObjects");
  if (GetDefaultsWriteHighlightDetectedAnnotations())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    v9 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "annotationsIfAvail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "addObjectsFromArray:", v10);
    objc_msgSend(WeakRetained, "detectedAnnotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v9, "addObjectsFromArray:", v11);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__PDFHighlightDetectedFormFieldsEffectLayer_updateVisibleLayers__block_invoke;
    v12[3] = &unk_24C25E198;
    v12[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __64__PDFHighlightDetectedFormFieldsEffectLayer_updateVisibleLayers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;

  v22 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v22, "fieldType") != -1)
  {
    objc_msgSend(v22, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (objc_msgSend(v22, "isAutofillNewContextStart"))
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "colorWithAlphaComponent:", 0.25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v18 = v17;
    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.width = v12;
    v23.size.height = v14;
    v19 = v18 - CGRectGetMaxY(v23);
    objc_msgSend(v22, "autoFillTextContentType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_addRect:withColor:backgroundColor:labelText:itemIndex:", v6, v16, v20, a3, v8, v19, v12, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v21);

  }
}

- (id)_addRect:(CGRect)a3 withColor:(id)a4 backgroundColor:(id)a5 labelText:(id)a6 itemIndex:(unint64_t)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  double width;
  double height;
  _QWORD v34[6];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = x - self->_cropBox.origin.x;
  v17 = y - self->_cropBox.origin.y;
  v18 = *MEMORY[0x24BDBD8B8];
  v19 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v20 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v21 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v22 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  v23 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v24 = v22 + v17 * v20 + *MEMORY[0x24BDBD8B8] * v16;
  v25 = v23 + v17 * v21 + v19 * v16;
  v26 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  objc_msgSend(v26, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v34[0] = v18;
  *(double *)&v34[1] = v19;
  *(double *)&v34[2] = v20;
  *(double *)&v34[3] = v21;
  *(double *)&v34[4] = v22;
  *(double *)&v34[5] = v23;
  objc_msgSend(v26, "setAffineTransform:", v34);
  objc_msgSend(v26, "setPosition:", v24, v25);
  objc_msgSend(v26, "setBounds:", 0.0, 0.0, width, height);
  v27 = objc_retainAutorelease(v13);
  objc_msgSend(v26, "setBorderColor:", objc_msgSend(v27, "CGColor"));
  objc_msgSend(v26, "setBorderWidth:", 1.0);
  if (v14)
    objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v14), "CGColor"));
  if (v15)
  {
    v28 = objc_alloc_init(MEMORY[0x24BDE57C0]);
    objc_msgSend(v28, "setFont:", CFSTR("Helvetica-Bold"));
    objc_msgSend(v28, "setFontSize:", 8.0);
    objc_msgSend(v26, "bounds");
    v36 = CGRectInset(v35, 2.0, 0.0);
    objc_msgSend(v28, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    objc_msgSend(v28, "setString:", v15);
    objc_msgSend(v28, "setAlignmentMode:", *MEMORY[0x24BDE5810]);
    objc_msgSend(v28, "setForegroundColor:", objc_msgSend(objc_retainAutorelease(v27), "CGColor"));
    objc_msgSend(v28, "setContentsScale:", 4.0);
    objc_msgSend(v26, "addSublayer:", v28);

  }
  if (a7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = objc_alloc_init(MEMORY[0x24BDE57C0]);
    objc_msgSend(v29, "setFont:", CFSTR("Helvetica-Bold"));
    objc_msgSend(v29, "setFontSize:", 8.0);
    objc_msgSend(v26, "bounds");
    v38 = CGRectInset(v37, 2.0, 0.0);
    objc_msgSend(v29, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu)"), a7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setString:", v30);

    objc_msgSend(v29, "setAlignmentMode:", *MEMORY[0x24BDE5820]);
    objc_msgSend(v29, "setForegroundColor:", objc_msgSend(objc_retainAutorelease(v27), "CGColor"));
    objc_msgSend(v29, "setContentsScale:", 4.0);
    objc_msgSend(v26, "addSublayer:", v29);

  }
  objc_msgSend(v26, "setZPosition:", 100.0);
  -[PDFHighlightDetectedFormFieldsEffectLayer addSublayer:](self, "addSublayer:", v26);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedSublayers, 0);
  objc_destroyWeak((id *)&self->_page);
}

@end
