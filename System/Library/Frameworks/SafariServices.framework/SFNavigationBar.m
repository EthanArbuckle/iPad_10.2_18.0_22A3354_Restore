@implementation SFNavigationBar

void __28___SFNavigationBar_setItem___block_invoke(id *a1)
{
  _BYTE *v2;

  objc_msgSend(a1[4], "clearEphemeralUI");
  -[_SFNavigationBar _updatePlaceholderText](a1[4]);
  objc_msgSend(a1[4], "_updateText");
  objc_msgSend(a1[4], "_updateShowsLockIcon");
  -[_SFNavigationBar _updateShowsSearchIndicator]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateMediaStateMuteButton]((id *)a1[4]);
  -[_SFNavigationBar _updateNavigationBarTrailingButtonType]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateTextColor]((uint64_t)a1[4]);
  v2 = a1[4];
  if (v2 && !v2[841])
  {
    v2[841] = 1;
    objc_msgSend(v2, "setNeedsLayout");
    v2 = a1[4];
  }
  -[_SFNavigationBar _updateFormatButtonSelected]((id *)v2);
  objc_msgSend(a1[4], "_updateAvailabilityButtonVisibilityForType:animated:showAvailabilityText:adjustURLLabels:", 0, 0, 0, 1);
  objc_msgSend(a1[4], "_updateSecurityWarningsVisibility");
  -[_SFNavigationBar _updateProgressView]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateFormatButtonAccessories]((uint64_t)a1[4]);
  if (-[_SFNavigationBar _shouldUpdateBackdropStyleForTransitionFromItem:toItem:]((uint64_t)a1[4], a1[5], a1[6]))-[_SFNavigationBar _updateEffectiveTheme]((uint64_t)a1[4]);
}

uint64_t __51___SFNavigationBar_setDismissButtonStyle_animated___block_invoke(uint64_t a1)
{
  -[SFDismissButton setStyle:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 816), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

id __45___SFNavigationBar__dimmingButtonWithAction___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t *WeakRetained;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[103] == 1)
    {
      v12 = (void *)MEMORY[0x1E0DC3B38];
      objc_msgSend(MEMORY[0x1E0DC3B30], "sf_shapeForToolbarButton:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
    }
    else
    {
      v16 = -[SFNavigationBarMetrics urlOutlineCornerRadius](WeakRetained[79]);
      v17 = (void *)MEMORY[0x1E0DC3B30];
      objc_msgSend(v7, "frame");
      v20 = CGRectInset(v19, 2.0, 2.0);
      objc_msgSend(v17, "shapeWithRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, v16 + -2.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0DC3B38];
    }
    objc_msgSend(v14, "styleWithEffect:shape:", v8, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

double __48___SFNavigationBar__updateAccessoryButtonsAlpha__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  double result;

  v3 = -[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 720), a2);
  result = 0.0;
  if (v3)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 560))
      return *(double *)(a1 + 40);
  }
  return result;
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_2(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  id v6;

  -[_SFNavigationBar _viewForAccessoryButtonType:](*(_QWORD *)(a1 + 32), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    -[_SFNavigationBar _widthForAccessoryButtonType:](*(_QWORD *)(a1 + 32), a2);
    v5 = v4;
    objc_msgSend(v6, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 0.0 + *(double *)(a1 + 48), 0.0, v4, *(double *)(a1 + 56));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                                + 0.0
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }

}

void __34___SFNavigationBar_layoutSubviews__block_invoke_3(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  id v6;

  -[_SFNavigationBar _viewForAccessoryButtonType:](*(_QWORD *)(a1 + 32), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    -[_SFNavigationBar _widthForAccessoryButtonType:](*(_QWORD *)(a1 + 32), a2);
    v5 = v4;
    objc_msgSend(v6, "setFrame:", *(double *)(a1 + 80)+ CGRectGetWidth(*(CGRect *)(a1 + 48))- (v5+ *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 0.0), 0.0, v5, *(double *)(a1 + 88));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                                + 0.0
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }

}

