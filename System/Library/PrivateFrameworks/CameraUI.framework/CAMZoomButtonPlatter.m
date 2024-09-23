@implementation CAMZoomButtonPlatter

- (CAMZoomButtonPlatter)initWithFrame:(CGRect)a3
{
  CAMZoomButtonPlatter *v3;
  UIImageView *v4;
  UIImageView *platterBackgroundView;
  uint64_t v6;
  NSMutableArray *allButtons;
  NSArray *zoomPoints;
  CAMZoomButtonPlatter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMZoomButtonPlatter;
  v3 = -[CAMZoomButtonPlatter initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    platterBackgroundView = v3->__platterBackgroundView;
    v3->__platterBackgroundView = v4;

    -[CAMZoomButtonPlatter addSubview:](v3, "addSubview:", v3->__platterBackgroundView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    allButtons = v3->__allButtons;
    v3->__allButtons = (NSMutableArray *)v6;

    zoomPoints = v3->_zoomPoints;
    v3->_zoomPoints = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_preferredCustomLens = 0;
    -[CAMZoomButtonPlatter _updateForContentSize](v3, "_updateForContentSize");
    v9 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double MaxX;
  double v23;
  id v24;
  _QWORD v25[8];
  CGRect v26;
  CGRect v27;

  -[CAMZoomButtonPlatter bounds](self, "bounds");
  -[CAMZoomButtonPlatter intrinsicContentSize](self, "intrinsicContentSize");
  UIRectCenteredIntegralRectScale();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomButtonPlatter _platterBackgroundView](self, "_platterBackgroundView", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = -[CAMZoomButtonPlatter buttonCount](self, "buttonCount");
  -[CAMZoomButtonPlatter traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v14);
  v16 = v15 * 0.5;

  UIRectGetCenter();
  v18 = v17;
  v20 = v19;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v21 = v16 + CGRectGetMinX(v26) + 3.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  MaxX = CGRectGetMaxX(v27);
  v23 = 0.0;
  if (v12 >= 2)
    v23 = (MaxX - v16 + -3.0 - v21) / (double)(v12 - 1);
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __38__CAMZoomButtonPlatter_layoutSubviews__block_invoke;
  v25[3] = &__block_descriptor_64_e30_v32__0__CAMZoomButton_8Q16_B24l;
  v25[4] = v18;
  v25[5] = v20;
  *(double *)&v25[6] = v21;
  *(double *)&v25[7] = v23;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v25);

}

void __38__CAMZoomButtonPlatter_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v6, "frameForAlignmentRect:");
  CAMViewSetBoundsAndCenterForFrame(v6, v2, v3, v4, v5);

}

- (CGSize)intrinsicContentSize
{
  unint64_t v3;
  double v4;
  double v5;
  CGSize result;

  if (-[CAMZoomButtonPlatter isCollapsed](self, "isCollapsed"))
    v3 = 1;
  else
    v3 = -[CAMZoomButtonPlatter buttonCount](self, "buttonCount");
  -[CAMZoomButtonPlatter _intrinsicContentSizeForButtonCount:](self, "_intrinsicContentSizeForButtonCount:", v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_intrinsicContentSizeForButtonCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CAMZoomButtonPlatter traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v5);
  v7 = v6;

  v8 = v7 + 6.0;
  v9 = (double)(a3 + 1) * 3.0 + v7 * (double)a3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMZoomButtonPlatter _updateForContentSize](self, "_updateForContentSize");
    -[CAMZoomButtonPlatter setNeedsLayout](self, "setNeedsLayout");
  }

}

- (unint64_t)buttonCount
{
  void *v2;
  unint64_t v3;

  -[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setZoomFactor:(double)a3
{
  -[CAMZoomButtonPlatter setZoomFactor:allowFlashingSubstate:animated:](self, "setZoomFactor:allowFlashingSubstate:animated:", 0, 0, a3);
}

- (void)setZoomFactor:(double)a3 allowFlashingSubstate:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;

  if (self->_zoomFactor != a3)
  {
    v5 = a5;
    self->_zoomFactor = a3;
    if (a4 && a5)
      -[CAMZoomButtonPlatter _flashFocalLengthIfNeeded](self, "_flashFocalLengthIfNeeded");
    -[CAMZoomButtonPlatter _updateButtonsAnimated:](self, "_updateButtonsAnimated:", v5);
    -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 0);
  }
}

