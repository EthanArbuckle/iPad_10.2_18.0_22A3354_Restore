@implementation PDFViewController

- (CGPoint)_convertPoint:(CGPoint)a3 toPageView:(id)a4
{
  id v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  id WeakRetained;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MinX;
  double v21;
  double v22;
  double MinY;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat rect;
  CGFloat rect_8;
  CGPoint result;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v5 = a4;
  v6 = PDFRectToCGRect(objc_msgSend(v5, "boundsForBox:", 0));
  v8 = v7;
  v10 = v9;
  rect_8 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(v5, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));

  rect = PDFRectToCGRect(v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v32.origin.x = rect;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = rect_8;
  v21 = MinX - CGRectGetMinX(v33);
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = rect_8;
  v22 = v21 - CGRectGetMinX(v34);
  v35.origin.x = rect;
  v35.origin.y = v15;
  v35.size.width = v17;
  v35.size.height = v19;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = rect_8;
  v24 = MinY - CGRectGetMinY(v36);
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = rect_8;
  v25 = v24 - CGRectGetMinY(v37);
  v26 = PDFPointMake(a3.x - v22, a3.y - v25);
  result.y = v27;
  result.x = v26;
  return result;
}

- (PDFViewController)initWithView:(id)a3
{
  id v4;
  PDFViewController *v5;
  PDFViewControllerPrivate *v6;
  PDFViewControllerPrivate *v7;
  PDFViewControllerPrivate *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  PDFViewControllerPrivate *v12;
  CALayer *marqueeEffect;
  uint64_t v14;
  PDFViewControllerPrivate *v15;
  UIEditMenuInteraction *editMenuInteraction;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PDFViewController;
  v5 = -[PDFViewController init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PDFViewControllerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->view, v4);
    v8 = v5->_private;
    v8->viewMarquee.origin.x = PDFRectFromCGRect(*MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v8->viewMarquee.origin.y = v9;
    v8->viewMarquee.size.width = v10;
    v8->viewMarquee.size.height = v11;
    v12 = v5->_private;
    marqueeEffect = v12->marqueeEffect;
    v12->marqueeEffect = 0;

    objc_storeWeak((id *)&v5->_private->activeAnnotation, 0);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6A30]), "initWithDelegate:", v5);
    v15 = v5->_private;
    editMenuInteraction = v15->editMenuInteraction;
    v15->editMenuInteraction = (UIEditMenuInteraction *)v14;

    objc_msgSend(v4, "addInteraction:", v5->_private->editMenuInteraction);
    v5->_private->textSelectionMenu = 0;
    v5->_private->longPressGestureStartTime = 0.0;
    v5->_private->didPostPDFExtensionViewAnnotationLongPress = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_hideActiveMenus, CFSTR("PDFTextSelectionMenuWillChangeScrollPosition"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v5, sel_showActiveMenus, CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFViewController;
  -[PDFViewController dealloc](&v4, sel_dealloc);
}

- (id)activeAnnotation
{
  return objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
}

- (void)findNextActivatableAnnotationFromPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PDFViewController *v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pageCount");
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  objc_msgSend(v13, "formFillingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke;
  v20[3] = &unk_24C25D6D8;
  v21 = v10;
  v22 = self;
  v25 = v12;
  v26 = v29;
  v27 = a5;
  v28 = v14;
  v23 = v11;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(v15, v20);

  _Block_object_dispose(v29, 8);
}

void __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  +[PDFPageAnalyzer sharedInstance](PDFPageAnalyzer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke_2;
  v9[3] = &unk_24C25D6B0;
  v8 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 80);
  v11 = v4;
  v15 = v5;
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v13 = v6;
  v14 = v7;
  v16 = *(_QWORD *)(a1 + 88);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v2, "analyzePage:analysisTypes:completionQueue:completionBlock:", v3, 2, 0, v9);

}

void __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_findNextActivatableAnnotationOnPage:fromAnnotation:direction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v10 = (void *)v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_12:
    v3 = v10;
    goto LABEL_13;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(_QWORD *)(v4 + 24) + 1;
  *(_QWORD *)(v4 + 24) = v5;
  if (v5 < *(_QWORD *)(a1 + 88))
  {
    v10 = 0;
    v6 = objc_msgSend(*(id *)(a1 + 56), "indexForPage:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 80))
    {
      if (v6)
        v7 = v6 - 1;
      else
        v7 = *(_QWORD *)(a1 + 88) - 1;
    }
    else if ((unint64_t)(v6 + 1) < *(_QWORD *)(a1 + 88))
    {
      v7 = v6 + 1;
    }
    else
    {
      v7 = 0;
    }
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "pageAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "findNextActivatableAnnotationFromPage:fromAnnotation:direction:withCompletion:", v9, 0, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));

    goto LABEL_12;
  }
LABEL_13:

}

- (id)_findNextActivatableAnnotationOnPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  unint64_t v20;

  v7 = a3;
  v8 = a4;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke;
  v18 = &unk_24C25D700;
  v19 = v8;
  v20 = a5;
  v9 = v8;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](&v15);
  objc_msgSend(v7, "annotations", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v10)[2](v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v7, "detectedAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v3, "indexOfObjectIdenticalTo:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4 >= 2)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v5 = 0;
        v4 = v6;
        if (v6)
          goto LABEL_4;
      }
      else if (v6 != v4)
      {
        v5 = v6 + 1;
        v4 -= v6 + 1;
        goto LABEL_4;
      }
    }
    v9 = 0;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_4:
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke_88;
  v11[3] = &unk_24C25D1B0;
  v11[4] = &v12;
  objc_msgSend(v3, "enumerateObjectsAtIndexes:options:usingBlock:", v8, 2 * (v7 == 1), v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

LABEL_7:
  return v9;
}

void __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke_88(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isActivatableTextField"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setActiveAnnotation:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
  if (WeakRetained != obj)
    -[PDFViewController removeControlForAnnotation:](self, "removeControlForAnnotation:", WeakRetained);
  objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
  v5 = objc_loadWeakRetained((id *)&self->_private->view);
  if (obj)
  {
    if (objc_msgSend(obj, "isMarkupAnnotationSubtype"))
      objc_msgSend(v5, "setActiveMarkupStyle:", objc_msgSend(obj, "markupStyle"));
  }
  else
  {
    objc_msgSend(v5, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "akController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "endEditingTextAnnotation");
    objc_msgSend(v7, "modelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectAllAnnotations");

    self->_private->textSelectionMenu = 0;
    -[PDFViewController _hidePDFMarkupMenuView](self, "_hidePDFMarkupMenuView");
  }

}

- (void)interactWithAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_private->activeAnnotation, a3);
}

- (void)activateNextAnnotation:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  id v14;
  id location;

  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v8 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "page");
  else
    objc_msgSend(WeakRetained, "currentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "callDelegateHandleTabFrom:direction:", v9, a3))
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke;
    v12[3] = &unk_24C25D750;
    v12[4] = self;
    objc_copyWeak(&v14, &location);
    v13 = v6;
    -[PDFViewController findNextActivatableAnnotationFromPage:fromAnnotation:direction:withCompletion:](self, "findNextActivatableAnnotationFromPage:fromAnnotation:direction:withCompletion:", v10, v9, a3, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke_2;
  v5[3] = &unk_24C25D728;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v8);
}

void __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "populateAnnotationsFromDetectedAnnotationsOnPage:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  v7 = WeakRetained;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "activateAnnotation:");
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
    v5 = v7;
  }

}

- (void)activateAnnotation:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  CGRect v14;
  CGRect v15;

  v4 = a3;
  if (v4)
  {
    obj = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
    v7 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    objc_msgSend(v7, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v15 = PDFRectInset(v14, -4.0, -4.0);
    objc_msgSend(WeakRetained, "goToRect:onPage:", v8, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    objc_msgSend(obj, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(obj, "akAnnotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(WeakRetained, "document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "akController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "editTextAnnotation:selectAllText:", v10, 0);

      }
    }
    else
    {
      -[PDFViewController _addControlForAnnotation:](self, "_addControlForAnnotation:", v7);
    }
    -[PDFViewController removeControlForAnnotation:](self, "removeControlForAnnotation:", v6);
    -[PDFViewController _postAnnotationHitNotification:](self, "_postAnnotationHitNotification:", v7);

    v4 = obj;
  }

}

- (void)_addControlForAnnotation:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "allowsFormFieldEntry"))
    goto LABEL_4;
  v6 = objc_msgSend(WeakRetained, "isAnnotationEditingEnabled");

  if (v6)
  {
    -[PDFViewController hideActiveMenus](self, "hideActiveMenus");
    objc_msgSend(WeakRetained, "clearSelection");
    -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", obj);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addControlForAnnotation:", obj);
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
LABEL_4:

  }
}

- (void)removeControlForAnnotation:(id)a3
{
  PDFAnnotation **p_activeAnnotation;
  id v5;
  void *v6;
  id WeakRetained;

  if (a3)
  {
    p_activeAnnotation = &self->_private->activeAnnotation;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_activeAnnotation);
    -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeControlForAnnotation:", v5);

    if (WeakRetained == v5)
    {
      objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
      -[PDFViewController hideActiveMenus](self, "hideActiveMenus");
    }

  }
}

- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "populateFormFieldsWithAutoFillSuggestion:completionHandler:", v9, v6);

  }
}

