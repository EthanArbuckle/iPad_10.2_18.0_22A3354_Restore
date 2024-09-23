@implementation UIView(_QLUtilities)

- (void)QL_setAnchorPointAndUpdatePosition:()_QLUtilities
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  objc_msgSend(a1, "bounds");
  v7 = a2 * v6;
  objc_msgSend(a1, "bounds");
  v9 = a3 * v8;
  objc_msgSend(a1, "bounds");
  v11 = v10;
  objc_msgSend(a1, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  v14 = v11 * v13;
  objc_msgSend(a1, "bounds");
  v16 = v15;
  objc_msgSend(a1, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anchorPoint");
  v19 = v16 * v18;

  objc_msgSend(a1, "transform");
  v20 = v41 + v9 * v39 + v37 * v7;
  v21 = v42 + v9 * v40 + v38 * v7;
  objc_msgSend(a1, "transform");
  v22 = v35 + v19 * v33 + v31 * v14;
  v23 = v36 + v19 * v34 + v32 * v14;
  objc_msgSend(a1, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "position");
  v26 = v25;
  v28 = v27;

  objc_msgSend(a1, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPosition:", v20 + v26 - v22, v21 + v28 - v23);

  objc_msgSend(a1, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAnchorPoint:", a2, a3);

}

@end
