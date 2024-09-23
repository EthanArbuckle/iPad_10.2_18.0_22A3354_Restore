@implementation TabDocumentView

- (void)layoutSubviews
{
  id v3;
  WKWebView *readerWebView;
  WKWebView *webView;
  int v6;
  int showingReader;
  WKWebView *v8;
  WKWebView *v9;
  int v10;
  int v11;
  id WeakRetained;
  _OWORD v13[16];
  _OWORD v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)TabDocumentView;
  -[TabDocumentView layoutSubviews](&v31, sel_layoutSubviews);
  v3 = (id)-[WKWebView _sf_effectiveViewToLayOut](self->_webView, "_sf_effectiveViewToLayOut");
  readerWebView = self->_readerWebView;
  v32[0] = v3;
  v32[1] = readerWebView;
  v32[2] = self->_readerTransitionContainerView;
  -[TabDocumentView _sf_setOrderedSubviews:count:](self, "_sf_setOrderedSubviews:count:", v32, 3);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TabDocumentView currentGeometry](self, "currentGeometry");
  webView = self->_webView;
  if (webView)
  {
    v6 = -[WKWebView isHidden](webView, "isHidden");
    showingReader = self->_showingReader;
    v8 = self->_webView;
    if (showingReader != v6)
    {
      -[WKWebView setHidden:](self->_webView, "setHidden:", showingReader != 0);
      v8 = self->_webView;
    }
  }
  else
  {
    v8 = 0;
  }
  v14[12] = v27;
  v14[13] = v28;
  v14[14] = v29;
  v14[15] = v30;
  v14[8] = v23;
  v14[9] = v24;
  v14[10] = v25;
  v14[11] = v26;
  v14[4] = v19;
  v14[5] = v20;
  v14[6] = v21;
  v14[7] = v22;
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  v14[3] = v18;
  -[TabDocumentView applyGeometry:toWebView:](self, "applyGeometry:toWebView:", v14, v8);
  v13[12] = v27;
  v13[13] = v28;
  v13[14] = v29;
  v13[15] = v30;
  v13[8] = v23;
  v13[9] = v24;
  v13[10] = v25;
  v13[11] = v26;
  v13[4] = v19;
  v13[5] = v20;
  v13[6] = v21;
  v13[7] = v22;
  v13[0] = v15;
  v13[1] = v16;
  v13[2] = v17;
  v13[3] = v18;
  -[TabDocumentView applyGeometry:toWebView:](self, "applyGeometry:toWebView:", v13, self->_readerWebView);
  v9 = self->_readerWebView;
  if (v9)
  {
    v10 = -[WKWebView isHidden](v9, "isHidden");
    v11 = self->_showingReader;
    if (v11 == v10)
      -[WKWebView setHidden:](self->_readerWebView, "setHidden:", v11 == 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
  objc_msgSend(WeakRetained, "tabDocumentViewDidUpdateDistanceScrolled:", self);

}

- (void)applyGeometry:(id *)a3 toWebView:(id)a4
{
  id v6;
  id WeakRetained;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGSize var5;
  __int128 v19;
  __int128 v20;
  CGSize size;
  __int128 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGSize v27;
  __int128 v28;
  __int128 v29;
  CGSize v30;
  __int128 v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGSize v38;
  __int128 v39;
  __int128 v40;
  CGSize v41;
  __int128 v42;
  char v43;
  double v44;
  double v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  char v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGSize v69;
  __int128 v70;
  __int128 v71;
  CGSize v72;
  __int128 v73;
  void *v74;
  uint64_t v75;
  _OWORD v76[4];
  _OWORD v77[16];
  _OWORD v78[16];
  _OWORD v79[16];
  _OWORD v80[16];
  BOOL v81;
  _OWORD v82[16];
  uint8_t v83[4];
  uint64_t v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _BYTE buf[32];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
    if ((objc_msgSend(WeakRetained, "shouldFreezeWebViewUpdatesForTabDocumentView:", self) & 1) != 0)
      goto LABEL_27;
    x = a3->var0.origin.x;
    y = a3->var0.origin.y;
    width = a3->var0.size.width;
    height = a3->var0.size.height;
    objc_msgSend(v6, "_sf_effectiveViewToLayOut");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", x, y, width, height);

    if (a3->var8
      || (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(WeakRetained, "shouldModifyWebViewGeometryForTabDocumentView:", self) & 1) == 0)
    {
      goto LABEL_27;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXLayout();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_getAssociatedObject(v6, &-[TabDocumentView applyGeometry:toWebView:]::lastAppliedGeometryKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_OWORD *)&a3->var7.top;
      v82[12] = a3->var6;
      v82[13] = v15;
      v16 = *(_OWORD *)&a3->var8;
      v82[14] = *(_OWORD *)&a3->var7.bottom;
      v82[15] = v16;
      v17 = *(_OWORD *)&a3->var3.var1.bottom;
      v82[8] = *(_OWORD *)&a3->var3.var1.top;
      v82[9] = v17;
      var5 = a3->var5;
      v82[10] = a3->var4;
      v82[11] = var5;
      v19 = *(_OWORD *)&a3->var2.bottom;
      v82[4] = *(_OWORD *)&a3->var2.top;
      v82[5] = v19;
      v20 = *(_OWORD *)&a3->var3.var0.bottom;
      v82[6] = *(_OWORD *)&a3->var3.var0.top;
      v82[7] = v20;
      size = a3->var0.size;
      v82[0] = a3->var0.origin;
      v82[1] = size;
      v22 = *(_OWORD *)&a3->var1.bottom;
      v82[2] = *(_OWORD *)&a3->var1.top;
      v82[3] = v22;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v82, "{?={CGRect={CGPoint=dd}{CGSize=dd}}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}{SFScrollIndicatorInsets={UIEdgeInsets=dddd}{UIEdgeInsets=dddd}}{CGSize=dd}{CGSize=dd}{CGSize=dd}{UIEdgeInsets=dddd}Bd}");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v6, &-[TabDocumentView applyGeometry:toWebView:]::lastAppliedGeometryKey, v23, (void *)0x301);

      if (v14)
      {
        objc_msgSend(v14, "getValue:size:", buf, 256);
        v81 = 0;
        v80[13] = v101;
        v80[14] = v102;
        v80[15] = v103;
        v80[8] = v96;
        v80[9] = v97;
        v80[10] = v98;
        v80[11] = v99;
        v80[12] = v100;
        v80[4] = v92;
        v80[5] = v93;
        v80[6] = v94;
        v80[7] = v95;
        v80[0] = *(_OWORD *)buf;
        v80[1] = *(_OWORD *)&buf[16];
        v80[2] = v90;
        v80[3] = v91;
        v24 = *(_OWORD *)&a3->var7.top;
        v79[12] = a3->var6;
        v79[13] = v24;
        v25 = *(_OWORD *)&a3->var8;
        v79[14] = *(_OWORD *)&a3->var7.bottom;
        v79[15] = v25;
        v26 = *(_OWORD *)&a3->var3.var1.bottom;
        v79[8] = *(_OWORD *)&a3->var3.var1.top;
        v79[9] = v26;
        v27 = a3->var5;
        v79[10] = a3->var4;
        v79[11] = v27;
        v28 = *(_OWORD *)&a3->var2.bottom;
        v79[4] = *(_OWORD *)&a3->var2.top;
        v79[5] = v28;
        v29 = *(_OWORD *)&a3->var3.var0.bottom;
        v79[6] = *(_OWORD *)&a3->var3.var0.top;
        v79[7] = v29;
        v30 = a3->var0.size;
        v79[0] = a3->var0.origin;
        v79[1] = v30;
        v31 = *(_OWORD *)&a3->var1.bottom;
        v79[2] = *(_OWORD *)&a3->var1.top;
        v79[3] = v31;
        WebViewGeometryDescriptionOfDifferenceFromGeometry((uint64_t)v80, (uint64_t)v79, &v81);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v81)
        {
          v33 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v75 = objc_opt_class();
            *(_DWORD *)v83 = 138543874;
            v84 = v75;
            v85 = 2048;
            v86 = v6;
            v87 = 2114;
            v88 = v32;
            _os_log_debug_impl(&dword_1D7CA3000, v33, OS_LOG_TYPE_DEBUG, "Updating <%{public}@: %p> geometry with %{public}@", v83, 0x20u);
          }

        }
      }
      else
      {
        v34 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v65 = objc_opt_class();
          v66 = *(_OWORD *)&a3->var7.top;
          v78[12] = a3->var6;
          v78[13] = v66;
          v67 = *(_OWORD *)&a3->var8;
          v78[14] = *(_OWORD *)&a3->var7.bottom;
          v78[15] = v67;
          v68 = *(_OWORD *)&a3->var3.var1.bottom;
          v78[8] = *(_OWORD *)&a3->var3.var1.top;
          v78[9] = v68;
          v69 = a3->var5;
          v78[10] = a3->var4;
          v78[11] = v69;
          v70 = *(_OWORD *)&a3->var2.bottom;
          v78[4] = *(_OWORD *)&a3->var2.top;
          v78[5] = v70;
          v71 = *(_OWORD *)&a3->var3.var0.bottom;
          v78[6] = *(_OWORD *)&a3->var3.var0.top;
          v78[7] = v71;
          v72 = a3->var0.size;
          v78[0] = a3->var0.origin;
          v78[1] = v72;
          v73 = *(_OWORD *)&a3->var1.bottom;
          v78[2] = *(_OWORD *)&a3->var1.top;
          v78[3] = v73;
          WebViewGeometryDescription((uint64_t)v78);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v74;
          _os_log_debug_impl(&dword_1D7CA3000, v34, OS_LOG_TYPE_DEBUG, "Setting initial geometry of <%{public}@: %p> with %{public}@", buf, 0x20u);

        }
      }

    }
    v35 = *(_OWORD *)&a3->var7.top;
    v77[12] = a3->var6;
    v77[13] = v35;
    v36 = *(_OWORD *)&a3->var8;
    v77[14] = *(_OWORD *)&a3->var7.bottom;
    v77[15] = v36;
    v37 = *(_OWORD *)&a3->var3.var1.bottom;
    v77[8] = *(_OWORD *)&a3->var3.var1.top;
    v77[9] = v37;
    v38 = a3->var5;
    v77[10] = a3->var4;
    v77[11] = v38;
    v39 = *(_OWORD *)&a3->var2.bottom;
    v77[4] = *(_OWORD *)&a3->var2.top;
    v77[5] = v39;
    v40 = *(_OWORD *)&a3->var3.var0.bottom;
    v77[6] = *(_OWORD *)&a3->var3.var0.top;
    v77[7] = v40;
    v41 = a3->var0.size;
    v77[0] = a3->var0.origin;
    v77[1] = v41;
    v42 = *(_OWORD *)&a3->var1.bottom;
    v77[2] = *(_OWORD *)&a3->var1.top;
    v77[3] = v42;
    objc_msgSend(v6, "sf_setDisplayedWebViewGeometry:", v77);
    v43 = objc_opt_respondsToSelector();
    v44 = a3->var4.width;
    v45 = a3->var4.height;
    if ((v43 & 1) != 0)
      objc_msgSend(v6, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v44, v45, a3->var5.width, a3->var5.height, a3->var6.width, a3->var6.height);
    else
      objc_msgSend(v6, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v44, v45, a3->var6.width, a3->var6.height);
    objc_msgSend(v6, "_setObscuredInsets:", a3->var2.top, a3->var2.left, a3->var2.bottom, a3->var2.right);
    objc_msgSend(v6, "_setUnobscuredSafeAreaInsets:", a3->var1.top, a3->var1.left, a3->var1.bottom, a3->var1.right);
    objc_msgSend(v6, "_setMinimumEffectiveDeviceWidth:", a3->var9);
    objc_msgSend(v6, "scrollView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *(_OWORD *)&a3->var3.var0.bottom;
    v76[0] = *(_OWORD *)&a3->var3.var0.top;
    v76[1] = v47;
    v48 = *(_OWORD *)&a3->var3.var1.bottom;
    v76[2] = *(_OWORD *)&a3->var3.var1.top;
    v76[3] = v48;
    objc_msgSend(v46, "_sf_setScrollIndicatorInsets:", v76);
    objc_msgSend(v46, "contentInset");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    objc_msgSend(v46, "_sf_setContentInsetAdjustments:", a3->var7.top, a3->var7.left, a3->var7.bottom, a3->var7.right);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v57 = objc_msgSend(WeakRetained, "tabDocumentView:contentOffsetAdjustmentEdgeWithPreviousContentInset:", self, v50, v52, v54, v56);
      objc_msgSend(v46, "contentOffset");
      v59 = v58;
      v61 = v60;
      if ((v57 & 1) != 0)
      {
        objc_msgSend(v46, "contentInset");
        v63 = v61 - (v64 - v50);
        goto LABEL_25;
      }
      if ((v57 & 4) != 0)
      {
        objc_msgSend(v46, "contentInset");
        v63 = v61 + v62 - v54;
LABEL_25:
        objc_msgSend(v46, "_setContentOffsetPinned:", v59, v63);
      }
    }

