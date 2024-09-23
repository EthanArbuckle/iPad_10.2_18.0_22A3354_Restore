@implementation QLTransitionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)prepareContextToSend
{
  if (!self->_contextPreparedToSend)
  {
    self->_contextPreparedToSend = 1;
    -[QLTransitionContext _snapshotSourceViewIfNeeded](self, "_snapshotSourceViewIfNeeded");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double topNavigationOffset;
  double hostNavigationOffset;
  void *v7;
  __int128 v8;
  _OWORD v9[3];

  v4 = a3;
  -[QLTransitionContext prepareContextToSend](self, "prepareContextToSend");
  topNavigationOffset = self->_topNavigationOffset;
  *(float *)&topNavigationOffset = topNavigationOffset;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("topNavigationOffset"), topNavigationOffset);
  hostNavigationOffset = self->_hostNavigationOffset;
  *(float *)&hostNavigationOffset = hostNavigationOffset;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("hostNavigationOffset"), hostNavigationOffset);
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("sourceFrame"), self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("uncroppedFrame"), self->_uncroppedFrame.origin.x, self->_uncroppedFrame.origin.y, self->_uncroppedFrame.size.width, self->_uncroppedFrame.size.height);
  -[QLTransitionContext sourceViewSnapshotImage](self, "sourceViewSnapshotImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceViewSnapshotImage"));

  -[QLTransitionContext previewItemSize](self, "previewItemSize");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("previewItemSize"));
  objc_msgSend(v4, "encodeBool:forKey:", -[QLTransitionContext isSourceTransformed](self, "isSourceTransformed"), CFSTR("isSourceTransformed"));
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("sourceBounds"), self->_sourceBounds.origin.x, self->_sourceBounds.origin.y, self->_sourceBounds.size.width, self->_sourceBounds.size.height);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("sourceCenter"), self->_sourceCenter.x, self->_sourceCenter.y);
  v8 = *(_OWORD *)&self->_sourceTransform.c;
  v9[0] = *(_OWORD *)&self->_sourceTransform.a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&self->_sourceTransform.tx;
  objc_msgSend(v4, "encodeCGAffineTransform:forKey:", v9, CFSTR("sourceTransform"));

}

- (QLTransitionContext)initWithCoder:(id)a3
{
  id v4;
  QLTransitionContext *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  UIImage *sourceViewSnapshotImage;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  float v20;
  float v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  QLTransitionContext *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)QLTransitionContext;
  v5 = -[QLTransitionContext init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("sourceFrame"));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceViewSnapshotImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceViewSnapshotImage = v5->_sourceViewSnapshotImage;
    v5->_sourceViewSnapshotImage = (UIImage *)v14;

    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("uncroppedFrame"));
    v5->_uncroppedFrame.origin.x = v16;
    v5->_uncroppedFrame.origin.y = v17;
    v5->_uncroppedFrame.size.width = v18;
    v5->_uncroppedFrame.size.height = v19;
    v5->_sourceFrame.origin.x = v7;
    v5->_sourceFrame.origin.y = v9;
    v5->_sourceFrame.size.width = v11;
    v5->_sourceFrame.size.height = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("topNavigationOffset"));
    v5->_topNavigationOffset = v20;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("hostNavigationOffset"));
    v5->_hostNavigationOffset = v21;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("previewItemSize"));
    v5->_previewItemSize.width = v22;
    v5->_previewItemSize.height = v23;
    v5->_isSourceTransformed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSourceTransformed"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("sourceBounds"));
    v5->_sourceBounds.origin.x = v24;
    v5->_sourceBounds.origin.y = v25;
    v5->_sourceBounds.size.width = v26;
    v5->_sourceBounds.size.height = v27;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("sourceCenter"));
    v5->_sourceCenter.x = v28;
    v5->_sourceCenter.y = v29;
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("sourceTransform"));
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
    }
    *(_OWORD *)&v5->_sourceTransform.a = v32;
    *(_OWORD *)&v5->_sourceTransform.c = v33;
    *(_OWORD *)&v5->_sourceTransform.tx = v34;
    v30 = v5;
  }

  return v5;
}

