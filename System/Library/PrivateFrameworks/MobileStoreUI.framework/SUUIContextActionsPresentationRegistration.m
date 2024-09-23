@implementation SUUIContextActionsPresentationRegistration

- (SUUIContextActionsPresentationRegistration)initWithViewController:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  SUUIContextActionsPresentationRegistration *v9;
  SUUIContextActionsPresentationRegistration *v10;
  void *v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIContextActionsPresentationRegistration;
  v9 = -[SUUIContextActionsPresentationRegistration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewController, a3);
    v11 = _Block_copy(v8);
    handler = v10->_handler;
    v10->_handler = v11;

    v10->_previewInteractionDidEnd = 0;
  }

  return v10;
}

- (void)dealloc
{
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v4;
  objc_super v5;

  -[UIPreviewInteraction cancelInteraction](self->_previewInteraction, "cancelInteraction");
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  if (longPressGestureRecognizer)
  {
    -[UILongPressGestureRecognizer view](longPressGestureRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_longPressGestureRecognizer);

  }
  v5.receiver = self;
  v5.super_class = (Class)SUUIContextActionsPresentationRegistration;
  -[SUUIContextActionsPresentationRegistration dealloc](&v5, sel_dealloc);
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  double v23;
  double v24;
  double v25;
  double v26;
  SUUIContextActionsPresentationSource *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  SUUIContextActionsViewController *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SUUIContextActionsViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  double Width;
  CGFloat v51;
  double Height;
  CGFloat v53;
  double MidX;
  CGFloat v55;
  double MidY;
  CGFloat v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  SUUIContextActionsViewController *v72;
  void *v73;
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[4];
  id v79;
  CGAffineTransform v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  CGAffineTransform v85;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  SUUIContextActionsViewController *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v103 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "forceTouchCapability");

  if (v7 == 1)
  {
    v8 = 0;
  }
  else
  {
    -[SUUIContextActionsPresentationRegistration viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v74 = v5;
      if (v74)
      {
        v11 = v74;
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            if ((objc_msgSend(v12, "isDragging") & 1) != 0)
            {

              v8 = 0;
              goto LABEL_30;
            }
            objc_msgSend(v10, "addObject:", v12);

          }
          objc_msgSend(v11, "superview");
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        while (v13);
      }
      v73 = v9;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v99;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v99 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
            objc_msgSend(v19, "panGestureRecognizer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setEnabled:", 0);

            objc_msgSend(v19, "panGestureRecognizer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setEnabled:", 1);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        }
        while (v16);
      }

      -[SUUIContextActionsPresentationRegistration handler](self, "handler");
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SUUIContextActionsPresentationRegistration *))v22)[2](v22, self);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "locationInCoordinateSpace:", v74);
        v24 = v23;
        v26 = v25;
        v9 = v73;
        v27 = -[SUUIContextActionsPresentationSource initWithViewController:]([SUUIContextActionsPresentationSource alloc], "initWithViewController:", v73);
        objc_msgSend(v12, "setPresentationSource:", v27);

        objc_msgSend(v12, "presentationSource");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSourceView:", v74);

        v29 = *MEMORY[0x24BDBF148];
        v30 = *(double *)(MEMORY[0x24BDBF148] + 8);
        objc_msgSend(v12, "presentationSource");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSourceRect:", v24, v26, v29, v30);

        v32 = -[SUUIContextActionsViewController initWithConfiguration:]([SUUIContextActionsViewController alloc], "initWithConfiguration:", v12);
        -[SUUIContextActionsViewController setOrbPresentation:](v32, "setOrbPresentation:", 1);
        -[SUUIContextActionsPresentationRegistration longPressGestureRecognizer](self, "longPressGestureRecognizer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIContextActionsViewController setSystemProvidedGestureRecognzier:](v32, "setSystemProvidedGestureRecognzier:", v33);

        objc_msgSend(v4, "valueForKey:", CFSTR("touchObservingGestureRecognizer"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
          objc_msgSend(v34, "setCancelsTouchesInView:", 1);
        v36 = (void *)MEMORY[0x24BEBDB08];
        v95[0] = MEMORY[0x24BDAC760];
        v95[1] = 3221225472;
        v95[2] = __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke;
        v95[3] = &unk_2511F46D0;
        v12 = v12;
        v96 = v12;
        v37 = v32;
        v97 = v37;
        objc_msgSend(v36, "_performWithoutDeferringTransitions:", v95);
        -[SUUIContextActionsPresentationRegistration setOrbContextActionsViewController:](self, "setOrbContextActionsViewController:", v37);
        -[SUUIContextActionsViewController transitionPresentationController](v37, "transitionPresentationController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v8 = v38 != 0;
        if (v38)
        {
          v71 = v35;
          v72 = v37;
          objc_msgSend(v38, "backgroundView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "snapshotViewAfterScreenUpdates:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v39;
          objc_msgSend(v39, "containerView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          if (v41 && v42)
          {
            objc_msgSend(v42, "insertSubview:aboveSubview:", v41, v40);
            objc_msgSend(v74, "bounds");
            objc_msgSend(v74, "convertRect:toView:", v43);
            objc_msgSend(v41, "setFrame:");
            objc_msgSend(v74, "setHidden:", 1);
          }
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setBackgroundColor:", v44);

          +[SUUIContextActionsBlurEffect effectWithStyle:](SUUIContextActionsBlurEffect, "effectWithStyle:", 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v43;
          v46 = objc_alloc(MEMORY[0x24BEBDB20]);
          v91[0] = MEMORY[0x24BDAC760];
          v91[1] = 3221225472;
          v91[2] = __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_2;
          v91[3] = &unk_2511F4798;
          v66 = v40;
          v92 = v66;
          v93 = v45;
          v47 = v41;
          v94 = v47;
          v68 = v45;
          v48 = (void *)objc_msgSend(v46, "initWithDuration:curve:animations:", 3, v91, 1.0);
          -[SUUIContextActionsPresentationRegistration setPreviewPhasePropertyAnimator:](self, "setPreviewPhasePropertyAnimator:", v48);

          -[SUUIContextActionsViewController view](v72, "view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "bounds");
          Width = CGRectGetWidth(v104);
          objc_msgSend(v49, "bounds");
          v51 = fmax(Width / CGRectGetWidth(v105), 0.5);
          objc_msgSend(v74, "bounds");
          Height = CGRectGetHeight(v106);
          objc_msgSend(v49, "bounds");
          v53 = CGRectGetHeight(v107);
          memset(&v90, 0, sizeof(v90));
          CGAffineTransformMakeScale(&v90, v51, fmax(Height / v53, 0.5));
          memset(&v89, 0, sizeof(v89));
          objc_msgSend(v47, "frame");
          MidX = CGRectGetMidX(v108);
          objc_msgSend(v49, "frame");
          v55 = MidX - CGRectGetMidX(v109);
          objc_msgSend(v47, "frame");
          MidY = CGRectGetMidY(v110);
          objc_msgSend(v49, "frame");
          v57 = CGRectGetMidY(v111);
          CGAffineTransformMakeTranslation(&v89, v55, MidY - v57);
          t1 = v90;
          t2 = v89;
          CGAffineTransformConcat(&v88, &t1, &t2);
          v90 = v88;
          v85 = v88;
          objc_msgSend(v49, "setTransform:", &v85);
          v58 = objc_alloc(MEMORY[0x24BEBDB20]);
          v81[0] = MEMORY[0x24BDAC760];
          v81[1] = 3221225472;
          v81[2] = __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_3;
          v81[3] = &unk_2511F4798;
          v82 = v47;
          v83 = v66;
          v59 = v49;
          v84 = v59;
          v75 = v66;
          v67 = v47;
          v60 = (void *)objc_msgSend(v58, "initWithDuration:dampingRatio:animations:", v81, 0.400000006, 1.0);
          -[SUUIContextActionsPresentationRegistration setCommitPhasePropertyAnimator:](self, "setCommitPhasePropertyAnimator:", v60);

          v61 = MEMORY[0x24BDAC760];
          v78[0] = MEMORY[0x24BDAC760];
          v78[1] = 3221225472;
          v78[2] = __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_4;
          v78[3] = &unk_2511F7908;
          v79 = v59;
          v80 = v90;
          v62 = v59;
          objc_msgSend(v70, "setDismissalAnimations:", v78);
          v63 = (void *)MEMORY[0x24BDBCF40];
          v76[0] = v61;
          v76[1] = 3221225472;
          v76[2] = __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_5;
          v76[3] = &unk_2511F7930;
          v76[4] = self;
          v77 = v4;
          objc_msgSend(v63, "scheduledTimerWithTimeInterval:repeats:block:", 0, v76, 1.0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIContextActionsPresentationRegistration setPreviewInteractionTimeout:](self, "setPreviewInteractionTimeout:", v64);

          -[SUUIContextActionsPresentationRegistration setPreviewInteractionDidEnd:](self, "setPreviewInteractionDidEnd:", 0);
          v37 = v72;

          v39 = v70;
          v9 = v73;
          v35 = v71;
        }
        else
        {
          NSLog(CFSTR("[UIPreviewInteraction] transitionPresentationController == nil"));
          -[SUUIContextActionsPresentationRegistration cleanupPreviewInteraction:](self, "cleanupPreviewInteraction:", v4);
        }

      }
      else
      {
        v8 = 0;
        v9 = v73;
      }
LABEL_30:

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presentationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:permittedArrowDirections:animated:", *(_QWORD *)(a1 + 40), 12, 0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

uint64_t __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setEffect:", *(_QWORD *)(a1 + 40));
  CGAffineTransformMakeScale(&v5, 1.08000004, 1.08000004);
  v2 = *(void **)(a1 + 48);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_3(id *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double Width;
  double MidX;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[2];
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v2 = a1[4];
  v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v25[0] = *MEMORY[0x24BDBD8B8];
  v22 = v25[0];
  v25[1] = v23;
  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v21 = v26;
  objc_msgSend(v2, "setTransform:", v25);
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[4], "bounds");
  objc_msgSend(a1[5], "bounds");
  objc_msgSend(a1[6], "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v19 = v4;
  UIRectCenteredXInRectScale();

  objc_msgSend(a1[5], "bounds", v19);
  objc_msgSend(a1[6], "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v20 = v6;
  UIRectCenteredYInRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  Width = CGRectGetWidth(v27);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  objc_msgSend(a1[4], "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v28), v20);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  objc_msgSend(a1[4], "setCenter:", MidX, CGRectGetMidY(v30));
  v17 = a1[6];
  v24[0] = v22;
  v24[1] = v23;
  v24[2] = v21;
  objc_msgSend(v17, "setTransform:", v24);
  return objc_msgSend(a1[6], "setAlpha:", 1.0);
}

uint64_t __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_4(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
}

void __76__SUUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "previewInteractionDidEnd") & 1) == 0)
  {
    NSLog(CFSTR("[UIPreviewInteraction] previewInteractionTimeout"));
    objc_msgSend(*(id *)(a1 + 32), "previewInteraction:didUpdatePreviewTransition:ended:", *(_QWORD *)(a1 + 40), 1, 1.0);
    objc_msgSend(*(id *)(a1 + 32), "previewInteraction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_prepareUsingFeedback");

    objc_msgSend(*(id *)(a1 + 32), "previewInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_actuateFeedbackForStateIfNeeded:", 2);

    objc_msgSend(*(id *)(a1 + 32), "previewInteraction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelInteraction");

  }
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a5;
  v21 = a3;
  NSLog(CFSTR("[UIPreviewInteraction] didUpdatePreviewTransition (transitionProgress) (ended)"));
  v8 = a4 * a4;
  -[SUUIContextActionsPresentationRegistration previewPhasePropertyAnimator](self, "previewPhasePropertyAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fractionComplete");
  v11 = v10;

  if (v8 < 1.0 || v11 != 0.0)
  {
    -[SUUIContextActionsPresentationRegistration previewPhasePropertyAnimator](self, "previewPhasePropertyAnimator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFractionComplete:", v8);

  }
  if (v5)
  {
    -[SUUIContextActionsPresentationRegistration setPreviewInteractionDidEnd:](self, "setPreviewInteractionDidEnd:", 1);
    -[SUUIContextActionsPresentationRegistration orbContextActionsViewController](self, "orbContextActionsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInteractionEnabled:", 1);

    -[SUUIContextActionsPresentationRegistration orbContextActionsViewController](self, "orbContextActionsViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

    -[SUUIContextActionsPresentationRegistration commitPhasePropertyAnimator](self, "commitPhasePropertyAnimator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startAnimation");

    -[SUUIContextActionsPresentationRegistration previewPhasePropertyAnimator](self, "previewPhasePropertyAnimator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pauseAnimation");

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD970]), "initWithDampingRatio:", 1.0);
    -[SUUIContextActionsPresentationRegistration previewPhasePropertyAnimator](self, "previewPhasePropertyAnimator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "continueAnimationWithTimingParameters:durationFactor:", v19, 0.400000006);

    -[SUUIContextActionsPresentationRegistration setOrbContextActionsViewController:](self, "setOrbContextActionsViewController:", 0);
    -[SUUIContextActionsPresentationRegistration cleanupPreviewInteraction:](self, "cleanupPreviewInteraction:", v21);

  }
}

- (void)previewInteractionDidCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SUUIContextActionsPresentationRegistration previewInteractionDidEnd](self, "previewInteractionDidEnd"))
  {
    NSLog(CFSTR("[UIPreviewInteraction] cancel after interaction ended"));
  }
  else
  {
    NSLog(CFSTR("[UIPreviewInteraction] cancel"));
    -[SUUIContextActionsPresentationRegistration cleanupPreviewInteraction:](self, "cleanupPreviewInteraction:", v4);
    -[SUUIContextActionsPresentationRegistration setOrbContextActionsViewController:](self, "setOrbContextActionsViewController:", 0);
    -[SUUIContextActionsPresentationRegistration setCommitPhasePropertyAnimator:](self, "setCommitPhasePropertyAnimator:", 0);
    -[SUUIContextActionsPresentationRegistration setPreviewPhasePropertyAnimator:](self, "setPreviewPhasePropertyAnimator:", 0);
  }

}

- (void)cleanupPreviewInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SUUIContextActionsPresentationRegistration previewInteractionTimeout](self, "previewInteractionTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SUUIContextActionsPresentationRegistration setPreviewInteractionTimeout:](self, "setPreviewInteractionTimeout:", 0);
  objc_msgSend(v8, "valueForKey:", CFSTR("touchObservingGestureRecognizer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setCancelsTouchesInView:", 0);
  -[SUUIContextActionsPresentationRegistration orbContextActionsViewController](self, "orbContextActionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)longPressGestureRecognizerTriggered:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == 1)
  {
    objc_msgSend(v7, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "forceTouchCapability");

    if (v6 != 2)
      -[SUUIContextActionsPresentationRegistration _presentFromGestureRecognizer:](self, "_presentFromGestureRecognizer:", v7);
  }

}

- (void)setLongPressGestureRecognizer:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[UILongPressGestureRecognizer removeTarget:action:](self->_longPressGestureRecognizer, "removeTarget:action:", self, sel_longPressGestureRecognizerTriggered_);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "addTarget:action:", self, sel_longPressGestureRecognizerTriggered_);
    v5 = v6;
  }

}