LABEL_27:
  }

}

- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry
{
  id WeakRetained;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  $FBE3A1C208404EC7AA4040899845A87A *result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  *(_OWORD *)&retstr->var1.top = 0u;
  *(_OWORD *)&retstr->var1.bottom = 0u;
  *(_OWORD *)&retstr->var2.top = 0u;
  *(_OWORD *)&retstr->var2.bottom = 0u;
  *(_OWORD *)&retstr->var3.var0.top = 0u;
  *(_OWORD *)&retstr->var3.var0.bottom = 0u;
  *(_OWORD *)&retstr->var3.var1.top = 0u;
  *(_OWORD *)&retstr->var3.var1.bottom = 0u;
  retstr->var4 = 0u;
  retstr->var5 = 0u;
  retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.top = 0u;
  *(_OWORD *)&retstr->var7.bottom = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  if (WeakRetained)
  {
    -[TabDocumentView bounds](self, "bounds");
    retstr->var0.origin.x = v6;
    retstr->var0.origin.y = v7;
    retstr->var0.size.width = v8;
    retstr->var0.size.height = v9;
    objc_msgSend(WeakRetained, "obscuredScrollViewInsetsForTabDocumentView:unobscuredSafeAreaInsets:", self, &retstr->var1);
    retstr->var2.top = v10;
    retstr->var2.left = v11;
    retstr->var2.bottom = v12;
    retstr->var2.right = v13;
    objc_msgSend(WeakRetained, "scrollIndicatorInsetsForTabDocumentView:", self);
    *(_OWORD *)&retstr->var3.var0.top = v26;
    *(_OWORD *)&retstr->var3.var0.bottom = v27;
    *(_OWORD *)&retstr->var3.var1.top = v28;
    *(_OWORD *)&retstr->var3.var1.bottom = v29;
    objc_msgSend(WeakRetained, "minimumWebViewLayoutSizeForTabDocumentView:", self);
    retstr->var4.width = v14;
    retstr->var4.height = v15;
    objc_msgSend(WeakRetained, "minimumUnobscuredWebViewLayoutSizeForTabDocumentView:", self);
    retstr->var5.width = v16;
    retstr->var5.height = v17;
    objc_msgSend(WeakRetained, "maximumUnobscuredWebViewLayoutSizeForTabDocumentView:", self);
    retstr->var6.width = v18;
    retstr->var6.height = v19;
    objc_msgSend(WeakRetained, "scrollViewContentInsetAdjustmentsForTabDocumentView:", self);
    retstr->var7.top = v20;
    retstr->var7.left = v21;
    retstr->var7.bottom = v22;
    retstr->var7.right = v23;
    retstr->var8 = objc_msgSend(WeakRetained, "inElementFullscreenForTabDocumentView:", self);
    objc_msgSend(WeakRetained, "minimumEffectiveDeviceWidthForTabDocumentView:", self);
    retstr->var9 = v24;
  }

  return result;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (void)ensureContentOffsetWithinContentInsets
{
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
  id v13;
  id v14;

  -[TabDocumentView layoutIfNeeded](self, "layoutIfNeeded");
  -[WKWebView scrollView](self->_webView, "scrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isDragging") & 1) == 0)
  {
    objc_msgSend(v13, "contentOffset");
    v4 = v3;
    v6 = v5;
    objc_msgSend(v13, "adjustedContentInset");
    if (v6 < -v7)
      objc_msgSend(v13, "setContentOffset:", v4);
  }

  -[WKWebView scrollView](self->_readerWebView, "scrollView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isDragging") & 1) == 0)
  {
    objc_msgSend(v14, "contentOffset");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v14, "adjustedContentInset");
    if (v11 < -v12)
      objc_msgSend(v14, "setContentOffset:", v9);
  }

}

