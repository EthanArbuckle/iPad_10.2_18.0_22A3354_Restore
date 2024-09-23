@implementation MCProfileTitlePageMetaDataSectionAnimationController

- (void)startTrackingWithMetaDataSectionController:(id)a3 topBar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MCProfileTitlePageMetaDataSectionAnimationController setSectionController:](self, "setSectionController:", v7);
  objc_msgSend(v7, "titleCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController setTitleView:](self, "setTitleView:", v9);

  objc_msgSend(v7, "subtitleCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController setSubtitleView:](self, "setSubtitleView:", v11);

  objc_msgSend(v7, "iconCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController setIconView:](self, "setIconView:", v13);

  objc_msgSend(v7, "orgCell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController setOrgView:](self, "setOrgView:", v15);

  -[MCProfileTitlePageMetaDataSectionAnimationController setTopBar:](self, "setTopBar:", v6);
  objc_msgSend(v7, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[MCProfileTitlePageMetaDataSectionAnimationController setTableView:](self, "setTableView:", v16);
}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double MidY;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double MinY;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  id v68;
  CGRect v69;
  CGRect v70;

  v5 = a5;
  -[MCProfileTitlePageMetaDataSectionAnimationController titleView](self, "titleView");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController subtitleView](self, "subtitleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageMetaDataSectionAnimationController orgView](self, "orgView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 0.0 || v5)
  {
    v66 = a4;
    v24 = a3 / a4;
    v25 = 1.0;
    if (a3 / a4 <= 1.0)
      v25 = a3 / a4;
    v26 = fmax(v25, 0.0);
    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController", *(_QWORD *)&v66);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "titleCell");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MCProfileTitlePageMetaDataSectionAnimationController _relocateViewIfNeeded:fromView:toView:](self, "_relocateViewIfNeeded:fromView:toView:", v68, v29, v30);

    if (v31)
    {
      objc_msgSend(v68, "frame");
      -[MCProfileTitlePageMetaDataSectionAnimationController setTitleLabelOriginFrame:](self, "setTitleLabelOriginFrame:");
    }
    else
    {
      -[MCProfileTitlePageMetaDataSectionAnimationController titleLabelOriginFrame](self, "titleLabelOriginFrame");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      MidY = CGRectGetMidY(v69);
      if (v24 >= 0.0)
        v42 = 0.0;
      else
        v42 = a3;
      -[MCProfileTitlePageMetaDataSectionAnimationController _animateView:progress:startFrame:endY:endScale:extraYOffset:](self, "_animateView:progress:startFrame:endY:endScale:extraYOffset:", v68, v26, v33, v35, v37, v39, MidY, 0.6, v42);

    }
    v43 = fmax(a3, 0.0);
    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "iconCell");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MCProfileTitlePageMetaDataSectionAnimationController _relocateViewIfNeeded:fromView:toView:](self, "_relocateViewIfNeeded:fromView:toView:", v9, v46, v47);

    if (v48)
    {
      objc_msgSend(v9, "frame");
      -[MCProfileTitlePageMetaDataSectionAnimationController setIconViewOriginFrame:](self, "setIconViewOriginFrame:");
    }
    else
    {
      -[MCProfileTitlePageMetaDataSectionAnimationController iconViewOriginFrame](self, "iconViewOriginFrame");
      v50 = v49;
      v52 = v51;
      v54 = v53;
      v56 = v55;
      -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "frame");
      MinY = CGRectGetMinY(v70);
      if (v24 >= 0.0)
        v59 = 0.0;
      else
        v59 = a3;
      -[MCProfileTitlePageMetaDataSectionAnimationController _animateView:progress:startFrame:endY:endScale:extraYOffset:](self, "_animateView:progress:startFrame:endY:endScale:extraYOffset:", v9, v26, v50, v52, v54, v56, MinY, 1.0, v59);

    }
    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "subtitleCell");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", v5, v43, v67);

    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "orgCell");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "updateProgressWithTranslationDistance:referenceDistance:isScrolling:", v5, v43, v67);

    if (updateProgressWithTranslationDistance_referenceDistance_isScrolling__onceToken != -1)
      dispatch_once(&updateProgressWithTranslationDistance_referenceDistance_isScrolling__onceToken, &__block_literal_global);
    -[MCProfileTitlePageMetaDataSectionAnimationController _alphaWithProgress:keys:values:](self, "_alphaWithProgress:keys:values:", updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray, updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray, v26);
    objc_msgSend(v9, "setAlpha:");
    -[MCProfileTitlePageMetaDataSectionAnimationController _alphaWithProgress:keys:values:](self, "_alphaWithProgress:keys:values:", updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray, updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray, v26);
    objc_msgSend(v10, "setAlpha:");
    -[MCProfileTitlePageMetaDataSectionAnimationController _alphaWithProgress:keys:values:](self, "_alphaWithProgress:keys:values:", updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray, updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray, v26);
    objc_msgSend(v11, "setAlpha:");
    -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "backgroundColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageMetaDataSectionAnimationController _alphaWithProgress:keys:values:](self, "_alphaWithProgress:keys:values:", updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray, updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray, v26);
    objc_msgSend(v65, "colorWithAlphaComponent:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCProfileTitlePageMetaDataSectionAnimationController topBar](self, "topBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);
    goto LABEL_24;
  }
  -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MCProfileTitlePageMetaDataSectionAnimationController _putBackViewIfNeeded:toView:](self, "_putBackViewIfNeeded:toView:", v9, v14);

  if (v15)
  {
    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsLayout");

  }
  -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleCell");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MCProfileTitlePageMetaDataSectionAnimationController _putBackViewIfNeeded:toView:](self, "_putBackViewIfNeeded:toView:", v68, v20);

  if (v21)
  {
    -[MCProfileTitlePageMetaDataSectionAnimationController sectionController](self, "sectionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "titleCell");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNeedsLayout");
LABEL_24:

  }
}