- (CAMZoomButton)zoomFactorButton
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  -[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  -[CAMZoomButtonPlatter zoomFactor](self, "zoomFactor");
  v5 = v4;
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__CAMZoomButtonPlatter_zoomFactorButton__block_invoke;
  v10[3] = &unk_1EA32CB48;
  v7 = v3;
  v13 = v5;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (CAMZoomButton *)v8;
}

void __40__CAMZoomButtonPlatter_zoomFactorButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fundamentalZoomPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayZoomFactor");
  v11 = v10;

  if (*(double *)(a1 + 48) >= v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setZoomPoints:(id)a3
{
  -[CAMZoomButtonPlatter setZoomPoints:animated:](self, "setZoomPoints:animated:", a3, 0);
}

- (void)setZoomPoints:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  float v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  NSArray *v36;
  NSArray *zoomPoints;
  NSArray *v38;
  NSArray *zoomFactors;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  id obja;
  _BOOL4 v49;
  _QWORD v50[4];
  id v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  _OWORD v54[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[5];
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v49 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = objc_msgSend(v5, "count");
  if ((objc_msgSend(v5, "isEqualToArray:", self->_zoomPoints) & 1) == 0)
  {
    v43 = v5;
    -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v6, "copy");
    -[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v41, "count");
    objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", v41, 0, &__block_literal_global_32);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v42, "removals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v77 != v9)
            objc_enumerationMutation(obj);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "index");
          objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeObjectAtIndex:", v11);
          if (v49)
          {
            objc_msgSend(v12, "layer");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "presentationLayer");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              v16 = v14;
            }
            else
            {
              objc_msgSend(v12, "layer");
              v16 = (id)objc_claimAutoreleasedReturnValue();
            }
            v17 = v16;

            objc_msgSend(v17, "position");
            objc_msgSend(v12, "setCenter:");
            objc_msgSend(v17, "opacity");
            objc_msgSend(v12, "setAlpha:", v18);
            v19 = MEMORY[0x1E0C809B0];
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_2;
            v71[3] = &unk_1EA32CBB0;
            v74 = v45;
            v75 = v11;
            v73 = v46;
            v71[4] = self;
            v72 = v12;
            v69[0] = v19;
            v69[1] = 3221225472;
            v69[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_3;
            v69[3] = &unk_1EA328A68;
            v70 = v72;
            +[CAMView animateIfNeededWithDuration:animations:completion:](CAMView, "animateIfNeededWithDuration:animations:completion:", v71, v69, 0.3);

          }
          else
          {
            objc_msgSend(v12, "removeFromSuperview");
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v8);
    }

    objc_msgSend(v42, "insertions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomButtonPlatter _indexesForChanges:](self, "_indexesForChanges:", v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v64 = &v63;
    v65 = 0x3010000000;
    v67 = 0;
    v68 = 0;
    v66 = "";
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_4;
    v62[3] = &unk_1EA32CBD8;
    v62[4] = &v63;
    objc_msgSend(v40, "enumerateRangesUsingBlock:", v62);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v59;
      obja = (id)(v45 - 1);
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v59 != v23)
            objc_enumerationMutation(v21);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v24), "index");
          -[CAMZoomButtonPlatter _createZoomButton](self, "_createZoomButton");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "insertObject:atIndex:", v26, v25);
          -[CAMZoomButtonPlatter addSubview:](self, "addSubview:", v26);
          if (v49)
          {
            if (v64[4])
            {
              if (v25 < (unint64_t)obja)
                goto LABEL_33;
LABEL_30:
              objc_msgSend(v44, "lastObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            }
            v27 = v64[5];
            if (v25 < v27 || v25 >= (unint64_t)obja)
            {
              if (v25 >= v27)
                goto LABEL_30;
              objc_msgSend(v44, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
              v30 = v29;
              objc_msgSend(v29, "center");
              objc_msgSend(v26, "setCenter:");
              objc_msgSend(v30, "bounds");
              objc_msgSend(v26, "setBounds:");
              if (v30)
              {
                objc_msgSend(v30, "transform");
              }
              else
              {
                v56 = 0u;
                v57 = 0u;
                v55 = 0u;
              }
              v54[0] = v55;
              v54[1] = v56;
              v54[2] = v57;
              objc_msgSend(v26, "setTransform:", v54);

            }
            else
            {
LABEL_33:
              -[CAMZoomButtonPlatter traitCollection](self, "traitCollection");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "preferredContentSizeCategory");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v32);
              v34 = v33;

              objc_msgSend(v26, "setBounds:", 0.0, 0.0, v34, v34);
              -[CAMZoomButtonPlatter bounds](self, "bounds");
              UIRectGetCenter();
              objc_msgSend(v26, "setCenter:");
              CGAffineTransformMakeScale(&v53, 0.65, 0.65);
              v52 = v53;
              objc_msgSend(v26, "setTransform:", &v52);
            }
            objc_msgSend(v26, "setAlpha:", 0.0);
            objc_msgSend(v26, "layoutIfNeeded");
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_5;
            v50[3] = &unk_1EA328868;
            v51 = v26;
            +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v50, 0.3);

          }
          ++v24;
        }
        while (v22 != v24);
        v35 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
        v22 = v35;
      }
      while (v35);
    }

    v36 = (NSArray *)objc_msgSend(v43, "copy");
    zoomPoints = self->_zoomPoints;
    self->_zoomPoints = v36;

    +[CAMZoomPoint displayZoomFactorsFromZoomPoints:](CAMZoomPoint, "displayZoomFactorsFromZoomPoints:", v43);
    v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
    zoomFactors = self->_zoomFactors;
    self->_zoomFactors = v38;

    -[CAMZoomButtonPlatter _updateButtonsAnimated:](self, "_updateButtonsAnimated:", 0);
    -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 0);
    -[CAMZoomButtonPlatter _cancelFocalLengthFlash](self, "_cancelFocalLengthFlash");
    if (v46 != v45)
      -[CAMZoomButtonPlatter invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    _Block_object_dispose(&v63, 8);

    v5 = v43;
  }

}

