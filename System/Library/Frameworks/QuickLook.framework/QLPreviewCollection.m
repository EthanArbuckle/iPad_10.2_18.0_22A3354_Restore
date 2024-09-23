@implementation QLPreviewCollection

- (void)updateTransitionWithProgress:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitioningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackedCenter");
  objc_msgSend(v5, "setCenter:");

  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anchorPoint");
  objc_msgSend(v7, "setAnchorPoint:");

  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "trackedTransform");
  else
    memset(v11, 0, sizeof(v11));
  objc_msgSend(v5, "setTransform:", v11);

}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  double MidX;
  CGFloat MidY;
  double v40;
  double v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD v46[3];
  _QWORD v47[5];
  CGRect v48;
  CGRect v49;

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitioningView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLPreviewCollection view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackedVelocity");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "finalAnimationSpringDamping");
  v21 = v20;

  objc_msgSend(v8, "QL_setAnchorPointAndUpdatePosition:", 0.5, 0.5);
  if (a3)
  {
    -[QLPreviewCollection _setUpTransitionDriverForPresenting:duration:](self, "_setUpTransitionDriverForPresenting:duration:", 0, a4);
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "transitionWillFinish:didComplete:", 0, 1);

    }
    -[QLPreviewCollection transitionDriver](self, "transitionDriver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "animateTransition");

  }
  else
  {
    v43 = v16;
    v44 = v14;
    v45 = v12;
    objc_msgSend(v9, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "transitionWillFinish:didComplete:", 0, 0);

    }
    v37 = (void *)MEMORY[0x24BEBDB00];
    v48.origin.x = v27;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    MidX = CGRectGetMidX(v48);
    v49.origin.x = v27;
    v49.origin.y = v29;
    v49.size.width = v31;
    v49.size.height = v33;
    MidY = CGRectGetMidY(v49);
    v40 = *MEMORY[0x24BDBEFB0];
    v41 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __79__QLPreviewCollection_InteractiveTransitions__completeTransition_withDuration___block_invoke;
    v47[3] = &unk_24C724B28;
    v47[4] = self;
    v42 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v46[0] = *MEMORY[0x24BDBD8B8];
    v46[1] = v42;
    v46[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v37, "qlph_animateView:toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:", v8, v46, 0, v47, MidX, MidY, v40, v41, v31, v33, a4, 0.0, v21, v45, v44, v43, v18);
  }

}

void __79__QLPreviewCollection_InteractiveTransitions__completeTransition_withDuration___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionDidFinish:didComplete:", 0, 0);

  }
}

- (void)startNonInteractiveTransitionPresenting:(BOOL)a3
{
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "QLPreviewCollection %@%@ #AppearanceTransition", buf, 0x16u);

  }
  QLRunInMainThread();
}

void __87__QLPreviewCollection_InteractiveTransitions__startNonInteractiveTransitionPresenting___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_setUpTransitionDriverForPresenting:duration:", *(unsigned __int8 *)(a1 + 40), 0.392171552);
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionDidStart:", *(unsigned __int8 *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionWillFinish:didComplete:", *(unsigned __int8 *)(a1 + 40), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "transitionDriver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animateTransition");

}

- (void)_setUpTransitionDriverForPresenting:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  _OWORD v86[3];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v5 = a3;
  v94 = *MEMORY[0x24BDAC8D0];
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v7 = (void *)objc_opt_new();
    -[QLPreviewCollection setTransitionDriver:](self, "setTransitionDriver:", v7);
  }
  else
  {
    -[QLPreviewCollection transitionContext](self, "transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    -[QLPreviewCollection setTransitionDriver:](self, "setTransitionDriver:", v8);

  }
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollection transitionDriver](self, "transitionDriver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v91 = v12;
    v92 = 2112;
    v93 = v13;
    _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "[QLPreviewCollection _setUpTransitionDriverForPresenting:%@] is about to setup a new transition with driver: %@ #AppearanceTransition", buf, 0x16u);

  }
  -[QLPreviewCollection view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTransitionContainer:", v14);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceViewSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceView:", v17);

  -[QLPreviewCollection gestureTracker](self, "gestureTracker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setGestureTracker:", v19);

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transitioningView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDestinationView:", v22);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sourceFrame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSourceViewFrame:", v26, v28, v30, v32);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sourceBounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceViewBounds:", v36, v38, v40, v42);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sourceCenter");
  v46 = v45;
  v48 = v47;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setSourceViewCenter:", v46, v48);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    objc_msgSend(v50, "sourceTransform");
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v87 = 0u;
  }
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v87;
  v86[1] = v88;
  v86[2] = v89;
  objc_msgSend(v52, "setSourceViewTransform:", v86);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isSourceTransformed");
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setIsSourceViewTransformed:", v54);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "uncroppedFrame");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setUncroppedFrame:", v58, v60, v62, v64);

  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setPresenting:", v5);

  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setDuration:", a4);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topNavigationOffset");
  v70 = v69;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setTopNavigationOffset:", v70);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "hostNavigationOffset");
  v74 = v73;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setHostNavigationOffset:", v74);

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "context");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "item");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setTransitionPreviewItem:", v78);

  -[QLPreviewCollection transitionContext](self, "transitionContext");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "previewItemSize");
  v82 = v81;
  v84 = v83;
  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setTransitionPreviewSize:", v82, v84);

}

- (void)_tearDownTransition:(BOOL)a3
{
  QLRunInMainThread();
}

void __67__QLPreviewCollection_InteractiveTransitions___tearDownTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  _OWORD v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transitionDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionDriver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "presenting");

  }
  else
  {
    v4 = 0;
  }

  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromBOOL();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("dismissed");
    if ((_DWORD)v4)
      v10 = CFSTR("presented");
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "[QLPreviewCollection _tearDownTransition: completed: %@] - Is being %@ #AppearanceTransition", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitioningView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);

  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v22[0] = *MEMORY[0x24BDBD8B8];
  v22[1] = v14;
  v22[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v12, "setTransform:", v22);
  objc_msgSend(v12, "setAlpha:", 1.0);
  v15 = *MEMORY[0x24BDBEFB0];
  v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v12, "setBounds:", v15, v16);

  objc_msgSend(v12, "setOrigin:", v15, v16);
  objc_msgSend(*(id *)(a1 + 32), "transitionDriver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tearDown");

  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transitionDidFinish:didComplete:", v4, *(unsigned __int8 *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "setTransitionDriver:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTransitionController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSwipeDownTracker:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPinchRotationTracker:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasTriggeredInteractiveTransitionAnimation:", 0);

}

- (id)gestureTracker
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)rotationOrPinchGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  char v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v4 = a3;
  -[QLPreviewCollection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitioningView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v4;
  v13 = objc_msgSend(v12, "state");
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_27;
      if ((unint64_t)objc_msgSend(v12, "numberOfTouches") < 2)
        goto LABEL_5;
      -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v5);
      objc_msgSend(v21, "trackGestureLocation:");

      -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v12, "rotation");
        objc_msgSend(v22, "trackRotation:");
      }
      else
      {
        objc_msgSend(v12, "scale");
        objc_msgSend(v22, "trackScale:");
      }

      -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "dismissalProgress");
      v46 = v45;

      -[QLPreviewCollection updateTransitionWithProgress:](self, "updateTransitionWithProgress:", v46);
      -[QLPreviewCollection transitionController](self, "transitionController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateTransitionWithProgress:", v46);
    }
    else
    {
      if (v13 != 1 || (isKindOfClass & 1) != 0)
        goto LABEL_27;
      objc_msgSend(v12, "velocity");
      if (v15 <= 0.0)
      {
        -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          v24 = (void *)objc_opt_new();
          -[QLPreviewCollection setPinchRotationTracker:](self, "setPinchRotationTracker:", v24);

          -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setMinimumZoomForDismissal:", 0.9);

          -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setTargetZoom:", 0.1);

          objc_msgSend(v12, "locationInView:", v9);
          v28 = v27;
          v30 = v29;
          -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "center");
          v33 = v32;
          v35 = v34;
          objc_msgSend(v9, "bounds");
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          if (v9)
          {
            objc_msgSend(v9, "transform");
          }
          else
          {
            v51 = 0u;
            v52 = 0u;
            v50 = 0u;
          }
          objc_msgSend(v31, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", &v50, v33, v35, v37, v39, v41, v43, v28, v30);

        }
        -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController", v50, v51, v52);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_opt_respondsToSelector();

        if ((v48 & 1) != 0)
        {
          -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "transitionDidStart:", 0);

        }
        _UIUpdateRequestActivate();
        -[QLPreviewCollection stateManager](self, "stateManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "beginInteractiveTransition");
      }
      else
      {
        -[QLPreviewCollection pinchGesture](self, "pinchGesture");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEnabled:", 0);

        -[QLPreviewCollection rotationGesture](self, "rotationGesture");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setEnabled:", 0);

        -[QLPreviewCollection pinchGesture](self, "pinchGesture");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnabled:", 1);

        -[QLPreviewCollection rotationGesture](self, "rotationGesture");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEnabled:", 1);
      }
    }

    goto LABEL_27;
  }
LABEL_5:
  _UIUpdateRequestDeactivate();
  -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[QLPreviewCollection triggerInteractiveTransitionAnimationIfNeeded](self, "triggerInteractiveTransitionAnimationIfNeeded");
LABEL_27:

}

- (void)slideToDismissGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  _OWORD v52[3];

  v4 = a3;
  -[QLPreviewCollection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitioningView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(v4, "state");
  if ((unint64_t)(v11 - 3) >= 3)
  {
    if (v11 == 2)
    {
      -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_18;
      objc_msgSend(v4, "translationInView:", v5);
      v37 = v36;
      v39 = v38;
      objc_msgSend(v4, "velocityInView:", v5);
      v41 = v40;
      v43 = v42;
      -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "trackGestureTranslation:velocity:", v37, v39, v41, v43);

      -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "dismissalProgress");
      v47 = v46;

      -[QLPreviewCollection updateTransitionWithProgress:](self, "updateTransitionWithProgress:", v47);
      -[QLPreviewCollection transitionController](self, "transitionController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "updateTransitionWithProgress:", v47);
    }
    else
    {
      if (v11 != 1)
        goto LABEL_18;
      objc_msgSend(v4, "locationInView:", v5);
      v14 = v13;
      v16 = v15;
      objc_msgSend(v4, "translationInView:", v5);
      v18 = v14 - v17;
      v20 = v16 - v19;
      v21 = (void *)objc_opt_new();
      -[QLPreviewCollection setSwipeDownTracker:](self, "setSwipeDownTracker:", v21);

      -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "center");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v9, "bounds");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      if (v9)
        objc_msgSend(v9, "transform");
      else
        memset(v52, 0, sizeof(v52));
      objc_msgSend(v22, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", v52, v24, v26, v28, v30, v32, v34, v18, v20);

      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_opt_respondsToSelector();

      if ((v50 & 1) != 0)
      {
        -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "transitionDidStart:", 0);

      }
      _UIUpdateRequestActivate();
      -[QLPreviewCollection stateManager](self, "stateManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "beginInteractiveTransition");
    }

    goto LABEL_18;
  }
  _UIUpdateRequestDeactivate();
  -[QLPreviewCollection swipeDownTracker](self, "swipeDownTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[QLPreviewCollection triggerInteractiveTransitionAnimationIfNeeded](self, "triggerInteractiveTransitionAnimationIfNeeded");
LABEL_18:

}

