@implementation WKPDFView

- (void)dealloc
{
  void *m_ptr;
  void *v4;
  void *v5;
  CStringBuffer *v6;
  size_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  m_ptr = self->_shareSheet.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "dismissIfNeededWithReason:", 2);
    v4 = self->_shareSheet.m_ptr;
    self->_shareSheet.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
  objc_msgSend(self->_actionSheetAssistant.m_ptr, "cleanupSheet");
  objc_msgSend((id)objc_msgSend(self->_hostViewController.m_ptr, "view"), "removeFromSuperview");
  objc_msgSend(self->_pageNumberIndicator.m_ptr, "removeFromSuperview");
  objc_msgSend(self->_keyboardScrollingAnimator.m_ptr, "invalidate");
  v5 = (void *)WTF::CString::mutableData((WTF::CString *)&self->_passwordForPrinting);
  v6 = self->_passwordForPrinting.m_buffer.m_ptr;
  if (v6)
    v7 = *((_QWORD *)v6 + 1);
  else
    v7 = 0;
  bzero(v5, v7);
  v8 = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_searchString.m_ptr;
  self->_searchString.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10.receiver = self;
  v10.super_class = (Class)WKPDFView;
  -[WKPDFView dealloc](&v10, sel_dealloc);
}

- (BOOL)web_handleKeyEvent:(id)a3
{
  WKWebEvent *v4;
  char v5;

  v4 = -[WKWebEvent initWithEvent:]([WKWebEvent alloc], "initWithEvent:", a3);
  v5 = objc_msgSend(self->_keyboardScrollingAnimator.m_ptr, "beginWithEvent:", v4);
  if ((v5 & 1) == 0)
    objc_msgSend(self->_keyboardScrollingAnimator.m_ptr, "handleKeyEvent:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return objc_msgSend(self->_hostViewController.m_ptr, "gestureRecognizerShouldBegin:", a3);
}

- (id)_contentView
{
  if (*((_QWORD *)self + 66))
    return (id)objc_msgSend(*((id *)self + 66), "view");
  return self;
}

- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5
{
  WKPDFView *v6;
  WKKeyboardScrollViewAnimator *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKPDFView;
  v6 = -[WKApplicationStateTrackingView initWithFrame:webView:](&v10, sel_initWithFrame_webView_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    v7 = -[WKKeyboardScrollViewAnimator initWithScrollView:]([WKKeyboardScrollViewAnimator alloc], "initWithScrollView:", objc_msgSend(a4, "_scrollViewInternal"));
    m_ptr = v6->_keyboardScrollingAnimator.m_ptr;
    v6->_keyboardScrollingAnimator.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_storeWeak(&v6->_webView.m_weakReference, a4);
    -[WKPDFView updateBackgroundColor](v6, "updateBackgroundColor");
  }
  return v6;
}

- (void)updateBackgroundColor
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CD0DC0], "backgroundColor");
  -[WKPDFView setBackgroundColor:](self, "setBackgroundColor:", v3);
  objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_wkScrollView"), "_setBackgroundColorInternal:", v3);
}

- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4
{
  void *v6;
  void *m_ptr;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = v6;
  if (m_ptr)
    CFRelease(m_ptr);
  v8 = (void *)objc_msgSend(a4, "copy");
  v9 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = v8;
  if (v9)
    CFRelease(v9);
  objc_msgSend(MEMORY[0x1E0CD0DC0], "setUseIOSurfaceForTiles:", 0);
  v10 = (void *)MEMORY[0x1E0CD0DC0];
  v11 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __58__WKPDFView_web_setContentProviderData_suggestedFilename___block_invoke;
  v12[3] = &__block_descriptor_48_e8_32c71_ZTSKZ58__WKPDFView_web_setContentProviderData_suggestedFilename__E3__6_e31_v16__0__PDFHostViewController_8l;
  objc_initWeak(&v11, self);
  v12[4] = self;
  v13 = 0;
  objc_copyWeak(&v13, &v11);
  objc_msgSend(v10, "createHostView:forExtensionIdentifier:", v12, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
}

id __58__WKPDFView_web_setContentProviderData_suggestedFilename___block_invoke(uint64_t a1, void *a2)
{
  id result;
  void *v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  WKActionSheetAssistant *v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  const void *v16;

  result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 1224));
    if (a2)
    {
      v5 = result;
      if (result)
      {
        v6 = *(_QWORD *)(a1 + 32);
        CFRetain(a2);
        v7 = *(const void **)(v6 + 528);
        *(_QWORD *)(v6 + 528) = a2;
        if (v7)
          CFRelease(v7);
        v8 = (void *)objc_msgSend(a2, "view");
        objc_msgSend(v5, "bounds");
        objc_msgSend(v8, "setFrame:");
        v9 = (void *)objc_msgSend(v5, "scrollView");
        objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
        objc_msgSend(v9, "addSubview:", v8);
        v10 = -[WKActionSheetAssistant initWithView:]([WKActionSheetAssistant alloc], "initWithView:", v8);
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(const void **)(v11 + 440);
        *(_QWORD *)(v11 + 440) = v10;
        if (v12)
        {
          CFRelease(v12);
          v10 = *(WKActionSheetAssistant **)(*(_QWORD *)(a1 + 32) + 440);
        }
        -[WKActionSheetAssistant setDelegate:](v10, "setDelegate:");
        v13 = (const void *)objc_msgSend(a2, "pageNumberIndicator");
        v14 = v13;
        v15 = *(_QWORD *)(a1 + 32);
        if (v13)
          CFRetain(v13);
        v16 = *(const void **)(v15 + 552);
        *(_QWORD *)(v15 + 552) = v14;
        if (v16)
          CFRelease(v16);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
        objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
        return (id)objc_msgSend(a2, "setDocumentData:withScrollView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), v9);
      }
    }
  }
  return result;
}

