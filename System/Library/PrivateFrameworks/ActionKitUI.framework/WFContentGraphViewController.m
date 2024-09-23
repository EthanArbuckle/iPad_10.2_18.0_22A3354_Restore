@implementation WFContentGraphViewController

- (WFContentGraphViewController)initWithContentItem:(id)a3
{
  id v6;
  WFContentGraphViewController *v7;
  WFContentGraphViewController *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentGraphViewController.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContentGraphViewController;
  v7 = -[WFContentGraphViewController init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentItem, a3);
    WFLocalizedString(CFSTR("Content Item Graph"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentGraphViewController setTitle:](v8, "setTitle:", v9);

  }
  return v8;
}

- (BOOL)useSmallBubbles
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (void)loadView
{
  void *v2;
  void *v3;
  void *v4;
  CKForceLayoutAnimator *v5;
  void *v6;
  CKForceLayoutAnimator *v7;
  CKForceLayoutAnimator **p_animator;
  CKForceLayoutAnimator *animator;
  _BOOL4 v10;
  double v11;
  _BOOL4 v12;
  double v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  WFContentItem *contentItem;
  void *v22;
  void *v23;
  void *j;
  uint64_t v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  id *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)WFContentGraphViewController;
  -[WFContentGraphViewController loadView](&v39, sel_loadView);
  -[WFContentGraphViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentGraphViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [CKForceLayoutAnimator alloc];
  -[WFContentGraphViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKForceLayoutAnimator initWithReferenceView:](v5, "initWithReferenceView:", v6);
  p_animator = &self->_animator;
  animator = self->_animator;
  self->_animator = v7;

  v10 = -[WFContentGraphViewController useSmallBubbles](self, "useSmallBubbles");
  v11 = 150.0;
  if (v10)
    v11 = 60.0;
  -[CKForceLayoutAnimator setLinkDistance:](*p_animator, "setLinkDistance:", v11);
  v12 = -[WFContentGraphViewController useSmallBubbles](self, "useSmallBubbles");
  v13 = -5000.0;
  if (v12)
    v13 = -1000.0;
  -[CKForceLayoutAnimator setCharge:](*p_animator, "setCharge:", v13);
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3042000000;
  v36 = __Block_byref_object_copy__4277;
  v37 = __Block_byref_object_dispose__4278;
  v38 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __40__WFContentGraphViewController_loadView__block_invoke;
  v32[3] = &unk_24E343380;
  v32[4] = self;
  v32[5] = &v33;
  v14 = (uint64_t (**)(_QWORD, _QWORD))objc_msgSend(v32, "copy");
  objc_storeWeak(v34 + 5, v14);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[WFContentItem allSupportedItemClasses](self->_contentItem, "allSupportedItemClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x24BE19430];
        contentItem = self->_contentItem;
        v22 = (void *)objc_msgSend(MEMORY[0x24BE193F0], "new");
        objc_msgSend(v20, "searchForCoercingItem:toItemClass:options:", contentItem, v19, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        for (j = 0; ; j = (void *)v25)
        {
          objc_msgSend(v23, "nextPathNode");
          v25 = objc_claimAutoreleasedReturnValue();

          if (!v25)
            break;
          v26 = (id)v14[2](v14, v25);
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v16);
  }

  -[CKForceLayoutAnimator setAlpha:](self->_animator, "setAlpha:", 0.25);
  _Block_object_dispose(&v33, 8);
  objc_destroyWeak(&v38);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContentGraphViewController;
  -[WFContentGraphViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKForceLayoutAnimator start](self->_animator, "start");
}

- (void)viewWillLayoutSubviews
{
  CKForceLayoutAnimator *animator;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFContentGraphViewController;
  -[WFContentGraphViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  animator = self->_animator;
  -[CKForceLayoutAnimator alpha](animator, "alpha");
  -[CKForceLayoutAnimator setAlpha:](animator, "setAlpha:", v4 + 0.100000001);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContentGraphViewController;
  -[WFContentGraphViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[WFContentGraphViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.95);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContentGraphViewController;
  -[WFContentGraphViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKForceLayoutAnimator stop](self->_animator, "stop");
}

- (void)tapNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WFContentGraphViewController *v14;

  v4 = a3;
  -[WFContentGraphViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (!self->_coercing)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", &unk_24E355108);
    objc_msgSend(v7, "setToValue:", &unk_24E355118);
    objc_msgSend(v7, "setDuration:", 0.300000012);
    LODWORD(v8) = 2139095039;
    objc_msgSend(v7, "setRepeatCount:", v8);
    objc_msgSend(v7, "setAutoreverses:", 1);
    objc_msgSend(v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v7, CFSTR("pulsate"));

    self->_coercing = 1;
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__WFContentGraphViewController_tapNode___block_invoke;
    v12[3] = &unk_24E3439C0;
    v13 = v6;
    v14 = self;
    v11 = v6;
    dispatch_async(v10, v12);

  }
}

- (void)done
{
  -[WFContentGraphViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)panNode:(id)a3
{
  id v4;
  uint64_t v5;
  CKForceLayoutAnimator *v6;
  void *v7;
  void *v8;
  CKForceLayoutAnimator *animator;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CKForceLayoutAnimator *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGAffineTransform v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    animator = self->_animator;
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKForceLayoutAnimator releaseNode:](animator, "releaseNode:", v7);
    goto LABEL_6;
  }
  if (v5 == 2)
  {
    -[CKForceLayoutAnimator referenceView](self->_animator, "referenceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v10);
    v12 = v11;
    v14 = v13;

    -[CKForceLayoutAnimator referenceView](self->_animator, "referenceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslation:inView:", v15, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, v12, v14);
    v16 = self->_animator;
    objc_msgSend(v4, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "center");
    -[CKForceLayoutAnimator fixNode:atPosition:](v16, "fixNode:atPosition:", v17, vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, v19), *(float64x2_t *)&v21.a, v20)));

    -[CKForceLayoutAnimator setAlpha:](self->_animator, "setAlpha:", 0.100000001);
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    v6 = self->_animator;
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    -[CKForceLayoutAnimator fixNode:atPosition:](v6, "fixNode:atPosition:", v7);

LABEL_6:
  }