BOOL __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL8 v10;

  v4 = a3;
  objc_msgSend(a2, "fundamentalZoomPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayZoomFactor");
  v7 = v6;
  objc_msgSend(v4, "fundamentalZoomPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayZoomFactor");
  v10 = v7 == v9;

  return v10;
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 48) < v2 && *(_QWORD *)(a1 + 64) >= v2 >> 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_intrinsicContentSizeForButtonCount:");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_intrinsicContentSizeForButtonCount:", *(_QWORD *)(a1 + 48));
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "center");
    objc_msgSend(*(id *)(a1 + 40), "setCenter:", v7 + (v4 - v6) * -0.5);
  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (id)nearestZoomButtonForTouch:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0x7FEFFFFFFFFFFFFFLL;
  if (-[CAMZoomButtonPlatter isCollapsed](self, "isCollapsed"))
  {
    -[CAMZoomButtonPlatter zoomFactorButton](self, "zoomFactorButton");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__CAMZoomButtonPlatter_nearestZoomButtonForTouch___block_invoke;
    v13[3] = &unk_1EA32CC00;
    v13[6] = v6;
    v13[7] = v8;
    v13[4] = v14;
    v13[5] = &v15;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  }

  v11 = (id)v16[5];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __50__CAMZoomButtonPlatter_nearestZoomButtonForTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "center");
  UIDistanceBetweenPoints();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 >= *(double *)(v8 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)baseZoomPointForButton:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (-[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    -[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (double)defaultZoomFactorForButton:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[CAMZoomButtonPlatter baseZoomPointForButton:](self, "baseZoomPointForButton:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter _zoomFactorForButton:zoomPoint:isZoomFactorButton:](self, "_zoomFactorForButton:zoomPoint:isZoomFactorButton:", v4, v5, 0);
  v7 = v6;

  return v7;
}

- (void)setCollapsed:(BOOL)a3
{
  -[CAMZoomButtonPlatter setCollapsed:animated:](self, "setCollapsed:animated:", a3, 0);
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_collapsed != a3)
  {
    if (a4)
    {
      -[CAMZoomButtonPlatter layoutIfNeeded](self, "layoutIfNeeded");
      self->_collapsed = a3;
      -[CAMZoomButtonPlatter _updateButtonsAnimated:](self, "_updateButtonsAnimated:", 1);
      -[CAMZoomButtonPlatter _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 1);
      -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 1);
      -[CAMZoomButtonPlatter setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__CAMZoomButtonPlatter_setCollapsed_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.3);
    }
    else
    {
      self->_collapsed = a3;
      -[CAMZoomButtonPlatter _updateButtonsAnimated:](self, "_updateButtonsAnimated:", 0);
      -[CAMZoomButtonPlatter _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
      -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", 0);
      -[CAMZoomButtonPlatter setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __46__CAMZoomButtonPlatter_setCollapsed_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setButtonAccessoryState:(int64_t)a3
{
  -[CAMZoomButtonPlatter setButtonAccessoryState:animated:](self, "setButtonAccessoryState:animated:", a3, 0);
}

- (void)setButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_buttonAccessoryState != a3)
  {
    self->_buttonAccessoryState = a3;
    -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", a4);
  }
}

- (void)setButtonAccessoryPosition:(int64_t)a3
{
  -[CAMZoomButtonPlatter setButtonAccessoryPosition:animated:](self, "setButtonAccessoryPosition:animated:", a3, 0);
}

- (void)setButtonAccessoryPosition:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_buttonAccessoryPosition != a3)
  {
    self->_buttonAccessoryPosition = a3;
    -[CAMZoomButtonPlatter _updateButtonAccessoryAnimated:](self, "_updateButtonAccessoryAnimated:", a4);
  }
}

- (void)_updateButtonAccessoryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[CAMZoomButtonPlatter buttonAccessoryState](self, "buttonAccessoryState");
  -[CAMZoomButtonPlatter zoomFactorButton](self, "zoomFactorButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMZoomButtonPlatter isCollapsed](self, "isCollapsed");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if (v7 && v13 == v6)
          v14 = v5;
        else
          v14 = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "setAccessoryState:animated:", v14, v3);
        objc_msgSend(v13, "setAccessoryPosition:animated:", -[CAMZoomButtonPlatter buttonAccessoryPosition](self, "buttonAccessoryPosition"), v3);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)setPreferredCustomLens:(int64_t)a3
{
  if (self->_preferredCustomLens != a3)
  {
    self->_preferredCustomLens = a3;
    -[CAMZoomButtonPlatter _updateButtonsAnimated:](self, "_updateButtonsAnimated:", 0);
  }
}

- (void)_updateForContentSize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CAMZoomButtonPlatter traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMZoomButtonPlatter _createPlatterImageForContentSize:](self, "_createPlatterImageForContentSize:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter _platterBackgroundView](self, "_platterBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.3;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CAMZoomButtonPlatter__updateBackgroundAnimated___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v4, v3);
}

