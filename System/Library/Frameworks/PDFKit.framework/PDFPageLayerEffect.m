@implementation PDFPageLayerEffect

- (PDFPageLayerEffect)initWithPDFPageLayer:(id)a3
{
  id v4;
  PDFPageLayerEffect *v5;
  PDFPageLayerEffectPrivate *v6;
  PDFPageLayerEffectPrivate *v7;
  uint64_t v8;
  PDFPageLayerEffectPrivate *v9;
  NSUUID *uuid;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PDFPageLayerEffect;
  v5 = -[PDFPageLayerEffect init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageLayerEffectPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pageLayer, v4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_private;
    uuid = v9->uuid;
    v9->uuid = (NSUUID *)v8;

    v5->_private->shouldRotateContent = 1;
    v19[0] = CFSTR("onOrderIn");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = CFSTR("onOrderOut");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = CFSTR("sublayers");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    v19[3] = CFSTR("contents");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v14;
    v19[4] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PDFPageLayerEffect setActions:](v5, "setActions:", v16);
  }

  return v5;
}

- (id)UUID
{
  return self->_private->uuid;
}

- (CGRect)pageFrame
{
  PDFPageLayerEffectPrivate *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = self->_private;
  x = v2->pageFrame.origin.x;
  y = v2->pageFrame.origin.y;
  width = v2->pageFrame.size.width;
  height = v2->pageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPageFrame:(CGRect)a3
{
  self->_private->pageFrame = a3;
}

- (BOOL)shouldRotateContent
{
  return self->_private->shouldRotateContent;
}

- (id)annotation
{
  return 0;
}

- (id)pdfResult
{
  return 0;
}

+ (id)createPDFSelectionLayerEffectsForSelections:(id)a3 withLayer:(id)a4
{
  id v5;
  id v6;
  PDFPageLayerSelectionEffect *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PDFPageLayerSelectionEffect initWithPDFPageLayer:]([PDFPageLayerSelectionEffect alloc], "initWithPDFPageLayer:", v5);
  objc_msgSend(v5, "bounds");
  -[PDFPageLayerSelectionEffect setFrame:](v7, "setFrame:");
  objc_msgSend(v5, "bounds");
  -[PDFPageLayerEffect setPageFrame:](v7, "setPageFrame:");
  -[PDFPageLayerSelectionEffect setZPosition:](v7, "setZPosition:", -300.0);
  -[PDFPageLayerSelectionEffect setAllowsGroupBlending:](v7, "setAllowsGroupBlending:", 0);
  -[PDFPageLayerSelectionEffect setGeometryFlipped:](v7, "setGeometryFlipped:", 1);
  -[PDFPageLayerSelectionEffect setSelections:](v7, "setSelections:", v6);

  objc_msgSend(v5, "addPageLayerEffect:", v7);
  return v7;
}