+ (id)quickLookExtension
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSObject **v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)quickLookExtension_quickLookExtension;
  if (!quickLookExtension_quickLookExtension)
  {
    v3 = *MEMORY[0x24BE7C058];
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v3, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    v6 = v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 0;
    if (v7)
    {
      objc_storeStrong((id *)&quickLookExtension_quickLookExtension, v4);
    }
    else
    {
      v8 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v10 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v8 = *v10;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_FAULT, "Failed to get the QuickLook extension (error %@) #Discovery", buf, 0xCu);
      }
    }

    v2 = (void *)quickLookExtension_quickLookExtension;
  }
  return v2;
}

+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[QLPreviewCollection quickLookExtension](QLPreviewCollection, "quickLookExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C725928;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v6);

}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x24BE7BF48];
    v11 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_FAULT, "Error while attempting to instantiate view controller with input items: %@ #Remote", buf, 0xCu);
    }
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_370;
    v25 = &unk_24C725870;
    v26 = *(id *)(a1 + 32);
    QLRunInMainThread();
    v12 = v26;
  }
  else
  {
    v13 = v8;
    objc_msgSend(v13, "setIsAvailable:", 1);
    +[QLPreviewCollection quickLookExtension](QLPreviewCollection, "quickLookExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_extensionContextForUUID:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setHostContext:", v12);
    objc_msgSend(v13, "hostContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[QLNotificationCenter sharedInstance](QLNotificationCenter, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNotificationCenter:", v16);

    objc_msgSend(v13, "hostContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getNetworkObserverWithCompletionBlock:", &__block_literal_global_373);

    objc_msgSend(v13, "setRequest:", v7);
    objc_msgSend(v13, "configureAsAccessoryViewContainerForPreviewCollection:", 0);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_24C725900;
    v20 = v13;
    v21 = *(id *)(a1 + 32);
    v18 = v13;
    objc_msgSend(v18, "getPreviewCollectionUUIDWithCompletionHandler:", v19);

  }
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_370(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v3, "setView:", v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BE7BFB0];
  v3 = a2;
  objc_msgSend(v2, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObserver:", v3);

}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  +[QLPreviewCollection quickLookExtension](QLPreviewCollection, "quickLookExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_24C7258D8;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_instantiateAccessoryViewControllerWithInputItems:connectionHandler:", 0, v6);

}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x24BE7BF48];
    v11 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_FAULT, "Error while attempting to instantiate view controller for the accessory view: %@ #Remote", (uint8_t *)&v15, 0xCu);
    }
  }
  v12 = v8;
  +[QLPreviewCollection quickLookExtension](QLPreviewCollection, "quickLookExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_extensionContextForUUID:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHostContext:", v14);
  objc_msgSend(v12, "configureAsAccessoryViewContainerForPreviewCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v12, "setRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setAccessoryViewController:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)previewCollectionClassName
{
  return CFSTR("QLPreviewCollection");
}

+ (id)previewCollectionWithClassName:(id)a3
{
  NSClassFromString((NSString *)a3);
  return (id)objc_opt_new();
}

+ (void)previewCollectionUsingRemoteViewController:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = a4;
  if (v4)
  {
    if (_os_feature_enabled_impl())
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke;
      v11[3] = &unk_24C727018;
      v12 = v5;
      +[QLRemoteUIHostViewController remotePreviewCollectionWithCompletionHandler:](_TtC9QuickLook28QLRemoteUIHostViewController, "remotePreviewCollectionWithCompletionHandler:", v11);
      v6 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke_2;
      v9[3] = &unk_24C727040;
      v10 = v5;
      +[QLPreviewCollection remotePreviewCollectionWithCompletionHandler:](QLPreviewCollection, "remotePreviewCollectionWithCompletionHandler:", v9);
      v6 = v10;
    }

  }
  else
  {
    +[QLPreviewCollection previewCollectionClassName](QLPreviewCollection, "previewCollectionClassName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v7);
    v8 = (void *)objc_opt_new();
    (*((void (**)(id, void *))v5 + 2))(v5, v8);

  }
}

uint64_t __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (QLPreviewCollection)init
{
  QLPreviewCollection *v2;
  QLPageViewController *v3;
  void *v4;
  QLPageViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  QLPreviewItemStore *itemStore;
  void *v30;
  QLPreviewCollection *v31;
  objc_super v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)QLPreviewCollection;
  v2 = -[QLPreviewCollection init](&v33, sel_init);
  if (v2)
  {
    v3 = [QLPageViewController alloc];
    v38 = *MEMORY[0x24BEBE5E8];
    v39[0] = &unk_24C749570;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[QLPageViewController initWithTransitionStyle:navigationOrientation:options:](v3, "initWithTransitionStyle:navigationOrientation:options:", 1, 0, v4);
    -[QLPreviewCollection setPageViewController:](v2, "setPageViewController:", v5);

    v2->_currentItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v2);

    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIndexedDataSource:", v2);

    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParallaxIntensity:", 0.15);

    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollection addChildViewController:](v2, "addChildViewController:", v9);

    -[QLPreviewCollection view](v2, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v12);

    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didMoveToParentViewController:", v2);

    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[QLPreviewCollection view](v2, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1628];
    v36 = CFSTR("pageViewController");
    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[pageViewController]|"), 0, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addConstraints:", v21);

    -[QLPreviewCollection view](v2, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD1628];
    v34 = CFSTR("pageViewController");
    -[QLPreviewCollection pageViewController](v2, "pageViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[pageViewController]|"), 0, 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addConstraints:", v27);

    v28 = objc_opt_new();
    itemStore = v2->_itemStore;
    v2->_itemStore = (QLPreviewItemStore *)v28;

    -[QLPreviewCollection _installGestures](v2, "_installGestures");
    -[QLPreviewCollection setAutomaticallyAdjustsScrollViewInsets:](v2, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollection setUuid:](v2, "setUuid:", v30);

    v31 = v2;
  }

  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection loadView](&v5, sel_loadView);
  -[QLPreviewCollection view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!self->_previewCollectionIsPartOfViewHierarchy)
  {
    self->_previewCollectionIsPartOfViewHierarchy = 1;
    -[QLPreviewCollection setCurrentPreviewItemIndex:animated:](self, "setCurrentPreviewItemIndex:animated:", self->_currentItemIndex, 0);
  }
  if (_os_feature_enabled_impl()
    && !-[QLPreviewCollection isPresenting](self, "isPresenting")
    && !-[QLPreviewCollection isDismissing](self, "isDismissing"))
  {
    -[QLPreviewCollection setIsPresenting:](self, "setIsPresenting:", 1);
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "transitionDidStart:", -[QLPreviewCollection isPresenting](self, "isPresenting"));

      }
    }
    else
    {
      self->_previewItemControllerMissedTransitionStart = 1;
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[QLPreviewCollection updateCurrentPreviewConfiguration](self, "updateCurrentPreviewConfiguration");
  if (_os_feature_enabled_impl()
    && (-[QLPreviewCollection isPresenting](self, "isPresenting")
     || -[QLPreviewCollection isDismissing](self, "isDismissing")))
  {
    v4 = -[QLPreviewCollection isPresenting](self, "isPresenting");
    v5 = -[QLPreviewCollection isDismissing](self, "isDismissing") ^ 1;
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transitionWillFinish:didComplete:", v4, v5);

    }
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionDidFinish:didComplete:", v4, v5);

    }
    -[QLPreviewCollection setIsPresenting:](self, "setIsPresenting:", 0);
    -[QLPreviewCollection setIsDismissing:](self, "setIsDismissing:", 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (_os_feature_enabled_impl()
    && !-[QLPreviewCollection isPresenting](self, "isPresenting")
    && !-[QLPreviewCollection isDismissing](self, "isDismissing"))
  {
    -[QLPreviewCollection setIsDismissing:](self, "setIsDismissing:", 1);
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transitionDidStart:", -[QLPreviewCollection isPresenting](self, "isPresenting"));

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  self->_previewCollectionIsPartOfViewHierarchy = 0;
  if (_os_feature_enabled_impl()
    && (-[QLPreviewCollection isPresenting](self, "isPresenting")
     || -[QLPreviewCollection isDismissing](self, "isDismissing")))
  {
    v4 = -[QLPreviewCollection isPresenting](self, "isPresenting");
    v5 = -[QLPreviewCollection isDismissing](self, "isDismissing");
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transitionWillFinish:didComplete:", v4, v5);

    }
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionDidFinish:didComplete:", v4, v5);

    }
    -[QLPreviewCollection setIsPresenting:](self, "setIsPresenting:", 0);
    -[QLPreviewCollection setIsDismissing:](self, "setIsDismissing:", 0);
  }
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __64__QLPreviewCollection_hostViewControllerBackgroundColorChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "currentPreviewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostViewControllerBackgroundColorChanged:", *(_QWORD *)(a1 + 40));

  }
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  QLRunInMainThread();
}

uint64_t __67__QLPreviewCollection_hostViewControlerTransitionToState_animated___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreviewVisibility:", *(unsigned __int8 *)(a1 + 48));
}

- (void)_updatePreviewVisibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  switch(self->_visibilityState)
  {
    case 0uLL:
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "previewDidDisappear:", v3);

      -[QLPreviewCollection _cleanAccessoryViewContainer](self, "_cleanAccessoryViewContainer");
      return;
    case 1uLL:
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewWillDisappear:", v3);
      goto LABEL_6;
    case 2uLL:
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewDidAppear:", v3);
      goto LABEL_6;
    case 3uLL:
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewWillAppear:", v3);
LABEL_6:

      break;
    default:
      return;
  }
}