- (CGPoint)_offsetForPageNumberIndicator
{
  id Weak;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    v4 = Weak;
    objc_msgSend(Weak, "_computedUnobscuredSafeAreaInset");
    objc_msgSend(v4, "_computedObscuredInset");
    UIEdgeInsetsAdd();
    v6 = v5;
    v8 = v7;
    v9 = v6 + self->_overlaidAccessoryViewsInset.height;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_movePageNumberIndicatorToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat v5;
  CGFloat v6;
  _QWORD v7[5];
  CGPoint v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WKPDFView__movePageNumberIndicatorToPoint_animated___block_invoke;
  v7[3] = &unk_1E34CE088;
  v8 = a3;
  v7[4] = self;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 0.3);
  }
  else
  {
    v5 = a3.x + 20.0;
    v6 = a3.y + 20.0;
    objc_msgSend(self->_pageNumberIndicator.m_ptr, "frame");
    objc_msgSend(self->_pageNumberIndicator.m_ptr, "setFrame:", v5, v6);
  }
}

uint64_t __54__WKPDFView__movePageNumberIndicatorToPoint_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 40) + 20.0;
  v3 = *(double *)(a1 + 48) + 20.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "frame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setFrame:", v2, v3);
}

- (void)_updateLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend(self->_hostViewController.m_ptr, "updatePDFViewLayout");
  -[WKPDFView _offsetForPageNumberIndicator](self, "_offsetForPageNumberIndicator");
  -[WKPDFView _movePageNumberIndicatorToPoint:animated:](self, "_movePageNumberIndicatorToPoint:animated:", v3);
}

- (void)web_setMinimumSize:(CGSize)a3
{
  -[WKPDFView frame](self, "frame");
  -[WKPDFView setFrame:](self, "setFrame:");
  -[WKPDFView _updateLayoutAnimated:](self, "_updateLayoutAnimated:", 0);
}

- (void)web_setOverlaidAccessoryViewsInset:(CGSize)a3
{
  self->_overlaidAccessoryViewsInset = a3;
  -[WKPDFView _updateLayoutAnimated:](self, "_updateLayoutAnimated:", 1);
}

- (void)web_computedContentInsetDidChange
{
  -[WKPDFView _updateLayoutAnimated:](self, "_updateLayoutAnimated:", 0);
}

- (void)web_setFixedOverlayView:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_fixedOverlayView.m_ptr;
  self->_fixedOverlayView.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)_scrollToURLFragment:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "hasPrefix:", CFSTR("page")))
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "integerValue");
    v6 = v5 - 1;
    if (v5 < 1)
      return;
  }
  else
  {
    v6 = 0;
  }
  if (v6 < objc_msgSend(self->_hostViewController.m_ptr, "pageCount")
    && v6 != objc_msgSend(self->_hostViewController.m_ptr, "currentPageIndex"))
  {
    objc_msgSend(self->_hostViewController.m_ptr, "goToPageIndex:", v6);
  }
}

- (void)web_didSameDocumentNavigation:(unsigned int)a3
{
  if (a3 == 3)
    -[WKPDFView _scrollToURLFragment:](self, "_scrollToURLFragment:", objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "URL"), "fragment"));
}

- (void)_resetFind
{
  void *v3;
  void *m_ptr;

  if (self->_findCompletion.m_block)
    objc_msgSend(self->_hostViewController.m_ptr, "cancelFindString");
  v3 = _Block_copy(0);
  _Block_release(self->_findCompletion.m_block);
  self->_findCompletion.m_block = v3;
  _Block_release(0);
  m_ptr = self->_findString.m_ptr;
  self->_findString.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_findStringCount = 0;
  self->_findStringMaxCount = 0;
  if (self->_focusedSearchResultIndex.__engaged_)
    self->_focusedSearchResultIndex.__engaged_ = 0;
  self->_focusedSearchResultPendingOffset = 0;
}

- (void)_findString:(id)a3 withOptions:(unint64_t)a4 maxCount:(unint64_t)a5 completion:(id)a6
{
  void *v11;
  void *v12;
  void *m_ptr;

  -[WKPDFView _resetFind](self, "_resetFind");
  v11 = _Block_copy(a6);
  _Block_release(self->_findCompletion.m_block);
  self->_findCompletion.m_block = v11;
  _Block_release(0);
  v12 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_findString.m_ptr;
  self->_findString.m_ptr = v12;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v12 = self->_findString.m_ptr;
  }
  self->_findStringMaxCount = a5;
  objc_msgSend(self->_hostViewController.m_ptr, "findString:withOptions:", v12, a4 & 1 | (4 * ((a4 >> 3) & 1)));
}

- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__WKPDFView_web_countStringMatches_options_maxCount___block_invoke;
  v5[3] = &unk_1E34BAF80;
  v5[4] = self;
  -[WKPDFView _findString:withOptions:maxCount:completion:](self, "_findString:withOptions:maxCount:completion:", a3, a4, a5, v5);
}

_DWORD *__53__WKPDFView_web_countStringMatches_options_maxCount___block_invoke(uint64_t a1)
{
  _DWORD *result;
  uint64_t v3;
  uint64_t v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  uint64_t v7;

  result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 1224));
  if (result)
  {
    result = (_DWORD *)objc_msgSend(result, "_page");
    v3 = v7;
    if (v7)
    {
      v4 = *(_QWORD *)(v7 + 112);
      MEMORY[0x19AEABCC8](&v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
      (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **, _QWORD))(*(_QWORD *)v4 + 16))(v4, v3, &v6, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 480));
      result = v6;
      v6 = 0;
      if (result)
      {
        if (*result == 2)
          return (_DWORD *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v5);
        else
          *result -= 2;
      }
    }
  }
  return result;
}