void __34___SFNavigationBar_layoutSubviews__block_invoke_4(uint64_t a1)
{
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
}

uint64_t __34___SFNavigationBar_layoutSubviews__block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  int v13;
  double Height;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double Width;
  double v22;
  double v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v32[10];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  BOOL v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  if (*(_BYTE *)(a1 + 184))
  {
    _SFRoundFloatToPixels();
    v3 = v2 + *(double *)(a1 + 56);
  }
  else
  {
    v3 = *(double *)(a1 + 64);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 883))
    v5 = 0.0;
  else
    v5 = v3;
  v6 = *(double *)(a1 + 88) / 0.7;
  objc_msgSend(*(id *)(v4 + 448), "urlSize");
  if (v6 >= v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "urlSize");
    v8 = v9;
  }
  else
  {
    v8 = *(double *)(a1 + 88) / 0.7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "urlSize");
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 883))
  {
    v13 = 1;
  }
  else
  {
    v13 = objc_msgSend(*(id *)(v12 + 888), "showsSearchIndicator");
    v12 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v12 + 448), "frame");
  Height = CGRectGetHeight(v37);
  v15 = 0.0;
  v38.origin.y = 0.0;
  v38.origin.x = v5;
  v38.size.width = v8;
  v38.size.height = v11;
  v16 = CGRectGetHeight(v38);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "bounds");
  v17 = CGRectGetWidth(v39) - *(double *)(a1 + 104) + -14.0 - *(double *)(a1 + 112);
  v40.origin.y = 0.0;
  v40.origin.x = v5;
  v40.size.width = v8;
  v40.size.height = v11;
  v18 = fmin(CGRectGetWidth(v40), v17);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:", v5, 0.0, v18, v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setTextAlignmentEdge:", v13 ^ 1u);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "placeholderHorizontalInset");
    v15 = v20;
  }

  if ((v13 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "bounds");
    Width = CGRectGetWidth(v41);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "urlSize");
    v15 = v15 + v3 + Width - v22;
  }
  _SFCeilingFloatToPixels();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "ss_setUntransformedFrame:", v15, 0.0, v23, *(double *)(*(_QWORD *)(a1 + 32) + 496));
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(double *)(a1 + 128) == 0.0 && *(_BYTE *)(v24 + 883) == 0;
  objc_msgSend(*(id *)(v24 + 664), "setHidden:", !v25);
  if (Height != v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "lastLineBaselineFrameOriginY", *(double *)&pencilTextInputElementIdentifier_block_invoke_URLBaseline);
    pencilTextInputElementIdentifier_block_invoke_URLBaseline = v26;
  }
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 672);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_6;
  v32[3] = &unk_1E4AC1568;
  v32[4] = v27;
  *(double *)&v32[5] = v5;
  v32[6] = 0;
  *(double *)&v32[7] = v18;
  *(double *)&v32[8] = v11;
  v32[9] = *(_QWORD *)(a1 + 128);
  v29 = *(_OWORD *)(a1 + 136);
  v30 = *(_OWORD *)(a1 + 152);
  v35 = *(_OWORD *)(a1 + 168);
  v34 = v30;
  v33 = v29;
  v36 = v25;
  return objc_msgSend(v28, "enumerateObjectsWithOptions:usingBlock:", 2, v32);
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double MidY;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double x;
  double y;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  CGAffineTransform v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v5 = a2;
  objc_msgSend(v5, "size");
  if (v6 != 0.0)
  {
    v8 = v6;
    v9 = v7;
    objc_msgSend(v5, "spacing");
    v44 = v10;
    v11 = objc_msgSend(v5, "centerAligned");
    if (v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "frame");
      MidY = CGRectGetMidY(v46);
    }
    else
    {
      MidY = *(double *)&pencilTextInputElementIdentifier_block_invoke_URLBaseline;
    }
    if (v11)
      v13 = v9 * 0.5;
    else
      v13 = v9;
    objc_msgSend(v5, "view", *(_QWORD *)&MidY);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredSymbolConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithSymbolConfiguration:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0.0;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v18, "baselineOffsetFromBottom");
      v19 = v20;
    }
    v21 = a3 + 1;
    if (v21 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "count"))
    {
      v22 = *(double *)(a1 + 40);
      v23 = *(double *)(a1 + 48);
      v25 = *(double *)(a1 + 56);
      v24 = *(double *)(a1 + 64);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "objectAtIndexedSubscript:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v22 = v27;
      v23 = v28;
      v25 = v29;
      v24 = v30;

    }
    v47.origin.x = v22;
    v47.origin.y = v23;
    v47.size.width = v25;
    v47.size.height = v24;
    v31 = CGRectGetMinX(v47) - v8 - v44;
    v32 = v43 + v19 - v13;
    if (*(double *)(a1 + 72) < 1.0)
    {
      v33 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&v45.a = *(_OWORD *)(a1 + 80);
      *(_OWORD *)&v45.c = v33;
      *(_OWORD *)&v45.tx = *(_OWORD *)(a1 + 112);
      v34 = v31;
      *(double *)&v33 = v32;
      v35 = v8;
      v36 = v9;
      v48 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v33 - 8), &v45);
      x = v48.origin.x;
      y = v48.origin.y;
      _SFRoundRectToPixels();
      v31 = v31 + v39 - x;
      v32 = v32 + v40 - y;
    }
    objc_msgSend(v5, "setFrame:", v31, v32, v8, v9);
    v41 = *(unsigned __int8 *)(a1 + 128);
    objc_msgSend(v5, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", v41);

  }
}