- (void)updateCurrentPreviewConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[QLPreviewCollection stateManager](self, "stateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateKeyCommands");

  -[QLPreviewCollection _updateOverlay:](self, "_updateOverlay:", 1);
  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPage");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[QLPreviewCollection _updateFullscreenBackgroundColor](self, "_updateFullscreenBackgroundColor");
  -[QLPreviewCollection _updateFullscreen](self, "_updateFullscreen");
  -[QLPreviewCollection _updateAccessoryViewWithPreviewItemViewController:](self, "_updateAccessoryViewWithPreviewItemViewController:", v10);
  -[QLPreviewCollection _updateWhitePointAdaptivityStyle](self, "_updateWhitePointAdaptivityStyle");
  -[QLPreviewCollection _updatePrinter](self, "_updatePrinter");
  -[QLPreviewCollection _updateTitleFromController](self, "_updateTitleFromController");
  -[QLPreviewCollection _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pinchGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requireGestureRecognizerToFail:", self->_pinchGesture);

  }
}

- (void)setRemoteAccessoryContainer:(id)a3
{
  objc_storeWeak((id *)&self->_remoteAccessoryViewContainer, a3);
}

- (id)accessoryView
{
  UIView **p_remoteAccessoryViewContainer;
  void *WeakRetained;
  void *localAccessoryViewContainer;
  void *v6;
  id v7;
  UIView *v9;

  p_remoteAccessoryViewContainer = &self->_remoteAccessoryViewContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAccessoryViewContainer);
  if (WeakRetained)
    goto LABEL_2;
  if (!self->_localAccessoryViewContainer)
  {
    v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    WeakRetained = self->_localAccessoryViewContainer;
    self->_localAccessoryViewContainer = v9;
LABEL_2:

  }
  localAccessoryViewContainer = objc_loadWeakRetained((id *)p_remoteAccessoryViewContainer);
  v6 = localAccessoryViewContainer;
  if (!localAccessoryViewContainer)
    localAccessoryViewContainer = self->_localAccessoryViewContainer;
  v7 = localAccessoryViewContainer;

  return v7;
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)isAvailable
{
  return 1;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  self->_allowInteractiveTransitions = a3;
}

- (void)setFullScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (-[QLAppearance presentationMode](self->_appearance, "presentationMode") != 4
    && -[QLAppearance presentationMode](self->_appearance, "presentationMode") != 3
    && -[QLAppearance presentationMode](self->_appearance, "presentationMode") != 5)
  {
    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canEnterFullScreen");

    v8 = v7 & v3;
    if (self->_fullScreen != v8)
    {
      self->_fullScreen = v8;
      -[QLPreviewCollection stateManager](self, "stateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFullScreen:", v8);

      -[QLPreviewCollection pageViewController](self, "pageViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentPage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "previewBecameFullScreen:animated:", v8, 1);

      -[QLPreviewCollection stateManager](self, "stateManager");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateKeyCommands");

    }
  }
}

- (void)setScreenEdgePanWidth:(double)a3
{
  NSObject **v4;
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "QLPreviewCollection's edge pan gesture region width has been set to %f #PreviewCollection", (uint8_t *)&v6, 0xCu);
  }
}

- (QLItemViewController)currentPreviewItemViewController
{
  void *v2;
  void *v3;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (QLItemViewController *)v3;
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_24C725740;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "prepareForInvalidationWithCompletionHandler:", v5);

}

void __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  QLRunInMainThread();

}

uint64_t __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1128);
  *(_QWORD *)(v3 + 1128) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded");
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded
{
  id prepareForInvalidationCompletionHandler;
  id v4;
  void (**v5)(void);

  if (!-[QLPreviewCollection _isBeingDismissed](self, "_isBeingDismissed"))
  {
    prepareForInvalidationCompletionHandler = self->_prepareForInvalidationCompletionHandler;
    if (prepareForInvalidationCompletionHandler)
    {
      v5 = (void (**)(void))objc_msgSend(prepareForInvalidationCompletionHandler, "copy");
      v4 = self->_prepareForInvalidationCompletionHandler;
      self->_prepareForInvalidationCompletionHandler = 0;

      v5[2]();
    }
  }
}

- (NSString)hostApplicationBundleIdentifier
{
  NSString *hostApplicationBundleIdentifier;
  NSObject **v4;
  NSObject *v5;
  NSString *v6;
  NSString *v7;
  uint8_t v9[16];

  hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  if (!hostApplicationBundleIdentifier)
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "hostApplicationBundleIdentifier getting accessed before being set, should not happen in QuickLookUIExtension. Trying best effort to determine identifier with entitlement. #PreviewCollection", v9, 2u);
    }
    +[QLUtilitiesInternal getCurrentApplicationBundleIdentifier](QLUtilitiesInternal, "getCurrentApplicationBundleIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hostApplicationBundleIdentifier;
    self->_hostApplicationBundleIdentifier = v6;

    hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  }
  return hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, a3);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  -[QLPreviewCollection configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:](self, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, a5, a6, 0);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v11 = a6;
  v9 = v11;
  v10 = v8;
  QLRunInMainThread();

}

void __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setItemProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "reloadWithNumberOfPreviewItems:", *(_QWORD *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 64) > 1;
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setStateManager:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearInternalCache");

  objc_msgSend(*(id *)(a1 + 32), "setCurrentPreviewItemIndex:animated:", *(_QWORD *)(a1 + 56), 0);
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[1065])
  {
    v6[1065] = 0;
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = *(_BYTE **)(a1 + 32);
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "currentPreviewItemViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transitionDidStart:", objc_msgSend(*(id *)(a1 + 32), "isPresenting"));

      v6 = *(_BYTE **)(a1 + 32);
    }
  }
  objc_msgSend(v6, "setShouldStartFullScreen:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke_2;
  v11[3] = &unk_24C724B00;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "isReadyForDisplayWithCompletionHandler:", v11);

}

void __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPreviewItemViewControllerIsReadyForDisplay");

}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  QLRunInMainThread();
}

uint64_t __59__QLPreviewCollection_setCurrentPreviewItemIndex_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsEditing:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentPreviewItemIndex:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  NSObject **v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _BOOL8 v8;
  NSObject **v11;
  id v12;
  __int16 v13;
  uint8_t buf[2];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "QLPreviewCollection has no current index set yet, so it can't start loading previews. #PreviewCollection";
      v7 = buf;
LABEL_6:
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
  }
  else
  {
    v8 = a4;
    if (self->_previewCollectionIsPartOfViewHierarchy || (_os_feature_enabled_impl() & 1) != 0)
    {
      -[QLPreviewCollection pageViewController](self, "pageViewController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCurrentPageIndex:animated:", a3, v8);

      return;
    }
    v11 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v11;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v6 = "QLPreviewCollection is not part of the view hierarchy, so it can't start loading previews. #PreviewCollection";
      v7 = (uint8_t *)&v13;
      goto LABEL_6;
    }
  }
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (-[QLPreviewCollection _isBeingPresented](self, "_isBeingPresented"))
    UIAccessibilityIsReduceMotionEnabled();
  v6 = v5;
  QLRunInMainThread();

}

void __46__QLPreviewCollection_setAppearance_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1040), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAppearance:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  id v4[2];
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(v4, &location);
  v4[1] = (id)a3;
  QLRunInMainThread();
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __60__QLPreviewCollection_notifyFirstTimeAppearanceWithActions___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject **v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "notifyFirstTimeAppearanceWithActions #PreviewCollection", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLoaded");
  v7 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v5, "performFirstTimeAppearanceActionsIfNeeded:", v7);
    WeakRetained[135] = 0;
    if ((*(_BYTE *)(a1 + 48) & 4) == 0 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "presentationMode") == 2)
      objc_msgSend(*(id *)(a1 + 32), "setFullScreen:", objc_msgSend(*(id *)(a1 + 32), "shouldStartFullScreen"));
  }
  else
  {
    WeakRetained[135] = v7;
  }

}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __54__QLPreviewCollection_notifyStateRestorationUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isLoaded"))
    objc_msgSend(v2, "notifyStateRestorationWithUserInfoIfNeeded:", *(_QWORD *)(a1 + 40));

}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v5;
  v7 = v8;
  QLRunInMainThread();

}

void __78__QLPreviewCollection_toolbarButtonsForTraitCollection_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "toolbarButtonsForTraitCollection:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedToolbarButtonIdentifiersForTraitCollection:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  QLRunInMainThread();

}

void __76__QLPreviewCollection_toolbarButtonPressedWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "pageViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_INFO, "Notifying current item view controller: %@ about button pressed with identifier: %@. #PreviewCollection", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "pageViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentPage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonPressedWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThread();

}

void __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentPageIndex");

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_44;
    v9[3] = &unk_24C727090;
    v10 = *(id *)(a1 + 40);
    v11 = v3;
    objc_msgSend(v5, "savePreviewEditedCopyWithCompletionHandler:", v9);

  }
  else
  {
    v6 = (NSObject **)MEMORY[0x24BE7BF48];
    v7 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "QLPreviewCollection has no current item, could not save current preview edits #PreviewCollection", buf, 2u);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 0x7FFFFFFFFFFFFFFFLL, 0);
  }

}

uint64_t __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 40), a2);
  return result;
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __78__QLPreviewCollection_prepareForActionSheetPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, "currentPreviewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForActionSheetPresentation");

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)actionSheetDidDismiss
{
  QLRunInMainThread();
}

void __44__QLPreviewCollection_actionSheetDidDismiss__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "currentPreviewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionSheetDidDismiss");

  }
}

- (void)hostSceneWillDeactivate
{
  QLRunInMainThread();
}

void __46__QLPreviewCollection_hostSceneWillDeactivate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "currentPreviewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostSceneWillDeactivate");

  }
}

- (void)documentMenuActionWillBegin
{
  QLRunInMainThread();
}

void __50__QLPreviewCollection_documentMenuActionWillBegin__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "currentPreviewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentMenuActionWillBegin");

  }
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  QLRunInMainThread();
}

void __57__QLPreviewCollection_hostApplicationDidEnterBackground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, "currentPreviewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostApplicationDidEnterBackground:", v6);

  }
}

- (void)hostApplicationDidBecomeActive
{
  QLRunInMainThread();
}

