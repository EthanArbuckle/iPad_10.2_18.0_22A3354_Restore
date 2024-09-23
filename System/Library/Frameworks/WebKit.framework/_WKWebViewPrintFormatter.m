@implementation _WKWebViewPrintFormatter

- (BOOL)requiresMainThread
{
  return objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_printFormatterRequiresMainThread");
}

- (_WKFrameHandle)frameToPrint
{
  return (_WKFrameHandle *)self->_frameToPrint.m_ptr;
}

- (void)setFrameToPrint:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_frameToPrint.m_ptr;
  self->_frameToPrint.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (BOOL)_shouldDrawUsingBitmap
{
  BOOL result;

  result = !-[_WKWebViewPrintFormatter snapshotFirstPage](self, "snapshotFirstPage")
        && (objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"),
            (objc_opt_respondsToSelector() & 1) != 0)
        && -[UIPrintPageRenderer requestedRenderingQuality](-[UIPrintFormatter printPageRenderer](self, "printPageRenderer"), "requestedRenderingQuality") != 0;
  return result;
}

- (CGPDFDocument)_printedDocument
{
  CGPDFDocument *m_ptr;
  Lock *p_printLock;
  int v6;

  if (-[_WKWebViewPrintFormatter requiresMainThread](self, "requiresMainThread"))
    return (CGPDFDocument *)self->_printedDocument.m_ptr;
  p_printLock = &self->_printLock;
  if (__ldaxr(&self->_printLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_6:
    MEMORY[0x19AEABB3C](&self->_printLock);
    goto LABEL_7;
  }
  if (__stxr(1u, &p_printLock->m_byte.value.__a_.__a_value))
    goto LABEL_6;
LABEL_7:
  m_ptr = (CGPDFDocument *)self->_printedDocument.m_ptr;
  v6 = __ldxr(&p_printLock->m_byte.value.__a_.__a_value);
  if (v6 == 1)
  {
    if (!__stlxr(0, &p_printLock->m_byte.value.__a_.__a_value))
      return m_ptr;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
  return m_ptr;
}

- (void)_setPrintedDocument:(CGPDFDocument *)a3
{
  void *v5;
  Lock *p_printLock;
  void *m_ptr;
  int v9;

  if (!-[_WKWebViewPrintFormatter requiresMainThread](self, "requiresMainThread"))
  {
    p_printLock = &self->_printLock;
    if (__ldaxr(&self->_printLock.m_byte.value.__a_.__a_value))
    {
      __clrex();
    }
    else if (!__stxr(1u, &p_printLock->m_byte.value.__a_.__a_value))
    {
      goto LABEL_10;
    }
    MEMORY[0x19AEABB3C](&self->_printLock);
LABEL_10:
    if (a3)
      CFRetain(a3);
    m_ptr = self->_printedDocument.m_ptr;
    self->_printedDocument.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    WTF::Condition::notifyOne((WTF::Condition *)&self->_printCompletionCondition);
    v9 = __ldxr(&p_printLock->m_byte.value.__a_.__a_value);
    if (v9 == 1)
    {
      if (!__stlxr(0, &p_printLock->m_byte.value.__a_.__a_value))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)&self->_printLock);
    return;
  }
  if (a3)
    CFRetain(a3);
  v5 = self->_printedDocument.m_ptr;
  self->_printedDocument.m_ptr = a3;
  if (v5)
    CFRelease(v5);
}

- (CGImage)_printPreviewImage
{
  CGImage *m_ptr;
  Lock *p_printLock;
  int v6;

  if (-[_WKWebViewPrintFormatter requiresMainThread](self, "requiresMainThread"))
    return (CGImage *)self->_printPreviewImage.m_ptr;
  p_printLock = &self->_printLock;
  if (__ldaxr(&self->_printLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_6:
    MEMORY[0x19AEABB3C](&self->_printLock);
    goto LABEL_7;
  }
  if (__stxr(1u, &p_printLock->m_byte.value.__a_.__a_value))
    goto LABEL_6;
LABEL_7:
  m_ptr = (CGImage *)self->_printPreviewImage.m_ptr;
  v6 = __ldxr(&p_printLock->m_byte.value.__a_.__a_value);
  if (v6 == 1)
  {
    if (!__stlxr(0, &p_printLock->m_byte.value.__a_.__a_value))
      return m_ptr;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
  return m_ptr;
}

- (void)_setPrintPreviewImage:(CGImage *)a3
{
  void *v5;
  Lock *p_printLock;
  void *m_ptr;
  int v9;

  if (!-[_WKWebViewPrintFormatter requiresMainThread](self, "requiresMainThread"))
  {
    p_printLock = &self->_printLock;
    if (__ldaxr(&self->_printLock.m_byte.value.__a_.__a_value))
    {
      __clrex();
    }
    else if (!__stxr(1u, &p_printLock->m_byte.value.__a_.__a_value))
    {
      goto LABEL_10;
    }
    MEMORY[0x19AEABB3C](&self->_printLock);
LABEL_10:
    if (a3)
      CFRetain(a3);
    m_ptr = self->_printPreviewImage.m_ptr;
    self->_printPreviewImage.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    WTF::Condition::notifyOne((WTF::Condition *)&self->_printCompletionCondition);
    v9 = __ldxr(&p_printLock->m_byte.value.__a_.__a_value);
    if (v9 == 1)
    {
      if (!__stlxr(0, &p_printLock->m_byte.value.__a_.__a_value))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)&self->_printLock);
    return;
  }
  if (a3)
    CFRetain(a3);
  v5 = self->_printPreviewImage.m_ptr;
  self->_printPreviewImage.m_ptr = a3;
  if (v5)
    CFRelease(v5);
}

- (void)_waitForPrintedDocumentOrImage
{
  Lock *p_printLock;
  int v5;
  uint64_t v6;
  int v7;

  p_printLock = &self->_printLock;
  if (__ldaxr(&self->_printLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_printLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEABB3C](&self->_printLock, a2);
LABEL_5:
  v6 = 0x7FF0000000000000;
  v7 = 0;
  WTF::Condition::waitUntilUnchecked<WTF::Lock>((uint64_t)&self->_printCompletionCondition, &p_printLock->m_byte.value.__a_.__a_value, (WTF::TimeWithDynamicClockType *)&v6);
  v5 = __ldxr(&p_printLock->m_byte.value.__a_.__a_value);
  if (v5 != 1)
  {
    __clrex();
    goto LABEL_9;
  }
  if (__stlxr(0, &p_printLock->m_byte.value.__a_.__a_value))
LABEL_9:
    WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
}

- (void)_setSnapshotPaperRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL suppressPageCountRecalc;
  UIPrintPageRenderer *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  suppressPageCountRecalc = self->_suppressPageCountRecalc;
  self->_suppressPageCountRecalc = 1;
  v9 = -[UIPrintFormatter printPageRenderer](self, "printPageRenderer");
  -[UIPrintPageRenderer setPaperRect:](v9, "setPaperRect:", x, y, width, height);
  -[UIPrintPageRenderer setPrintableRect:](v9, "setPrintableRect:", x, y, width, height);
  self->_suppressPageCountRecalc = suppressPageCountRecalc;
}

- (void)_invalidatePrintRenderingState
{
  -[_WKWebViewPrintFormatter _setPrintPreviewImage:](self, "_setPrintPreviewImage:", 0);
  -[_WKWebViewPrintFormatter _setPrintedDocument:](self, "_setPrintedDocument:", 0);
}

- (int64_t)_recalcPageCount
{
  unint64_t v3;
  NSObject *v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_WKWebViewPrintFormatter _invalidatePrintRenderingState](self, "_invalidatePrintRenderingState");
  v3 = objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_pageCountForPrintFormatter:", self);
  v4 = qword_1ECE715C8;
  if (os_log_type_enabled((os_log_t)qword_1ECE715C8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Recalculated page count. Page count = %zu", (uint8_t *)&v6, 0xCu);
  }
  if (v3 >= 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v3;
}

- (void)_setNeedsRecalc
{
  objc_super v2;

  if (!self->_suppressPageCountRecalc)
  {
    v2.receiver = self;
    v2.super_class = (Class)_WKWebViewPrintFormatter;
    -[UIPrintFormatter _setNeedsRecalc](&v2, sel__setNeedsRecalc);
  }
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (-[_WKWebViewPrintFormatter snapshotFirstPage](self, "snapshotFirstPage"))
    -[UIPrintPageRenderer paperRect](-[UIPrintFormatter printPageRenderer](self, "printPageRenderer"), "paperRect");
  else
    -[UIPrintFormatter _pageContentRect:](self, "_pageContentRect:", -[UIPrintFormatter startPage](self, "startPage") == a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_WKWebViewPrintFormatter _shouldDrawUsingBitmap](self, "_shouldDrawUsingBitmap"))
    -[_WKWebViewPrintFormatter _drawInRectUsingBitmap:forPageAtIndex:](self, "_drawInRectUsingBitmap:forPageAtIndex:", a4, x, y, width, height);
  else
    -[_WKWebViewPrintFormatter _drawInRectUsingPDF:forPageAtIndex:](self, "_drawInRectUsingPDF:forPageAtIndex:", a4, x, y, width, height);
}

- (void)_drawInRectUsingBitmap:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGImage *v10;
  CGContext *CurrentContext;
  CGImage *m_ptr;
  size_t v13;
  size_t v14;
  unint64_t v15;
  CGFloat v16;
  CGImage *v17;
  CGFloat MinX;
  CGFloat MaxY;
  double v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[_WKWebViewPrintFormatter _printPreviewImage](self, "_printPreviewImage");
  if (v10
    || (objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_requestImageForPrintFormatter:", self), (v10 = -[_WKWebViewPrintFormatter _printPreviewImage](self, "_printPreviewImage")) != 0))
  {
    CFRetain(v10);
    if (-[UIPrintFormatter pageCount](self, "pageCount"))
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      m_ptr = (CGImage *)self->_printPreviewImage.m_ptr;
      v13 = CGImageGetWidth(m_ptr);
      v14 = CGImageGetHeight(m_ptr);
      v15 = -[UIPrintFormatter pageCount](self, "pageCount");
      if (v13 && v15 <= v14)
      {
        v16 = (double)(v14 / v15);
        v22.origin.y = (double)a4 * v16;
        v22.origin.x = 0.0;
        v22.size.width = (double)v13;
        v22.size.height = v16;
        v17 = CGImageCreateWithImageInRect(m_ptr, v22);
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        MinX = CGRectGetMinX(v23);
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        MaxY = CGRectGetMaxY(v24);
        CGContextTranslateCTM(CurrentContext, MinX, MaxY);
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v20 = CGRectGetWidth(v25);
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v21 = CGRectGetHeight(v26);
        CGContextScaleCTM(CurrentContext, v20 / (double)v13, v21 / v16);
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.width = (double)v13;
        v27.size.height = v16;
        CGContextDrawImage(CurrentContext, v27, v17);
        CGContextRestoreGState(CurrentContext);
        if (v17)
          CFRelease(v17);
      }
      else
      {
        CGContextRestoreGState(CurrentContext);
      }
    }
    CFRelease(v10);
  }
}

- (void)_drawInRectUsingPDF:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPDFDocument *v10;
  int64_t v11;
  CGPDFPage *Page;
  CGContext *CurrentContext;
  CGFloat MinX;
  CGFloat MaxY;
  CGFloat v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect BoxRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[_WKWebViewPrintFormatter _printedDocument](self, "_printedDocument");
  if (v10
    || (objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_requestDocumentForPrintFormatter:", self), (v10 = -[_WKWebViewPrintFormatter _printedDocument](self, "_printedDocument")) != 0))
  {
    CFRetain(v10);
    v11 = a4 - -[UIPrintFormatter startPage](self, "startPage");
    if (v11 >= 0)
    {
      Page = CGPDFDocumentGetPage(v10, v11 + 1);
      if (Page)
      {
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        v18.origin.x = x;
        v18.origin.y = y;
        v18.size.width = width;
        v18.size.height = height;
        MinX = CGRectGetMinX(v18);
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        MaxY = CGRectGetMaxY(v19);
        CGContextTranslateCTM(CurrentContext, MinX, MaxY);
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        v20.origin.x = x;
        v20.origin.y = y;
        v20.size.width = width;
        v20.size.height = height;
        v16 = CGRectGetWidth(v20);
        v21.origin.x = x;
        v21.origin.y = y;
        v21.size.width = width;
        v21.size.height = height;
        v22.size.height = CGRectGetHeight(v21);
        v22.origin.x = 0.0;
        v22.origin.y = 0.0;
        v22.size.width = v16;
        CGPDFPageGetDrawingTransform(&v17, Page, kCGPDFCropBox, v22, 0, 1);
        CGContextConcatCTM(CurrentContext, &v17);
        BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        CGContextClipToRect(CurrentContext, BoxRect);
        CGContextDrawPDFPage(CurrentContext, Page);
        CGContextRestoreGState(CurrentContext);
      }
    }
    CFRelease(v10);
  }
}

- (BOOL)snapshotFirstPage
{
  return self->_snapshotFirstPage;
}

- (void)setSnapshotFirstPage:(BOOL)a3
{
  self->_snapshotFirstPage = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_printPreviewImage.m_ptr;
  self->_printPreviewImage.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_printedDocument.m_ptr;
  self->_printedDocument.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_frameToPrint.m_ptr;
  self->_frameToPrint.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_BYTE *)self + 137) = 0;
  *((_BYTE *)self + 138) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