- (void)addDetectedAnnotation:(id)a3 toPage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDE57D8];
  v7 = a4;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(v7, "addAnnotation:", v5);

  objc_msgSend(v5, "akAnnotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOriginalModelBaseScaleFactor:", 1.0);
  objc_msgSend(v8, "setShouldUsePlaceholderText:", 0);
  objc_msgSend(v8, "setTextIsFixedWidth:", 1);
  objc_msgSend(v8, "setTextIsFixedHeight:", 0);
  objc_msgSend(v8, "setIsFormField:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "autoFillTextContentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextContentType:", v9);

  }
  if (objc_msgSend(v5, "hasComb") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setMaximumNumberOfCharacters:", objc_msgSend(v5, "maximumLength"));
  objc_msgSend(v8, "typingAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (objc_msgSend(v5, "hasComb"))
  {
    objc_msgSend(v5, "bounds");
    v13 = v12 / (double)objc_msgSend(v5, "maximumLength");
    v22 = *MEMORY[0x24BDF65F8];
    objc_msgSend(v5, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("W"), "sizeWithAttributes:", v15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 - v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDF66C8]);

    objc_msgSend(v8, "setMaximumNumberOfCharacters:", objc_msgSend(v5, "maximumLength"));
  }
  v18 = *MEMORY[0x24BDF6628];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "mutableCopy");

  }
  objc_msgSend(v20, "setAlignment:", 0);
  if (objc_msgSend(v5, "isDetectedCheckbox"))
  {
    objc_msgSend(v20, "setAlignment:", 1);
    objc_msgSend(v8, "setMaximumNumberOfCharacters:", 1);
  }
  if (objc_msgSend(v5, "hasComb"))
    objc_msgSend(v20, "setLineBreakMode:", 2);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v18);
  objc_msgSend(v8, "setTypingAttributes:", v11);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)populateAnnotationsFromDetectedAnnotationsOnPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "detectedAnnotations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActivatableTextField"))
        {
          -[PDFViewController addDetectedAnnotation:toPage:](self, "addDetectedAnnotation:toPage:", v11, v4);
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "removeFromDetectedAnnotations:", v5);
}

- (BOOL)_shouldUpdateMarkupWithStyle:(unint64_t)a3 onPage:(id)a4 forIndexSet:(id)a5
{
  id v8;
  PDFView **p_view;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  char v20;

  v8 = a5;
  p_view = &self->_private->view;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "document");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexForPage:", v10);

  objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "markupAnnotationsForIndexSet:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "markupStyle");
    objc_msgSend(v16, "indexSetForQuadPoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "isEqualToIndexSet:", v18);

    if (v17 == a3)
      v20 = v19 ^ 1;
    else
      v20 = 1;

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)setMarkupStyle:(unint64_t)a3 forSelection:(id)a4 clearSelection:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (v8)
  {
    v20 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    objc_msgSend(v8, "pages");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v15 = objc_msgSend(v8, "rangeAtIndex:onPage:", 0, v14);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v15, v16);
          if (-[PDFViewController _shouldUpdateMarkupWithStyle:onPage:forIndexSet:](self, "_shouldUpdateMarkupWithStyle:onPage:forIndexSet:", a3, v14, v17))
          {
            objc_msgSend(WeakRetained, "document");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v18, "indexForPage:", v14));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "addMarkupWithStyle:forIndexSet:", a3, v17);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    if (v20)
    {
      objc_msgSend(WeakRetained, "clearSelection");
      objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
    }

  }
}

- (void)setMarkupStyle:(unint64_t)a3 forAnnotation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v6 = a4;
  if (v6)
  {
    v11 = v6;
    objc_msgSend(v6, "indexSetForQuadPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PDFViewController _shouldUpdateMarkupWithStyle:onPage:forIndexSet:](self, "_shouldUpdateMarkupWithStyle:onPage:forIndexSet:", a3, v8, v7);

    if (v9)
    {
      -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addMarkupWithStyle:forIndexSet:", a3, v7);

    }
    v6 = v11;
  }

}

- (void)editNoteForAnnotation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(v5, "contents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(v5, "setContents:withUndo:", &stru_24C25F170, 1);
    -[PDFViewController _addControlForAnnotation:](self, "_addControlForAnnotation:", v5);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)removeNoteForAnnotation:(id)a3
{
  id WeakRetained;

  if (a3)
  {
    objc_msgSend(a3, "setContents:withUndo:", 0, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    objc_msgSend(WeakRetained, "clearSelection");

    objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
  }
}

- (BOOL)isUpdatingSelectionMarkups
{
  return 0;
}

- (id)_pageViewForAnnotation:(id)a3
{
  PDFView **p_view;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  p_view = &self->_private->view;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v4, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v7, "indexForPage:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_postAnnotationWillHitNotification:(id)a3
{
  PDFView **p_view;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    p_view = &self->_private->view;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("PDFAnnotationWillHit");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationWillHit"), WeakRetained, v7);
  }
}

- (void)_postAnnotationHitNotification:(id)a3
{
  PDFView **p_view;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    p_view = &self->_private->view;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("PDFAnnotationHit");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationHit"), WeakRetained, v7);
  }
}

