@implementation TabDocumentViewForPageTest

- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry
{
  CGSize *p_fixedWebViewSize;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  CGFloat v12;
  $FBE3A1C208404EC7AA4040899845A87A *result;
  CGFloat MidY;
  CGSize size;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  p_fixedWebViewSize = &self->_fixedWebViewSize;
  if (self->_fixedWebViewSize.width == *MEMORY[0x1E0C9D820]
    && self->_fixedWebViewSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v16.receiver = self;
    v16.super_class = (Class)TabDocumentViewForPageTest;
    return ($FBE3A1C208404EC7AA4040899845A87A *)-[$FBE3A1C208404EC7AA4040899845A87A currentGeometry](&v16, sel_currentGeometry);
  }
  else
  {
    *(_OWORD *)&retstr->var7.bottom = 0u;
    *(_OWORD *)&retstr->var8 = 0u;
    retstr->var6 = 0u;
    *(_OWORD *)&retstr->var7.top = 0u;
    retstr->var4 = 0u;
    retstr->var5 = 0u;
    *(_OWORD *)&retstr->var3.var1.top = 0u;
    *(_OWORD *)&retstr->var3.var1.bottom = 0u;
    *(_OWORD *)&retstr->var3.var0.top = 0u;
    *(_OWORD *)&retstr->var3.var0.bottom = 0u;
    *(_OWORD *)&retstr->var2.top = 0u;
    *(_OWORD *)&retstr->var2.bottom = 0u;
    *(_OWORD *)&retstr->var1.top = 0u;
    *(_OWORD *)&retstr->var1.bottom = 0u;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
    -[TabDocumentViewForPageTest bounds](self, "bounds");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    v10 = p_fixedWebViewSize->width;
    v11 = p_fixedWebViewSize->height;
    v12 = CGRectGetMidX(v17) - v10 * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MidY = CGRectGetMidY(v18);
    retstr->var0.origin.x = v12;
    retstr->var0.origin.y = MidY - v11 * 0.5;
    retstr->var0.size.width = v10;
    retstr->var0.size.height = v11;
    size = retstr->var0.size;
    retstr->var4 = size;
    retstr->var5 = size;
    retstr->var6 = size;
    retstr->var9 = v10;
  }
  return result;
}

- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4
{
  double height;
  double width;
  void (**v7)(id, _QWORD);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  -[TabDocumentView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_fixedWebViewSize.width = width;
    self->_fixedWebViewSize.height = height;
    -[TabDocumentView webView](self, "webView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocumentView applyGeometryToWebView:](self, "applyGeometryToWebView:", v14);

    v15 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      -[TabDocumentView webView](self, "webView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v19 = v18;
      -[TabDocumentView webView](self, "webView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      v22 = v21;
      -[TabDocumentView webView](self, "webView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24;
      -[TabDocumentView webView](self, "webView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v28 = 134218752;
      v29 = v19;
      v30 = 2048;
      v31 = v22;
      v32 = 2048;
      v33 = v25;
      v34 = 2048;
      v35 = v27;
      _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_INFO, "WebView frame for Page Test is (%.0f-%.0f, %.0fx%.0f)", (uint8_t *)&v28, 0x2Au);

    }
  }
  v7[2](v7, 0);

}

@end