void __53__QLPreviewCollection_hostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "currentPreviewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostApplicationDidBecomeActive");

  }
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  id v5;

  v4 = (void (**)(id, uint64_t))a3;
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, objc_msgSend(v5, "canBeLocked"));

}

- (void)requestLockForCurrentItem
{
  QLRunInMainThread();
}

void __48__QLPreviewCollection_requestLockForCurrentItem__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestLockForCurrentItem");

}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;
  _QWORD v22[4];
  id v23;
  unint64_t v24;

  v8 = a3;
  v9 = a5;
  gotLoadHelper_x20__OBJC_CLASS___PHPhotoLibrary(v10);
  objc_msgSend(*(id *)(v5 + 1520), "systemPhotoLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 1520)), "initWithPhotoLibraryURL:", v11);
  objc_msgSend(v8, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "startAccessingSecurityScopedResource");
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke;
  v22[3] = &unk_24C724CD0;
  v23 = v8;
  v24 = a4;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke_2;
  v18[3] = &unk_24C7270B8;
  v21 = v14;
  v19 = v13;
  v20 = v9;
  v15 = v9;
  v16 = v13;
  v17 = v8;
  objc_msgSend(v12, "performChanges:completionHandler:", v22, v18);

}

void __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double Helper_x8__OBJC_CLASS___PHAssetCreationRequest;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = *(_QWORD *)(a1 + 40);
  switch(v3)
  {
    case 1:
      Helper_x8__OBJC_CLASS___PHAssetCreationRequest = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v10 + 1208), "creationRequestForAsset", Helper_x8__OBJC_CLASS___PHAssetCreationRequest);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      v8 = 2;
      break;
    case 3:
      v11 = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v12 + 1208), "creationRequestForAsset", v11);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v13);
      v15 = objc_alloc(*(Class *)(v14 + 1144));
      objc_msgSend(*(id *)(a1 + 32), "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v15, "initWithBundleAtURL:", v16);

      objc_msgSend(v6, "imagePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v6, "imagePath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileURLWithPath:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addResourceWithType:fileURL:options:", 1, v20, 0);
      }
      objc_msgSend(v6, "videoPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v6, "videoPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fileURLWithPath:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addResourceWithType:fileURL:options:", 9, v24, 0);
      }
      goto LABEL_11;
    case 2:
      v4 = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v5 + 1208), "creationRequestForAsset", v4);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      v8 = 1;
      break;
    default:
      return;
  }
  objc_msgSend(v7, "addResourceWithType:fileURL:options:", v8, v6, 0);
LABEL_11:

}

void __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[QLPreviewCollection forwardPressesToHostIfNeeded:](self, "forwardPressesToHostIfNeeded:", v7);
  v8.receiver = self;
  v8.super_class = (Class)QLPreviewCollection;
  -[QLPreviewCollection pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v7, v6);

}

- (void)forwardPressesToHostIfNeeded:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  const char *v7;
  NSObject **v8;
  _QWORD v9[4];
  id v10;
  QLPreviewCollection *v11;
  uint8_t buf[16];

  v4 = a3;
  if (-[QLPreviewCollection isFirstResponderTextEntry](self, "isFirstResponderTextEntry"))
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Not propagating presses from service to host since they're in a text entry #Remote";
LABEL_11:
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    }
  }
  else
  {
    if (!-[QLPreviewCollection isFirstResponderKeyInput](self, "isFirstResponderKeyInput"))
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __52__QLPreviewCollection_forwardPressesToHostIfNeeded___block_invoke;
      v9[3] = &unk_24C726BE8;
      v10 = v4;
      v11 = self;
      -[QLPreviewCollection keyCommandsWithCompletionHandler:](self, "keyCommandsWithCompletionHandler:", v9);

      goto LABEL_13;
    }
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      v8 = (NSObject **)MEMORY[0x24BE7BF48];
      QLSInitLogging();
      v6 = *v8;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Not propagating presses from service to host since a UIKeyInput (e.g., text field) is first responder #Remote";
      goto LABEL_11;
    }
  }
LABEL_13:

}

void __52__QLPreviewCollection_forwardPressesToHostIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "key", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "forwardKeyPressToHostIfNeeded:serviceCommands:", v10, v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)isFirstResponderTextEntry
{
  void *v2;
  char v3;

  -[QLPreviewCollection firstResponder](self, "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_254A1B148);

  return v3;
}

- (BOOL)isFirstResponderKeyInput
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "conformsToProtocol:", &unk_254A1B148);
  return (char)v2;
}

- (void)forwardKeyPressToHostIfNeeded:(id)a3 serviceCommands:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  NSObject **v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject **v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  QLPreviewCollection *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v36 = v6;
  objc_msgSend(v6, "charactersIgnoringModifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v34 = self;
    v35 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v15 = objc_msgSend(v36, "modifierFlags");
          objc_msgSend(v14, "keyCommand");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "input");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqualToString:", v17))
          {
            v18 = v9;
            v19 = objc_msgSend(v16, "modifierFlags");

            v20 = v15 == v19;
            v9 = v18;
            if (v20)
            {
              v25 = objc_msgSend(v16, "modifierFlags");
              v26 = (NSObject **)MEMORY[0x24BE7BF48];
              v27 = *MEMORY[0x24BE7BF48];
              if (v25)
              {
                if (!v27)
                {
                  QLSInitLogging();
                  v27 = *v26;
                }
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  v28 = v27;
                  objc_msgSend(v36, "description");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "description");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v42 = v29;
                  v43 = 2112;
                  v44 = v30;
                  _os_log_impl(&dword_20D4F5000, v28, OS_LOG_TYPE_INFO, "Service ignores key press (%@) with key command (%@) since keycommands with modifiers is already sent to and handled by the host #Remote", buf, 0x16u);

                  v9 = v18;
                }
              }
              else
              {
                if (!v27)
                {
                  QLSInitLogging();
                  v27 = *v26;
                }
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  v31 = v27;
                  objc_msgSend(v36, "description");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "description");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v42 = v32;
                  v43 = 2112;
                  v44 = v33;
                  _os_log_impl(&dword_20D4F5000, v31, OS_LOG_TYPE_INFO, "Service will directly handle key press (%@) with key command (%@) since it has no modifier #Remote", buf, 0x16u);

                  v9 = v18;
                }
                -[QLPreviewCollection keyCommandWasPerformed:](v34, "keyCommandWasPerformed:", v14);
              }
              goto LABEL_29;
            }
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v11)
          continue;
        break;
      }
    }

    v21 = (NSObject **)MEMORY[0x24BE7BF48];
    v22 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      objc_msgSend(v36, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v24;
      _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_INFO, "Propagating unhandled key press from service to host: (%@) #Remote", buf, 0xCu);

    }
    -[QLPreviewCollection stateManager](v34, "stateManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "charactersIgnoringModifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleKeyPressWithInput:modifierFlags:", v16, objc_msgSend(v36, "modifierFlags"));
LABEL_29:
    v7 = v35;

  }
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __56__QLPreviewCollection_keyCommandsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_defaultKeyCommands");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredKeyCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

}

- (id)_defaultKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "canEnterFullScreen"))
    goto LABEL_4;
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canToggleFullScreen");

  if (v6)
  {
    -[QLPreviewCollection fullScreen](self, "fullScreen");
    QLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 1310720, sel__toggleFullscreenIfPossible);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoverabilityTitle:", v4);
    objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v7, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

LABEL_4:
  }
  return v3;
}

- (void)keyCommandWasPerformed:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __46__QLPreviewCollection_keyCommandWasPerformed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "keyCommandIdentifier");
  v3 = *(void **)(a1 + 40);
  if (v2 == 5)
  {
    objc_msgSend(v3, "_toggleFullscreenIfPossible");
  }
  else
  {
    objc_msgSend(v3, "pageViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentPage");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentPreviewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlePerformedKeyCommandIfNeeded:", *(_QWORD *)(a1 + 32));

  }
}

- (void)triggerInteractiveTransitionAnimationIfNeeded
{
  QLRunInMainThread();
}