- (void)setWebView:(id)a3
{
  WKWebView *v5;
  WKWebView *webView;
  WKWebView *v7;

  v5 = (WKWebView *)a3;
  webView = self->_webView;
  v7 = v5;
  if (webView != v5)
  {
    -[WKWebView removeFromSuperview](webView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_webView, a3);
    if (v7)
      -[TabDocumentView addSubview:](self, "addSubview:", v7);
    -[TabDocumentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setReaderWebView:(id)a3
{
  WKWebView *v5;
  WKWebView *readerWebView;
  WKWebView *v7;

  v5 = (WKWebView *)a3;
  readerWebView = self->_readerWebView;
  v7 = v5;
  if (readerWebView != v5)
  {
    -[WKWebView removeFromSuperview](readerWebView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_readerWebView, a3);
    if (v7)
      -[TabDocumentView addSubview:](self, "addSubview:", v7);
    -[TabDocumentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setGeometryProvider:(id)a3
{
  objc_storeWeak((id *)&self->_geometryProvider, a3);
}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int *v8;
  int64_t interactiveGeometryUpdateCount;
  int *v10;
  void (**v11)(void);

  v5 = a4;
  v6 = a3;
  v11 = (void (**)(void))a5;
  if (self->_showingReader != v6)
  {
    if (self->_interactiveGeometryUpdateCount)
    {
      if (self->_showingReader)
        v8 = &OBJC_IVAR___TabDocumentView__readerWebView;
      else
        v8 = &OBJC_IVAR___TabDocumentView__webView;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "_endInteractiveObscuredInsetsChange");
      interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
      self->_showingReader = v6;
      if (interactiveGeometryUpdateCount)
      {
        if (v6)
          v10 = &OBJC_IVAR___TabDocumentView__readerWebView;
        else
          v10 = &OBJC_IVAR___TabDocumentView__webView;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v10), "_beginInteractiveObscuredInsetsChange");
      }
      if (v5)
        goto LABEL_12;
    }
    else
    {
      self->_showingReader = v6;
      if (v5)
      {
LABEL_12:
        -[TabDocumentView _performReaderTransitionWithCompletion:](self, "_performReaderTransitionWithCompletion:", v11);
        goto LABEL_16;
      }
    }
    -[TabDocumentView setNeedsLayout](self, "setNeedsLayout");
    if (v11)
      v11[2]();
  }
LABEL_16:

}

- (void)_performReaderTransitionWithCompletion:(id)a3
{
  UIView **p_readerTransitionContainerView;
  id v5;
  int *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _BOOL4 showingReader;
  float minimum;
  float maximum;
  float preferred;
  double v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  TabDocumentView *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  TabDocumentView *v44;
  id v45;
  uint64_t *v46;
  _QWORD v47[4];
  id v48;
  TabDocumentView *v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  __n128 (*v53)(uint64_t, uint64_t);
  uint64_t (*v54)();
  const char *v55;
  __int128 v56;
  __int128 v57;
  CAFrameRateRange v58;

  v37 = a3;
  p_readerTransitionContainerView = &self->_readerTransitionContainerView;
  -[UIView removeFromSuperview](self->_readerTransitionContainerView, "removeFromSuperview");
  v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[TabDocumentView bounds](self, "bounds");
  v35 = (void *)objc_msgSend(v5, "initWithFrame:");
  objc_storeStrong((id *)&self->_readerTransitionContainerView, v35);
  -[TabDocumentView setNeedsLayout](self, "setNeedsLayout");
  -[TabDocumentView layoutSubviews](self, "layoutSubviews");
  if (self->_showingReader)
    v6 = &OBJC_IVAR___TabDocumentView__webView;
  else
    v6 = &OBJC_IVAR___TabDocumentView__readerWebView;
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);
  objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x5012000000;
  v53 = __Block_byref_object_copy__12;
  v54 = __Block_byref_object_dispose__12;
  v55 = "";
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v8, "bounds");
  *(_QWORD *)&v56 = v9;
  *((_QWORD *)&v56 + 1) = v10;
  *(_QWORD *)&v57 = v11;
  *((_QWORD *)&v57 + 1) = v12;
  v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", v51[6], v51[7], v51[8], v51[9]);
  objc_msgSend(v14, "setClipsToBounds:", 1);
  objc_msgSend(v14, "addSubview:", v8);
  -[UIView addSubview:](*p_readerTransitionContainerView, "addSubview:", v14);
  v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v14, "bounds");
  v16 = (void *)objc_msgSend(v15, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = 0.0;
  if (!self->_showingReader)
    v18 = 0.3;
  objc_msgSend(v16, "setAlpha:", v18, v35);
  if (self->_showingReader)
    objc_msgSend(v14, "addSubview:", v16);
  else
    -[UIView insertSubview:belowSubview:](*p_readerTransitionContainerView, "insertSubview:belowSubview:", v16, v14);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v20 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke;
  v47[3] = &unk_1E9CF3358;
  v21 = v16;
  v48 = v21;
  v49 = self;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0, v47, 0, 0.3, 0.0);
  v22 = (void *)MEMORY[0x1E0DC3F10];
  showingReader = self->_showingReader;
  v58 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v58.minimum;
  maximum = v58.maximum;
  preferred = v58.preferred;
  if (showingReader)
    v27 = 0.15;
  else
    v27 = 0.0;
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_2;
  v42[3] = &unk_1E9CF9B38;
  v28 = v8;
  v46 = &v50;
  v43 = v28;
  v44 = self;
  v29 = v14;
  v45 = v29;
  v38[0] = v20;
  v38[1] = 3221225472;
  v38[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_3;
  v38[3] = &unk_1E9CF9B60;
  v30 = v36;
  v39 = v30;
  v40 = self;
  v31 = v37;
  v41 = v31;
  *(float *)&v32 = minimum;
  *(float *)&v33 = maximum;
  *(float *)&v34 = preferred;
  objc_msgSend(v22, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 0, v42, v38, v27, 0.0, v32, v33, v34);

  _Block_object_dispose(&v50, 8);
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v3 = 0.3;
  if (!*(_BYTE *)(*(_QWORD *)(v2 + 8) + 432))
    v3 = 0.0;
  return objc_msgSend(v1, "setAlpha:", v3);
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  uint64_t v11;
  double v12;
  double v13;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(double *)(v11 + 56);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 432))
  {
    *(double *)(v11 + 56) = Height + v12;
    v13 = v5 - Height;
  }
  else
  {
    *(double *)(v11 + 56) = v12 - Height;
    v13 = v5 + Height;
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 72));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, v13, v7, v9);
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 424);
  if (v3 == *(void **)(a1 + 32))
  {
    *(_QWORD *)(v2 + 424) = 0;

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)scrollDistance
{
  int *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_showingReader)
    v2 = &OBJC_IVAR___TabDocumentView__readerWebView;
  else
    v2 = &OBJC_IVAR___TabDocumentView__webView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "adjustedContentInset");
  v7 = v5 + v6;

  return v7;
}