void __124__MCProfileTitlePageMetaDataSectionAnimationController_updateProgressWithTranslationDistance_referenceDistance_isScrolling___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v0 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray = (uint64_t)&unk_1EA2C22B8;

  v1 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray = (uint64_t)&unk_1EA2C22D0;

  v2 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray = (uint64_t)&unk_1EA2C22E8;

  v3 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray = (uint64_t)&unk_1EA2C2300;

  v4 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray = (uint64_t)&unk_1EA2C2318;

  v5 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray = (uint64_t)&unk_1EA2C2330;

  v6 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray = (uint64_t)&unk_1EA2C2348;

  v7 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray = (uint64_t)&unk_1EA2C2360;

}

- (BOOL)_putBackViewIfNeeded:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(v5, "removeFromSuperview");
    objc_msgSend(v6, "addSubview:", v5);
  }

  return v7 != v6;
}

- (BOOL)_relocateViewIfNeeded:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "superview");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    objc_msgSend(v7, "frame");
    objc_msgSend(v8, "convertRect:toView:", v9);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "removeFromSuperview");
    objc_msgSend(v9, "addSubview:", v7);
    objc_msgSend(v7, "setFrame:", v12, v14, v16, v18);
  }

  return v10 == v8;
}

- (void)_animateView:(id)a3 progress:(double)a4 startFrame:(CGRect)a5 endY:(double)a6 endScale:(double)a7 extraYOffset:(double)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  CGFloat v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v17 = (CGRectGetMidY(v20) - a6) * a4;
  CGAffineTransformMakeScale(&v19, 1.0 - (1.0 - a7) * a4, 1.0 - (1.0 - a7) * a4);
  v18 = v19;
  objc_msgSend(v16, "setTransform:", &v18);
  objc_msgSend(v16, "setFrame:", x, y - (v17 + a8), width, height);

}

- (double)_alphaWithProgress:(double)a3 keys:(id)a4 values:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  float v23;
  float v24;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count") == 2)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    v10 = -[MCProfileTitlePageMetaDataSectionAnimationController _binarySearch:target:](self, "_binarySearch:target:", v8, a3);
    if (v10 == objc_msgSend(v8, "count") - 1)
      v11 = v10;
    else
      v11 = v10 + 1;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;
  v21 = v19;

  objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (v20 != v24)
    v21 = v21 + (v24 - v21) * ((a3 - v14) / (v17 - v14));

  return v21;
}

- (unint64_t)_binarySearch:(id)a3 target:(double)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "count") - 1;
  if (v6 < 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7 + ((v6 - v7) >> 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

      if (v10 > a4)
        v6 = v7 + ((v6 - v7) >> 1);
      else
        v7 += (v6 - v7) >> 1;
    }
    while (v7 + 1 < v6);
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (v13 > a4)
    v6 = v7;

  return v6;
}

- (MCProfileTitlePageMetaDataSectionController)sectionController
{
  return (MCProfileTitlePageMetaDataSectionController *)objc_loadWeakRetained((id *)&self->_sectionController);
}

- (void)setSectionController:(id)a3
{
  objc_storeWeak((id *)&self->_sectionController, a3);
}

- (UIView)iconView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (UIView)titleView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleView);
}

- (void)setTitleView:(id)a3
{
  objc_storeWeak((id *)&self->_titleView, a3);
}

- (UIView)subtitleView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_subtitleView);
}

- (void)setSubtitleView:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleView, a3);
}

- (UIView)orgView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_orgView);
}

- (void)setOrgView:(id)a3
{
  objc_storeWeak((id *)&self->_orgView, a3);
}

- (UIView)topBar
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topBar);
}

- (void)setTopBar:(id)a3
{
  objc_storeWeak((id *)&self->_topBar, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (CGRect)iconViewOriginFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_iconViewOriginFrame.origin.x;
  y = self->_iconViewOriginFrame.origin.y;
  width = self->_iconViewOriginFrame.size.width;
  height = self->_iconViewOriginFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setIconViewOriginFrame:(CGRect)a3
{
  self->_iconViewOriginFrame = a3;
}

- (CGRect)titleLabelOriginFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleLabelOriginFrame.origin.x;
  y = self->_titleLabelOriginFrame.origin.y;
  width = self->_titleLabelOriginFrame.size.width;
  height = self->_titleLabelOriginFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTitleLabelOriginFrame:(CGRect)a3
{
  self->_titleLabelOriginFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_topBar);
  objc_destroyWeak((id *)&self->_orgView);
  objc_destroyWeak((id *)&self->_subtitleView);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_sectionController);
}

@end