void __50__CAMZoomButtonPlatter__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  v2 = (double)(objc_msgSend(*(id *)(a1 + 32), "isCollapsed") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "_platterBackgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)_updateButtonsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  float v20;
  double v21;
  double v23;
  id v24;
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  CAMZoomButtonPlatter *v32;
  BOOL v33;
  BOOL v34;
  char v35;

  v3 = a3;
  -[CAMZoomButtonPlatter zoomPoints](self, "zoomPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter zoomFactorButton](self, "zoomFactorButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMZoomButtonPlatter isCollapsed](self, "isCollapsed");
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayZoomFactor");
  v11 = v10;

  objc_msgSend(v5, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayZoomFactor");
  v14 = v13;

  v15 = v11;
  v16 = floorf(v15);
  +[CAMZoomButton zoomFactorFormatter](CAMZoomButton, "zoomFactorFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "decimalSeparator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR(","));

  v20 = v14;
  v21 = floorf(v20);
  if (v11 == v16 || v14 == v21)
  {
    if (objc_msgSend(v6, "count") == 2)
      v27 = 1;
    else
      v27 = v19;
  }
  else
  {
    v27 = 1;
  }
  if (v3)
    v23 = 0.3;
  else
    v23 = 0.0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke;
  v28[3] = &unk_1EA32CC50;
  v29 = v6;
  v30 = v5;
  v33 = v3;
  v34 = v8;
  v31 = v7;
  v32 = self;
  v35 = v27;
  v24 = v7;
  v25 = v5;
  v26 = v6;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v28, v23);

}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  __int16 v10;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_2;
  v5[3] = &unk_1EA32CC28;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 64);
  v10 = *(_WORD *)(a1 + 65);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  double v12;
  BOOL v13;
  unsigned int v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  char v20;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 40);
  if (!*(_BYTE *)(a1 + 56) || (*(_BYTE *)(a1 + 57) ? (v8 = v7 == v5) : (v8 = 1), v8))
  {
    objc_msgSend(*(id *)(a1 + 48), "_zoomFactorForButton:zoomPoint:isZoomFactorButton:", v5, v6, v7 == v5);
    objc_msgSend(v5, "setZoomFactor:");
    objc_msgSend(v5, "setAbbreviateAndEnlargeText:", v7 != v5);
    v9 = v7 == v5 || *(_BYTE *)(a1 + 58) != 0;
    objc_msgSend(v5, "setUseLeadingZero:", v9);
  }
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_3;
  v17[3] = &unk_1EA32AB20;
  v18 = v5;
  v19 = v7 == v5;
  v20 = *(_BYTE *)(a1 + 57);
  v11 = v5;
  objc_msgSend(v10, "performWithoutAnimation:", v17);
  if (v7 == v5)
  {
    v12 = 1.0;
  }
  else
  {
    v12 = 0.65;
    if (*(_BYTE *)(a1 + 57))
      v12 = 0.5;
  }
  CGAffineTransformMakeScale(&v16, v12, v12);
  v15 = v16;
  objc_msgSend(v11, "setTransform:", &v15);
  if (*(_BYTE *)(a1 + 57))
    v13 = v7 == v5;
  else
    v13 = 1;
  v14 = v13;
  objc_msgSend(v11, "setAlpha:", (double)v14);

}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v2);

}