void __68__QLPreviewCollection_triggerInteractiveTransitionAnimationIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject **v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 || (objc_msgSend(*(id *)(a1 + 32), "hasTriggeredInteractiveTransitionAnimation") & 1) != 0)
    return;
  objc_msgSend(*(id *)(a1 + 32), "slideGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 1)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "slideGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 2)
  {
LABEL_7:

LABEL_8:
LABEL_9:
    v6 = (NSObject **)MEMORY[0x24BE7BF48];
    v7 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "QLPreviewCollection will not trigger interactive transition because gesture is still active. #AppearanceTransition", (uint8_t *)&v21, 2u);
    }
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "pinchGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "state") == 1)
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "pinchGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pinchGesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfTouches");

    if (v10 > 1)
      goto LABEL_9;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "setHasTriggeredInteractiveTransitionAnimation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "gestureTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldFinishDismissal");

  v13 = (NSObject **)MEMORY[0x24BE7BF48];
  v14 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    NSStringFromBOOL();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v16;
    _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_INFO, "QLPreviewCollection is triggering interactive transition (finished: %@) #AppearanceTransition", (uint8_t *)&v21, 0xCu);

  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v17, "gestureTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finalAnimationDuration");
  objc_msgSend(v17, "completeTransition:withDuration:", v12);

  objc_msgSend(*(id *)(a1 + 32), "transitionController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gestureTracker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "finalAnimationDuration");
  objc_msgSend(v19, "completeTransition:withDuration:", v12);

}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  id v11;
  NSObject **v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a7;
  v12 = (NSObject **)MEMORY[0x24BE7BF48];
  v13 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    NSStringFromBOOL();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_INFO, "QLPreviewCollection is preparing for transition (presenting: %@, interactive: %@) #AppearanceTransition", buf, 0x16u);

  }
  v20 = v9;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  QLRunInMainThread();

}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void **v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  id v15;
  id v16;
  char v17;
  id from;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  __int16 v24;
  id location;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setEnabled:", 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_2;
  aBlock[3] = &unk_24C7270E0;
  objc_copyWeak(&v23, &location);
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v24 = *(_WORD *)(a1 + 64);
  v22 = *(id *)(a1 + 56);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (*(_BYTE *)(a1 + 65))
    objc_msgSend(*(id *)(a1 + 32), "updateCurrentPreviewConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void **)MEMORY[0x24BE7BF48];
  v6 = (void *)*MEMORY[0x24BE7BF48];
  if (v4)
  {
    if (!v6)
    {
      QLSInitLogging();
      v6 = *v5;
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "QLPreviewCollection is waiting for preview controller to call ready block (presenting: %@). #AppearanceTransition", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v9);

    objc_initWeak(&from, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_198;
    v13[3] = &unk_24C727108;
    objc_copyWeak(&v15, &from);
    v17 = *(_BYTE *)(a1 + 65);
    objc_copyWeak(&v16, (id *)buf);
    v14 = v3;
    objc_msgSend(v10, "isReadyForDisplayWithCompletionHandler:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (!v6)
    {
      QLSInitLogging();
      v6 = *v5;
    }
    v11 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "QLPreviewCollection is calling ready block right away (presenting: %@). #AppearanceTransition", buf, 0xCu);

    }
    v3[2](v3);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  __int16 v6;

  objc_copyWeak(&v5, (id *)(a1 + 56));
  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v6 = *(_WORD *)(a1 + 64);
  v4 = *(id *)(a1 + 48);
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

uint64_t __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setTransitionController:", v2);

  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setTransitionContext:", v5);

  LODWORD(v6) = *(unsigned __int8 *)(a1 + 64);
  v7 = objc_loadWeakRetained(v3);
  v8 = v7;
  if ((_DWORD)v6)
    objc_msgSend(v7, "triggerInteractiveTransitionAnimationIfNeeded");
  else
    objc_msgSend(v7, "startNonInteractiveTransitionPresenting:", *(unsigned __int8 *)(a1 + 65));

  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_198(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "currentPreviewItemViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v5 == v6)
      objc_msgSend(v3, "updateCurrentPreviewConfiguration");
  }
  v7 = (NSObject **)MEMORY[0x24BE7BF48];
  v8 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_INFO, "QLPreviewCollection is calling ready block now that its current preview controller is ready (presenting: %@). #AppearanceTransition", (uint8_t *)&v11, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)tearDownTransition:(BOOL)a3
{
  QLRunInMainThread();
}

uint64_t __42__QLPreviewCollection_tearDownTransition___block_invoke(uint64_t a1)
{
  int v2;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setEnabled:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isBeingDismissed");
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    NSStringFromBOOL();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("presented");
    if (v2)
      v8 = CFSTR("dismissed");
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "[QLPreviewCollection tearDownTransition: didComplete: %@] - Is being %@ #AppearanceTransition", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_tearDownTransition:", *(unsigned __int8 *)(a1 + 40));
  if (*(_BYTE *)(a1 + 40))
    v9 = v2;
  else
    v9 = 0;
  if (v9 == 1)
    objc_msgSend(*(id *)(a1 + 32), "setFullScreen:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded");
}

- (BOOL)transitionInProgress
{
  void *v2;
  BOOL v3;

  -[QLPreviewCollection transitionController](self, "transitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)pinchDismissGestureInProgress
{
  void *v2;
  BOOL v3;

  -[QLPreviewCollection pinchRotationTracker](self, "pinchRotationTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isBeingDismissed
{
  void *v3;
  void *v4;
  int v5;

  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLPreviewCollection transitionDriver](self, "transitionDriver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "presenting") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isBeingPresented
{
  void *v3;
  void *v4;
  char v5;

  -[QLPreviewCollection transitionDriver](self, "transitionDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLPreviewCollection transitionDriver](self, "transitionDriver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "presenting");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setLoadingString:(id)a3
{
  objc_storeStrong((id *)&self->_loadingString, a3);
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, a3);
}

- (NSString)parentApplicationDisplayIdentifier
{
  void *v3;
  NSString *v4;

  -[QLPreviewCollection hostApplicationBundleIdentifier](self, "hostApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."))
    && -[NSString hasPrefix:](self->_overrideParentApplicationDisplayIdentifier, "hasPrefix:", CFSTR("com.apple.")))
  {
    v4 = self->_overrideParentApplicationDisplayIdentifier;

    v3 = v4;
  }
  return (NSString *)v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  uint64_t v4;

  if (a3)
    v4 = 2;
  else
    v4 = 1;
  -[QLPreviewCollection _setDragDataOwner:](self, "_setDragDataOwner:", v4);
  -[QLPreviewCollection _setDataOwnerForCopy:](self, "_setDataOwnerForCopy:", v4);
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updatePreviewItemDisplayState:", v5);
}

- (BOOL)_isVisible
{
  return self->_visibilityState == 2;
}

- (void)_updatePreferredContentSize
{
  void *v3;
  void *v4;
  id v5;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isLoading") & 1) == 0)
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSize");
    objc_msgSend(v4, "updatePreferredContentSize:");

  }
}

- (void)_updateFullscreenBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isLoading") & 1) == 0 && objc_msgSend(v6, "isLoaded"))
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullscreenBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFullscreenBackgroundColor:", v5);

  }
}

- (void)_updateFullscreen
{
  void *v3;
  id v4;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isLoading") & 1) == 0 && objc_msgSend(v4, "isLoaded"))
  {
    if ((objc_msgSend(v4, "canEnterFullScreen") & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isLoading") && !-[QLPreviewCollection _isVisible](self, "_isVisible"))
LABEL_7:
    -[QLPreviewCollection setFullScreen:](self, "setFullScreen:", 0);
LABEL_8:

}

- (void)_updateOverlay:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[QLPreviewCollection _updateOverlayVisibility](self, "_updateOverlayVisibility");
  -[QLPreviewCollection stateManager](self, "stateManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateOverlayButtons:", v3);

}

- (void)_updateOverlayVisibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[QLPreviewCollection stateManager](self, "stateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarCanBeVisible:", objc_msgSend(v6, "canShowToolBar"));

  -[QLPreviewCollection stateManager](self, "stateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavBarCanBeVisible:", objc_msgSend(v6, "canShowNavBar"));

}

- (void)_updateTitleFromController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isLoading") & 1) == 0)
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTitle:", v5);

  }
}

- (void)_updatePrinter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isLoading") & 1) != 0)
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrinter:", 0);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "printer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    -[QLPreviewCollection stateManager](self, "stateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrinter:", 0);

    if (v4)
    {
      -[QLPreviewCollection stateManager](self, "stateManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPrinter:", v4);

    }
  }

}

- (void)_cleanAccessoryViewContainer
{
  void *v2;
  void *v3;
  id v4;

  -[QLPreviewCollection accessoryView](self, "accessoryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeFromSuperview");
}

- (void)_updateAccessoryViewWithPreviewItemViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v4)
  {
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = (void *)MEMORY[0x24BEBDB00];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke;
      v29[3] = &unk_24C724B00;
      v30 = v7;
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_2;
      v27[3] = &unk_24C724B28;
      v28 = v30;
      objc_msgSend(v9, "animateWithDuration:animations:completion:", v29, v27, 0.2);

    }
    if (v4)
    {
      objc_msgSend(v5, "addSubview:", v4);
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v10 = (void *)MEMORY[0x24BDD1628];
      v33 = CFSTR("view");
      v34[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[view]|"), 0, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addConstraints:", v12);

      v13 = (void *)MEMORY[0x24BDD1628];
      v31 = CFSTR("view");
      v32 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addConstraints:", v15);

      v16 = (void *)MEMORY[0x24BEBDB00];
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_3;
      v25[3] = &unk_24C724B00;
      v17 = v4;
      v26 = v17;
      objc_msgSend(v16, "performWithoutAnimation:", v25);
      objc_msgSend(v17, "setAlpha:", 0.0);
      v18 = (void *)MEMORY[0x24BEBDB00];
      v20 = v8;
      v21 = 3221225472;
      v22 = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_4;
      v23 = &unk_24C724B00;
      v24 = v17;
      objc_msgSend(v18, "animateWithDuration:animations:", &v20, 0.2);

    }
  }
  -[QLPreviewCollection stateManager](self, "stateManager", v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessoryViewVisible:", v4 != 0);

}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_updateWhitePointAdaptivityStyle
{
  void *v3;
  id v4;

  -[QLPreviewCollection stateManager](self, "stateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewCollectionPrefersWhitePointAdaptivityStyle:", objc_msgSend(v3, "preferredWhitePointAdaptivityStyle"));

  }
}