- (BOOL)_computeFocusedSearchResultIndexWithOptions:(unint64_t)a3 didWrapAround:(BOOL *)a4
{
  uint64_t v4;
  BOOL v5;
  unint64_t findStringCount;
  optional<unsigned long> *p_focusedSearchResultIndex;
  _BOOL4 engaged;
  int64_t v9;
  int64_t focusedSearchResultPendingOffset;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;

  if ((a3 & 8) != 0)
    v4 = -1;
  else
    v4 = 1;
  if (self->_findCompletion.m_block)
  {
    v5 = 0;
    self->_focusedSearchResultPendingOffset += v4;
    return v5;
  }
  findStringCount = self->_findStringCount;
  if (!findStringCount)
    return 0;
  p_focusedSearchResultIndex = &self->_focusedSearchResultIndex;
  engaged = self->_focusedSearchResultIndex.__engaged_;
  if (self->_focusedSearchResultIndex.__engaged_)
  {
    v9 = p_focusedSearchResultIndex->var0.__val_ + v4;
    if (v9 < 0)
      goto LABEL_12;
LABEL_11:
    if (v9 < self->_findStringCount)
      goto LABEL_21;
    goto LABEL_12;
  }
  focusedSearchResultPendingOffset = self->_focusedSearchResultPendingOffset;
  self->_focusedSearchResultPendingOffset = 0;
  v9 = focusedSearchResultPendingOffset + ((findStringCount - 1) & ((uint64_t)(a3 << 60) >> 63));
  if ((v9 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_12:
  if ((a3 & 0x10) == 0)
    return 0;
  if (v9 >= 0)
    v11 = v9;
  else
    v11 = -v9;
  v12 = self->_findStringCount;
  v13 = v11 % v12;
  v14 = v12 - v13;
  if (v9 >= 0)
    v9 = v13;
  else
    v9 = v14;
  *a4 = 1;
  engaged = self->_focusedSearchResultIndex.__engaged_;
LABEL_21:
  if (!engaged)
    self->_focusedSearchResultIndex.__engaged_ = 1;
  p_focusedSearchResultIndex->var0.__val_ = v9;
  return 1;
}

- (void)_focusOnSearchResultWithOptions:(unint64_t)a3
{
  id Weak;
  unint64_t val;
  uint64_t v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  unsigned __int8 v17;
  uint64_t v18;

  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (!Weak)
    return;
  objc_msgSend(Weak, "_page");
  if (!v18)
    return;
  v17 = 0;
  if (!-[WKPDFView _computeFocusedSearchResultIndexWithOptions:didWrapAround:](self, "_computeFocusedSearchResultIndexWithOptions:didWrapAround:", a3, &v17))
  {
    if (self->_findCompletion.m_block)
      return;
    v12 = v18;
    v13 = *(_QWORD *)(v18 + 112);
    MEMORY[0x19AEABCC8](&v14, self->_findString.m_ptr);
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v13 + 32))(v13, v12, &v14);
    v11 = v14;
    v14 = 0;
    if (!v11)
      return;
LABEL_11:
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
    return;
  }
  if (!self->_focusedSearchResultIndex.__engaged_)
  {
    __break(1u);
    return;
  }
  val = self->_focusedSearchResultIndex.var0.__val_;
  objc_msgSend(self->_hostViewController.m_ptr, "focusOnSearchResultAtIndex:", val);
  v7 = v18;
  v8 = *(_QWORD *)(v18 + 112);
  MEMORY[0x19AEABCC8](&v16, self->_findString.m_ptr);
  v14 = 0;
  v15 = 0;
  (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **, WTF::StringImpl **, _QWORD, unint64_t, _QWORD))(*(_QWORD *)v8 + 24))(v8, v7, &v16, &v14, LODWORD(self->_findStringCount), val, v17);
  v10 = v14;
  if (v14)
  {
    v14 = 0;
    LODWORD(v15) = 0;
    WTF::fastFree(v10, v9);
  }
  v11 = v16;
  v16 = 0;
  if (v11)
    goto LABEL_11;
}

- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  _QWORD v9[6];

  if (objc_msgSend(self->_findString.m_ptr, "isEqualToString:"))
  {
    -[WKPDFView _focusOnSearchResultWithOptions:](self, "_focusOnSearchResultWithOptions:", a4);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__WKPDFView_web_findString_options_maxCount___block_invoke;
    v9[3] = &unk_1E34CE0B0;
    v9[4] = self;
    v9[5] = a4;
    -[WKPDFView _findString:withOptions:maxCount:completion:](self, "_findString:withOptions:maxCount:completion:", a3, a4, a5, v9);
  }
}

uint64_t __45__WKPDFView_web_findString_options_maxCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_focusOnSearchResultWithOptions:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)web_requiresCustomSnapshotting
{
  int HasEntitlement;

  if (byte_1ECE72C5A == 1)
  {
    HasEntitlement = byte_1ECE72C59;
  }
  else
  {
    HasEntitlement = WTF::processHasEntitlement();
    byte_1ECE72C59 = HasEntitlement;
    byte_1ECE72C5A = 1;
  }
  return HasEntitlement == 0;
}

- (void)web_scrollViewDidScroll:(id)a3
{
  objc_msgSend(self->_hostViewController.m_ptr, "updatePDFViewLayout", a3);
}

- (void)web_scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  objc_msgSend(self->_hostViewController.m_ptr, "updatePDFViewLayout", a3, a4);
}

- (void)web_scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  objc_msgSend(self->_hostViewController.m_ptr, "updatePDFViewLayout", a3, a4, a5);
}

- (void)web_scrollViewDidZoom:(id)a3
{
  objc_msgSend(self->_hostViewController.m_ptr, "updatePDFViewLayout", a3);
}

