id AXCCLocalizedString(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v1, v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)v2, (uint64_t)&stru_24FFC4800, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t sub_230F7F080(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isEqualToString;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  isEqualToString = objc_msgSend_isEqualToString_(*(void **)(a1 + 40), a2, *MEMORY[0x24BEBE0B8], a4);
  v9 = 0.0;
  if (isEqualToString)
    v9 = 1.0;
  return objc_msgSend_setAlpha_(*(void **)(*(_QWORD *)(a1 + 32) + 992), v6, v7, v8, v9);
}

void sub_230F7FFDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_230F80314(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__commitTextSizeIfNeeded(*(void **)(a1 + 32), a2, a3, a4);
}

double AXCCSizeCeilToViewScale(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  UICeilToViewScale();
  v3 = v2;
  UICeilToViewScale();

  return v3;
}

void sub_230F81F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id sub_230F81F48(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  UIBezierPath *v24;
  UIView *v25;
  void *v26;

  v2 = (void *)MEMORY[0x24BEBD420];
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_bounds(WeakRetained, v5, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_compactContinuousCornerRadius(v16, v17, v18, v19);
  objc_msgSend__bezierPathWithPillRect_cornerRadius_(v2, v20, v21, v22, v9, v11, v13, v15, v23);
  v24 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v25 = (UIView *)objc_loadWeakRetained(v3);
  UIAccessibilityConvertPathToScreenCoordinates(v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void sub_230F820D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_endTransitionToSize_withTransitionCoordinator_(*(void **)(*(_QWORD *)(a1 + 32) + 1024), a2, *(_QWORD *)(a1 + 40), a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend_textSizeDelegate(*(void **)(a1 + 32), v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_moduleDidExpand(v11, v8, v9, v10);

}

void sub_230F82CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_230F831A4(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_255EAF008)
  {
    v2 = (void *)qword_255EAF008;
  }
  else
  {
    qword_255EAF008 = _sl_dlopen();
    v2 = (void *)qword_255EAF008;
    if (!qword_255EAF008)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXFrontBoardRunningAppProcesses");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_255EAF000 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_230F838CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isEqualToString;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  isEqualToString = objc_msgSend_isEqualToString_(*(void **)(a1 + 40), a2, *MEMORY[0x24BEBE0B8], a4);
  v9 = 0.0;
  if (isEqualToString)
    v9 = 1.0;
  return objc_msgSend_setAlpha_(*(void **)(*(_QWORD *)(a1 + 32) + 992), v6, v7, v8, v9);
}

void sub_230F85360(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setBackgroundColor_(a1, v13, (uint64_t)v15, v14);

}

void sub_230F853C4(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setTextColor_(a1, v13, (uint64_t)v15, v14);

}

void sub_230F85428(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setTintColor_(a1, v13, (uint64_t)v15, v14);

}

void sub_230F8548C(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setColor_(a1, v13, (uint64_t)v15, v14);

}

uint64_t sub_230F8602C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 464))
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 72) + *(double *)(a1 + 80) * (double)(unint64_t)a3, 0.0, *(double *)(a1 + 80), *(double *)(a1 + 88));
  else
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t sub_230F86070(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 464))
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, 0.0, *(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(v4 + 608)) * (double)(unint64_t)a3, *(double *)(a1 + 88), *(double *)(v4 + 608));
  else
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_230F86660(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v5, v7, a3, v8);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v47, v13, (uint64_t)v12, v14);

  objc_msgSend_packageName(v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageName_(v47, v19, (uint64_t)v18, v20);

  objc_msgSend_setStylingProvider_(v47, v21, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504), v22);
  objc_msgSend_image(v6, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setImage_(v47, v27, (uint64_t)v26, v28);
  objc_msgSend_setImageSize_(v47, v29, v30, v31, *(double *)(*(_QWORD *)(a1 + 32) + 600), *(double *)(*(_QWORD *)(a1 + 32) + 608));
  v35 = objc_msgSend__buttonLayoutAxis(*(void **)(a1 + 32), v32, v33, v34);
  objc_msgSend_setAxis_(v47, v36, v35, v37);
  v41 = objc_msgSend_contentVerticalAlignment(*(void **)(a1 + 32), v38, v39, v40);
  objc_msgSend_setContentVerticalAlignment_(v47, v42, v41, v43);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 469))
    objc_msgSend_controlCenterApplyPrimaryContentShadow(v47, v44, v45, v46);

}