- (UIView)sourceViewSnapshot
{
  UIView *sourceViewSnapshot;
  id v4;
  UIView *v5;
  void *v6;
  UIView *v7;
  _OWORD v9[6];

  sourceViewSnapshot = self->_sourceViewSnapshot;
  if (!sourceViewSnapshot)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    -[QLTransitionContext sourceFrame](self, "sourceFrame");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    if (-[QLTransitionContext isSourceTransformed](self, "isSourceTransformed"))
    {
      -[QLTransitionContext sourceCenter](self, "sourceCenter");
      -[UIView setCenter:](v5, "setCenter:");
      -[QLTransitionContext sourceBounds](self, "sourceBounds");
      -[UIView setBounds:](v5, "setBounds:");
      -[QLTransitionContext sourceTransform](self, "sourceTransform");
      v9[0] = v9[3];
      v9[1] = v9[4];
      v9[2] = v9[5];
      -[UIView setTransform:](v5, "setTransform:", v9);
    }
    -[QLTransitionContext sourceViewSnapshotImage](self, "sourceViewSnapshotImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setImage:](v5, "setImage:", v6);

    -[UIView setContentMode:](v5, "setContentMode:", 1);
    v7 = self->_sourceViewSnapshot;
    self->_sourceViewSnapshot = v5;

    sourceViewSnapshot = self->_sourceViewSnapshot;
  }
  return sourceViewSnapshot;
}

- (void)_snapshotSourceViewIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIImage *v9;
  UIImage *sourceViewSnapshotImage;
  id v11;
  _QWORD v12[5];

  if (!self->_sourceViewSnapshotImage)
  {
    -[QLTransitionContext sourceView](self, "sourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[QLTransitionContext sourceView](self, "sourceView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v6 = v5;
      v8 = v7;

      if (v6 != 0.0 && v8 != 0.0)
      {
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v6, v8);
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __50__QLTransitionContext__snapshotSourceViewIfNeeded__block_invoke;
        v12[3] = &unk_24C7255D8;
        v12[4] = self;
        objc_msgSend(v11, "imageWithActions:", v12);
        v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        sourceViewSnapshotImage = self->_sourceViewSnapshotImage;
        self->_sourceViewSnapshotImage = v9;

      }
    }
  }
}

void __50__QLTransitionContext__snapshotSourceViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "sourceView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderInContext:", v3);

}

- (id)sourceViewSnapshotImage
{
  -[QLTransitionContext _snapshotSourceViewIfNeeded](self, "_snapshotSourceViewIfNeeded");
  return self->_sourceViewSnapshotImage;
}

- (QLTransitionContext)initWithQLPreviewController:(id)a3 containerView:(id)a4 toViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  QLTransitionContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id WeakRetained;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  QLTransitionContext *v41;
  objc_super v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_14;
  v43.receiver = self;
  v43.super_class = (Class)QLTransitionContext;
  v11 = -[QLTransitionContext init](&v43, sel_init);
  self = v11;
  if (!v11)
    goto LABEL_14;
  objc_storeWeak((id *)&v11->_previewController, v8);
  if (!+[QLTransitionContext useZoomTransitionForPreviewController:](QLTransitionContext, "useZoomTransitionForPreviewController:", v8))goto LABEL_14;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v10, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

  }
  -[QLTransitionContext setUpTransitionSourceView](self, "setUpTransitionSourceView");
  -[QLTransitionContext sourceView](self, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (self->_sourceViewSnapshotImage)
      goto LABEL_9;
LABEL_14:
    v41 = 0;
    goto LABEL_15;
  }