void __31___SFNavigationBar__updateText__block_invoke(uint64_t a1)
{
  id v2;

  -[_SFNavigationBar _attributedStringSecurityAnnotation](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAttributedText:", v2);

}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 883))
  {
    v3 = *(void **)(v2 + 912);
    objc_msgSend(*(id *)(v2 + 888), "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 712);
    else
      v5 = 0;
    objc_msgSend(v3, "setAttributedText:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 912));
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](*(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityButtonVisibilityForType:animated:showAvailabilityText:adjustURLLabels:", 0, 0, 0, 0);
    -[_SFNavigationBar _updateTextFieldFrame](*(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 432), "setHidden:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setUserInteractionEnabled:", 1);
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](*(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_updateAvailabilityButtonVisibilityForType:animated:showAvailabilityText:adjustURLLabels:", 0, 0, 0, 0);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 832);
  *(_QWORD *)(v6 + 832) = 0;

  -[_SFNavigationBar _cancelDelayedReaderAvailabilityAnimation](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 0.0);
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 883))
    v3 = 0.0;
  else
    v3 = 1.0;
  objc_msgSend(*(id *)(v2 + 872), "setAlpha:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 883))
    v5 = 0.0;
  else
    v5 = 1.0;
  return objc_msgSend(*(id *)(v4 + 648), "setAlpha:", v5);
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 883))
    objc_msgSend(*(id *)(v2 + 728), "setHidden:", 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha](*(id **)(a1 + 32));
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if (*(_BYTE *)(v2 + 883))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(v2 + 448), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 883))
  {
    v3 = (double)objc_msgSend(*(id *)(v6 + 888), "showsSecurityAnnotation");
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 480), "setAlpha:", v3);
  v7 = *(_QWORD *)(a1 + 32);
  LOBYTE(v8) = *(_BYTE *)(v7 + 883);
  objc_msgSend(*(id *)(v7 + 456), "setAlpha:", (double)v8);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "overrideBarStyleForSecurityWarning"))
    -[_SFNavigationBar _updateEffectiveTheme](*(_QWORD *)(a1 + 32));
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFAttributedString *v16;
  const __CTLine *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  CGAffineTransform v23;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 528))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 528);
    *(_QWORD *)(v5 + 528) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 528);
    objc_msgSend(*(id *)(v7 + 912), "selectionHighlightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 552))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3518]);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 552);
    *(_QWORD *)(v11 + 552) = v10;

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 552);
    objc_msgSend(*(id *)(v13 + 912), "_clearButtonImageForState:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:forState:", v15, 0);

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 456), "attributedText");
  v16 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
  v17 = CTLineCreateWithAttributedString(v16);

  *(CGFloat *)(*(_QWORD *)(a1 + 32) + 536) = CTLineGetOffsetForStringIndex(v17, *(_QWORD *)(a1 + 48), 0);
  *(CGFloat *)(*(_QWORD *)(a1 + 32) + 544) = CTLineGetOffsetForStringIndex(v17, *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 48), 0);
  CFRelease(v17);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = 0.0;
  if (!*(_BYTE *)(v18 + 883))
    v19 = 1.0;
  objc_msgSend(*(id *)(v18 + 528), "setAlpha:", v19);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 552);
  if (*(_BYTE *)(v20 + 883))
  {
    CGAffineTransformMakeScale(&v23, 0.0, 0.0);
  }
  else
  {
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v22;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(v21, "setTransform:", &v23);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_8(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  CGAffineTransform v8;

  v3 = *(_QWORD *)(a1 + 32);
  LOBYTE(a2) = *(_BYTE *)(v3 + 883);
  objc_msgSend(*(id *)(v3 + 528), "setAlpha:", (double)*(unint64_t *)&a2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 552);
  if (*(_BYTE *)(v4 + 883))
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v8, 0.0, 0.0);
  }
  return objc_msgSend(v5, "setTransform:", &v8);
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_10(uint64_t a1)
{
  -[_SFNavigationBar _updateFakeViews](*(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 624);
  *(_BYTE *)(v2 + 624) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 624) = v3;
  return result;
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_2(a1, v3);
    -[_SFNavigationBar _setHidePlaceholderURLItemsForPencilInput:](*(_QWORD *)(a1 + 32), 0);
  }
  else if (v4)
  {
    __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_1(a1, v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 883))
  {
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setUserInteractionEnabled:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 1.0);
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 912), "removeFromSuperview");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "removeFromSuperview");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 528);
  *(_QWORD *)(v6 + 528) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "removeFromSuperview");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 552);
  *(_QWORD *)(v8 + 552) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  uint64_t v13;

  v2 = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_2;
  v12[3] = &unk_1E4ABFE00;
  v13 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_3;
  v11[3] = &unk_1E4AC05E0;
  v11[4] = v13;
  v12[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331648, v12, v11, 0.2, 0.0);
  v9[1] = 3221225472;
  v9[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_4;
  v9[3] = &unk_1E4ABFE00;
  v10 = *(_QWORD *)(a1 + 32);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_5;
  v8[3] = &unk_1E4AC05E0;
  v8[4] = v10;
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331648, v9, v8, 0.5, 0.0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 728);
  v6[4] = v3;
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_6;
  v7[3] = &unk_1E4ABFE00;
  v7[4] = v3;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_7;
  v6[3] = &unk_1E4AC05E0;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v4, 5242882, v7, v6, 0.1);
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "removeFromSuperview");
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 864), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", -[_SFNavigationBar _privateBrowsingLabelRevealPercent](*(double **)(a1 + 32)));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "showsSecurityAnnotation");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 1.0);
  return result;
}