uint64_t sub_230F8691C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend__layoutLabels(*(void **)(a1 + 32), a2, a3, a4);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend__layoutSelectionView(*(void **)(a1 + 32), v6, v7, v8);
  return result;
}

void sub_230F86958(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v8 = objc_msgSend_accessibilityTraits(v11, v5, v6, v7);
  if (v4 == a3)
    objc_msgSend_setAccessibilityTraits_(v11, v9, *MEMORY[0x24BEBDF30] | v8, v10);
  else
    objc_msgSend_setAccessibilityTraits_(v11, v9, v8 & ~*MEMORY[0x24BEBDF30], v10);

}

uint64_t sub_230F86DEC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend__updateButtonsVisiblity(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_updateVisualStyling(*(void **)(a1 + 32), v5, v6, v7);
  return objc_msgSend__updateSelectionVisiblity(*(void **)(a1 + 32), v8, v9, v10);
}

uint64_t sub_230F86F08(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__layoutSelectionView(*(void **)(a1 + 32), a2, a3, a4);
}

uint64_t sub_230F86FC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230F8707C;
  v10[3] = &unk_24FFC4368;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BEBDB00], a2, (uint64_t)v10, a4, 0.0, 0.1);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = sub_230F87088;
  v9[3] = &unk_24FFC4368;
  v9[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BEBDB00], v6, (uint64_t)v9, v7, 0.9, 0.1);
}

uint64_t sub_230F8707C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setDisplayMessage_, 1, a4);
}

uint64_t sub_230F87088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setDisplayMessage_, 0, a4);
}

BOOL sub_230F87328(CGPoint *a1, void *a2, uint64_t a3, uint64_t a4)
{
  CGRect v6;

  objc_msgSend_frame(a2, (const char *)a2, a3, a4);
  return CGRectContainsPoint(v6, a1[2]);
}

uint64_t sub_230F87350(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = 0.0;
    v3 = *(double *)(a1 + 40) / 6.0;
  }
  else
  {
    v3 = 0.0;
    v2 = *(double *)(a1 + 40) / 6.0;
  }
  CGAffineTransformMakeTranslation(&v13, v3, v2);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  v12 = v13;
  result = objc_msgSend_setTransform_(v4, v5, (uint64_t)&v12, v6);
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), v8, *(_QWORD *)(a1 + 48), v9);
    return objc_msgSend__animateGlyphStateSelected_(*(void **)(a1 + 32), v10, 1, v11);
  }
  return result;
}

uint64_t sub_230F875A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40) == 0, a4);
}

uint64_t sub_230F875B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4);
}

BOOL sub_230F87790(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGPoint v19;
  CGRect v20;

  objc_msgSend_frame(a2, (const char *)a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend_location(*(void **)(a1 + 32), v13, v14, v15);
  v19.x = v16;
  v19.y = v17;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  return CGRectContainsPoint(v20, v19);
}

void sub_230F87B18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _BOOL8 v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t isEnabled;
  const char *v31;
  uint64_t v32;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 464))
  {
    v6 = *(_QWORD *)(v5 + 480) != a3;
    v7 = a2;
    objc_msgSend_setUserInteractionEnabled_(v7, v8, v6, v9);
    objc_msgSend_setAlpha_(v7, v10, v11, v12, 1.0);
    objc_msgSend_setSelected_(v7, v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3, v14);
    v17 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 467) != 0;
  }
  else
  {
    v18 = a2;
    v17 = 1;
    objc_msgSend_setUserInteractionEnabled_(v18, v19, 1, v20);
    v24 = 0.0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3)
      v24 = 1.0;
    objc_msgSend_setAlpha_(v18, v21, v22, v23, v24);
    objc_msgSend_setSelected_(v18, v25, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3, v26);
  }
  objc_msgSend_setLabelHidden_(a2, v15, v17, v16);
  isEnabled = objc_msgSend_isEnabled(*(void **)(a1 + 32), v27, v28, v29);
  objc_msgSend_setEnabled_(a2, v31, isEnabled, v32);

}