+ (id)createPDFCoachmarkLayerEffectsWithFrame:(CGRect)a3 withLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  PDFPageLayerEffect *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  if (PDFRectValid(x, y, width, height)
    && (v29.origin.x = x, v29.origin.y = y, v29.size.width = width, v29.size.height = height, !PDFRectIsEmpty(v29)))
  {
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v31 = PDFRectInset(v30, width * -0.1, height * -0.1);
    v10 = v31.origin.x;
    v11 = v31.origin.y;
    v12 = v31.size.width;
    v13 = v31.size.height;
    v14 = objc_alloc_init(MEMORY[0x24BDE56B8]);
    v15 = 0.0;
    objc_msgSend(v14, "setFrame:", PDFRectToCGRect(v14));
    objc_msgSend(v14, "setCornerRadius:", 3.0);
    v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
    PDFCGColorCreateGenericRGB(0.949019608, 0.937254902, 0.0, 1.0);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    PDFCGColorCreateGenericRGB(0.929411765, 0.8, 0.0, 1.0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (void *)objc_msgSend(v16, "initWithObjects:", v18, objc_msgSend(v19, "CGColor"), 0);

    objc_msgSend(v8, "page");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "rotation");

    if (v22 >= 180)
      objc_msgSend(v20, "exchangeObjectAtIndex:withObjectAtIndex:", 0, 1);
    objc_msgSend(v14, "setColors:", v20);
    if (v22 == 90)
      v23 = 1.0;
    else
      v23 = 0.0;
    if (v22 == 90)
      v24 = 0.0;
    else
      v24 = -1.0;
    if (v22 == 180)
    {
      v23 = 0.0;
      v24 = 1.0;
    }
    if (v22 == 270)
      v25 = -1.0;
    else
      v25 = v23;
    if (v22 != 270)
      v15 = v24;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor", -1.0, v23);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setShadowColor:", objc_msgSend(v26, "CGColor"));

    objc_msgSend(v14, "setShadowOffset:", v25, v15);
    LODWORD(v27) = 1061997773;
    objc_msgSend(v14, "setShadowOpacity:", v27);
    objc_msgSend(v14, "setShadowRadius:", 1.0);
    objc_msgSend(v14, "setGeometryFlipped:", 1);
    v9 = -[PDFPageLayerEffect initWithPDFPageLayer:]([PDFPageLayerEffect alloc], "initWithPDFPageLayer:", v8);
    -[PDFPageLayerEffect setFrame:](v9, "setFrame:", PDFRectToCGRect(v9));
    -[PDFPageLayerEffect setPageFrame:](v9, "setPageFrame:", v10, v11, v12, v13);
    -[PDFPageLayerEffect setZPosition:](v9, "setZPosition:", -500.0);
    -[PDFPageLayerEffect setCompositingFilter:](v9, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
    -[PDFPageLayerEffect addSublayer:](v9, "addSublayer:", v14);
    objc_msgSend(v8, "addPageLayerEffect:", v9);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)createPDFAnnotationLayerEffectForAnnotation:(id)a3 withLayer:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  PDFPageLayerAnnotationEffect *v15;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGRect v26;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (PDFRectValid(v7, v9, v11, v13))
    {
      v26.origin.x = v8;
      v26.origin.y = v10;
      v26.size.width = v12;
      v26.size.height = v14;
      if (!PDFRectIsEmpty(v26))
      {
        objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Subtype"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Link"));
        v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Popup"));
        if (v18)
        {
          objc_msgSend(v5, "border");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20 || (objc_msgSend(v20, "lineWidth"), v22 <= 0.0))
          {

            v15 = 0;
LABEL_23:

            goto LABEL_5;
          }

        }
        v15 = -[PDFPageLayerEffect initWithPDFPageLayer:]([PDFPageLayerAnnotationEffect alloc], "initWithPDFPageLayer:", v6);
        -[PDFPageLayerAnnotationEffect setFrame:](v15, "setFrame:", PDFRectToCGRect(v15));
        v23 = -200.0;
        if (v19)
          v23 = 0.0;
        -[PDFPageLayerAnnotationEffect setZPosition:](v15, "setZPosition:", v23);
        if ((objc_msgSend(v5, "shouldDisplay") & 1) != 0)
        {
          objc_msgSend(v6, "page");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFPageLayerAnnotationEffect setHidden:](v15, "setHidden:", objc_msgSend(v24, "displaysAnnotations") ^ 1);

        }
        else
        {
          -[PDFPageLayerAnnotationEffect setHidden:](v15, "setHidden:", 1);
        }
        -[PDFPageLayerAnnotationEffect setContentsFormat:](v15, "setContentsFormat:", *MEMORY[0x24BDE5890]);
        -[PDFPageLayerAnnotationEffect setGeometryFlipped:](v15, "setGeometryFlipped:", 1);
        -[PDFPageLayerAnnotationEffect setNeedsDisplay](v15, "setNeedsDisplay");
        -[PDFPageLayerAnnotationEffect setDrawsAsynchronously:](v15, "setDrawsAsynchronously:", 1);
        objc_storeWeak((id *)&v15->super._private->annotation, v5);
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("/Text")))
        {
          v15->super._private->shouldRotateContent = 0;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("/Ink")))
        {
          objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/IT"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEqualToString:", CFSTR("/InkHighlight")))
            -[PDFPageLayerAnnotationEffect setCompositingFilter:](v15, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);

        }
        objc_msgSend(v6, "addPageLayerEffect:", v15);
        goto LABEL_23;
      }
    }
  }
  v15 = 0;
LABEL_5:

  return v15;
}

+ (id)createPDFMarkupLayerEffectsForAnnotation:(id)a3 withLayer:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  PDFPageLayerMarkupAnnotationEffect *v15;
  void *v17;
  CGRect v18;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (!PDFRectValid(v7, v9, v11, v13))
    goto LABEL_4;
  v18.origin.x = v8;
  v18.origin.y = v10;
  v18.size.width = v12;
  v18.size.height = v14;
  if (!PDFRectIsEmpty(v18))
  {
    v15 = -[PDFPageLayerEffect initWithPDFPageLayer:]([PDFPageLayerMarkupAnnotationEffect alloc], "initWithPDFPageLayer:", v6);
    -[PDFPageLayerMarkupAnnotationEffect setFrame:](v15, "setFrame:", PDFRectToCGRect(v15));
    -[PDFPageLayerMarkupAnnotationEffect setZPosition:](v15, "setZPosition:", -400.0);
    if ((objc_msgSend(v5, "shouldDisplay") & 1) != 0)
    {
      objc_msgSend(v6, "page");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPageLayerMarkupAnnotationEffect setHidden:](v15, "setHidden:", objc_msgSend(v17, "displaysAnnotations") ^ 1);

    }
    else
    {
      -[PDFPageLayerMarkupAnnotationEffect setHidden:](v15, "setHidden:", 1);
    }
    -[PDFPageLayerMarkupAnnotationEffect setCompositingFilter:](v15, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
    -[PDFPageLayerMarkupAnnotationEffect setAllowsGroupBlending:](v15, "setAllowsGroupBlending:", 0);
    -[PDFPageLayerMarkupAnnotationEffect setGeometryFlipped:](v15, "setGeometryFlipped:", 1);
    objc_storeWeak((id *)&v15->super._private->annotation, v5);
    -[PDFPageLayerMarkupAnnotationEffect update](v15, "update");
    objc_msgSend(v6, "addPageLayerEffect:", v15);
  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
}