- (void)web_beginAnimatedResizeWithUpdates:(id)a3
{
  objc_msgSend(self->_hostViewController.m_ptr, "beginPDFViewRotation");
  (*((void (**)(id))a3 + 2))(a3);
  objc_msgSend(self->_hostViewController.m_ptr, "endPDFViewRotation");
}

- (void)web_snapshotRectInContentViewCoordinates:(CGRect)a3 snapshotWidth:(double)a4 completionHandler:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *m_ptr;
  uint64_t v17;
  _QWORD v18[5];

  objc_msgSend(-[WKPDFView _contentView](self, "_contentView"), "convertRect:toView:", objc_msgSend(self->_hostViewController.m_ptr, "view"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  m_ptr = self->_hostViewController.m_ptr;
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__WKPDFView_web_snapshotRectInContentViewCoordinates_snapshotWidth_completionHandler___block_invoke;
  v18[3] = &unk_1E34CE0D8;
  v18[4] = a5;
  objc_msgSend(m_ptr, "snapshotViewRect:snapshotWidth:afterScreenUpdates:withResult:", v17, 0, v18, v9, v11, v13, v15);
}

uint64_t __86__WKPDFView_web_snapshotRectInContentViewCoordinates_snapshotWidth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "CGImage"));
}

- (NSData)web_dataRepresentation
{
  return (NSData *)self->_data.m_ptr;
}

- (NSString)web_suggestedFilename
{
  return (NSString *)self->_suggestedFilename.m_ptr;
}

- (void)pdfHostViewController:(id)a3 updatePageCount:(int64_t)a4
{
  -[WKPDFView _scrollToURLFragment:](self, "_scrollToURLFragment:", objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "URL"), "fragment"));
}

- (void)pdfHostViewControllerDocumentDidRequestPassword:(id)a3
{
  objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_didRequestPasswordForDocument");
  self->_isShowingPasswordView = 1;
  -[WKPDFView updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)pdfHostViewController:(id)a3 documentDidUnlockWithPassword:(id)a4
{
  void *v5;
  CStringBuffer *v6;
  WTF *m_ptr;
  int v8;
  void *v9;
  WTF *v10;

  WTF::CString::CString((WTF::CString *)&v10, (const char *)objc_msgSend(a4, "UTF8String", a3));
  v6 = (CStringBuffer *)v10;
  v10 = 0;
  m_ptr = (WTF *)self->_passwordForPrinting.m_buffer.m_ptr;
  self->_passwordForPrinting.m_buffer.m_ptr = v6;
  if (m_ptr)
  {
    v8 = *(_DWORD *)m_ptr - 1;
    if (*(_DWORD *)m_ptr != 1)
    {
LABEL_5:
      *(_DWORD *)m_ptr = v8;
      goto LABEL_6;
    }
    WTF::fastFree(m_ptr, v5);
    m_ptr = v10;
    v10 = 0;
    if (m_ptr)
    {
      v8 = *(_DWORD *)m_ptr - 1;
      if (*(_DWORD *)m_ptr == 1)
      {
        WTF::fastFree(m_ptr, v9);
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_didStopRequestingPasswordForDocument");
  self->_isShowingPasswordView = 0;
  -[WKPDFView updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)pdfHostViewController:(id)a3 findStringUpdate:(unint64_t)a4 done:(BOOL)a5
{
  void *m_ptr;
  uint64_t i;
  void *v9;
  void *v10;
  void (**m_block)(_QWORD);
  void *v12;

  m_ptr = self->_searchAggregator.m_ptr;
  if (m_ptr)
  {
    if (a5)
    {
      if (a4)
      {
        for (i = 0; i != a4; ++i)
          objc_msgSend(self->_searchAggregator.m_ptr, "foundRange:forSearchString:inDocument:", +[WKPDFFoundTextRange foundTextRangeWithIndex:](WKPDFFoundTextRange, "foundTextRangeWithIndex:", i), self->_searchString.m_ptr, 0);
        m_ptr = self->_searchAggregator.m_ptr;
      }
      objc_msgSend(m_ptr, "finishedSearching", a3);
      v9 = self->_searchAggregator.m_ptr;
      self->_searchAggregator.m_ptr = 0;
      if (v9)
        CFRelease(v9);
      v10 = self->_searchString.m_ptr;
      self->_searchString.m_ptr = 0;
      if (v10)
        CFRelease(v10);
    }
  }
  else
  {
    if (self->_findStringMaxCount >= a4 || a5)
    {
      if (!a5)
        return;
    }
    else
    {
      objc_msgSend(a3, "cancelFindStringWithHighlightsCleared:", 0);
    }
    m_block = (void (**)(_QWORD))self->_findCompletion.m_block;
    self->_findCompletion.m_block = 0;
    v12 = _Block_copy(0);
    _Block_release(self->_findCompletion.m_block);
    self->_findCompletion.m_block = v12;
    _Block_release(0);
    if (m_block)
    {
      self->_findStringCount = a4;
      m_block[2](m_block);
    }
    _Block_release(m_block);
  }
}

- (id)_URLWithPageIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#page%ld"), a3 + 1), objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "URL"));
}

- (void)_goToURL:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  id Weak;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  unint64_t v18;
  float v19;
  uint64_t v20;
  float v21;
  unint64_t v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  float v25[2];
  float v26[2];
  WTF::StringImpl *v27;
  CGPoint v28;
  uint64_t v29;
  CGPoint v30;

  y = a4.y;
  x = a4.x;
  v30 = a4;
  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v29)
    {
      v9 = (void *)objc_msgSend(self->_hostViewController.m_ptr, "view");
      v10 = (void *)objc_msgSend(v9, "window");
      objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
      objc_msgSend(v10, "convertPoint:toWindow:", 0);
      v28.x = v11;
      v28.y = v12;
      v13 = v29;
      MEMORY[0x19AEABCC8](&v27, objc_msgSend(a3, "absoluteString"));
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v26, &v30);
      v14 = roundf(v26[0]);
      v15 = 0x80000000;
      if (v14 > -2147500000.0)
        v15 = (int)v14;
      if (v14 < 2147500000.0)
        v16 = v15;
      else
        v16 = 0x7FFFFFFFLL;
      v17 = roundf(v26[1]);
      if (v17 >= 2147500000.0)
      {
        v18 = 0x7FFFFFFF00000000;
      }
      else if (v17 <= -2147500000.0)
      {
        v18 = 0x8000000000000000;
      }
      else
      {
        v18 = (unint64_t)(int)v17 << 32;
      }
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v25, &v28);
      v19 = roundf(v25[0]);
      if (v19 >= 2147500000.0)
      {
        v20 = 0x7FFFFFFFLL;
      }
      else
      {
        v20 = 0x80000000;
        if (v19 > -2147500000.0)
          v20 = (int)v19;
      }
      v21 = roundf(v25[1]);
      if (v21 >= 2147500000.0)
      {
        v22 = 0x7FFFFFFF00000000;
      }
      else if (v21 <= -2147500000.0)
      {
        v22 = 0x8000000000000000;
      }
      else
      {
        v22 = (unint64_t)(int)v21 << 32;
      }
      WebKit::WebPageProxy::navigateToPDFLinkWithSimulatedClick(v13, &v27, v18 | v16, v22 | v20);
      v24 = v27;
      v27 = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2)
          WTF::StringImpl::destroy(v24, v23);
        else
          *(_DWORD *)v24 -= 2;
      }
    }
  }
}

