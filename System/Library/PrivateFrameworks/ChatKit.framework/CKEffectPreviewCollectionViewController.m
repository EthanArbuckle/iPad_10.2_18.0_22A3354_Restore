@implementation CKEffectPreviewCollectionViewController

- (CKEffectPreviewCollectionViewController)init
{
  CKEffectPreviewCollectionViewController *v2;
  CKFullScreenEffectManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPreviewCollectionViewController;
  v2 = -[CKEffectPreviewCollectionViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CKFullScreenEffectManager);
    -[CKEffectPreviewCollectionViewController setFsem:](v2, "setFsem:", v3);

  }
  return v2;
}

- (void)loadView
{
  CKEffectPreviewCollectionView *v3;
  CKEffectPreviewCollectionView *v4;
  id v5;

  v3 = [CKEffectPreviewCollectionView alloc];
  v5 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  v4 = -[CKEffectPreviewCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKEffectPreviewCollectionViewController setView:](self, "setView:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKEffectPreviewCollectionViewController animationTimer](self, "animationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CKEffectPreviewCollectionViewController;
  -[CKEffectPreviewCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)displayEffectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKMomentCollectionViewCell *v10;
  void *v11;
  CKMomentCollectionViewCell *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id obj;
  uint64_t v58;
  void *v59;
  CKMomentCollectionViewCell *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;
  CGSize v74;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKEffectPreviewCollectionViewController fsem](self, "fsem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPreviewCollectionViewController currentEffect](self, "currentEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    -[CKEffectPreviewCollectionViewController currentCell](self, "currentCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[CKEffectPreviewCollectionViewController setCurrentCell:](self, "setCurrentCell:", 0);
    -[CKEffectPreviewCollectionViewController setCurrentEffect:](self, "setCurrentEffect:", v6);
    if (v6)
    {
      v56 = v4;
      -[CKEffectPreviewCollectionViewController animationTimer](self, "animationTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      v10 = [CKMomentCollectionViewCell alloc];
      -[CKEffectPreviewCollectionViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v12 = -[CKMomentCollectionViewCell initWithFrame:](v10, "initWithFrame:");

      -[CKEffectPreviewCollectionViewController setCurrentCell:](self, "setCurrentCell:", v12);
      v55 = v6;
      -[CKMomentCollectionViewCell setEffect:](v12, "setEffect:", v6);
      -[CKMomentCollectionViewCell setupEffectIfNeeded](v12, "setupEffectIfNeeded");
      -[CKEffectPreviewCollectionViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "balloonView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v60 = v12;
      -[CKMomentCollectionViewCell effectViews](v12, "effectViews");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v61)
      {
        v58 = *(_QWORD *)v68;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v68 != v58)
              objc_enumerationMutation(obj);
            v62 = v14;
            v15 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v14);
            objc_msgSend(v59, "superview");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "center");
            v18 = v17;
            v20 = v19;
            -[CKEffectPreviewCollectionViewController view](self, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "convertPoint:toView:", v21, v18, v20);
            objc_msgSend(v15, "setFocusPoint:");

            objc_msgSend(v59, "superview");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "frame");
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;
            -[CKEffectPreviewCollectionViewController view](self, "view");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "convertRect:toView:", v31, v24, v26, v28, v30);
            objc_msgSend(v15, "setMessageRect:");

            objc_msgSend(v15, "setMessageOrientation:", objc_msgSend(v59, "orientation"));
            -[CKEffectPreviewCollectionViewController delegate](self, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "balloonView");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "center");
            v35 = v34;
            v37 = v36;
            objc_msgSend(v33, "bounds");
            v39 = v38;
            v41 = v40;
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "scale");
            v44 = v43;
            v74.width = v39;
            v74.height = v41;
            UIGraphicsBeginImageContextWithOptions(v74, 0, v44);

            objc_msgSend(v33, "bounds");
            objc_msgSend(v33, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
            UIGraphicsGetImageFromCurrentImageContext();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            UIGraphicsEndImageContext();
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            -[CKMomentCollectionViewCell effectViews](v60, "effectViews");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v64;
              do
              {
                v50 = 0;
                do
                {
                  if (*(_QWORD *)v64 != v49)
                    objc_enumerationMutation(v46);
                  v51 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v50);
                  objc_msgSend(v33, "superview");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CKEffectPreviewCollectionViewController view](self, "view");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "convertPoint:toView:", v53, v35, v37);
                  objc_msgSend(v51, "setFocusPoint:");

                  objc_msgSend(v51, "setMessageImage:", v45);
                  ++v50;
                }
                while (v48 != v50);
                v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
              }
              while (v48);
            }

            v14 = v62 + 1;
          }
          while (v62 + 1 != v61);
          v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v61);
      }

      -[CKEffectPreviewCollectionViewController view](self, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addSubview:", v60);

      -[CKEffectPreviewCollectionViewController addAnimationTimerForCell:](self, "addAnimationTimerForCell:", v60);
      -[CKMomentCollectionViewCell animate](v60, "animate");

      v6 = v55;
      v4 = v56;
    }
  }

}