+ (id)createPDFNoteLayerEffectForAnnotation:(id)a3 withLayer:(id)a4
{
  PDFPageLayerNoteEffect *v4;
  id v5;
  PDFPageLayerNoteEffect *v6;

  v4 = (PDFPageLayerNoteEffect *)a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v4 = -[PDFPageLayerEffect initWithPDFPageLayer:]([PDFPageLayerNoteEffect alloc], "initWithPDFPageLayer:", v5);
    -[PDFPageLayerNoteEffect setBorderWidth:](v4, "setBorderWidth:", 1.0);
    -[PDFPageLayerNoteEffect setCornerRadius:](v4, "setCornerRadius:", 1.0);
    objc_storeWeak((id *)&v4->super._private->annotation, v6);

    -[PDFPageLayerNoteEffect update](v4, "update");
    objc_msgSend(v5, "addPageLayerEffect:", v4);

  }
  return v4;
}

+ (id)createFlashEffectForPDFLinkAnnotation:(id)a3 withLayer:(id)a4 forType:(int64_t)a5
{
  id v7;
  id v8;
  PDFPageLayerEffect *v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  double width;
  double v16;
  double height;
  double v18;
  void *v19;
  double v20;
  id v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v7 = a4;
  if (a3)
  {
    v8 = a3;
    v9 = -[PDFPageLayerEffect initWithPDFPageLayer:]([PDFPageLayerEffect alloc], "initWithPDFPageLayer:", v7);
    objc_msgSend(v8, "bounds");
    x = v10;
    y = v12;
    width = v14;
    height = v16;

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    if (a5 == 1)
    {
      v18 = 0.2;
    }
    else
    {
      if (a5 != 2)
      {
        -[PDFPageLayerEffect setCornerRadius:](v9, "setCornerRadius:", 1.5);
        +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0.25;
        v18 = 0.25;
        goto LABEL_8;
      }
      v18 = 0.75;
    }
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = PDFRectInset(v38, -3.0, -3.0);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    -[PDFPageLayerEffect setCornerRadius:](v9, "setCornerRadius:", 3.0);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0.0;
LABEL_8:
    v21 = objc_retainAutorelease(v19);
    -[PDFPageLayerEffect setBackgroundColor:](v9, "setBackgroundColor:", objc_msgSend(v21, "CGColor"));

    -[PDFPageLayerEffect setFrame:](v9, "setFrame:", PDFRectToCGRect(v22));
    -[PDFPageLayerEffect setPageFrame:](v9, "setPageFrame:", x, y, width, height);
    -[PDFPageLayerEffect setCompositingFilter:](v9, "setCompositingFilter:", *MEMORY[0x24BDE5BA0]);
    -[PDFPageLayerEffect setZPosition:](v9, "setZPosition:", -500.0);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBeginTime:", v18 + CACurrentMediaTime());
    LODWORD(v24) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFromValue:", v25);

    LODWORD(v26) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setToValue:", v27);

    objc_msgSend(v23, "setDuration:", v20);
    LODWORD(v28) = 1.0;
    objc_msgSend(v23, "setRepeatCount:", v28);
    objc_msgSend(v23, "setRemovedOnCompletion:", 0);
    objc_msgSend(v23, "setFillMode:", *MEMORY[0x24BDE5978]);
    v29 = (void *)MEMORY[0x24BDE57D8];
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __78__PDFPageLayerEffect_createFlashEffectForPDFLinkAnnotation_withLayer_forType___block_invoke;
    v35 = &unk_24C25CBE8;
    v30 = v7;
    v36 = v30;
    a3 = v9;
    v37 = a3;
    objc_msgSend(v29, "setCompletionBlock:", &v32);
    objc_msgSend(a3, "addAnimation:forKey:", v23, CFSTR("fadeAnimation"), v32, v33, v34, v35);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(v30, "addPageLayerEffect:", a3);
  }

  return a3;
}

void __78__PDFPageLayerEffect_createFlashEffectForPDFLinkAnnotation_withLayer_forType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removePageLayerEffectForID:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