- (id)pageViewController:(id)a3 viewControllerAtIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  QLItemPresenterViewController *v10;
  void *v11;
  void *v12;
  QLItemPresenterViewController *v13;
  QLPreviewItemStore *itemStore;
  QLItemPresenterViewController *v15;
  QLItemPresenterViewController *v16;
  _QWORD v18[4];
  QLItemPresenterViewController *v19;
  QLPreviewCollection *v20;
  id v21[2];
  id location;

  v6 = a3;
  v7 = -[QLPreviewItemStore possibleRange](self->_itemStore, "possibleRange");
  if (a4 < v7 || a4 - v7 >= v8)
  {
    v16 = 0;
  }
  else
  {
    v10 = [QLItemPresenterViewController alloc];
    -[QLPreviewCollection hostApplicationBundleIdentifier](self, "hostApplicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollection parentApplicationDisplayIdentifier](self, "parentApplicationDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[QLItemPresenterViewController initWithHostApplicationBundleIdentifier:parentApplicationDisplayIdentifier:](v10, "initWithHostApplicationBundleIdentifier:parentApplicationDisplayIdentifier:", v11, v12);

    -[QLItemViewController setAppearance:](v13, "setAppearance:", self->_appearance);
    -[QLItemAggregatedViewController setDelegate:](v13, "setDelegate:", self);
    objc_initWeak(&location, self);
    itemStore = self->_itemStore;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke;
    v18[3] = &unk_24C7271A8;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a4;
    v15 = v13;
    v19 = v15;
    v20 = self;
    -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](itemStore, "previewItemAtIndex:withCompletionHandler:", a4, v18);
    v16 = v15;

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);

  }
  return v16;
}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17[2];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "pageViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentPageIndex");
    v10 = *(_QWORD *)(a1 + 56);

    if (v9 == v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "previewWillAppear:", 1);
      v11 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v11, "_updateWhitePointAdaptivityStyle");

    }
    v12 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_2;
    v14[3] = &unk_24C727180;
    v15 = v5;
    objc_copyWeak(v17, (id *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 40);
    v17[1] = *(id *)(a1 + 56);
    v16 = v13;
    objc_msgSend(v12, "loadPreviewControllerWithContents:context:completionHandler:", v15, 0, v14);
    objc_destroyWeak(v17);

  }
}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  _QWORD *WeakRetained;
  _QWORD *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25[2];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v3;
      v7 = "Error while attempting to load controller for preview item (%@): %@ #PreviewCollection";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_10:
      _os_log_impl(&dword_20D4F5000, v8, v9, v7, buf, v10);
    }
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      v7 = "Finished loading controller for preview item (%@) successfully. #PreviewCollection";
      v8 = v5;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 12;
      goto LABEL_10;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_217;
    v24 = &unk_24C727158;
    v25[1] = *(id *)(a1 + 56);
    objc_copyWeak(v25, (id *)(a1 + 48));
    objc_msgSend(v14, "getStateRestorationUserInfo:", &v21);

    objc_msgSend(v13, "pageViewController", v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "currentPageIndex") == *(_QWORD *)(a1 + 56))
    {
      v16 = v13[135] == 0;

      if (!v16)
        objc_msgSend(v13, "notifyFirstTimeAppearanceWithActions:", v13[135]);
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateCanChangeCurrentPage");
    objc_msgSend(v13, "pageViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "currentPageIndex") == *(_QWORD *)(a1 + 56);

    if (v20)
      objc_msgSend(v13, "updateCurrentPreviewConfiguration");
    objc_destroyWeak(v25);
  }
  else
  {
    v17 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      v17 = *v4;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      v27 = v18;
      _os_log_impl(&dword_20D4F5000, v17, OS_LOG_TYPE_INFO, "Cancelling loading of preview at index %lu because collection does not exist anymore. #PreviewCollection", buf, 0xCu);
    }
  }

}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_217(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = v5;
      objc_msgSend(v3, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "State restoration: user info for preview at index %lu: %@ #PreviewCollection", (uint8_t *)&v11, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "notifyStateRestorationUserInfo:", v3);

  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 134217984;
      v12 = v10;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "State restoration: No user info for preview at index %lu. #PreviewCollection", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)displayBarsIfNeededForDestinationViewController:(id)a3
{
  id v4;
  void *v5;
  BOOL IsEmpty;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  CGRect v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    if (!objc_msgSend(v4, "supportsChromeless")
      || (objc_msgSend(v10, "contentFrame"), IsEmpty = CGRectIsEmpty(v11), v5 = v10, !IsEmpty))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = v10;
      if ((isKindOfClass & 1) == 0
        || (objc_msgSend(v10, "currentPreviewViewController"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v5 = v10,
            v8))
      {
        if ((objc_msgSend(v5, "navigationBarShouldBeChromeless") & 1) == 0)
          -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", 0);
        v9 = objc_msgSend(v10, "toolbarShouldBeChromeless");
        v5 = v10;
        if ((v9 & 1) == 0)
        {
          -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", 0);
          v5 = v10;
        }
      }
    }
  }

}

- (void)pageViewController:(id)a3 willBeginInteractiveTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7
{
  id v9;
  id v10;

  v10 = a6;
  v9 = a4;
  -[QLPreviewCollection setIsTransitioningPage:](self, "setIsTransitioningPage:", 1);
  objc_msgSend(v10, "setAppearance:", self->_appearance);
  objc_msgSend(v9, "previewWillDisappear:", 1);

  objc_msgSend(v10, "previewWillAppear:", 1);
  objc_msgSend(v10, "previewBecameFullScreen:animated:", self->_fullScreen, 0);
  -[QLPreviewCollection displayBarsIfNeededForDestinationViewController:](self, "displayBarsIfNeededForDestinationViewController:", v10);

}

- (void)pageViewController:(id)a3 willTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  _BOOL8 v8;
  id v10;

  v8 = a8;
  v10 = a6;
  objc_msgSend(v10, "setAppearance:", self->_appearance);
  objc_msgSend(v10, "previewBecameFullScreen:animated:", self->_fullScreen, v8);
  objc_msgSend(v10, "previewWillAppear:", v8);
  if (v8)
    objc_msgSend(v10, "previewWillFinishAppearing");
  -[QLPreviewCollection displayBarsIfNeededForDestinationViewController:](self, "displayBarsIfNeededForDestinationViewController:", v10);

}

- (void)pageViewController:(id)a3 isTransitioningFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 withProgress:(double)a8
{
  double v11;
  id v12;

  v11 = 1.0 - a8;
  v12 = a6;
  objc_msgSend(a4, "previewIsAppearingWithProgress:", v11);
  objc_msgSend(v12, "previewIsAppearingWithProgress:", a8);
  -[QLPreviewCollection displayBarsIfNeededForDestinationViewController:](self, "displayBarsIfNeededForDestinationViewController:", v12);

}

- (void)pageViewController:(id)a3 didTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a8;
  v16 = a4;
  v13 = a6;
  -[QLPreviewCollection setIsTransitioningPage:](self, "setIsTransitioningPage:", 0);
  self->_currentItemIndex = a7;
  self->_appearanceActions = 0;
  -[QLPreviewCollection _updateFullscreenBackgroundColor](self, "_updateFullscreenBackgroundColor");
  -[QLPreviewCollection stateManager](self, "stateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previewCollectionUpdatePreviewItem:", a7);

  -[QLPreviewCollection _updateFullscreen](self, "_updateFullscreen");
  -[QLPreviewCollection _updateOverlay:](self, "_updateOverlay:", v8);
  if (a5 != a7)
  {
    objc_msgSend(v16, "previewDidDisappear:", v8);
    if (-[QLPreviewCollection _isVisible](self, "_isVisible"))
      objc_msgSend(v13, "previewDidAppear:", v8);
  }
  objc_msgSend(v13, "setAppearance:", self->_appearance);
  -[QLPreviewCollection _updateAccessoryViewWithPreviewItemViewController:](self, "_updateAccessoryViewWithPreviewItemViewController:", v13);
  -[QLPreviewCollection _updateWhitePointAdaptivityStyle](self, "_updateWhitePointAdaptivityStyle");
  -[QLPreviewCollection stateManager](self, "stateManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateKeyCommands");

  -[QLPreviewCollection _updatePrinter](self, "_updatePrinter");
  -[QLPreviewCollection _updateTitleFromController](self, "_updateTitleFromController");
  -[QLPreviewCollection _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", objc_msgSend(v13, "navigationBarShouldBeChromeless"));
  -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", objc_msgSend(v13, "toolbarShouldBeChromeless"));

}

- (void)pageViewController:(id)a3 willCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  _BOOL8 v8;
  id v10;

  if (a4 != a6)
  {
    v8 = a8;
    v10 = a6;
    objc_msgSend(a4, "previewWillAppear:", v8);
    objc_msgSend(v10, "previewWillDisappear:", v8);

  }
}

- (void)pageViewController:(id)a3 didCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  _BOOL8 v8;
  id v11;
  id v12;

  v8 = a8;
  v12 = a4;
  v11 = a6;
  -[QLPreviewCollection setIsTransitioningPage:](self, "setIsTransitioningPage:", 0);
  if (v12 != v11)
  {
    if (-[QLPreviewCollection _isVisible](self, "_isVisible"))
      objc_msgSend(v12, "previewDidAppear:", v8);
    objc_msgSend(v11, "previewDidDisappear:", v8);
  }
  -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", objc_msgSend(v12, "navigationBarShouldBeChromeless"));
  -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", objc_msgSend(v12, "toolbarShouldBeChromeless"));

}

- (id)pageViewController:(id)a3 parallaxViewInPage:(id)a4 withIndex:(unint64_t)a5
{
  return (id)objc_msgSend(a4, "parallaxView", a3);
}

- (void)_installGestures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  int *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__tapGestureRecognized);
  -[QLPreviewCollection setTapGesture:](self, "setTapGesture:", v3);

  -[QLPreviewCollection tapGesture](self, "tapGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDelaysRecognitionForGreaterTapCounts:", 1);

  -[QLPreviewCollection tapGesture](self, "tapGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", self, sel_slideToDismissGestureRecognized_);
  -[QLPreviewCollection setSlideGesture:](self, "setSlideGesture:", v6);

  -[QLPreviewCollection slideGesture](self, "slideGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[QLPreviewCollection slideGesture](self, "slideGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowedScrollTypesMask:", 2);

  -[QLPreviewCollection slideGesture](self, "slideGesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaximumNumberOfTouches:", 1);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD808]), "initWithTarget:action:", self, sel_rotationOrPinchGestureRecognized_);
  -[QLPreviewCollection setPinchGesture:](self, "setPinchGesture:", v10);

  -[QLPreviewCollection pinchGesture](self, "pinchGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD8D0]), "initWithTarget:action:", self, sel_rotationOrPinchGestureRecognized_);
  -[QLPreviewCollection setRotationGesture:](self, "setRotationGesture:", v12);

  -[QLPreviewCollection rotationGesture](self, "rotationGesture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", self->_slideGesture);

    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addGestureRecognizer:", self->_pinchGesture);

    -[QLPreviewCollection pageViewController](self, "pageViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addGestureRecognizer:", self->_rotationGesture);

  }
  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addGestureRecognizer:", self->_tapGesture);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[QLPreviewCollection pageViewController](self, "pageViewController", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subviews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "gestureRecognizers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v30);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v33 = &OBJC_IVAR___QLPreviewCollection__pageSwipeGesture;
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(),
              v34 = objc_opt_isKindOfClass(),
              v33 = &OBJC_IVAR___QLPreviewCollection__pagePanGesture,
              (v34 & 1) != 0))
        {
          objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v33), v31);
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v28);
  }

  -[QLPreviewCollection pinchGesture](self, "pinchGesture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection slideGesture](self, "slideGesture");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "requireGestureRecognizerToFail:", v36);

  -[QLPreviewCollection rotationGesture](self, "rotationGesture");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection slideGesture](self, "slideGesture");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "requireGestureRecognizerToFail:", v38);

}

