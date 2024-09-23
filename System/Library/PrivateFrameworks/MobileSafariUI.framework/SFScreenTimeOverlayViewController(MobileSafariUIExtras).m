@implementation SFScreenTimeOverlayViewController(MobileSafariUIExtras)

- (uint64_t)snapshotBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("ScreenTimeSnapshotBackgroundColor"));
}

- (double)snapshotContentRectInBounds:()MobileSafariUIExtras
{
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  objc_msgSend(a1, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  CGRectGetWidth(v24);
  v25.origin.x = v11;
  v25.origin.y = v13;
  v25.size.width = v15;
  v25.size.height = v17;
  CGRectGetWidth(v25);
  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  CGRectGetMinY(v26);
  objc_msgSend(v9, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowScene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "statusBarManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "statusBarFrame");
  CGRectGetHeight(v27);
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  CGRectGetWidth(v28);
  v29.origin.x = v11;
  v29.origin.y = v13;
  v29.size.width = v15;
  v29.size.height = v17;
  CGRectGetHeight(v29);

  return 0.0;
}

@end