- (double)_zoomFactorForButton:(id)a3 zoomPoint:(id)a4 isZoomFactorButton:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint64_t v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    -[CAMZoomButtonPlatter zoomFactor](self, "zoomFactor");
LABEL_8:
    v17 = v11;
    goto LABEL_12;
  }
  if (!objc_msgSend(v9, "isCustomLens"))
  {
    if (!v10)
    {
      v17 = 1.0;
      goto LABEL_12;
    }
    objc_msgSend(v10, "displayZoomFactor");
    goto LABEL_8;
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveFocalLengthForCustomLens:", -[CAMZoomButtonPlatter preferredCustomLens](self, "preferredCustomLens"));
  objc_msgSend(v10, "allZoomPoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __74__CAMZoomButtonPlatter__zoomFactorForButton_zoomPoint_isZoomFactorButton___block_invoke;
  v24 = &unk_1EA32CC78;
  v25 = v12;
  v26 = v13;
  v15 = v12;
  v16 = objc_msgSend(v14, "indexOfObjectPassingTest:", &v21);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "fundamentalZoomPoint", v21, v22, v23, v24, v25, v26);
  else
    objc_msgSend(v14, "objectAtIndexedSubscript:", v16, v21, v22, v23, v24, v25, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayZoomFactor");
  v17 = v19;

LABEL_12:
  return v17;
}

BOOL __74__CAMZoomButtonPlatter__zoomFactorForButton_zoomPoint_isZoomFactorButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveFocalLengthForCustomLens:", objc_msgSend(a2, "customLens")) == *(_QWORD *)(a1 + 40);
}