- (void)pdfHostViewController:(id)a3 goToURL:(id)a4
{
  -[WKPDFView _goToURL:atLocation:](self, "_goToURL:atLocation:", a4, 0.0, 0.0);
}

- (void)pdfHostViewController:(id)a3 goToPageIndex:(int64_t)a4 withViewFrustum:(CGRect)a5
{
  -[WKPDFView _goToURL:atLocation:](self, "_goToURL:atLocation:", -[WKPDFView _URLWithPageIndex:](self, "_URLWithPageIndex:", a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), a5.origin.x, a5.origin.y);
}

- (void)_showActionSheetForURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  const FloatRect *v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  unint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  const WTF::URL *v15;
  int canBePresentedByDataDetectors;
  void *m_ptr;
  void *v18;
  WTF::StringImpl *v19[5];
  CGRect v20;
  CGPoint v21;
  _BYTE v22[11];
  int v23;
  char v24;
  int v25;
  __int16 v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD v31[3];
  _BYTE v32[40];
  _BYTE v33[56];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  char v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  __int128 v46;
  __int128 v47;
  char v48;
  __int16 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  char v53;
  char v54;
  char v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  v20 = a5;
  if (objc_loadWeak(&self->_webView.m_weakReference))
  {
    memset(v22, 0, sizeof(v22));
    v23 = 1;
    v24 = 1;
    v25 = 0;
    v26 = 0;
    v27 = 1;
    v31[2] = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31[0] = 0;
    *(_QWORD *)((char *)v31 + 6) = 0;
    WTF::URL::URL((WTF::URL *)v32);
    WTF::URL::URL((WTF::URL *)v33);
    v39 = 0;
    v40 = 0;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    *(_OWORD *)&v33[40] = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0;
    v45 = 1065353216;
    v49 = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0u;
    v50 = 0u;
    v51 = 0u;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v19, &v20);
    *((_QWORD *)&v34 + 1) = WebCore::roundedIntRect((WebCore *)v19, v7);
    *(_QWORD *)&v35 = v8;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v21);
    v9 = roundf(*(float *)v19);
    if (v9 >= 2147500000.0)
    {
      v10 = 0x7FFFFFFFLL;
    }
    else if (v9 <= -2147500000.0)
    {
      v10 = 0x80000000;
    }
    else
    {
      v10 = (int)v9;
    }
    v11 = roundf(*((float *)v19 + 1));
    if (v11 >= 2147500000.0)
    {
      v12 = 0x7FFFFFFF00000000;
    }
    else if (v11 <= -2147500000.0)
    {
      v12 = 0x8000000000000000;
    }
    else
    {
      v12 = (unint64_t)(int)v11 << 32;
    }
    *(_QWORD *)v22 = v12 | v10;
    MEMORY[0x19AEABB18](v19, a3);
    WTF::URL::operator=((uint64_t)v32, (WTF::StringImpl *)v19);
    v14 = v19[0];
    v19[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v13);
      else
        *(_DWORD *)v14 -= 2;
    }
    WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)v22);
    canBePresentedByDataDetectors = WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)&self->_positionInformation.url, v15);
    m_ptr = self->_actionSheetAssistant.m_ptr;
    if (canBePresentedByDataDetectors)
      objc_msgSend(m_ptr, "showDataDetectorsUIForPositionInformation:", v22);
    else
      objc_msgSend(m_ptr, "showLinkSheet");
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v22, v18);
  }
}

