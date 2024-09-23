@implementation FKAScrollView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_scrollInXDirection:(double)a3 yDirection:(double)a4
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double Width;
  double v27;
  double MaxX;
  double Height;
  double v30;
  double MaxY;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[FKAScrollView bounds](self, "bounds");
  v6 = v5;
  v34 = v7;
  v9 = v8;
  v11 = v10;
  -[FKAScrollView contentSize](self, "contentSize");
  v13 = v12;
  v15 = v14;
  -[FKAScrollView contentInset](self, "contentInset");
  v19 = 0.0 - v18;
  v21 = 0.0 - v20;
  v22 = v13 - (-v17 - v18);
  v23 = v15 - (-v16 - v20);
  -[FKAScrollView contentOffset](self, "contentOffset");
  v35 = v25;
  v37 = v24;
  v39.origin.x = v19;
  v39.origin.y = v21;
  v39.size.width = v22;
  v39.size.height = v23;
  Width = CGRectGetWidth(v39);
  v40.origin.x = v6;
  v40.origin.y = v34;
  v40.size.width = v9;
  v40.size.height = v11;
  if (Width > CGRectGetWidth(v40))
  {
    v41.origin.x = v6;
    v41.origin.y = v34;
    v41.size.width = v9;
    v41.size.height = v11;
    v27 = v37 + a3 * 0.5 * CGRectGetWidth(v41);
    v42.origin.x = v19;
    v42.origin.y = v21;
    v42.size.width = v22;
    v42.size.height = v23;
    v38 = fmax(CGRectGetMinX(v42), v27);
    v43.origin.x = v19;
    v43.origin.y = v21;
    v43.size.width = v22;
    v43.size.height = v23;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = v6;
    v44.origin.y = v34;
    v44.size.width = v9;
    v44.size.height = v11;
    v37 = fmin(MaxX - CGRectGetWidth(v44), v38);
  }
  v45.origin.x = v19;
  v45.origin.y = v21;
  v45.size.width = v22;
  v45.size.height = v23;
  Height = CGRectGetHeight(v45);
  v46.origin.x = v6;
  v46.size.height = v11;
  v46.origin.y = v34;
  v46.size.width = v9;
  if (Height > CGRectGetHeight(v46))
  {
    v47.size.height = v11;
    v47.origin.x = v6;
    v47.origin.y = v34;
    v47.size.width = v9;
    v30 = v35 + a4 * 0.5 * CGRectGetHeight(v47);
    v48.origin.x = v19;
    v48.origin.y = v21;
    v48.size.width = v22;
    v48.size.height = v23;
    v36 = fmax(CGRectGetMinY(v48), v30);
    v49.origin.x = v19;
    v49.origin.y = v21;
    v49.size.width = v22;
    v49.size.height = v23;
    MaxY = CGRectGetMaxY(v49);
    v50.origin.x = v6;
    v50.origin.y = v34;
    v50.size.width = v9;
    v50.size.height = v11;
    v35 = fmin(MaxY - CGRectGetHeight(v50), v36);
  }
  -[FKAScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v37, v35);
}

- (void)_scrollUp:(id)a3
{
  -[FKAScrollView _scrollInXDirection:yDirection:](self, "_scrollInXDirection:yDirection:", a3, 0.0, -1.0);
}

- (void)_scrollDown:(id)a3
{
  -[FKAScrollView _scrollInXDirection:yDirection:](self, "_scrollInXDirection:yDirection:", a3, 0.0, 1.0);
}

- (id)_accessibilityKeyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0, sel__scrollUp_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0, sel__scrollDown_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
