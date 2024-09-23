@implementation UIView(MediaControlsCollectionViewController)

- (double)mediaControls_untransformedFrame
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "center");
  v11 = v10;
  v14.origin.x = v3;
  v14.origin.y = v5;
  v14.size.width = v7;
  v14.size.height = v9;
  v12 = v11 - CGRectGetWidth(v14) * 0.5;
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  CGRectGetHeight(v15);
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  CGRectGetWidth(v16);
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  CGRectGetHeight(v17);
  return v12;
}

- (uint64_t)setMediaControls_untransformedFrame:()MediaControlsCollectionViewController
{
  double Width;
  CGRect v12;

  Width = CGRectGetWidth(*(CGRect *)&a2);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  objc_msgSend(a1, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v12));
  UIRectGetCenter();
  return objc_msgSend(a1, "setCenter:");
}

@end