- (BOOL)_toggleFullscreenIfPossible
{
  void *v3;
  int v4;

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canToggleFullScreen");

  if (v4)
    -[QLPreviewCollection setFullScreen:](self, "setFullScreen:", -[QLPreviewCollection fullScreen](self, "fullScreen") ^ 1);
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if (self->_tapGesture == v6
    && (-[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "canClickToToggleFullscreen"),
        v8,
        (v9 & 1) == 0)
    && (objc_msgSend(v7, "_isPointerTouch") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "shouldAcceptTouch:ofGestureRecognizer:", v7, v6);

    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIRotationGestureRecognizer *v4;
  UIRotationGestureRecognizer *v5;
  UIPanGestureRecognizer *slideGesture;
  void *v7;
  char v8;
  UIRotationGestureRecognizer *rotationGesture;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  UIPanGestureRecognizer *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v32;
  UIRotationGestureRecognizer *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (UIRotationGestureRecognizer *)a3;
  v5 = v4;
  slideGesture = self->_slideGesture;
  if (slideGesture != (UIPanGestureRecognizer *)v4
    && self->_rotationGesture != v4
    && (UIRotationGestureRecognizer *)self->_pinchGesture != v4)
  {
    goto LABEL_14;
  }
  -[QLPreviewCollection presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[QLPreviewCollection transitionInProgress](self, "transitionInProgress"))
    {
      rotationGesture = self->_rotationGesture;
      if (!-[QLPreviewCollection pinchDismissGestureInProgress](self, "pinchDismissGestureInProgress")
        || rotationGesture != v5)
      {
        v10 = (NSObject **)MEMORY[0x24BE7BF48];
        v11 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v32 = 138412290;
          v33 = v5;
          _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Gesture recognizer (%@) can't begin because and interactive transition is already in progress. #AppearanceTransition", (uint8_t *)&v32, 0xCu);
        }
        goto LABEL_5;
      }
LABEL_17:
      v8 = 1;
      goto LABEL_32;
    }
    slideGesture = self->_slideGesture;
LABEL_14:
    if (slideGesture == (UIPanGestureRecognizer *)v5)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = self->_slideGesture;
      -[UIPanGestureRecognizer view](v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer velocityInView:](v14, "velocityInView:", v15);
      v17 = v16;
      v19 = v18;

      v20 = fabs(v19) > fabs(v17);
      if (v12)
      {
        objc_msgSend(v12, "contentOffset");
        if (v21 > 0.0)
          v20 = 0;
      }
      objc_msgSend(v12, "contentOffset");
      if (v22 <= 0.0)
      {
        objc_msgSend(v12, "frame");
        v24 = v23;
        objc_msgSend(v12, "contentSize");
        v26 = v24 >= v25;
        if (v19 >= 0.0)
          v26 = 1;
        v20 &= v26;
      }
      if (self->_allowInteractiveTransitions
        && (-[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "canSwipeToDismiss") & v20,
            v27,
            v28 == 1))
      {
        objc_msgSend(v12, "panGestureRecognizer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setEnabled:", 0);

        objc_msgSend(v12, "panGestureRecognizer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 1;
        objc_msgSend(v30, "setEnabled:", 1);

      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      if (self->_rotationGesture != v5 && (UIRotationGestureRecognizer *)self->_pinchGesture != v5)
        goto LABEL_17;
      if (!self->_allowInteractiveTransitions)
        goto LABEL_5;
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "canPinchToDismiss");
    }

    goto LABEL_32;
  }
LABEL_5:
  v8 = 0;
LABEL_32:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *v7;
  void *v8;
  void *v9;
  UIPanGestureRecognizer *v10;
  void *v11;
  void *v12;
  UIPanGestureRecognizer *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  UIPanGestureRecognizer *slideGesture;
  UIRotationGestureRecognizer *rotationGesture;
  UIPinchGestureRecognizer *pinchGesture;
  char v24;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = (UIPanGestureRecognizer *)a4;
  if (self->_slideGesture == v6)
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "panGestureRecognizer");
    v10 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v10 == v7)
      goto LABEL_14;
  }
  if ((UIPanGestureRecognizer *)self->_pinchGesture == v6)
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinchGestureRecognizer");
    v13 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v13 == v7)
      goto LABEL_14;
  }
  -[UIPanGestureRecognizer view](v7, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isDescendantOfView:", v16);

  if (v17)
  {
    -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "shouldRecognizeGestureRecognizer:", v6) & 1) != 0)
    {
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", v6, v7);

      if (v20)
        goto LABEL_8;
    }
    else
    {

    }
LABEL_16:
    v24 = 0;
    goto LABEL_18;
  }
LABEL_8:
  slideGesture = self->_slideGesture;
  if (slideGesture == v6)
  {
    v24 = self->_verticalPanGesture == v7;
    goto LABEL_18;
  }
  if ((UIPanGestureRecognizer *)self->_tapGesture == v6)
  {
    if (slideGesture != v7
      && (UIPanGestureRecognizer *)self->_pinchGesture != v7
      && (UIPanGestureRecognizer *)self->_rotationGesture != v7
      && self->_pagePanGesture != v7
      && (UIPanGestureRecognizer *)self->_pageSwipeGesture != v7)
    {
      objc_opt_class();
      v24 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  rotationGesture = self->_rotationGesture;
  pinchGesture = self->_pinchGesture;
  if ((rotationGesture != (UIRotationGestureRecognizer *)v6 || pinchGesture != (UIPinchGestureRecognizer *)v7)
    && (rotationGesture != (UIRotationGestureRecognizer *)v7 || pinchGesture != (UIPinchGestureRecognizer *)v6))
  {
    if ((UIPanGestureRecognizer *)self->_pageSwipeGesture != v7)
    {
      v24 = self->_pagePanGesture != v7;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_14:
  v24 = 1;
LABEL_18:

  return v24 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  char isKindOfClass;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", v6, v7);

  if ((v9 & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else if (self->_tapGesture == v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4
{
  QLRunInMainThread();
}

uint64_t __65__QLPreviewCollection_previewItemViewController_wantsFullScreen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFullScreen:", *(unsigned __int8 *)(a1 + 40));
}

- (void)previewItemViewController:(id)a3 wantsToSetRemoteEdgePanGestureWidth:(double)a4
{
  QLRunInMainThread();
}

void __85__QLPreviewCollection_previewItemViewController_wantsToSetRemoteEdgePanGestureWidth___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "stateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stateManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScreenEdgePanWidth:", *(double *)(a1 + 40));

  }
}

- (void)previewItemViewController:(id)a3 wantsToOpenURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[QLPreviewCollection stateManager](self, "stateManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURLIfAllowed:", v5);

}

- (void)previewItemViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE7BF48];
  v9 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    objc_msgSend(v6, "contents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v11;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "QLItemViewController (contents: %@) did fail with error: %@. #PreviewCollection", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(v6, "presentingDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemPresenterViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
    -[QLPreviewCollection updateCurrentPreviewConfiguration](self, "updateCurrentPreviewConfiguration");

}

- (void)previewItemViewControllerWantsToShowShareSheet:(id)a3
{
  id v3;

  -[QLPreviewCollection stateManager](self, "stateManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showShareSheet");

}

- (void)previewItemViewController:(id)a3 wantsToShowShareSheetWithPopoverTracker:(id)a4 customSharedURL:(id)a5 dismissCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[QLPreviewCollection stateManager](self, "stateManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "showShareSheetWithPopoverTracker:customSharedURL:dismissCompletion:", v11, v10, v9);

}

- (void)previewItemViewControllerWantsUpdateOverlay:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(a3, "presentingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemPresenterViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[QLPreviewCollection _updateOverlay:](self, "_updateOverlay:", v4);
}

- (void)previewItemViewControllerWantsUpdateKeyCommands:(id)a3
{
  id v3;

  -[QLPreviewCollection stateManager](self, "stateManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateKeyCommands");

}

- (void)previewItemViewControllerWantsToShowNoInternetConnectivityAlert:(id)a3
{
  id v3;

  -[QLPreviewCollection stateManager](self, "stateManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentAlertControllerForScenario:", 0);

}

- (void)previewItemViewController:(id)a3 requestsTemporaryEditDirectoryWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  NSObject **v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[QLPreviewCollection _itemViewControllerIsCurrentlyPresentedItemViewController:](self, "_itemViewControllerIsCurrentlyPresentedItemViewController:", v6))
  {
    objc_msgSend(v6, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[QLPreviewItemStore indexOfPreviewItem:](self->_itemStore, "indexOfPreviewItem:", v9);
    -[QLPreviewCollection stateManager](self, "stateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createTemporaryEditDirectoryForItemAtIndex:completionHandler:", v10, v7);

  }
  else
  {
    v12 = (NSObject **)MEMORY[0x24BE7BF48];
    v13 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_ERROR, "Could not create temporary directory because preview controller (%@) is not the current preview controller (%@) #PreviewCollection", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7BF30], 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
}

- (void)previewItemViewControllerDidUpdateContentFrame:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[QLPreviewCollection stateManager](self, "stateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentFrame");
    objc_msgSend(v6, "updateContentFrame:");

  }
}

- (void)previewItemViewController:(id)a3 wantsChromelessNavigationBar:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (!-[QLPreviewCollection isTransitioningPage](self, "isTransitioningPage", a3))
    -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", v4);
}

- (void)previewItemViewController:(id)a3 wantsChromelessToolbar:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (!-[QLPreviewCollection isTransitioningPage](self, "isTransitioningPage", a3))
    -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", v4);
}

- (void)setNavigationBarShouldBeChromelessIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[QLPreviewCollection isNavigationBarChromeless](self, "isNavigationBarChromeless") != a3)
  {
    -[QLPreviewCollection setIsNavigationBarChromeless:](self, "setIsNavigationBarChromeless:", v3);
    -[QLPreviewCollection stateManager](self, "stateManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNavigationBarShouldBeChromeless:", v3);

  }
}

- (void)setToolbarShouldBeChromelessIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[QLPreviewCollection isToolbarChromeless](self, "isToolbarChromeless") != a3)
  {
    -[QLPreviewCollection setIsToolbarChromeless:](self, "setIsToolbarChromeless:", v3);
    -[QLPreviewCollection stateManager](self, "stateManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolbarShouldBeChromeless:", v3);

  }
}

- (void)expandContentOfPreviewItemViewController:(id)a3 unarchivedItemsURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int v14;
  void *v15;
  id v16;
  NSObject **v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  int64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "itemPresenterViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    v13 = -[QLPreviewItemStore indexOfPreviewItem:](self->_itemStore, "indexOfPreviewItem:", v9);
    v14 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v6, 1, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v16)
    {
      v17 = (NSObject **)MEMORY[0x24BE7BF48];
      v18 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v18 = *v17;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v23 = v13;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_20D4F5000, v18, OS_LOG_TYPE_ERROR, "Could not expand content of item at index: %lu. Error: %@ #PreviewCollection", buf, 0x16u);
      }
      if (!v14)
        goto LABEL_9;
    }
    else
    {
      -[QLPreviewCollection stateManager](self, "stateManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "expandContentOfItemAtIndex:withUUID:unarchivedItemsURLWrapper:", v13, v20, v15);

      if (!v14)
        goto LABEL_9;
    }
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
LABEL_9:

  }
}