uint64_t sub_230F884C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3)
    v4 = *(_QWORD *)(a1 + 40);
  else
    v4 = 0;
  return MEMORY[0x24BEDD108](a2, sel_setGlyphState_, v4, a4);
}

uint64_t sub_230F88548(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  __int128 v6;
  const char *v7;
  uint64_t v8;
  _OWORD v10[3];

  objc_msgSend__layoutSelectionView(*(void **)(a1 + 32), a2, a3, a4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v10[0] = *MEMORY[0x24BDBD8B8];
  v10[1] = v6;
  v10[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend_setTransform_(v5, v7, (uint64_t)v10, v8);
}

void sub_230F88FB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend_view(*(void **)(a1 + 32), a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v5, v6, v7, v8);

  objc_msgSend_view(*(void **)(a1 + 32), v9, v10, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v15, v12, v13, v14);

}

void sub_230F89004(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_textSizeDelegate(*(void **)(a1 + 32), a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_moduleDidExpand(v7, v4, v5, v6);

}

uint64_t sub_230F89528(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = (unint64_t)(double)(unint64_t)objc_msgSend_indexOfObject_(*(void **)(*(_QWORD *)(a1 + 32) + 976), a2, *(_QWORD *)(a1 + 40), a4);
  return objc_msgSend_setStep_(*(void **)(*(_QWORD *)(a1 + 32) + 1048), v6, v5, v7);
}

uint64_t sub_230F899AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[4];

  sub_230F8B564(&qword_255EAEF78);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_230F8C5CC();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = sub_230F8B564(&qword_255EAEF80);
  sub_230F89B40(a1, a2, (uint64_t)&v5[*(int *)(v6 + 44)]);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_230F8C548();
  swift_release();
  swift_release();
  swift_release();
  v9[2] = v9[3];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  sub_230F8C2EC(&qword_255EAEF88, &qword_255EAEF78, MEMORY[0x24BDF4700]);
  swift_retain();
  sub_230F8C614();
  swift_release();
  return sub_230F8C020((uint64_t)v5, &qword_255EAEF78);
}

uint64_t sub_230F89B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  void (*v15)(char *, char *, uint64_t);
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  _BYTE v68[7];
  char v69;
  _DWORD v70[2];
  char v71;
  char v72;
  char v73;

  v57 = a3;
  v5 = sub_230F8B564(&qword_255EAEF90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_230F8B564(&qword_255EAEF98);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_230F8C5C0();
  v55 = v11;
  v54 = v12;
  type metadata accessor for AppPickerButtonModel();
  sub_230F8B51C();
  sub_230F8C578();
  swift_getKeyPath();
  sub_230F8C584();
  swift_release();
  swift_release();
  v62 = v65;
  v63 = v66;
  v64 = v67;
  v60 = a1;
  v61 = a2;
  sub_230F8B564(&qword_255EAEFA0);
  sub_230F8BEFC();
  sub_230F8C638();
  v13 = sub_230F8C620();
  KeyPath = swift_getKeyPath();
  v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v59 = v10;
  v15(v10, v8, v5);
  v16 = (uint64_t *)&v10[*(int *)(v58 + 36)];
  *v16 = KeyPath;
  v16[1] = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v56 = sub_230F8C5CC();
  sub_230F8C5C0();
  v17 = sub_230F8C5D8();
  v49 = v17;
  v19 = v18;
  v50 = v20;
  LOBYTE(v13) = v21 & 1;
  sub_230F8C5C0();
  v22 = sub_230F8C5D8();
  v48 = v23;
  v58 = v24;
  LOBYTE(v8) = v25 & 1;
  sub_230F8C5C0();
  v26 = sub_230F8C5D8();
  v28 = v27;
  v30 = v29;
  LOBYTE(v65) = v13;
  v32 = v31 & 1;
  LOBYTE(v62) = (_BYTE)v8;
  LOBYTE(v70[0]) = v31 & 1;
  sub_230F8C05C(v17, v19, v13);
  swift_bridgeObjectRetain();
  v33 = v22;
  v53 = v22;
  v34 = v22;
  v35 = v48;
  sub_230F8C05C(v34, v48, (char)v8);
  swift_bridgeObjectRetain();
  v54 = v28;
  sub_230F8C05C(v26, v28, v32);
  v55 = v30;
  swift_bridgeObjectRetain();
  sub_230F8C06C(v26, v28, v32);
  swift_bridgeObjectRelease();
  v36 = v35;
  sub_230F8C06C(v33, v35, (char)v8);
  swift_bridgeObjectRelease();
  v37 = v49;
  v38 = v19;
  sub_230F8C06C(v49, v19, v13);
  v39 = v50;
  swift_bridgeObjectRelease();
  v73 = 1;
  v72 = v65;
  v71 = v62;
  v69 = v70[0];
  v52 = sub_230F8C650();
  v51 = v40;
  v41 = v73;
  v42 = v72;
  LOBYTE(v33) = v71;
  LOBYTE(v19) = v69;
  v43 = v57;
  sub_230F8BFDC((uint64_t)v59, v57, &qword_255EAEF98);
  v44 = v43 + *(int *)(sub_230F8B564(&qword_255EAEFD0) + 36);
  *(_QWORD *)v44 = v56;
  *(_QWORD *)(v44 + 8) = 0;
  *(_BYTE *)(v44 + 16) = v41;
  *(_DWORD *)(v44 + 17) = v65;
  *(_DWORD *)(v44 + 20) = *(_DWORD *)((char *)&v65 + 3);
  *(_QWORD *)(v44 + 24) = v37;
  *(_QWORD *)(v44 + 32) = v38;
  *(_BYTE *)(v44 + 40) = v42;
  *(_DWORD *)(v44 + 41) = v62;
  *(_DWORD *)(v44 + 44) = *(_DWORD *)((char *)&v62 + 3);
  v45 = v53;
  *(_QWORD *)(v44 + 48) = v39;
  *(_QWORD *)(v44 + 56) = v45;
  *(_QWORD *)(v44 + 64) = v36;
  *(_BYTE *)(v44 + 72) = v33;
  *(_DWORD *)(v44 + 76) = *(_DWORD *)((char *)v70 + 3);
  *(_DWORD *)(v44 + 73) = v70[0];
  *(_QWORD *)(v44 + 80) = v58;
  *(_QWORD *)(v44 + 88) = v26;
  *(_QWORD *)(v44 + 96) = v54;
  *(_BYTE *)(v44 + 104) = v19;
  *(_DWORD *)(v44 + 105) = *(_DWORD *)v68;
  *(_DWORD *)(v44 + 108) = *(_DWORD *)&v68[3];
  *(_QWORD *)(v44 + 112) = v55;
  *(_QWORD *)(v44 + 120) = 0;
  v46 = v51;
  *(_QWORD *)(v44 + 128) = v52;
  *(_QWORD *)(v44 + 136) = v46;
  return sub_230F8C020((uint64_t)v59, &qword_255EAEF98);
}

uint64_t sub_230F8A058@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;
  int v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_230F8A0D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_230F8C554();
}

