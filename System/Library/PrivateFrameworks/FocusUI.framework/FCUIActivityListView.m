@implementation FCUIActivityListView

- (FCUIActivityListView)initWithFrame:(CGRect)a3
{
  FCUIActivityListView *v3;
  FCUIActivityListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCUIActivityListView;
  v3 = -[FCUIActivityListView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FCUIActivityListView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[FCUIActivityListView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
    -[FCUIActivityListView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[FCUIActivityListView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[FCUIActivityListView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("focus-modes-ui"));
    v4->_footerPinnedToBottom = 1;
  }
  return v4;
}

- (NSArray)activityViews
{
  return -[FCUIActivityListContentView activityViews](self->_contentView, "activityViews");
}

- (void)setActivityViews:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityListView activityViews](self, "activityViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualArrays();

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[FCUIActivityListContentView setActivityViews:](self->_contentView, "setActivityViews:", v6);
    -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
    -[FCUIActivityListContentView setNeedsLayout](self->_contentView, "setNeedsLayout");
  }

}

- (UIView)headerView
{
  return -[FCUIActivityListContentView headerView](self->_contentView, "headerView");
}

- (void)setHeaderView:(id)a3
{
  void *v4;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[FCUIActivityListView headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = v7;
    if (v7)
    {
      -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
      v6 = v7;
    }
    -[FCUIActivityListContentView setHeaderView:](self->_contentView, "setHeaderView:", v6);
    -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
  }

}

- (UIView)footerView
{
  return -[FCUIActivityListContentView footerView](self->_contentView, "footerView");
}

- (void)setFooterView:(id)a3
{
  void *v4;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[FCUIActivityListView footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = v7;
    if (v7)
    {
      -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
      v6 = v7;
    }
    -[FCUIActivityListContentView setFooterView:](self->_contentView, "setFooterView:", v6);
    -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
  }

}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  if (self->_footerPinnedToBottom != a3)
  {
    self->_footerPinnedToBottom = a3;
    -[FCUIActivityListContentView setFooterPinnedToBottom:](self->_contentView, "setFooterPinnedToBottom:");
    -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
  }
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 anchorActivityView:(id)a6 collapsedSizeBlock:(id)a7 preludeBlock:(id)a8 activityViewAnimationBlock:(id)a9 transitionCoordinator:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  double (**v20)(id);
  void (**v21)(id, _QWORD, uint64_t, void *, double, double, double, double, double, double, double, double);
  id v22;
  FCUIActivityListContentView *contentView;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  void (**v85)(_QWORD, double);
  void *v86;
  void *v87;
  double (**v88)(id);
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  double v107;
  id v108;
  double (**v109)(id);
  void (**v110)(double, double);
  void *v111;
  id obj;
  _QWORD v113[4];
  void (**v114)(_QWORD, double);
  _QWORD v115[4];
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD aBlock[5];
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v133 = *MEMORY[0x24BDAC8D0];
  v108 = a5;
  v103 = a6;
  v20 = (double (**)(id))a7;
  v110 = (void (**)(double, double))a8;
  v21 = (void (**)(id, _QWORD, uint64_t, void *, double, double, double, double, double, double, double, double))a9;
  v22 = a10;
  -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
  contentView = self->_contentView;
  BSRectWithSize();
  -[FCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  v25 = v24;
  v27 = v26;
  BSRectWithSize();
  -[FCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:", v25, v27, v28, v29, v30, v31);
  -[FCUIActivityListContentView subviewFramesInBounds:](contentView, "subviewFramesInBounds:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityListContentView activityViews](self->_contentView, "activityViews");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v22;
  objc_msgSend(v22, "transitionDuration");
  v35 = v34;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = v33;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v128 != v38)
          objc_enumerationMutation(obj);
        if (v35 > 0.0)
        {
          v40 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v41 = v40;
          else
            v41 = 0;
          v42 = v41;
          BSRectWithSize();
          objc_msgSend(v42, "willPresent:withTargetContainerBounds:transitionCoordinator:", 1, v111);

        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
    }
    while (v37);
  }

  v43 = MEMORY[0x24BDAC760];
  v125[0] = MEMORY[0x24BDAC760];
  v125[1] = 3221225472;
  v125[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke;
  v125[3] = &unk_24D20A920;
  v106 = v108;
  v126 = v106;
  objc_msgSend(obj, "bs_firstObjectPassingTest:", v125);
  v44 = objc_claimAutoreleasedReturnValue();
  -[FCUIActivityListContentView setCompactActivityView:](self->_contentView, "setCompactActivityView:", v44);
  -[FCUIActivityListView _orderedSubviewsIncludingHeader:andFooter:](self, "_orderedSubviewsIncludingHeader:andFooter:", 1, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityListContentView footerView](self->_contentView, "footerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    v48 = (void *)MEMORY[0x24BEBDB00];
    v123[0] = v43;
    v123[1] = 3221225472;
    v123[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_2;
    v123[3] = &unk_24D20A9C0;
    v124 = v46;
    objc_msgSend(v48, "performWithoutAnimation:", v123);

  }
  v102 = v47;
  v109 = v20;
  v49 = v20[2](v20);
  v51 = v50;
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:");
  v110[2](v49, v51);
  -[FCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  -[FCUIActivityListView _recalculateContentSize](self, "_recalculateContentSize");
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  aBlock[0] = v43;
  aBlock[1] = 3221225472;
  aBlock[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_3;
  aBlock[3] = &__block_descriptor_40_e23_v40__0d8d16q24___v___32l;
  v107 = v35;
  *(double *)&aBlock[4] = v35;
  v52 = _Block_copy(aBlock);
  v105 = (void *)v44;
  if (v103)
    v53 = v103;
  else
    v53 = (void *)v44;
  v54 = v53;

  v55 = objc_msgSend(v45, "indexOfObject:", v54);
  v104 = v54;
  objc_msgSend(v32, "objectForKey:", v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "CGRectValue");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;

  v121 = 0u;
  v119 = 0u;
  v120 = 0u;
  v118 = 0u;
  v65 = v45;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v119;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v119 != v68)
          objc_enumerationMutation(v65);
        v70 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j);
        objc_msgSend(v32, "objectForKey:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "CGRectValue");
        v73 = v72;
        v75 = v74;
        v77 = v76;
        v79 = v78;

        v80 = objc_msgSend(v65, "indexOfObject:", v70);
        if (v55 - v80 >= 0)
          v81 = v55 - v80;
        else
          v81 = v80 - v55;
        v21[2](v21, v70, v81, v52, v73, v75, v77, v79, v58, v60, v62, v64);
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
    }
    while (v67);
  }

  v82 = MEMORY[0x24BDAC760];
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_4;
  v115[3] = &unk_24D20A8D0;
  v83 = v102;
  v116 = v83;
  v84 = v32;
  v117 = v84;
  v85 = (void (**)(_QWORD, double))_Block_copy(v115);
  v86 = v85;
  if (v107 <= 0.0)
  {
    v85[2](v85, v107);
    v88 = v109;
    v87 = v111;
  }
  else
  {
    v113[0] = v82;
    v113[1] = 3221225472;
    v113[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_6;
    v113[3] = &unk_24D20ADA8;
    v114 = v85;
    v87 = v111;
    objc_msgSend(v111, "animateAlongsideTransition:completion:", 0, v113);

    v88 = v109;
  }
  objc_msgSend(v105, "superview");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "frame");
  objc_msgSend(v89, "convertRect:toView:", 0);
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v97 = v96;

  v98 = v91;
  v99 = v93;
  v100 = v95;
  v101 = v97;
  result.size.height = v101;
  result.size.width = v100;
  result.origin.y = v99;
  result.origin.x = v98;
  return result;
}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = BSEqualObjects();
  return v6;
}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  void (**v9)(void);
  double v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void (**v15)(void);

  v9 = a3;
  if (*(double *)(a1 + 32) > 0.0)
  {
    if (a2 <= 0)
      v10 = 0.0;
    else
      v10 = a4 + a5 * (double)a2;
    v15 = v9;
    v11 = objc_alloc(MEMORY[0x24BEBDB20]);
    v12 = *(double *)(a1 + 32);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD970]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 38.0, 0.0, 0.0);
    v14 = (void *)objc_msgSend(v11, "initWithDuration:timingParameters:", v13, v12);

    objc_msgSend(v14, "addAnimations:", v15);
    objc_msgSend(v14, "startAnimationAfterDelay:", v10);

    goto LABEL_8;
  }
  if (v9)
  {
    v15 = v9;
    v9[2]();
LABEL_8:
    v9 = v15;
  }

}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_5;
  v6 = &unk_24D20A8D0;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithoutAnimation:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, v3, v4, v5, v6);

}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  objc_msgSend(v1, "setFrame:");

}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, *(_QWORD *)(a1 + 32), 0, 0.0, 0.0);
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaScaleWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[10];
  _QWORD v31[14];
  _QWORD v32[9];
  _QWORD v33[4];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a5;
  v17 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x5010000000;
  v33[3] = "";
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke;
  v32[3] = &unk_24D20ADD0;
  v32[4] = self;
  *(double *)&v32[5] = v14;
  *(double *)&v32[6] = v13;
  *(double *)&v32[7] = v12;
  *(double *)&v32[8] = v11;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v31[3] = &unk_24D20ADF8;
  *(double *)&v31[6] = x;
  *(double *)&v31[7] = y;
  *(double *)&v31[8] = width;
  *(double *)&v31[9] = height;
  v31[4] = self;
  v31[5] = v33;
  *(double *)&v31[10] = v14;
  *(double *)&v31[11] = v13;
  *(double *)&v31[12] = v12;
  *(double *)&v31[13] = v11;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_4;
  v30[3] = &unk_24D20AE48;
  *(double *)&v30[6] = x;
  *(double *)&v30[7] = y;
  *(double *)&v30[8] = width;
  *(double *)&v30[9] = height;
  v30[4] = self;
  v30[5] = v33;
  -[FCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", v16, 0, v32, v31, v30, v17, v14, v13, v12, v11, x, y, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  _Block_object_dispose(v33, 8);

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "sizeThatFitsCollapsedToPill:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1, double a2, double a3)
{
  CGFloat v5;
  CGFloat Height;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;

  v5 = CGRectGetWidth(*(CGRect *)(a1 + 48)) / a2;
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeScale(&v15, v5, Height / a3);
  v7 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_OWORD *)&v15.c;
  v8 = *(_OWORD *)&v15.tx;
  v7[2] = *(_OWORD *)&v15.a;
  v7[3] = v9;
  v7[4] = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  v12[3] = &unk_24D20AC88;
  v12[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 96);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = v10;
  return objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v12);
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