- (id)loadingTextForPreviewItemViewController:(id)a3
{
  return self->_loadingString;
}

- (void)previewItemViewControllerDidEditCopyOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  QLPreviewItemStore *itemStore;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  if (!v8)
    v8 = &__block_literal_global_19;
  v15 = v8;
  v9 = a4;
  v10 = a3;
  -[QLPreviewCollection stateManager](self, "stateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  itemStore = self->_itemStore;
  objc_msgSend(v10, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatePreviewItemAtIndex:editedCopy:completionHandler:", -[QLPreviewItemStore indexOfPreviewItem:](itemStore, "indexOfPreviewItem:", v14), v9, v15);

}

- (void)previewItemViewController:(id)a3 hasUnsavedEdits:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  objc_msgSend(a3, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9
    && -[QLPreviewItemStore indexOfPreviewItem:](self->_itemStore, "indexOfPreviewItem:", v9) == self->_currentItemIndex)
  {
    -[QLPreviewCollection stateManager](self, "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPreviewItemViewControllerHasUnsavedEdits:forItemUUID:", v4, v8);

  }
}

- (void)previewItemViewController:(id)a3 didEnableEditMode:(BOOL)a4
{
  -[QLPreviewCollection setIsEditing:](self, "setIsEditing:", a4);
  -[QLPreviewCollection _updateEnableChangingPageUsingGestures](self, "_updateEnableChangingPageUsingGestures");
}

- (void)previewItemViewControllerDidAcquireLock:(id)a3
{
  QLPreviewItemStore *itemStore;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t currentItemIndex;

  itemStore = self->_itemStore;
  objc_msgSend(a3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[QLPreviewItemStore indexOfPreviewItem:](itemStore, "indexOfPreviewItem:", v6);
  currentItemIndex = self->_currentItemIndex;

  if (v7 == currentItemIndex)
  {
    -[QLPreviewCollection setCurrentItemViewControllerIsPerformingFocusedAction:](self, "setCurrentItemViewControllerIsPerformingFocusedAction:", 1);
    -[QLPreviewCollection _updateEnableChangingPageUsingGestures](self, "_updateEnableChangingPageUsingGestures");
  }
}

- (void)previewItemViewControllerDidHandOverLock:(id)a3
{
  -[QLPreviewCollection setCurrentItemViewControllerIsPerformingFocusedAction:](self, "setCurrentItemViewControllerIsPerformingFocusedAction:", 0);
  -[QLPreviewCollection _updateEnableChangingPageUsingGestures](self, "_updateEnableChangingPageUsingGestures");
}

- (void)previewItemViewController:(id)a3 wantsToUpdateStateRestorationWithUserInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[QLPreviewCollection stateManager](self, "stateManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateStateRestorationWithUserInfo:", v5);

}

- (void)previewItemViewController:(id)a3 wantsToUpdatePreviewItemDisplayState:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[QLPreviewItemStore indexOfPreviewItem:](self->_itemStore, "indexOfPreviewItem:", v10);
  -[QLPreviewCollection stateManager](self, "stateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreviewItemDisplayState:onItemAtIndex:", v6, v8);

}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updatePreviewItemDisplayState:", v5);
}

- (void)previewItemViewControllerWantsToDismissQuickLook:(id)a3
{
  id v3;

  -[QLPreviewCollection stateManager](self, "stateManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerQuickLookDismissal");

}

- (void)previewItemViewControllerDidChangeCurrentPreviewController:(id)a3
{
  if (-[QLPreviewCollection _itemViewControllerIsCurrentlyPresentedItemViewController:](self, "_itemViewControllerIsCurrentlyPresentedItemViewController:", a3))
  {
    -[QLPreviewCollection updateCurrentPreviewConfiguration](self, "updateCurrentPreviewConfiguration");
  }
}

- (void)previewItemViewController:(id)a3 wantsToForwardMessageToHost:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject **v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[QLPreviewCollection _itemViewControllerIsCurrentlyPresentedItemViewController:](self, "_itemViewControllerIsCurrentlyPresentedItemViewController:", v8))
  {
    objc_msgSend(v8, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[QLPreviewItemStore indexOfPreviewItem:](self->_itemStore, "indexOfPreviewItem:", v12);
    v14 = (NSObject **)MEMORY[0x24BE7BF48];
    v15 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v12, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v9;
      v26 = 2048;
      v27 = v13;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_INFO, "Forwarding message %@ to item at index: %lu UUID: %@ #PreviewCollection", (uint8_t *)&v24, 0x20u);

    }
    -[QLPreviewCollection stateManager](self, "stateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "forwardMessage:toItemAtIndex:withUUID:completionHandler:", v9, v13, v19, v10);

    v10 = v18;
  }
  else
  {
    v20 = (NSObject **)MEMORY[0x24BE7BF48];
    v21 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v21 = *v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = (int64_t)v23;
      _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_ERROR, "Could not forward message to host because preview controller (%@) is not the current preview controller (%@) #PreviewCollection", (uint8_t *)&v24, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7C000], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v12);
  }

}

- (BOOL)itemPresenterViewControllerShouldForceAutodownloadFile:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4 && self->_appearanceActions != 0;
}

- (void)setCurrentItemViewControllerIsPerformingFocusedAction:(BOOL)a3
{
  self->_currentItemViewControllerIsPerformingFocusedAction = a3;
  -[QLPreviewCollection _updateCanChangeCurrentPage](self, "_updateCanChangeCurrentPage");
}

- (void)setIsEditing:(BOOL)a3
{
  QLPreviewCollection *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isEditing = a3;
  -[QLPreviewCollection _updateCanChangeCurrentPage](obj, "_updateCanChangeCurrentPage");
  objc_sync_exit(obj);

}

- (void)setIsTransitioningPage:(BOOL)a3
{
  _BOOL4 v3;
  QLPreviewCollection *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isTransitioningPage != v3)
  {
    obj->_isTransitioningPage = v3;
    -[QLPreviewCollection _updateCanChangeCurrentPage](obj, "_updateCanChangeCurrentPage");
  }
  objc_sync_exit(obj);

}

- (void)_updateCanChangeCurrentPage
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  id v9;

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canSwipeToDismiss");

  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPinchToDismiss");

  if (!_os_feature_enabled_impl())
  {
    if (!self->_isEditing)
    {
      v8 = !self->_isTransitioningPage;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (self->_isEditing)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_10;
  }
  if (self->_isTransitioningPage)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7 & v6;
LABEL_10:
  -[QLPreviewCollection stateManager](self, "stateManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCanChangeCurrentPage:", v8);

}

- (void)_updateEnableChangingPageUsingGestures
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = !self->_isEditing && !self->_currentItemViewControllerIsPerformingFocusedAction;
  -[UISwipeGestureRecognizer setEnabled:](self->_pageSwipeGesture, "setEnabled:", v3);
  -[UIPanGestureRecognizer setEnabled:](self->_pagePanGesture, "setEnabled:", v3);
  -[QLPreviewCollection pageViewController](self, "pageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (id)_sandboxExtensionForEditedFileAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "fileSystemRepresentation");

  v6 = (const char *)sandbox_extension_issue_file();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, strlen(v6) + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x24BE7BF48];
    v9 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "QLPreviewCollection could not provide a sandbox extension for file at URL: %@ #PreviewCollection", (uint8_t *)&v11, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)_itemViewControllerIsCurrentlyPresentedItemViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "presentingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemPresenterViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollection currentPreviewItemViewController](self, "currentPreviewItemViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (QLPageViewController)pageViewController
{
  return (QLPageViewController *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setPageViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (QLPreviewControllerStateProtocol)stateManager
{
  return (QLPreviewControllerStateProtocol *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setStateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)shouldStartFullScreen
{
  return self->_shouldStartFullScreen;
}

- (void)setShouldStartFullScreen:(BOOL)a3
{
  self->_shouldStartFullScreen = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (BOOL)currentItemViewControllerIsPerformingFocusedAction
{
  return self->_currentItemViewControllerIsPerformingFocusedAction;
}

- (BOOL)isTransitioningPage
{
  return self->_isTransitioningPage;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (id)prepareForInvalidationCompletionHandler
{
  return self->_prepareForInvalidationCompletionHandler;
}

- (void)setPrepareForInvalidationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (BOOL)isNavigationBarChromeless
{
  return self->_isNavigationBarChromeless;
}

- (void)setIsNavigationBarChromeless:(BOOL)a3
{
  self->_isNavigationBarChromeless = a3;
}

- (BOOL)isToolbarChromeless
{
  return self->_isToolbarChromeless;
}

- (void)setIsToolbarChromeless:(BOOL)a3
{
  self->_isToolbarChromeless = a3;
}

- (UIPanGestureRecognizer)slideGesture
{
  return (UIPanGestureRecognizer *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setSlideGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return (UIPinchGestureRecognizer *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setPinchGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (UIRotationGestureRecognizer)rotationGesture
{
  return (UIRotationGestureRecognizer *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setRotationGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (UITapGestureRecognizer)tapGesture
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setTapGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (QLSwipeDownTracker)swipeDownTracker
{
  return (QLSwipeDownTracker *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setSwipeDownTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (QLPinchRotationTracker)pinchRotationTracker
{
  return (QLPinchRotationTracker *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setPinchRotationTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (QLTransitionContext)transitionContext
{
  return (QLTransitionContext *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setTransitionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (QLTransitionControllerProtocol)transitionController
{
  return (QLTransitionControllerProtocol *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setTransitionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (QLTransitionDriver)transitionDriver
{
  return (QLTransitionDriver *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setTransitionDriver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (BOOL)hasTriggeredInteractiveTransitionAnimation
{
  return self->_hasTriggeredInteractiveTransitionAnimation;
}

- (void)setHasTriggeredInteractiveTransitionAnimation:(BOOL)a3
{
  self->_hasTriggeredInteractiveTransitionAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionDriver, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_pinchRotationTracker, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_rotationGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_slideGesture, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong(&self->_prepareForInvalidationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_loadingString, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_pagePanGesture, 0);
  objc_storeStrong((id *)&self->_pageSwipeGesture, 0);
  objc_storeStrong((id *)&self->_verticalPanGesture, 0);
  objc_destroyWeak((id *)&self->_remoteAccessoryViewContainer);
  objc_storeStrong((id *)&self->_localAccessoryViewContainer, 0);
  objc_storeStrong((id *)&self->_itemStore, 0);
}

@end