LABEL_8:

}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (CKForceLayoutAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (WFContentCoercionNodeView)rootNodeView
{
  return self->_rootNodeView;
}

- (void)setRootNodeView:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodeView, a3);
}

- (BOOL)coercing
{
  return self->_coercing;
}

- (void)setCoercing:(BOOL)a3
{
  self->_coercing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

void __40__WFContentGraphViewController_tapNode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  objc_msgSend(*(id *)(a1 + 32), "node");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x24BE193F0], "new");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WFContentGraphViewController_tapNode___block_invoke_2;
  v6[3] = &unk_24E3433A8;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "runCoercionWithOptions:completionHandler:", v3, v6);

}

void __40__WFContentGraphViewController_tapNode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WFContentGraphViewController_tapNode___block_invoke_3;
  v11[3] = &unk_24E343AD0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __40__WFContentGraphViewController_tapNode___block_invoke_3(uint64_t a1)
{
  WFContentItemViewController *v2;
  void *v3;
  WFContentItemsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 968) = 0;
    objc_msgSend(*(id *)(a1 + 48), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("pulsate"));

    WFUserInterfaceFromViewController();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentAlert:", v6);

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") != 1)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
      goto LABEL_9;
    v4 = objc_alloc_init(WFContentItemsViewController);
    -[WFContentItemsViewController setContentItems:](v4, "setContentItems:", *(_QWORD *)(a1 + 32));
    if (!v4)
      goto LABEL_9;
LABEL_8:
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v4);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 40), sel_done);
    -[WFContentItemsViewController navigationItem](v4, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    objc_msgSend(v7, "setModalPresentationStyle:", 2);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__WFContentGraphViewController_tapNode___block_invoke_4;
    v13[3] = &unk_24E3439C0;
    v10 = *(void **)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    v15 = v10;
    objc_msgSend(v14, "presentViewController:animated:completion:", v7, 1, v13);

    return;
  }
  v2 = [WFContentItemViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFContentItemViewController initWithContentItem:](v2, "initWithContentItem:", v3);

  if (v4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAnimationForKey:", CFSTR("pulsate"));

}

void __40__WFContentGraphViewController_tapNode___block_invoke_4(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 0;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAnimationForKey:", CFSTR("pulsate"));

}

WFContentCoercionNodeView *__40__WFContentGraphViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  WFContentCoercionNodeView *v7;
  double v8;
  double v9;
  double v10;
  WFContentCoercionNodeView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Width;
  void *v17;
  CGFloat v18;
  double v19;
  void *v20;
  CGFloat Height;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**WeakRetained)(id, void *);
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "nodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __40__WFContentGraphViewController_loadView__block_invoke_2;
    v31[3] = &unk_24E343358;
    v5 = v3;
    v32 = v5;
    objc_msgSend(v4, "objectsPassingTest:", v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (WFContentCoercionNodeView *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *MEMORY[0x24BDBEFB0];
      v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (objc_msgSend(*(id *)(a1 + 32), "useSmallBubbles"))
        v10 = 50.0;
      else
        v10 = 100.0;
      v11 = [WFContentCoercionNodeView alloc];
      objc_msgSend(v5, "parent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WFContentCoercionNodeView initWithFrame:isRootNode:](v11, "initWithFrame:isRootNode:", v12 == 0, v8, v9, v10, v10);

      -[WFContentCoercionNodeView setNode:](v7, "setNode:", v5);
      -[WFContentCoercionNodeView node](v7, "node");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        Width = CGRectGetWidth(v33);
        objc_msgSend(*(id *)(a1 + 32), "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v18 = CGRectGetWidth(v34);
        v19 = Width + (double)arc4random_uniform(v18);
        objc_msgSend(*(id *)(a1 + 32), "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        Height = CGRectGetHeight(v35);
        -[WFContentCoercionNodeView setCenter:](v7, "setCenter:", v19, (double)arc4random_uniform(Height));

      }
      objc_msgSend(*(id *)(a1 + 32), "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v7);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "addNode:", v7);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_tapNode_);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_panNode_);
      -[WFContentCoercionNodeView addGestureRecognizer:](v7, "addGestureRecognizer:", v23);
      -[WFContentCoercionNodeView addGestureRecognizer:](v7, "addGestureRecognizer:", v24);

    }
    -[WFContentCoercionNodeView node](v7, "node");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 992), v7);
    WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 40));
    objc_msgSend(v5, "parent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained[2](WeakRetained, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "linkNode:toNode:", v7, v29);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __40__WFContentGraphViewController_loadView__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    do
    {
      objc_msgSend(v8, "itemOrItemClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", objc_opt_class());

      objc_msgSend(v8, "parent");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    while (v10);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      objc_msgSend(v13, "itemOrItemClass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", objc_opt_class());

      objc_msgSend(v13, "parent");
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
    while (v15);
  }
  objc_msgSend(v5, "node");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "itemOrItemClass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "itemOrItemClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 == objc_opt_class())
    v20 = objc_msgSend(v6, "isEqual:", v11);
  else
    v20 = 0;
  *a3 = v20;

  v21 = *a3;
  return v21;
}

@end