void __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 840) = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 832))
  {
    v4 = (void (**)(void))MEMORY[0x1A8598C40]();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 832);
    *(_QWORD *)(v2 + 832) = 0;

    v4[2]();
  }
}

void __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_6(uint64_t a1)
{
  id v2;

  -[_SFNavigationBar _formatToggleButtonImage](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setImage:", v2);

}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setHighlightsBackground:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 776) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setAccessibilityIdentifier:", CFSTR("PageFormatMenuButton"));
}

void __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAvailabilityButtonVisibilityForType:animated:showAvailabilityText:adjustURLLabels:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50));

}

void __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];

  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 57))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 840) = 1;
    -[_SFNavigationBar _availabilityLabelTextForType:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setText:", v2);

    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_3;
    v12 = &unk_1E4AC1658;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    v3 = (void (**)(_QWORD))dispatch_block_create((dispatch_block_flags_t)0, &v9);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "showsSecurityAnnotation", v9, v10, v11, v12))
    {
      v4 = MEMORY[0x1A8598C40](v3);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 808);
      *(_QWORD *)(v5 + 808) = v4;

      v7 = dispatch_time(0, 1550000000);
      dispatch_after(v7, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(*(_QWORD *)(a1 + 32) + 808));
    }
    else
    {
      v3[2](v3);
    }

    objc_destroyWeak(v13);
  }
  if (*(_BYTE *)(a1 + 58))
  {
    v8 = 0.1;
    if (*(_BYTE *)(a1 + 56))
      v8 = 0.0;
    -[_SFNavigationBar _adjustLabelRectForLeadingButtonWithDelay:](*(_QWORD *)(a1 + 32), v8);
  }
}