- (void)pdfHostViewController:(id)a3 didLongPressURL:(id)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6
{
  -[WKPDFView _showActionSheetForURL:atLocation:withAnnotationRect:](self, "_showActionSheetForURL:atLocation:withAnnotationRect:", a4, a5.x, a5.y, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)pdfHostViewController:(id)a3 didLongPressPageIndex:(int64_t)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6
{
  -[WKPDFView _showActionSheetForURL:atLocation:withAnnotationRect:](self, "_showActionSheetForURL:atLocation:withAnnotationRect:", -[WKPDFView _URLWithPageIndex:](self, "_URLWithPageIndex:", a4), a5.x, a5.y, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)pdfHostViewControllerExtensionProcessDidCrash:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  WTF::RunLoop::main((WTF::RunLoop *)self);
  v6 = 0;
  objc_copyWeak(&v6, &self->_webView.m_weakReference);
  v4 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v4 = off_1E34CE188;
  *(_QWORD *)(v4 + 8) = 0;
  objc_moveWeak((id *)(v4 + 8), &v6);
  v7 = v4;
  WTF::RunLoop::dispatch();
  v5 = v7;
  v7 = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  objc_destroyWeak(&v6);
}

- (optional<WebKit::InteractionInformationAtPosition>)positionInformationForActionSheetAssistant:(optional<WebKit::InteractionInformationAtPosition> *__return_ptr)retstr
{
  uint64_t v1;
  optional<WebKit::InteractionInformationAtPosition> *result;

  result = (optional<WebKit::InteractionInformationAtPosition> *)WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)retstr, (const WebKit::InteractionInformationAtPosition *)(v1 + 576));
  *(&retstr[1].var0.__engaged_ + 144) = 1;
  return result;
}

- (void)actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4
{
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10[0] = *MEMORY[0x1E0CA5CA0];
    if (self->_positionInformation.url.m_string.m_impl.m_ptr)
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E351F1B8;
    v11[0] = v5;
    v10[1] = *MEMORY[0x1E0CA5C90];
    v11[1] = WTF::URL::operator NSURL *();
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = (void *)MEMORY[0x1E0CEA810];
    v8 = objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_effectiveDataOwner:", -[WKPDFView _dataOwnerForCopy](self, "_dataOwnerForCopy"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__WKPDFView_actionSheetAssistant_performAction___block_invoke;
    v9[3] = &unk_1E34BAF80;
    v9[4] = v6;
    objc_msgSend(v7, "_performAsDataOwner:block:", v8, v9);
  }
}

uint64_t __48__WKPDFView_actionSheetAssistant_performAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  v1 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard"), "setItems:", v1);
}

- (void)actionSheetAssistant:(id)a3 openElementAtLocation:(CGPoint)a4
{
  -[WKPDFView _goToURL:atLocation:](self, "_goToURL:atLocation:", WTF::URL::operator NSURL *(), a4.x, a4.y);
}

- (void)actionSheetAssistant:(id)a3 shareElementWithURL:(id)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id Weak;
  id v12;
  WTF::StringImpl *v13;
  CGFloat v14;
  WKShareSheet *v15;
  void *m_ptr;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  _QWORD *v31;
  _BYTE v32[20];
  CGRect v33;
  char v34;
  WTF::StringImpl *v35[2];
  WTF::StringImpl *v36[8];
  char v37;
  _QWORD v38[2];
  char v39;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    v12 = Weak;
    v37 = 0;
    v38[0] = 0;
    v38[1] = 0;
    *(_OWORD *)v35 = 0u;
    memset(v36, 0, 25);
    MEMORY[0x19AEABB18](&v33, a4);
    v34 = 1;
    std::__optional_storage_base<WTF::URL,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::URL,false>>((WTF::StringImpl *)&v36[3], (unsigned __int8 *)&v33);
    if (v34)
    {
      v14 = v33.origin.x;
      v33.origin.x = 0.0;
      if (v14 != 0.0)
      {
        if (**(_DWORD **)&v14 == 2)
          WTF::StringImpl::destroy(*(WTF::StringImpl **)&v14, v13);
        else
          **(_DWORD **)&v14 -= 2;
      }
    }
    v39 = 1;
    objc_msgSend(self->_shareSheet.m_ptr, "dismissIfNeededWithReason:", 0);
    v15 = -[WKShareSheet initWithView:]([WKShareSheet alloc], "initWithView:", v12);
    m_ptr = self->_shareSheet.m_ptr;
    self->_shareSheet.m_ptr = v15;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v15 = (WKShareSheet *)self->_shareSheet.m_ptr;
    }
    -[WKShareSheet setDelegate:](v15, "setDelegate:", self);
    v17 = self->_shareSheet.m_ptr;
    objc_msgSend((id)objc_msgSend(self->_hostViewController.m_ptr, "view"), "convertRect:toView:", v12, x, y, width, height);
    v33.origin.x = v18;
    v33.origin.y = v19;
    v33.size.width = v20;
    v33.size.height = v21;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v32, &v33);
    v32[16] = 1;
    v22 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v22 = off_1E34CE1B0;
    v31 = v22;
    objc_msgSend(v17, "presentWithParameters:inRect:completionHandler:", v35, v32, &v31);
    v24 = v31;
    v31 = 0;
    if (v24)
      (*(void (**)(_QWORD *))(*v24 + 8))(v24);
    WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v38, v23);
    if (v37)
    {
      v26 = v36[3];
      v36[3] = 0;
      if (v26)
      {
        if (*(_DWORD *)v26 == 2)
          WTF::StringImpl::destroy(v26, v25);
        else
          *(_DWORD *)v26 -= 2;
      }
    }
    WTF::Vector<WTF::Ref<WebCore::File,WTF::RawPtrTraits<WebCore::File>,WTF::DefaultRefDerefTraits<WebCore::File>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v36[1], v25);
    v28 = v36[0];
    v36[0] = 0;
    if (v28)
    {
      if (*(_DWORD *)v28 == 2)
        WTF::StringImpl::destroy(v28, v27);
      else
        *(_DWORD *)v28 -= 2;
    }
    v29 = v35[1];
    v35[1] = 0;
    if (v29)
    {
      if (*(_DWORD *)v29 == 2)
        WTF::StringImpl::destroy(v29, v27);
      else
        *(_DWORD *)v29 -= 2;
    }
    v30 = v35[0];
    v35[0] = 0;
    if (v30)
    {
      if (*(_DWORD *)v30 == 2)
        WTF::StringImpl::destroy(v30, v27);
      else
        *(_DWORD *)v30 -= 2;
    }
  }
}

