@implementation UIScrollView(MFMailComposeView)

- (BOOL)mf_needsToAdjustContentOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v30;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "contentOffset");
  v11 = v10;
  v30 = v12;
  objc_msgSend(a1, "contentSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(a1, "_effectiveContentInset");
  v21 = round(-v20);
  if (v7 < round(v19 + v14 + v20) && v3 >= v21)
  {
    v23 = round(v14 + v19);
    if (v3 + v7 > v23)
      v21 = v23 - v7;
    else
      v21 = v11;
  }
  v24 = round(-v17);
  if (v9 < round(v18 + v16 + v17) && v5 >= v24)
  {
    v26 = round(v16 + v18);
    v24 = v30;
    if (v5 + v9 > v26)
      v24 = v26 - v9;
  }
  objc_msgSend(a1, "contentOffset");
  return v28 != v24 || v27 != v21;
}

@end