- (void)_handleButtonHit:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "buttonWidgetState"))
  {
    v11[0] = CFSTR("annotation");
    v11[1] = CFSTR("intValue");
    v12[0] = v4;
    v12[1] = &unk_24C27D850;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = v12;
    v7 = v11;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "allowsToggleToOff"))
  {
    v9[0] = CFSTR("annotation");
    v9[1] = CFSTR("intValue");
    v10[0] = v4;
    v10[1] = &unk_24C27D868;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = v10;
    v7 = v9;
LABEL_5:
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFViewController _doButtonHit:](self, "_doButtonHit:", v8);

  }
}

- (void)_doButtonHit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("intValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("formValue"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    v22 = objc_msgSend(v5, "buttonWidgetState");
    if (objc_msgSend(v5, "widgetControlType") == 1)
    {
      objc_msgSend(v5, "formData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "fieldName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringValueForFieldNamed:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10 || objc_msgSend(v10, "length"))
          goto LABEL_12;

      }
    }
    else
    {
      v8 = 0;
    }
    v10 = 0;
LABEL_12:
    v23 = v8;
    v24 = (void *)v7;
    if (v6)
    {
      objc_msgSend(v5, "setButtonWidgetState:", (int)objc_msgSend(v6, "intValue"));
    }
    else if (v8 && v7)
    {
      objc_msgSend(v5, "fieldName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStringValue:forFieldNamed:postFormChangeNotification:", v7, v11, 1);

    }
    else
    {
      NSLog(CFSTR("Error - undefined state in [PDFViewController _doButtonHit]"));
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    objc_msgSend(WeakRetained, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v27[0] = CFSTR("annotation");
      v27[1] = CFSTR("formValue");
      v28[0] = v5;
      v28[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerUndoWithTarget:selector:object:", self, sel__doButtonHit_, v14);
    }
    else
    {
      v25[1] = CFSTR("intValue");
      v26[0] = v5;
      v25[0] = CFSTR("annotation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerUndoWithTarget:selector:object:", self, sel__doButtonHit_, v15);

    }
    v16 = (void *)MEMORY[0x24BDD17C8];
    PDFKitLocalizedString(CFSTR("Change of %@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "undoManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActionName:", v21);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)_annotationHit:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  char v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;
  id location;
  _QWORD v38[2];
  _QWORD v39[3];

  y = a4.y;
  x = a4.x;
  v39[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "renderingProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isUsingPDFExtensionView");

    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("/Link")) & 1) == 0 && v11)
      goto LABEL_36;
    -[PDFViewController _postAnnotationWillHitNotification:](self, "_postAnnotationWillHitNotification:", v7);
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Link")))
    {
      objc_msgSend(v7, "action");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", v7);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pageLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v11 & 1) != 0)
        {
          v15 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:withLayer:forType:](PDFPageLayerEffect, "createFlashEffectForPDFLinkAnnotation:withLayer:forType:", v7, v14, 1);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_24;
        }
        else
        {
          v23 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:withLayer:forType:](PDFPageLayerEffect, "createFlashEffectForPDFLinkAnnotation:withLayer:forType:", v7, v14, 0);

        }
        objc_initWeak(&location, WeakRetained);
        v24 = dispatch_time(0, 400000000);
        v31 = MEMORY[0x24BDAC760];
        v32 = 3221225472;
        v33 = __47__PDFViewController__annotationHit_atLocation___block_invoke;
        v34 = &unk_24C25CD18;
        objc_copyWeak(&v36, &location);
        v35 = v12;
        dispatch_after(v24, MEMORY[0x24BDAC9B8], &v31);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        if (v11)
        {
LABEL_24:
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v31, v32, v33, v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = CFSTR("PDFAnnotationHit");
          v38[1] = CFSTR("location");
          v39[0] = v7;
          objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", x, y);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = v26;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationHit"), WeakRetained, v27);

LABEL_36:
          goto LABEL_37;
        }
        goto LABEL_33;
      }
LABEL_34:

LABEL_35:
      -[PDFViewController _postAnnotationHitNotification:](self, "_postAnnotationHitNotification:", v7, v31, v32, v33, v34);
      goto LABEL_36;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Widget"))
      && (objc_msgSend(v7, "isReadOnly") & 1) == 0)
    {
      objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/FT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "isEqualToString:", CFSTR("/Btn"));
      v29 = objc_msgSend(v12, "isEqualToString:", CFSTR("/Ch"));
      v30 = objc_msgSend(v12, "isEqualToString:", CFSTR("/Tx"));
      if ((v29 & 1) == 0 && !v30)
      {
        if (!v28)
          goto LABEL_34;
        if (objc_msgSend(v7, "widgetControlType"))
        {
          -[PDFViewController _handleButtonHit:](self, "_handleButtonHit:", v7);
          goto LABEL_34;
        }
        objc_msgSend(v7, "action");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(WeakRetained, "performAction:", v13);
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isMarkupAnnotationSubtype"))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Text")))
        {
          objc_msgSend(v7, "popup");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            -[PDFViewController _addControlForAnnotation:](self, "_addControlForAnnotation:", v7);
        }
        goto LABEL_35;
      }
      objc_msgSend(v7, "page");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "convertPoint:toPage:", v12, x, y);
      if (!objc_msgSend(v7, "noteContainsPoint:"))
      {
        v13 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
        if (v13 != v7)
        {
          objc_msgSend(WeakRetained, "currentSelection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v7, "indexSetForQuadPoints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "currentSelection");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "rangeAtIndex:onPage:", 0, v12);
            v21 = v20;

            if ((objc_msgSend(v17, "containsIndexesInRange:", v19, v21) & 1) == 0)
              objc_msgSend(WeakRetained, "clearSelection");

          }
          objc_storeWeak((id *)&self->_private->activeAnnotation, v7);
          -[PDFViewController showMenuForMarkupAnnotation:](self, "showMenuForMarkupAnnotation:", v7);
        }
        goto LABEL_33;
      }
    }
    -[PDFViewController _addControlForAnnotation:](self, "_addControlForAnnotation:", v7);
    goto LABEL_34;
  }
LABEL_37:

}

void __47__PDFViewController__annotationHit_atLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "performAction:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)handleGesture:(id)a3
{
  PDFAnnotation **p_activeAnnotation;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id WeakRetained;

  p_activeAnnotation = &self->_private->activeAnnotation;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activeAnnotation);
  v6 = objc_loadWeakRetained((id *)&self->_private->view);
  v7 = objc_msgSend(v6, "typeForGestureRecognizer:", v5);
  objc_msgSend(v5, "locationInView:", v6);
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v5, "state");

  -[PDFViewController handleGesture:state:location:](self, "handleGesture:state:location:", v7, v12, v9, v11);
  if (WeakRetained && (v12 == 1 || !v7))
    -[PDFViewController removeControlForAnnotation:](self, "removeControlForAnnotation:", WeakRetained);

}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  y = a5.y;
  x = a5.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  -[PDFViewController _annotationAtGestureLocation:](self, "_annotationAtGestureLocation:", x, y);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a3 == 2 && v10)
  {
    -[PDFViewController _annotationHitLongPress:gestureState:location:](self, "_annotationHitLongPress:gestureState:location:", v10, a4, x, y);
  }
  else if (a3 == 1)
  {
    objc_msgSend(WeakRetained, "clearSelection");
    -[PDFViewController _performDoubleTapAtLocation:](self, "_performDoubleTapAtLocation:", x, y);
  }
  else if (!a3)
  {
    objc_msgSend(WeakRetained, "clearSelection");
    if (v11)
      -[PDFViewController _annotationHit:atLocation:](self, "_annotationHit:atLocation:", v11, x, y);
  }

}

- (void)_performDoubleTapAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  BOOL v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v7 = -[PDFViewController _handleFormFillingEventAtLocation:](self, "_handleFormFillingEventAtLocation:", x, y);
    WeakRetained = v8;
    if (!v7)
    {
      objc_msgSend(v8, "focusOnColumnAtPoint:", x, y);
      WeakRetained = v8;
    }
  }

}

- (unint64_t)textSelectionMenu
{
  return self->_private->textSelectionMenu;
}

- (void)_hideTextSelectionMenu
{
  -[UIEditMenuInteraction dismissMenu](self->_private->editMenuInteraction, "dismissMenu");
}

- (void)hideActiveMenus
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "renderingProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUsingPDFExtensionView");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = CFSTR("visible");
    v9[1] = CFSTR("selectionRect");
    v10[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFTextSelectionShowTextSelectionMenu"), self, v8);

  }
  else
  {
    -[PDFViewController _hideTextSelectionMenu](self, "_hideTextSelectionMenu");
    -[PDFViewController _hidePDFMarkupMenuView](self, "_hidePDFMarkupMenuView");
  }
}

- (void)_hidePDFMarkupMenuView
{
  -[UIEditMenuInteraction dismissMenu](self->_private->editMenuInteraction, "dismissMenu");
}