LABEL_9:
  +[QLTransitionContext firstChildNavigationControllerFromViewController:](QLTransitionContext, "firstChildNavigationControllerFromViewController:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[QLTransitionContext setTopNavigationOffset:](self, "setTopNavigationOffset:", 0.0);
    objc_msgSend(v10, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "statusBarManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "statusBarFrame");
    v20 = v19;
    -[QLTransitionContext topNavigationOffset](self, "topNavigationOffset");
    -[QLTransitionContext setTopNavigationOffset:](self, "setTopNavigationOffset:", v21 + v20);

    objc_msgSend(v14, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    -[QLTransitionContext topNavigationOffset](self, "topNavigationOffset");
    -[QLTransitionContext setTopNavigationOffset:](self, "setTopNavigationOffset:", v25 + v24);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);
  objc_msgSend(WeakRetained, "internalNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "navigationBar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  -[QLTransitionContext setHostNavigationOffset:](self, "setHostNavigationOffset:", v29);

  -[QLTransitionContext hostNavigationOffset](self, "hostNavigationOffset");
  if (v30 > 0.0)
  {
    objc_msgSend(v10, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "windowScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "statusBarManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "statusBarFrame");
    v36 = v35;
    -[QLTransitionContext hostNavigationOffset](self, "hostNavigationOffset");
    -[QLTransitionContext setHostNavigationOffset:](self, "setHostNavigationOffset:", v37 + v36);

  }
  objc_msgSend(v8, "internalCurrentPreviewItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v38, "previewSizeForItemViewControllerSize:", v39, v40);
  -[QLTransitionContext setPreviewItemSize:](self, "setPreviewItemSize:");

  self = self;
  v41 = self;
LABEL_15:

  return v41;
}

- (void)setUpTransitionSourceView
{
  QLPreviewController **p_previewController;
  id WeakRetained;
  _BOOL4 v5;
  id v6;
  void *v7;
  char v8;
  __int128 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double c;
  double d;
  double a;
  double b;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  UIImage *v38;
  UIImage *sourceViewSnapshotImage;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  QLTransitionContext *v70;
  uint64_t v71;
  id v72;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _OWORD v75[3];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[2];

  p_previewController = &self->_previewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);
  v5 = +[QLTransitionContext useViewTransitionForPreviewController:](QLTransitionContext, "useViewTransitionForPreviewController:", WeakRetained);

  v6 = objc_loadWeakRetained((id *)p_previewController);
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      *(_OWORD *)&t2.a = *MEMORY[0x24BDBF090];
      *(_OWORD *)&t2.c = v9;
      v79[0] = 0;
      v79[1] = 0;
      v10 = objc_loadWeakRetained((id *)p_previewController);
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)p_previewController);
      objc_msgSend(v12, "currentPreviewItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "previewController:transitionViewForPreviewItem:uncroppedSourceFrame:realSize:", v12, v13, &t2, v79);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[QLTransitionContext setSourceView:](self, "setSourceView:", v14);
      c = t2.c;
      d = t2.d;
      if (t2.c != *MEMORY[0x24BDBF148] || t2.d != *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        a = t2.a;
        b = t2.b;
LABEL_11:
        -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:", a, b, c, d);
        goto LABEL_14;
      }
    }
    else
    {
      v44 = objc_loadWeakRetained((id *)p_previewController);
      objc_msgSend(v44, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_opt_respondsToSelector();

      if ((v46 & 1) != 0)
      {
        memset(&t2, 0, 32);
        v47 = objc_loadWeakRetained((id *)p_previewController);
        objc_msgSend(v47, "delegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_loadWeakRetained((id *)p_previewController);
        objc_msgSend(v49, "currentPreviewItem");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "previewController:transitionViewForPreviewItem:uncroppedSourceFrame:", v49, v50, &t2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        -[QLTransitionContext setSourceView:](self, "setSourceView:", v51);
        a = t2.a;
        b = t2.b;
        c = t2.c;
        d = t2.d;
        goto LABEL_11;
      }
      v52 = objc_loadWeakRetained((id *)p_previewController);
      objc_msgSend(v52, "delegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_loadWeakRetained((id *)p_previewController);
      objc_msgSend(v54, "currentPreviewItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "previewController:transitionViewForPreviewItem:", v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      -[QLTransitionContext setSourceView:](self, "setSourceView:", v56);
    }
    -[QLTransitionContext sourceView](self, "sourceView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bounds");
    -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:");

LABEL_14:
    -[QLTransitionContext sourceView](self, "sourceView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      -[QLTransitionContext setUsingViewForZoomTransition:](self, "setUsingViewForZoomTransition:", 1);
      -[QLTransitionContext sourceView](self, "sourceView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "snapshotViewAfterScreenUpdates:", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLTransitionContext setSourceViewSnapshot:](self, "setSourceViewSnapshot:", v60);

      -[QLTransitionContext sourceView](self, "sourceView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLTransitionContext sourceView](self, "sourceView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "bounds");
      objc_msgSend(v61, "convertRect:toView:", 0);
      -[QLTransitionContext setSourceFrame:](self, "setSourceFrame:");

      -[QLTransitionContext sourceView](self, "sourceView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "bounds");
      -[QLTransitionContext setSourceBounds:](self, "setSourceBounds:");

      -[QLTransitionContext sourceView](self, "sourceView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "superview");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLTransitionContext sourceView](self, "sourceView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "center");
      objc_msgSend(v65, "convertPoint:toView:", 0);
      -[QLTransitionContext setSourceCenter:](self, "setSourceCenter:");

      -[QLTransitionContext sourceView](self, "sourceView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67)
      {
        objc_msgSend(v67, "transform");
      }
      else
      {
        v77 = 0u;
        v78 = 0u;
        v76 = 0u;
      }
      v75[0] = v76;
      v75[1] = v77;
      v75[2] = v78;
      -[QLTransitionContext setSourceTransform:](self, "setSourceTransform:", v75);

      -[QLTransitionContext sourceTransform](self, "sourceTransform");
      v69 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&t2.c = v69;
      *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        v70 = self;
        v71 = 0;
      }
      else
      {
        v70 = self;
        v71 = 1;
      }
      -[QLTransitionContext setIsSourceTransformed:](v70, "setIsSourceTransformed:", v71);
    }
    return;
  }
  v19 = objc_loadWeakRetained((id *)p_previewController);
  objc_msgSend(v19, "currentPreviewItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v7, "previewController:frameForPreviewItem:inSourceView:", v19, v20, &v72);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v72;
  if (v29)
  {
    objc_msgSend(v29, "convertRect:toView:", 0, v22, v24, v26, v28);
    v31 = v30;
    v33 = v32;
    memset(&t2, 0, 32);
    v34 = objc_loadWeakRetained((id *)p_previewController);
    objc_msgSend(v34, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_loadWeakRetained((id *)p_previewController);
    objc_msgSend(v36, "currentPreviewItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "previewController:transitionImageForPreviewItem:contentRect:", v36, v37, &t2);
    v38 = (UIImage *)objc_claimAutoreleasedReturnValue();

    sourceViewSnapshotImage = self->_sourceViewSnapshotImage;
    self->_sourceViewSnapshotImage = v38;

    v40 = v31 + t2.a;
    v41 = v33 + t2.b;
    v42 = t2.c;
    v43 = t2.d;
    -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), t2.c, t2.d);
    -[QLTransitionContext setSourceFrame:](self, "setSourceFrame:", v40, v41, v42, v43);
    -[QLTransitionContext setUsingViewForZoomTransition:](self, "setUsingViewForZoomTransition:", 0);
  }

}

+ (BOOL)useZoomTransitionForPreviewController:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (UIAccessibilityIsReduceMotionEnabled() || (objc_msgSend(v3, "parentIsNavigationController") & 1) != 0)
    v4 = 0;
  else
    v4 = +[QLTransitionContext useImageTransitionForPreviewController:](QLTransitionContext, "useImageTransitionForPreviewController:", v3)|| +[QLTransitionContext useViewTransitionForPreviewController:](QLTransitionContext, "useViewTransitionForPreviewController:", v3);

  return v4;
}

+ (BOOL)useImageTransitionForPreviewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

+ (BOOL)useViewTransitionForPreviewController:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

    }
  }

  return v5 & 1;
}

+ (id)firstChildNavigationControllerFromViewController:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "childViewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = v10;

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v4 = 0;
  }
LABEL_13:

  return v4;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void)setSourceViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, a3);
}

