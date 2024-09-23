@implementation CAMBadgeTray

- (CAMBadgeTray)initWithFrame:(CGRect)a3
{
  CAMBadgeTray *v3;
  uint64_t v4;
  NSMutableDictionary *badgeMap;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMBadgeTray;
  v3 = -[CAMBadgeTray initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    badgeMap = v3->__badgeMap;
    v3->__badgeMap = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)layoutSubviews
{
  unint64_t v3;

  v3 = -[CAMBadgeTray visibleBadges](self, "visibleBadges");
  -[CAMBadgeTray _layoutBadges:withVisibleBadges:](self, "_layoutBadges:withVisibleBadges:", v3, v3);
  -[CAMBadgeTray _updateBadgesVisibilityForVisibleBadges:](self, "_updateBadgesVisibilityForVisibleBadges:", v3);
}

- (void)_layoutBadges:(unint64_t)a3 withVisibleBadges:(unint64_t)a4
{
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  _QWORD v11[7];
  _QWORD v12[3];
  double v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke;
  v14[3] = &unk_1EA32E1A0;
  v14[4] = self;
  v14[5] = &v19;
  v14[6] = &v15;
  -[CAMBadgeTray _forBadgeTypeInBadgeTypes:do:](self, "_forBadgeTypeInBadgeTypes:do:", a4, v14);
  v8 = v20[3];
  v9 = v16[3];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0.0;
  -[CAMBadgeTray bounds](self, "bounds");
  v13 = (v10 - (v8 + (double)(unint64_t)(v9 - 1) * 5.0)) * 0.5;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_2;
  v11[3] = &unk_1EA32E1C8;
  v11[5] = v12;
  v11[6] = a3;
  v11[4] = self;
  -[CAMBadgeTray _forBadgeTypeInBadgeTypes:do:](self, "_forBadgeTypeInBadgeTypes:do:", a4, v11);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_badgeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intrinsicContentSize");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "_badgeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "intrinsicContentSize");
  v7 = v6;
  if ((a2 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    UIRectCenteredYInRectScale();
    v9 = v8;
    v11 = v10;
    v7 = v12;
    v14 = v13;
    UIRectGetCenter();
    objc_msgSend(v16, "setCenter:", 0);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_3;
    v17[3] = &unk_1EA328D90;
    v18 = v16;
    v19 = v9;
    v20 = v11;
    v21 = v7;
    v22 = v14;
    objc_msgSend(v15, "performWithoutAnimation:", v17);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7
                                                              + 5.0
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

uint64_t __48__CAMBadgeTray__layoutBadges_withVisibleBadges___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setVisibleBadges:(unint64_t)a3
{
  -[CAMBadgeTray setVisibleBadges:animated:](self, "setVisibleBadges:animated:", a3, 0);
}

- (void)setVisibleBadges:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t visibleBadges;
  _BOOL4 v5;
  unint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[8];

  visibleBadges = self->_visibleBadges;
  if (visibleBadges != a3)
  {
    v5 = a4;
    v8 = a3 & ~visibleBadges;
    -[CAMBadgeTray _loadBadgesIfNeededForTypes:](self, "_loadBadgesIfNeededForTypes:", v8);
    self->_visibleBadges = a3;
    if (v5)
    {
      v9 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke;
      v11[3] = &unk_1EA32E1F0;
      v11[4] = self;
      v11[5] = v8;
      v11[6] = a3;
      v11[7] = visibleBadges;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
      -[CAMBadgeTray setNeedsLayout](self, "setNeedsLayout");
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_3;
      v10[3] = &unk_1EA328868;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, 0, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      -[CAMBadgeTray setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_layoutBadges:withVisibleBadges:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateBadgesVisibilityForVisibleBadges:", *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_2;
  v5[3] = &unk_1EA32A8A8;
  v5[4] = v2;
  return objc_msgSend(v2, "_forBadgeTypeInBadgeTypes:do:", v3, v5);
}

void __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_badgeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutIfNeeded");
}

uint64_t __42__CAMBadgeTray_setVisibleBadges_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBadgeTray traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMBadgeTray setNeedsLayout](self, "setNeedsLayout");

}

- (CAMFlashBadge)flashBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1288);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMFlashBadge *)v3;
}

- (CAMLivePhotoBadge)livePhotoBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B12A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMLivePhotoBadge *)v3;
}