- (void)shareSheetDidDismiss:(id)a3
{
  void *m_ptr;

  objc_msgSend(self->_shareSheet.m_ptr, "setDelegate:", 0);
  m_ptr = self->_shareSheet.m_ptr;
  self->_shareSheet.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  id Weak;
  uint64_t v7;

  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v7)
      LOBYTE(Weak) = (*(uint64_t (**)(_QWORD, id))(**(_QWORD **)(v7 + 104) + 448))(*(_QWORD *)(v7 + 104), a4);
    else
      LOBYTE(Weak) = 0;
  }
  return (char)Weak;
}

- (RetainPtr<NSArray>)actionSheetAssistant:(id)a3 decideActionsForElement:(id)a4 defaultActions:(RetainPtr<NSArray>)a5
{
  _QWORD *v5;
  _QWORD *v8;
  void *Weak;
  uint64_t v10;
  const void *v11;
  CFTypeRef cf;
  uint64_t v13;

  v8 = v5;
  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak && (Weak = (void *)objc_msgSend(Weak, "_page"), v13))
  {
    v10 = *(_QWORD *)(v13 + 104);
    v11 = *(const void **)a5.m_ptr;
    *(_QWORD *)a5.m_ptr = 0;
    cf = v11;
    (*(void (**)(uint64_t, id, CFTypeRef *))(*(_QWORD *)v10 + 456))(v10, a4, &cf);
    Weak = (void *)cf;
    cf = 0;
    if (Weak)
      CFRelease(Weak);
  }
  else
  {
    *v8 = 0;
  }
  return (RetainPtr<NSArray>)Weak;
}

- (id)dataDetectionContextForActionSheetAssistant:(id)a3 positionInformation:(const void *)a4
{
  id Weak;
  id v5;
  void *v6;

  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak && (v5 = Weak, v6 = (void *)objc_msgSend(Weak, "UIDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(v6, "_dataDetectionContextForWebView:", v5);
  else
    return 0;
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (BOOL)supportsTextReplacement
{
  return 0;
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  void *v6;
  char isKindOfClass;
  int64_t result;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;

  v6 = (void *)objc_msgSend(a3, "start");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = 0;
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
    {
      v9 = (void *)objc_msgSend(a4, "start");
      objc_opt_class();
      v10 = objc_opt_isKindOfClass();
      result = 0;
      if ((v10 & 1) != 0)
      {
        if (v9)
        {
          v11 = objc_msgSend(v6, "index");
          if (v11 >= objc_msgSend(v9, "index"))
          {
            v12 = objc_msgSend(v6, "index");
            return v12 > objc_msgSend(v9, "index");
          }
          else
          {
            return -1;
          }
        }
      }
    }
  }
  return result;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  void *m_ptr;
  void *v10;

  objc_msgSend(self->_hostViewController.m_ptr, "cancelFindString");
  if (a5)
    CFRetain(a5);
  m_ptr = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = a5;
  if (m_ptr)
    CFRelease(m_ptr);
  if (a3)
    CFRetain(a3);
  v10 = self->_searchString.m_ptr;
  self->_searchString.m_ptr = a3;
  if (v10)
    CFRelease(v10);
  objc_msgSend(self->_hostViewController.m_ptr, "findString:withOptions:", a3, objc_msgSend(a4, "stringCompareOptions"));
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  char isKindOfClass;

  if (a5 == 2)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(self->_hostViewController.m_ptr, "focusOnSearchResultAtIndex:", objc_msgSend(a3, "index"));
    }
  }
}

- (void)clearAllDecoratedFoundText
{
  void *m_ptr;

  objc_msgSend(self->_hostViewController.m_ptr, "cancelFindString");
  m_ptr = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CStringBuffer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  m_ptr = self->_searchString.m_ptr;
  self->_searchString.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_shareSheet.m_ptr;
  self->_shareSheet.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_keyboardScrollingAnimator.m_ptr;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  objc_destroyWeak(&self->_webView.m_weakReference);
  v8 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v7);
  v10 = self->_passwordForPrinting.m_buffer.m_ptr;
  self->_passwordForPrinting.m_buffer.m_ptr = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 1)
      WTF::fastFree((WTF *)v10, v9);
    else
      --*(_DWORD *)v10;
  }
  v11 = self->_pageNumberIndicator.m_ptr;
  self->_pageNumberIndicator.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->_hostViewController.m_ptr;
  self->_hostViewController.m_ptr = 0;
  if (v12)
    CFRelease(v12);
  v13 = self->_fixedOverlayView.m_ptr;
  self->_fixedOverlayView.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_findString.m_ptr;
  self->_findString.m_ptr = 0;
  if (v14)
    CFRelease(v14);
  _Block_release(self->_findCompletion.m_block);
  v15 = self->_documentForPrinting.m_ptr;
  self->_documentForPrinting.m_ptr = 0;
  if (v15)
    CFRelease(v15);
  v16 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v16)
    CFRelease(v16);
  v17 = self->_actionSheetAssistant.m_ptr;
  self->_actionSheetAssistant.m_ptr = 0;
  if (v17)
    CFRelease(v17);
}