uint64_t sub_230F8A14C()
{
  return sub_230F8C608();
}

uint64_t sub_230F8A164()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_230F8A1D4()
{
  uint64_t *v0;

  return sub_230F899AC(*v0, v0[1]);
}

char *sub_230F8A1DC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (char *)v3;
    v11 = MEMORY[0x24BEE4AF8];
    result = sub_230F8B62C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v11;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x2348CB860](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_correspondingState);

      v10 = *(_QWORD *)(v11 + 16);
      v9 = *(_QWORD *)(v11 + 24);
      if (v10 >= v9 >> 1)
        sub_230F8B62C((char *)(v9 > 1), v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v11 + 16) = v10 + 1;
      *(_DWORD *)(v11 + 4 * v10 + 32) = v8;
      if (v2 == v5)
        return (char *)v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_230F8C6D4();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_230F8A33C()
{
  unsigned int v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_230F8A3AC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_230F8A41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__options;
  v2 = sub_230F8B564(&qword_255EAEF60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__selection;
  v4 = sub_230F8B564(&qword_255EAEF68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__helper;
  v6 = sub_230F8B564(&qword_255EAEF70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_230F8A4C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = sub_230F8B564(&qword_255EAEF70);
  v1 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_230F8B564(&qword_255EAEF68);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_230F8B564(&qword_255EAEF60);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__options;
  v17 = MEMORY[0x24BEE4AF8];
  sub_230F8B564(&qword_255EAEDB0);
  sub_230F8C53C();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__selection;
  LODWORD(v17) = 3;
  sub_230F8C53C();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  v14 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__helper;
  v17 = 0;
  sub_230F8B564(qword_255EAEDC8);
  sub_230F8C53C();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v14, v3, v16);
  return v0;
}

uint64_t sub_230F8A684@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AppPickerButtonModel();
  result = sub_230F8C530();
  *a1 = result;
  return result;
}

uint64_t variable initialization expression of AppPickerButtonWrapperView.model()
{
  uint64_t v0;

  type metadata accessor for AppPickerButtonModel();
  v0 = swift_allocObject();
  sub_230F8A4C8();
  return v0;
}

uint64_t type metadata accessor for AppPickerButtonModel()
{
  uint64_t result;

  result = qword_255EAF058;
  if (!qword_255EAF058)
    return swift_getSingletonMetadata();
  return result;
}

id sub_230F8A734(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t inited;
  id v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  unint64_t v29;
  void *v30;
  objc_super v32;

  v5 = v4;
  v10 = OBJC_IVAR___AXCCAppPickerButtonWrapperView_model;
  type metadata accessor for AppPickerButtonModel();
  v11 = swift_allocObject();
  v12 = v5;
  sub_230F8A4C8();
  *(_QWORD *)&v5[v10] = v11;

  v32.receiver = v12;
  v32.super_class = (Class)type metadata accessor for AppPickerButtonWrapperView();
  v13 = objc_msgSendSuper2(&v32, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_230F8B51C();
  swift_retain();
  sub_230F8C56C();
  v14 = (objc_class *)sub_230F8B564(&qword_255EAEF28);
  v15 = objc_allocWithZone(v14);
  v16 = (void *)sub_230F8C590();
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_addSubview_, v16);
  v17 = (void *)objc_opt_self();
  v18 = (void *)sub_230F8C668();
  sub_230F8B564(&qword_255EAEF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230F8E420;
  *(_QWORD *)(inited + 32) = 0x56676E6974736F68;
  *(_QWORD *)(inited + 40) = 0xEB00000000776569;
  *(_QWORD *)(inited + 72) = v14;
  *(_QWORD *)(inited + 48) = v16;
  v20 = v16;
  sub_230F8AAF8(inited);
  v21 = (void *)sub_230F8C65C();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v17, sel_constraintsWithVisualFormat_options_metrics_views_, v18, 0, 0, v21);

  sub_230F8B5A4(0, &qword_255EAEF38);
  v23 = sub_230F8C698();

  sub_230F8AC2C(v23);
  v24 = (void *)sub_230F8C668();
  v25 = swift_initStackObject();
  *(_OWORD *)(v25 + 16) = xmmword_230F8E420;
  *(_QWORD *)(v25 + 32) = 0x56676E6974736F68;
  *(_QWORD *)(v25 + 40) = 0xEB00000000776569;
  *(_QWORD *)(v25 + 48) = v20;
  *(_QWORD *)(v25 + 72) = v14;
  v26 = v20;
  sub_230F8AAF8(v25);
  v27 = (void *)sub_230F8C65C();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v17, sel_constraintsWithVisualFormat_options_metrics_views_, v24, 0, 0, v27);

  v29 = sub_230F8C698();
  sub_230F8AC2C(v29);
  v30 = (void *)sub_230F8C68C();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v30);

  return v13;
}

