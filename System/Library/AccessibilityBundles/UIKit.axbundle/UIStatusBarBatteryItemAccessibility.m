@implementation UIStatusBarBatteryItemAccessibility

double __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke(id *a1)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect r2;
  CGRect r1;
  CGRect v27;
  id WeakRetained;
  id v29[3];
  __int128 v30;
  __int128 v31;

  v29[2] = a1;
  v29[1] = a1;
  v29[0] = objc_loadWeakRetained(a1 + 4);
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v29[0], "frame");
  r1.origin.x = v1;
  r1.origin.y = v2;
  r1.size.width = v3;
  r1.size.height = v4;
  objc_msgSend(WeakRetained, "frame");
  r2.origin.x = v5;
  r2.origin.y = v6;
  r2.size.width = v7;
  r2.size.height = v8;
  v27 = CGRectUnion(r1, r2);
  v19 = (id)objc_msgSend(v29[0], "superview");
  objc_msgSend(v19, "convertRect:toView:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v12;

  v30 = 0u;
  v31 = 0u;
  v20 = (id)objc_msgSend(v29[0], "window");
  objc_msgSend(v20, "convertRect:toWindow:", 0, v21, v22, v23, v24);
  *(_QWORD *)&v30 = v13;
  *((_QWORD *)&v30 + 1) = v14;
  *(_QWORD *)&v31 = v15;
  *((_QWORD *)&v31 + 1) = v16;

  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v29, 0);
  return *(double *)&v30;
}

double __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2(id *a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20[3];
  __int128 v21;
  __int128 v22;

  v20[2] = a1;
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 4);
  v14 = (id)objc_msgSend(v20[0], "superview");
  objc_msgSend(v20[0], "frame");
  objc_msgSend(v14, "convertRect:toView:", v1, v2, v3, v4);
  v16 = v5;
  v17 = v6;
  v18 = v7;
  v19 = v8;

  v21 = 0u;
  v22 = 0u;
  v15 = (id)objc_msgSend(v20[0], "window");
  objc_msgSend(v15, "convertRect:toWindow:", 0, v16, v17, v18, v19);
  *(_QWORD *)&v21 = v9;
  *((_QWORD *)&v21 + 1) = v10;
  *(_QWORD *)&v22 = v11;
  *((_QWORD *)&v22 + 1) = v12;

  objc_storeStrong(v20, 0);
  return *(double *)&v21;
}

@end