- (id).cxx_construct
{
  InteractionInformationAtPosition *p_positionInformation;

  self->_actionSheetAssistant.m_ptr = 0;
  self->_data.m_ptr = 0;
  self->_documentForPrinting.m_ptr = 0;
  self->_findCompletion.m_block = 0;
  self->_findString.m_ptr = 0;
  self->_fixedOverlayView.m_ptr = 0;
  self->_focusedSearchResultIndex.var0.__null_state_ = 0;
  self->_focusedSearchResultIndex.__engaged_ = 0;
  self->_hostViewController.m_ptr = 0;
  self->_pageNumberIndicator.m_ptr = 0;
  self->_passwordForPrinting.m_buffer.m_ptr = 0;
  p_positionInformation = &self->_positionInformation;
  *(int *)((char *)&self->_positionInformation.request.point.m_y + 3) = 0;
  self->_positionInformation.request.point = 0;
  *(_DWORD *)&self->_positionInformation.request.includeHasDoubleClickHandler = 1;
  self->_positionInformation.canBeValid = 1;
  *(_DWORD *)&self->_positionInformation.nodeAtPositionHasDoubleClickHandler.var0.__null_state_ = 0;
  *(_WORD *)&self->_positionInformation.prefersDraggingOverTextSelection = 0;
  self->_positionInformation.touchCalloutEnabled = 1;
  self->_positionInformation.adjustedPointForNodeRespondingToClickEvents = 0;
  *(_QWORD *)&self->_positionInformation.isLink = 0;
  self->_positionInformation.isContentEditable = 0;
  *(unint64_t *)((char *)&self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier
                      + 6) = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_object.m_identifier = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier = 0;
  WTF::URL::URL((WTF::URL *)&self->_positionInformation.url);
  WTF::URL::URL((WTF::URL *)&p_positionInformation->imageURL);
  p_positionInformation->cursor.var0.__null_state_ = 0;
  p_positionInformation->cursor.__engaged_ = 0;
  p_positionInformation->linkIndicator.selectionRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.textBoundingRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.contentImageWithoutSelectionRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.textRectsInBoundingRectCoordinates = 0u;
  *(_OWORD *)&p_positionInformation->imageMIMEType.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->idAttribute.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->bounds.m_size.m_width = 0u;
  *(_OWORD *)&p_positionInformation->textBefore.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->caretLength = 0u;
  p_positionInformation->lineCaretExtent.m_size.m_height = 0.0;
  p_positionInformation->linkIndicator.contentImageScaleFactor = 1.0;
  p_positionInformation->linkIndicator.options.m_storage = 0;
  *(_OWORD *)&p_positionInformation->linkIndicator.contentImageWithHighlight.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->linkIndicator.contentImage.m_ptr = 0u;
  p_positionInformation->linkIndicator.presentationTransition = 0;
  *((_BYTE *)&p_positionInformation->elementContext.var0.var2 + 8) = 0;
  p_positionInformation[1].isContentEditable = 0;
  LOBYTE(p_positionInformation[1].containerScrollingNodeID.m_value.m_processIdentifier.m_identifier) = 0;
  LOBYTE(p_positionInformation[1].imageURL.m_userEnd) = 0;
  *(_OWORD *)&p_positionInformation[1].imageURL.m_pathEnd = 0u;
  *(_OWORD *)&p_positionInformation->dataDetectorIdentifier.m_impl.m_ptr = 0u;
  p_positionInformation->dataDetectorBounds = 0u;
  self->_suggestedFilename.m_ptr = 0;
  self->_webView.m_weakReference = 0;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  self->_shareSheet.m_ptr = 0;
  self->_searchAggregator.m_ptr = 0;
  self->_searchString.m_ptr = 0;
  return self;
}

- (CGPDFDocument)_ensureDocumentForPrinting
{
  void *m_ptr;
  CGDataProvider *v4;
  CStringBuffer *v5;
  const char *v6;
  void *v7;

  m_ptr = self->_documentForPrinting.m_ptr;
  if (!m_ptr)
  {
    v4 = CGDataProviderCreateWithCFData((CFDataRef)self->_data.m_ptr);
    m_ptr = CGPDFDocumentCreateWithProvider(v4);
    if ((CGPDFDocumentIsUnlocked((CGPDFDocumentRef)m_ptr)
       || ((v5 = self->_passwordForPrinting.m_buffer.m_ptr) != 0 ? (v6 = (char *)v5 + 16) : (v6 = 0),
           CGPDFDocumentUnlockWithPassword((CGPDFDocumentRef)m_ptr, v6)))
      && CGPDFDocumentAllowsPrinting((CGPDFDocumentRef)m_ptr))
    {
      v7 = self->_documentForPrinting.m_ptr;
      self->_documentForPrinting.m_ptr = m_ptr;
      if (v7)
      {
        CFRelease(v7);
        m_ptr = self->_documentForPrinting.m_ptr;
      }
    }
    else if (m_ptr)
    {
      CFRelease(m_ptr);
      m_ptr = 0;
    }
    if (v4)
      CFRelease(v4);
  }
  return (CGPDFDocument *)m_ptr;
}

- (BOOL)_wk_printFormatterRequiresMainThread
{
  return 1;
}

- (unint64_t)_wk_pageCountForPrintFormatter:(id)a3
{
  unint64_t result;
  size_t NumberOfPages;

  result = -[WKPDFView _ensureDocumentForPrinting](self, "_ensureDocumentForPrinting");
  if (result)
  {
    NumberOfPages = CGPDFDocumentGetNumberOfPages((CGPDFDocumentRef)result);
    if (objc_msgSend(a3, "snapshotFirstPage"))
      return NumberOfPages != 0;
    else
      return NumberOfPages;
  }
  return result;
}

- (void)_wk_requestDocumentForPrintFormatter:(id)a3
{
  objc_msgSend(a3, "_setPrintedDocument:", -[WKPDFView _ensureDocumentForPrinting](self, "_ensureDocumentForPrinting"));
}

- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1
{
  *(_QWORD *)a1 = off_1E34CE188;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(id *)a1
{
  void *v2;

  *a1 = off_1E34CE188;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1
{
  id Weak;
  uint64_t v2;

  Weak = objc_loadWeak((id *)(a1 + 8));
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v2)
      WebKit::WebPageProxy::dispatchProcessDidTerminate(v2, 5);
  }
}

@end