unint64_t sub_230F8AAF8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_230F8B564(&qword_255EAEF50);
  v2 = sub_230F8C6E0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_230F8BFDC(v6, (uint64_t)&v15, &qword_255EAEF58);
    v7 = v15;
    v8 = v16;
    result = sub_230F8B740(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_230F8BB30(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_230F8AC2C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_230F8C6D4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_230F8C6D4();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x2348CB86C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_230F8B978(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_230F8C6D4();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_230F8C6A4();
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall AppPickerButtonWrapperView.setOptions(_:)(Swift::OpaquePointer a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_230F8C554();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  swift_release();
  if (a1._rawValue)
  {
    objc_msgSend(a1._rawValue, sel_state);

  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_230F8C554();
}

Swift::Void __swiftcall AppPickerButtonWrapperView.setHelper(_:)(AXCCTextSizeHelper *a1)
{
  AXCCTextSizeHelper *v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  swift_retain();
  sub_230F8C554();
}

id AppPickerButtonWrapperView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppPickerButtonWrapperView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_230F8B160@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_230F8B1DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_230F8C554();
}

uint64_t sub_230F8B254@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_230F8C548();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_230F8B2D0(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_230F8C554();
}

uint64_t type metadata accessor for AppPickerButtonWrapperView()
{
  return objc_opt_self();
}

uint64_t sub_230F8B364()
{
  return type metadata accessor for AppPickerButtonModel();
}

void sub_230F8B36C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_230F8B4C4(319, &qword_255EAEDA8, &qword_255EAEDB0);
  if (v0 <= 0x3F)
  {
    sub_230F8B470();
    if (v1 <= 0x3F)
    {
      sub_230F8B4C4(319, &qword_255EAEDC0, qword_255EAEDC8);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_230F8B42C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CBE24](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_230F8B470()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EAEDB8)
  {
    v0 = sub_230F8C560();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EAEDB8);
  }
}

void sub_230F8B4C4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_230F8B42C(a3);
    v4 = sub_230F8C560();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_230F8B510()
{
  return MEMORY[0x24BDB9D70];
}

unint64_t sub_230F8B51C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EAEF20;
  if (!qword_255EAEF20)
  {
    v1 = type metadata accessor for AppPickerButtonModel();
    result = MEMORY[0x2348CBE30](&unk_230F8E56C, v1);
    atomic_store(result, (unint64_t *)&qword_255EAEF20);
  }
  return result;
}

uint64_t sub_230F8B564(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CBE18]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230F8B5A4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_230F8B5DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_230F8C59C();
  *a1 = result;
  return result;
}