void __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_4(_OWORD *a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  _QWORD *v20;
  void (*v21)(_QWORD *, uint64_t, _QWORD *, double, double);
  id v22;
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;

  v15 = a2;
  v16 = (void *)MEMORY[0x24BEBDB00];
  v17 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_5;
  v29[3] = &unk_24D20AE20;
  v18 = v15;
  v30 = v18;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v35 = a8;
  v19 = a1[2];
  v36 = a1[3];
  v37 = a1[4];
  v31 = v19;
  v20 = a4;
  objc_msgSend(v16, "performWithoutAnimation:", v29);
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_6;
  v23[3] = &unk_24D20AC88;
  v24 = v18;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v21 = (void (*)(_QWORD *, uint64_t, _QWORD *, double, double))v20[2];
  v22 = v18;
  v21(v20, a3, v23, 0.045, 0.025);

}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  _OWORD v7[3];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 2072), "convertRect:fromView:", 0, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  UIRectCenteredIntegralRectScale();
  objc_msgSend(v2, "setFrame:", 0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v5 = v4[3];
  v7[0] = v4[2];
  v7[1] = v5;
  v7[2] = v4[4];
  objc_msgSend(v3, "setTransform:", v7);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  __int128 v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  CAFrameRateRange v13;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_7;
  v9[3] = &unk_24D20AC88;
  v10 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v12 = v6;
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, *(double *)&v6, v7, v8);

}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaResizeWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  CGRect v11;
  _QWORD v12[5];
  CGRect v13;
  _QWORD v14[4];
  CGRect v15;
  CGRect result;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke;
  v14[3] = &__block_descriptor_64_e15__CGSize_dd_8__0l;
  v15 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v12[3] = &unk_24D20AE90;
  v12[4] = self;
  v13 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_4;
  v10[3] = &__block_descriptor_64_e106_v96__0__UIView_8_CGRect__CGPoint_dd__CGSize_dd__16_CGRect__CGPoint_dd__CGSize_dd__48q80___v__ddq___v____88l;
  v11 = a4;
  -[FCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", a5, 0, v14, v12, v10, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

double __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 48);
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[5];
  __int128 v4;
  __int128 v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  v3[3] = &unk_24D20AC88;
  v3[4] = *(_QWORD *)(a1 + 32);
  v1 = *(_OWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = v1;
  return objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v3);
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentSize");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v20;
  id v21;
  void *v22;
  float minimum;
  float maximum;
  float preferred;
  id v26;
  double v27;
  double v28;
  double v29;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CAFrameRateRange v48;

  v20 = a2;
  v21 = a4;
  v22 = (void *)MEMORY[0x24BEBDB00];
  v48 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v48.minimum;
  maximum = v48.maximum;
  preferred = v48.preferred;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_5;
  v34[3] = &unk_24D20AEB8;
  v37 = a9;
  v38 = a10;
  v39 = a11;
  v40 = a12;
  v41 = a3;
  *(_OWORD *)&v48.maximum = *(_OWORD *)(a1 + 48);
  v42 = *(_OWORD *)(a1 + 32);
  v43 = *(_OWORD *)&v48.maximum;
  v35 = v20;
  v36 = v21;
  v44 = a5;
  v45 = a6;
  v46 = a7;
  v47 = a8;
  v26 = v21;
  v33 = v20;
  *(float *)&v27 = minimum;
  *(float *)&v28 = maximum;
  *(float *)&v29 = preferred;
  objc_msgSend(v22, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v34, v27, v28, v29);

}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;

  v2 = 64;
  if (*(uint64_t *)(a1 + 80) > 0)
    v2 = 104;
  v3 = 72;
  if (*(uint64_t *)(a1 + 80) > 0)
    v3 = 112;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + v2), *(double *)(a1 + v3));
  v4 = MEMORY[0x24BDAC760];
  v5 = (void *)MEMORY[0x24BEBDB00];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_6;
  v15[3] = &unk_24D20A9C0;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v5, "performWithoutAnimation:", v15);
  v6 = *(_QWORD *)(a1 + 80);
  if (v6 >= 1)
  {
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_7;
    v11[3] = &unk_24D20AC88;
    v7 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v13 = *(_OWORD *)(a1 + 120);
    v14 = *(_OWORD *)(a1 + 136);
    (*(void (**)(uint64_t, uint64_t, _QWORD *, double, double))(v7 + 16))(v7, v6, v11, 0.045, 0.025);

    v6 = *(_QWORD *)(a1 + 80);
  }
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_9;
  v9[3] = &unk_24D20A9C0;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, _QWORD *, double, double))(v8 + 16))(v8, v6, v9, 0.115, 0.025);

}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  __int128 v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  CAFrameRateRange v13;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_8;
  v9[3] = &unk_24D20AC88;
  v10 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v12 = v6;
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, *(double *)&v6, v7, v8);

}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (a6 == 1)
    -[FCUIActivityListView _setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    -[FCUIActivityListView _setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a5 == 1)
    -[FCUIActivityListView _setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  else
    -[FCUIActivityListView _setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setExpandedActivityView:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  FCUIActivityListView *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = self;
  -[FCUIActivityListView activityViews](self, "activityViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v24 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      v13 = sel_gestureRecognizerForExclusionRelationships;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setExpanded:withTransitionCoordinator:", v16 == v6, v7);
          if (objc_msgSend(v17, "isExpanded"))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v17, "gestureRecognizerForExclusionRelationships");
              v18 = v8;
              v19 = v7;
              v20 = v6;
              v21 = v13;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[FCUIActivityListView panGestureRecognizer](v25, "panGestureRecognizer");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "requireGestureRecognizerToFail:", v23);

              v13 = v21;
              v6 = v20;
              v7 = v19;
              v8 = v18;
              v11 = v24;
            }
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __74__FCUIActivityListView_setExpandedActivityView_withTransitionCoordinator___block_invoke;
  v26[3] = &unk_24D20A948;
  v26[4] = v25;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v26, 0);

}

