@implementation WKSafeBrowsingTextView

- (WKSafeBrowsingTextView)initWithAttributedString:(id)a3 forWarning:(id)a4
{
  WKSafeBrowsingTextView *v6;
  WKSafeBrowsingTextView *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)WKSafeBrowsingTextView;
  v6 = -[WKSafeBrowsingTextView init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak(&v6->_warning.m_weakReference, a4);
    -[WKSafeBrowsingTextView setDelegate:](v7, "setDelegate:", a4);
    v8 = colorForItem(4, a4);
    v9 = (void *)objc_msgSend(a3, "mutableCopy");
    v10 = *MEMORY[0x1E0CEA0A0];
    v18 = *MEMORY[0x1E0CEA0A0];
    v19[0] = v8;
    objc_msgSend(v9, "addAttributes:range:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1), 0, objc_msgSend(v9, "length"));
    v11 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
    v12 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    if (objc_msgSend((id)objc_msgSend(a4, "traitCollection"), "horizontalSizeClass") == 1)
      v13 = v11;
    else
      v13 = v12;
    -[WKSafeBrowsingTextView setBackgroundColor:](v7, "setBackgroundColor:", v13);
    v16 = v10;
    v17 = v8;
    -[WKSafeBrowsingTextView setLinkTextAttributes:](v7, "setLinkTextAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    objc_msgSend((id)-[WKSafeBrowsingTextView textStorage](v7, "textStorage"), "appendAttributedString:", v9);
    -[WKSafeBrowsingTextView setEditable:](v7, "setEditable:", 0);
    -[WKSafeBrowsingTextView setScrollEnabled:](v7, "setScrollEnabled:", 0);
    if (v9)
      CFRelease(v9);
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(objc_loadWeak(&self->_warning.m_weakReference), "frame");
  if (v3 >= 675.0)
    v4 = 635.0;
  else
    v4 = v3 + -40.0;
  -[WKSafeBrowsingTextView sizeThatFits:](self, "sizeThatFits:", v4, 1.79769313e308);
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_warning.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 348) = 0;
  return self;
}

@end