- (CGRect)sourceFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_sourceFrame, 32, 1, 0);
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

- (void)setSourceFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_sourceFrame, &v3, 32, 1, 0);
}

- (BOOL)isSourceTransformed
{
  return self->_isSourceTransformed;
}

- (void)setIsSourceTransformed:(BOOL)a3
{
  self->_isSourceTransformed = a3;
}

- (CGRect)sourceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_sourceBounds, 32, 1, 0);
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

- (void)setSourceBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_sourceBounds, &v3, 32, 1, 0);
}

- (CGPoint)sourceCenter
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_sourceCenter, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSourceCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_sourceCenter, &v3, 16, 1, 0);
}

- (CGAffineTransform)sourceTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_sourceTransform, 48, 1, 0);
  return result;
}

- (void)setSourceTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_sourceTransform, a3, 48, 1, 0);
}

- (CGRect)uncroppedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_uncroppedFrame, 32, 1, 0);
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

- (void)setUncroppedFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_uncroppedFrame, &v3, 32, 1, 0);
}

- (double)topNavigationOffset
{
  return self->_topNavigationOffset;
}

- (void)setTopNavigationOffset:(double)a3
{
  self->_topNavigationOffset = a3;
}

- (double)hostNavigationOffset
{
  return self->_hostNavigationOffset;
}

- (void)setHostNavigationOffset:(double)a3
{
  self->_hostNavigationOffset = a3;
}

- (BOOL)usingViewForZoomTransition
{
  return self->_usingViewForZoomTransition;
}

- (void)setUsingViewForZoomTransition:(BOOL)a3
{
  self->_usingViewForZoomTransition = a3;
}

- (CGSize)previewItemSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_previewItemSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewItemSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_previewItemSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceViewSnapshotImage, 0);
  objc_destroyWeak((id *)&self->_previewController);
}

@end