- (void)applyGeometryToWebView:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[TabDocumentView currentGeometry](self, "currentGeometry");
  -[TabDocumentView applyGeometry:toWebView:](self, "applyGeometry:toWebView:", &v5, v4);

}

- (void)beginInteractiveGeometryChanges
{
  int64_t interactiveGeometryUpdateCount;
  int *v4;

  interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
  if (!interactiveGeometryUpdateCount)
  {
    if (self->_showingReader)
      v4 = &OBJC_IVAR___TabDocumentView__readerWebView;
    else
      v4 = &OBJC_IVAR___TabDocumentView__webView;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "_beginInteractiveObscuredInsetsChange");
    interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
  }
  self->_interactiveGeometryUpdateCount = interactiveGeometryUpdateCount + 1;
}

- (void)endInteractiveGeometryChanges
{
  int64_t v2;
  int *v3;

  v2 = self->_interactiveGeometryUpdateCount - 1;
  self->_interactiveGeometryUpdateCount = v2;
  if (!v2)
  {
    if (self->_showingReader)
      v3 = &OBJC_IVAR___TabDocumentView__readerWebView;
    else
      v3 = &OBJC_IVAR___TabDocumentView__webView;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "_endInteractiveObscuredInsetsChange");
  }
}

- (BOOL)isAnimatingInteractiveGeometryChanges
{
  return self->_interactiveGeometryUpdateCount != 0;
}

- (WKWebView)readerWebView
{
  return self->_readerWebView;
}

- (TabDocumentViewGeometryProviding)geometryProvider
{
  return (TabDocumentViewGeometryProviding *)objc_loadWeakRetained((id *)&self->_geometryProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometryProvider);
  objc_storeStrong((id *)&self->_readerWebView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_readerTransitionContainerView, 0);
}

@end