- (id)_createPlatterImageForContentSize:(id)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  -[CAMZoomButtonPlatter intrinsicContentSize](self, "intrinsicContentSize", a3);
  height = v9.height;
  v9.width = v9.height;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), height, height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");
  objc_msgSend(v4, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIFloorToViewScale();
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v6, "resizableImageWithCapInsets:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createZoomButton
{
  CAMZoomButton *v3;

  v3 = objc_alloc_init(CAMZoomButton);
  -[CAMZoomButton setOverPlatter:](v3, "setOverPlatter:", 1);
  -[CAMZoomButton setOrientation:](v3, "setOrientation:", -[CAMZoomButtonPlatter orientation](self, "orientation"));
  return v3;
}

- (id)_indexesForChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "index", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_flashFocalLengthIfNeeded
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  dispatch_time_t v16;
  _QWORD block[5];
  id v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CAMZoomButtonPlatter zoomFactor](self, "zoomFactor");
  v4 = v3;
  -[CAMZoomButtonPlatter zoomFactorButton](self, "zoomFactorButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButtonPlatter baseZoomPointForButton:](self, "baseZoomPointForButton:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isCustomLens"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "allZoomPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "displayZoomFactor");
          if (vabdd_f64(v13, v4) < 0.001)
          {
            v14 = objc_msgSend(v12, "customLens");

            +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setFocalLength:", objc_msgSend(v7, "effectiveFocalLengthForCustomLens:", v14));
            objc_msgSend(v5, "setContentType:animated:", 2, 1);
            v15 = -[CAMZoomButtonPlatter _focalLengthFlashID](self, "_focalLengthFlashID") + 1;
            -[CAMZoomButtonPlatter _setFocalLengthFlashID:](self, "_setFocalLengthFlashID:", v15);
            v16 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __49__CAMZoomButtonPlatter__flashFocalLengthIfNeeded__block_invoke;
            block[3] = &unk_1EA32A7C0;
            block[4] = self;
            v19 = v15;
            v18 = v5;
            dispatch_after(v16, MEMORY[0x1E0C80D38], block);

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

uint64_t __49__CAMZoomButtonPlatter__flashFocalLengthIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_focalLengthFlashID");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "setContentType:animated:", 0, 1);
  return result;
}

- (void)_cancelFocalLengthFlash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CAMZoomButtonPlatter _allButtons](self, "_allButtons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setContentType:animated:", 0, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CAMZoomButtonPlatter _setFocalLengthFlashID:](self, "_setFocalLengthFlashID:", -[CAMZoomButtonPlatter _focalLengthFlashID](self, "_focalLengthFlashID") + 1);
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMZoomButtonPlatter setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  id v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMZoomButtonPlatter _allButtons](self, "_allButtons");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__CAMZoomButtonPlatter_setOrientation_animated___block_invoke;
    v7[3] = &__block_descriptor_41_e30_v32__0__CAMZoomButton_8Q16_B24l;
    v7[4] = a3;
    v8 = a4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

uint64_t __48__CAMZoomButtonPlatter_setOrientation_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (NSArray)zoomPoints
{
  return self->_zoomPoints;
}

- (NSArray)zoomFactors
{
  return self->_zoomFactors;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (int64_t)buttonAccessoryState
{
  return self->_buttonAccessoryState;
}

- (int64_t)buttonAccessoryPosition
{
  return self->_buttonAccessoryPosition;
}

- (int64_t)preferredCustomLens
{
  return self->_preferredCustomLens;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_platterBackgroundView
{
  return self->__platterBackgroundView;
}

- (NSMutableArray)_allButtons
{
  return self->__allButtons;
}

- (unint64_t)_focalLengthFlashID
{
  return self->__focalLengthFlashID;
}

- (void)_setFocalLengthFlashID:(unint64_t)a3
{
  self->__focalLengthFlashID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allButtons, 0);
  objc_storeStrong((id *)&self->__platterBackgroundView, 0);
  objc_storeStrong((id *)&self->_zoomFactors, 0);
  objc_storeStrong((id *)&self->_zoomPoints, 0);
}

@end