- (void)setCurrentEffect:(id)a3
{
  CKFullScreenEffect **p_currentEffect;
  id v5;
  void *v6;
  id v7;

  p_currentEffect = &self->_currentEffect;
  v5 = a3;
  objc_storeWeak((id *)p_currentEffect, v5);
  objc_msgSend(v5, "backgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKEffectPreviewCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)addAnimationTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, v4);
  v5 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(v4, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  v8 = v7;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __68__CKEffectPreviewCollectionViewController_addAnimationTimerForCell___block_invoke;
  v14 = &unk_1E2757590;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 1, &v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTimer:forMode:", v9, *MEMORY[0x1E0C99860]);

  -[CKEffectPreviewCollectionViewController setAnimationTimer:](self, "setAnimationTimer:", v9);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __68__CKEffectPreviewCollectionViewController_addAnimationTimerForCell___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "animate");

}

- (void)resumeEffect
{
  void *v3;

  -[CKEffectPreviewCollectionViewController resizingSavedIdentifier](self, "resizingSavedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPreviewCollectionViewController displayEffectWithIdentifier:](self, "displayEffectWithIdentifier:", v3);

  -[CKEffectPreviewCollectionViewController setResizingSavedIdentifier:](self, "setResizingSavedIdentifier:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CKEffectPreviewCollectionViewController;
  v7 = a4;
  -[CKEffectPreviewCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CKEffectPreviewCollectionViewController resizingSavedIdentifier](self, "resizingSavedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CKEffectPreviewCollectionViewController setResizingSavedIdentifier:](self, "setResizingSavedIdentifier:", v8);
  }
  else
  {
    -[CKEffectPreviewCollectionViewController currentEffect](self, "currentEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPreviewCollectionViewController setResizingSavedIdentifier:](self, "setResizingSavedIdentifier:", v10);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_resumeEffect, 0);
  -[CKEffectPreviewCollectionViewController displayEffectWithIdentifier:](self, "displayEffectWithIdentifier:", 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__CKEffectPreviewCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v11[3] = &unk_1E274B4D0;
  v11[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_169, v11);

}

uint64_t __94__CKEffectPreviewCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_resumeEffect, 0, 0.5);
}

- (CKEffectPreviewCollectionViewControllerDelegate)delegate
{
  return (CKEffectPreviewCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKFullScreenEffect)currentEffect
{
  return (CKFullScreenEffect *)objc_loadWeakRetained((id *)&self->_currentEffect);
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimer, a3);
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
  objc_storeStrong((id *)&self->_fsem, a3);
}

- (CKMomentCollectionViewCell)currentCell
{
  return self->_currentCell;
}

- (void)setCurrentCell:(id)a3
{
  objc_storeStrong((id *)&self->_currentCell, a3);
}

- (NSString)resizingSavedIdentifier
{
  return self->_resizingSavedIdentifier;
}

- (void)setResizingSavedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resizingSavedIdentifier, a3);
}

- (BOOL)hideEffects
{
  return self->_hideEffects;
}

- (void)setHideEffects:(BOOL)a3
{
  self->_hideEffects = a3;
}

- (UIView)cellWrapper
{
  return self->_cellWrapper;
}

- (void)setCellWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_cellWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellWrapper, 0);
  objc_storeStrong((id *)&self->_resizingSavedIdentifier, 0);
  objc_storeStrong((id *)&self->_currentCell, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_destroyWeak((id *)&self->_currentEffect);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