void __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_4;
    v11[3] = &unk_1E4ABFE00;
    v11[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331648, v11, 0, 0.2, 0.0);
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_5;
    v10[3] = &unk_1E4ABFE00;
    v10[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331648, v10, 0, 0.5, 0.06);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if (v4 != 1)
      {
LABEL_7:
        objc_msgSend(WeakRetained[91], "setHighlightsBackground:", 1);
        objc_msgSend(WeakRetained[91], "setAccessibilityIdentifier:", CFSTR("ReaderButton"));
        v6 = WeakRetained[91];
        v9[0] = v3;
        v9[1] = 3221225472;
        v9[2] = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_6;
        v9[3] = &unk_1E4ABFBC0;
        v7 = *(_QWORD *)(a1 + 40);
        v9[4] = WeakRetained;
        v9[5] = v7;
        objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v6, 5242882, v9, 0, 0.1);
        -[_SFNavigationBar _hideAvailabilityLabelSoon]((uint64_t)WeakRetained);
        v8 = WeakRetained[101];
        WeakRetained[101] = 0;

        goto LABEL_8;
      }
      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
    WeakRetained[97] = (id)v5;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 864), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "setAlpha:", 0.0);
}

uint64_t __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

void __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_6(uint64_t a1)
{
  id v2;

  -[_SFNavigationBar _availabilityButtonImageForType:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setImage:", v2);

}

uint64_t __62___SFNavigationBar__adjustLabelRectForLeadingButtonWithDelay___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[54];
  if (v3)
  {
    *(_BYTE *)(v3 + 416) = 1;
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (v5)
    *(_BYTE *)(v5 + 416) = 0;
  return result;
}

uint64_t __53___SFNavigationBar__updateSecurityWarningsVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __65___SFNavigationBar_navigationBarURLButtonDidReceivePasteCommand___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationIntentWithText:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar:didProduceNavigationIntent:", WeakRetained, v6);

  }
}

void __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 560) = a2;
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
}

uint64_t __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __53___SFNavigationBar_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0DC3760];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previewForURL:title:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48___SFNavigationBar_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a2)
  {
    v3 = (id *)(*(_QWORD *)(a1 + 32) + 928);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "navigationBar:didProduceNavigationIntent:", *(_QWORD *)(a1 + 32), v4);

  }
}

void __123___SFNavigationBar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_QWORD *)(a1 + 40))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

void __67___SFNavigationBar_navigationBarItemDidUpdateOverlayConfiguration___block_invoke(uint64_t a1)
{
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = OUTLINED_FUNCTION_6_1(*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 883));
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, a2, v4, "Not changing placeholder hiding after animation because it wasn't hidden before; expanded: %{public}@",
    (uint8_t *)&v5);

  OUTLINED_FUNCTION_6();
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_2(uint64_t a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = OUTLINED_FUNCTION_6_1(*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 883));
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, a2, v4, "Unhiding placeholder items since expand animation is complete; expanded: %{public}@",
    (uint8_t *)&v5);

  OUTLINED_FUNCTION_6();
}

@end