uint64_t __74__FCUIActivityListView_setExpandedActivityView_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)isolateActivityView:(id)a3 withInset:(UIEdgeInsets)a4
{
  double bottom;
  id v7;
  void *v8;
  void *v9;
  FCUIActivityDisplaying **p_isolatedActivityView;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FCUIActivityDisplaying *v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;

  bottom = a4.bottom;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[FCUIActivityListView activityViews](self, "activityViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  p_isolatedActivityView = &self->_isolatedActivityView;
  if (!self->_isolatedActivityView && objc_msgSend(v8, "containsObject:", v7))
  {
    objc_storeStrong((id *)&self->_isolatedActivityView, a3);
    -[FCUIActivityDisplaying setContracted:](*p_isolatedActivityView, "setContracted:", 1);
    -[FCUIActivityListView setNeedsLayout](self, "setNeedsLayout");
    -[FCUIActivityListView layoutIfNeeded](self, "layoutIfNeeded");
    -[FCUIActivityListView contentSize](self, "contentSize");
    v12 = v11;
    -[FCUIActivityDisplaying frame](*p_isolatedActivityView, "frame");
    -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", 0.0, bottom - (v12 - CGRectGetMaxY(v26) + -16.0));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(FCUIActivityDisplaying **)(*((_QWORD *)&v20 + 1) + 8 * v17);
          if (v18 == *p_isolatedActivityView)
            v19 = 1.0;
          else
            v19 = 0.0;
          -[FCUIActivityDisplaying setAlpha:](v18, "setAlpha:", v19, (_QWORD)v20);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

  }
}

- (void)endIsolation
{
  FCUIActivityDisplaying *isolatedActivityView;
  FCUIActivityDisplaying *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  isolatedActivityView = self->_isolatedActivityView;
  if (isolatedActivityView)
  {
    -[FCUIActivityDisplaying setExpanded:](isolatedActivityView, "setExpanded:", 1);
    v4 = self->_isolatedActivityView;
    self->_isolatedActivityView = 0;

    -[FCUIActivityListView setNeedsLayout](self, "setNeedsLayout");
    -[FCUIActivityListView layoutIfNeeded](self, "layoutIfNeeded");
    -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[FCUIActivityListView activityViews](self, "activityViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", 1.0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[FCUIActivityListContentView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  if (width >= v4)
    v4 = width;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[FCUIActivityListContentView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityListView;
  -[FCUIActivityListView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[FCUIActivityListContentView setNeedsLayout](self->_contentView, "setNeedsLayout");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FCUIActivityListView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)FCUIActivityListView;
  -[FCUIActivityListView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectEqualToRect(v17, v18))
    -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityListView;
  -[FCUIActivityListView layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_contentSizeValid)
    -[FCUIActivityListView _recalculateContentSize](self, "_recalculateContentSize");
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  int v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityListView;
  if (-[FCUIActivityListView touchesShouldCancelInContentView:](&v7, sel_touchesShouldCancelInContentView_, v4))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "isMenuElement") ^ 1;
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
  return -[FCUIActivityListContentView adjustsFontForContentSizeCategory](self->_contentView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[FCUIActivityListView _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
  -[FCUIActivityListContentView setAdjustsFontForContentSizeCategory:](self->_contentView, "setAdjustsFontForContentSizeCategory:", v3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIActivityListView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v3 = -[FCUIActivityListContentView adjustForContentSizeCategoryChange](self->_contentView, "adjustForContentSizeCategoryChange");
    if (v3)
    {
      -[FCUIActivityListContentView setNeedsLayout](self->_contentView, "setNeedsLayout");
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_configureContentViewIfNecessary
{
  FCUIActivityListContentView *v3;
  FCUIActivityListContentView *v4;
  FCUIActivityListContentView *contentView;

  if (!self->_contentView)
  {
    v3 = [FCUIActivityListContentView alloc];
    -[FCUIActivityListView bounds](self, "bounds");
    v4 = -[FCUIActivityListContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    -[FCUIActivityListContentView setFooterPinnedToBottom:](self->_contentView, "setFooterPinnedToBottom:", self->_footerPinnedToBottom);
    -[FCUIActivityListView addSubview:](self, "addSubview:", self->_contentView);
  }
}

- (CGSize)_contentSizeForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FCUIActivityListContentView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.size.width, a3.size.height);
  v8 = v7;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = CGRectGetWidth(v12);
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)_contentViewFrameForContentSize:(CGSize)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  CGRectGetHeight(a4);
  BSRectWithSize();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_recalculateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  self->_contentSizeValid = 1;
  -[FCUIActivityListView bounds](self, "bounds");
  -[FCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  v4 = v3;
  -[FCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:");
  v6 = v5;
  v8 = v7;
  -[FCUIActivityListContentView setFrame:](self->_contentView, "setFrame:");
  -[FCUIActivityListView setContentSize:](self, "setContentSize:", v6, v8);
  if (self->_footerPinnedToBottom)
  {
    v9 = MEMORY[0x24BDBEFB0];
    v10 = *MEMORY[0x24BDBEFB0];
    -[FCUIActivityListView safeAreaInsets](self, "safeAreaInsets");
    v15 = v14 + 12.0;
    if (v11 == 0.0)
      v11 = 12.0;
    if (v8 >= v15 + v4 + v11)
    {
      v16 = *(double *)(v9 + 8);
      v11 = *MEMORY[0x24BEBE158];
      v12 = *(double *)(MEMORY[0x24BEBE158] + 8);
      v15 = *(double *)(MEMORY[0x24BEBE158] + 16);
      v13 = *(double *)(MEMORY[0x24BEBE158] + 24);
    }
    else
    {
      v16 = -v11;
    }
    -[FCUIActivityListView setContentInset:](self, "setContentInset:", v11, v12, v15, v13);
    v17 = v16 == self->_initialContentOffset.y && v10 == self->_initialContentOffset.x;
    if (!v17 && v4 > 0.0)
    {
      self->_initialContentOffset.x = v10;
      self->_initialContentOffset.y = v16;
      -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", v10, v16);
    }
  }
}

- (void)_invalidateContentSize
{
  self->_contentSizeValid = 0;
  -[FCUIActivityListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[FCUIActivityListView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_activityViewForRepresentedActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCUIActivityListContentView activityViews](self->_contentView, "activityViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__FCUIActivityListView__activityViewForRepresentedActivity___block_invoke;
  v9[3] = &unk_24D20A920;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__FCUIActivityListView__activityViewForRepresentedActivity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = BSEqualObjects();
  return v6;
}

- (id)_orderedSubviewsIncludingHeader:(BOOL)a3 andFooter:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  -[FCUIActivityListContentView activityViews](self->_contentView, "activityViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v5)
  {
    -[FCUIActivityListContentView headerView](self->_contentView, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[FCUIActivityListContentView headerView](self->_contentView, "headerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertObject:atIndex:", v10, 0);

    }
  }
  if (v4)
  {
    -[FCUIActivityListContentView footerView](self->_contentView, "footerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[FCUIActivityListContentView footerView](self->_contentView, "footerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertObject:atIndex:", v12, 0);

    }
  }
  return v8;
}

- (CGRect)_setContractedFrame:(CGRect)a3 viaScaleWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  FCUIActivityListContentView *contentView;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double sx;
  CGFloat sxa;
  double v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGAffineTransform v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v55 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  -[FCUIActivityListView _activityViewForRepresentedActivity:](self, "_activityViewForRepresentedActivity:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  objc_msgSend(v13, "convertRect:toView:", 0);
  v40 = v15;
  v41 = v14;
  v38 = v17;
  v39 = v16;

  v45 = v12;
  -[FCUIActivityListContentView setCompactActivityView:](self->_contentView, "setCompactActivityView:", v12);
  contentView = self->_contentView;
  -[FCUIActivityListView bounds](self, "bounds");
  -[FCUIActivityListContentView sizeThatFitsCollapsedToPill:](contentView, "sizeThatFitsCollapsedToPill:", v19, v20);
  sx = v21;
  v44 = v22;
  -[FCUIActivityListContentView convertRect:fromView:](self->_contentView, "convertRect:fromView:", 0, x, y, width, height);
  memset(&v53, 0, sizeof(v53));
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  sxa = CGRectGetWidth(v56) / sx;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v23 = CGRectGetHeight(v57);
  CGAffineTransformMakeScale(&v53, sxa, v23 / v44);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[FCUIActivityListView _orderedSubviewsIncludingHeader:andFooter:](self, "_orderedSubviewsIncludingHeader:andFooter:", 1, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  v26 = MEMORY[0x24BDAC760];
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v50 != v28)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v32 = v31;
        BSRectWithSize();
        objc_msgSend(v32, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);
        objc_msgSend(v30, "frame");
        UIRectCenteredIntegralRectScale();
        objc_msgSend(v30, "setFrame:", 0);
        v48 = v53;
        objc_msgSend(v30, "setTransform:", &v48);
        v47[0] = v26;
        v47[1] = 3221225472;
        v47[2] = __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke;
        v47[3] = &unk_24D20A948;
        v47[4] = v30;
        objc_msgSend(v11, "animateAlongsideTransition:completion:", 0, v47);

      }
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v27);
  }

  -[FCUIActivityListContentView setContentDetached:](self->_contentView, "setContentDetached:", 1);
  objc_msgSend(v11, "transitionDuration");
  if (v33 <= 0.0)
  {
    -[FCUIActivityListContentView setContentDetached:](self->_contentView, "setContentDetached:", 0);
  }
  else
  {
    v46[0] = v26;
    v46[1] = 3221225472;
    v46[2] = __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2;
    v46[3] = &unk_24D20A948;
    v46[4] = self;
    objc_msgSend(v11, "animateAlongsideTransition:completion:", 0, v46);
  }

  v35 = v40;
  v34 = v41;
  v37 = v38;
  v36 = v39;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

uint64_t __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "setContentDetached:", 0);
}

- (CGRect)_setContractedFrame:(CGRect)a3 viaResizeWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  -[FCUIActivityListView _activityViewForRepresentedActivity:](self, "_activityViewForRepresentedActivity:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  objc_msgSend(v13, "convertRect:toView:", 0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v34 = v12;
  -[FCUIActivityListContentView setCompactActivityView:](self->_contentView, "setCompactActivityView:", v12);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[FCUIActivityListContentView activityViews](self->_contentView, "activityViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;
        BSRectWithSize();
        objc_msgSend(v29, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v24);
  }

  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", width, height);
  -[FCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  -[FCUIActivityListView _invalidateContentSize](self, "_invalidateContentSize");
  -[FCUIActivityListContentView setNeedsLayout](self->_contentView, "setNeedsLayout");
  -[FCUIActivityListView layoutIfNeeded](self, "layoutIfNeeded");

  v30 = v15;
  v31 = v17;
  v32 = v19;
  v33 = v21;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedActivityView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