- (void)showMarkupStyleMenuForMarkupAnnotation
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v26;
  id WeakRetained;
  CGRect v28;
  CGRect v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "allowsCommenting"))
  {
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_msgSend(WeakRetained, "isAnnotationEditingEnabled");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    v3 = v5;
    if (v5)
    {
      objc_msgSend(v5, "page");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(WeakRetained, "currentSelection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isEmpty") & 1) == 0)
      {
        objc_msgSend(v16, "boundsForPage:", v6);
        v8 = v17;
        v10 = v18;
        v12 = v19;
        v14 = v20;
      }
      objc_msgSend(WeakRetained, "convertRect:fromPage:", v6, v8, v10, v12, v14);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      MidX = CGRectGetMidX(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      +[PDFAnnotationEditMenuConfiguration configurationWithIdentifier:sourcePoint:](PDFAnnotationEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", CFSTR("com.apple.pdfkit.menu.markupstyle"), MidX, CGRectGetMinY(v29));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAnnotation:", v3);
      self->_private->textSelectionMenu = 2;
      -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_private->editMenuInteraction, "presentEditMenuWithConfiguration:", v26);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)showMenuForMarkupAnnotation:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  v27 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "allowsCommenting"))
  {
LABEL_7:

    goto LABEL_8;
  }
  v6 = objc_msgSend(WeakRetained, "isAnnotationEditingEnabled");

  if (v6)
  {
    objc_msgSend(v27, "page");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(WeakRetained, "currentSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v16, "boundsForPage:", v5);
      v8 = v17;
      v10 = v18;
      v12 = v19;
      v14 = v20;
    }
    objc_msgSend(WeakRetained, "convertRect:fromPage:", v5, v8, v10, v12, v14);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    MidX = CGRectGetMidX(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    +[PDFAnnotationEditMenuConfiguration configurationWithIdentifier:sourcePoint:](PDFAnnotationEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", CFSTR("com.apple.pdfkit.menu.markup"), MidX, CGRectGetMinY(v29));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAnnotation:", v27);
    self->_private->textSelectionMenu = 2;
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_private->editMenuInteraction, "presentEditMenuWithConfiguration:", v26);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)highlight:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v4 = objc_msgSend(WeakRetained, "activeMarkupStyle");
  objc_msgSend(WeakRetained, "currentSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFViewController setMarkupStyle:forSelection:clearSelection:](self, "setMarkupStyle:forSelection:clearSelection:", v4, v5, 1);
  objc_msgSend(v5, "firstPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v7, "indexForPage:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BDD15E0]);
  v10 = objc_msgSend(v5, "rangeAtIndex:onPage:", 0, v6);
  v12 = (void *)objc_msgSend(v9, "initWithIndexesInRange:", v10, v11);
  objc_msgSend(v8, "markupAnnotationsForIndexSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_storeWeak((id *)&self->_private->activeAnnotation, v14);
      -[PDFViewController showMarkupStyleMenuForMarkupAnnotation](self, "showMarkupStyleMenuForMarkupAnnotation");
    }

  }
}

- (id)additionalEditMenuElementsForSelection:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v32;
  PDFViewController *val;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v6 = objc_msgSend(WeakRetained, "allowsMarkupAnnotationEditing");
  v7 = (void *)MEMORY[0x24BDBD1A8];
  if (!v4 || !v6 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
    goto LABEL_20;
  v32 = WeakRetained;
  val = self;
  -[PDFViewController _annotationsForSelection:](self, "_annotationsForSelection:", v4);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v9)
  {
LABEL_17:

    objc_initWeak(&location, val);
    v18 = 0;
LABEL_18:
    v19 = (void *)MEMORY[0x24BDF69A8];
    v20 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke;
    v36[3] = &unk_24C25D7A0;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v19, "elementWithViewProvider:", v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDF67B8];
    PDFKitLocalizedString(CFSTR("Highlight"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_3;
    v34[3] = &unk_24C25CDB8;
    objc_copyWeak(&v35, &location);
    v34[4] = val;
    objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v23, 0, CFSTR("com.apple.pdfkit.action.highlight"), v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMenuElementRepresentation:", v24);

    v43 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v37);
    goto LABEL_19;
  }
  v10 = *(_QWORD *)v40;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v40 != v10)
      objc_enumerationMutation(v8);
    v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
    if (!objc_msgSend(v12, "isMarkupAnnotationSubtype"))
      goto LABEL_12;
    objc_msgSend(v12, "indexSetForQuadPoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "page");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "rangeAtIndex:onPage:", 0, v14);
    v17 = v16;

    if ((objc_msgSend(v13, "containsIndexesInRange:", v15, v17) & 1) != 0)
      break;

LABEL_12:
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v9)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  v18 = v12;
  objc_storeWeak((id *)&val->_private->activeAnnotation, v18);

  objc_initWeak(&location, val);
  if (!v18)
    goto LABEL_18;
  -[PDFViewController additionalEditMenuElementsForMarkupAnnotation:](val, "additionalEditMenuElementsForMarkupAnnotation:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  objc_destroyWeak(&location);

  WeakRetained = v32;
LABEL_20:
  v25 = WeakRetained;
  objc_msgSend(WeakRetained, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    objc_msgSend(v25, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "additionalEditMenuElementsForSelection:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v30;
    }

  }
  return v7;
}

