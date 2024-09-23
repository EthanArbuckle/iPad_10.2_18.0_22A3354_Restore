@implementation NUIContentScrollView

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- (void)setCanScrollDocumentViewHorizontally:(BOOL)a3
{
  if (self->_canScrollDocumentViewHorizontally != a3)
  {
    self->_canScrollDocumentViewHorizontally = a3;
    -[NUIContentScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCanScrollDocumentViewVertically:(BOOL)a3
{
  if (self->_canScrollDocumentViewVertically != a3)
  {
    self->_canScrollDocumentViewVertically = a3;
    -[NUIContentScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NUIContentScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NUIContentScrollView *v7;
  NUIContentScrollView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[NUIContentScrollView initWithDocumentView:](self, "initWithDocumentView:", 0);
  v8 = v7;
  if (v7)
    -[NUIContentScrollView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (NUIContentScrollView)initWithDocumentView:(id)a3
{
  id v4;
  NUIContentScrollView *v5;
  NUIContentScrollView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUIContentScrollView;
  v5 = -[NUIContentScrollView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_canScrollDocumentViewHorizontally = 1;
    v5->_canScrollDocumentViewVertically = 1;
    -[NUIContentScrollView _setHostsLayoutEngine:](v5, "_setHostsLayoutEngine:", 1);
    v6->_horizontalAlignment = 3;
    v6->_verticalAlignment = 1;
    -[NUIContentScrollView setDocumentView:](v6, "setDocumentView:", v4);
  }

  return v6;
}

- (void)setDocumentView:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NUIContentScrollView documentView](self, "documentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
    -[UIView removeFromSuperview](self->_documentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_documentView, a3);
    if (v7)
      -[NUIContentScrollView addSubview:](self, "addSubview:", v7);
    -[NUIContentScrollView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v6 = v7;
  }

}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 != -1)
    v3 = a3;
  if (self->_horizontalAlignment != v3)
  {
    self->_horizontalAlignment = v3;
    -[NUIContentScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  int64_t v3;

  if (a3 == -1)
    v3 = 1;
  else
    v3 = a3;
  if (self->_verticalAlignment != v3)
  {
    self->_verticalAlignment = v3;
    -[NUIContentScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  void *v2;
  char v3;

  -[NUIContentScrollView documentView](self, "documentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLayoutSizeDependentOnPerpendicularAxis");

  return v3;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NUIContentScrollView *v8;
  NUIContentScrollView *v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[UIView effectiveFirstBaselineOffsetFromContentTop](self, "effectiveFirstBaselineOffsetFromContentTop", a3.width, a3.height);
  v5 = v4;
  -[UIView effectiveBaselineOffsetFromContentBottom](self, "effectiveBaselineOffsetFromContentBottom");
  v7 = v6;
  -[NUIContentScrollView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout");
  v8 = (NUIContentScrollView *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
    v5 = 2.22507386e-308;
  -[NUIContentScrollView viewForLastBaselineLayout](self, "viewForLastBaselineLayout");
  v9 = (NUIContentScrollView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    v10 = 2.22507386e-308;
  else
    v10 = v7;
  v11 = v5;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[NUIContentScrollView documentView](self, "documentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[NUIContentScrollView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[NUIContentScrollView setNeedsLayout](self, "setNeedsLayout");
  }
  v6.receiver = self;
  v6.super_class = (Class)NUIContentScrollView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);

}

- (CGSize)_measureSizeForTargetSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  _BOOL4 v11;
  double v12;
  _BOOL4 v13;
  double v14;
  CGSize result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v11 = fabs(a3.width) < 0.001
     || -[NUIContentScrollView canScrollDocumentViewHorizontally](self, "canScrollDocumentViewHorizontally");
  if (fabs(height) >= 0.001)
  {
    v13 = -[NUIContentScrollView canScrollDocumentViewVertically](self, "canScrollDocumentViewVertically");
    v12 = width - (left + right);
    if (v11)
      v12 = 3.40282347e38;
    if (!v13)
    {
      v14 = height - (top + bottom);
      goto LABEL_13;
    }
  }
  else
  {
    v12 = width - (left + right);
    if (v11)
      v12 = 3.40282347e38;
  }
  v14 = 3.40282347e38;
LABEL_13:
  result.height = v14;
  result.width = v12;
  return result;
}

- (CGSize)_finalSizeForTargetSize:(CGSize)result resultSize:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double v5;

  v5 = a5.right + a4.width + a5.left;
  if (v5 < result.width)
    result.width = v5;
  if (a5.bottom + a4.height + a5.top < result.height)
    result.height = a5.bottom + a4.height + a5.top;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NUIContentScrollView contentInset](self, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v26 = width;
  v27 = height;
  -[NUIContentScrollView _measureSizeForTargetSize:insets:](self, "_measureSizeForTargetSize:insets:", width, height, v6, v8, v10, v12);
  v16 = 0.0;
  v17 = 0.0;
  if (v14 > 0.0)
  {
    v18 = v15;
    if (v15 > 0.0)
    {
      v19 = v14;
      -[NUIContentScrollView documentView](self, "documentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[NUIContentScrollView documentView](self, "documentView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "effectiveLayoutSizeFittingSize:", v19, v18);
        v16 = v22;
        v17 = v23;

      }
    }
  }
  -[NUIContentScrollView _finalSizeForTargetSize:resultSize:insets:](self, "_finalSizeForTargetSize:resultSize:insets:", v26, v27, v16, v17, v7, v9, v11, v13);
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  NUIContentScrollView *v5;

  -[NUIContentScrollView documentView](self, "documentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NUIContentScrollView documentView](self, "documentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForFirstBaselineLayout");
    v5 = (NUIContentScrollView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  NUIContentScrollView *v5;

  -[NUIContentScrollView documentView](self, "documentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NUIContentScrollView documentView](self, "documentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForLastBaselineLayout");
    v5 = (NUIContentScrollView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v4;
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
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  int64_t horizontalAlignment;
  double Width;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  double v34;
  double Height;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double MinX;
  double v45;
  double v46;
  double v47;
  double v48;
  double MinY;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  objc_super v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v82.receiver = self;
  v82.super_class = (Class)NUIContentScrollView;
  -[NUIContentScrollView layoutSubviews](&v82, sel_layoutSubviews);
  -[NUIContentScrollView documentView](self, "documentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUIContentScrollView contentInset](self, "contentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NUIContentScrollView bounds](self, "bounds");
    v14 = v13 - (v8 + v12);
    v16 = v15 - (v6 + v10);
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!-[NUIContentScrollView canScrollDocumentViewHorizontally](self, "canScrollDocumentViewHorizontally"))
      v17 = v14;
    if (!-[NUIContentScrollView canScrollDocumentViewVertically](self, "canScrollDocumentViewVertically"))
      v18 = v16;
    v20 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[NUIContentScrollView documentView](self, "documentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectiveLayoutSizeFittingSize:", v17, v18);
    v23 = v22;
    v25 = v24;

    -[NUIContentScrollView setContentSize:](self, "setContentSize:", v23, v25);
    v26 = -[NUIContentScrollView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    horizontalAlignment = self->_horizontalAlignment;
    if (v26 == 1)
    {
      switch(horizontalAlignment)
      {
        case 0:
          goto LABEL_9;
        case 1:
          goto LABEL_18;
        case 3:
          goto LABEL_17;
        case 4:
          break;
        default:
          goto LABEL_12;
      }
    }
    else
    {
      switch(horizontalAlignment)
      {
        case 0:
LABEL_9:
          v83.origin.x = v20;
          v83.origin.y = v19;
          v83.size.width = v23;
          v83.size.height = v25;
          Width = CGRectGetWidth(v83);
          if (Width >= v14)
            v23 = Width;
          else
            v23 = v14;
          break;
        case 1:
          break;
        case 3:
LABEL_17:
          v84.origin.x = v20;
          v84.origin.y = v19;
          v84.size.width = v23;
          v84.size.height = v25;
          v34 = (v14 - CGRectGetWidth(v84)) * 0.5;
          goto LABEL_19;
        case 4:
LABEL_18:
          v85.origin.x = v20;
          v85.origin.y = v19;
          v85.size.width = v23;
          v85.size.height = v25;
          v34 = v14 - CGRectGetWidth(v85);
LABEL_19:
          v20 = fmax(v34, 0.0);
          break;
        default:
LABEL_12:
          if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContentScrollView.m");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            v31 = CFSTR("<Unknown File>");
            if (v29)
              v31 = (__CFString *)v29;
            v32 = v31;

            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v32, 260, CFSTR("Invalid horizontal alignment %ld."), self->_horizontalAlignment);

          }
          break;
      }
    }
    switch(self->_verticalAlignment)
    {
      case 0:
        v86.origin.x = v20;
        v86.origin.y = v19;
        v86.size.width = v23;
        v86.size.height = v25;
        Height = CGRectGetHeight(v86);
        if (Height >= v16)
          v25 = Height;
        else
          v25 = v16;
        break;
      case 1:
        break;
      case 3:
        v87.origin.x = v20;
        v87.origin.y = v19;
        v87.size.width = v23;
        v87.size.height = v25;
        v41 = (v16 - CGRectGetHeight(v87)) * 0.5;
        goto LABEL_31;
      case 4:
        v88.origin.x = v20;
        v88.origin.y = v19;
        v88.size.width = v23;
        v88.size.height = v25;
        v41 = v16 - CGRectGetHeight(v88);
LABEL_31:
        v19 = fmax(v41, 0.0);
        break;
      default:
        if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContentScrollView.m");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          v38 = CFSTR("<Unknown File>");
          if (v36)
            v38 = (__CFString *)v36;
          v39 = v38;

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v39, 276, CFSTR("Invalid vertical alignment %ld."), self->_verticalAlignment);

        }
        break;
    }
    -[NUIContentScrollView _currentScreenScale](self, "_currentScreenScale");
    v43 = v42;
    v89.origin.x = v20;
    v89.origin.y = v19;
    v89.size.width = v23;
    v89.size.height = v25;
    MinX = CGRectGetMinX(v89);
    if (v43 == 1.0)
    {
      v45 = ceil(MinX);
      v46 = v45 - MinX;
      v47 = floor(MinX);
      if (v46 >= 0.001)
        v48 = v47;
      else
        v48 = v45;
      v90.origin.x = v20;
      v90.origin.y = v19;
      v90.size.width = v23;
      v90.size.height = v25;
      MinY = CGRectGetMinY(v90);
      v50 = ceil(MinY);
      v51 = v50 - MinY;
      v52 = floor(MinY);
      if (v51 >= 0.001)
        v53 = v52;
      else
        v53 = v50;
      v91.origin.x = v20;
      v91.origin.y = v19;
      v91.size.width = v23;
      v91.size.height = v25;
      v54 = CGRectGetWidth(v91);
      v55 = floor(v54);
      v56 = v54 - v55;
      v57 = ceil(v54);
      if (v56 >= 0.001)
        v58 = v57;
      else
        v58 = v55;
      v92.origin.x = v20;
      v92.origin.y = v19;
      v92.size.width = v23;
      v92.size.height = v25;
      v59 = CGRectGetHeight(v92);
      v60 = floor(v59);
      v61 = v59 - v60;
      v62 = ceil(v59);
      if (v61 >= 0.001)
        v63 = v62;
      else
        v63 = v60;
    }
    else
    {
      v64 = v43 * MinX;
      v65 = ceil(v64);
      v66 = v65 - v64;
      v67 = floor(v64);
      if (v66 < 0.001)
        v67 = v65;
      v81 = v67 / v43;
      v93.origin.x = v20;
      v93.origin.y = v19;
      v93.size.width = v23;
      v93.size.height = v25;
      v68 = v43 * CGRectGetMinY(v93);
      v69 = ceil(v68);
      v70 = v69 - v68;
      v71 = floor(v68);
      if (v70 < 0.001)
        v71 = v69;
      v53 = v71 / v43;
      v94.origin.x = v20;
      v94.origin.y = v19;
      v94.size.width = v23;
      v94.size.height = v25;
      v72 = v43 * CGRectGetWidth(v94);
      v73 = floor(v72);
      v74 = v72 - v73;
      v75 = ceil(v72);
      if (v74 < 0.001)
        v75 = v73;
      v58 = v75 / v43;
      v95.origin.x = v20;
      v95.origin.y = v19;
      v95.size.width = v23;
      v95.size.height = v25;
      v76 = v43 * CGRectGetHeight(v95);
      v77 = floor(v76);
      v78 = v76 - v77;
      v79 = ceil(v76);
      v48 = v81;
      if (v78 < 0.001)
        v79 = v77;
      v63 = v79 / v43;
    }
    -[NUIContentScrollView documentView](self, "documentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v48, v53, v58, v63);

  }
}

- (UIView)documentView
{
  return self->_documentView;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (BOOL)canScrollDocumentViewHorizontally
{
  return self->_canScrollDocumentViewHorizontally;
}

- (BOOL)canScrollDocumentViewVertically
{
  return self->_canScrollDocumentViewVertically;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentView, 0);
}

@end