uint64_t sub_230F8B604()
{
  swift_retain();
  return sub_230F8C5A8();
}

char *sub_230F8B62C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_230F8B648(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_230F8B648(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_230F8B564((uint64_t *)&unk_255EAEFF0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

unint64_t sub_230F8B740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230F8C6F8();
  sub_230F8C680();
  v4 = sub_230F8C704();
  return sub_230F8B7A4(a1, a2, v4);
}

unint64_t sub_230F8B7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_230F8C6EC() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_230F8C6EC() & 1) == 0);
    }
  }
  return v6;
}

void (*sub_230F8B884(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_230F8B904(v6, a2, a3);
  return sub_230F8B8D8;
}

void sub_230F8B8D8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_230F8B904(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2348CB860](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_230F8B970;
  }
  __break(1u);
  return result;
}

void sub_230F8B970(id *a1)
{

}

uint64_t sub_230F8B978(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_230F8C6D4();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_230F8C6D4();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_230F8C2EC(&qword_255EAEF48, &qword_255EAEF40, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            sub_230F8B564(&qword_255EAEF40);
            v10 = sub_230F8B884(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_230F8B5A4(0, &qword_255EAEF38);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

_OWORD *sub_230F8BB30(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppPickerButton(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AppPickerButton()
{
  return swift_release();
}

_QWORD *assignWithCopy for AppPickerButton(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AppPickerButton(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AppPickerButton(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppPickerButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppPickerButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppPickerButton()
{
  return &type metadata for AppPickerButton;
}

uint64_t sub_230F8BC84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230F8BC94()
{
  swift_release();
  return swift_deallocObject();
}

void sub_230F8BCB8()
{
  unsigned int v0;
  void *v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_230F8C548();
  swift_release();
  swift_release();
  swift_release();
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_230F8C548();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v1, sel_setState_, v0);

  }
}

uint64_t sub_230F8BDA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_230F8C548();
  swift_release();
  swift_release();
  sub_230F8A1DC(v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_230F8B564(&qword_255EAEFD8);
  sub_230F8B564(&qword_255EAEFB8);
  sub_230F8C2EC(&qword_255EAEFE0, &qword_255EAEFD8, MEMORY[0x24BEE12D8]);
  sub_230F8BF60();
  return sub_230F8C644();
}

unint64_t sub_230F8BEFC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255EAEFA8;
  if (!qword_255EAEFA8)
  {
    v1 = sub_230F8B42C(&qword_255EAEFA0);
    v2 = sub_230F8BF60();
    result = MEMORY[0x2348CBE30](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255EAEFA8);
  }
  return result;
}

unint64_t sub_230F8BF60()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255EAEFB0;
  if (!qword_255EAEFB0)
  {
    v1 = sub_230F8B42C(&qword_255EAEFB8);
    v2 = sub_230F8C2EC(&qword_255EAEFC0, &qword_255EAEFC8, MEMORY[0x24BDF4498]);
    result = MEMORY[0x2348CBE30](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255EAEFB0);
  }
  return result;
}

uint64_t sub_230F8BFDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_230F8B564(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_230F8C020(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_230F8B564(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230F8C05C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_230F8C06C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

void sub_230F8C07C(int *a1@<X0>, uint64_t *a2@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 v22;

  v3 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_230F8C548();
  swift_release();
  swift_release();
  swift_release();
  if (v21 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_230F8C6D4())
  {
    v5 = 4;
    while (1)
    {
      v6 = (v21 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2348CB860](v5 - 4) : *(id *)(v21 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if (objc_msgSend(v6, sel_correspondingState) == v3)
      {
        swift_bridgeObjectRelease_n();
        v9 = sub_230F8C5B4();
        v11 = objc_msgSend(v7, sel_image);
        v4 = sub_230F8C62C();
        v12 = objc_msgSend(v7, sel_title);
        sub_230F8C674();

        sub_230F8C32C();
        v13 = sub_230F8C5E4();
        v15 = v14;
        v17 = v16;
        v19 = v18 & 1;
        v22 = v18 & 1;
        swift_retain();
        sub_230F8C05C(v13, v15, v19);
        swift_bridgeObjectRetain();
        sub_230F8C06C(v13, v15, v19);
        swift_release();
        swift_bridgeObjectRelease();

        v20 = v22;
        v10 = 1;
        goto LABEL_16;
      }

      ++v5;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease_n();
        v9 = 0;
        v10 = 0;
        v4 = 0;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease_n();
  v9 = 0;
  v10 = 0;
LABEL_15:
  v13 = 0;
  v15 = 0;
  v20 = 0;
  v17 = 0;
LABEL_16:
  *a2 = v9;
  a2[1] = 0;
  a2[2] = v10;
  a2[3] = v4;
  a2[4] = v13;
  a2[5] = v15;
  a2[6] = v20;
  a2[7] = v17;
}

uint64_t sub_230F8C2EC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_230F8B42C(a2);
    result = MEMORY[0x2348CBE30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_230F8C32C()
{
  unint64_t result;

  result = qword_255EAEFE8;
  if (!qword_255EAEFE8)
  {
    result = MEMORY[0x2348CBE30](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255EAEFE8);
  }
  return result;
}

uint64_t sub_230F8C374()
{
  sub_230F8B42C(&qword_255EAEF78);
  sub_230F8C2EC(&qword_255EAEF88, &qword_255EAEF78, MEMORY[0x24BDF4700]);
  return swift_getOpaqueTypeConformance2();
}

void sub_230F8C3F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F7FFDC(&dword_230F7C000, a1, a3, "Button images weren't created correcly", a5, a6, a7, a8, 0);
}

void sub_230F8C428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F7FFDC(&dword_230F7C000, a1, a3, "Buttons number is less than foreground apps number", a5, a6, a7, a8, 0);
}

uint64_t sub_230F8C45C()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return sub_230F8C47C(v0);
}

void sub_230F8C47C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230F7C000, log, OS_LOG_TYPE_ERROR, "Got too many foreground applications, should be 1 for a phone", v1, 2u);
}

void sub_230F8C4BC(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend_description(a2, (const char *)a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_230F7C000, a4, OS_LOG_TYPE_ERROR, "Couldn't read appName, error = %@", a1, 0xCu);

}

uint64_t sub_230F8C530()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_230F8C53C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_230F8C548()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_230F8C554()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_230F8C560()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_230F8C56C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_230F8C578()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_230F8C584()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_230F8C590()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_230F8C59C()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_230F8C5A8()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_230F8C5B4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_230F8C5C0()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_230F8C5CC()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_230F8C5D8()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_230F8C5E4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_230F8C5F0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_230F8C5FC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_230F8C608()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_230F8C614()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_230F8C620()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_230F8C62C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_230F8C638()
{
  return MEMORY[0x24BDF4540]();
}

uint64_t sub_230F8C644()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_230F8C650()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_230F8C65C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_230F8C668()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230F8C674()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230F8C680()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230F8C68C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_230F8C698()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_230F8C6A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_230F8C6B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_230F8C6BC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_230F8C6C8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_230F8C6D4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_230F8C6E0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_230F8C6EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230F8C6F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230F8C704()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXTextSizePercentage()
{
  return MEMORY[0x24BDFF9E0]();
}

uint64_t CCUIIsPortrait()
{
  return MEMORY[0x24BE19A78]();
}

uint64_t CCUISliderExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AE0]();
}

uint64_t CCUISliderExpandedContentModuleWidth()
{
  return MEMORY[0x24BE19AE8]();
}

uint64_t CCUISliderExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x24BE19AF0]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x24BEBDDD8](path, view);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t UICeilToScale()
{
  return MEMORY[0x24BEBE038]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x24BEBE040]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x24BEBE160]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x24BEBE618]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BEBE648]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BEBE658]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BEBE670]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BEBE680]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BEBE6B0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameApp()
{
  return MEMORY[0x24BED2198]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return MEMORY[0x24BED21A0]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x24BED2498]();
}

uint64_t _AXSSetPreferredContentSizeCategoryNameApp()
{
  return MEMORY[0x24BED24A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