- (CAMFocusLockBadge)focusLockBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B12B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMFocusLockBadge *)v3;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B12D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMElapsedTimeView *)v3;
}

- (CAMSharedLibraryBadge)sharedLibraryBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B12E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMSharedLibraryBadge *)v3;
}

- (CAMVideoStabilizationBadge)videoStabilizationBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1300);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMVideoStabilizationBadge *)v3;
}

- (CAMVideoPausedBadge)videoPausedBadge
{
  void *v2;
  void *v3;

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1318);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMVideoPausedBadge *)v3;
}

- (id)_createControlForType:(unint64_t)a3
{
  CAMFlashBadge *v4;
  __objc2_class *v5;

  v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        v5 = CAMSharedLibraryBadge;
        break;
      case 0x20uLL:
        v5 = CAMVideoStabilizationBadge;
        break;
      case 0x40uLL:
        v5 = CAMVideoPausedBadge;
        break;
      default:
        return v4;
    }
LABEL_13:
    v4 = (CAMFlashBadge *)objc_alloc_init(v5);
    -[CEKBadgeView setDelegate:](v4, "setDelegate:", self);
    -[CAMFlashBadge setFontStyle:](v4, "setFontStyle:", -[CAMBadgeTray _badgeFontStyle](self, "_badgeFontStyle"));
    return v4;
  }
  switch(a3)
  {
    case 1uLL:
      v4 = objc_alloc_init(CAMFlashBadge);
      -[CEKBadgeView setDelegate:](v4, "setDelegate:", self);
      break;
    case 2uLL:
      v5 = CAMLivePhotoBadge;
      goto LABEL_13;
    case 4uLL:
      v5 = CAMFocusLockBadge;
      goto LABEL_13;
    case 8uLL:
      v4 = objc_alloc_init(CAMElapsedTimeView);
      break;
    default:
      return v4;
  }
  return v4;
}

- (unint64_t)_badgeFontStyle
{
  void *v2;
  unint64_t v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sfCameraFontSupported");

  return v3;
}

- (void)_forBadgeTypeInBadgeTypes:(unint64_t)a3 do:(id)a4
{
  char v4;
  void (**v5)(id, uint64_t);

  v4 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if ((v4 & 1) != 0)
  {
    v5[2](v5, 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2](v5, 2);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5[2](v5, 8);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5[2](v5, 4);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    v5[2](v5, 32);
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v5[2](v5, 16);
  if ((v4 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 0x40) != 0)
LABEL_8:
    v5[2](v5, 64);
LABEL_9:

}

- (void)_loadBadgesIfNeededForTypes:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CAMBadgeTray__loadBadgesIfNeededForTypes___block_invoke;
  v3[3] = &unk_1EA32A8A8;
  v3[4] = self;
  -[CAMBadgeTray _forBadgeTypeInBadgeTypes:do:](self, "_forBadgeTypeInBadgeTypes:do:", a3, v3);
}

void __44__CAMBadgeTray__loadBadgesIfNeededForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_badgeMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createControlForType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "badgeTray:didCreateBadgeForType:", *(_QWORD *)(a1 + 32), a2);

  }
}

- (void)_updateBadgesVisibilityForVisibleBadges:(unint64_t)a3
{
  id v4;
  _QWORD v5[5];

  -[CAMBadgeTray _badgeMap](self, "_badgeMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CAMBadgeTray__updateBadgesVisibilityForVisibleBadges___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v32__0__NSNumber_8__UIView_16_B24l;
  v5[4] = a3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __56__CAMBadgeTray__updateBadgesVisibilityForVisibleBadges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  double v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = 0.0;
  if ((v5 & ~*(_QWORD *)(a1 + 32)) == 0)
    v6 = 1.0;
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3
{
  _QWORD v4[5];

  -[CAMBadgeTray setNeedsLayout](self, "setNeedsLayout", a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CAMBadgeTray_badgeViewDidChangeIntrinsicContentSize___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v4, 0, 0.5, 0.0, 1.0, 1.0);
}

uint64_t __55__CAMBadgeTray_badgeViewDidChangeIntrinsicContentSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CAMBadgeTrayDelegate)delegate
{
  return (CAMBadgeTrayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)visibleBadges
{
  return self->_visibleBadges;
}

- (NSMutableDictionary)_badgeMap
{
  return self->__badgeMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