PDFMarkupStyleView *__60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PDFMarkupStyleView *v4;
  PDFMarkupStyleView *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = [PDFMarkupStyleView alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_2;
  v9[3] = &unk_24C25D778;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = -[PDFMarkupStyleView initWithHandler:](v4, "initWithHandler:", v9);
  -[PDFMarkupStyleView heightAnchor](v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 40.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_destroyWeak(&v10);
  return v5;
}

void __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMarkupStyle:", a2);
  objc_msgSend(WeakRetained, "_closeTextEditingMenu");

}

void __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "highlight:", *(_QWORD *)(a1 + 32));

}

- (id)additionalEditMenuElementsForMarkupAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v6 = (void *)MEMORY[0x24BDF69A8];
  v7 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke;
  v36[3] = &unk_24C25D7A0;
  objc_copyWeak(&v37, location);
  objc_msgSend(v6, "elementWithViewProvider:", v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF67B8];
  PDFKitLocalizedString(CFSTR("Highlight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v7;
  v34[1] = 3221225472;
  v34[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_3;
  v34[3] = &unk_24C25D7C8;
  objc_copyWeak(&v35, location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, 0, CFSTR("com.apple.pdfkit.action.highlight"), v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenuElementRepresentation:", v11);

  objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDF67B8];
  PDFKitLocalizedString(CFSTR("Remove"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_4;
  v32[3] = &unk_24C25D7F0;
  v15 = v4;
  v33 = v15;
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v12, CFSTR("com.apple.pdfkit.action.removeMarkup"), v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAttributes:", objc_msgSend(v16, "attributes") | 2);
  objc_msgSend(v5, "addObject:", v16);
  objc_msgSend(v15, "popup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDF67B8];
    PDFKitLocalizedString(CFSTR("Remove Note"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_5;
    v30[3] = &unk_24C25CDB8;
    v21 = v30;
    v22 = &v31;
    objc_copyWeak(&v31, location);
    v30[4] = v15;
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v18, CFSTR("com.apple.pdfkit.action.removeNote"), v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setAttributes:", objc_msgSend(v23, "attributes") | 2);
    objc_msgSend(v5, "addObject:", v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("note.text"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDF67B8];
    PDFKitLocalizedString(CFSTR("Add Note"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_6;
    v28[3] = &unk_24C25CDB8;
    v21 = v28;
    v22 = &v29;
    objc_copyWeak(&v29, location);
    v28[4] = v15;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, v18, CFSTR("com.apple.pdfkit.action.addNote"), v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v23);
  }

  objc_destroyWeak(v22);
  v26 = (void *)objc_msgSend(v5, "copy");

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(location);
  return v26;
}

PDFMarkupStyleView *__67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PDFMarkupStyleView *v4;
  PDFMarkupStyleView *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = [PDFMarkupStyleView alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_2;
  v9[3] = &unk_24C25D778;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = -[PDFMarkupStyleView initWithHandler:](v4, "initWithHandler:", v9);
  -[PDFMarkupStyleView heightAnchor](v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 40.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_destroyWeak(&v10);
  return v5;
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMarkupStyle:", a2);
  objc_msgSend(WeakRetained, "_closeTextEditingMenu");

}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showMarkupStyleMenuForMarkupAnnotation");

}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "page");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnnotation:withUndo:", *(_QWORD *)(a1 + 32), 1);

}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeNoteForAnnotation:", *(_QWORD *)(a1 + 32));

}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "editNoteForAnnotation:", *(_QWORD *)(a1 + 32));

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33[2];
  id location;

  v30 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "annotation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v11, "isEqual:", CFSTR("com.apple.pdfkit.menu.markup")))
    {
      -[PDFViewController additionalEditMenuElementsForMarkupAnnotation:](self, "additionalEditMenuElementsForMarkupAnnotation:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v15 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_11);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          v15 = objc_msgSend(v9, "count") - 1;
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v15 + 1, objc_msgSend(v14, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertObjects:atIndexes:", v14, v16);

      }
      goto LABEL_11;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || !objc_msgSend(v11, "isEqual:", CFSTR("com.apple.pdfkit.menu.markupstyle")))
    {
      goto LABEL_11;
    }
    objc_initWeak(&location, self);
    objc_msgSend(v10, "removeAllObjects");
    v19 = 0;
    while (1)
    {
      v20 = PDFMarkupMenuColorMenuIconForMarkupStyle((uint64_t)v19);
      if ((unint64_t)v19 >= 5)
      {
        if (v19 == (char *)5)
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "smallUnderlinePot");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v19 != (char *)6)
          {
            v25 = 0;
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x24BDF6AC8], "smallStrikeOutPot");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v25 = (void *)v26;
      }
      else
      {
        v21 = v20;
        v22 = (void *)MEMORY[0x24BDF6AC8];
        PDFMarkupMenuColorForMenuIcon(v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        PDFMarkupMenuString(v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "smallColorPotForColor:withAccessibilityLabel:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_23:
      v27 = (void *)MEMORY[0x24BDF67B8];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
      v31[3] = &unk_24C25D818;
      objc_copyWeak(v33, &location);
      v33[1] = v19;
      v28 = v13;
      v32 = v28;
      objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", &stru_24C25F170, v25, 0, v31);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v29);

      objc_destroyWeak(v33);
      if (++v19 == (char *)7)
      {
        objc_destroyWeak(&location);
        v13 = v28;
        break;
      }
    }
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithChildren:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDF7BD0]);
    if ((_DWORD)v7)
      *a4 = 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMarkupStyle:forAnnotation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_closeTextEditingMenu
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "documentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_166);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissMenu");

  }
}

