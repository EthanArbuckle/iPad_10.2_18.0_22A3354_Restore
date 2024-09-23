@implementation BCUI2x2AvocadoViewController

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  unint64_t v13;
  int v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MinX;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[13];
  char v37;
  _QWORD v38[3];
  CGFloat MinY;
  _QWORD v40[3];
  double v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v42.receiver = self;
  v42.super_class = (Class)BCUI2x2AvocadoViewController;
  -[BCUIAvocadoViewController viewWillLayoutSubviews](&v42, sel_viewWillLayoutSubviews);
  -[BCUI2x2AvocadoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[BCUIAvocadoViewController batteryDevices](self, "batteryDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  v44 = CGRectInset(v43, 12.0, 12.0);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  v19 = CGRectGetWidth(v44);
  v20 = v19;
  if (v13 <= 1)
  {
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v23 = CGRectGetHeight(v46);
  }
  else
  {
    v21 = (v19 + -11.0) * 0.5;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v22 = (CGRectGetHeight(v45) + -11.0) * 0.5;
    if (v21 <= v22)
      v20 = v21;
    else
      v20 = v22;
    v23 = v20;
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0.0;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  if (v14)
    MinX = CGRectGetMaxX(*(CGRect *)&v24) - v20;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v24);
  v41 = MinX;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  MinY = 0.0;
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MinY = CGRectGetMinY(v47);
  objc_msgSend(v3, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v3, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "screen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v33 = v32;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scale");
    v33 = v34;
  }

  -[BCUIAvocadoViewController _batteryDeviceViews](self, "_batteryDeviceViews");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __54__BCUI2x2AvocadoViewController_viewWillLayoutSubviews__block_invoke;
  v36[3] = &unk_1E9418248;
  v36[4] = v40;
  v36[5] = v38;
  *(double *)&v36[6] = v20;
  *(CGFloat *)&v36[7] = v23;
  v37 = v14;
  v36[8] = v33;
  *(CGFloat *)&v36[9] = x;
  *(CGFloat *)&v36[10] = y;
  *(CGFloat *)&v36[11] = width;
  *(CGFloat *)&v36[12] = height;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v36);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

}

void __54__BCUI2x2AvocadoViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double MinX;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a2;
  UIRectIntegralWithScale();
  objc_msgSend(v5, "setFrame:");

  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  if (*(_BYTE *)(a1 + 104))
    MinX = CGRectGetMaxX(*(CGRect *)&v6) - *(double *)(a1 + 48);
  else
    MinX = CGRectGetMinX(*(CGRect *)&v6);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MinX;
  if ((a3 & 1) == 0)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(double *)(v11 + 24);
    v13 = *(double *)(a1 + 48);
    v14 = v12 - v13 + -11.0;
    v15 = v12 + v13 + 11.0;
    if (*(_BYTE *)(a1 + 104))
      v15 = v14;
    *(double *)(v11 + 24) = v15;
  }
  if (a3 == 1)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56)
                                                                + 11.0
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  return 4;
}

- (BOOL)_includeEmptyDevices
{
  void *v2;
  BOOL v3;

  -[BCUIAvocadoViewController batteryDevices](self, "batteryDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)_newBatteryDeviceView
{
  BCUIRingItemView *v2;

  v2 = objc_alloc_init(BCUIRingItemView);
  -[BCUIRingItemView setRingLineWidth:](v2, "setRingLineWidth:", 6.0);
  return v2;
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCUI2x2AvocadoViewController;
  -[BCUIAvocadoViewController _configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:](&v15, sel__configureBatteryDeviceView_withBatteryDevice_transitionCoordinator_, v8, a4, a5);
  -[BCUIAvocadoViewController batteryDevices](self, "batteryDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = objc_opt_class();
  v12 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  objc_msgSend(v14, "setRingItemViewStyle:", 2 * (v10 < 2));
}

@end