- (void)_presentFromGestureRecognizer:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  SUUIContextActionsPresentationSource *v6;
  void *v7;
  SUUIContextActionsPresentationSource *v8;
  void *v9;
  void *v10;
  SUUIContextActionsViewController *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SUUIContextActionsPresentationRegistration handler](self, "handler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, SUUIContextActionsPresentationRegistration *))v4)[2](v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [SUUIContextActionsPresentationSource alloc];
    -[SUUIContextActionsPresentationRegistration viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUIContextActionsPresentationSource initWithViewController:](v6, "initWithViewController:", v7);

    objc_msgSend(v13, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsPresentationSource setSourceView:](v8, "setSourceView:", v9);

    objc_msgSend(v13, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultPresentationPosition");
    -[SUUIContextActionsPresentationSource setSourceRect:](v8, "setSourceRect:");

    objc_msgSend(v5, "setPresentationSource:", v8);
    v11 = -[SUUIContextActionsViewController initWithConfiguration:]([SUUIContextActionsViewController alloc], "initWithConfiguration:", v5);
    -[SUUIContextActionsViewController setSystemProvidedGestureRecognzier:](v11, "setSystemProvidedGestureRecognzier:", v13);
    objc_msgSend(v5, "presentationSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:permittedArrowDirections:animated:", v11, 12, 1);

  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UIPreviewInteraction)previewInteraction
{
  return self->_previewInteraction;
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteraction, a3);
}

- (BOOL)previewInteractionDidEnd
{
  return self->_previewInteractionDidEnd;
}

- (void)setPreviewInteractionDidEnd:(BOOL)a3
{
  self->_previewInteractionDidEnd = a3;
}

- (NSTimer)previewInteractionTimeout
{
  return self->_previewInteractionTimeout;
}

- (void)setPreviewInteractionTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteractionTimeout, a3);
}

- (SUUIContextActionsViewController)orbContextActionsViewController
{
  return self->_orbContextActionsViewController;
}

- (void)setOrbContextActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_orbContextActionsViewController, a3);
}

- (UIViewPropertyAnimator)previewPhasePropertyAnimator
{
  return self->_previewPhasePropertyAnimator;
}

- (void)setPreviewPhasePropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_previewPhasePropertyAnimator, a3);
}

- (UIViewPropertyAnimator)commitPhasePropertyAnimator
{
  return self->_commitPhasePropertyAnimator;
}

- (void)setCommitPhasePropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_commitPhasePropertyAnimator, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_commitPhasePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_previewPhasePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_orbContextActionsViewController, 0);
  objc_storeStrong((id *)&self->_previewInteractionTimeout, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