uint64_t __42__PDFViewController__closeTextEditingMenu__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  char isKindOfClass;

  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "dismissMenu");
    *a4 = 1;
  }

  return isKindOfClass & 1;
}

- (void)setMarkupStyle:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "setActiveMarkupStyle:", a3);
  objc_msgSend(WeakRetained, "currentSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PDFViewController setMarkupStyle:forSelection:clearSelection:](self, "setMarkupStyle:forSelection:clearSelection:", a3, v5, 0);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    if (v6)
    {
      v7 = v6;
      -[PDFViewController setMarkupStyle:forAnnotation:](self, "setMarkupStyle:forAnnotation:", a3, v6);

    }
  }

}

- (void)deleteAnnotation
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  PDFViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "document");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = WeakRetained;
  objc_msgSend(WeakRetained, "currentSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v34 = self;
  v35 = v4;
  if (v4)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "pages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v47 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          v12 = objc_msgSend(v35, "rangeAtIndex:onPage:", 0, v11, v34);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v12, v13);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v36, "indexForPage:", v11));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v14, v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v8);
    }
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    v6 = v16;
    if (v16)
    {
      objc_msgSend(v16, "indexSetForQuadPoints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "page");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v36, "indexForPage:", v19));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v17, v20);

    }
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKey:", v26, v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pageViewForPageAtIndex:", objc_msgSend(v26, "integerValue"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "markupAnnotationsForIndexSet:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v39;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v39 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(v28, "addMarkupWithStyle:forIndexSet:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "markupStyle"), v27);
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v31);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v23);
  }

  -[PDFViewController _hidePDFMarkupMenuView](v34, "_hidePDFMarkupMenuView");
}

- (void)_annotationHitLongPress:(id)a3 gestureState:(int64_t)a4 location:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  double v13;
  PDFViewControllerPrivate *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  y = a5.y;
  x = a5.x;
  v22[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "renderingProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUsingPDFExtensionView");

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v14 = self->_private;
    if (a4 == 1)
    {
      v14->longPressGestureStartTime = v13;
      self->_private->didPostPDFExtensionViewAnnotationLongPress = 0;
      -[PDFViewController _pageViewForAnnotation:](self, "_pageViewForAnnotation:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pageLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:withLayer:forType:](PDFPageLayerEffect, "createFlashEffectForPDFLinkAnnotation:withLayer:forType:", v9, v16, 2);

    }
    else if (v13 - v14->longPressGestureStartTime > 0.75 && !v14->didPostPDFExtensionViewAnnotationLongPress)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = CFSTR("annotation");
      v21[1] = CFSTR("location");
      v22[0] = v9;
      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", x, y);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("PDFExtensionViewAnnotationLongPress"), self, v20);

      self->_private->didPostPDFExtensionViewAnnotationLongPress = 1;
    }
  }

}

- (id)_annotationAtGestureLocation:(CGPoint)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  -[PDFViewController _getPagePoint:forGestureLocation:](self, "_getPagePoint:forGestureLocation:", &v7, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "annotationAtPoint:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "scannedAnnotationAtPoint:", v7, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_annotationsForSelection:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(v4, "pages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v9, "indexForPage:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x24BDD15E0]);
      v12 = objc_msgSend(v4, "rangeAtIndex:onPage:", 0, v8);
      v14 = (void *)objc_msgSend(v11, "initWithIndexesInRange:", v12, v13);
      objc_msgSend(v10, "markupAnnotationsForIndexSet:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_getPagePoint:(CGPoint *)a3 forGestureLocation:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0, x, y);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3 && v8)
  {
    objc_msgSend(WeakRetained, "convertPoint:toPage:", v8, x, y);
    a3->x = v10;
    a3->y = v11;
  }

  return v9;
}

- (BOOL)_handleFormFillingEventAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0, x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v6, "isInFormFillingMode") && GetDefaultsWriteAKEnabled())
    {
      objc_msgSend(v6, "insertFormFieldAtBestLocationNearPoint:onPage:", v7, x, y);
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
